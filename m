Content-Type: multipart/mixed; boundary="===============5716755047478340546=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4146/12841] drivers/clk/imx/clk-imx8ulp.c:71 imx8ulp_clk_cgc1_init() warn: passing zero to 'PTR_ERR'
Date: Mon, 01 Nov 2021 18:48:28 +0800
Message-ID: <202111011825.FiKSQbsX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5716755047478340546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jacky Bai <ping.bai@nxp.com>
CC: Abel Vesa <abel.vesa@nxp.com>
CC: Peng Fan <peng.fan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdcc9f6a568275aed4cc32fd2312432d2ff1b704
commit: c43a801a57890b15e16a0502edf145d59c91baf7 [4146/12841] clk: imx: Add=
 clock driver for imx8ulp
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-m031-20211101 (attached as .config)
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

--===============5716755047478340546==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
WfxWSZ/LRK3KeqomfYHyf80QY+T8SwIA
--===============5716755047478340546==--

