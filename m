Content-Type: multipart/mixed; boundary="===============6961699518016085049=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/imx/clk-imx8ulp.c:71 imx8ulp_clk_cgc1_init() warn: passing zero to 'PTR_ERR'
Date: Sun, 28 Nov 2021 00:21:40 +0800
Message-ID: <202111280047.1v4Y1dhf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6961699518016085049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jacky Bai <ping.bai@nxp.com>
CC: Abel Vesa <abel.vesa@nxp.com>
CC: Peng Fan <peng.fan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: c43a801a57890b15e16a0502edf145d59c91baf7 clk: imx: Add clock driver=
 for imx8ulp
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-m031-20211101 (https://download.01.org/0day-ci/a=
rchive/20211128/202111280047.1v4Y1dhf-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/imx/clk-imx8ulp.c:71 imx8ulp_clk_cgc1_init() warn: passing zero=
 to 'PTR_ERR'
drivers/clk/imx/clk-imx8ulp.c:153 imx8ulp_clk_cgc2_init() warn: passing zer=
o to 'PTR_ERR'
drivers/clk/imx/clk-imx8ulp.c:236 imx8ulp_clk_pcc3_init() warn: passing zer=
o to 'PTR_ERR'
drivers/clk/imx/clk-imx8ulp.c:315 imx8ulp_clk_pcc4_init() warn: passing zer=
o to 'PTR_ERR'
drivers/clk/imx/clk-imx8ulp.c:363 imx8ulp_clk_pcc5_init() warn: passing zer=
o to 'PTR_ERR'

vim +/PTR_ERR +71 drivers/clk/imx/clk-imx8ulp.c

c43a801a57890b Jacky Bai 2021-09-14   50  =

c43a801a57890b Jacky Bai 2021-09-14   51  static int imx8ulp_clk_cgc1_init(=
struct platform_device *pdev)
c43a801a57890b Jacky Bai 2021-09-14   52  {
c43a801a57890b Jacky Bai 2021-09-14   53  	struct device *dev =3D &pdev->de=
v;
c43a801a57890b Jacky Bai 2021-09-14   54  	struct clk_hw_onecell_data *clk_=
data;
c43a801a57890b Jacky Bai 2021-09-14   55  	struct clk_hw **clks;
c43a801a57890b Jacky Bai 2021-09-14   56  	void __iomem *base;
c43a801a57890b Jacky Bai 2021-09-14   57  =

c43a801a57890b Jacky Bai 2021-09-14   58  	clk_data =3D devm_kzalloc(dev, s=
truct_size(clk_data, hws, IMX8ULP_CLK_CGC1_END),
c43a801a57890b Jacky Bai 2021-09-14   59  			   GFP_KERNEL);
c43a801a57890b Jacky Bai 2021-09-14   60  	if (!clk_data)
c43a801a57890b Jacky Bai 2021-09-14   61  		return -ENOMEM;
c43a801a57890b Jacky Bai 2021-09-14   62  =

c43a801a57890b Jacky Bai 2021-09-14   63  	clk_data->num =3D IMX8ULP_CLK_CG=
C1_END;
c43a801a57890b Jacky Bai 2021-09-14   64  	clks =3D clk_data->hws;
c43a801a57890b Jacky Bai 2021-09-14   65  =

c43a801a57890b Jacky Bai 2021-09-14   66  	clks[IMX8ULP_CLK_DUMMY] =3D imx_=
clk_hw_fixed("dummy", 0);
c43a801a57890b Jacky Bai 2021-09-14   67  =

c43a801a57890b Jacky Bai 2021-09-14   68  	/* CGC1 */
c43a801a57890b Jacky Bai 2021-09-14   69  	base =3D devm_platform_ioremap_r=
esource(pdev, 0);
c43a801a57890b Jacky Bai 2021-09-14   70  	if (WARN_ON(IS_ERR(base)))
c43a801a57890b Jacky Bai 2021-09-14  @71  		return PTR_ERR(base);
c43a801a57890b Jacky Bai 2021-09-14   72  =

c43a801a57890b Jacky Bai 2021-09-14   73  	clks[IMX8ULP_CLK_SPLL2_PRE_SEL]	=
=3D imx_clk_hw_mux_flags("spll2_pre_sel", base + 0x510, 0, 1, pll_pre_sels,=
 ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
c43a801a57890b Jacky Bai 2021-09-14   74  	clks[IMX8ULP_CLK_SPLL3_PRE_SEL]	=
=3D imx_clk_hw_mux_flags("spll3_pre_sel", base + 0x610, 0, 1, pll_pre_sels,=
 ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
c43a801a57890b Jacky Bai 2021-09-14   75  =

c43a801a57890b Jacky Bai 2021-09-14   76  	clks[IMX8ULP_CLK_SPLL2] =3D imx_=
clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll2", "spll2_pre_sel", base + 0x500);
c43a801a57890b Jacky Bai 2021-09-14   77  	clks[IMX8ULP_CLK_SPLL3] =3D imx_=
clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll3", "spll3_pre_sel", base + 0x600);
c43a801a57890b Jacky Bai 2021-09-14   78  	clks[IMX8ULP_CLK_SPLL3_VCODIV] =
=3D imx_clk_hw_divider("spll3_vcodiv", "spll3", base + 0x604, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14   79  =

c43a801a57890b Jacky Bai 2021-09-14   80  	clks[IMX8ULP_CLK_SPLL3_PFD0] =3D=
 imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd0", "spll3_vcodiv", base + 0=
x614, 0);
c43a801a57890b Jacky Bai 2021-09-14   81  	clks[IMX8ULP_CLK_SPLL3_PFD1] =3D=
 imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd1", "spll3_vcodiv", base + 0=
x614, 1);
c43a801a57890b Jacky Bai 2021-09-14   82  	clks[IMX8ULP_CLK_SPLL3_PFD2] =3D=
 imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd2", "spll3_vcodiv", base + 0=
x614, 2);
c43a801a57890b Jacky Bai 2021-09-14   83  	clks[IMX8ULP_CLK_SPLL3_PFD3] =3D=
 imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd3", "spll3_vcodiv", base + 0=
x614, 3);
c43a801a57890b Jacky Bai 2021-09-14   84  =

c43a801a57890b Jacky Bai 2021-09-14   85  	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV1=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd0_div1_gate", "spll3_pfd0", base +=
 0x608, 7);
c43a801a57890b Jacky Bai 2021-09-14   86  	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV2=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd0_div2_gate", "spll3_pfd0", base +=
 0x608, 15);
c43a801a57890b Jacky Bai 2021-09-14   87  	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV1=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd1_div1_gate", "spll3_pfd1", base +=
 0x608, 23);
c43a801a57890b Jacky Bai 2021-09-14   88  	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV2=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd1_div2_gate", "spll3_pfd1", base +=
 0x608, 31);
c43a801a57890b Jacky Bai 2021-09-14   89  	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV1=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd2_div1_gate", "spll3_pfd2", base +=
 0x60c, 7);
c43a801a57890b Jacky Bai 2021-09-14   90  	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV2=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd2_div2_gate", "spll3_pfd2", base +=
 0x60c, 15);
c43a801a57890b Jacky Bai 2021-09-14   91  	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV1=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd3_div1_gate", "spll3_pfd3", base +=
 0x60c, 23);
c43a801a57890b Jacky Bai 2021-09-14   92  	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV2=
_GATE] =3D imx_clk_hw_gate_dis("spll3_pfd3_div2_gate", "spll3_pfd3", base +=
 0x60c, 31);
c43a801a57890b Jacky Bai 2021-09-14   93  	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV1=
] =3D imx_clk_hw_divider("spll3_pfd0_div1", "spll3_pfd0_div1_gate", base + =
0x608, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14   94  	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV2=
] =3D imx_clk_hw_divider("spll3_pfd0_div2", "spll3_pfd0_div2_gate", base + =
0x608, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14   95  	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV1=
] =3D imx_clk_hw_divider("spll3_pfd1_div1", "spll3_pfd1_div1_gate", base + =
0x608, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14   96  	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV2=
] =3D imx_clk_hw_divider("spll3_pfd1_div2", "spll3_pfd1_div2_gate", base + =
0x608, 24, 6);
c43a801a57890b Jacky Bai 2021-09-14   97  	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV1=
] =3D imx_clk_hw_divider("spll3_pfd2_div1", "spll3_pfd2_div1_gate", base + =
0x60c, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14   98  	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV2=
] =3D imx_clk_hw_divider("spll3_pfd2_div2", "spll3_pfd2_div2_gate", base + =
0x60c, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14   99  	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV1=
] =3D imx_clk_hw_divider("spll3_pfd3_div1", "spll3_pfd3_div1_gate", base + =
0x60c, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  100  	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV2=
] =3D imx_clk_hw_divider("spll3_pfd3_div2", "spll3_pfd3_div2_gate", base + =
0x60c, 24, 6);
c43a801a57890b Jacky Bai 2021-09-14  101  =

c43a801a57890b Jacky Bai 2021-09-14  102  	clks[IMX8ULP_CLK_A35_SEL] =3D im=
x_clk_hw_mux2("a35_sel", base + 0x14, 28, 2, a35_sels, ARRAY_SIZE(a35_sels)=
);
c43a801a57890b Jacky Bai 2021-09-14  103  	clks[IMX8ULP_CLK_A35_DIV] =3D im=
x_clk_hw_divider_flags("a35_div", "a35_sel", base + 0x14, 21, 6, CLK_SET_RA=
TE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  104  =

c43a801a57890b Jacky Bai 2021-09-14  105  	clks[IMX8ULP_CLK_NIC_SEL] =3D im=
x_clk_hw_mux2("nic_sel", base + 0x34, 28, 2, nic_sels, ARRAY_SIZE(nic_sels)=
);
c43a801a57890b Jacky Bai 2021-09-14  106  	clks[IMX8ULP_CLK_NIC_AD_DIVPLAT]=
 =3D imx_clk_hw_divider_flags("nic_ad_divplat", "nic_sel", base + 0x34, 21,=
 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  107  	clks[IMX8ULP_CLK_NIC_PER_DIVPLAT=
] =3D imx_clk_hw_divider_flags("nic_per_divplat", "nic_ad_divplat", base + =
0x34, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  108  	clks[IMX8ULP_CLK_XBAR_AD_DIVPLAT=
] =3D imx_clk_hw_divider_flags("xbar_ad_divplat", "nic_ad_divplat", base + =
0x38, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  109  	clks[IMX8ULP_CLK_XBAR_DIVBUS] =
=3D imx_clk_hw_divider_flags("xbar_divbus", "nic_ad_divplat", base + 0x38, =
7, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  110  	clks[IMX8ULP_CLK_XBAR_AD_SLOW] =
=3D imx_clk_hw_divider_flags("xbar_ad_slow", "nic_ad_divplat", base + 0x38,=
 0, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  111  =

c43a801a57890b Jacky Bai 2021-09-14  112  	clks[IMX8ULP_CLK_SOSC_DIV1_GATE]=
 =3D imx_clk_hw_gate_dis("sosc_div1_gate", "sosc", base + 0x108, 7);
c43a801a57890b Jacky Bai 2021-09-14  113  	clks[IMX8ULP_CLK_SOSC_DIV2_GATE]=
 =3D imx_clk_hw_gate_dis("sosc_div2_gate", "sosc", base + 0x108, 15);
c43a801a57890b Jacky Bai 2021-09-14  114  	clks[IMX8ULP_CLK_SOSC_DIV3_GATE]=
 =3D imx_clk_hw_gate_dis("sosc_div3_gate", "sosc", base + 0x108, 23);
c43a801a57890b Jacky Bai 2021-09-14  115  	clks[IMX8ULP_CLK_SOSC_DIV1] =3D =
imx_clk_hw_divider("sosc_div1", "sosc_div1_gate", base + 0x108, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  116  	clks[IMX8ULP_CLK_SOSC_DIV2] =3D =
imx_clk_hw_divider("sosc_div2", "sosc_div2_gate", base + 0x108, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  117  	clks[IMX8ULP_CLK_SOSC_DIV3] =3D =
imx_clk_hw_divider("sosc_div3", "sosc_div3_gate", base + 0x108, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  118  =

c43a801a57890b Jacky Bai 2021-09-14  119  	clks[IMX8ULP_CLK_FROSC_DIV1_GATE=
] =3D imx_clk_hw_gate_dis("frosc_div1_gate", "frosc", base + 0x208, 7);
c43a801a57890b Jacky Bai 2021-09-14  120  	clks[IMX8ULP_CLK_FROSC_DIV2_GATE=
] =3D imx_clk_hw_gate_dis("frosc_div2_gate", "frosc", base + 0x208, 15);
c43a801a57890b Jacky Bai 2021-09-14  121  	clks[IMX8ULP_CLK_FROSC_DIV3_GATE=
] =3D imx_clk_hw_gate_dis("frosc_div3_gate", "frosc", base + 0x208, 23);
c43a801a57890b Jacky Bai 2021-09-14  122  	clks[IMX8ULP_CLK_FROSC_DIV1] =3D=
 imx_clk_hw_divider("frosc_div1", "frosc_div1_gate", base + 0x208, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  123  	clks[IMX8ULP_CLK_FROSC_DIV2] =3D=
 imx_clk_hw_divider("frosc_div2", "frosc_div2_gate", base + 0x208, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  124  	clks[IMX8ULP_CLK_FROSC_DIV3] =3D=
 imx_clk_hw_divider("frosc_div3", "frosc_div3_gate", base + 0x208, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  125  	clks[IMX8ULP_CLK_AUD_CLK1] =3D i=
mx_clk_hw_mux2("aud_clk1", base + 0x900, 0, 3, aud_clk1_sels, ARRAY_SIZE(au=
d_clk1_sels));
c43a801a57890b Jacky Bai 2021-09-14  126  	clks[IMX8ULP_CLK_SAI4_SEL] =3D i=
mx_clk_hw_mux2("sai4_sel", base + 0x904, 0, 2, sai45_sels, ARRAY_SIZE(sai45=
_sels));
c43a801a57890b Jacky Bai 2021-09-14  127  	clks[IMX8ULP_CLK_SAI5_SEL] =3D i=
mx_clk_hw_mux2("sai5_sel", base + 0x904, 8, 2, sai45_sels, ARRAY_SIZE(sai45=
_sels));
c43a801a57890b Jacky Bai 2021-09-14  128  	clks[IMX8ULP_CLK_ENET_TS_SEL] =
=3D imx_clk_hw_mux2("enet_ts", base + 0x700, 24, 3, enet_ts_sels, ARRAY_SIZ=
E(enet_ts_sels));
c43a801a57890b Jacky Bai 2021-09-14  129  =

c43a801a57890b Jacky Bai 2021-09-14  130  	imx_check_clk_hws(clks, clk_data=
->num);
c43a801a57890b Jacky Bai 2021-09-14  131  =

c43a801a57890b Jacky Bai 2021-09-14  132  	return devm_of_clk_add_hw_provid=
er(dev, of_clk_hw_onecell_get, clk_data);
c43a801a57890b Jacky Bai 2021-09-14  133  }
c43a801a57890b Jacky Bai 2021-09-14  134  =

c43a801a57890b Jacky Bai 2021-09-14  135  static int imx8ulp_clk_cgc2_init(=
struct platform_device *pdev)
c43a801a57890b Jacky Bai 2021-09-14  136  {
c43a801a57890b Jacky Bai 2021-09-14  137  	struct device *dev =3D &pdev->de=
v;
c43a801a57890b Jacky Bai 2021-09-14  138  	struct clk_hw_onecell_data *clk_=
data;
c43a801a57890b Jacky Bai 2021-09-14  139  	struct clk_hw **clks;
c43a801a57890b Jacky Bai 2021-09-14  140  	void __iomem *base;
c43a801a57890b Jacky Bai 2021-09-14  141  =

c43a801a57890b Jacky Bai 2021-09-14  142  	clk_data =3D devm_kzalloc(dev, s=
truct_size(clk_data, hws, IMX8ULP_CLK_CGC2_END),
c43a801a57890b Jacky Bai 2021-09-14  143  			   GFP_KERNEL);
c43a801a57890b Jacky Bai 2021-09-14  144  	if (!clk_data)
c43a801a57890b Jacky Bai 2021-09-14  145  		return -ENOMEM;
c43a801a57890b Jacky Bai 2021-09-14  146  =

c43a801a57890b Jacky Bai 2021-09-14  147  	clk_data->num =3D IMX8ULP_CLK_CG=
C2_END;
c43a801a57890b Jacky Bai 2021-09-14  148  	clks =3D clk_data->hws;
c43a801a57890b Jacky Bai 2021-09-14  149  =

c43a801a57890b Jacky Bai 2021-09-14  150  	/* CGC2 */
c43a801a57890b Jacky Bai 2021-09-14  151  	base =3D devm_platform_ioremap_r=
esource(pdev, 0);
c43a801a57890b Jacky Bai 2021-09-14  152  	if (WARN_ON(IS_ERR(base)))
c43a801a57890b Jacky Bai 2021-09-14 @153  		return PTR_ERR(base);
c43a801a57890b Jacky Bai 2021-09-14  154  =

c43a801a57890b Jacky Bai 2021-09-14  155  	clks[IMX8ULP_CLK_PLL4_PRE_SEL] =
=3D imx_clk_hw_mux_flags("pll4_pre_sel", base + 0x610, 0, 1, pll_pre_sels, =
ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
c43a801a57890b Jacky Bai 2021-09-14  156  =

c43a801a57890b Jacky Bai 2021-09-14  157  	clks[IMX8ULP_CLK_PLL4]	=3D imx_c=
lk_hw_pllv4(IMX_PLLV4_IMX8ULP, "pll4", "pll4_pre_sel", base + 0x600);
c43a801a57890b Jacky Bai 2021-09-14  158  	clks[IMX8ULP_CLK_PLL4_VCODIV] =
=3D imx_clk_hw_divider("pll4_vcodiv", "pll4", base + 0x604, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  159  =

c43a801a57890b Jacky Bai 2021-09-14  160  	clks[IMX8ULP_CLK_HIFI_SEL] =3D i=
mx_clk_hw_mux_flags("hifi_sel", base + 0x14, 28, 3, hifi_sels, ARRAY_SIZE(h=
ifi_sels), CLK_SET_PARENT_GATE);
c43a801a57890b Jacky Bai 2021-09-14  161  	clks[IMX8ULP_CLK_HIFI_DIVCORE] =
=3D imx_clk_hw_divider("hifi_core_div", "hifi_sel", base + 0x14, 21, 6);
c43a801a57890b Jacky Bai 2021-09-14  162  	clks[IMX8ULP_CLK_HIFI_DIVPLAT] =
=3D imx_clk_hw_divider("hifi_plat_div", "hifi_core_div", base + 0x14, 14, 6=
);
c43a801a57890b Jacky Bai 2021-09-14  163  =

c43a801a57890b Jacky Bai 2021-09-14  164  	clks[IMX8ULP_CLK_DDR_SEL] =3D im=
x_clk_hw_mux_flags("ddr_sel", base + 0x40, 28, 3, ddr_sels, ARRAY_SIZE(ddr_=
sels), CLK_SET_PARENT_GATE);
c43a801a57890b Jacky Bai 2021-09-14  165  	clks[IMX8ULP_CLK_DDR_DIV] =3D im=
x_clk_hw_divider_flags("ddr_div", "ddr_sel", base + 0x40, 21, 6, CLK_IS_CRI=
TICAL);
c43a801a57890b Jacky Bai 2021-09-14  166  	clks[IMX8ULP_CLK_LPAV_AXI_SEL] =
=3D imx_clk_hw_mux("lpav_sel", base + 0x3c, 28, 2, lpav_sels, ARRAY_SIZE(lp=
av_sels));
c43a801a57890b Jacky Bai 2021-09-14  167  	clks[IMX8ULP_CLK_LPAV_AXI_DIV] =
=3D imx_clk_hw_divider_flags("lpav_axi_div", "lpav_sel", base + 0x3c, 21, 6=
, CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  168  	clks[IMX8ULP_CLK_LPAV_AHB_DIV] =
=3D imx_clk_hw_divider_flags("lpav_ahb_div", "lpav_axi_div", base + 0x3c, 1=
4, 6, CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  169  	clks[IMX8ULP_CLK_LPAV_BUS_DIV] =
=3D imx_clk_hw_divider_flags("lpav_bus_div", "lpav_axi_div", base + 0x3c, 7=
, 6, CLK_IS_CRITICAL);
c43a801a57890b Jacky Bai 2021-09-14  170  =

c43a801a57890b Jacky Bai 2021-09-14  171  	clks[IMX8ULP_CLK_PLL4_PFD0] =3D =
imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd0", "pll4_vcodiv", base + 0x61=
4, 0);
c43a801a57890b Jacky Bai 2021-09-14  172  	clks[IMX8ULP_CLK_PLL4_PFD1] =3D =
imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd1", "pll4_vcodiv", base + 0x61=
4, 1);
c43a801a57890b Jacky Bai 2021-09-14  173  	clks[IMX8ULP_CLK_PLL4_PFD2] =3D =
imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd2", "pll4_vcodiv", base + 0x61=
4, 2);
c43a801a57890b Jacky Bai 2021-09-14  174  	clks[IMX8ULP_CLK_PLL4_PFD3] =3D =
imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd3", "pll4_vcodiv", base + 0x61=
4, 3);
c43a801a57890b Jacky Bai 2021-09-14  175  =

c43a801a57890b Jacky Bai 2021-09-14  176  	clks[IMX8ULP_CLK_PLL4_PFD0_DIV1_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd0_div1_gate", "pll4_pfd0", base + 0x=
608, 7);
c43a801a57890b Jacky Bai 2021-09-14  177  	clks[IMX8ULP_CLK_PLL4_PFD0_DIV2_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd0_div2_gate", "pll4_pfd0", base + 0x=
608, 15);
c43a801a57890b Jacky Bai 2021-09-14  178  	clks[IMX8ULP_CLK_PLL4_PFD1_DIV1_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd1_div1_gate", "pll4_pfd1", base + 0x=
608, 23);
c43a801a57890b Jacky Bai 2021-09-14  179  	clks[IMX8ULP_CLK_PLL4_PFD1_DIV2_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd1_div2_gate", "pll4_pfd1", base + 0x=
608, 31);
c43a801a57890b Jacky Bai 2021-09-14  180  	clks[IMX8ULP_CLK_PLL4_PFD2_DIV1_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd2_div1_gate", "pll4_pfd2", base + 0x=
60c, 7);
c43a801a57890b Jacky Bai 2021-09-14  181  	clks[IMX8ULP_CLK_PLL4_PFD2_DIV2_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd2_div2_gate", "pll4_pfd2", base + 0x=
60c, 15);
c43a801a57890b Jacky Bai 2021-09-14  182  	clks[IMX8ULP_CLK_PLL4_PFD3_DIV1_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd3_div1_gate", "pll4_pfd3", base + 0x=
60c, 23);
c43a801a57890b Jacky Bai 2021-09-14  183  	clks[IMX8ULP_CLK_PLL4_PFD3_DIV2_=
GATE] =3D imx_clk_hw_gate_dis("pll4_pfd3_div2_gate", "pll4_pfd3", base + 0x=
60c, 31);
c43a801a57890b Jacky Bai 2021-09-14  184  	clks[IMX8ULP_CLK_PLL4_PFD0_DIV1]=
 =3D imx_clk_hw_divider("pll4_pfd0_div1", "pll4_pfd0_div1_gate", base + 0x6=
08, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  185  	clks[IMX8ULP_CLK_PLL4_PFD0_DIV2]=
 =3D imx_clk_hw_divider("pll4_pfd0_div2", "pll4_pfd0_div2_gate", base + 0x6=
08, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  186  	clks[IMX8ULP_CLK_PLL4_PFD1_DIV1]=
 =3D imx_clk_hw_divider("pll4_pfd1_div1", "pll4_pfd1_div1_gate", base + 0x6=
08, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  187  	clks[IMX8ULP_CLK_PLL4_PFD1_DIV2]=
 =3D imx_clk_hw_divider("pll4_pfd1_div2", "pll4_pfd1_div2_gate", base + 0x6=
08, 24, 6);
c43a801a57890b Jacky Bai 2021-09-14  188  	clks[IMX8ULP_CLK_PLL4_PFD2_DIV1]=
 =3D imx_clk_hw_divider("pll4_pfd2_div1", "pll4_pfd2_div1_gate", base + 0x6=
0c, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  189  	clks[IMX8ULP_CLK_PLL4_PFD2_DIV2]=
 =3D imx_clk_hw_divider("pll4_pfd2_div2", "pll4_pfd2_div2_gate", base + 0x6=
0c, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  190  	clks[IMX8ULP_CLK_PLL4_PFD3_DIV1]=
 =3D imx_clk_hw_divider("pll4_pfd3_div1", "pll4_pfd3_div1_gate", base + 0x6=
0c, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  191  	clks[IMX8ULP_CLK_PLL4_PFD3_DIV2]=
 =3D imx_clk_hw_divider("pll4_pfd3_div2", "pll4_pfd3_div2_gate", base + 0x6=
0c, 24, 6);
c43a801a57890b Jacky Bai 2021-09-14  192  =

c43a801a57890b Jacky Bai 2021-09-14  193  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV1_=
GATE] =3D imx_clk_hw_gate_dis("cgc2_sosc_div1_gate", "sosc", base + 0x108, =
7);
c43a801a57890b Jacky Bai 2021-09-14  194  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV2_=
GATE] =3D imx_clk_hw_gate_dis("cgc2_sosc_div2_gate", "sosc", base + 0x108, =
15);
c43a801a57890b Jacky Bai 2021-09-14  195  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV3_=
GATE] =3D imx_clk_hw_gate_dis("cgc2_sosc_div3_gate", "sosc", base + 0x108, =
23);
c43a801a57890b Jacky Bai 2021-09-14  196  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV1]=
 =3D imx_clk_hw_divider("cgc2_sosc_div1", "cgc2_sosc_div1_gate", base + 0x1=
08, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  197  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV2]=
 =3D imx_clk_hw_divider("cgc2_sosc_div2", "cgc2_sosc_div2_gate", base + 0x1=
08, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  198  	clks[IMX8ULP_CLK_CGC2_SOSC_DIV3]=
 =3D imx_clk_hw_divider("cgc2_sosc_div3", "cgc2_sosc_div3_gate", base + 0x1=
08, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  199  =

c43a801a57890b Jacky Bai 2021-09-14  200  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV1=
_GATE] =3D imx_clk_hw_gate_dis("cgc2_frosc_div1_gate", "frosc", base + 0x20=
8, 7);
c43a801a57890b Jacky Bai 2021-09-14  201  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV2=
_GATE] =3D imx_clk_hw_gate_dis("cgc2_frosc_div2_gate", "frosc", base + 0x20=
8, 15);
c43a801a57890b Jacky Bai 2021-09-14  202  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV3=
_GATE] =3D imx_clk_hw_gate_dis("cgc2_frosc_div3_gate", "frosc", base + 0x20=
8, 23);
c43a801a57890b Jacky Bai 2021-09-14  203  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV1=
] =3D imx_clk_hw_divider("cgc2_frosc_div1", "cgc2_frosc_div1_gate", base + =
0x208, 0, 6);
c43a801a57890b Jacky Bai 2021-09-14  204  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV2=
] =3D imx_clk_hw_divider("cgc2_frosc_div2", "cgc2_frosc_div2_gate", base + =
0x208, 8, 6);
c43a801a57890b Jacky Bai 2021-09-14  205  	clks[IMX8ULP_CLK_CGC2_FROSC_DIV3=
] =3D imx_clk_hw_divider("cgc2_frosc_div3", "cgc2_frosc_div3_gate", base + =
0x208, 16, 6);
c43a801a57890b Jacky Bai 2021-09-14  206  	clks[IMX8ULP_CLK_AUD_CLK2]  =3D =
imx_clk_hw_mux2("aud_clk2", base + 0x900, 0, 3, aud_clk2_sels, ARRAY_SIZE(a=
ud_clk2_sels));
c43a801a57890b Jacky Bai 2021-09-14  207  	clks[IMX8ULP_CLK_SAI6_SEL]  =3D =
imx_clk_hw_mux2("sai6_sel", base + 0x904, 0, 3, sai67_sels, ARRAY_SIZE(sai6=
7_sels));
c43a801a57890b Jacky Bai 2021-09-14  208  	clks[IMX8ULP_CLK_SAI7_SEL]  =3D =
imx_clk_hw_mux2("sai7_sel", base + 0x904, 8, 3, sai67_sels, ARRAY_SIZE(sai6=
7_sels));
c43a801a57890b Jacky Bai 2021-09-14  209  	clks[IMX8ULP_CLK_SPDIF_SEL] =3D =
imx_clk_hw_mux2("spdif_sel", base + 0x910, 0, 3, sai67_sels, ARRAY_SIZE(sai=
67_sels));
c43a801a57890b Jacky Bai 2021-09-14  210  	clks[IMX8ULP_CLK_DSI_PHY_REF] =
=3D imx_clk_hw_fixed("dsi_phy_ref", 24000000);
c43a801a57890b Jacky Bai 2021-09-14  211  =

c43a801a57890b Jacky Bai 2021-09-14  212  	imx_check_clk_hws(clks, clk_data=
->num);
c43a801a57890b Jacky Bai 2021-09-14  213  =

c43a801a57890b Jacky Bai 2021-09-14  214  	return devm_of_clk_add_hw_provid=
er(dev, of_clk_hw_onecell_get, clk_data);
c43a801a57890b Jacky Bai 2021-09-14  215  }
c43a801a57890b Jacky Bai 2021-09-14  216  =

c43a801a57890b Jacky Bai 2021-09-14  217  static int imx8ulp_clk_pcc3_init(=
struct platform_device *pdev)
c43a801a57890b Jacky Bai 2021-09-14  218  {
c43a801a57890b Jacky Bai 2021-09-14  219  	struct device *dev =3D &pdev->de=
v;
c43a801a57890b Jacky Bai 2021-09-14  220  	struct clk_hw_onecell_data *clk_=
data;
c43a801a57890b Jacky Bai 2021-09-14  221  	struct clk_hw **clks;
c43a801a57890b Jacky Bai 2021-09-14  222  	void __iomem *base;
c43a801a57890b Jacky Bai 2021-09-14  223  	int ret;
c43a801a57890b Jacky Bai 2021-09-14  224  =

c43a801a57890b Jacky Bai 2021-09-14  225  	clk_data =3D devm_kzalloc(dev, s=
truct_size(clk_data, hws, IMX8ULP_CLK_PCC3_END),
c43a801a57890b Jacky Bai 2021-09-14  226  			   GFP_KERNEL);
c43a801a57890b Jacky Bai 2021-09-14  227  	if (!clk_data)
c43a801a57890b Jacky Bai 2021-09-14  228  		return -ENOMEM;
c43a801a57890b Jacky Bai 2021-09-14  229  =

c43a801a57890b Jacky Bai 2021-09-14  230  	clk_data->num =3D IMX8ULP_CLK_PC=
C3_END;
c43a801a57890b Jacky Bai 2021-09-14  231  	clks =3D clk_data->hws;
c43a801a57890b Jacky Bai 2021-09-14  232  =

c43a801a57890b Jacky Bai 2021-09-14  233  	/* PCC3 */
c43a801a57890b Jacky Bai 2021-09-14  234  	base =3D devm_platform_ioremap_r=
esource(pdev, 0);
c43a801a57890b Jacky Bai 2021-09-14  235  	if (WARN_ON(IS_ERR(base)))
c43a801a57890b Jacky Bai 2021-09-14 @236  		return PTR_ERR(base);
c43a801a57890b Jacky Bai 2021-09-14  237  =

c43a801a57890b Jacky Bai 2021-09-14  238  	clks[IMX8ULP_CLK_WDOG3] =3D imx8=
ulp_clk_hw_composite("wdog3", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_=
bus_sels), true, true, true, base + 0xa8, 1);
c43a801a57890b Jacky Bai 2021-09-14  239  	clks[IMX8ULP_CLK_WDOG4] =3D imx8=
ulp_clk_hw_composite("wdog4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_=
bus_sels), true, true, true, base + 0xac, 1);
c43a801a57890b Jacky Bai 2021-09-14  240  	clks[IMX8ULP_CLK_LPIT1] =3D imx8=
ulp_clk_hw_composite("lpit1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_=
bus_sels), true, true, true, base + 0xc8, 1);
c43a801a57890b Jacky Bai 2021-09-14  241  	clks[IMX8ULP_CLK_TPM4] =3D imx8u=
lp_clk_hw_composite("tpm4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bu=
s_sels), true, true, true, base + 0xcc, 1);
c43a801a57890b Jacky Bai 2021-09-14  242  	clks[IMX8ULP_CLK_TPM5] =3D imx8u=
lp_clk_hw_composite("tpm5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bu=
s_sels), true, true, true, base + 0xd0, 1);
c43a801a57890b Jacky Bai 2021-09-14  243  	clks[IMX8ULP_CLK_FLEXIO1] =3D im=
x8ulp_clk_hw_composite("flexio1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_per=
iph_bus_sels), true, true, true, base + 0xd4, 1);
c43a801a57890b Jacky Bai 2021-09-14  244  	clks[IMX8ULP_CLK_I3C2] =3D imx8u=
lp_clk_hw_composite("i3c2", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bu=
s_sels), true, true, true, base + 0xd8, 1);
c43a801a57890b Jacky Bai 2021-09-14  245  	clks[IMX8ULP_CLK_LPI2C4] =3D imx=
8ulp_clk_hw_composite("lpi2c4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_perip=
h_bus_sels), true, true, true, base + 0xdc, 1);
c43a801a57890b Jacky Bai 2021-09-14  246  	clks[IMX8ULP_CLK_LPI2C5] =3D imx=
8ulp_clk_hw_composite("lpi2c5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_perip=
h_bus_sels), true, true, true, base + 0xe0, 1);
c43a801a57890b Jacky Bai 2021-09-14  247  	clks[IMX8ULP_CLK_LPUART4] =3D im=
x8ulp_clk_hw_composite("lpuart4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_per=
iph_bus_sels), true, true, true, base + 0xe4, 1);
c43a801a57890b Jacky Bai 2021-09-14  248  	clks[IMX8ULP_CLK_LPUART5] =3D im=
x8ulp_clk_hw_composite("lpuart5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_per=
iph_bus_sels), true, true, true, base + 0xe8, 1);
c43a801a57890b Jacky Bai 2021-09-14  249  	clks[IMX8ULP_CLK_LPSPI4] =3D imx=
8ulp_clk_hw_composite("lpspi4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_perip=
h_bus_sels), true, true, true, base + 0xec, 1);
c43a801a57890b Jacky Bai 2021-09-14  250  	clks[IMX8ULP_CLK_LPSPI5] =3D imx=
8ulp_clk_hw_composite("lpspi5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_perip=
h_bus_sels), true, true, true, base + 0xf0, 1);
c43a801a57890b Jacky Bai 2021-09-14  251  =

c43a801a57890b Jacky Bai 2021-09-14  252  	clks[IMX8ULP_CLK_DMA1_MP] =3D im=
x_clk_hw_gate("pcc_dma1_mp", "xbar_ad_divplat", base + 0x4, 30);
c43a801a57890b Jacky Bai 2021-09-14  253  	clks[IMX8ULP_CLK_DMA1_CH0] =3D i=
mx_clk_hw_gate("pcc_dma1_ch0", "xbar_ad_divplat", base + 0x8, 30);
c43a801a57890b Jacky Bai 2021-09-14  254  	clks[IMX8ULP_CLK_DMA1_CH1] =3D i=
mx_clk_hw_gate("pcc_dma1_ch1", "xbar_ad_divplat", base + 0xc, 30);
c43a801a57890b Jacky Bai 2021-09-14  255  	clks[IMX8ULP_CLK_DMA1_CH2] =3D i=
mx_clk_hw_gate("pcc_dma1_ch2", "xbar_ad_divplat", base + 0x10, 30);
c43a801a57890b Jacky Bai 2021-09-14  256  	clks[IMX8ULP_CLK_DMA1_CH3] =3D i=
mx_clk_hw_gate("pcc_dma1_ch3", "xbar_ad_divplat", base + 0x14, 30);
c43a801a57890b Jacky Bai 2021-09-14  257  	clks[IMX8ULP_CLK_DMA1_CH4] =3D i=
mx_clk_hw_gate("pcc_dma1_ch4", "xbar_ad_divplat", base + 0x18, 30);
c43a801a57890b Jacky Bai 2021-09-14  258  	clks[IMX8ULP_CLK_DMA1_CH5] =3D i=
mx_clk_hw_gate("pcc_dma1_ch5", "xbar_ad_divplat", base + 0x1c, 30);
c43a801a57890b Jacky Bai 2021-09-14  259  	clks[IMX8ULP_CLK_DMA1_CH6] =3D i=
mx_clk_hw_gate("pcc_dma1_ch6", "xbar_ad_divplat", base + 0x20, 30);
c43a801a57890b Jacky Bai 2021-09-14  260  	clks[IMX8ULP_CLK_DMA1_CH7] =3D i=
mx_clk_hw_gate("pcc_dma1_ch7", "xbar_ad_divplat", base + 0x24, 30);
c43a801a57890b Jacky Bai 2021-09-14  261  	clks[IMX8ULP_CLK_DMA1_CH8] =3D i=
mx_clk_hw_gate("pcc_dma1_ch8", "xbar_ad_divplat", base + 0x28, 30);
c43a801a57890b Jacky Bai 2021-09-14  262  	clks[IMX8ULP_CLK_DMA1_CH9] =3D i=
mx_clk_hw_gate("pcc_dma1_ch9", "xbar_ad_divplat", base + 0x2c, 30);
c43a801a57890b Jacky Bai 2021-09-14  263  	clks[IMX8ULP_CLK_DMA1_CH10] =3D =
imx_clk_hw_gate("pcc_dma1_ch10", "xbar_ad_divplat", base + 0x30, 30);
c43a801a57890b Jacky Bai 2021-09-14  264  	clks[IMX8ULP_CLK_DMA1_CH11] =3D =
imx_clk_hw_gate("pcc_dma1_ch11", "xbar_ad_divplat", base + 0x34, 30);
c43a801a57890b Jacky Bai 2021-09-14  265  	clks[IMX8ULP_CLK_DMA1_CH12] =3D =
imx_clk_hw_gate("pcc_dma1_ch12", "xbar_ad_divplat", base + 0x38, 30);
c43a801a57890b Jacky Bai 2021-09-14  266  	clks[IMX8ULP_CLK_DMA1_CH13] =3D =
imx_clk_hw_gate("pcc_dma1_ch13", "xbar_ad_divplat", base + 0x3c, 30);
c43a801a57890b Jacky Bai 2021-09-14  267  	clks[IMX8ULP_CLK_DMA1_CH14] =3D =
imx_clk_hw_gate("pcc_dma1_ch14", "xbar_ad_divplat", base + 0x40, 30);
c43a801a57890b Jacky Bai 2021-09-14  268  	clks[IMX8ULP_CLK_DMA1_CH15] =3D =
imx_clk_hw_gate("pcc_dma1_ch15", "xbar_ad_divplat", base + 0x44, 30);
c43a801a57890b Jacky Bai 2021-09-14  269  	clks[IMX8ULP_CLK_DMA1_CH16] =3D =
imx_clk_hw_gate("pcc_dma1_ch16", "xbar_ad_divplat", base + 0x48, 30);
c43a801a57890b Jacky Bai 2021-09-14  270  	clks[IMX8ULP_CLK_DMA1_CH17] =3D =
imx_clk_hw_gate("pcc_dma1_ch17", "xbar_ad_divplat", base + 0x4c, 30);
c43a801a57890b Jacky Bai 2021-09-14  271  	clks[IMX8ULP_CLK_DMA1_CH18] =3D =
imx_clk_hw_gate("pcc_dma1_ch18", "xbar_ad_divplat", base + 0x50, 30);
c43a801a57890b Jacky Bai 2021-09-14  272  	clks[IMX8ULP_CLK_DMA1_CH19] =3D =
imx_clk_hw_gate("pcc_dma1_ch19", "xbar_ad_divplat", base + 0x54, 30);
c43a801a57890b Jacky Bai 2021-09-14  273  	clks[IMX8ULP_CLK_DMA1_CH20] =3D =
imx_clk_hw_gate("pcc_dma1_ch20", "xbar_ad_divplat", base + 0x58, 30);
c43a801a57890b Jacky Bai 2021-09-14  274  	clks[IMX8ULP_CLK_DMA1_CH21] =3D =
imx_clk_hw_gate("pcc_dma1_ch21", "xbar_ad_divplat", base + 0x5c, 30);
c43a801a57890b Jacky Bai 2021-09-14  275  	clks[IMX8ULP_CLK_DMA1_CH22] =3D =
imx_clk_hw_gate("pcc_dma1_ch22", "xbar_ad_divplat", base + 0x60, 30);
c43a801a57890b Jacky Bai 2021-09-14  276  	clks[IMX8ULP_CLK_DMA1_CH23] =3D =
imx_clk_hw_gate("pcc_dma1_ch23", "xbar_ad_divplat", base + 0x64, 30);
c43a801a57890b Jacky Bai 2021-09-14  277  	clks[IMX8ULP_CLK_DMA1_CH24] =3D =
imx_clk_hw_gate("pcc_dma1_ch24", "xbar_ad_divplat", base + 0x68, 30);
c43a801a57890b Jacky Bai 2021-09-14  278  	clks[IMX8ULP_CLK_DMA1_CH25] =3D =
imx_clk_hw_gate("pcc_dma1_ch25", "xbar_ad_divplat", base + 0x6c, 30);
c43a801a57890b Jacky Bai 2021-09-14  279  	clks[IMX8ULP_CLK_DMA1_CH26] =3D =
imx_clk_hw_gate("pcc_dma1_ch26", "xbar_ad_divplat", base + 0x70, 30);
c43a801a57890b Jacky Bai 2021-09-14  280  	clks[IMX8ULP_CLK_DMA1_CH27] =3D =
imx_clk_hw_gate("pcc_dma1_ch27", "xbar_ad_divplat", base + 0x74, 30);
c43a801a57890b Jacky Bai 2021-09-14  281  	clks[IMX8ULP_CLK_DMA1_CH28] =3D =
imx_clk_hw_gate("pcc_dma1_ch28", "xbar_ad_divplat", base + 0x78, 30);
c43a801a57890b Jacky Bai 2021-09-14  282  	clks[IMX8ULP_CLK_DMA1_CH29] =3D =
imx_clk_hw_gate("pcc_dma1_ch29", "xbar_ad_divplat", base + 0x7c, 30);
c43a801a57890b Jacky Bai 2021-09-14  283  	clks[IMX8ULP_CLK_DMA1_CH30] =3D =
imx_clk_hw_gate("pcc_dma1_ch30", "xbar_ad_divplat", base + 0x80, 30);
c43a801a57890b Jacky Bai 2021-09-14  284  	clks[IMX8ULP_CLK_DMA1_CH31] =3D =
imx_clk_hw_gate("pcc_dma1_ch31", "xbar_ad_divplat", base + 0x84, 30);
c43a801a57890b Jacky Bai 2021-09-14  285  	clks[IMX8ULP_CLK_MU0_B] =3D imx_=
clk_hw_gate("mu0_b", "xbar_ad_divplat", base + 0x88, 30);
c43a801a57890b Jacky Bai 2021-09-14  286  	clks[IMX8ULP_CLK_MU3_A] =3D imx_=
clk_hw_gate("mu3_a", "xbar_ad_divplat", base + 0x8c, 30);
c43a801a57890b Jacky Bai 2021-09-14  287  =

c43a801a57890b Jacky Bai 2021-09-14  288  	imx_check_clk_hws(clks, clk_data=
->num);
c43a801a57890b Jacky Bai 2021-09-14  289  =

c43a801a57890b Jacky Bai 2021-09-14  290  	ret =3D devm_of_clk_add_hw_provi=
der(dev, of_clk_hw_onecell_get, clk_data);
c43a801a57890b Jacky Bai 2021-09-14  291  =

c43a801a57890b Jacky Bai 2021-09-14  292  	imx_register_uart_clocks(1);
c43a801a57890b Jacky Bai 2021-09-14  293  =

c43a801a57890b Jacky Bai 2021-09-14  294  	return ret;
c43a801a57890b Jacky Bai 2021-09-14  295  }
c43a801a57890b Jacky Bai 2021-09-14  296  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6961699518016085049==--

