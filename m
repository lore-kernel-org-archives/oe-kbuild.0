Content-Type: multipart/mixed; boundary="===============5713169018727408021=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 13120/13818] drivers/bluetooth/btusb.c:1665 btusb_work() error: we previously assumed 'data->isoc' could be null (see line 1642)
Date: Thu, 09 Apr 2020 07:03:38 +0800
Message-ID: <202004090726.huc5U1o9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5713169018727408021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sathish Narasimman <sathish.narasimman@intel.com>
CC: Johan Hedberg <johan.hedberg@intel.com>
CC: Chethan T N <chethan.tumkur.narayan@intel.com>
CC: "Hsin-Yu Chao" <hychao@chromium.org>
CC: Amit K Bag <amit.k.bag@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5798bd75ab137611da5c4cb11b6795d14cb60ba2
commit: baac6276c0a9f36f1fe1f00590ef00d2ba5ba626 [13120/13818] Bluetooth: b=
tusb: handle mSBC audio over USB Endpoints
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/bluetooth/btusb.c:1665 btusb_work() error: we previously assumed 'd=
ata->isoc' could be null (see line 1642)

Old smatch warnings:
drivers/bluetooth/btusb.c:2026 btusb_setup_intel() warn: inconsistent inden=
ting

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dbaac6276c0a9f36f1fe1f00590ef00d2ba5ba626
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout baac6276c0a9f36f1fe1f00590ef00d2ba5ba626
vim +1665 drivers/bluetooth/btusb.c

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1632  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1633  static void btusb_work(=
struct work_struct *work)
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1634  {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1635  	struct btusb_data *dat=
a =3D container_of(work, struct btusb_data, work);
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1636  	struct hci_dev *hdev =
=3D data->hdev;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1637  	int new_alts =3D 0;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1638  	int err;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1639  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1640  	if (data->sco_num > 0)=
 {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1641  		if (!test_bit(BTUSB_D=
ID_ISO_RESUME, &data->flags)) {
baac6276c0a9f3 Sathish Narasimman 2020-04-03 @1642  			err =3D usb_autopm_g=
et_interface(data->isoc ? data->isoc : data->intf);
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1643  			if (err < 0) {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1644  				clear_bit(BTUSB_ISO=
C_RUNNING, &data->flags);
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1645  				usb_kill_anchored_u=
rbs(&data->isoc_anchor);
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1646  				return;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1647  			}
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1648  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1649  			set_bit(BTUSB_DID_IS=
O_RESUME, &data->flags);
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1650  		}
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1651  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1652  		if (data->air_mode =
=3D=3D HCI_NOTIFY_ENABLE_SCO_CVSD) {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1653  			if (hdev->voice_sett=
ing & 0x0020) {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1654  				static const int al=
ts[3] =3D { 2, 4, 5 };
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1655  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1656  				new_alts =3D alts[d=
ata->sco_num - 1];
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1657  			} else {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1658  				new_alts =3D data->=
sco_num;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1659  			}
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1660  		} else if (data->air_=
mode =3D=3D HCI_NOTIFY_ENABLE_SCO_TRANSP) {
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1661  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1662  			data->usb_alt6_packe=
t_flow =3D true;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1663  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1664  			/* Check if Alt 6 is=
 supported for Transparent audio */
baac6276c0a9f3 Sathish Narasimman 2020-04-03 @1665  			if (btusb_find_altse=
tting(data, 6))
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1666  				new_alts =3D 6;
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1667  			else
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1668  				bt_dev_err(hdev, "D=
evice does not support ALT setting 6");
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1669  		}
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1670  =

baac6276c0a9f3 Sathish Narasimman 2020-04-03  1671  		if (btusb_switch_alt_=
setting(hdev, new_alts) < 0)
baac6276c0a9f3 Sathish Narasimman 2020-04-03  1672  			bt_dev_err(hdev, "se=
t USB alt:(%d) failed!", new_alts);
9bfa35fe422c74 Marcel Holtmann    2008-08-18  1673  	} else {
9bfa35fe422c74 Marcel Holtmann    2008-08-18  1674  		clear_bit(BTUSB_ISOC_=
RUNNING, &data->flags);
9bfa35fe422c74 Marcel Holtmann    2008-08-18  1675  		usb_kill_anchored_urb=
s(&data->isoc_anchor);
9bfa35fe422c74 Marcel Holtmann    2008-08-18  1676  =

9bfa35fe422c74 Marcel Holtmann    2008-08-18  1677  		__set_isoc_interface(=
hdev, 0);
08b8b6c454092a Gustavo Padovan    2010-07-16  1678  		if (test_and_clear_bi=
t(BTUSB_DID_ISO_RESUME, &data->flags))
8efdd0cdc54f3b Oliver Neukum      2011-02-11  1679  			usb_autopm_put_inter=
face(data->isoc ? data->isoc : data->intf);
7bee549e197c9c Oliver Neukum      2009-08-24  1680  	}
7bee549e197c9c Oliver Neukum      2009-08-24  1681  }
7bee549e197c9c Oliver Neukum      2009-08-24  1682  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5713169018727408021==--

