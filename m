Content-Type: multipart/mixed; boundary="===============0275529184214017791=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/imx/clk-imx8mp.c:435:5: warning: Variable 'np' is reassigned a value before the old one has been used.
Date: Tue, 15 Sep 2020 03:22:20 +0800
Message-ID: <202009150301.AXICsMp9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0275529184214017791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anson Huang <Anson.Huang@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Abel Vesa <abel.vesa@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   856deb866d16e29bd65952e0289066f6078af773
commit: 9c140d9926761b0f5d329ff6c09a1540f3d5e1d3 clk: imx: Add support for =
i.MX8MP clock driver
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/clk/imx/clk-pllv3.c:65:34: warning: Shifting signed 32-bit value=
 by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (readl_relaxed(pll->base) & BM_PLL_LOCK)
                                    ^
   drivers/clk/imx/clk-pllv3.c:72:36: warning: Shifting signed 32-bit value=
 by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    return readl_relaxed(pll->base) & BM_PLL_LOCK ? 0 : -ETIMEDOUT;
                                      ^
   drivers/clk/imx/clk-pllv3.c:107:33: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (readl_relaxed(pll->base) & BM_PLL_LOCK)
                                   ^
   drivers/clk/imx/clk-sscg-pll.c:205:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    ret =3D clk_sscg_divr2_lookup(setup, temp_setup);
        ^
   drivers/clk/imx/clk-sscg-pll.c:198:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/clk/imx/clk-sscg-pll.c:205:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    ret =3D clk_sscg_divr2_lookup(setup, temp_setup);
        ^
   drivers/clk/imx/clk-sscg-pll.c:264:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    ret =3D clk_sscg_divr1_lookup(setup, temp_setup);
        ^
   drivers/clk/imx/clk-sscg-pll.c:257:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/clk/imx/clk-sscg-pll.c:264:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    ret =3D clk_sscg_divr1_lookup(setup, temp_setup);
        ^
   drivers/clk/imx/clk-sscg-pll.c:449:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. 'break;' missing? [redundantA=
ssignInSwitch]
    ret =3D __clk_determine_rate(parent_hw, req);
        ^
   drivers/clk/imx/clk-sscg-pll.c:431:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used. 'break;' missing?
    int ret =3D -EINVAL;
   ^
   drivers/clk/imx/clk-sscg-pll.c:449:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used. 'break;' missing?
    ret =3D __clk_determine_rate(parent_hw, req);
        ^
   drivers/clk/imx/clk-sscg-pll.c:475:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    ret =3D __clk_sscg_pll_determine_rate(hw, req, req->rate, req->rate,
        ^
   drivers/clk/imx/clk-sscg-pll.c:470:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/clk/imx/clk-sscg-pll.c:475:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    ret =3D __clk_sscg_pll_determine_rate(hw, req, req->rate, req->rate,
        ^
>> drivers/clk/imx/clk-sscg-pll.c:537:12: warning: Variable 'pll->base' is =
reassigned a value before the old one has been used. [redundantAssignment]
    pll->base =3D base;
              ^
   drivers/clk/imx/clk-sscg-pll.c:529:12: note: Variable 'pll->base' is rea=
ssigned a value before the old one has been used.
    pll->base =3D base;
              ^
   drivers/clk/imx/clk-sscg-pll.c:537:12: note: Variable 'pll->base' is rea=
ssigned a value before the old one has been used.
    pll->base =3D base;
              ^
--
>> drivers/clk/imx/clk-imx8mp.c:435:5: warning: Variable 'np' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
       ^
   drivers/clk/imx/clk-imx8mp.c:431:0: note: Variable 'np' is reassigned a =
value before the old one has been used.
    struct device_node *np =3D dev->of_node;
   ^
   drivers/clk/imx/clk-imx8mp.c:435:5: note: Variable 'np' is reassigned a =
value before the old one has been used.
    np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
       ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D9c140d9926761b0f5d329ff6c09a1540f3d5e1d3
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 9c140d9926761b0f5d329ff6c09a1540f3d5e1d3
vim +/np +435 drivers/clk/imx/clk-imx8mp.c

9c140d9926761b0 Anson Huang 2020-01-08  427  =

9c140d9926761b0 Anson Huang 2020-01-08  428  static int imx8mp_clocks_probe=
(struct platform_device *pdev)
9c140d9926761b0 Anson Huang 2020-01-08  429  {
9c140d9926761b0 Anson Huang 2020-01-08  430  	struct device *dev =3D &pdev-=
>dev;
9c140d9926761b0 Anson Huang 2020-01-08  431  	struct device_node *np =3D de=
v->of_node;
9c140d9926761b0 Anson Huang 2020-01-08  432  	void __iomem *anatop_base, *c=
cm_base;
9c140d9926761b0 Anson Huang 2020-01-08  433  	int i;
9c140d9926761b0 Anson Huang 2020-01-08  434  =

9c140d9926761b0 Anson Huang 2020-01-08 @435  	np =3D of_find_compatible_nod=
e(NULL, NULL, "fsl,imx8mp-anatop");
9c140d9926761b0 Anson Huang 2020-01-08  436  	anatop_base =3D of_iomap(np, =
0);
9c140d9926761b0 Anson Huang 2020-01-08  437  	if (WARN_ON(!anatop_base))
9c140d9926761b0 Anson Huang 2020-01-08  438  		return -ENOMEM;
9c140d9926761b0 Anson Huang 2020-01-08  439  =

9c140d9926761b0 Anson Huang 2020-01-08  440  	np =3D dev->of_node;
9c140d9926761b0 Anson Huang 2020-01-08  441  	ccm_base =3D devm_platform_io=
remap_resource(pdev, 0);
9c140d9926761b0 Anson Huang 2020-01-08  442  	if (WARN_ON(IS_ERR(ccm_base))=
) {
9c140d9926761b0 Anson Huang 2020-01-08  443  		iounmap(anatop_base);
9c140d9926761b0 Anson Huang 2020-01-08  444  		return PTR_ERR(ccm_base);
9c140d9926761b0 Anson Huang 2020-01-08  445  	}
9c140d9926761b0 Anson Huang 2020-01-08  446  =

9c140d9926761b0 Anson Huang 2020-01-08  447  	clk_hw_data =3D kzalloc(struc=
t_size(clk_hw_data, hws, IMX8MP_CLK_END), GFP_KERNEL);
9c140d9926761b0 Anson Huang 2020-01-08  448  	if (WARN_ON(!clk_hw_data)) {
9c140d9926761b0 Anson Huang 2020-01-08  449  		iounmap(anatop_base);
9c140d9926761b0 Anson Huang 2020-01-08  450  		return -ENOMEM;
9c140d9926761b0 Anson Huang 2020-01-08  451  	}
9c140d9926761b0 Anson Huang 2020-01-08  452  =

9c140d9926761b0 Anson Huang 2020-01-08  453  	clk_hw_data->num =3D IMX8MP_C=
LK_END;
9c140d9926761b0 Anson Huang 2020-01-08  454  	hws =3D clk_hw_data->hws;
9c140d9926761b0 Anson Huang 2020-01-08  455  =

9c140d9926761b0 Anson Huang 2020-01-08  456  	hws[IMX8MP_CLK_DUMMY] =3D imx=
_clk_hw_fixed("dummy", 0);
9c140d9926761b0 Anson Huang 2020-01-08  457  	hws[IMX8MP_CLK_24M] =3D imx_o=
btain_fixed_clk_hw(np, "osc_24m");
9c140d9926761b0 Anson Huang 2020-01-08  458  	hws[IMX8MP_CLK_32K] =3D imx_o=
btain_fixed_clk_hw(np, "osc_32k");
9c140d9926761b0 Anson Huang 2020-01-08  459  	hws[IMX8MP_CLK_EXT1] =3D imx_=
obtain_fixed_clk_hw(np, "clk_ext1");
9c140d9926761b0 Anson Huang 2020-01-08  460  	hws[IMX8MP_CLK_EXT2] =3D imx_=
obtain_fixed_clk_hw(np, "clk_ext2");
9c140d9926761b0 Anson Huang 2020-01-08  461  	hws[IMX8MP_CLK_EXT3] =3D imx_=
obtain_fixed_clk_hw(np, "clk_ext3");
9c140d9926761b0 Anson Huang 2020-01-08  462  	hws[IMX8MP_CLK_EXT4] =3D imx_=
obtain_fixed_clk_hw(np, "clk_ext4");
9c140d9926761b0 Anson Huang 2020-01-08  463  =

9c140d9926761b0 Anson Huang 2020-01-08  464  	hws[IMX8MP_AUDIO_PLL1_REF_SEL=
] =3D imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref=
_sels, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  465  	hws[IMX8MP_AUDIO_PLL2_REF_SEL=
] =3D imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_re=
f_sels, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  466  	hws[IMX8MP_VIDEO_PLL1_REF_SEL=
] =3D imx_clk_hw_mux("video_pll1_ref_sel", anatop_base + 0x28, 0, 2, pll_re=
f_sels, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  467  	hws[IMX8MP_DRAM_PLL_REF_SEL] =
=3D imx_clk_hw_mux("dram_pll_ref_sel", anatop_base + 0x50, 0, 2, pll_ref_se=
ls, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  468  	hws[IMX8MP_GPU_PLL_REF_SEL] =
=3D imx_clk_hw_mux("gpu_pll_ref_sel", anatop_base + 0x64, 0, 2, pll_ref_sel=
s, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  469  	hws[IMX8MP_VPU_PLL_REF_SEL] =
=3D imx_clk_hw_mux("vpu_pll_ref_sel", anatop_base + 0x74, 0, 2, pll_ref_sel=
s, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  470  	hws[IMX8MP_ARM_PLL_REF_SEL] =
=3D imx_clk_hw_mux("arm_pll_ref_sel", anatop_base + 0x84, 0, 2, pll_ref_sel=
s, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  471  	hws[IMX8MP_SYS_PLL1_REF_SEL] =
=3D imx_clk_hw_mux("sys_pll1_ref_sel", anatop_base + 0x94, 0, 2, pll_ref_se=
ls, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  472  	hws[IMX8MP_SYS_PLL2_REF_SEL] =
=3D imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_s=
els, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  473  	hws[IMX8MP_SYS_PLL3_REF_SEL] =
=3D imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_s=
els, ARRAY_SIZE(pll_ref_sels));
9c140d9926761b0 Anson Huang 2020-01-08  474  =

9c140d9926761b0 Anson Huang 2020-01-08  475  	hws[IMX8MP_AUDIO_PLL1] =3D im=
x_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443=
x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  476  	hws[IMX8MP_AUDIO_PLL2] =3D im=
x_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &i=
mx_1443x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  477  	hws[IMX8MP_VIDEO_PLL1] =3D im=
x_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &i=
mx_1443x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  478  	hws[IMX8MP_DRAM_PLL] =3D imx_=
clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_144=
3x_dram_pll);
9c140d9926761b0 Anson Huang 2020-01-08  479  	hws[IMX8MP_GPU_PLL] =3D imx_c=
lk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_=
pll);
9c140d9926761b0 Anson Huang 2020-01-08  480  	hws[IMX8MP_VPU_PLL] =3D imx_c=
lk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_=
pll);
9c140d9926761b0 Anson Huang 2020-01-08  481  	hws[IMX8MP_ARM_PLL] =3D imx_c=
lk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_=
pll);
9c140d9926761b0 Anson Huang 2020-01-08  482  	hws[IMX8MP_SYS_PLL1] =3D imx_=
clk_hw_pll14xx("sys_pll1", "sys_pll1_ref_sel", anatop_base + 0x94, &imx_141=
6x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  483  	hws[IMX8MP_SYS_PLL2] =3D imx_=
clk_hw_pll14xx("sys_pll2", "sys_pll2_ref_sel", anatop_base + 0x104, &imx_14=
16x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  484  	hws[IMX8MP_SYS_PLL3] =3D imx_=
clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", anatop_base + 0x114, &imx_14=
16x_pll);
9c140d9926761b0 Anson Huang 2020-01-08  485  =

9c140d9926761b0 Anson Huang 2020-01-08  486  	hws[IMX8MP_AUDIO_PLL1_BYPASS]=
 =3D imx_clk_hw_mux_flags("audio_pll1_bypass", anatop_base, 4, 1, audio_pll=
1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  487  	hws[IMX8MP_AUDIO_PLL2_BYPASS]=
 =3D imx_clk_hw_mux_flags("audio_pll2_bypass", anatop_base + 0x14, 4, 1, au=
dio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARE=
NT);
9c140d9926761b0 Anson Huang 2020-01-08  488  	hws[IMX8MP_VIDEO_PLL1_BYPASS]=
 =3D imx_clk_hw_mux_flags("video_pll1_bypass", anatop_base + 0x28, 4, 1, vi=
deo_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARE=
NT);
9c140d9926761b0 Anson Huang 2020-01-08  489  	hws[IMX8MP_DRAM_PLL_BYPASS] =
=3D imx_clk_hw_mux_flags("dram_pll_bypass", anatop_base + 0x50, 4, 1, dram_=
pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  490  	hws[IMX8MP_GPU_PLL_BYPASS] =
=3D imx_clk_hw_mux_flags("gpu_pll_bypass", anatop_base + 0x64, 4, 1, gpu_pl=
l_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  491  	hws[IMX8MP_VPU_PLL_BYPASS] =
=3D imx_clk_hw_mux_flags("vpu_pll_bypass", anatop_base + 0x74, 4, 1, vpu_pl=
l_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  492  	hws[IMX8MP_ARM_PLL_BYPASS] =
=3D imx_clk_hw_mux_flags("arm_pll_bypass", anatop_base + 0x84, 4, 1, arm_pl=
l_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  493  	hws[IMX8MP_SYS_PLL1_BYPASS] =
=3D imx_clk_hw_mux_flags("sys_pll1_bypass", anatop_base + 0x94, 4, 1, sys_p=
ll1_bypass_sels, ARRAY_SIZE(sys_pll1_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  494  	hws[IMX8MP_SYS_PLL2_BYPASS] =
=3D imx_clk_hw_mux_flags("sys_pll2_bypass", anatop_base + 0x104, 4, 1, sys_=
pll2_bypass_sels, ARRAY_SIZE(sys_pll2_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  495  	hws[IMX8MP_SYS_PLL3_BYPASS] =
=3D imx_clk_hw_mux_flags("sys_pll3_bypass", anatop_base + 0x114, 4, 1, sys_=
pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
9c140d9926761b0 Anson Huang 2020-01-08  496  =

9c140d9926761b0 Anson Huang 2020-01-08  497  	hws[IMX8MP_AUDIO_PLL1_OUT] =
=3D imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", anatop_base, 13);
9c140d9926761b0 Anson Huang 2020-01-08  498  	hws[IMX8MP_AUDIO_PLL2_OUT] =
=3D imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", anatop_base + 0x=
14, 13);
9c140d9926761b0 Anson Huang 2020-01-08  499  	hws[IMX8MP_VIDEO_PLL1_OUT] =
=3D imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", anatop_base + 0x=
28, 13);
9c140d9926761b0 Anson Huang 2020-01-08  500  	hws[IMX8MP_DRAM_PLL_OUT] =3D =
imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", anatop_base + 0x50, 13);
9c140d9926761b0 Anson Huang 2020-01-08  501  	hws[IMX8MP_GPU_PLL_OUT] =3D i=
mx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", anatop_base + 0x64, 11);
9c140d9926761b0 Anson Huang 2020-01-08  502  	hws[IMX8MP_VPU_PLL_OUT] =3D i=
mx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", anatop_base + 0x74, 11);
9c140d9926761b0 Anson Huang 2020-01-08  503  	hws[IMX8MP_ARM_PLL_OUT] =3D i=
mx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", anatop_base + 0x84, 11);
9c140d9926761b0 Anson Huang 2020-01-08  504  	hws[IMX8MP_SYS_PLL1_OUT] =3D =
imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass", anatop_base + 0x94, 11);
9c140d9926761b0 Anson Huang 2020-01-08  505  	hws[IMX8MP_SYS_PLL2_OUT] =3D =
imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass", anatop_base + 0x104, 11);
9c140d9926761b0 Anson Huang 2020-01-08  506  	hws[IMX8MP_SYS_PLL3_OUT] =3D =
imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", anatop_base + 0x114, 11);
9c140d9926761b0 Anson Huang 2020-01-08  507  =

9c140d9926761b0 Anson Huang 2020-01-08  508  	hws[IMX8MP_SYS_PLL1_40M] =3D =
imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
9c140d9926761b0 Anson Huang 2020-01-08  509  	hws[IMX8MP_SYS_PLL1_80M] =3D =
imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
9c140d9926761b0 Anson Huang 2020-01-08  510  	hws[IMX8MP_SYS_PLL1_100M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
9c140d9926761b0 Anson Huang 2020-01-08  511  	hws[IMX8MP_SYS_PLL1_133M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
9c140d9926761b0 Anson Huang 2020-01-08  512  	hws[IMX8MP_SYS_PLL1_160M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
9c140d9926761b0 Anson Huang 2020-01-08  513  	hws[IMX8MP_SYS_PLL1_200M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
9c140d9926761b0 Anson Huang 2020-01-08  514  	hws[IMX8MP_SYS_PLL1_266M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
9c140d9926761b0 Anson Huang 2020-01-08  515  	hws[IMX8MP_SYS_PLL1_400M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
9c140d9926761b0 Anson Huang 2020-01-08  516  	hws[IMX8MP_SYS_PLL1_800M] =3D=
 imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
9c140d9926761b0 Anson Huang 2020-01-08  517  =

9c140d9926761b0 Anson Huang 2020-01-08  518  	hws[IMX8MP_SYS_PLL2_50M] =3D =
imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
9c140d9926761b0 Anson Huang 2020-01-08  519  	hws[IMX8MP_SYS_PLL2_100M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
9c140d9926761b0 Anson Huang 2020-01-08  520  	hws[IMX8MP_SYS_PLL2_125M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
9c140d9926761b0 Anson Huang 2020-01-08  521  	hws[IMX8MP_SYS_PLL2_166M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
9c140d9926761b0 Anson Huang 2020-01-08  522  	hws[IMX8MP_SYS_PLL2_200M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
9c140d9926761b0 Anson Huang 2020-01-08  523  	hws[IMX8MP_SYS_PLL2_250M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
9c140d9926761b0 Anson Huang 2020-01-08  524  	hws[IMX8MP_SYS_PLL2_333M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
9c140d9926761b0 Anson Huang 2020-01-08  525  	hws[IMX8MP_SYS_PLL2_500M] =3D=
 imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
9c140d9926761b0 Anson Huang 2020-01-08  526  	hws[IMX8MP_SYS_PLL2_1000M] =
=3D imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
9c140d9926761b0 Anson Huang 2020-01-08  527  =

9c140d9926761b0 Anson Huang 2020-01-08  528  	hws[IMX8MP_CLK_A53_SRC] =3D i=
mx_clk_hw_mux2("arm_a53_src", ccm_base + 0x8000, 24, 3, imx8mp_a53_sels, AR=
RAY_SIZE(imx8mp_a53_sels));
9c140d9926761b0 Anson Huang 2020-01-08  529  	hws[IMX8MP_CLK_M7_SRC] =3D im=
x_clk_hw_mux2("arm_m7_src", ccm_base + 0x8080, 24, 3, imx8mp_m7_sels, ARRAY=
_SIZE(imx8mp_m7_sels));
9c140d9926761b0 Anson Huang 2020-01-08  530  	hws[IMX8MP_CLK_ML_SRC] =3D im=
x_clk_hw_mux2("ml_src", ccm_base + 0x8100, 24, 3, imx8mp_ml_sels, ARRAY_SIZ=
E(imx8mp_ml_sels));
9c140d9926761b0 Anson Huang 2020-01-08  531  	hws[IMX8MP_CLK_GPU3D_CORE_SRC=
] =3D imx_clk_hw_mux2("gpu3d_core_src", ccm_base + 0x8180, 24, 3,  imx8mp_g=
pu3d_core_sels, ARRAY_SIZE(imx8mp_gpu3d_core_sels));
9c140d9926761b0 Anson Huang 2020-01-08  532  	hws[IMX8MP_CLK_GPU3D_SHADER_S=
RC] =3D imx_clk_hw_mux2("gpu3d_shader_src", ccm_base + 0x8200, 24, 3, imx8m=
p_gpu3d_shader_sels, ARRAY_SIZE(imx8mp_gpu3d_shader_sels));
9c140d9926761b0 Anson Huang 2020-01-08  533  	hws[IMX8MP_CLK_GPU2D_SRC] =3D=
 imx_clk_hw_mux2("gpu2d_src", ccm_base + 0x8280, 24, 3, imx8mp_gpu2d_sels, =
ARRAY_SIZE(imx8mp_gpu2d_sels));
9c140d9926761b0 Anson Huang 2020-01-08  534  	hws[IMX8MP_CLK_AUDIO_AXI_SRC]=
 =3D imx_clk_hw_mux2("audio_axi_src", ccm_base + 0x8300, 24, 3, imx8mp_audi=
o_axi_sels, ARRAY_SIZE(imx8mp_audio_axi_sels));
9c140d9926761b0 Anson Huang 2020-01-08  535  	hws[IMX8MP_CLK_HSIO_AXI_SRC] =
=3D imx_clk_hw_mux2("hsio_axi_src", ccm_base + 0x8380, 24, 3, imx8mp_hsio_a=
xi_sels, ARRAY_SIZE(imx8mp_hsio_axi_sels));
9c140d9926761b0 Anson Huang 2020-01-08  536  	hws[IMX8MP_CLK_MEDIA_ISP_SRC]=
 =3D imx_clk_hw_mux2("media_isp_src", ccm_base + 0x8400, 24, 3, imx8mp_medi=
a_isp_sels, ARRAY_SIZE(imx8mp_media_isp_sels));
9c140d9926761b0 Anson Huang 2020-01-08  537  	hws[IMX8MP_CLK_A53_CG] =3D im=
x_clk_hw_gate3("arm_a53_cg", "arm_a53_src", ccm_base + 0x8000, 28);
9c140d9926761b0 Anson Huang 2020-01-08  538  	hws[IMX8MP_CLK_M4_CG] =3D imx=
_clk_hw_gate3("arm_m7_cg", "arm_m7_src", ccm_base + 0x8080, 28);
9c140d9926761b0 Anson Huang 2020-01-08  539  	hws[IMX8MP_CLK_ML_CG] =3D imx=
_clk_hw_gate3("ml_cg", "ml_src", ccm_base + 0x8100, 28);
9c140d9926761b0 Anson Huang 2020-01-08  540  	hws[IMX8MP_CLK_GPU3D_CORE_CG]=
 =3D imx_clk_hw_gate3("gpu3d_core_cg", "gpu3d_core_src", ccm_base + 0x8180,=
 28);
9c140d9926761b0 Anson Huang 2020-01-08  541  	hws[IMX8MP_CLK_GPU3D_SHADER_C=
G] =3D imx_clk_hw_gate3("gpu3d_shader_cg", "gpu3d_shader_src", ccm_base + 0=
x8200, 28);
9c140d9926761b0 Anson Huang 2020-01-08  542  	hws[IMX8MP_CLK_GPU2D_CG] =3D =
imx_clk_hw_gate3("gpu2d_cg", "gpu2d_src", ccm_base + 0x8280, 28);
9c140d9926761b0 Anson Huang 2020-01-08  543  	hws[IMX8MP_CLK_AUDIO_AXI_CG] =
=3D imx_clk_hw_gate3("audio_axi_cg", "audio_axi_src", ccm_base + 0x8300, 28=
);
9c140d9926761b0 Anson Huang 2020-01-08  544  	hws[IMX8MP_CLK_HSIO_AXI_CG] =
=3D imx_clk_hw_gate3("hsio_axi_cg", "hsio_axi_src", ccm_base + 0x8380, 28);
9c140d9926761b0 Anson Huang 2020-01-08  545  	hws[IMX8MP_CLK_MEDIA_ISP_CG] =
=3D imx_clk_hw_gate3("media_isp_cg", "media_isp_src", ccm_base + 0x8400, 28=
);
9c140d9926761b0 Anson Huang 2020-01-08  546  	hws[IMX8MP_CLK_A53_DIV] =3D i=
mx_clk_hw_divider2("arm_a53_div", "arm_a53_cg", ccm_base + 0x8000, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  547  	hws[IMX8MP_CLK_M7_DIV] =3D im=
x_clk_hw_divider2("arm_m7_div", "arm_m7_cg", ccm_base + 0x8080, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  548  	hws[IMX8MP_CLK_ML_DIV] =3D im=
x_clk_hw_divider2("ml_div", "ml_cg", ccm_base + 0x8100, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  549  	hws[IMX8MP_CLK_GPU3D_CORE_DIV=
] =3D imx_clk_hw_divider2("gpu3d_core_div", "gpu3d_core_cg", ccm_base + 0x8=
180, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  550  	hws[IMX8MP_CLK_GPU3D_SHADER_D=
IV] =3D imx_clk_hw_divider2("gpu3d_shader_div", "gpu3d_shader_cg", ccm_base=
 + 0x8200, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  551  	hws[IMX8MP_CLK_GPU2D_DIV] =3D=
 imx_clk_hw_divider2("gpu2d_div", "gpu2d_cg", ccm_base + 0x8280, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  552  	hws[IMX8MP_CLK_AUDIO_AXI_DIV]=
 =3D imx_clk_hw_divider2("audio_axi_div", "audio_axi_cg", ccm_base + 0x8300=
, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  553  	hws[IMX8MP_CLK_HSIO_AXI_DIV] =
=3D imx_clk_hw_divider2("hsio_axi_div", "hsio_axi_cg", ccm_base + 0x8380, 0=
, 3);
9c140d9926761b0 Anson Huang 2020-01-08  554  	hws[IMX8MP_CLK_MEDIA_ISP_DIV]=
 =3D imx_clk_hw_divider2("media_isp_div", "media_isp_cg", ccm_base + 0x8400=
, 0, 3);
9c140d9926761b0 Anson Huang 2020-01-08  555  =

9c140d9926761b0 Anson Huang 2020-01-08  556  	hws[IMX8MP_CLK_MAIN_AXI] =3D =
imx8m_clk_hw_composite_critical("main_axi", imx8mp_main_axi_sels, ccm_base =
+ 0x8800);
9c140d9926761b0 Anson Huang 2020-01-08  557  	hws[IMX8MP_CLK_ENET_AXI] =3D =
imx8m_clk_hw_composite("enet_axi", imx8mp_enet_axi_sels, ccm_base + 0x8880);
9c140d9926761b0 Anson Huang 2020-01-08  558  	hws[IMX8MP_CLK_NAND_USDHC_BUS=
] =3D imx8m_clk_hw_composite_critical("nand_usdhc_bus", imx8mp_nand_usdhc_s=
els, ccm_base + 0x8900);
9c140d9926761b0 Anson Huang 2020-01-08  559  	hws[IMX8MP_CLK_VPU_BUS] =3D i=
mx8m_clk_hw_composite("vpu_bus", imx8mp_vpu_bus_sels, ccm_base + 0x8980);
9c140d9926761b0 Anson Huang 2020-01-08  560  	hws[IMX8MP_CLK_MEDIA_AXI] =3D=
 imx8m_clk_hw_composite("media_axi", imx8mp_media_axi_sels, ccm_base + 0x8a=
00);
9c140d9926761b0 Anson Huang 2020-01-08  561  	hws[IMX8MP_CLK_MEDIA_APB] =3D=
 imx8m_clk_hw_composite("media_apb", imx8mp_media_apb_sels, ccm_base + 0x8a=
80);
9c140d9926761b0 Anson Huang 2020-01-08  562  	hws[IMX8MP_CLK_HDMI_APB] =3D =
imx8m_clk_hw_composite("hdmi_apb", imx8mp_media_apb_sels, ccm_base + 0x8b00=
);
9c140d9926761b0 Anson Huang 2020-01-08  563  	hws[IMX8MP_CLK_HDMI_AXI] =3D =
imx8m_clk_hw_composite("hdmi_axi", imx8mp_media_apb_sels, ccm_base + 0x8b80=
);
9c140d9926761b0 Anson Huang 2020-01-08  564  	hws[IMX8MP_CLK_GPU_AXI] =3D i=
mx8m_clk_hw_composite("gpu_axi", imx8mp_gpu_axi_sels, ccm_base + 0x8c00);
9c140d9926761b0 Anson Huang 2020-01-08  565  	hws[IMX8MP_CLK_GPU_AHB] =3D i=
mx8m_clk_hw_composite("gpu_ahb", imx8mp_gpu_ahb_sels, ccm_base + 0x8c80);
9c140d9926761b0 Anson Huang 2020-01-08  566  	hws[IMX8MP_CLK_NOC] =3D imx8m=
_clk_hw_composite_critical("noc", imx8mp_noc_sels, ccm_base + 0x8d00);
9c140d9926761b0 Anson Huang 2020-01-08  567  	hws[IMX8MP_CLK_NOC_IO] =3D im=
x8m_clk_hw_composite_critical("noc_io", imx8mp_noc_io_sels, ccm_base + 0x8d=
80);
9c140d9926761b0 Anson Huang 2020-01-08  568  	hws[IMX8MP_CLK_ML_AXI] =3D im=
x8m_clk_hw_composite("ml_axi", imx8mp_ml_axi_sels, ccm_base + 0x8e00);
9c140d9926761b0 Anson Huang 2020-01-08  569  	hws[IMX8MP_CLK_ML_AHB] =3D im=
x8m_clk_hw_composite("ml_ahb", imx8mp_ml_ahb_sels, ccm_base + 0x8e80);
9c140d9926761b0 Anson Huang 2020-01-08  570  =

9c140d9926761b0 Anson Huang 2020-01-08  571  	hws[IMX8MP_CLK_AHB] =3D imx8m=
_clk_hw_composite_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
9c140d9926761b0 Anson Huang 2020-01-08  572  	hws[IMX8MP_CLK_AUDIO_AHB] =3D=
 imx8m_clk_hw_composite("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x91=
00);
9c140d9926761b0 Anson Huang 2020-01-08  573  	hws[IMX8MP_CLK_MIPI_DSI_ESC_R=
X] =3D imx8m_clk_hw_composite("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sel=
s, ccm_base + 0x9200);
9c140d9926761b0 Anson Huang 2020-01-08  574  =

9c140d9926761b0 Anson Huang 2020-01-08  575  	hws[IMX8MP_CLK_IPG_ROOT] =3D =
imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
9c140d9926761b0 Anson Huang 2020-01-08  576  	hws[IMX8MP_CLK_IPG_AUDIO_ROOT=
] =3D imx_clk_hw_divider2("ipg_audio_root", "audio_ahb", ccm_base + 0x9180,=
 0, 1);
9c140d9926761b0 Anson Huang 2020-01-08  577  =

9c140d9926761b0 Anson Huang 2020-01-08  578  	hws[IMX8MP_CLK_DRAM_ALT] =3D =
imx8m_clk_hw_composite("dram_alt", imx8mp_dram_alt_sels, ccm_base + 0xa000);
9c140d9926761b0 Anson Huang 2020-01-08  579  	hws[IMX8MP_CLK_DRAM_APB] =3D =
imx8m_clk_hw_composite_critical("dram_apb", imx8mp_dram_apb_sels, ccm_base =
+ 0xa080);
9c140d9926761b0 Anson Huang 2020-01-08  580  	hws[IMX8MP_CLK_VPU_G1] =3D im=
x8m_clk_hw_composite("vpu_g1", imx8mp_vpu_g1_sels, ccm_base + 0xa100);
9c140d9926761b0 Anson Huang 2020-01-08  581  	hws[IMX8MP_CLK_VPU_G2] =3D im=
x8m_clk_hw_composite("vpu_g2", imx8mp_vpu_g2_sels, ccm_base + 0xa180);
9c140d9926761b0 Anson Huang 2020-01-08  582  	hws[IMX8MP_CLK_CAN1] =3D imx8=
m_clk_hw_composite("can1", imx8mp_can1_sels, ccm_base + 0xa200);
9c140d9926761b0 Anson Huang 2020-01-08  583  	hws[IMX8MP_CLK_CAN2] =3D imx8=
m_clk_hw_composite("can2", imx8mp_can2_sels, ccm_base + 0xa280);
9c140d9926761b0 Anson Huang 2020-01-08  584  	hws[IMX8MP_CLK_MEMREPAIR] =3D=
 imx8m_clk_hw_composite("memrepair", imx8mp_memrepair_sels, ccm_base + 0xa3=
00);
9c140d9926761b0 Anson Huang 2020-01-08  585  	hws[IMX8MP_CLK_PCIE_PHY] =3D =
imx8m_clk_hw_composite("pcie_phy", imx8mp_pcie_phy_sels, ccm_base + 0xa380);
9c140d9926761b0 Anson Huang 2020-01-08  586  	hws[IMX8MP_CLK_PCIE_AUX] =3D =
imx8m_clk_hw_composite("pcie_aux", imx8mp_pcie_aux_sels, ccm_base + 0xa400);
9c140d9926761b0 Anson Huang 2020-01-08  587  	hws[IMX8MP_CLK_I2C5] =3D imx8=
m_clk_hw_composite("i2c5", imx8mp_i2c5_sels, ccm_base + 0xa480);
9c140d9926761b0 Anson Huang 2020-01-08  588  	hws[IMX8MP_CLK_I2C6] =3D imx8=
m_clk_hw_composite("i2c6", imx8mp_i2c6_sels, ccm_base + 0xa500);
9c140d9926761b0 Anson Huang 2020-01-08  589  	hws[IMX8MP_CLK_SAI1] =3D imx8=
m_clk_hw_composite("sai1", imx8mp_sai1_sels, ccm_base + 0xa580);
9c140d9926761b0 Anson Huang 2020-01-08  590  	hws[IMX8MP_CLK_SAI2] =3D imx8=
m_clk_hw_composite("sai2", imx8mp_sai2_sels, ccm_base + 0xa600);
9c140d9926761b0 Anson Huang 2020-01-08  591  	hws[IMX8MP_CLK_SAI3] =3D imx8=
m_clk_hw_composite("sai3", imx8mp_sai3_sels, ccm_base + 0xa680);
9c140d9926761b0 Anson Huang 2020-01-08  592  	hws[IMX8MP_CLK_SAI4] =3D imx8=
m_clk_hw_composite("sai4", imx8mp_sai4_sels, ccm_base + 0xa700);
9c140d9926761b0 Anson Huang 2020-01-08  593  	hws[IMX8MP_CLK_SAI5] =3D imx8=
m_clk_hw_composite("sai5", imx8mp_sai5_sels, ccm_base + 0xa780);
9c140d9926761b0 Anson Huang 2020-01-08  594  	hws[IMX8MP_CLK_SAI6] =3D imx8=
m_clk_hw_composite("sai6", imx8mp_sai6_sels, ccm_base + 0xa800);
9c140d9926761b0 Anson Huang 2020-01-08  595  	hws[IMX8MP_CLK_ENET_QOS] =3D =
imx8m_clk_hw_composite("enet_qos", imx8mp_enet_qos_sels, ccm_base + 0xa880);
9c140d9926761b0 Anson Huang 2020-01-08  596  	hws[IMX8MP_CLK_ENET_QOS_TIMER=
] =3D imx8m_clk_hw_composite("enet_qos_timer", imx8mp_enet_qos_timer_sels, =
ccm_base + 0xa900);
9c140d9926761b0 Anson Huang 2020-01-08  597  	hws[IMX8MP_CLK_ENET_REF] =3D =
imx8m_clk_hw_composite("enet_ref", imx8mp_enet_ref_sels, ccm_base + 0xa980);
9c140d9926761b0 Anson Huang 2020-01-08  598  	hws[IMX8MP_CLK_ENET_TIMER] =
=3D imx8m_clk_hw_composite("enet_timer", imx8mp_enet_timer_sels, ccm_base +=
 0xaa00);
9c140d9926761b0 Anson Huang 2020-01-08  599  	hws[IMX8MP_CLK_ENET_PHY_REF] =
=3D imx8m_clk_hw_composite("enet_phy_ref", imx8mp_enet_phy_ref_sels, ccm_ba=
se + 0xaa80);
9c140d9926761b0 Anson Huang 2020-01-08  600  	hws[IMX8MP_CLK_NAND] =3D imx8=
m_clk_hw_composite("nand", imx8mp_nand_sels, ccm_base + 0xab00);
9c140d9926761b0 Anson Huang 2020-01-08  601  	hws[IMX8MP_CLK_QSPI] =3D imx8=
m_clk_hw_composite("qspi", imx8mp_qspi_sels, ccm_base + 0xab80);
9c140d9926761b0 Anson Huang 2020-01-08  602  	hws[IMX8MP_CLK_USDHC1] =3D im=
x8m_clk_hw_composite("usdhc1", imx8mp_usdhc1_sels, ccm_base + 0xac00);
9c140d9926761b0 Anson Huang 2020-01-08  603  	hws[IMX8MP_CLK_USDHC2] =3D im=
x8m_clk_hw_composite("usdhc2", imx8mp_usdhc2_sels, ccm_base + 0xac80);
9c140d9926761b0 Anson Huang 2020-01-08  604  	hws[IMX8MP_CLK_I2C1] =3D imx8=
m_clk_hw_composite("i2c1", imx8mp_i2c1_sels, ccm_base + 0xad00);
9c140d9926761b0 Anson Huang 2020-01-08  605  	hws[IMX8MP_CLK_I2C2] =3D imx8=
m_clk_hw_composite("i2c2", imx8mp_i2c2_sels, ccm_base + 0xad80);
9c140d9926761b0 Anson Huang 2020-01-08  606  	hws[IMX8MP_CLK_I2C3] =3D imx8=
m_clk_hw_composite("i2c3", imx8mp_i2c3_sels, ccm_base + 0xae00);
9c140d9926761b0 Anson Huang 2020-01-08  607  	hws[IMX8MP_CLK_I2C4] =3D imx8=
m_clk_hw_composite("i2c4", imx8mp_i2c4_sels, ccm_base + 0xae80);
9c140d9926761b0 Anson Huang 2020-01-08  608  =

9c140d9926761b0 Anson Huang 2020-01-08  609  	hws[IMX8MP_CLK_UART1] =3D imx=
8m_clk_hw_composite("uart1", imx8mp_uart1_sels, ccm_base + 0xaf00);
9c140d9926761b0 Anson Huang 2020-01-08  610  	hws[IMX8MP_CLK_UART2] =3D imx=
8m_clk_hw_composite("uart2", imx8mp_uart2_sels, ccm_base + 0xaf80);
9c140d9926761b0 Anson Huang 2020-01-08  611  	hws[IMX8MP_CLK_UART3] =3D imx=
8m_clk_hw_composite("uart3", imx8mp_uart3_sels, ccm_base + 0xb000);
9c140d9926761b0 Anson Huang 2020-01-08  612  	hws[IMX8MP_CLK_UART4] =3D imx=
8m_clk_hw_composite("uart4", imx8mp_uart4_sels, ccm_base + 0xb080);
9c140d9926761b0 Anson Huang 2020-01-08  613  	hws[IMX8MP_CLK_USB_CORE_REF] =
=3D imx8m_clk_hw_composite("usb_core_ref", imx8mp_usb_core_ref_sels, ccm_ba=
se + 0xb100);
9c140d9926761b0 Anson Huang 2020-01-08  614  	hws[IMX8MP_CLK_USB_PHY_REF] =
=3D imx8m_clk_hw_composite("usb_phy_ref", imx8mp_usb_phy_ref_sels, ccm_base=
 + 0xb180);
9c140d9926761b0 Anson Huang 2020-01-08  615  	hws[IMX8MP_CLK_GIC] =3D imx8m=
_clk_hw_composite_critical("gic", imx8mp_gic_sels, ccm_base + 0xb200);
9c140d9926761b0 Anson Huang 2020-01-08  616  	hws[IMX8MP_CLK_ECSPI1] =3D im=
x8m_clk_hw_composite("ecspi1", imx8mp_ecspi1_sels, ccm_base + 0xb280);
9c140d9926761b0 Anson Huang 2020-01-08  617  	hws[IMX8MP_CLK_ECSPI2] =3D im=
x8m_clk_hw_composite("ecspi2", imx8mp_ecspi2_sels, ccm_base + 0xb300);
9c140d9926761b0 Anson Huang 2020-01-08  618  	hws[IMX8MP_CLK_PWM1] =3D imx8=
m_clk_hw_composite("pwm1", imx8mp_pwm1_sels, ccm_base + 0xb380);
9c140d9926761b0 Anson Huang 2020-01-08  619  	hws[IMX8MP_CLK_PWM2] =3D imx8=
m_clk_hw_composite("pwm2", imx8mp_pwm2_sels, ccm_base + 0xb400);
9c140d9926761b0 Anson Huang 2020-01-08  620  	hws[IMX8MP_CLK_PWM3] =3D imx8=
m_clk_hw_composite("pwm3", imx8mp_pwm3_sels, ccm_base + 0xb480);
9c140d9926761b0 Anson Huang 2020-01-08  621  	hws[IMX8MP_CLK_PWM4] =3D imx8=
m_clk_hw_composite("pwm4", imx8mp_pwm4_sels, ccm_base + 0xb500);
9c140d9926761b0 Anson Huang 2020-01-08  622  =

9c140d9926761b0 Anson Huang 2020-01-08  623  	hws[IMX8MP_CLK_GPT1] =3D imx8=
m_clk_hw_composite("gpt1", imx8mp_gpt1_sels, ccm_base + 0xb580);
9c140d9926761b0 Anson Huang 2020-01-08  624  	hws[IMX8MP_CLK_GPT2] =3D imx8=
m_clk_hw_composite("gpt2", imx8mp_gpt2_sels, ccm_base + 0xb600);
9c140d9926761b0 Anson Huang 2020-01-08  625  	hws[IMX8MP_CLK_GPT3] =3D imx8=
m_clk_hw_composite("gpt3", imx8mp_gpt3_sels, ccm_base + 0xb680);
9c140d9926761b0 Anson Huang 2020-01-08  626  	hws[IMX8MP_CLK_GPT4] =3D imx8=
m_clk_hw_composite("gpt4", imx8mp_gpt4_sels, ccm_base + 0xb700);
9c140d9926761b0 Anson Huang 2020-01-08  627  	hws[IMX8MP_CLK_GPT5] =3D imx8=
m_clk_hw_composite("gpt5", imx8mp_gpt5_sels, ccm_base + 0xb780);
9c140d9926761b0 Anson Huang 2020-01-08  628  	hws[IMX8MP_CLK_GPT6] =3D imx8=
m_clk_hw_composite("gpt6", imx8mp_gpt6_sels, ccm_base + 0xb800);
9c140d9926761b0 Anson Huang 2020-01-08  629  	hws[IMX8MP_CLK_WDOG] =3D imx8=
m_clk_hw_composite("wdog", imx8mp_wdog_sels, ccm_base + 0xb900);
9c140d9926761b0 Anson Huang 2020-01-08  630  	hws[IMX8MP_CLK_WRCLK] =3D imx=
8m_clk_hw_composite("wrclk", imx8mp_wrclk_sels, ccm_base + 0xb980);
9c140d9926761b0 Anson Huang 2020-01-08  631  	hws[IMX8MP_CLK_IPP_DO_CLKO1] =
=3D imx8m_clk_hw_composite("ipp_do_clko1", imx8mp_ipp_do_clko1_sels, ccm_ba=
se + 0xba00);
9c140d9926761b0 Anson Huang 2020-01-08  632  	hws[IMX8MP_CLK_IPP_DO_CLKO2] =
=3D imx8m_clk_hw_composite("ipp_do_clko2", imx8mp_ipp_do_clko2_sels, ccm_ba=
se + 0xba80);
9c140d9926761b0 Anson Huang 2020-01-08  633  	hws[IMX8MP_CLK_HDMI_FDCC_TST]=
 =3D imx8m_clk_hw_composite("hdmi_fdcc_tst", imx8mp_hdmi_fdcc_tst_sels, ccm=
_base + 0xbb00);
9c140d9926761b0 Anson Huang 2020-01-08  634  	hws[IMX8MP_CLK_HDMI_27M] =3D =
imx8m_clk_hw_composite("hdmi_27m", imx8mp_hdmi_27m_sels, ccm_base + 0xbb80);
9c140d9926761b0 Anson Huang 2020-01-08  635  	hws[IMX8MP_CLK_HDMI_REF_266M]=
 =3D imx8m_clk_hw_composite("hdmi_ref_266m", imx8mp_hdmi_ref_266m_sels, ccm=
_base + 0xbc00);
9c140d9926761b0 Anson Huang 2020-01-08  636  	hws[IMX8MP_CLK_USDHC3] =3D im=
x8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
9c140d9926761b0 Anson Huang 2020-01-08  637  	hws[IMX8MP_CLK_MEDIA_CAM1_PIX=
] =3D imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, =
ccm_base + 0xbd00);
9c140d9926761b0 Anson Huang 2020-01-08  638  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY=
1_REF] =3D imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_=
phy1_ref_sels, ccm_base + 0xbd80);
9c140d9926761b0 Anson Huang 2020-01-08  639  	hws[IMX8MP_CLK_MEDIA_DISP1_PI=
X] =3D imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp1_pix_sel=
s, ccm_base + 0xbe00);
9c140d9926761b0 Anson Huang 2020-01-08  640  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX=
] =3D imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, =
ccm_base + 0xbe80);
9c140d9926761b0 Anson Huang 2020-01-08  641  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY=
2_REF] =3D imx8m_clk_hw_composite("media_mipi_phy2_ref", imx8mp_media_mipi_=
phy2_ref_sels, ccm_base + 0xbf00);
9c140d9926761b0 Anson Huang 2020-01-08  642  	hws[IMX8MP_CLK_MEDIA_MIPI_CSI=
2_ESC] =3D imx8m_clk_hw_composite("media_mipi_csi2_esc", imx8mp_media_mipi_=
csi2_esc_sels, ccm_base + 0xbf80);
9c140d9926761b0 Anson Huang 2020-01-08  643  	hws[IMX8MP_CLK_PCIE2_CTRL] =
=3D imx8m_clk_hw_composite("pcie2_ctrl", imx8mp_pcie2_ctrl_sels, ccm_base +=
 0xc000);
9c140d9926761b0 Anson Huang 2020-01-08  644  	hws[IMX8MP_CLK_PCIE2_PHY] =3D=
 imx8m_clk_hw_composite("pcie2_phy", imx8mp_pcie2_phy_sels, ccm_base + 0xc0=
80);
9c140d9926761b0 Anson Huang 2020-01-08  645  	hws[IMX8MP_CLK_MEDIA_MIPI_TES=
T_BYTE] =3D imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mip=
i_test_byte_sels, ccm_base + 0xc100);
9c140d9926761b0 Anson Huang 2020-01-08  646  	hws[IMX8MP_CLK_ECSPI3] =3D im=
x8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);
9c140d9926761b0 Anson Huang 2020-01-08  647  	hws[IMX8MP_CLK_PDM] =3D imx8m=
_clk_hw_composite("pdm", imx8mp_pdm_sels, ccm_base + 0xc200);
9c140d9926761b0 Anson Huang 2020-01-08  648  	hws[IMX8MP_CLK_VPU_VC8000E] =
=3D imx8m_clk_hw_composite("vpu_vc8000e", imx8mp_vpu_vc8000e_sels, ccm_base=
 + 0xc280);
9c140d9926761b0 Anson Huang 2020-01-08  649  	hws[IMX8MP_CLK_SAI7] =3D imx8=
m_clk_hw_composite("sai7", imx8mp_sai7_sels, ccm_base + 0xc300);
9c140d9926761b0 Anson Huang 2020-01-08  650  =

9c140d9926761b0 Anson Huang 2020-01-08  651  	hws[IMX8MP_CLK_DRAM_ALT_ROOT]=
 =3D imx_clk_hw_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
9c140d9926761b0 Anson Huang 2020-01-08  652  	hws[IMX8MP_CLK_DRAM_CORE] =3D=
 imx_clk_hw_mux2_flags("dram_core_clk", ccm_base + 0x9800, 24, 1, imx8mp_dr=
am_core_sels, ARRAY_SIZE(imx8mp_dram_core_sels), CLK_IS_CRITICAL);
9c140d9926761b0 Anson Huang 2020-01-08  653  =

9c140d9926761b0 Anson Huang 2020-01-08  654  	hws[IMX8MP_CLK_DRAM1_ROOT] =
=3D imx_clk_hw_gate4_flags("dram1_root_clk", "dram_core_clk", ccm_base + 0x=
4050, 0, CLK_IS_CRITICAL);
9c140d9926761b0 Anson Huang 2020-01-08  655  	hws[IMX8MP_CLK_ECSPI1_ROOT] =
=3D imx_clk_hw_gate4("ecspi1_root_clk", "ecspi1", ccm_base + 0x4070, 0);
9c140d9926761b0 Anson Huang 2020-01-08  656  	hws[IMX8MP_CLK_ECSPI2_ROOT] =
=3D imx_clk_hw_gate4("ecspi2_root_clk", "ecspi2", ccm_base + 0x4080, 0);
9c140d9926761b0 Anson Huang 2020-01-08  657  	hws[IMX8MP_CLK_ECSPI3_ROOT] =
=3D imx_clk_hw_gate4("ecspi3_root_clk", "ecspi3", ccm_base + 0x4090, 0);
9c140d9926761b0 Anson Huang 2020-01-08  658  	hws[IMX8MP_CLK_ENET1_ROOT] =
=3D imx_clk_hw_gate4("enet1_root_clk", "enet_axi", ccm_base + 0x40a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  659  	hws[IMX8MP_CLK_GPIO1_ROOT] =
=3D imx_clk_hw_gate4("gpio1_root_clk", "ipg_root", ccm_base + 0x40b0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  660  	hws[IMX8MP_CLK_GPIO2_ROOT] =
=3D imx_clk_hw_gate4("gpio2_root_clk", "ipg_root", ccm_base + 0x40c0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  661  	hws[IMX8MP_CLK_GPIO3_ROOT] =
=3D imx_clk_hw_gate4("gpio3_root_clk", "ipg_root", ccm_base + 0x40d0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  662  	hws[IMX8MP_CLK_GPIO4_ROOT] =
=3D imx_clk_hw_gate4("gpio4_root_clk", "ipg_root", ccm_base + 0x40e0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  663  	hws[IMX8MP_CLK_GPIO5_ROOT] =
=3D imx_clk_hw_gate4("gpio5_root_clk", "ipg_root", ccm_base + 0x40f0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  664  	hws[IMX8MP_CLK_GPT1_ROOT] =3D=
 imx_clk_hw_gate4("gpt1_root_clk", "gpt1", ccm_base + 0x4100, 0);
9c140d9926761b0 Anson Huang 2020-01-08  665  	hws[IMX8MP_CLK_GPT2_ROOT] =3D=
 imx_clk_hw_gate4("gpt2_root_clk", "gpt2", ccm_base + 0x4110, 0);
9c140d9926761b0 Anson Huang 2020-01-08  666  	hws[IMX8MP_CLK_GPT3_ROOT] =3D=
 imx_clk_hw_gate4("gpt3_root_clk", "gpt3", ccm_base + 0x4120, 0);
9c140d9926761b0 Anson Huang 2020-01-08  667  	hws[IMX8MP_CLK_GPT4_ROOT] =3D=
 imx_clk_hw_gate4("gpt4_root_clk", "gpt4", ccm_base + 0x4130, 0);
9c140d9926761b0 Anson Huang 2020-01-08  668  	hws[IMX8MP_CLK_GPT5_ROOT] =3D=
 imx_clk_hw_gate4("gpt5_root_clk", "gpt5", ccm_base + 0x4140, 0);
9c140d9926761b0 Anson Huang 2020-01-08  669  	hws[IMX8MP_CLK_GPT6_ROOT] =3D=
 imx_clk_hw_gate4("gpt6_root_clk", "gpt6", ccm_base + 0x4150, 0);
9c140d9926761b0 Anson Huang 2020-01-08  670  	hws[IMX8MP_CLK_I2C1_ROOT] =3D=
 imx_clk_hw_gate4("i2c1_root_clk", "i2c1", ccm_base + 0x4170, 0);
9c140d9926761b0 Anson Huang 2020-01-08  671  	hws[IMX8MP_CLK_I2C2_ROOT] =3D=
 imx_clk_hw_gate4("i2c2_root_clk", "i2c2", ccm_base + 0x4180, 0);
9c140d9926761b0 Anson Huang 2020-01-08  672  	hws[IMX8MP_CLK_I2C3_ROOT] =3D=
 imx_clk_hw_gate4("i2c3_root_clk", "i2c3", ccm_base + 0x4190, 0);
9c140d9926761b0 Anson Huang 2020-01-08  673  	hws[IMX8MP_CLK_I2C4_ROOT] =3D=
 imx_clk_hw_gate4("i2c4_root_clk", "i2c4", ccm_base + 0x41a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  674  	hws[IMX8MP_CLK_PCIE_ROOT] =3D=
 imx_clk_hw_gate4("pcie_root_clk", "pcie_aux", ccm_base + 0x4250, 0);
9c140d9926761b0 Anson Huang 2020-01-08  675  	hws[IMX8MP_CLK_PWM1_ROOT] =3D=
 imx_clk_hw_gate4("pwm1_root_clk", "pwm1", ccm_base + 0x4280, 0);
9c140d9926761b0 Anson Huang 2020-01-08  676  	hws[IMX8MP_CLK_PWM2_ROOT] =3D=
 imx_clk_hw_gate4("pwm2_root_clk", "pwm2", ccm_base + 0x4290, 0);
9c140d9926761b0 Anson Huang 2020-01-08  677  	hws[IMX8MP_CLK_PWM3_ROOT] =3D=
 imx_clk_hw_gate4("pwm3_root_clk", "pwm3", ccm_base + 0x42a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  678  	hws[IMX8MP_CLK_PWM4_ROOT] =3D=
 imx_clk_hw_gate4("pwm4_root_clk", "pwm4", ccm_base + 0x42b0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  679  	hws[IMX8MP_CLK_QOS_ROOT] =3D =
imx_clk_hw_gate4("qos_root_clk", "ipg_root", ccm_base + 0x42c0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  680  	hws[IMX8MP_CLK_QOS_ENET_ROOT]=
 =3D imx_clk_hw_gate4("qos_enet_root_clk", "ipg_root", ccm_base + 0x42e0, 0=
);
9c140d9926761b0 Anson Huang 2020-01-08  681  	hws[IMX8MP_CLK_QSPI_ROOT] =3D=
 imx_clk_hw_gate4("qspi_root_clk", "qspi", ccm_base + 0x42f0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  682  	hws[IMX8MP_CLK_NAND_ROOT] =3D=
 imx_clk_hw_gate2_shared2("nand_root_clk", "nand", ccm_base + 0x4300, 0, &s=
hare_count_nand);
9c140d9926761b0 Anson Huang 2020-01-08  683  	hws[IMX8MP_CLK_NAND_USDHC_BUS=
_RAWNAND_CLK] =3D imx_clk_hw_gate2_shared2("nand_usdhc_rawnand_clk", "nand_=
usdhc_bus", ccm_base + 0x4300, 0, &share_count_nand);
9c140d9926761b0 Anson Huang 2020-01-08  684  	hws[IMX8MP_CLK_I2C5_ROOT] =3D=
 imx_clk_hw_gate2("i2c5_root_clk", "i2c5", ccm_base + 0x4330, 0);
9c140d9926761b0 Anson Huang 2020-01-08  685  	hws[IMX8MP_CLK_I2C6_ROOT] =3D=
 imx_clk_hw_gate2("i2c6_root_clk", "i2c6", ccm_base + 0x4340, 0);
9c140d9926761b0 Anson Huang 2020-01-08  686  	hws[IMX8MP_CLK_CAN1_ROOT] =3D=
 imx_clk_hw_gate2("can1_root_clk", "can1", ccm_base + 0x4350, 0);
9c140d9926761b0 Anson Huang 2020-01-08  687  	hws[IMX8MP_CLK_CAN2_ROOT] =3D=
 imx_clk_hw_gate2("can2_root_clk", "can2", ccm_base + 0x4360, 0);
9c140d9926761b0 Anson Huang 2020-01-08  688  	hws[IMX8MP_CLK_SDMA1_ROOT] =
=3D imx_clk_hw_gate4("sdma1_root_clk", "ipg_root", ccm_base + 0x43a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  689  	hws[IMX8MP_CLK_ENET_QOS_ROOT]=
 =3D imx_clk_hw_gate4("enet_qos_root_clk", "enet_axi", ccm_base + 0x43b0, 0=
);
9c140d9926761b0 Anson Huang 2020-01-08  690  	hws[IMX8MP_CLK_SIM_ENET_ROOT]=
 =3D imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0=
);
9c140d9926761b0 Anson Huang 2020-01-08  691  	hws[IMX8MP_CLK_GPU2D_ROOT] =
=3D imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_div", ccm_base + 0x4450, 0);
9c140d9926761b0 Anson Huang 2020-01-08  692  	hws[IMX8MP_CLK_GPU3D_ROOT] =
=3D imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core_div", ccm_base + 0x4460,=
 0);
9c140d9926761b0 Anson Huang 2020-01-08  693  	hws[IMX8MP_CLK_SNVS_ROOT] =3D=
 imx_clk_hw_gate4("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0);
9c140d9926761b0 Anson Huang 2020-01-08  694  	hws[IMX8MP_CLK_UART1_ROOT] =
=3D imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
9c140d9926761b0 Anson Huang 2020-01-08  695  	hws[IMX8MP_CLK_UART2_ROOT] =
=3D imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  696  	hws[IMX8MP_CLK_UART3_ROOT] =
=3D imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  697  	hws[IMX8MP_CLK_UART4_ROOT] =
=3D imx_clk_hw_gate4("uart4_root_clk", "uart4", ccm_base + 0x44c0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  698  	hws[IMX8MP_CLK_USB_ROOT] =3D =
imx_clk_hw_gate4("usb_root_clk", "osc_32k", ccm_base + 0x44d0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  699  	hws[IMX8MP_CLK_USB_PHY_ROOT] =
=3D imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", ccm_base + 0x44f0, =
0);
9c140d9926761b0 Anson Huang 2020-01-08  700  	hws[IMX8MP_CLK_USDHC1_ROOT] =
=3D imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", ccm_base + 0x4510, 0);
9c140d9926761b0 Anson Huang 2020-01-08  701  	hws[IMX8MP_CLK_USDHC2_ROOT] =
=3D imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", ccm_base + 0x4520, 0);
9c140d9926761b0 Anson Huang 2020-01-08  702  	hws[IMX8MP_CLK_WDOG1_ROOT] =
=3D imx_clk_hw_gate4("wdog1_root_clk", "wdog", ccm_base + 0x4530, 0);
9c140d9926761b0 Anson Huang 2020-01-08  703  	hws[IMX8MP_CLK_WDOG2_ROOT] =
=3D imx_clk_hw_gate4("wdog2_root_clk", "wdog", ccm_base + 0x4540, 0);
9c140d9926761b0 Anson Huang 2020-01-08  704  	hws[IMX8MP_CLK_WDOG3_ROOT] =
=3D imx_clk_hw_gate4("wdog3_root_clk", "wdog", ccm_base + 0x4550, 0);
9c140d9926761b0 Anson Huang 2020-01-08  705  	hws[IMX8MP_CLK_VPU_G1_ROOT] =
=3D imx_clk_hw_gate4("vpu_g1_root_clk", "vpu_g1", ccm_base + 0x4560, 0);
9c140d9926761b0 Anson Huang 2020-01-08  706  	hws[IMX8MP_CLK_GPU_ROOT] =3D =
imx_clk_hw_gate4("gpu_root_clk", "gpu_axi", ccm_base + 0x4570, 0);
9c140d9926761b0 Anson Huang 2020-01-08  707  	hws[IMX8MP_CLK_VPU_VC8KE_ROOT=
] =3D imx_clk_hw_gate4("vpu_vc8ke_root_clk", "vpu_vc8000e", ccm_base + 0x45=
90, 0);
9c140d9926761b0 Anson Huang 2020-01-08  708  	hws[IMX8MP_CLK_VPU_G2_ROOT] =
=3D imx_clk_hw_gate4("vpu_g2_root_clk", "vpu_g2", ccm_base + 0x45a0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  709  	hws[IMX8MP_CLK_NPU_ROOT] =3D =
imx_clk_hw_gate4("npu_root_clk", "ml_div", ccm_base + 0x45b0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  710  	hws[IMX8MP_CLK_HSIO_ROOT] =3D=
 imx_clk_hw_gate4("hsio_root_clk", "ipg_root", ccm_base + 0x45c0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  711  	hws[IMX8MP_CLK_MEDIA_APB_ROOT=
] =3D imx_clk_hw_gate2_shared2("media_apb_root_clk", "media_apb", ccm_base =
+ 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  712  	hws[IMX8MP_CLK_MEDIA_AXI_ROOT=
] =3D imx_clk_hw_gate2_shared2("media_axi_root_clk", "media_axi", ccm_base =
+ 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  713  	hws[IMX8MP_CLK_MEDIA_CAM1_PIX=
_ROOT] =3D imx_clk_hw_gate2_shared2("media_cam1_pix_root_clk", "media_cam1_=
pix", ccm_base + 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  714  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX=
_ROOT] =3D imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_=
pix", ccm_base + 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  715  	hws[IMX8MP_CLK_MEDIA_DISP1_PI=
X_ROOT] =3D imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_dis=
p1_pix", ccm_base + 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  716  	hws[IMX8MP_CLK_MEDIA_DISP2_PI=
X_ROOT] =3D imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_dis=
p2_pix", ccm_base + 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  717  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT=
] =3D imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp_div", ccm_b=
ase + 0x45d0, 0, &share_count_media);
9c140d9926761b0 Anson Huang 2020-01-08  718  =

9c140d9926761b0 Anson Huang 2020-01-08  719  	hws[IMX8MP_CLK_USDHC3_ROOT] =
=3D imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  720  	hws[IMX8MP_CLK_HDMI_ROOT] =3D=
 imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
9c140d9926761b0 Anson Huang 2020-01-08  721  	hws[IMX8MP_CLK_TSENSOR_ROOT] =
=3D imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
9c140d9926761b0 Anson Huang 2020-01-08  722  	hws[IMX8MP_CLK_VPU_ROOT] =3D =
imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
9c140d9926761b0 Anson Huang 2020-01-08  723  	hws[IMX8MP_CLK_AUDIO_ROOT] =
=3D imx_clk_hw_gate4("audio_root_clk", "ipg_root", ccm_base + 0x4650, 0);
9c140d9926761b0 Anson Huang 2020-01-08  724  =

9c140d9926761b0 Anson Huang 2020-01-08  725  	hws[IMX8MP_CLK_ARM] =3D imx_c=
lk_hw_cpu("arm", "arm_a53_div",
9c140d9926761b0 Anson Huang 2020-01-08  726  					     hws[IMX8MP_CLK_A53_D=
IV]->clk,
9c140d9926761b0 Anson Huang 2020-01-08  727  					     hws[IMX8MP_CLK_A53_S=
RC]->clk,
9c140d9926761b0 Anson Huang 2020-01-08  728  					     hws[IMX8MP_ARM_PLL_O=
UT]->clk,
9c140d9926761b0 Anson Huang 2020-01-08  729  					     hws[IMX8MP_SYS_PLL1_=
800M]->clk);
9c140d9926761b0 Anson Huang 2020-01-08  730  =

9c140d9926761b0 Anson Huang 2020-01-08  731  	imx_check_clk_hws(hws, IMX8MP=
_CLK_END);
9c140d9926761b0 Anson Huang 2020-01-08  732  =

9c140d9926761b0 Anson Huang 2020-01-08  733  	of_clk_add_hw_provider(np, of=
_clk_hw_onecell_get, clk_hw_data);
9c140d9926761b0 Anson Huang 2020-01-08  734  =

9c140d9926761b0 Anson Huang 2020-01-08  735  	for (i =3D 0; i < ARRAY_SIZE(=
uart_clk_ids); i++) {
9c140d9926761b0 Anson Huang 2020-01-08  736  		int index =3D uart_clk_ids[i=
];
9c140d9926761b0 Anson Huang 2020-01-08  737  =

9c140d9926761b0 Anson Huang 2020-01-08  738  		uart_clks[i] =3D &hws[index]=
->clk;
9c140d9926761b0 Anson Huang 2020-01-08  739  	}
9c140d9926761b0 Anson Huang 2020-01-08  740  =

9c140d9926761b0 Anson Huang 2020-01-08  741  	imx_register_uart_clocks(uart=
_clks);
9c140d9926761b0 Anson Huang 2020-01-08  742  =

9c140d9926761b0 Anson Huang 2020-01-08  743  	return 0;
9c140d9926761b0 Anson Huang 2020-01-08  744  }
9c140d9926761b0 Anson Huang 2020-01-08  745  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0275529184214017791==--

