Content-Type: multipart/mixed; boundary="===============6414446862838132349=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/marvell/phy-pxa-usb.c:258:29: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Mon, 07 Dec 2020 17:11:39 +0800
Message-ID: <202012071736.VI1OLtI4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6414446862838132349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0477e92881850d44910a7e94fc2c46f96faa131f
commit: 203b7ee14d3a38f1b8c44dd86ce0313d8fc4107d phy: Enable compile testin=
g for some of drivers
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/phy/marvell/phy-pxa-usb.c:258:29: warning: Shifting signed 32-bi=
t value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    u2o_clear(base, UTMI_CTRL, UTMI_CTRL_USB_CLK_EN);
                               ^

vim +258 drivers/phy/marvell/phy-pxa-usb.c

644930cbad32c0 Lubomir Rintel 2018-10-15  245  =

644930cbad32c0 Lubomir Rintel 2018-10-15  246  static int pxa_usb_phy_exit(=
struct phy *phy)
644930cbad32c0 Lubomir Rintel 2018-10-15  247  {
644930cbad32c0 Lubomir Rintel 2018-10-15  248  	struct pxa_usb_phy *pxa_usb=
_phy =3D phy_get_drvdata(phy);
644930cbad32c0 Lubomir Rintel 2018-10-15  249  	void __iomem *base =3D pxa_=
usb_phy->base;
644930cbad32c0 Lubomir Rintel 2018-10-15  250  =

644930cbad32c0 Lubomir Rintel 2018-10-15  251  	dev_info(&phy->dev, "deinit=
ializing Marvell PXA USB PHY");
644930cbad32c0 Lubomir Rintel 2018-10-15  252  =

644930cbad32c0 Lubomir Rintel 2018-10-15  253  	if (pxa_usb_phy->version =
=3D=3D PXA_USB_PHY_PXA168)
644930cbad32c0 Lubomir Rintel 2018-10-15  254  		u2o_clear(base, UTMI_OTG_A=
DDON, UTMI_OTG_ADDON_OTG_ON);
644930cbad32c0 Lubomir Rintel 2018-10-15  255  =

644930cbad32c0 Lubomir Rintel 2018-10-15  256  	u2o_clear(base, UTMI_CTRL, =
UTMI_CTRL_RXBUF_PDWN);
644930cbad32c0 Lubomir Rintel 2018-10-15  257  	u2o_clear(base, UTMI_CTRL, =
UTMI_CTRL_TXBUF_PDWN);
644930cbad32c0 Lubomir Rintel 2018-10-15 @258  	u2o_clear(base, UTMI_CTRL, =
UTMI_CTRL_USB_CLK_EN);
644930cbad32c0 Lubomir Rintel 2018-10-15  259  	u2o_clear(base, UTMI_CTRL, =
1<<UTMI_CTRL_PWR_UP_SHIFT);
644930cbad32c0 Lubomir Rintel 2018-10-15  260  	u2o_clear(base, UTMI_CTRL, =
1<<UTMI_CTRL_PLL_PWR_UP_SHIFT);
644930cbad32c0 Lubomir Rintel 2018-10-15  261  =

644930cbad32c0 Lubomir Rintel 2018-10-15  262  	return 0;
644930cbad32c0 Lubomir Rintel 2018-10-15  263  }
644930cbad32c0 Lubomir Rintel 2018-10-15  264  =


:::::: The code@line 258 was first introduced by commit
:::::: 644930cbad32c0a850aaeed11eb2a49b492bf51a phy: phy-pxa-usb: add a new=
 driver

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6414446862838132349==--

