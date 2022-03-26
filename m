Content-Type: multipart/mixed; boundary="===============3837965684452445040=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 334/1029] drivers/usb/host/xhci-plat.c:197 usb_otg_set_host() warn: missing error code 'ret'
Date: Sat, 26 Mar 2022 10:21:34 +0800
Message-ID: <202203261039.1sezSfyu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3837965684452445040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Piyush Mehta <piyush.mehta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 0839809852bc5822dc1cf4446cb6c89d7f221659 [334/1029] usb: host: xhci=
: plat: add support for otg_set_host() call
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203261039.1sezSfyu-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/host/xhci-plat.c:197 usb_otg_set_host() warn: missing error cod=
e 'ret'

vim +/ret +197 drivers/usb/host/xhci-plat.c

4efb2f69411456d Yoshihiro Shimoda 2015-11-24  187  =

0839809852bc582 Piyush Mehta      2022-01-26  188  static int usb_otg_set_h=
ost(struct device *dev, struct usb_hcd *hcd, bool yes)
0839809852bc582 Piyush Mehta      2022-01-26  189  {
0839809852bc582 Piyush Mehta      2022-01-26  190  	int ret =3D 0;
0839809852bc582 Piyush Mehta      2022-01-26  191  =

0839809852bc582 Piyush Mehta      2022-01-26  192  	hcd->usb_phy =3D usb_ge=
t_phy(USB_PHY_TYPE_USB3);
0839809852bc582 Piyush Mehta      2022-01-26  193  	if (!IS_ERR_OR_NULL(hcd=
->usb_phy) && hcd->usb_phy->otg) {
0839809852bc582 Piyush Mehta      2022-01-26  194  		if (yes) {
0839809852bc582 Piyush Mehta      2022-01-26  195  			if (otg_set_host(hcd-=
>usb_phy->otg, &hcd->self)) {
0839809852bc582 Piyush Mehta      2022-01-26  196  				usb_put_phy(hcd->usb=
_phy);
0839809852bc582 Piyush Mehta      2022-01-26 @197  				goto disable_phy;
0839809852bc582 Piyush Mehta      2022-01-26  198  			}
0839809852bc582 Piyush Mehta      2022-01-26  199  		} else {
0839809852bc582 Piyush Mehta      2022-01-26  200  			ret =3D otg_set_host(=
hcd->usb_phy->otg, NULL);
0839809852bc582 Piyush Mehta      2022-01-26  201  			usb_put_phy(hcd->usb_=
phy);
0839809852bc582 Piyush Mehta      2022-01-26  202  			goto disable_phy;
0839809852bc582 Piyush Mehta      2022-01-26  203  		}
0839809852bc582 Piyush Mehta      2022-01-26  204  =

0839809852bc582 Piyush Mehta      2022-01-26  205  	} else {
0839809852bc582 Piyush Mehta      2022-01-26  206  		goto disable_phy;
0839809852bc582 Piyush Mehta      2022-01-26  207  	}
0839809852bc582 Piyush Mehta      2022-01-26  208  =

0839809852bc582 Piyush Mehta      2022-01-26  209  	return 0;
0839809852bc582 Piyush Mehta      2022-01-26  210  =

0839809852bc582 Piyush Mehta      2022-01-26  211  disable_phy:
0839809852bc582 Piyush Mehta      2022-01-26  212  	hcd->usb_phy =3D NULL;
0839809852bc582 Piyush Mehta      2022-01-26  213  =

0839809852bc582 Piyush Mehta      2022-01-26  214  	return ret;
0839809852bc582 Piyush Mehta      2022-01-26  215  }
0839809852bc582 Piyush Mehta      2022-01-26  216  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3837965684452445040==--

