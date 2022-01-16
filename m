Content-Type: multipart/mixed; boundary="===============3684447342891292184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c:101 visconti_eth_fix_mac_speed() error: uninitialized symbol 'clk_sel_val'.
Date: Mon, 17 Jan 2022 03:01:49 +0800
Message-ID: <202201170216.Q8zMAmz9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3684447342891292184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d66020dcef83314092f2c8c89152a8d122627e2
commit: b38dd98ff8d0d951770bffdca49b387dc63ba92b net: stmmac: Add Toshiba V=
isconti SoCs glue driver
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: nios2-randconfig-m031-20220116 (https://download.01.org/0day-ci/arc=
hive/20220117/202201170216.Q8zMAmz9-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c:101 visconti_eth_fix_m=
ac_speed() error: uninitialized symbol 'clk_sel_val'.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c:104 visconti_eth_fix_m=
ac_speed() error: uninitialized symbol 'clk_sel_val'.
drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c:110 visconti_eth_fix_m=
ac_speed() error: uninitialized symbol 'clk_sel_val'.

vim +/clk_sel_val +101 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   54  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   55  static void visconti_eth_=
fix_mac_speed(void *priv, unsigned int speed)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   56  {
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   57  	struct visconti_eth *dwm=
ac =3D priv;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   58  	unsigned int val, clk_se=
l_val;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   59  	unsigned long flags;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   60  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   61  	spin_lock_irqsave(&dwmac=
->lock, flags);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   62  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   63  	/* adjust link */
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   64  	val =3D readl(dwmac->reg=
 + MAC_CTRL_REG);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   65  	val &=3D ~(GMAC_CONFIG_P=
S | GMAC_CONFIG_FES);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   66  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   67  	switch (speed) {
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   68  	case SPEED_1000:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   69  		if (dwmac->phy_intf_sel=
 =3D=3D ETHER_CONFIG_INTF_RGMII)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   70  			clk_sel_val =3D ETHER_=
CLK_SEL_FREQ_SEL_125M;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   71  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   72  	case SPEED_100:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   73  		if (dwmac->phy_intf_sel=
 =3D=3D ETHER_CONFIG_INTF_RGMII)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   74  			clk_sel_val =3D ETHER_=
CLK_SEL_FREQ_SEL_25M;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   75  		if (dwmac->phy_intf_sel=
 =3D=3D ETHER_CONFIG_INTF_RMII)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   76  			clk_sel_val =3D ETHER_=
CLK_SEL_DIV_SEL_2;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   77  		val |=3D GMAC_CONFIG_PS=
 | GMAC_CONFIG_FES;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   78  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   79  	case SPEED_10:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   80  		if (dwmac->phy_intf_sel=
 =3D=3D ETHER_CONFIG_INTF_RGMII)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   81  			clk_sel_val =3D ETHER_=
CLK_SEL_FREQ_SEL_2P5M;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   82  		if (dwmac->phy_intf_sel=
 =3D=3D ETHER_CONFIG_INTF_RMII)
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   83  			clk_sel_val =3D ETHER_=
CLK_SEL_DIV_SEL_20;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   84  		val |=3D GMAC_CONFIG_PS;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   85  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   86  	default:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   87  		/* No bit control */
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   88  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   89  	}
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   90  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   91  	writel(val, dwmac->reg +=
 MAC_CTRL_REG);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   92  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   93  	/* Stop internal clock */
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   94  	val =3D readl(dwmac->reg=
 + REG_ETHER_CLOCK_SEL);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   95  	val &=3D ~(ETHER_CLK_SEL=
_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   96  	val |=3D ETHER_CLK_SEL_T=
X_O_E_N_IN;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   97  	writel(val, dwmac->reg +=
 REG_ETHER_CLOCK_SEL);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   98  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16   99  	switch (dwmac->phy_intf_=
sel) {
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  100  	case ETHER_CONFIG_INTF_R=
GMII:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16 @101  		val =3D clk_sel_val | E=
THER_CLK_SEL_RX_CLK_EXT_SEL_RXC;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  102  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  103  	case ETHER_CONFIG_INTF_R=
MII:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  104  		val =3D clk_sel_val | E=
THER_CLK_SEL_RX_CLK_EXT_SEL_DIV |
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  105  			ETHER_CLK_SEL_TX_CLK_E=
XT_SEL_TXC | ETHER_CLK_SEL_TX_O_E_N_IN |
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  106  			ETHER_CLK_SEL_RMII_CLK=
_SEL_RX_C;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  107  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  108  	case ETHER_CONFIG_INTF_M=
II:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  109  	default:
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  110  		val =3D clk_sel_val | E=
THER_CLK_SEL_RX_CLK_EXT_SEL_RXC |
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  111  			ETHER_CLK_SEL_TX_CLK_E=
XT_SEL_DIV | ETHER_CLK_SEL_TX_O_E_N_IN |
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  112  			ETHER_CLK_SEL_RMII_CLK=
_EN;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  113  		break;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  114  	}
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  115  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  116  	/* Start clock */
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  117  	writel(val, dwmac->reg +=
 REG_ETHER_CLOCK_SEL);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  118  	val |=3D ETHER_CLK_SEL_R=
X_TX_CLK_EN;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  119  	writel(val, dwmac->reg +=
 REG_ETHER_CLOCK_SEL);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  120  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  121  	val &=3D ~ETHER_CLK_SEL_=
TX_O_E_N_IN;
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  122  	writel(val, dwmac->reg +=
 REG_ETHER_CLOCK_SEL);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  123  =

b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  124  	spin_unlock_irqrestore(&=
dwmac->lock, flags);
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  125  }
b38dd98ff8d0d9 Nobuhiro Iwamatsu 2021-02-16  126  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3684447342891292184==--

