Content-Type: multipart/mixed; boundary="===============2984691840979315635=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
Subject: Re: [kbuild-all] [linux-next:master 7132/11526] drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error: uninitialized symbol 'fw_version'.
Date: Thu, 20 May 2021 09:58:13 +0800
Message-ID: <20210520015813.GA3327173@pl-dbox>
In-Reply-To: <20210217074946.GI2222@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2984691840979315635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 10:49:46AM +0300, Dan Carpenter wrote:
> [ Why is linux-mm CC'd on these patches??? - dan ]
sorry for late, Hi Dan, FYI, we have defined related rule like mail cc
in repo definition of linux-next. This can be found at
https://github.com/intel/lkp-tests/blob/master/repo/linux/linux-next,
which could be a requirement in early days.

> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it  master
> head:   6553715b6db5ff5d4898895dad1b2926cfe406cf
> commit: fc342c4dc408754f50f19dc832152fbb4b73f1e6 [7132/11526] Bluetooth: =
btusb: Add protocol support for MediaTek MT7921U USB devices
> config: parisc-randconfig-m031-20210216 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error: uninitialized sym=
bol 'fw_version'.
> =

> Old smatch warnings:
> drivers/bluetooth/btusb.c:2201 btusb_setup_intel() warn: inconsistent ind=
enting
> =

> vim +/fw_version +3775 drivers/bluetooth/btusb.c
> =

> a1c49c434e15050 Sean Wang 2019-06-02  3729  static int btusb_mtk_setup(st=
ruct hci_dev *hdev)
> a1c49c434e15050 Sean Wang 2019-06-02  3730  {
> a1c49c434e15050 Sean Wang 2019-06-02  3731  	struct btusb_data *data =3D =
hci_get_drvdata(hdev);
> a1c49c434e15050 Sean Wang 2019-06-02  3732  	struct btmtk_hci_wmt_params =
wmt_params;
> a1c49c434e15050 Sean Wang 2019-06-02  3733  	ktime_t calltime, delta, ret=
time;
> a1c49c434e15050 Sean Wang 2019-06-02  3734  	struct btmtk_tci_sleep tci_s=
leep;
> a1c49c434e15050 Sean Wang 2019-06-02  3735  	unsigned long long duration;
> a1c49c434e15050 Sean Wang 2019-06-02  3736  	struct sk_buff *skb;
> a1c49c434e15050 Sean Wang 2019-06-02  3737  	const char *fwname;
> a1c49c434e15050 Sean Wang 2019-06-02  3738  	int err, status;
> a1c49c434e15050 Sean Wang 2019-06-02  3739  	u32 dev_id;
> fc342c4dc408754 Mark Chen 2021-02-02  3740  	char fw_bin_name[64];
> fc342c4dc408754 Mark Chen 2021-02-02  3741  	u32 fw_version;
> a1c49c434e15050 Sean Wang 2019-06-02  3742  	u8 param;
> a1c49c434e15050 Sean Wang 2019-06-02  3743  =

> a1c49c434e15050 Sean Wang 2019-06-02  3744  	calltime =3D ktime_get();
> a1c49c434e15050 Sean Wang 2019-06-02  3745  =

> 48c13301e6baba5 Mark Chen 2021-02-02  3746  	err =3D btusb_mtk_id_get(dat=
a, 0x80000008, &dev_id);
> a1c49c434e15050 Sean Wang 2019-06-02  3747  	if (err < 0) {
> a1c49c434e15050 Sean Wang 2019-06-02  3748  		bt_dev_err(hdev, "Failed to=
 get device id (%d)", err);
> a1c49c434e15050 Sean Wang 2019-06-02  3749  		return err;
> a1c49c434e15050 Sean Wang 2019-06-02  3750  	}
> a1c49c434e15050 Sean Wang 2019-06-02  3751  =

> fc342c4dc408754 Mark Chen 2021-02-02  3752  	if (!dev_id) {
> fc342c4dc408754 Mark Chen 2021-02-02  3753  		err =3D btusb_mtk_id_get(da=
ta, 0x70010200, &dev_id);
> fc342c4dc408754 Mark Chen 2021-02-02  3754  		if (err < 0) {
> fc342c4dc408754 Mark Chen 2021-02-02  3755  			bt_dev_err(hdev, "Failed t=
o get device id (%d)", err);
> fc342c4dc408754 Mark Chen 2021-02-02  3756  			return err;
> fc342c4dc408754 Mark Chen 2021-02-02  3757  		}
> fc342c4dc408754 Mark Chen 2021-02-02  3758  		err =3D btusb_mtk_id_get(da=
ta, 0x80021004, &fw_version);
> fc342c4dc408754 Mark Chen 2021-02-02  3759  		if (err < 0) {
> fc342c4dc408754 Mark Chen 2021-02-02  3760  			bt_dev_err(hdev, "Failed t=
o get fw version (%d)", err);
> fc342c4dc408754 Mark Chen 2021-02-02  3761  			return err;
> fc342c4dc408754 Mark Chen 2021-02-02  3762  		}
> fc342c4dc408754 Mark Chen 2021-02-02  3763  	}
> =

> "fw_version" not initialized on else path.
> =

> fc342c4dc408754 Mark Chen 2021-02-02  3764  =

> a1c49c434e15050 Sean Wang 2019-06-02  3765  	switch (dev_id) {
> 9ce67c3235be71e Sean Wang 2019-06-02  3766  	case 0x7663:
> 9ce67c3235be71e Sean Wang 2019-06-02  3767  		fwname =3D FIRMWARE_MT7663;
> 9ce67c3235be71e Sean Wang 2019-06-02  3768  		break;
> a1c49c434e15050 Sean Wang 2019-06-02  3769  	case 0x7668:
> a1c49c434e15050 Sean Wang 2019-06-02  3770  		fwname =3D FIRMWARE_MT7668;
> a1c49c434e15050 Sean Wang 2019-06-02  3771  		break;
> fc342c4dc408754 Mark Chen 2021-02-02  3772  	case 0x7961:
> fc342c4dc408754 Mark Chen 2021-02-02  3773  		snprintf(fw_bin_name, sizeo=
f(fw_bin_name),
> fc342c4dc408754 Mark Chen 2021-02-02  3774  			"mediatek/BT_RAM_CODE_MT%0=
4x_1_%x_hdr.bin",
> fc342c4dc408754 Mark Chen 2021-02-02 @3775  			 dev_id & 0xffff, (fw_vers=
ion & 0xff) + 1);
>                                                                          =
          ^^^^^^^^^^
> =

> fc342c4dc408754 Mark Chen 2021-02-02  3776  		err =3D btusb_mtk_setup_fir=
mware_79xx(hdev, fw_bin_name);
> fc342c4dc408754 Mark Chen 2021-02-02  3777  =

> fc342c4dc408754 Mark Chen 2021-02-02  3778  		/* Enable Bluetooth protoco=
l */
> fc342c4dc408754 Mark Chen 2021-02-02  3779  		param =3D 1;
> fc342c4dc408754 Mark Chen 2021-02-02  3780  		wmt_params.op =3D BTMTK_WMT=
_FUNC_CTRL;
> fc342c4dc408754 Mark Chen 2021-02-02  3781  		wmt_params.flag =3D 0;
> fc342c4dc408754 Mark Chen 2021-02-02  3782  		wmt_params.dlen =3D sizeof(=
param);
> fc342c4dc408754 Mark Chen 2021-02-02  3783  		wmt_params.data =3D &param;
> fc342c4dc408754 Mark Chen 2021-02-02  3784  		wmt_params.status =3D NULL;
> fc342c4dc408754 Mark Chen 2021-02-02  3785  =

> fc342c4dc408754 Mark Chen 2021-02-02  3786  		err =3D btusb_mtk_hci_wmt_s=
ync(hdev, &wmt_params);
> fc342c4dc408754 Mark Chen 2021-02-02  3787  		if (err < 0) {
> fc342c4dc408754 Mark Chen 2021-02-02  3788  			bt_dev_err(hdev, "Failed t=
o send wmt func ctrl (%d)", err);
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =



> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org

> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============2984691840979315635==--

