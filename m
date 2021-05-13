Content-Type: multipart/mixed; boundary="===============6771954465787104141=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/imx/clk-imx8mm.c:638 imx8mm_clocks_probe() warn: 'base' not released on lines: 416, 638.
Date: Fri, 14 May 2021 05:17:25 +0800
Message-ID: <202105140517.YEdsP7r7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6771954465787104141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anson Huang <Anson.Huang@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Dong Aisheng <aisheng.dong@nxp.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   315d99318179b9cd5077ccc9f7f26a164c9fa998
commit: 9a976cd278eafa496ce30196810ef2e879a4a7d5 clk: imx8m: Support module=
 build
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-m031-20210513 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/imx/clk-imx8mm.c:638 imx8mm_clocks_probe() warn: 'base' not rel=
eased on lines: 416,638.

vim +/base +638 drivers/clk/imx/clk-imx8mm.c

ba5625c3e272c7 Bai Ping        2019-01-22  301  =

af7e7ee0e4280c Abel Vesa       2019-07-09  302  static int imx8mm_clocks_pr=
obe(struct platform_device *pdev)
ba5625c3e272c7 Bai Ping        2019-01-22  303  {
af7e7ee0e4280c Abel Vesa       2019-07-09  304  	struct device *dev =3D &pd=
ev->dev;
af7e7ee0e4280c Abel Vesa       2019-07-09  305  	struct device_node *np =3D=
 dev->of_node;
ba5625c3e272c7 Bai Ping        2019-01-22  306  	void __iomem *base;
9c71f9ea35d74a Peng Fan        2019-12-12  307  	int ret, i;
ba5625c3e272c7 Bai Ping        2019-01-22  308  =

9c71f9ea35d74a Peng Fan        2019-12-12  309  	clk_hw_data =3D kzalloc(st=
ruct_size(clk_hw_data, hws,
9c71f9ea35d74a Peng Fan        2019-12-12  310  					  IMX8MM_CLK_END), GFP=
_KERNEL);
9c71f9ea35d74a Peng Fan        2019-12-12  311  	if (WARN_ON(!clk_hw_data))
9c71f9ea35d74a Peng Fan        2019-12-12  312  		return -ENOMEM;
9c71f9ea35d74a Peng Fan        2019-12-12  313  =

9c71f9ea35d74a Peng Fan        2019-12-12  314  	clk_hw_data->num =3D IMX8M=
M_CLK_END;
9c71f9ea35d74a Peng Fan        2019-12-12  315  	hws =3D clk_hw_data->hws;
9c71f9ea35d74a Peng Fan        2019-12-12  316  =

9c71f9ea35d74a Peng Fan        2019-12-12  317  	hws[IMX8MM_CLK_DUMMY] =3D =
imx_clk_hw_fixed("dummy", 0);
9c71f9ea35d74a Peng Fan        2019-12-12  318  	hws[IMX8MM_CLK_24M] =3D im=
x_obtain_fixed_clk_hw(np, "osc_24m");
9c71f9ea35d74a Peng Fan        2019-12-12  319  	hws[IMX8MM_CLK_32K] =3D im=
x_obtain_fixed_clk_hw(np, "osc_32k");
9c71f9ea35d74a Peng Fan        2019-12-12  320  	hws[IMX8MM_CLK_EXT1] =3D i=
mx_obtain_fixed_clk_hw(np, "clk_ext1");
9c71f9ea35d74a Peng Fan        2019-12-12  321  	hws[IMX8MM_CLK_EXT2] =3D i=
mx_obtain_fixed_clk_hw(np, "clk_ext2");
9c71f9ea35d74a Peng Fan        2019-12-12  322  	hws[IMX8MM_CLK_EXT3] =3D i=
mx_obtain_fixed_clk_hw(np, "clk_ext3");
9c71f9ea35d74a Peng Fan        2019-12-12  323  	hws[IMX8MM_CLK_EXT4] =3D i=
mx_obtain_fixed_clk_hw(np, "clk_ext4");
ba5625c3e272c7 Bai Ping        2019-01-22  324  =

ba5625c3e272c7 Bai Ping        2019-01-22  325  	np =3D of_find_compatible_=
node(NULL, NULL, "fsl,imx8mm-anatop");
ba5625c3e272c7 Bai Ping        2019-01-22  326  	base =3D of_iomap(np, 0);
5062d46e2698e7 Anson Huang     2020-02-12  327  	of_node_put(np);
ba5625c3e272c7 Bai Ping        2019-01-22  328  	if (WARN_ON(!base))
ba5625c3e272c7 Bai Ping        2019-01-22  329  		return -ENOMEM;
ba5625c3e272c7 Bai Ping        2019-01-22  330  =

9c71f9ea35d74a Peng Fan        2019-12-12  331  	hws[IMX8MM_AUDIO_PLL1_REF_=
SEL] =3D imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sel=
s, ARRAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  332  	hws[IMX8MM_AUDIO_PLL2_REF_=
SEL] =3D imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_se=
ls, ARRAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  333  	hws[IMX8MM_VIDEO_PLL1_REF_=
SEL] =3D imx_clk_hw_mux("video_pll1_ref_sel", base + 0x28, 0, 2, pll_ref_se=
ls, ARRAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  334  	hws[IMX8MM_DRAM_PLL_REF_SE=
L] =3D imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, =
ARRAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  335  	hws[IMX8MM_GPU_PLL_REF_SEL=
] =3D imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, AR=
RAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  336  	hws[IMX8MM_VPU_PLL_REF_SEL=
] =3D imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, AR=
RAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  337  	hws[IMX8MM_ARM_PLL_REF_SEL=
] =3D imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, AR=
RAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  338  	hws[IMX8MM_SYS_PLL3_REF_SE=
L] =3D imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels,=
 ARRAY_SIZE(pll_ref_sels));
9c71f9ea35d74a Peng Fan        2019-12-12  339  =

9c71f9ea35d74a Peng Fan        2019-12-12  340  	hws[IMX8MM_AUDIO_PLL1] =3D=
 imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pl=
l);
9c71f9ea35d74a Peng Fan        2019-12-12  341  	hws[IMX8MM_AUDIO_PLL2] =3D=
 imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1=
443x_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  342  	hws[IMX8MM_VIDEO_PLL1] =3D=
 imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1=
443x_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  343  	hws[IMX8MM_DRAM_PLL] =3D i=
mx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_d=
ram_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  344  	hws[IMX8MM_GPU_PLL] =3D im=
x_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  345  	hws[IMX8MM_VPU_PLL] =3D im=
x_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  346  	hws[IMX8MM_ARM_PLL] =3D im=
x_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
9c71f9ea35d74a Peng Fan        2019-12-12  347  	hws[IMX8MM_SYS_PLL1] =3D i=
mx_clk_hw_fixed("sys_pll1", 800000000);
9c71f9ea35d74a Peng Fan        2019-12-12  348  	hws[IMX8MM_SYS_PLL2] =3D i=
mx_clk_hw_fixed("sys_pll2", 1000000000);
9c71f9ea35d74a Peng Fan        2019-12-12  349  	hws[IMX8MM_SYS_PLL3] =3D i=
mx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114, &imx_1416x_=
pll);
ba5625c3e272c7 Bai Ping        2019-01-22  350  =

ba5625c3e272c7 Bai Ping        2019-01-22  351  	/* PLL bypass out */
9c71f9ea35d74a Peng Fan        2019-12-12  352  	hws[IMX8MM_AUDIO_PLL1_BYPA=
SS] =3D imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_b=
ypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  353  	hws[IMX8MM_AUDIO_PLL2_BYPA=
SS] =3D imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio=
_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  354  	hws[IMX8MM_VIDEO_PLL1_BYPA=
SS] =3D imx_clk_hw_mux_flags("video_pll1_bypass", base + 0x28, 16, 1, video=
_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  355  	hws[IMX8MM_DRAM_PLL_BYPASS=
] =3D imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_=
bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  356  	hws[IMX8MM_GPU_PLL_BYPASS]=
 =3D imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_byp=
ass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  357  	hws[IMX8MM_VPU_PLL_BYPASS]=
 =3D imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1, vpu_pll_byp=
ass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  358  	hws[IMX8MM_ARM_PLL_BYPASS]=
 =3D imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1, arm_pll_byp=
ass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c71f9ea35d74a Peng Fan        2019-12-12  359  	hws[IMX8MM_SYS_PLL3_BYPASS=
] =3D imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1, sys_pll3=
_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
ba5625c3e272c7 Bai Ping        2019-01-22  360  =

ba5625c3e272c7 Bai Ping        2019-01-22  361  	/* PLL out gate */
9c71f9ea35d74a Peng Fan        2019-12-12  362  	hws[IMX8MM_AUDIO_PLL1_OUT]=
 =3D imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
9c71f9ea35d74a Peng Fan        2019-12-12  363  	hws[IMX8MM_AUDIO_PLL2_OUT]=
 =3D imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13=
);
9c71f9ea35d74a Peng Fan        2019-12-12  364  	hws[IMX8MM_VIDEO_PLL1_OUT]=
 =3D imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", base + 0x28, 13=
);
9c71f9ea35d74a Peng Fan        2019-12-12  365  	hws[IMX8MM_DRAM_PLL_OUT] =
=3D imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
9c71f9ea35d74a Peng Fan        2019-12-12  366  	hws[IMX8MM_GPU_PLL_OUT] =
=3D imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
9c71f9ea35d74a Peng Fan        2019-12-12  367  	hws[IMX8MM_VPU_PLL_OUT] =
=3D imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x74, 11);
9c71f9ea35d74a Peng Fan        2019-12-12  368  	hws[IMX8MM_ARM_PLL_OUT] =
=3D imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", base + 0x84, 11);
9c71f9ea35d74a Peng Fan        2019-12-12  369  	hws[IMX8MM_SYS_PLL3_OUT] =
=3D imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", base + 0x114, 11);
ba5625c3e272c7 Bai Ping        2019-01-22  370  =

3e4947acad32e6 Leonard Crestez 2019-10-16  371  	/* SYS PLL1 fixed output */
9c71f9ea35d74a Peng Fan        2019-12-12  372  	hws[IMX8MM_SYS_PLL1_40M_CG=
] =3D imx_clk_hw_gate("sys_pll1_40m_cg", "sys_pll1", base + 0x94, 27);
9c71f9ea35d74a Peng Fan        2019-12-12  373  	hws[IMX8MM_SYS_PLL1_80M_CG=
] =3D imx_clk_hw_gate("sys_pll1_80m_cg", "sys_pll1", base + 0x94, 25);
9c71f9ea35d74a Peng Fan        2019-12-12  374  	hws[IMX8MM_SYS_PLL1_100M_C=
G] =3D imx_clk_hw_gate("sys_pll1_100m_cg", "sys_pll1", base + 0x94, 23);
9c71f9ea35d74a Peng Fan        2019-12-12  375  	hws[IMX8MM_SYS_PLL1_133M_C=
G] =3D imx_clk_hw_gate("sys_pll1_133m_cg", "sys_pll1", base + 0x94, 21);
9c71f9ea35d74a Peng Fan        2019-12-12  376  	hws[IMX8MM_SYS_PLL1_160M_C=
G] =3D imx_clk_hw_gate("sys_pll1_160m_cg", "sys_pll1", base + 0x94, 19);
9c71f9ea35d74a Peng Fan        2019-12-12  377  	hws[IMX8MM_SYS_PLL1_200M_C=
G] =3D imx_clk_hw_gate("sys_pll1_200m_cg", "sys_pll1", base + 0x94, 17);
9c71f9ea35d74a Peng Fan        2019-12-12  378  	hws[IMX8MM_SYS_PLL1_266M_C=
G] =3D imx_clk_hw_gate("sys_pll1_266m_cg", "sys_pll1", base + 0x94, 15);
9c71f9ea35d74a Peng Fan        2019-12-12  379  	hws[IMX8MM_SYS_PLL1_400M_C=
G] =3D imx_clk_hw_gate("sys_pll1_400m_cg", "sys_pll1", base + 0x94, 13);
9c71f9ea35d74a Peng Fan        2019-12-12  380  	hws[IMX8MM_SYS_PLL1_OUT] =
=3D imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
9c71f9ea35d74a Peng Fan        2019-12-12  381  =

9c71f9ea35d74a Peng Fan        2019-12-12  382  	hws[IMX8MM_SYS_PLL1_40M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_40m_cg", 1, 20);
9c71f9ea35d74a Peng Fan        2019-12-12  383  	hws[IMX8MM_SYS_PLL1_80M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_80m_cg", 1, 10);
9c71f9ea35d74a Peng Fan        2019-12-12  384  	hws[IMX8MM_SYS_PLL1_100M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_100m_cg", 1, 8);
9c71f9ea35d74a Peng Fan        2019-12-12  385  	hws[IMX8MM_SYS_PLL1_133M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_133m_cg", 1, 6);
9c71f9ea35d74a Peng Fan        2019-12-12  386  	hws[IMX8MM_SYS_PLL1_160M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_160m_cg", 1, 5);
9c71f9ea35d74a Peng Fan        2019-12-12  387  	hws[IMX8MM_SYS_PLL1_200M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_200m_cg", 1, 4);
9c71f9ea35d74a Peng Fan        2019-12-12  388  	hws[IMX8MM_SYS_PLL1_266M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_266m_cg", 1, 3);
9c71f9ea35d74a Peng Fan        2019-12-12  389  	hws[IMX8MM_SYS_PLL1_400M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_400m_cg", 1, 2);
9c71f9ea35d74a Peng Fan        2019-12-12  390  	hws[IMX8MM_SYS_PLL1_800M] =
=3D imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
ba5625c3e272c7 Bai Ping        2019-01-22  391  =

3e4947acad32e6 Leonard Crestez 2019-10-16  392  	/* SYS PLL2 fixed output */
9c71f9ea35d74a Peng Fan        2019-12-12  393  	hws[IMX8MM_SYS_PLL2_50M_CG=
] =3D imx_clk_hw_gate("sys_pll2_50m_cg", "sys_pll2", base + 0x104, 27);
9c71f9ea35d74a Peng Fan        2019-12-12  394  	hws[IMX8MM_SYS_PLL2_100M_C=
G] =3D imx_clk_hw_gate("sys_pll2_100m_cg", "sys_pll2", base + 0x104, 25);
9c71f9ea35d74a Peng Fan        2019-12-12  395  	hws[IMX8MM_SYS_PLL2_125M_C=
G] =3D imx_clk_hw_gate("sys_pll2_125m_cg", "sys_pll2", base + 0x104, 23);
9c71f9ea35d74a Peng Fan        2019-12-12  396  	hws[IMX8MM_SYS_PLL2_166M_C=
G] =3D imx_clk_hw_gate("sys_pll2_166m_cg", "sys_pll2", base + 0x104, 21);
9c71f9ea35d74a Peng Fan        2019-12-12  397  	hws[IMX8MM_SYS_PLL2_200M_C=
G] =3D imx_clk_hw_gate("sys_pll2_200m_cg", "sys_pll2", base + 0x104, 19);
9c71f9ea35d74a Peng Fan        2019-12-12  398  	hws[IMX8MM_SYS_PLL2_250M_C=
G] =3D imx_clk_hw_gate("sys_pll2_250m_cg", "sys_pll2", base + 0x104, 17);
9c71f9ea35d74a Peng Fan        2019-12-12  399  	hws[IMX8MM_SYS_PLL2_333M_C=
G] =3D imx_clk_hw_gate("sys_pll2_333m_cg", "sys_pll2", base + 0x104, 15);
9c71f9ea35d74a Peng Fan        2019-12-12  400  	hws[IMX8MM_SYS_PLL2_500M_C=
G] =3D imx_clk_hw_gate("sys_pll2_500m_cg", "sys_pll2", base + 0x104, 13);
9c71f9ea35d74a Peng Fan        2019-12-12  401  	hws[IMX8MM_SYS_PLL2_OUT] =
=3D imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
9c71f9ea35d74a Peng Fan        2019-12-12  402  =

9c71f9ea35d74a Peng Fan        2019-12-12  403  	hws[IMX8MM_SYS_PLL2_50M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_50m_cg", 1, 20);
9c71f9ea35d74a Peng Fan        2019-12-12  404  	hws[IMX8MM_SYS_PLL2_100M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_100m_cg", 1, 10);
9c71f9ea35d74a Peng Fan        2019-12-12  405  	hws[IMX8MM_SYS_PLL2_125M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_125m_cg", 1, 8);
9c71f9ea35d74a Peng Fan        2019-12-12  406  	hws[IMX8MM_SYS_PLL2_166M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_166m_cg", 1, 6);
9c71f9ea35d74a Peng Fan        2019-12-12  407  	hws[IMX8MM_SYS_PLL2_200M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_200m_cg", 1, 5);
9c71f9ea35d74a Peng Fan        2019-12-12  408  	hws[IMX8MM_SYS_PLL2_250M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_250m_cg", 1, 4);
9c71f9ea35d74a Peng Fan        2019-12-12  409  	hws[IMX8MM_SYS_PLL2_333M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_333m_cg", 1, 3);
9c71f9ea35d74a Peng Fan        2019-12-12  410  	hws[IMX8MM_SYS_PLL2_500M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
9c71f9ea35d74a Peng Fan        2019-12-12  411  	hws[IMX8MM_SYS_PLL2_1000M]=
 =3D imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
ba5625c3e272c7 Bai Ping        2019-01-22  412  =

af7e7ee0e4280c Abel Vesa       2019-07-09  413  	np =3D dev->of_node;
af7e7ee0e4280c Abel Vesa       2019-07-09  414  	base =3D devm_platform_ior=
emap_resource(pdev, 0);
af7e7ee0e4280c Abel Vesa       2019-07-09  415  	if (WARN_ON(IS_ERR(base)))
af7e7ee0e4280c Abel Vesa       2019-07-09  416  		return PTR_ERR(base);
ba5625c3e272c7 Bai Ping        2019-01-22  417  =

ba5625c3e272c7 Bai Ping        2019-01-22  418  	/* Core Slice */
b737beddb32994 Peng Fan        2020-05-07  419  	hws[IMX8MM_CLK_A53_DIV] =
=3D imx8m_clk_hw_composite_core("arm_a53_div", imx8mm_a53_sels, base + 0x80=
00);
b737beddb32994 Peng Fan        2020-05-07  420  	hws[IMX8MM_CLK_A53_CG] =3D=
 hws[IMX8MM_CLK_A53_DIV];
b737beddb32994 Peng Fan        2020-05-07  421  	hws[IMX8MM_CLK_A53_SRC] =
=3D hws[IMX8MM_CLK_A53_DIV];
811e4171d0f5ac Peng Fan        2020-01-28  422  =

811e4171d0f5ac Peng Fan        2020-01-28  423  	hws[IMX8MM_CLK_M4_CORE] =
=3D imx8m_clk_hw_composite_core("arm_m4_core", imx8mm_m4_sels, base + 0x808=
0);
811e4171d0f5ac Peng Fan        2020-01-28  424  	hws[IMX8MM_CLK_VPU_CORE] =
=3D imx8m_clk_hw_composite_core("vpu_core", imx8mm_vpu_sels, base + 0x8100);
811e4171d0f5ac Peng Fan        2020-01-28  425  	hws[IMX8MM_CLK_GPU3D_CORE]=
 =3D imx8m_clk_hw_composite_core("gpu3d_core", imx8mm_gpu3d_sels, base + 0x=
8180);
811e4171d0f5ac Peng Fan        2020-01-28  426  	hws[IMX8MM_CLK_GPU2D_CORE]=
 =3D imx8m_clk_hw_composite_core("gpu2d_core", imx8mm_gpu2d_sels, base + 0x=
8200);
811e4171d0f5ac Peng Fan        2020-01-28  427  =

811e4171d0f5ac Peng Fan        2020-01-28  428  	/* For backwards compatibi=
lity */
811e4171d0f5ac Peng Fan        2020-01-28  429  	hws[IMX8MM_CLK_M4_SRC] =3D=
 hws[IMX8MM_CLK_M4_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  430  	hws[IMX8MM_CLK_M4_CG] =3D =
hws[IMX8MM_CLK_M4_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  431  	hws[IMX8MM_CLK_M4_DIV] =3D=
 hws[IMX8MM_CLK_M4_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  432  	hws[IMX8MM_CLK_VPU_SRC] =
=3D hws[IMX8MM_CLK_VPU_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  433  	hws[IMX8MM_CLK_VPU_CG] =3D=
 hws[IMX8MM_CLK_VPU_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  434  	hws[IMX8MM_CLK_VPU_DIV] =
=3D hws[IMX8MM_CLK_VPU_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  435  	hws[IMX8MM_CLK_GPU3D_SRC] =
=3D hws[IMX8MM_CLK_GPU3D_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  436  	hws[IMX8MM_CLK_GPU3D_CG] =
=3D hws[IMX8MM_CLK_GPU3D_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  437  	hws[IMX8MM_CLK_GPU3D_DIV] =
=3D hws[IMX8MM_CLK_GPU3D_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  438  	hws[IMX8MM_CLK_GPU2D_SRC] =
=3D hws[IMX8MM_CLK_GPU2D_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  439  	hws[IMX8MM_CLK_GPU2D_CG] =
=3D hws[IMX8MM_CLK_GPU2D_CORE];
811e4171d0f5ac Peng Fan        2020-01-28  440  	hws[IMX8MM_CLK_GPU2D_DIV] =
=3D hws[IMX8MM_CLK_GPU2D_CORE];
ba5625c3e272c7 Bai Ping        2019-01-22  441  =

d3b70cd87e773b Peng Fan        2020-02-19  442  	/* CORE SEL */
81aa844bb53bc7 Anson Huang     2020-02-25  443  	hws[IMX8MM_CLK_A53_CORE] =
=3D imx_clk_hw_mux2("arm_a53_core", base + 0x9880, 24, 1, imx8mm_a53_core_s=
els, ARRAY_SIZE(imx8mm_a53_core_sels));
d3b70cd87e773b Peng Fan        2020-02-19  444  =

ba5625c3e272c7 Bai Ping        2019-01-22  445  	/* BUS */
9c71f9ea35d74a Peng Fan        2019-12-12  446  	hws[IMX8MM_CLK_MAIN_AXI] =
=3D imx8m_clk_hw_composite_critical("main_axi",  imx8mm_main_axi_sels, base=
 + 0x8800);
b1657ad708f761 Peng Fan        2020-05-07  447  	hws[IMX8MM_CLK_ENET_AXI] =
=3D imx8m_clk_hw_composite_bus("enet_axi", imx8mm_enet_axi_sels, base + 0x8=
880);
9c71f9ea35d74a Peng Fan        2019-12-12  448  	hws[IMX8MM_CLK_NAND_USDHC_=
BUS] =3D imx8m_clk_hw_composite_critical("nand_usdhc_bus", imx8mm_nand_usdh=
c_sels, base + 0x8900);
b1657ad708f761 Peng Fan        2020-05-07  449  	hws[IMX8MM_CLK_VPU_BUS] =
=3D imx8m_clk_hw_composite_bus("vpu_bus", imx8mm_vpu_bus_sels, base + 0x898=
0);
b1657ad708f761 Peng Fan        2020-05-07  450  	hws[IMX8MM_CLK_DISP_AXI] =
=3D imx8m_clk_hw_composite_bus("disp_axi", imx8mm_disp_axi_sels, base + 0x8=
a00);
b1657ad708f761 Peng Fan        2020-05-07  451  	hws[IMX8MM_CLK_DISP_APB] =
=3D imx8m_clk_hw_composite_bus("disp_apb", imx8mm_disp_apb_sels, base + 0x8=
a80);
b1657ad708f761 Peng Fan        2020-05-07  452  	hws[IMX8MM_CLK_DISP_RTRM] =
=3D imx8m_clk_hw_composite_bus("disp_rtrm", imx8mm_disp_rtrm_sels, base + 0=
x8b00);
b1657ad708f761 Peng Fan        2020-05-07  453  	hws[IMX8MM_CLK_USB_BUS] =
=3D imx8m_clk_hw_composite_bus("usb_bus", imx8mm_usb_bus_sels, base + 0x8b8=
0);
b1657ad708f761 Peng Fan        2020-05-07  454  	hws[IMX8MM_CLK_GPU_AXI] =
=3D imx8m_clk_hw_composite_bus("gpu_axi", imx8mm_gpu_axi_sels, base + 0x8c0=
0);
b1657ad708f761 Peng Fan        2020-05-07  455  	hws[IMX8MM_CLK_GPU_AHB] =
=3D imx8m_clk_hw_composite_bus("gpu_ahb", imx8mm_gpu_ahb_sels, base + 0x8c8=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  456  	hws[IMX8MM_CLK_NOC] =3D im=
x8m_clk_hw_composite_critical("noc", imx8mm_noc_sels, base + 0x8d00);
9c71f9ea35d74a Peng Fan        2019-12-12  457  	hws[IMX8MM_CLK_NOC_APB] =
=3D imx8m_clk_hw_composite_critical("noc_apb", imx8mm_noc_apb_sels, base + =
0x8d80);
ba5625c3e272c7 Bai Ping        2019-01-22  458  =

ba5625c3e272c7 Bai Ping        2019-01-22  459  	/* AHB */
9c71f9ea35d74a Peng Fan        2019-12-12  460  	hws[IMX8MM_CLK_AHB] =3D im=
x8m_clk_hw_composite_critical("ahb", imx8mm_ahb_sels, base + 0x9000);
b1657ad708f761 Peng Fan        2020-05-07  461  	hws[IMX8MM_CLK_AUDIO_AHB] =
=3D imx8m_clk_hw_composite_bus("audio_ahb", imx8mm_audio_ahb_sels, base + 0=
x9100);
ba5625c3e272c7 Bai Ping        2019-01-22  462  =

ba5625c3e272c7 Bai Ping        2019-01-22  463  	/* IPG */
9c71f9ea35d74a Peng Fan        2019-12-12  464  	hws[IMX8MM_CLK_IPG_ROOT] =
=3D imx_clk_hw_divider2("ipg_root", "ahb", base + 0x9080, 0, 1);
9c71f9ea35d74a Peng Fan        2019-12-12  465  	hws[IMX8MM_CLK_IPG_AUDIO_R=
OOT] =3D imx_clk_hw_divider2("ipg_audio_root", "audio_ahb", base + 0x9180, =
0, 1);
ba5625c3e272c7 Bai Ping        2019-01-22  466  =

d9ea9ca2b42012 Leonard Crestez 2019-11-22  467  	/*
d9ea9ca2b42012 Leonard Crestez 2019-11-22  468  	 * DRAM clocks are manipul=
ated from TF-A outside clock framework.
d9ea9ca2b42012 Leonard Crestez 2019-11-22  469  	 * Mark with GET_RATE_NOCA=
CHE to always read div value from hardware
d9ea9ca2b42012 Leonard Crestez 2019-11-22  470  	 */
9c71f9ea35d74a Peng Fan        2019-12-12  471  	hws[IMX8MM_CLK_DRAM_ALT] =
=3D __imx8m_clk_hw_composite("dram_alt", imx8mm_dram_alt_sels, base + 0xa00=
0, CLK_GET_RATE_NOCACHE);
9c71f9ea35d74a Peng Fan        2019-12-12  472  	hws[IMX8MM_CLK_DRAM_APB] =
=3D __imx8m_clk_hw_composite("dram_apb", imx8mm_dram_apb_sels, base + 0xa08=
0, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
d9ea9ca2b42012 Leonard Crestez 2019-11-22  473  =

ba5625c3e272c7 Bai Ping        2019-01-22  474  	/* IP */
9c71f9ea35d74a Peng Fan        2019-12-12  475  	hws[IMX8MM_CLK_VPU_G1] =3D=
 imx8m_clk_hw_composite("vpu_g1", imx8mm_vpu_g1_sels, base + 0xa100);
9c71f9ea35d74a Peng Fan        2019-12-12  476  	hws[IMX8MM_CLK_VPU_G2] =3D=
 imx8m_clk_hw_composite("vpu_g2", imx8mm_vpu_g2_sels, base + 0xa180);
9c71f9ea35d74a Peng Fan        2019-12-12  477  	hws[IMX8MM_CLK_DISP_DTRC] =
=3D imx8m_clk_hw_composite("disp_dtrc", imx8mm_disp_dtrc_sels, base + 0xa20=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  478  	hws[IMX8MM_CLK_DISP_DC8000=
] =3D imx8m_clk_hw_composite("disp_dc8000", imx8mm_disp_dc8000_sels, base +=
 0xa280);
9c71f9ea35d74a Peng Fan        2019-12-12  479  	hws[IMX8MM_CLK_PCIE1_CTRL]=
 =3D imx8m_clk_hw_composite("pcie1_ctrl", imx8mm_pcie1_ctrl_sels, base + 0x=
a300);
9c71f9ea35d74a Peng Fan        2019-12-12  480  	hws[IMX8MM_CLK_PCIE1_PHY] =
=3D imx8m_clk_hw_composite("pcie1_phy", imx8mm_pcie1_phy_sels, base + 0xa38=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  481  	hws[IMX8MM_CLK_PCIE1_AUX] =
=3D imx8m_clk_hw_composite("pcie1_aux", imx8mm_pcie1_aux_sels, base + 0xa40=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  482  	hws[IMX8MM_CLK_DC_PIXEL] =
=3D imx8m_clk_hw_composite("dc_pixel", imx8mm_dc_pixel_sels, base + 0xa480);
9c71f9ea35d74a Peng Fan        2019-12-12  483  	hws[IMX8MM_CLK_LCDIF_PIXEL=
] =3D imx8m_clk_hw_composite("lcdif_pixel", imx8mm_lcdif_pixel_sels, base +=
 0xa500);
9c71f9ea35d74a Peng Fan        2019-12-12  484  	hws[IMX8MM_CLK_SAI1] =3D i=
mx8m_clk_hw_composite("sai1", imx8mm_sai1_sels, base + 0xa580);
9c71f9ea35d74a Peng Fan        2019-12-12  485  	hws[IMX8MM_CLK_SAI2] =3D i=
mx8m_clk_hw_composite("sai2", imx8mm_sai2_sels, base + 0xa600);
9c71f9ea35d74a Peng Fan        2019-12-12  486  	hws[IMX8MM_CLK_SAI3] =3D i=
mx8m_clk_hw_composite("sai3", imx8mm_sai3_sels, base + 0xa680);
9c71f9ea35d74a Peng Fan        2019-12-12  487  	hws[IMX8MM_CLK_SAI4] =3D i=
mx8m_clk_hw_composite("sai4", imx8mm_sai4_sels, base + 0xa700);
9c71f9ea35d74a Peng Fan        2019-12-12  488  	hws[IMX8MM_CLK_SAI5] =3D i=
mx8m_clk_hw_composite("sai5", imx8mm_sai5_sels, base + 0xa780);
9c71f9ea35d74a Peng Fan        2019-12-12  489  	hws[IMX8MM_CLK_SAI6] =3D i=
mx8m_clk_hw_composite("sai6", imx8mm_sai6_sels, base + 0xa800);
9c71f9ea35d74a Peng Fan        2019-12-12  490  	hws[IMX8MM_CLK_SPDIF1] =3D=
 imx8m_clk_hw_composite("spdif1", imx8mm_spdif1_sels, base + 0xa880);
9c71f9ea35d74a Peng Fan        2019-12-12  491  	hws[IMX8MM_CLK_SPDIF2] =3D=
 imx8m_clk_hw_composite("spdif2", imx8mm_spdif2_sels, base + 0xa900);
9c71f9ea35d74a Peng Fan        2019-12-12  492  	hws[IMX8MM_CLK_ENET_REF] =
=3D imx8m_clk_hw_composite("enet_ref", imx8mm_enet_ref_sels, base + 0xa980);
9c71f9ea35d74a Peng Fan        2019-12-12  493  	hws[IMX8MM_CLK_ENET_TIMER]=
 =3D imx8m_clk_hw_composite("enet_timer", imx8mm_enet_timer_sels, base + 0x=
aa00);
9c71f9ea35d74a Peng Fan        2019-12-12  494  	hws[IMX8MM_CLK_ENET_PHY_RE=
F] =3D imx8m_clk_hw_composite("enet_phy", imx8mm_enet_phy_sels, base + 0xaa=
80);
9c71f9ea35d74a Peng Fan        2019-12-12  495  	hws[IMX8MM_CLK_NAND] =3D i=
mx8m_clk_hw_composite("nand", imx8mm_nand_sels, base + 0xab00);
9c71f9ea35d74a Peng Fan        2019-12-12  496  	hws[IMX8MM_CLK_QSPI] =3D i=
mx8m_clk_hw_composite("qspi", imx8mm_qspi_sels, base + 0xab80);
9c71f9ea35d74a Peng Fan        2019-12-12  497  	hws[IMX8MM_CLK_USDHC1] =3D=
 imx8m_clk_hw_composite("usdhc1", imx8mm_usdhc1_sels, base + 0xac00);
9c71f9ea35d74a Peng Fan        2019-12-12  498  	hws[IMX8MM_CLK_USDHC2] =3D=
 imx8m_clk_hw_composite("usdhc2", imx8mm_usdhc2_sels, base + 0xac80);
9c71f9ea35d74a Peng Fan        2019-12-12  499  	hws[IMX8MM_CLK_I2C1] =3D i=
mx8m_clk_hw_composite("i2c1", imx8mm_i2c1_sels, base + 0xad00);
9c71f9ea35d74a Peng Fan        2019-12-12  500  	hws[IMX8MM_CLK_I2C2] =3D i=
mx8m_clk_hw_composite("i2c2", imx8mm_i2c2_sels, base + 0xad80);
9c71f9ea35d74a Peng Fan        2019-12-12  501  	hws[IMX8MM_CLK_I2C3] =3D i=
mx8m_clk_hw_composite("i2c3", imx8mm_i2c3_sels, base + 0xae00);
9c71f9ea35d74a Peng Fan        2019-12-12  502  	hws[IMX8MM_CLK_I2C4] =3D i=
mx8m_clk_hw_composite("i2c4", imx8mm_i2c4_sels, base + 0xae80);
9c71f9ea35d74a Peng Fan        2019-12-12  503  	hws[IMX8MM_CLK_UART1] =3D =
imx8m_clk_hw_composite("uart1", imx8mm_uart1_sels, base + 0xaf00);
9c71f9ea35d74a Peng Fan        2019-12-12  504  	hws[IMX8MM_CLK_UART2] =3D =
imx8m_clk_hw_composite("uart2", imx8mm_uart2_sels, base + 0xaf80);
9c71f9ea35d74a Peng Fan        2019-12-12  505  	hws[IMX8MM_CLK_UART3] =3D =
imx8m_clk_hw_composite("uart3", imx8mm_uart3_sels, base + 0xb000);
9c71f9ea35d74a Peng Fan        2019-12-12  506  	hws[IMX8MM_CLK_UART4] =3D =
imx8m_clk_hw_composite("uart4", imx8mm_uart4_sels, base + 0xb080);
9c71f9ea35d74a Peng Fan        2019-12-12  507  	hws[IMX8MM_CLK_USB_CORE_RE=
F] =3D imx8m_clk_hw_composite("usb_core_ref", imx8mm_usb_core_sels, base + =
0xb100);
9c71f9ea35d74a Peng Fan        2019-12-12  508  	hws[IMX8MM_CLK_USB_PHY_REF=
] =3D imx8m_clk_hw_composite("usb_phy_ref", imx8mm_usb_phy_sels, base + 0xb=
180);
9c71f9ea35d74a Peng Fan        2019-12-12  509  	hws[IMX8MM_CLK_GIC] =3D im=
x8m_clk_hw_composite_critical("gic", imx8mm_gic_sels, base + 0xb200);
9c71f9ea35d74a Peng Fan        2019-12-12  510  	hws[IMX8MM_CLK_ECSPI1] =3D=
 imx8m_clk_hw_composite("ecspi1", imx8mm_ecspi1_sels, base + 0xb280);
9c71f9ea35d74a Peng Fan        2019-12-12  511  	hws[IMX8MM_CLK_ECSPI2] =3D=
 imx8m_clk_hw_composite("ecspi2", imx8mm_ecspi2_sels, base + 0xb300);
9c71f9ea35d74a Peng Fan        2019-12-12  512  	hws[IMX8MM_CLK_PWM1] =3D i=
mx8m_clk_hw_composite("pwm1", imx8mm_pwm1_sels, base + 0xb380);
9c71f9ea35d74a Peng Fan        2019-12-12  513  	hws[IMX8MM_CLK_PWM2] =3D i=
mx8m_clk_hw_composite("pwm2", imx8mm_pwm2_sels, base + 0xb400);
9c71f9ea35d74a Peng Fan        2019-12-12  514  	hws[IMX8MM_CLK_PWM3] =3D i=
mx8m_clk_hw_composite("pwm3", imx8mm_pwm3_sels, base + 0xb480);
9c71f9ea35d74a Peng Fan        2019-12-12  515  	hws[IMX8MM_CLK_PWM4] =3D i=
mx8m_clk_hw_composite("pwm4", imx8mm_pwm4_sels, base + 0xb500);
9c71f9ea35d74a Peng Fan        2019-12-12  516  	hws[IMX8MM_CLK_GPT1] =3D i=
mx8m_clk_hw_composite("gpt1", imx8mm_gpt1_sels, base + 0xb580);
9c71f9ea35d74a Peng Fan        2019-12-12  517  	hws[IMX8MM_CLK_WDOG] =3D i=
mx8m_clk_hw_composite("wdog", imx8mm_wdog_sels, base + 0xb900);
9c71f9ea35d74a Peng Fan        2019-12-12  518  	hws[IMX8MM_CLK_WRCLK] =3D =
imx8m_clk_hw_composite("wrclk", imx8mm_wrclk_sels, base + 0xb980);
9c71f9ea35d74a Peng Fan        2019-12-12  519  	hws[IMX8MM_CLK_CLKO1] =3D =
imx8m_clk_hw_composite("clko1", imx8mm_clko1_sels, base + 0xba00);
9c07ae6983d434 Fabio Estevam   2020-02-17  520  	hws[IMX8MM_CLK_CLKO2] =3D =
imx8m_clk_hw_composite("clko2", imx8mm_clko2_sels, base + 0xba80);
9c71f9ea35d74a Peng Fan        2019-12-12  521  	hws[IMX8MM_CLK_DSI_CORE] =
=3D imx8m_clk_hw_composite("dsi_core", imx8mm_dsi_core_sels, base + 0xbb00);
9c71f9ea35d74a Peng Fan        2019-12-12  522  	hws[IMX8MM_CLK_DSI_PHY_REF=
] =3D imx8m_clk_hw_composite("dsi_phy_ref", imx8mm_dsi_phy_sels, base + 0xb=
b80);
9c71f9ea35d74a Peng Fan        2019-12-12  523  	hws[IMX8MM_CLK_DSI_DBI] =
=3D imx8m_clk_hw_composite("dsi_dbi", imx8mm_dsi_dbi_sels, base + 0xbc00);
9c71f9ea35d74a Peng Fan        2019-12-12  524  	hws[IMX8MM_CLK_USDHC3] =3D=
 imx8m_clk_hw_composite("usdhc3", imx8mm_usdhc3_sels, base + 0xbc80);
9c71f9ea35d74a Peng Fan        2019-12-12  525  	hws[IMX8MM_CLK_CSI1_CORE] =
=3D imx8m_clk_hw_composite("csi1_core", imx8mm_csi1_core_sels, base + 0xbd0=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  526  	hws[IMX8MM_CLK_CSI1_PHY_RE=
F] =3D imx8m_clk_hw_composite("csi1_phy_ref", imx8mm_csi1_phy_sels, base + =
0xbd80);
9c71f9ea35d74a Peng Fan        2019-12-12  527  	hws[IMX8MM_CLK_CSI1_ESC] =
=3D imx8m_clk_hw_composite("csi1_esc", imx8mm_csi1_esc_sels, base + 0xbe00);
9c71f9ea35d74a Peng Fan        2019-12-12  528  	hws[IMX8MM_CLK_CSI2_CORE] =
=3D imx8m_clk_hw_composite("csi2_core", imx8mm_csi2_core_sels, base + 0xbe8=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  529  	hws[IMX8MM_CLK_CSI2_PHY_RE=
F] =3D imx8m_clk_hw_composite("csi2_phy_ref", imx8mm_csi2_phy_sels, base + =
0xbf00);
9c71f9ea35d74a Peng Fan        2019-12-12  530  	hws[IMX8MM_CLK_CSI2_ESC] =
=3D imx8m_clk_hw_composite("csi2_esc", imx8mm_csi2_esc_sels, base + 0xbf80);
9c71f9ea35d74a Peng Fan        2019-12-12  531  	hws[IMX8MM_CLK_PCIE2_CTRL]=
 =3D imx8m_clk_hw_composite("pcie2_ctrl", imx8mm_pcie2_ctrl_sels, base + 0x=
c000);
9c71f9ea35d74a Peng Fan        2019-12-12  532  	hws[IMX8MM_CLK_PCIE2_PHY] =
=3D imx8m_clk_hw_composite("pcie2_phy", imx8mm_pcie2_phy_sels, base + 0xc08=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  533  	hws[IMX8MM_CLK_PCIE2_AUX] =
=3D imx8m_clk_hw_composite("pcie2_aux", imx8mm_pcie2_aux_sels, base + 0xc10=
0);
9c71f9ea35d74a Peng Fan        2019-12-12  534  	hws[IMX8MM_CLK_ECSPI3] =3D=
 imx8m_clk_hw_composite("ecspi3", imx8mm_ecspi3_sels, base + 0xc180);
9c71f9ea35d74a Peng Fan        2019-12-12  535  	hws[IMX8MM_CLK_PDM] =3D im=
x8m_clk_hw_composite("pdm", imx8mm_pdm_sels, base + 0xc200);
9c71f9ea35d74a Peng Fan        2019-12-12  536  	hws[IMX8MM_CLK_VPU_H1] =3D=
 imx8m_clk_hw_composite("vpu_h1", imx8mm_vpu_h1_sels, base + 0xc280);
ba5625c3e272c7 Bai Ping        2019-01-22  537  =

ba5625c3e272c7 Bai Ping        2019-01-22  538  	/* CCGR */
9c71f9ea35d74a Peng Fan        2019-12-12  539  	hws[IMX8MM_CLK_ECSPI1_ROOT=
] =3D imx_clk_hw_gate4("ecspi1_root_clk", "ecspi1", base + 0x4070, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  540  	hws[IMX8MM_CLK_ECSPI2_ROOT=
] =3D imx_clk_hw_gate4("ecspi2_root_clk", "ecspi2", base + 0x4080, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  541  	hws[IMX8MM_CLK_ECSPI3_ROOT=
] =3D imx_clk_hw_gate4("ecspi3_root_clk", "ecspi3", base + 0x4090, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  542  	hws[IMX8MM_CLK_ENET1_ROOT]=
 =3D imx_clk_hw_gate4("enet1_root_clk", "enet_axi", base + 0x40a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  543  	hws[IMX8MM_CLK_GPIO1_ROOT]=
 =3D imx_clk_hw_gate4("gpio1_root_clk", "ipg_root", base + 0x40b0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  544  	hws[IMX8MM_CLK_GPIO2_ROOT]=
 =3D imx_clk_hw_gate4("gpio2_root_clk", "ipg_root", base + 0x40c0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  545  	hws[IMX8MM_CLK_GPIO3_ROOT]=
 =3D imx_clk_hw_gate4("gpio3_root_clk", "ipg_root", base + 0x40d0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  546  	hws[IMX8MM_CLK_GPIO4_ROOT]=
 =3D imx_clk_hw_gate4("gpio4_root_clk", "ipg_root", base + 0x40e0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  547  	hws[IMX8MM_CLK_GPIO5_ROOT]=
 =3D imx_clk_hw_gate4("gpio5_root_clk", "ipg_root", base + 0x40f0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  548  	hws[IMX8MM_CLK_GPT1_ROOT] =
=3D imx_clk_hw_gate4("gpt1_root_clk", "gpt1", base + 0x4100, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  549  	hws[IMX8MM_CLK_I2C1_ROOT] =
=3D imx_clk_hw_gate4("i2c1_root_clk", "i2c1", base + 0x4170, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  550  	hws[IMX8MM_CLK_I2C2_ROOT] =
=3D imx_clk_hw_gate4("i2c2_root_clk", "i2c2", base + 0x4180, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  551  	hws[IMX8MM_CLK_I2C3_ROOT] =
=3D imx_clk_hw_gate4("i2c3_root_clk", "i2c3", base + 0x4190, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  552  	hws[IMX8MM_CLK_I2C4_ROOT] =
=3D imx_clk_hw_gate4("i2c4_root_clk", "i2c4", base + 0x41a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  553  	hws[IMX8MM_CLK_MU_ROOT] =
=3D imx_clk_hw_gate4("mu_root_clk", "ipg_root", base + 0x4210, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  554  	hws[IMX8MM_CLK_OCOTP_ROOT]=
 =3D imx_clk_hw_gate4("ocotp_root_clk", "ipg_root", base + 0x4220, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  555  	hws[IMX8MM_CLK_PCIE1_ROOT]=
 =3D imx_clk_hw_gate4("pcie1_root_clk", "pcie1_ctrl", base + 0x4250, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  556  	hws[IMX8MM_CLK_PWM1_ROOT] =
=3D imx_clk_hw_gate4("pwm1_root_clk", "pwm1", base + 0x4280, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  557  	hws[IMX8MM_CLK_PWM2_ROOT] =
=3D imx_clk_hw_gate4("pwm2_root_clk", "pwm2", base + 0x4290, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  558  	hws[IMX8MM_CLK_PWM3_ROOT] =
=3D imx_clk_hw_gate4("pwm3_root_clk", "pwm3", base + 0x42a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  559  	hws[IMX8MM_CLK_PWM4_ROOT] =
=3D imx_clk_hw_gate4("pwm4_root_clk", "pwm4", base + 0x42b0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  560  	hws[IMX8MM_CLK_QSPI_ROOT] =
=3D imx_clk_hw_gate4("qspi_root_clk", "qspi", base + 0x42f0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  561  	hws[IMX8MM_CLK_NAND_ROOT] =
=3D imx_clk_hw_gate2_shared2("nand_root_clk", "nand", base + 0x4300, 0, &sh=
are_count_nand);
9c71f9ea35d74a Peng Fan        2019-12-12  562  	hws[IMX8MM_CLK_NAND_USDHC_=
BUS_RAWNAND_CLK] =3D imx_clk_hw_gate2_shared2("nand_usdhc_rawnand_clk", "na=
nd_usdhc_bus", base + 0x4300, 0, &share_count_nand);
9c71f9ea35d74a Peng Fan        2019-12-12  563  	hws[IMX8MM_CLK_SAI1_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai1_root_clk", "sai1", base + 0x4330, 0, &sh=
are_count_sai1);
9c71f9ea35d74a Peng Fan        2019-12-12  564  	hws[IMX8MM_CLK_SAI1_IPG] =
=3D imx_clk_hw_gate2_shared2("sai1_ipg_clk", "ipg_audio_root", base + 0x433=
0, 0, &share_count_sai1);
9c71f9ea35d74a Peng Fan        2019-12-12  565  	hws[IMX8MM_CLK_SAI2_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai2_root_clk", "sai2", base + 0x4340, 0, &sh=
are_count_sai2);
9c71f9ea35d74a Peng Fan        2019-12-12  566  	hws[IMX8MM_CLK_SAI2_IPG] =
=3D imx_clk_hw_gate2_shared2("sai2_ipg_clk", "ipg_audio_root", base + 0x434=
0, 0, &share_count_sai2);
9c71f9ea35d74a Peng Fan        2019-12-12  567  	hws[IMX8MM_CLK_SAI3_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai3_root_clk", "sai3", base + 0x4350, 0, &sh=
are_count_sai3);
9c71f9ea35d74a Peng Fan        2019-12-12  568  	hws[IMX8MM_CLK_SAI3_IPG] =
=3D imx_clk_hw_gate2_shared2("sai3_ipg_clk", "ipg_audio_root", base + 0x435=
0, 0, &share_count_sai3);
9c71f9ea35d74a Peng Fan        2019-12-12  569  	hws[IMX8MM_CLK_SAI4_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai4_root_clk", "sai4", base + 0x4360, 0, &sh=
are_count_sai4);
9c71f9ea35d74a Peng Fan        2019-12-12  570  	hws[IMX8MM_CLK_SAI4_IPG] =
=3D imx_clk_hw_gate2_shared2("sai4_ipg_clk", "ipg_audio_root", base + 0x436=
0, 0, &share_count_sai4);
9c71f9ea35d74a Peng Fan        2019-12-12  571  	hws[IMX8MM_CLK_SAI5_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai5_root_clk", "sai5", base + 0x4370, 0, &sh=
are_count_sai5);
9c71f9ea35d74a Peng Fan        2019-12-12  572  	hws[IMX8MM_CLK_SAI5_IPG] =
=3D imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x437=
0, 0, &share_count_sai5);
9c71f9ea35d74a Peng Fan        2019-12-12  573  	hws[IMX8MM_CLK_SAI6_ROOT] =
=3D imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &sh=
are_count_sai6);
9c71f9ea35d74a Peng Fan        2019-12-12  574  	hws[IMX8MM_CLK_SAI6_IPG] =
=3D imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x438=
0, 0, &share_count_sai6);
9c71f9ea35d74a Peng Fan        2019-12-12  575  	hws[IMX8MM_CLK_SNVS_ROOT] =
=3D imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  576  	hws[IMX8MM_CLK_UART1_ROOT]=
 =3D imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  577  	hws[IMX8MM_CLK_UART2_ROOT]=
 =3D imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  578  	hws[IMX8MM_CLK_UART3_ROOT]=
 =3D imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  579  	hws[IMX8MM_CLK_UART4_ROOT]=
 =3D imx_clk_hw_gate4("uart4_root_clk", "uart4", base + 0x44c0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  580  	hws[IMX8MM_CLK_USB1_CTRL_R=
OOT] =3D imx_clk_hw_gate4("usb1_ctrl_root_clk", "usb_bus", base + 0x44d0, 0=
);
811e4171d0f5ac Peng Fan        2020-01-28  581  	hws[IMX8MM_CLK_GPU3D_ROOT]=
 =3D imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", base + 0x44f0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  582  	hws[IMX8MM_CLK_USDHC1_ROOT=
] =3D imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", base + 0x4510, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  583  	hws[IMX8MM_CLK_USDHC2_ROOT=
] =3D imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", base + 0x4520, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  584  	hws[IMX8MM_CLK_WDOG1_ROOT]=
 =3D imx_clk_hw_gate4("wdog1_root_clk", "wdog", base + 0x4530, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  585  	hws[IMX8MM_CLK_WDOG2_ROOT]=
 =3D imx_clk_hw_gate4("wdog2_root_clk", "wdog", base + 0x4540, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  586  	hws[IMX8MM_CLK_WDOG3_ROOT]=
 =3D imx_clk_hw_gate4("wdog3_root_clk", "wdog", base + 0x4550, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  587  	hws[IMX8MM_CLK_VPU_G1_ROOT=
] =3D imx_clk_hw_gate4("vpu_g1_root_clk", "vpu_g1", base + 0x4560, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  588  	hws[IMX8MM_CLK_GPU_BUS_ROO=
T] =3D imx_clk_hw_gate4("gpu_root_clk", "gpu_axi", base + 0x4570, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  589  	hws[IMX8MM_CLK_VPU_H1_ROOT=
] =3D imx_clk_hw_gate4("vpu_h1_root_clk", "vpu_h1", base + 0x4590, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  590  	hws[IMX8MM_CLK_VPU_G2_ROOT=
] =3D imx_clk_hw_gate4("vpu_g2_root_clk", "vpu_g2", base + 0x45a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  591  	hws[IMX8MM_CLK_PDM_ROOT] =
=3D imx_clk_hw_gate2_shared2("pdm_root_clk", "pdm", base + 0x45b0, 0, &shar=
e_count_pdm);
9c71f9ea35d74a Peng Fan        2019-12-12  592  	hws[IMX8MM_CLK_PDM_IPG]  =
=3D imx_clk_hw_gate2_shared2("pdm_ipg_clk", "ipg_audio_root", base + 0x45b0=
, 0, &share_count_pdm);
9c71f9ea35d74a Peng Fan        2019-12-12  593  	hws[IMX8MM_CLK_DISP_ROOT] =
=3D imx_clk_hw_gate2_shared2("disp_root_clk", "disp_dc8000", base + 0x45d0,=
 0, &share_count_disp);
9c71f9ea35d74a Peng Fan        2019-12-12  594  	hws[IMX8MM_CLK_DISP_AXI_RO=
OT]  =3D imx_clk_hw_gate2_shared2("disp_axi_root_clk", "disp_axi", base + 0=
x45d0, 0, &share_count_disp);
9c71f9ea35d74a Peng Fan        2019-12-12  595  	hws[IMX8MM_CLK_DISP_APB_RO=
OT]  =3D imx_clk_hw_gate2_shared2("disp_apb_root_clk", "disp_apb", base + 0=
x45d0, 0, &share_count_disp);
9c71f9ea35d74a Peng Fan        2019-12-12  596  	hws[IMX8MM_CLK_DISP_RTRM_R=
OOT] =3D imx_clk_hw_gate2_shared2("disp_rtrm_root_clk", "disp_rtrm", base +=
 0x45d0, 0, &share_count_disp);
9c71f9ea35d74a Peng Fan        2019-12-12  597  	hws[IMX8MM_CLK_USDHC3_ROOT=
] =3D imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", base + 0x45e0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  598  	hws[IMX8MM_CLK_TMU_ROOT] =
=3D imx_clk_hw_gate4("tmu_root_clk", "ipg_root", base + 0x4620, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  599  	hws[IMX8MM_CLK_VPU_DEC_ROO=
T] =3D imx_clk_hw_gate4("vpu_dec_root_clk", "vpu_bus", base + 0x4630, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  600  	hws[IMX8MM_CLK_SDMA1_ROOT]=
 =3D imx_clk_hw_gate4("sdma1_clk", "ipg_root", base + 0x43a0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  601  	hws[IMX8MM_CLK_SDMA2_ROOT]=
 =3D imx_clk_hw_gate4("sdma2_clk", "ipg_audio_root", base + 0x43b0, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  602  	hws[IMX8MM_CLK_SDMA3_ROOT]=
 =3D imx_clk_hw_gate4("sdma3_clk", "ipg_audio_root", base + 0x45f0, 0);
811e4171d0f5ac Peng Fan        2020-01-28  603  	hws[IMX8MM_CLK_GPU2D_ROOT]=
 =3D imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", base + 0x4660, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  604  	hws[IMX8MM_CLK_CSI1_ROOT] =
=3D imx_clk_hw_gate4("csi1_root_clk", "csi1_core", base + 0x4650, 0);
9c71f9ea35d74a Peng Fan        2019-12-12  605  =

9c71f9ea35d74a Peng Fan        2019-12-12  606  	hws[IMX8MM_CLK_GPT_3M] =3D=
 imx_clk_hw_fixed_factor("gpt_3m", "osc_24m", 1, 8);
9c71f9ea35d74a Peng Fan        2019-12-12  607  =

9c71f9ea35d74a Peng Fan        2019-12-12  608  	hws[IMX8MM_CLK_DRAM_ALT_RO=
OT] =3D imx_clk_hw_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
9c71f9ea35d74a Peng Fan        2019-12-12  609  	hws[IMX8MM_CLK_DRAM_CORE] =
=3D imx_clk_hw_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mm_dra=
m_core_sels, ARRAY_SIZE(imx8mm_dram_core_sels), CLK_IS_CRITICAL);
9c71f9ea35d74a Peng Fan        2019-12-12  610  =

d3b70cd87e773b Peng Fan        2020-02-19  611  	hws[IMX8MM_CLK_ARM] =3D im=
x_clk_hw_cpu("arm", "arm_a53_core",
d3b70cd87e773b Peng Fan        2020-02-19  612  					   hws[IMX8MM_CLK_A53_=
CORE]->clk,
d3b70cd87e773b Peng Fan        2020-02-19  613  					   hws[IMX8MM_CLK_A53_=
CORE]->clk,
9c71f9ea35d74a Peng Fan        2019-12-12  614  					   hws[IMX8MM_ARM_PLL_=
OUT]->clk,
d3b70cd87e773b Peng Fan        2020-02-19  615  					   hws[IMX8MM_CLK_A53_=
DIV]->clk);
9c71f9ea35d74a Peng Fan        2019-12-12  616  =

9c71f9ea35d74a Peng Fan        2019-12-12  617  	imx_check_clk_hws(hws, IMX=
8MM_CLK_END);
9c71f9ea35d74a Peng Fan        2019-12-12  618  =

9c71f9ea35d74a Peng Fan        2019-12-12  619  	ret =3D of_clk_add_hw_prov=
ider(np, of_clk_hw_onecell_get, clk_hw_data);
ba5625c3e272c7 Bai Ping        2019-01-22  620  	if (ret < 0) {
9c71f9ea35d74a Peng Fan        2019-12-12  621  		dev_err(dev, "failed to r=
egister clks for i.MX8MM\n");
9c71f9ea35d74a Peng Fan        2019-12-12  622  		goto unregister_hws;
9c71f9ea35d74a Peng Fan        2019-12-12  623  	}
9c71f9ea35d74a Peng Fan        2019-12-12  624  =

9c71f9ea35d74a Peng Fan        2019-12-12  625  	for (i =3D 0; i < ARRAY_SI=
ZE(uart_clk_ids); i++) {
9c71f9ea35d74a Peng Fan        2019-12-12  626  		int index =3D uart_clk_id=
s[i];
9c71f9ea35d74a Peng Fan        2019-12-12  627  =

9c71f9ea35d74a Peng Fan        2019-12-12  628  		uart_hws[i] =3D &hws[inde=
x]->clk;
ba5625c3e272c7 Bai Ping        2019-01-22  629  	}
ba5625c3e272c7 Bai Ping        2019-01-22  630  =

9c71f9ea35d74a Peng Fan        2019-12-12  631  	imx_register_uart_clocks(u=
art_hws);
ba5625c3e272c7 Bai Ping        2019-01-22  632  =

ba5625c3e272c7 Bai Ping        2019-01-22  633  	return 0;
ef7e6a1284374f Anson Huang     2019-08-06  634  =

9c71f9ea35d74a Peng Fan        2019-12-12  635  unregister_hws:
9c71f9ea35d74a Peng Fan        2019-12-12  636  	imx_unregister_hw_clocks(h=
ws, IMX8MM_CLK_END);
ef7e6a1284374f Anson Huang     2019-08-06  637  =

ef7e6a1284374f Anson Huang     2019-08-06 @638  	return ret;
ba5625c3e272c7 Bai Ping        2019-01-22  639  }
af7e7ee0e4280c Abel Vesa       2019-07-09  640  =


:::::: The code at line 638 was first introduced by commit
:::::: ef7e6a1284374f22ca7016ae3f7c3dfccf7a3de2 clk: imx8mm: Unregister clk=
s when of_clk_add_provider failed

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6771954465787104141==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ioHP1/IBAA==
--===============6771954465787104141==--

