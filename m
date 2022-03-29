Content-Type: multipart/mixed; boundary="===============2021117722264549829=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 337/1039] drivers/usb/storage/uas.c:564 uas_workaround() warn: possible memory leak of 'temp_request'
Date: Tue, 29 Mar 2022 14:53:24 +0800
Message-ID: <202203291444.T1BtW3fe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2021117722264549829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Piyush Mehta <piyush.mehta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: 6e36c8e67532397180bc05d39599d0d16a82269c [337/1039] usb: uas: Add w=
orkaround for DATA IN urb's returned with status -EAGAIN
:::::: branch date: 4 days ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220328 (https://download.01.org/0day-ci/arc=
hive/20220329/202203291444.T1BtW3fe-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/storage/uas.c:564 uas_workaround() warn: possible memory leak o=
f 'temp_request'

vim +/temp_request +564 drivers/usb/storage/uas.c

6e36c8e6753239 Piyush Mehta 2022-01-26  448  =

6e36c8e6753239 Piyush Mehta 2022-01-26  449  /*
6e36c8e6753239 Piyush Mehta 2022-01-26  450   * This function is called onl=
y if the DATA IN stream timer expired, which
6e36c8e6753239 Piyush Mehta 2022-01-26  451   * means xhci host controller =
has failed to process the TRB's present in the
6e36c8e6753239 Piyush Mehta 2022-01-26  452   * stream ring. As a part of r=
ecovery sequence, this function re-submits the
6e36c8e6753239 Piyush Mehta 2022-01-26  453   * previous stopped urb on whi=
ch xhci failed to process data and along with
6e36c8e6753239 Piyush Mehta 2022-01-26  454   * that urb it prepares & subm=
its sense, data and cmnd urb with scsi command
6e36c8e6753239 Piyush Mehta 2022-01-26  455   * set to standard inquiry req=
uest containing the next free stream id tag.
6e36c8e6753239 Piyush Mehta 2022-01-26  456   * Doing so will make the xhci=
 start processing the previous stopped urb
6e36c8e6753239 Piyush Mehta 2022-01-26  457   * along with the urb that has=
 standard inquiry scsi command.
6e36c8e6753239 Piyush Mehta 2022-01-26  458   */
6e36c8e6753239 Piyush Mehta 2022-01-26  459  static int uas_workaround(stru=
ct urb *urb)
6e36c8e6753239 Piyush Mehta 2022-01-26  460  {
6e36c8e6753239 Piyush Mehta 2022-01-26  461  	struct scsi_cmnd *cmnd =3D ur=
b->context;
6e36c8e6753239 Piyush Mehta 2022-01-26  462  	struct scsi_device *sdev =3D =
cmnd->device;
6e36c8e6753239 Piyush Mehta 2022-01-26  463  	struct uas_dev_info *devinfo =
=3D (void *)cmnd->device->hostdata;
6e36c8e6753239 Piyush Mehta 2022-01-26  464  	struct scsi_cmnd *temp_cmnd;
6e36c8e6753239 Piyush Mehta 2022-01-26  465  	struct uas_cmd_info *temp_cmd=
info;
6e36c8e6753239 Piyush Mehta 2022-01-26  466  	struct urb *sense_urb, *data_=
urb, *cmnd_urb;
6e36c8e6753239 Piyush Mehta 2022-01-26  467  	struct request *temp_request;
6e36c8e6753239 Piyush Mehta 2022-01-26  468  	unsigned int idx;
6e36c8e6753239 Piyush Mehta 2022-01-26  469  	int err;
6e36c8e6753239 Piyush Mehta 2022-01-26  470  	char inquiry[16] =3D { 0x12, =
0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x0,
6e36c8e6753239 Piyush Mehta 2022-01-26  471  				0x0, 0x0, 0x0, 0x0, 0x0, 0=
x0, 0x0, 0x0 };
6e36c8e6753239 Piyush Mehta 2022-01-26  472  =

6e36c8e6753239 Piyush Mehta 2022-01-26  473  =

6e36c8e6753239 Piyush Mehta 2022-01-26  474  	/* Find a free uas-tag */
6e36c8e6753239 Piyush Mehta 2022-01-26  475  	for (idx =3D 0; idx < devinfo=
->qdepth; idx++) {
6e36c8e6753239 Piyush Mehta 2022-01-26  476  		if (!devinfo->cmnd[idx])
6e36c8e6753239 Piyush Mehta 2022-01-26  477  			break;
6e36c8e6753239 Piyush Mehta 2022-01-26  478  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  479  =

6e36c8e6753239 Piyush Mehta 2022-01-26  480  	if (idx =3D=3D devinfo->qdept=
h) {
6e36c8e6753239 Piyush Mehta 2022-01-26  481  		shost_printk(KERN_INFO, sdev=
->host,
6e36c8e6753239 Piyush Mehta 2022-01-26  482  			"%s: Failed to find free ta=
g\n", __func__);
6e36c8e6753239 Piyush Mehta 2022-01-26  483  		err =3D -EINVAL;
6e36c8e6753239 Piyush Mehta 2022-01-26  484  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  485  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  486  =

6e36c8e6753239 Piyush Mehta 2022-01-26  487  	/* Create a scsi_cmnd and sen=
d dummy inquiry data on the next
6e36c8e6753239 Piyush Mehta 2022-01-26  488  	 * available tag
6e36c8e6753239 Piyush Mehta 2022-01-26  489  	 */
6e36c8e6753239 Piyush Mehta 2022-01-26  490  	temp_cmnd =3D kzalloc(sizeof(=
struct scsi_cmnd), GFP_ATOMIC);
6e36c8e6753239 Piyush Mehta 2022-01-26  491  	if (!temp_cmnd) {
6e36c8e6753239 Piyush Mehta 2022-01-26  492  		shost_printk(KERN_INFO, sdev=
->host,
6e36c8e6753239 Piyush Mehta 2022-01-26  493  			"%s: Failed to allocate mem=
ory for scsi_cmnd\n",
6e36c8e6753239 Piyush Mehta 2022-01-26  494  			__func__);
6e36c8e6753239 Piyush Mehta 2022-01-26  495  		err =3D -ENOMEM;
6e36c8e6753239 Piyush Mehta 2022-01-26  496  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  497  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  498  =

6e36c8e6753239 Piyush Mehta 2022-01-26  499  	temp_request =3D kzalloc(size=
of(struct request), GFP_ATOMIC);
6e36c8e6753239 Piyush Mehta 2022-01-26  500  	if (!temp_cmnd) {
6e36c8e6753239 Piyush Mehta 2022-01-26  501  		shost_printk(KERN_INFO, sdev=
->host,
6e36c8e6753239 Piyush Mehta 2022-01-26  502  			"%s: Failed to allocate mem=
ory for request\n",
6e36c8e6753239 Piyush Mehta 2022-01-26  503  			__func__);
6e36c8e6753239 Piyush Mehta 2022-01-26  504  		err =3D -ENOMEM;
6e36c8e6753239 Piyush Mehta 2022-01-26  505  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  506  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  507  =

6e36c8e6753239 Piyush Mehta 2022-01-26  508  	temp_cmnd->device =3D cmnd->d=
evice;
6e36c8e6753239 Piyush Mehta 2022-01-26  509  	temp_cmnd->cmnd =3D inquiry;
6e36c8e6753239 Piyush Mehta 2022-01-26  510  	temp_cmnd->cmd_len =3D 16;
6e36c8e6753239 Piyush Mehta 2022-01-26  511  	temp_cmnd->sdb.length =3D 0x1=
0;
6e36c8e6753239 Piyush Mehta 2022-01-26  512  	temp_cmnd->scsi_done =3D dumm=
y_scsi_done;
6e36c8e6753239 Piyush Mehta 2022-01-26  513  	temp_request->tag =3D idx;
6e36c8e6753239 Piyush Mehta 2022-01-26  514  =

6e36c8e6753239 Piyush Mehta 2022-01-26  515  	temp_cmdinfo =3D (struct uas_=
cmd_info *)&temp_cmnd->SCp;
6e36c8e6753239 Piyush Mehta 2022-01-26  516  	memset(temp_cmdinfo, 0, sizeo=
f(struct uas_cmd_info));
6e36c8e6753239 Piyush Mehta 2022-01-26  517  =

6e36c8e6753239 Piyush Mehta 2022-01-26  518  	temp_cmdinfo->uas_tag =3D idx=
 + 1;
6e36c8e6753239 Piyush Mehta 2022-01-26  519  	devinfo->cmnd[idx] =3D temp_c=
mnd;
6e36c8e6753239 Piyush Mehta 2022-01-26  520  =

6e36c8e6753239 Piyush Mehta 2022-01-26  521  	/* Submit previously stopped =
URB first */
6e36c8e6753239 Piyush Mehta 2022-01-26  522  	err =3D usb_submit_urb(urb, G=
FP_ATOMIC);
6e36c8e6753239 Piyush Mehta 2022-01-26  523  	if (err) {
6e36c8e6753239 Piyush Mehta 2022-01-26  524  		shost_printk(KERN_INFO, sdev=
->host,
6e36c8e6753239 Piyush Mehta 2022-01-26  525  			"%s: submit err %d\n", __fu=
nc__, err);
6e36c8e6753239 Piyush Mehta 2022-01-26  526  		kfree(temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  527  		kfree(temp_request);
6e36c8e6753239 Piyush Mehta 2022-01-26  528  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  529  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  530  	usb_anchor_urb(urb, &devinfo-=
>data_urbs);
6e36c8e6753239 Piyush Mehta 2022-01-26  531  =

6e36c8e6753239 Piyush Mehta 2022-01-26  532  	/* Allocate and submit SENSE =
urb for next available tag */
6e36c8e6753239 Piyush Mehta 2022-01-26  533  	sense_urb =3D uas_workaround_=
sense(devinfo, GFP_ATOMIC, temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  534  	if (!sense_urb) {
6e36c8e6753239 Piyush Mehta 2022-01-26  535  		kfree(temp_request);
6e36c8e6753239 Piyush Mehta 2022-01-26  536  		kfree(temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  537  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  538  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  539  =

6e36c8e6753239 Piyush Mehta 2022-01-26  540  	/* Allocate and submit DATA I=
N urb for next available tag */
6e36c8e6753239 Piyush Mehta 2022-01-26  541  	data_urb =3D uas_workaround_d=
ata(devinfo, GFP_ATOMIC, temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  542  	if (!data_urb) {
6e36c8e6753239 Piyush Mehta 2022-01-26  543  		/* Kill previously allocated=
 sense urb */
6e36c8e6753239 Piyush Mehta 2022-01-26  544  		sense_urb->context =3D NULL;
6e36c8e6753239 Piyush Mehta 2022-01-26  545  		usb_kill_urb(sense_urb);
6e36c8e6753239 Piyush Mehta 2022-01-26  546  		usb_put_urb(sense_urb);
6e36c8e6753239 Piyush Mehta 2022-01-26  547  		kfree(temp_request);
6e36c8e6753239 Piyush Mehta 2022-01-26  548  		kfree(temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  549  		goto free;
6e36c8e6753239 Piyush Mehta 2022-01-26  550  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  551  =

6e36c8e6753239 Piyush Mehta 2022-01-26  552  	/* Allocate and submit CMND u=
rb with dummy inquiry data */
6e36c8e6753239 Piyush Mehta 2022-01-26  553  	cmnd_urb =3D uas_workaround_c=
mnd(devinfo, GFP_ATOMIC, temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  554  	if (!cmnd_urb) {
6e36c8e6753239 Piyush Mehta 2022-01-26  555  		/* Kill previously allocated=
 data urb */
6e36c8e6753239 Piyush Mehta 2022-01-26  556  		data_urb->context =3D NULL;
6e36c8e6753239 Piyush Mehta 2022-01-26  557  		usb_kill_urb(data_urb);
6e36c8e6753239 Piyush Mehta 2022-01-26  558  		usb_put_urb(data_urb);
6e36c8e6753239 Piyush Mehta 2022-01-26  559  		kfree(temp_request);
6e36c8e6753239 Piyush Mehta 2022-01-26  560  		kfree(temp_cmnd);
6e36c8e6753239 Piyush Mehta 2022-01-26  561  	}
6e36c8e6753239 Piyush Mehta 2022-01-26  562  =

6e36c8e6753239 Piyush Mehta 2022-01-26  563  free:
6e36c8e6753239 Piyush Mehta 2022-01-26 @564  	return err;
6e36c8e6753239 Piyush Mehta 2022-01-26  565  }
6e36c8e6753239 Piyush Mehta 2022-01-26  566  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2021117722264549829==--

