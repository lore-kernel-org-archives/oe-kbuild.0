Content-Type: multipart/mixed; boundary="===============1321957357846366660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:98:53: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Wed, 02 Dec 2020 14:18:58 +0800
Message-ID: <202012021455.byuKn9tO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1321957357846366660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   509a15421674b9e1a3e1916939d0d0efd3e578da
commit: e7b4aaf051d581a30bea1f55d775a627b0ad3106 phy: Enable compile testin=
g for some of drivers
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:98:53: warning: Shifti=
ng signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsS=
igned]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:102:53: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:105:53: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:116:53: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:119:53: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:122:53: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
    while (brcm_usb_readl(usb_mdio + USB_GMDIOCSR) & (1<<31))
                                                       ^
>> drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:0:0: warning: Invalid =
value: 0x00_IPP_MASK [cppcheckError]
   =

   ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:0:0: note: Invalid val=
ue: 0x00_IPP_MASK
   =

   ^
   drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c:0:0: note: Invalid val=
ue: 0x00_IPP_MASK
   =

   ^

vim +98 drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c

4e5b9c9a73b32d2 Al Cooper 2020-01-03    1  // SPDX-License-Identifier: GPL-=
2.0
4e5b9c9a73b32d2 Al Cooper 2020-01-03    2  /* Copyright (c) 2018, Broadcom =
*/
4e5b9c9a73b32d2 Al Cooper 2020-01-03    3  =

4e5b9c9a73b32d2 Al Cooper 2020-01-03    4  /*
4e5b9c9a73b32d2 Al Cooper 2020-01-03    5   * This module contains USB PHY =
initialization for power up and S3 resume
4e5b9c9a73b32d2 Al Cooper 2020-01-03    6   * for newer Synopsys based USB =
hardware first used on the bcm7216.
4e5b9c9a73b32d2 Al Cooper 2020-01-03    7   */
4e5b9c9a73b32d2 Al Cooper 2020-01-03    8  =

4e5b9c9a73b32d2 Al Cooper 2020-01-03    9  #include <linux/delay.h>
4e5b9c9a73b32d2 Al Cooper 2020-01-03   10  #include <linux/io.h>
4e5b9c9a73b32d2 Al Cooper 2020-01-03   11  =

4e5b9c9a73b32d2 Al Cooper 2020-01-03   12  #include <linux/soc/brcmstb/brcm=
stb.h>
4e5b9c9a73b32d2 Al Cooper 2020-01-03   13  #include "phy-brcm-usb-init.h"
4e5b9c9a73b32d2 Al Cooper 2020-01-03   14  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   15  #define PHY_LOCK_TIMEOUT_MS 200
9d5f51dcdb646c2 Al Cooper 2020-01-03   16  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   17  /* Register definitions for sysc=
on piarbctl registers */
9d5f51dcdb646c2 Al Cooper 2020-01-03   18  #define PIARBCTL_CAM			0x00
9d5f51dcdb646c2 Al Cooper 2020-01-03   19  #define PIARBCTL_SPLITTER		0x04
9d5f51dcdb646c2 Al Cooper 2020-01-03   20  #define PIARBCTL_MISC			0x08
9d5f51dcdb646c2 Al Cooper 2020-01-03   21  #define   PIARBCTL_MISC_SECURE_M=
ASK			0x80000000
9d5f51dcdb646c2 Al Cooper 2020-01-03   22  #define   PIARBCTL_MISC_USB_SELE=
CT_MASK			0x40000000
9d5f51dcdb646c2 Al Cooper 2020-01-03   23  #define   PIARBCTL_MISC_USB_4G_S=
DRAM_MASK		0x20000000
9d5f51dcdb646c2 Al Cooper 2020-01-03   24  #define   PIARBCTL_MISC_USB_PRIO=
RITY_MASK		0x000f0000
9d5f51dcdb646c2 Al Cooper 2020-01-03   25  #define   PIARBCTL_MISC_USB_MEM_=
PAGE_MASK		0x0000f000
9d5f51dcdb646c2 Al Cooper 2020-01-03   26  #define   PIARBCTL_MISC_CAM1_MEM=
_PAGE_MASK		0x00000f00
9d5f51dcdb646c2 Al Cooper 2020-01-03   27  #define   PIARBCTL_MISC_CAM0_MEM=
_PAGE_MASK		0x000000f0
9d5f51dcdb646c2 Al Cooper 2020-01-03   28  #define   PIARBCTL_MISC_SATA_PRI=
ORITY_MASK		0x0000000f
9d5f51dcdb646c2 Al Cooper 2020-01-03   29  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   30  #define PIARBCTL_MISC_USB_ONLY_M=
ASK		\
9d5f51dcdb646c2 Al Cooper 2020-01-03   31  	(PIARBCTL_MISC_USB_SELECT_MASK =
|	\
9d5f51dcdb646c2 Al Cooper 2020-01-03   32  	 PIARBCTL_MISC_USB_4G_SDRAM_MAS=
K |	\
9d5f51dcdb646c2 Al Cooper 2020-01-03   33  	 PIARBCTL_MISC_USB_PRIORITY_MAS=
K |	\
9d5f51dcdb646c2 Al Cooper 2020-01-03   34  	 PIARBCTL_MISC_USB_MEM_PAGE_MAS=
K)
9d5f51dcdb646c2 Al Cooper 2020-01-03   35  =

4e5b9c9a73b32d2 Al Cooper 2020-01-03   36  /* Register definitions for the =
USB CTRL block */
4e5b9c9a73b32d2 Al Cooper 2020-01-03   37  #define USB_CTRL_SETUP			0x00
4e5b9c9a73b32d2 Al Cooper 2020-01-03   38  #define   USB_CTRL_SETUP_STRAP_I=
PP_SEL_MASK		0x02000000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   39  #define   USB_CTRL_SETUP_SCB2_EN=
_MASK			0x00008000
9d5f51dcdb646c2 Al Cooper 2020-01-03   40  #define   USB_CTRL_SETUP_tca_drv=
_sel_MASK		0x01000000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   41  #define   USB_CTRL_SETUP_SCB1_EN=
_MASK			0x00004000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   42  #define   USB_CTRL_SETUP_SOFT_SH=
UTDOWN_MASK		0x00000200
4e5b9c9a73b32d2 Al Cooper 2020-01-03   43  #define   USB_CTRL_SETUP_IPP_MAS=
K			0x00000020
4e5b9c9a73b32d2 Al Cooper 2020-01-03   44  #define   USB_CTRL_SETUP_IOC_MAS=
K			0x00000010
4e5b9c9a73b32d2 Al Cooper 2020-01-03   45  #define USB_CTRL_USB_PM			0x04
4e5b9c9a73b32d2 Al Cooper 2020-01-03   46  #define   USB_CTRL_USB_PM_USB_PW=
RDN_MASK		0x80000000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   47  #define   USB_CTRL_USB_PM_SOFT_R=
ESET_MASK		0x40000000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   48  #define   USB_CTRL_USB_PM_BDC_SO=
FT_RESETB_MASK		0x00800000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   49  #define   USB_CTRL_USB_PM_XHC_SO=
FT_RESETB_MASK		0x00400000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   50  #define USB_CTRL_USB_PM_STATUS		=
0x08
4e5b9c9a73b32d2 Al Cooper 2020-01-03   51  #define USB_CTRL_USB_DEVICE_CTL1=
	0x10
4e5b9c9a73b32d2 Al Cooper 2020-01-03   52  #define   USB_CTRL_USB_DEVICE_CT=
L1_PORT_MODE_MASK	0x00000003
b0c0b66c0b432d3 Al Cooper 2020-01-03   53  #define USB_CTRL_TEST_PORT_CTL		=
0x30
b0c0b66c0b432d3 Al Cooper 2020-01-03   54  #define   USB_CTRL_TEST_PORT_CTL=
_TPOUT_SEL_MASK	0x000000ff
b0c0b66c0b432d3 Al Cooper 2020-01-03   55  #define   USB_CTRL_TEST_PORT_CTL=
_TPOUT_SEL_PME_GEN_MASK	0x0000002e
b0c0b66c0b432d3 Al Cooper 2020-01-03   56  #define USB_CTRL_TP_DIAG1		0x34
b0c0b66c0b432d3 Al Cooper 2020-01-03   57  #define   USB_CTLR_TP_DIAG1_wake=
_MASK	0x00000002
b0c0b66c0b432d3 Al Cooper 2020-01-03   58  #define USB_CTRL_CTLR_CSHCR		0x50
b0c0b66c0b432d3 Al Cooper 2020-01-03   59  #define   USB_CTRL_CTLR_CSHCR_ct=
l_pme_en_MASK	0x00040000
4e5b9c9a73b32d2 Al Cooper 2020-01-03   60  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   61  /* Register definitions for the =
USB_PHY block in 7211b0 */
b0c0b66c0b432d3 Al Cooper 2020-01-03   62  #define USB_PHY_PLL_CTL			0x00
b0c0b66c0b432d3 Al Cooper 2020-01-03   63  #define   USB_PHY_PLL_CTL_PLL_RE=
SETB_MASK		0x40000000
9d5f51dcdb646c2 Al Cooper 2020-01-03   64  #define USB_PHY_PLL_LDO_CTL		0x08
9d5f51dcdb646c2 Al Cooper 2020-01-03   65  #define   USB_PHY_PLL_LDO_CTL_AF=
E_CORERDY_MASK		0x00000004
b0c0b66c0b432d3 Al Cooper 2020-01-03   66  #define   USB_PHY_PLL_LDO_CTL_AF=
E_LDO_PWRDWNB_MASK	0x00000002
b0c0b66c0b432d3 Al Cooper 2020-01-03   67  #define   USB_PHY_PLL_LDO_CTL_AF=
E_BG_PWRDWNB_MASK	0x00000001
9d5f51dcdb646c2 Al Cooper 2020-01-03   68  #define USB_PHY_UTMI_CTL_1		0x04
fc430aea0206815 Al Cooper 2020-01-03   69  #define   USB_PHY_UTMI_CTL_1_POW=
ER_UP_FSM_EN_MASK	0x00000800
9d5f51dcdb646c2 Al Cooper 2020-01-03   70  #define   USB_PHY_UTMI_CTL_1_PHY=
_MODE_MASK		0x0000000c
9d5f51dcdb646c2 Al Cooper 2020-01-03   71  #define   USB_PHY_UTMI_CTL_1_PHY=
_MODE_SHIFT		2
b0c0b66c0b432d3 Al Cooper 2020-01-03   72  #define USB_PHY_IDDQ			0x1c
b0c0b66c0b432d3 Al Cooper 2020-01-03   73  #define   USB_PHY_IDDQ_phy_iddq_=
MASK			0x00000001
9d5f51dcdb646c2 Al Cooper 2020-01-03   74  #define USB_PHY_STATUS			0x20
9d5f51dcdb646c2 Al Cooper 2020-01-03   75  #define   USB_PHY_STATUS_pll_loc=
k_MASK			0x00000001
9d5f51dcdb646c2 Al Cooper 2020-01-03   76  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   77  /* Register definitions for the =
MDIO registers in the DWC2 block of
9d5f51dcdb646c2 Al Cooper 2020-01-03   78   * the 7211b0.
9d5f51dcdb646c2 Al Cooper 2020-01-03   79   * NOTE: The PHY's MDIO register=
s are only accessible through the
9d5f51dcdb646c2 Al Cooper 2020-01-03   80   * legacy DesignWare USB control=
ler even though it's not being used.
9d5f51dcdb646c2 Al Cooper 2020-01-03   81   */
9d5f51dcdb646c2 Al Cooper 2020-01-03   82  #define USB_GMDIOCSR	0
9d5f51dcdb646c2 Al Cooper 2020-01-03   83  #define USB_GMDIOGEN	4
9d5f51dcdb646c2 Al Cooper 2020-01-03   84  =

bed63b636fedf47 Al Cooper 2020-01-03   85  /* Register definitions for the =
BDC EC block in 7211b0 */
bed63b636fedf47 Al Cooper 2020-01-03   86  #define BDC_EC_AXIRDA			0x0c
bed63b636fedf47 Al Cooper 2020-01-03   87  #define   BDC_EC_AXIRDA_RTS_MASK=
			0xf0000000
bed63b636fedf47 Al Cooper 2020-01-03   88  #define   BDC_EC_AXIRDA_RTS_SHIF=
T			28
bed63b636fedf47 Al Cooper 2020-01-03   89  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   90  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   91  static void usb_mdio_write_7211b=
0(struct brcm_usb_init_params *params,
9d5f51dcdb646c2 Al Cooper 2020-01-03   92  				  uint8_t addr, uint16_t dat=
a)
9d5f51dcdb646c2 Al Cooper 2020-01-03   93  {
9d5f51dcdb646c2 Al Cooper 2020-01-03   94  	void __iomem *usb_mdio =3D para=
ms->regs[BRCM_REGS_USB_MDIO];
9d5f51dcdb646c2 Al Cooper 2020-01-03   95  =

9d5f51dcdb646c2 Al Cooper 2020-01-03   96  	addr &=3D 0x1f; /* 5-bit addres=
s */
9d5f51dcdb646c2 Al Cooper 2020-01-03   97  	brcm_usb_writel(0xffffffff, usb=
_mdio + USB_GMDIOGEN);
9d5f51dcdb646c2 Al Cooper 2020-01-03  @98  	while (brcm_usb_readl(usb_mdio =
+ USB_GMDIOCSR) & (1<<31))
9d5f51dcdb646c2 Al Cooper 2020-01-03   99  		;
9d5f51dcdb646c2 Al Cooper 2020-01-03  100  	brcm_usb_writel(0x59020000 | (a=
ddr << 18) | data,
9d5f51dcdb646c2 Al Cooper 2020-01-03  101  			usb_mdio + USB_GMDIOGEN);
9d5f51dcdb646c2 Al Cooper 2020-01-03  102  	while (brcm_usb_readl(usb_mdio =
+ USB_GMDIOCSR) & (1<<31))
9d5f51dcdb646c2 Al Cooper 2020-01-03  103  		;
9d5f51dcdb646c2 Al Cooper 2020-01-03  104  	brcm_usb_writel(0x00000000, usb=
_mdio + USB_GMDIOGEN);
9d5f51dcdb646c2 Al Cooper 2020-01-03  105  	while (brcm_usb_readl(usb_mdio =
+ USB_GMDIOCSR) & (1<<31))
9d5f51dcdb646c2 Al Cooper 2020-01-03  106  		;
9d5f51dcdb646c2 Al Cooper 2020-01-03  107  }
9d5f51dcdb646c2 Al Cooper 2020-01-03  108  =


:::::: The code@line 98 was first introduced by commit
:::::: 9d5f51dcdb646c2ed21649d379fbb703994f1ec9 phy: usb: Add support for n=
ew Synopsys USB controller on the 7211b0

:::::: TO: Al Cooper <alcooperx@gmail.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1321957357846366660==--

