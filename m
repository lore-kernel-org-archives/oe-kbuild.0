Content-Type: multipart/mixed; boundary="===============2283816196927189834=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7132/11526] drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error: uninitialized symbol 'fw_version'.
Date: Wed, 17 Feb 2021 03:34:33 +0800
Message-ID: <202102170330.gZljypnz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2283816196927189834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mark Chen <Mark-YW.Chen@mediatek.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6553715b6db5ff5d4898895dad1b2926cfe406cf
commit: fc342c4dc408754f50f19dc832152fbb4b73f1e6 [7132/11526] Bluetooth: bt=
usb: Add protocol support for MediaTek MT7921U USB devices
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: parisc-randconfig-m031-20210216 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error: uninitialized symbo=
l 'fw_version'.

Old smatch warnings:
drivers/bluetooth/btusb.c:2201 btusb_setup_intel() warn: inconsistent inden=
ting

vim +/fw_version +3775 drivers/bluetooth/btusb.c

a1c49c434e15050 Sean Wang 2019-06-02  3728  =

a1c49c434e15050 Sean Wang 2019-06-02  3729  static int btusb_mtk_setup(stru=
ct hci_dev *hdev)
a1c49c434e15050 Sean Wang 2019-06-02  3730  {
a1c49c434e15050 Sean Wang 2019-06-02  3731  	struct btusb_data *data =3D hc=
i_get_drvdata(hdev);
a1c49c434e15050 Sean Wang 2019-06-02  3732  	struct btmtk_hci_wmt_params wm=
t_params;
a1c49c434e15050 Sean Wang 2019-06-02  3733  	ktime_t calltime, delta, retti=
me;
a1c49c434e15050 Sean Wang 2019-06-02  3734  	struct btmtk_tci_sleep tci_sle=
ep;
a1c49c434e15050 Sean Wang 2019-06-02  3735  	unsigned long long duration;
a1c49c434e15050 Sean Wang 2019-06-02  3736  	struct sk_buff *skb;
a1c49c434e15050 Sean Wang 2019-06-02  3737  	const char *fwname;
a1c49c434e15050 Sean Wang 2019-06-02  3738  	int err, status;
a1c49c434e15050 Sean Wang 2019-06-02  3739  	u32 dev_id;
fc342c4dc408754 Mark Chen 2021-02-02  3740  	char fw_bin_name[64];
fc342c4dc408754 Mark Chen 2021-02-02  3741  	u32 fw_version;
a1c49c434e15050 Sean Wang 2019-06-02  3742  	u8 param;
a1c49c434e15050 Sean Wang 2019-06-02  3743  =

a1c49c434e15050 Sean Wang 2019-06-02  3744  	calltime =3D ktime_get();
a1c49c434e15050 Sean Wang 2019-06-02  3745  =

48c13301e6baba5 Mark Chen 2021-02-02  3746  	err =3D btusb_mtk_id_get(data,=
 0x80000008, &dev_id);
a1c49c434e15050 Sean Wang 2019-06-02  3747  	if (err < 0) {
a1c49c434e15050 Sean Wang 2019-06-02  3748  		bt_dev_err(hdev, "Failed to g=
et device id (%d)", err);
a1c49c434e15050 Sean Wang 2019-06-02  3749  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3750  	}
a1c49c434e15050 Sean Wang 2019-06-02  3751  =

fc342c4dc408754 Mark Chen 2021-02-02  3752  	if (!dev_id) {
fc342c4dc408754 Mark Chen 2021-02-02  3753  		err =3D btusb_mtk_id_get(data=
, 0x70010200, &dev_id);
fc342c4dc408754 Mark Chen 2021-02-02  3754  		if (err < 0) {
fc342c4dc408754 Mark Chen 2021-02-02  3755  			bt_dev_err(hdev, "Failed to =
get device id (%d)", err);
fc342c4dc408754 Mark Chen 2021-02-02  3756  			return err;
fc342c4dc408754 Mark Chen 2021-02-02  3757  		}
fc342c4dc408754 Mark Chen 2021-02-02  3758  		err =3D btusb_mtk_id_get(data=
, 0x80021004, &fw_version);
fc342c4dc408754 Mark Chen 2021-02-02  3759  		if (err < 0) {
fc342c4dc408754 Mark Chen 2021-02-02  3760  			bt_dev_err(hdev, "Failed to =
get fw version (%d)", err);
fc342c4dc408754 Mark Chen 2021-02-02  3761  			return err;
fc342c4dc408754 Mark Chen 2021-02-02  3762  		}
fc342c4dc408754 Mark Chen 2021-02-02  3763  	}
fc342c4dc408754 Mark Chen 2021-02-02  3764  =

a1c49c434e15050 Sean Wang 2019-06-02  3765  	switch (dev_id) {
9ce67c3235be71e Sean Wang 2019-06-02  3766  	case 0x7663:
9ce67c3235be71e Sean Wang 2019-06-02  3767  		fwname =3D FIRMWARE_MT7663;
9ce67c3235be71e Sean Wang 2019-06-02  3768  		break;
a1c49c434e15050 Sean Wang 2019-06-02  3769  	case 0x7668:
a1c49c434e15050 Sean Wang 2019-06-02  3770  		fwname =3D FIRMWARE_MT7668;
a1c49c434e15050 Sean Wang 2019-06-02  3771  		break;
fc342c4dc408754 Mark Chen 2021-02-02  3772  	case 0x7961:
fc342c4dc408754 Mark Chen 2021-02-02  3773  		snprintf(fw_bin_name, sizeof(=
fw_bin_name),
fc342c4dc408754 Mark Chen 2021-02-02  3774  			"mediatek/BT_RAM_CODE_MT%04x=
_1_%x_hdr.bin",
fc342c4dc408754 Mark Chen 2021-02-02 @3775  			 dev_id & 0xffff, (fw_versio=
n & 0xff) + 1);
fc342c4dc408754 Mark Chen 2021-02-02  3776  		err =3D btusb_mtk_setup_firmw=
are_79xx(hdev, fw_bin_name);
fc342c4dc408754 Mark Chen 2021-02-02  3777  =

fc342c4dc408754 Mark Chen 2021-02-02  3778  		/* Enable Bluetooth protocol =
*/
fc342c4dc408754 Mark Chen 2021-02-02  3779  		param =3D 1;
fc342c4dc408754 Mark Chen 2021-02-02  3780  		wmt_params.op =3D BTMTK_WMT_F=
UNC_CTRL;
fc342c4dc408754 Mark Chen 2021-02-02  3781  		wmt_params.flag =3D 0;
fc342c4dc408754 Mark Chen 2021-02-02  3782  		wmt_params.dlen =3D sizeof(pa=
ram);
fc342c4dc408754 Mark Chen 2021-02-02  3783  		wmt_params.data =3D &param;
fc342c4dc408754 Mark Chen 2021-02-02  3784  		wmt_params.status =3D NULL;
fc342c4dc408754 Mark Chen 2021-02-02  3785  =

fc342c4dc408754 Mark Chen 2021-02-02  3786  		err =3D btusb_mtk_hci_wmt_syn=
c(hdev, &wmt_params);
fc342c4dc408754 Mark Chen 2021-02-02  3787  		if (err < 0) {
fc342c4dc408754 Mark Chen 2021-02-02  3788  			bt_dev_err(hdev, "Failed to =
send wmt func ctrl (%d)", err);
fc342c4dc408754 Mark Chen 2021-02-02  3789  			return err;
fc342c4dc408754 Mark Chen 2021-02-02  3790  		}
fc342c4dc408754 Mark Chen 2021-02-02  3791  		goto done;
a1c49c434e15050 Sean Wang 2019-06-02  3792  	default:
a1c49c434e15050 Sean Wang 2019-06-02  3793  		bt_dev_err(hdev, "Unsupported=
 support hardware variant (%08x)",
a1c49c434e15050 Sean Wang 2019-06-02  3794  			   dev_id);
a1c49c434e15050 Sean Wang 2019-06-02  3795  		return -ENODEV;
a1c49c434e15050 Sean Wang 2019-06-02  3796  	}
a1c49c434e15050 Sean Wang 2019-06-02  3797  =

a1c49c434e15050 Sean Wang 2019-06-02  3798  	/* Query whether the firmware =
is already download */
a1c49c434e15050 Sean Wang 2019-06-02  3799  	wmt_params.op =3D BTMTK_WMT_SE=
MAPHORE;
a1c49c434e15050 Sean Wang 2019-06-02  3800  	wmt_params.flag =3D 1;
a1c49c434e15050 Sean Wang 2019-06-02  3801  	wmt_params.dlen =3D 0;
a1c49c434e15050 Sean Wang 2019-06-02  3802  	wmt_params.data =3D NULL;
a1c49c434e15050 Sean Wang 2019-06-02  3803  	wmt_params.status =3D &status;
a1c49c434e15050 Sean Wang 2019-06-02  3804  =

a1c49c434e15050 Sean Wang 2019-06-02  3805  	err =3D btusb_mtk_hci_wmt_sync=
(hdev, &wmt_params);
a1c49c434e15050 Sean Wang 2019-06-02  3806  	if (err < 0) {
a1c49c434e15050 Sean Wang 2019-06-02  3807  		bt_dev_err(hdev, "Failed to q=
uery firmware status (%d)", err);
a1c49c434e15050 Sean Wang 2019-06-02  3808  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3809  	}
a1c49c434e15050 Sean Wang 2019-06-02  3810  =

a1c49c434e15050 Sean Wang 2019-06-02  3811  	if (status =3D=3D BTMTK_WMT_PA=
TCH_DONE) {
a1c49c434e15050 Sean Wang 2019-06-02  3812  		bt_dev_info(hdev, "firmware a=
lready downloaded");
a1c49c434e15050 Sean Wang 2019-06-02  3813  		goto ignore_setup_fw;
a1c49c434e15050 Sean Wang 2019-06-02  3814  	}
a1c49c434e15050 Sean Wang 2019-06-02  3815  =

a1c49c434e15050 Sean Wang 2019-06-02  3816  	/* Setup a firmware which the =
device definitely requires */
a1c49c434e15050 Sean Wang 2019-06-02  3817  	err =3D btusb_mtk_setup_firmwa=
re(hdev, fwname);
a1c49c434e15050 Sean Wang 2019-06-02  3818  	if (err < 0)
a1c49c434e15050 Sean Wang 2019-06-02  3819  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3820  =

a1c49c434e15050 Sean Wang 2019-06-02  3821  ignore_setup_fw:
a1c49c434e15050 Sean Wang 2019-06-02  3822  	err =3D readx_poll_timeout(btu=
sb_mtk_func_query, hdev, status,
a1c49c434e15050 Sean Wang 2019-06-02  3823  				 status < 0 || status !=3D =
BTMTK_WMT_ON_PROGRESS,
a1c49c434e15050 Sean Wang 2019-06-02  3824  				 2000, 5000000);
a1c49c434e15050 Sean Wang 2019-06-02  3825  	/* -ETIMEDOUT happens */
a1c49c434e15050 Sean Wang 2019-06-02  3826  	if (err < 0)
a1c49c434e15050 Sean Wang 2019-06-02  3827  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3828  =

a1c49c434e15050 Sean Wang 2019-06-02  3829  	/* The other errors happen in =
btusb_mtk_func_query */
a1c49c434e15050 Sean Wang 2019-06-02  3830  	if (status < 0)
a1c49c434e15050 Sean Wang 2019-06-02  3831  		return status;
a1c49c434e15050 Sean Wang 2019-06-02  3832  =

a1c49c434e15050 Sean Wang 2019-06-02  3833  	if (status =3D=3D BTMTK_WMT_ON=
_DONE) {
a1c49c434e15050 Sean Wang 2019-06-02  3834  		bt_dev_info(hdev, "function a=
lready on");
a1c49c434e15050 Sean Wang 2019-06-02  3835  		goto ignore_func_on;
a1c49c434e15050 Sean Wang 2019-06-02  3836  	}
a1c49c434e15050 Sean Wang 2019-06-02  3837  =

a1c49c434e15050 Sean Wang 2019-06-02  3838  	/* Enable Bluetooth protocol */
a1c49c434e15050 Sean Wang 2019-06-02  3839  	param =3D 1;
a1c49c434e15050 Sean Wang 2019-06-02  3840  	wmt_params.op =3D BTMTK_WMT_FU=
NC_CTRL;
a1c49c434e15050 Sean Wang 2019-06-02  3841  	wmt_params.flag =3D 0;
a1c49c434e15050 Sean Wang 2019-06-02  3842  	wmt_params.dlen =3D sizeof(par=
am);
a1c49c434e15050 Sean Wang 2019-06-02  3843  	wmt_params.data =3D &param;
a1c49c434e15050 Sean Wang 2019-06-02  3844  	wmt_params.status =3D NULL;
a1c49c434e15050 Sean Wang 2019-06-02  3845  =

a1c49c434e15050 Sean Wang 2019-06-02  3846  	err =3D btusb_mtk_hci_wmt_sync=
(hdev, &wmt_params);
a1c49c434e15050 Sean Wang 2019-06-02  3847  	if (err < 0) {
a1c49c434e15050 Sean Wang 2019-06-02  3848  		bt_dev_err(hdev, "Failed to s=
end wmt func ctrl (%d)", err);
a1c49c434e15050 Sean Wang 2019-06-02  3849  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3850  	}
a1c49c434e15050 Sean Wang 2019-06-02  3851  =

a1c49c434e15050 Sean Wang 2019-06-02  3852  ignore_func_on:
a1c49c434e15050 Sean Wang 2019-06-02  3853  	/* Apply the low power environ=
ment setup */
a1c49c434e15050 Sean Wang 2019-06-02  3854  	tci_sleep.mode =3D 0x5;
a1c49c434e15050 Sean Wang 2019-06-02  3855  	tci_sleep.duration =3D cpu_to_=
le16(0x640);
a1c49c434e15050 Sean Wang 2019-06-02  3856  	tci_sleep.host_duration =3D cp=
u_to_le16(0x640);
a1c49c434e15050 Sean Wang 2019-06-02  3857  	tci_sleep.host_wakeup_pin =3D =
0;
a1c49c434e15050 Sean Wang 2019-06-02  3858  	tci_sleep.time_compensation =
=3D 0;
a1c49c434e15050 Sean Wang 2019-06-02  3859  =

a1c49c434e15050 Sean Wang 2019-06-02  3860  	skb =3D __hci_cmd_sync(hdev, 0=
xfc7a, sizeof(tci_sleep), &tci_sleep,
a1c49c434e15050 Sean Wang 2019-06-02  3861  			     HCI_INIT_TIMEOUT);
a1c49c434e15050 Sean Wang 2019-06-02  3862  	if (IS_ERR(skb)) {
a1c49c434e15050 Sean Wang 2019-06-02  3863  		err =3D PTR_ERR(skb);
a1c49c434e15050 Sean Wang 2019-06-02  3864  		bt_dev_err(hdev, "Failed to a=
pply low power setting (%d)", err);
a1c49c434e15050 Sean Wang 2019-06-02  3865  		return err;
a1c49c434e15050 Sean Wang 2019-06-02  3866  	}
a1c49c434e15050 Sean Wang 2019-06-02  3867  	kfree_skb(skb);
a1c49c434e15050 Sean Wang 2019-06-02  3868  =

fc342c4dc408754 Mark Chen 2021-02-02  3869  done:
a1c49c434e15050 Sean Wang 2019-06-02  3870  	rettime =3D ktime_get();
a1c49c434e15050 Sean Wang 2019-06-02  3871  	delta =3D ktime_sub(rettime, c=
alltime);
a1c49c434e15050 Sean Wang 2019-06-02  3872  	duration =3D (unsigned long lo=
ng)ktime_to_ns(delta) >> 10;
a1c49c434e15050 Sean Wang 2019-06-02  3873  =

a1c49c434e15050 Sean Wang 2019-06-02  3874  	bt_dev_info(hdev, "Device setu=
p in %llu usecs", duration);
a1c49c434e15050 Sean Wang 2019-06-02  3875  =

a1c49c434e15050 Sean Wang 2019-06-02  3876  	return 0;
a1c49c434e15050 Sean Wang 2019-06-02  3877  }
a1c49c434e15050 Sean Wang 2019-06-02  3878  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2283816196927189834==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
EwDWAQA=
--===============2283816196927189834==--

