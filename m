Content-Type: multipart/mixed; boundary="===============2754319276949604380=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:6771 rtl8xxxu_probe() warn: variable dereferenced before check 'priv' (see line 6665)
Date: Wed, 17 Aug 2022 00:00:44 +0800
Message-ID: <202208162305.WUMVi6BN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2754319276949604380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Zheyu Ma <zheyuma97@gmail.com>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 13876f2a087ad352bf640a7a0a4a4229ea6e9e4f wifi: rtl8xxxu: Fix the er=
ror handling of the probe function
date:   3 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220816/202208162305.WUMVi6BN-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:6771 rtl8xxxu_probe()=
 warn: variable dereferenced before check 'priv' (see line 6665)

Old smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5524 rtl8xxxu_c2hcmd_=
callback() warn: potential spectre issue 'rtl8xxxu_legacy_ratetable' [r] (l=
ocal cap)

vim +/priv +6771 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6599  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6600  static int rtl8xxxu_probe(struct usb_interfac=
e *interface,
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6601  			  const struct usb_device_id *id)
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6602  {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6603  	struct rtl8xxxu_priv *priv;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6604  	struct ieee80211_hw *hw;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6605  	struct usb_device *udev;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6606  	struct ieee80211_supported_band *sband;
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6607  	int ret;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6608  	int untested =3D 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6609  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6610  	udev =3D usb_get_dev(interface_to_usbdev(int=
erface));
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6611  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6612  	switch (id->idVendor) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6613  	case USB_VENDOR_ID_REALTEK:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6614  		switch(id->idProduct) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6615  		case 0x1724:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6616  		case 0x8176:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6617  		case 0x8178:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6618  		case 0x817f:
d607e396566a10 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2017-01-17  6619  		case 0x818b:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6620  			untested =3D 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6621  			break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6622  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6623  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6624  	case 0x7392:
408f122a1f9230 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2019-11-12  6625  		if (id->idProduct =3D=3D 0x7811 || id->idPr=
oduct =3D=3D 0xa611)
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6626  			untested =3D 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6627  		break;
e1d70c9b04000e drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-04-14  6628  	case 0x050d:
e1d70c9b04000e drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-04-14  6629  		if (id->idProduct =3D=3D 0x1004)
e1d70c9b04000e drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-04-14  6630  			untested =3D 0;
e1d70c9b04000e drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-04-14  6631  		break;
b81669b9e0b486 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6632  	case 0x20f4:
b81669b9e0b486 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6633  		if (id->idProduct =3D=3D 0x648b)
b81669b9e0b486 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6634  			untested =3D 0;
b81669b9e0b486 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6635  		break;
76a8e07d49b652 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6636  	case 0x2001:
76a8e07d49b652 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6637  		if (id->idProduct =3D=3D 0x3308)
76a8e07d49b652 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6638  			untested =3D 0;
76a8e07d49b652 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6639  		break;
690a6d268bdf85 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6640  	case 0x2357:
690a6d268bdf85 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6641  		if (id->idProduct =3D=3D 0x0109)
690a6d268bdf85 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6642  			untested =3D 0;
690a6d268bdf85 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6643  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6644  	default:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6645  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6646  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6647  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6648  	if (untested) {
eaa4d14c97c199 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-02-29  6649  		rtl8xxxu_debug |=3D RTL8XXXU_DEBUG_EFUSE;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6650  		dev_info(&udev->dev,
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6651  			 "This Realtek USB WiFi dongle (0x%04x:0x%=
04x) is untested!\n",
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6652  			 id->idVendor, id->idProduct);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6653  		dev_info(&udev->dev,
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6654  			 "Please report results to Jes.Sorensen(a)=
gmail.com\n");
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6655  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6656  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6657  	hw =3D ieee80211_alloc_hw(sizeof(struct rtl8=
xxxu_priv), &rtl8xxxu_ops);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6658  	if (!hw) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6659  		ret =3D -ENOMEM;
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6660  		priv =3D NULL;
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6661  		goto err_put_dev;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6662  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6663  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6664  	priv =3D hw->priv;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14 @6665  	priv->hw =3D hw;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6666  	priv->udev =3D udev;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6667  	priv->fops =3D (struct rtl8xxxu_fileops *)id=
->driver_info;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6668  	mutex_init(&priv->usb_buf_mutex);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6669  	mutex_init(&priv->h2c_mutex);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6670  	INIT_LIST_HEAD(&priv->tx_urb_free_list);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6671  	spin_lock_init(&priv->tx_urb_lock);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6672  	INIT_LIST_HEAD(&priv->rx_urb_pending_list);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6673  	spin_lock_init(&priv->rx_urb_lock);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6674  	INIT_WORK(&priv->rx_urb_wq, rtl8xxxu_rx_urb_=
work);
a9bb0b51577835 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Chris =
Chiu        2019-10-02  6675  	INIT_DELAYED_WORK(&priv->ra_watchdog, rtl8xx=
xu_watchdog_callback);
e542e66b7c2ee2 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Chris =
Chiu        2019-10-05  6676  	INIT_WORK(&priv->c2hcmd_work, rtl8xxxu_c2hcm=
d_callback);
e542e66b7c2ee2 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Chris =
Chiu        2019-10-05  6677  	skb_queue_head_init(&priv->c2hcmd_queue);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6678  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6679  	usb_set_intfdata(interface, hw);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6680  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6681  	ret =3D rtl8xxxu_parse_usb(priv, interface);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6682  	if (ret)
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6683  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6684  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6685  	ret =3D rtl8xxxu_identify_chip(priv);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6686  	if (ret) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6687  		dev_err(&udev->dev, "Fatal - failed to iden=
tify chip\n");
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6688  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6689  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6690  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6691  	ret =3D rtl8xxxu_read_efuse(priv);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6692  	if (ret) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6693  		dev_err(&udev->dev, "Fatal - failed to read=
 EFuse\n");
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6694  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6695  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6696  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6697  	ret =3D priv->fops->parse_efuse(priv);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6698  	if (ret) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6699  		dev_err(&udev->dev, "Fatal - failed to pars=
e EFuse\n");
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6700  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6701  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6702  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6703  	rtl8xxxu_print_chipinfo(priv);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6704  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6705  	ret =3D priv->fops->load_firmware(priv);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6706  	if (ret) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6707  		dev_err(&udev->dev, "Fatal - failed to load=
 firmware\n");
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6708  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6709  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6710  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6711  	ret =3D rtl8xxxu_init_device(hw);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6712  	if (ret)
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6713  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6714  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6715  	hw->wiphy->max_scan_ssids =3D 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6716  	hw->wiphy->max_scan_ie_len =3D IEEE80211_MAX=
_DATA_LEN;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6717  	hw->wiphy->interface_modes =3D BIT(NL80211_I=
FTYPE_STATION);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6718  	hw->queues =3D 4;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6719  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6720  	sband =3D &rtl8xxxu_supported_band;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6721  	sband->ht_cap.ht_supported =3D true;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6722  	sband->ht_cap.ampdu_factor =3D IEEE80211_HT_=
MAX_AMPDU_64K;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6723  	sband->ht_cap.ampdu_density =3D IEEE80211_HT=
_MPDU_DENSITY_16;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6724  	sband->ht_cap.cap =3D IEEE80211_HT_CAP_SGI_2=
0 | IEEE80211_HT_CAP_SGI_40;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6725  	memset(&sband->ht_cap.mcs, 0, sizeof(sband->=
ht_cap.mcs));
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6726  	sband->ht_cap.mcs.rx_mask[0] =3D 0xff;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6727  	sband->ht_cap.mcs.rx_mask[4] =3D 0x01;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6728  	if (priv->rf_paths > 1) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6729  		sband->ht_cap.mcs.rx_mask[1] =3D 0xff;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6730  		sband->ht_cap.cap |=3D IEEE80211_HT_CAP_SGI=
_40;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6731  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6732  	sband->ht_cap.mcs.tx_params =3D IEEE80211_HT=
_MCS_TX_DEFINED;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6733  	/*
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6734  	 * Some APs will negotiate HT20_40 in a nois=
y environment leading
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6735  	 * to miserable performance. Rather than def=
aulting to this, only
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6736  	 * enable it if explicitly requested at modu=
le load time.
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6737  	 */
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6738  	if (rtl8xxxu_ht40_2g) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6739  		dev_info(&udev->dev, "Enabling HT_20_40 on =
the 2.4GHz band\n");
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6740  		sband->ht_cap.cap |=3D IEEE80211_HT_CAP_SUP=
_WIDTH_20_40;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6741  	}
57fbcce37be7c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Johann=
es Berg     2016-04-12  6742  	hw->wiphy->bands[NL80211_BAND_2GHZ] =3D sban=
d;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6743  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6744  	hw->wiphy->rts_threshold =3D 2347;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6745  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6746  	SET_IEEE80211_DEV(priv->hw, &interface->dev);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6747  	SET_IEEE80211_PERM_ADDR(hw, priv->mac_addr);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6748  =

179e1742569620 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2016-02-29  6749  	hw->extra_tx_headroom =3D priv->fops->tx_des=
c_size;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6750  	ieee80211_hw_set(hw, SIGNAL_DBM);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6751  	/*
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6752  	 * The firmware handles rate control
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6753  	 */
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6754  	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6755  	ieee80211_hw_set(hw, AMPDU_AGGREGATION);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6756  =

ae44b502669d0c drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Andrew=
 Zaborowski 2017-02-10  6757  	wiphy_ext_feature_set(hw->wiphy, NL80211_EXT=
_FEATURE_CQM_RSSI_LIST);
ae44b502669d0c drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Andrew=
 Zaborowski 2017-02-10  6758  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6759  	ret =3D ieee80211_register_hw(priv->hw);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6760  	if (ret) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6761  		dev_err(&udev->dev, "%s: Failed to register=
: %i\n",
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6762  			__func__, ret);
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6763  		goto err_set_intfdata;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6764  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6765  =

deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6766  	return 0;
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6767  =

13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6768  err_set_intfdata:
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6769  	usb_set_intfdata(interface, NULL);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6770  =

deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19 @6771  	if (priv) {
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6772  		kfree(priv->fw_data);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6773  		mutex_destroy(&priv->usb_buf_mutex);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6774  		mutex_destroy(&priv->h2c_mutex);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6775  	}
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6776  =

deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6777  	ieee80211_free_hw(hw);
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6778  err_put_dev:
13876f2a087ad3 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Zheyu =
Ma          2022-07-16  6779  	usb_put_dev(udev);
deb6176e561324 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Jes So=
rensen      2016-08-19  6780  =

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6781  	return ret;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6782  }
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes So=
rensen      2015-10-14  6783  =


:::::: The code at line 6771 was first introduced by commit
:::::: deb6176e561324884652dd6a49a862bd8b152959 rtl8xxxu: Fix error handlin=
g if rtl8xxxu_init_device() fails

:::::: TO: Jes Sorensen <Jes.Sorensen@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2754319276949604380==--

