Content-Type: multipart/mixed; boundary="===============5218411564827057278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4136/8035] drivers/phy/allwinner/phy-sun6i-mipi-dphy.c:260:8: warning: Signed integer overflow for expression '(255&0xff)<<24'. [integerOverflow]
Date: Tue, 03 May 2022 00:00:51 +0800
Message-ID: <202205022321.xZkOIj91-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5218411564827057278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9f9b9a2972eb8dcaad09d826c5c6d7488eaca3e6
commit: 74d0cd478622c87c1665e19ea9217f298648581d [4136/8035] phy: allwinner=
: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI CSI-2
:::::: branch date: 4 hours ago
:::::: commit date: 12 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 74d0cd478622c87c1665e19ea9217f298648581d
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/phy/allwinner/phy-sun6i-mipi-dphy.c:260:8: warning: Signed integ=
er overflow for expression '(255&0xff)<<24'. [integerOverflow]
          SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(255) |
          ^

vim +260 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c

133add5b5ad42b drivers/gpu/drm/sun4i/sun6i_mipi_dphy.c     Maxime Ripard   =
  2018-04-04  244  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  245  static int sun6i_dphy_rx_power_on(struct sun6i_dphy *dph=
y)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  246  {
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  247  	/* Physical clock rate is actually half of symbol rate =
with DDR. */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  248  	unsigned long mipi_symbol_rate =3D dphy->config.hs_clk_=
rate;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  249  	unsigned long dphy_clk_rate;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  250  	unsigned int rx_dly;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  251  	unsigned int lprst_dly;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  252  	u32 value;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  253  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  254  	dphy_clk_rate =3D clk_get_rate(dphy->mod_clk);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  255  	if (!dphy_clk_rate)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  256  		return -EINVAL;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  257  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  258  	/* Hardcoded timing parameters from the Allwinner BSP. =
*/
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  259  	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME0_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15 @260  		     SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(255) |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  261  		     SUN6I_DPHY_RX_TIME0_HS_RX_CLK_MISS(255) |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  262  		     SUN6I_DPHY_RX_TIME0_LP_RX(255));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  263  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  264  	/*
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  265  	 * Formula from the Allwinner BSP, with hardcoded coeff=
icients
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  266  	 * (probably internal divider/multiplier).
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  267  	 */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  268  	rx_dly =3D 8 * (unsigned int)(dphy_clk_rate / (mipi_sym=
bol_rate / 8));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  269  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  270  	/*
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  271  	 * The Allwinner BSP has an alternative formula for LP_=
RX_ULPS_WP:
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  272  	 * lp_ulps_wp_cnt =3D lp_ulps_wp_ms * lp_clk / 1000
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  273  	 * but does not use it and hardcodes 255 instead.
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  274  	 */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  275  	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME1_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  276  		     SUN6I_DPHY_RX_TIME1_RX_DLY(rx_dly) |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  277  		     SUN6I_DPHY_RX_TIME1_LP_RX_ULPS_WP(255));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  278  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  279  	/* HS_RX_ANA0 value is hardcoded in the Allwinner BSP. =
*/
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  280  	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME2_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  281  		     SUN6I_DPHY_RX_TIME2_HS_RX_ANA0(4));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  282  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  283  	/*
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  284  	 * Formula from the Allwinner BSP, with hardcoded coeff=
icients
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  285  	 * (probably internal divider/multiplier).
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  286  	 */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  287  	lprst_dly =3D 4 * (unsigned int)(dphy_clk_rate / (mipi_=
symbol_rate / 2));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  288  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  289  	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME3_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  290  		     SUN6I_DPHY_RX_TIME3_LPRST_DLY(lprst_dly));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  291  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  292  	/* Analog parameters are hardcoded in the Allwinner BSP=
. */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  293  	regmap_write(dphy->regs, SUN6I_DPHY_ANA0_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  294  		     SUN6I_DPHY_ANA0_REG_PWS |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  295  		     SUN6I_DPHY_ANA0_REG_SLV(7) |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  296  		     SUN6I_DPHY_ANA0_REG_SFB(2));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  297  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  298  	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  299  		     SUN6I_DPHY_ANA1_REG_SVTT(4));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  300  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  301  	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  302  		     SUN6I_DPHY_ANA4_REG_DMPLVC |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  303  		     SUN6I_DPHY_ANA4_REG_DMPLVD(1));
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  304  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  305  	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  306  		     SUN6I_DPHY_ANA2_REG_ENIB);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  307  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  308  	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  309  		     SUN6I_DPHY_ANA3_EN_LDOR |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  310  		     SUN6I_DPHY_ANA3_EN_LDOC |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  311  		     SUN6I_DPHY_ANA3_EN_LDOD);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  312  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  313  	/*
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  314  	 * Delay comes from the Allwinner BSP, likely for inter=
nal regulator
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  315  	 * ramp-up.
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  316  	 */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  317  	udelay(3);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  318  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  319  	value =3D SUN6I_DPHY_RX_CTL_EN_DBC | SUN6I_DPHY_RX_CTL_=
RX_CLK_FORCE;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  320  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  321  	/*
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  322  	 * Rx data lane force-enable bits are used as regular R=
X enable by the
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  323  	 * Allwinner BSP.
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  324  	 */
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  325  	if (dphy->config.lanes >=3D 1)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  326  		value |=3D SUN6I_DPHY_RX_CTL_RX_D0_FORCE;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  327  	if (dphy->config.lanes >=3D 2)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  328  		value |=3D SUN6I_DPHY_RX_CTL_RX_D1_FORCE;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  329  	if (dphy->config.lanes >=3D 3)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  330  		value |=3D SUN6I_DPHY_RX_CTL_RX_D2_FORCE;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  331  	if (dphy->config.lanes =3D=3D 4)
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  332  		value |=3D SUN6I_DPHY_RX_CTL_RX_D3_FORCE;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  333  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  334  	regmap_write(dphy->regs, SUN6I_DPHY_RX_CTL_REG, value);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  335  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  336  	regmap_write(dphy->regs, SUN6I_DPHY_GCTL_REG,
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  337  		     SUN6I_DPHY_GCTL_LANE_NUM(dphy->config.lanes) |
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  338  		     SUN6I_DPHY_GCTL_EN);
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  339  =

74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  340  	return 0;
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  341  }
74d0cd478622c8 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c Paul Kocialkowsk=
i 2022-04-15  342  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5218411564827057278==--

