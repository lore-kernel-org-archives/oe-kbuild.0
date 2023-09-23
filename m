Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D26AAB
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695504174; x=1727040174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63ioYMGG7Abe/b7ALCc6q7qGhfAqMChu6GMSMBAeGSg=;
  b=B7mCCtbPgSbyMhGrtorGgoe5GtDOBHAF6+xr99bv9W/Z4oDgc8yOCPxj
   x5OYbAK5/c4Ml1BffBSLTB1FDLRZCBOT96ES9fBWQqu4UsFGreLGuKI/1
   szffNzU64FpwPBNA5LxVARveRcTD7N8dktlpc47ob3NZyPJIA7rp7oiit
   /uzP3JVIZ2CdZFzm+XMPfKueUR8fkRITfUdymu/X//6jOcm5OHHsbXCpk
   ytNWQwr7cQorv/5UNqRtVTpvsssgckuokV7cX+pt+Qx8XWTHi8ZpNcxSC
   fol0bs2x0blA61HwojtoslVIl3AlVqwwUgi+ARs1FPxeFTySsUWUURLuy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="380967971"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="380967971"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 14:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777243315"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="777243315"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Sep 2023 14:22:51 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkA5R-0002sX-19;
	Sat, 23 Sep 2023 21:22:49 +0000
Date: Sun, 24 Sep 2023 05:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/imx/clk-imx8mq.c:611 imx8mq_clocks_probe() warn: 'base'
 from of_iomap() not released on lines: 399,611.
Message-ID: <202309240551.e46NllPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lizhi Hou <lizhi.hou@amd.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aba70aed91f2b283f7952be152ad76ec5c34975
commit: 407d1a51921e9f28c1bcec647c2205925bd1fdab PCI: Create device tree node for bridge
date:   5 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230924/202309240551.e46NllPa-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240551.e46NllPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309240551.e46NllPa-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mq.c:611 imx8mq_clocks_probe() warn: 'base' from of_iomap() not released on lines: 399,611.

vim +/base +611 drivers/clk/imx/clk-imx8mq.c

b80522040cd3f0 Abel Vesa       2018-12-01  283  
b80522040cd3f0 Abel Vesa       2018-12-01  284  static int imx8mq_clocks_probe(struct platform_device *pdev)
b80522040cd3f0 Abel Vesa       2018-12-01  285  {
b80522040cd3f0 Abel Vesa       2018-12-01  286  	struct device *dev = &pdev->dev;
b80522040cd3f0 Abel Vesa       2018-12-01  287  	struct device_node *np = dev->of_node;
b80522040cd3f0 Abel Vesa       2018-12-01  288  	void __iomem *base;
379c9a24cc2390 Adam Ford       2021-03-13  289  	int err;
b9ef22e1592f4e Peng Fan        2019-12-12  290  
b9ef22e1592f4e Peng Fan        2019-12-12  291  	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
b9ef22e1592f4e Peng Fan        2019-12-12  292  					  IMX8MQ_CLK_END), GFP_KERNEL);
b9ef22e1592f4e Peng Fan        2019-12-12  293  	if (WARN_ON(!clk_hw_data))
b9ef22e1592f4e Peng Fan        2019-12-12  294  		return -ENOMEM;
b9ef22e1592f4e Peng Fan        2019-12-12  295  
b9ef22e1592f4e Peng Fan        2019-12-12  296  	clk_hw_data->num = IMX8MQ_CLK_END;
b9ef22e1592f4e Peng Fan        2019-12-12  297  	hws = clk_hw_data->hws;
b80522040cd3f0 Abel Vesa       2018-12-01  298  
b9ef22e1592f4e Peng Fan        2019-12-12  299  	hws[IMX8MQ_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
8178e245fa953f Dario Binacchi  2022-11-13  300  	hws[IMX8MQ_CLK_32K] = imx_get_clk_hw_by_name(np, "ckil");
8178e245fa953f Dario Binacchi  2022-11-13  301  	hws[IMX8MQ_CLK_25M] = imx_get_clk_hw_by_name(np, "osc_25m");
8178e245fa953f Dario Binacchi  2022-11-13  302  	hws[IMX8MQ_CLK_27M] = imx_get_clk_hw_by_name(np, "osc_27m");
8178e245fa953f Dario Binacchi  2022-11-13  303  	hws[IMX8MQ_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
8178e245fa953f Dario Binacchi  2022-11-13  304  	hws[IMX8MQ_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
8178e245fa953f Dario Binacchi  2022-11-13  305  	hws[IMX8MQ_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
8178e245fa953f Dario Binacchi  2022-11-13  306  	hws[IMX8MQ_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
b80522040cd3f0 Abel Vesa       2018-12-01  307  
b80522040cd3f0 Abel Vesa       2018-12-01  308  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-anatop");
b80522040cd3f0 Abel Vesa       2018-12-01  309  	base = of_iomap(np, 0);
cb5ae504f2014a Anson Huang     2020-02-12  310  	of_node_put(np);
b80522040cd3f0 Abel Vesa       2018-12-01  311  	if (WARN_ON(!base))
b80522040cd3f0 Abel Vesa       2018-12-01  312  		return -ENOMEM;
b80522040cd3f0 Abel Vesa       2018-12-01  313  
b9ef22e1592f4e Peng Fan        2019-12-12  314  	hws[IMX8MQ_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x28, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  315  	hws[IMX8MQ_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x18, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  316  	hws[IMX8MQ_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x20, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  317  	hws[IMX8MQ_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  318  	hws[IMX8MQ_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x8, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  319  	hws[IMX8MQ_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", base + 0x10, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  320  	hws[IMX8MQ_SYS3_PLL1_REF_SEL]	= imx_clk_hw_mux("sys3_pll1_ref_sel", base + 0x48, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  321  	hws[IMX8MQ_DRAM_PLL1_REF_SEL]	= imx_clk_hw_mux("dram_pll1_ref_sel", base + 0x60, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  322  	hws[IMX8MQ_VIDEO2_PLL1_REF_SEL] = imx_clk_hw_mux("video2_pll1_ref_sel", base + 0x54, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  323  
b9ef22e1592f4e Peng Fan        2019-12-12  324  	hws[IMX8MQ_ARM_PLL_REF_DIV]	= imx_clk_hw_divider("arm_pll_ref_div", "arm_pll_ref_sel", base + 0x28, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  325  	hws[IMX8MQ_GPU_PLL_REF_DIV]	= imx_clk_hw_divider("gpu_pll_ref_div", "gpu_pll_ref_sel", base + 0x18, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  326  	hws[IMX8MQ_VPU_PLL_REF_DIV]	= imx_clk_hw_divider("vpu_pll_ref_div", "vpu_pll_ref_sel", base + 0x20, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  327  	hws[IMX8MQ_AUDIO_PLL1_REF_DIV] = imx_clk_hw_divider("audio_pll1_ref_div", "audio_pll1_ref_sel", base + 0x0, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  328  	hws[IMX8MQ_AUDIO_PLL2_REF_DIV] = imx_clk_hw_divider("audio_pll2_ref_div", "audio_pll2_ref_sel", base + 0x8, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  329  	hws[IMX8MQ_VIDEO_PLL1_REF_DIV] = imx_clk_hw_divider("video_pll1_ref_div", "video_pll1_ref_sel", base + 0x10, 5, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  330  
b9ef22e1592f4e Peng Fan        2019-12-12  331  	hws[IMX8MQ_ARM_PLL] = imx_clk_hw_frac_pll("arm_pll", "arm_pll_ref_div", base + 0x28);
b9ef22e1592f4e Peng Fan        2019-12-12  332  	hws[IMX8MQ_GPU_PLL] = imx_clk_hw_frac_pll("gpu_pll", "gpu_pll_ref_div", base + 0x18);
b9ef22e1592f4e Peng Fan        2019-12-12  333  	hws[IMX8MQ_VPU_PLL] = imx_clk_hw_frac_pll("vpu_pll", "vpu_pll_ref_div", base + 0x20);
b9ef22e1592f4e Peng Fan        2019-12-12  334  	hws[IMX8MQ_AUDIO_PLL1] = imx_clk_hw_frac_pll("audio_pll1", "audio_pll1_ref_div", base + 0x0);
b9ef22e1592f4e Peng Fan        2019-12-12  335  	hws[IMX8MQ_AUDIO_PLL2] = imx_clk_hw_frac_pll("audio_pll2", "audio_pll2_ref_div", base + 0x8);
b9ef22e1592f4e Peng Fan        2019-12-12  336  	hws[IMX8MQ_VIDEO_PLL1] = imx_clk_hw_frac_pll("video_pll1", "video_pll1_ref_div", base + 0x10);
b80522040cd3f0 Abel Vesa       2018-12-01  337  
b80522040cd3f0 Abel Vesa       2018-12-01  338  	/* PLL bypass out */
b9ef22e1592f4e Peng Fan        2019-12-12  339  	hws[IMX8MQ_ARM_PLL_BYPASS] = imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x28, 14, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
b9ef22e1592f4e Peng Fan        2019-12-12  340  	hws[IMX8MQ_GPU_PLL_BYPASS] = imx_clk_hw_mux("gpu_pll_bypass", base + 0x18, 14, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  341  	hws[IMX8MQ_VPU_PLL_BYPASS] = imx_clk_hw_mux("vpu_pll_bypass", base + 0x20, 14, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  342  	hws[IMX8MQ_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux("audio_pll1_bypass", base + 0x0, 14, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  343  	hws[IMX8MQ_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux("audio_pll2_bypass", base + 0x8, 14, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels));
b9ef22e1592f4e Peng Fan        2019-12-12  344  	hws[IMX8MQ_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux("video_pll1_bypass", base + 0x10, 14, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels));
b80522040cd3f0 Abel Vesa       2018-12-01  345  
b80522040cd3f0 Abel Vesa       2018-12-01  346  	/* PLL OUT GATE */
b9ef22e1592f4e Peng Fan        2019-12-12  347  	hws[IMX8MQ_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", base + 0x28, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  348  	hws[IMX8MQ_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x18, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  349  	hws[IMX8MQ_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x20, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  350  	hws[IMX8MQ_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base + 0x0, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  351  	hws[IMX8MQ_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x8, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  352  	hws[IMX8MQ_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", base + 0x10, 21);
b9ef22e1592f4e Peng Fan        2019-12-12  353  
b9ef22e1592f4e Peng Fan        2019-12-12  354  	hws[IMX8MQ_SYS1_PLL_OUT] = imx_clk_hw_fixed("sys1_pll_out", 800000000);
b9ef22e1592f4e Peng Fan        2019-12-12  355  	hws[IMX8MQ_SYS2_PLL_OUT] = imx_clk_hw_fixed("sys2_pll_out", 1000000000);
b9ef22e1592f4e Peng Fan        2019-12-12  356  	hws[IMX8MQ_SYS3_PLL_OUT] = imx_clk_hw_sscg_pll("sys3_pll_out", sys3_pll_out_sels, ARRAY_SIZE(sys3_pll_out_sels), 0, 0, 0, base + 0x48, CLK_IS_CRITICAL);
b9ef22e1592f4e Peng Fan        2019-12-12  357  	hws[IMX8MQ_DRAM_PLL_OUT] = imx_clk_hw_sscg_pll("dram_pll_out", dram_pll_out_sels, ARRAY_SIZE(dram_pll_out_sels), 0, 0, 0, base + 0x60, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
b9ef22e1592f4e Peng Fan        2019-12-12  358  	hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
f0b1d7f2e7c234 Laurentiu Palcu 2019-10-02  359  
b04383b6a55889 Leonard Crestez 2019-10-16  360  	/* SYS PLL1 fixed output */
c586f53ae159c6 Lucas Stach     2021-05-28  361  	hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
c586f53ae159c6 Lucas Stach     2021-05-28  362  	hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
c586f53ae159c6 Lucas Stach     2021-05-28  363  	hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
c586f53ae159c6 Lucas Stach     2021-05-28  364  	hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
c586f53ae159c6 Lucas Stach     2021-05-28  365  	hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
c586f53ae159c6 Lucas Stach     2021-05-28  366  	hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
c586f53ae159c6 Lucas Stach     2021-05-28  367  	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
c586f53ae159c6 Lucas Stach     2021-05-28  368  	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
c586f53ae159c6 Lucas Stach     2021-05-28  369  	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
b04383b6a55889 Leonard Crestez 2019-10-16  370  
b04383b6a55889 Leonard Crestez 2019-10-16  371  	/* SYS PLL2 fixed output */
c586f53ae159c6 Lucas Stach     2021-05-28  372  	hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
c586f53ae159c6 Lucas Stach     2021-05-28  373  	hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
c586f53ae159c6 Lucas Stach     2021-05-28  374  	hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
c586f53ae159c6 Lucas Stach     2021-05-28  375  	hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
c586f53ae159c6 Lucas Stach     2021-05-28  376  	hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
c586f53ae159c6 Lucas Stach     2021-05-28  377  	hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
c586f53ae159c6 Lucas Stach     2021-05-28  378  	hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
c586f53ae159c6 Lucas Stach     2021-05-28  379  	hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
c586f53ae159c6 Lucas Stach     2021-05-28  380  	hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
b80522040cd3f0 Abel Vesa       2018-12-01  381  
75a352bc6611e7 Lucas Stach     2021-01-25  382  	hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  383  	hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  384  	hws[IMX8MQ_CLK_MON_VIDEO_PLL1_DIV] = imx_clk_hw_divider("video_pll1_out_monitor", "video_pll1_bypass", base + 0x78, 8, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  385  	hws[IMX8MQ_CLK_MON_GPU_PLL_DIV] = imx_clk_hw_divider("gpu_pll_out_monitor", "gpu_pll_bypass", base + 0x78, 12, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  386  	hws[IMX8MQ_CLK_MON_VPU_PLL_DIV] = imx_clk_hw_divider("vpu_pll_out_monitor", "vpu_pll_bypass", base + 0x78, 16, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  387  	hws[IMX8MQ_CLK_MON_ARM_PLL_DIV] = imx_clk_hw_divider("arm_pll_out_monitor", "arm_pll_bypass", base + 0x78, 20, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  388  	hws[IMX8MQ_CLK_MON_SYS_PLL1_DIV] = imx_clk_hw_divider("sys_pll1_out_monitor", "sys1_pll_out", base + 0x7c, 0, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  389  	hws[IMX8MQ_CLK_MON_SYS_PLL2_DIV] = imx_clk_hw_divider("sys_pll2_out_monitor", "sys2_pll_out", base + 0x7c, 4, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  390  	hws[IMX8MQ_CLK_MON_SYS_PLL3_DIV] = imx_clk_hw_divider("sys_pll3_out_monitor", "sys3_pll_out", base + 0x7c, 8, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  391  	hws[IMX8MQ_CLK_MON_DRAM_PLL_DIV] = imx_clk_hw_divider("dram_pll_out_monitor", "dram_pll_out", base + 0x7c, 12, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  392  	hws[IMX8MQ_CLK_MON_VIDEO_PLL2_DIV] = imx_clk_hw_divider("video_pll2_out_monitor", "video2_pll_out", base + 0x7c, 16, 3);
75a352bc6611e7 Lucas Stach     2021-01-25  393  	hws[IMX8MQ_CLK_MON_SEL] = imx_clk_hw_mux("pllout_monitor_sel", base + 0x74, 0, 4, pllout_monitor_sels, ARRAY_SIZE(pllout_monitor_sels));
75a352bc6611e7 Lucas Stach     2021-01-25  394  	hws[IMX8MQ_CLK_MON_CLK2_OUT] = imx_clk_hw_gate("pllout_monitor_clk2", "pllout_monitor_sel", base + 0x74, 4);
75a352bc6611e7 Lucas Stach     2021-01-25  395  
b80522040cd3f0 Abel Vesa       2018-12-01  396  	np = dev->of_node;
1aa6af5f1813c8 Anson Huang     2019-06-10  397  	base = devm_platform_ioremap_resource(pdev, 0);
1aa6af5f1813c8 Anson Huang     2019-06-10  398  	if (WARN_ON(IS_ERR(base)))
1aa6af5f1813c8 Anson Huang     2019-06-10  399  		return PTR_ERR(base);
b80522040cd3f0 Abel Vesa       2018-12-01  400  
b80522040cd3f0 Abel Vesa       2018-12-01  401  	/* CORE */
b737beddb32994 Peng Fan        2020-05-07  402  	hws[IMX8MQ_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mq_a53_sels, base + 0x8000);
b737beddb32994 Peng Fan        2020-05-07  403  	hws[IMX8MQ_CLK_A53_CG] = hws[IMX8MQ_CLK_A53_DIV];
b737beddb32994 Peng Fan        2020-05-07  404  	hws[IMX8MQ_CLK_A53_SRC] = hws[IMX8MQ_CLK_A53_DIV];
7a8d3b90bdfe44 Peng Fan        2020-01-28  405  
7a8d3b90bdfe44 Peng Fan        2020-01-28  406  	hws[IMX8MQ_CLK_M4_CORE] = imx8m_clk_hw_composite_core("arm_m4_core", imx8mq_arm_m4_sels, base + 0x8080);
7a8d3b90bdfe44 Peng Fan        2020-01-28  407  	hws[IMX8MQ_CLK_VPU_CORE] = imx8m_clk_hw_composite_core("vpu_core", imx8mq_vpu_sels, base + 0x8100);
7a8d3b90bdfe44 Peng Fan        2020-01-28  408  	hws[IMX8MQ_CLK_GPU_CORE] = imx8m_clk_hw_composite_core("gpu_core", imx8mq_gpu_core_sels, base + 0x8180);
7a8d3b90bdfe44 Peng Fan        2020-01-28  409  	hws[IMX8MQ_CLK_GPU_SHADER] = imx8m_clk_hw_composite("gpu_shader", imx8mq_gpu_shader_sels, base + 0x8200);
7a8d3b90bdfe44 Peng Fan        2020-01-28  410  	/* For backwards compatibility */
7a8d3b90bdfe44 Peng Fan        2020-01-28  411  	hws[IMX8MQ_CLK_M4_SRC] = hws[IMX8MQ_CLK_M4_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  412  	hws[IMX8MQ_CLK_M4_CG] = hws[IMX8MQ_CLK_M4_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  413  	hws[IMX8MQ_CLK_M4_DIV] = hws[IMX8MQ_CLK_M4_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  414  	hws[IMX8MQ_CLK_VPU_SRC] = hws[IMX8MQ_CLK_VPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  415  	hws[IMX8MQ_CLK_VPU_CG] = hws[IMX8MQ_CLK_VPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  416  	hws[IMX8MQ_CLK_VPU_DIV] = hws[IMX8MQ_CLK_VPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  417  	hws[IMX8MQ_CLK_GPU_CORE_SRC] = hws[IMX8MQ_CLK_GPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  418  	hws[IMX8MQ_CLK_GPU_CORE_CG] = hws[IMX8MQ_CLK_GPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  419  	hws[IMX8MQ_CLK_GPU_CORE_DIV] = hws[IMX8MQ_CLK_GPU_CORE];
7a8d3b90bdfe44 Peng Fan        2020-01-28  420  	hws[IMX8MQ_CLK_GPU_SHADER_SRC] = hws[IMX8MQ_CLK_GPU_SHADER];
7a8d3b90bdfe44 Peng Fan        2020-01-28  421  	hws[IMX8MQ_CLK_GPU_SHADER_CG] = hws[IMX8MQ_CLK_GPU_SHADER];
7a8d3b90bdfe44 Peng Fan        2020-01-28  422  	hws[IMX8MQ_CLK_GPU_SHADER_DIV] = hws[IMX8MQ_CLK_GPU_SHADER];
b80522040cd3f0 Abel Vesa       2018-12-01  423  
d6fb02f054127c Peng Fan        2020-02-19  424  	/* CORE SEL */
b4fc6f72ddc1d4 Anson Huang     2020-02-25  425  	hws[IMX8MQ_CLK_A53_CORE] = imx_clk_hw_mux2("arm_a53_core", base + 0x9880, 24, 1, imx8mq_a53_core_sels, ARRAY_SIZE(imx8mq_a53_core_sels));
d6fb02f054127c Peng Fan        2020-02-19  426  
b80522040cd3f0 Abel Vesa       2018-12-01  427  	/* BUS */
c277ca155d2f00 Peng Fan        2020-11-01  428  	hws[IMX8MQ_CLK_MAIN_AXI] = imx8m_clk_hw_composite_bus_critical("main_axi", imx8mq_main_axi_sels, base + 0x8800);
b1657ad708f761 Peng Fan        2020-05-07  429  	hws[IMX8MQ_CLK_ENET_AXI] = imx8m_clk_hw_composite_bus("enet_axi", imx8mq_enet_axi_sels, base + 0x8880);
b1657ad708f761 Peng Fan        2020-05-07  430  	hws[IMX8MQ_CLK_NAND_USDHC_BUS] = imx8m_clk_hw_composite_bus("nand_usdhc_bus", imx8mq_nand_usdhc_sels, base + 0x8900);
b1657ad708f761 Peng Fan        2020-05-07  431  	hws[IMX8MQ_CLK_VPU_BUS] = imx8m_clk_hw_composite_bus("vpu_bus", imx8mq_vpu_bus_sels, base + 0x8980);
b1657ad708f761 Peng Fan        2020-05-07  432  	hws[IMX8MQ_CLK_DISP_AXI] = imx8m_clk_hw_composite_bus("disp_axi", imx8mq_disp_axi_sels, base + 0x8a00);
b1657ad708f761 Peng Fan        2020-05-07  433  	hws[IMX8MQ_CLK_DISP_APB] = imx8m_clk_hw_composite_bus("disp_apb", imx8mq_disp_apb_sels, base + 0x8a80);
b1657ad708f761 Peng Fan        2020-05-07  434  	hws[IMX8MQ_CLK_DISP_RTRM] = imx8m_clk_hw_composite_bus("disp_rtrm", imx8mq_disp_rtrm_sels, base + 0x8b00);
b1657ad708f761 Peng Fan        2020-05-07  435  	hws[IMX8MQ_CLK_USB_BUS] = imx8m_clk_hw_composite_bus("usb_bus", imx8mq_usb_bus_sels, base + 0x8b80);
b1657ad708f761 Peng Fan        2020-05-07  436  	hws[IMX8MQ_CLK_GPU_AXI] = imx8m_clk_hw_composite_bus("gpu_axi", imx8mq_gpu_axi_sels, base + 0x8c00);
b1657ad708f761 Peng Fan        2020-05-07  437  	hws[IMX8MQ_CLK_GPU_AHB] = imx8m_clk_hw_composite_bus("gpu_ahb", imx8mq_gpu_ahb_sels, base + 0x8c80);
c277ca155d2f00 Peng Fan        2020-11-01  438  	hws[IMX8MQ_CLK_NOC] = imx8m_clk_hw_composite_bus_critical("noc", imx8mq_noc_sels, base + 0x8d00);
c277ca155d2f00 Peng Fan        2020-11-01  439  	hws[IMX8MQ_CLK_NOC_APB] = imx8m_clk_hw_composite_bus_critical("noc_apb", imx8mq_noc_apb_sels, base + 0x8d80);
b80522040cd3f0 Abel Vesa       2018-12-01  440  
b80522040cd3f0 Abel Vesa       2018-12-01  441  	/* AHB */
9b9c60bed562c3 Abel Vesa       2019-07-30  442  	/* AHB clock is used by the AHB bus therefore marked as critical */
c277ca155d2f00 Peng Fan        2020-11-01  443  	hws[IMX8MQ_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb", imx8mq_ahb_sels, base + 0x9000);
b1657ad708f761 Peng Fan        2020-05-07  444  	hws[IMX8MQ_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mq_audio_ahb_sels, base + 0x9100);
b80522040cd3f0 Abel Vesa       2018-12-01  445  
b80522040cd3f0 Abel Vesa       2018-12-01  446  	/* IPG */
b9ef22e1592f4e Peng Fan        2019-12-12  447  	hws[IMX8MQ_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb", base + 0x9080, 0, 1);
b9ef22e1592f4e Peng Fan        2019-12-12  448  	hws[IMX8MQ_CLK_IPG_AUDIO_ROOT] = imx_clk_hw_divider2("ipg_audio_root", "audio_ahb", base + 0x9180, 0, 1);
b80522040cd3f0 Abel Vesa       2018-12-01  449  
d9ea9ca2b42012 Leonard Crestez 2019-11-22  450  	/*
d9ea9ca2b42012 Leonard Crestez 2019-11-22  451  	 * DRAM clocks are manipulated from TF-A outside clock framework.
d36207b848a649 Ahmad Fatoum    2021-08-10  452  	 * The fw_managed helper sets GET_RATE_NOCACHE and clears SET_PARENT_GATE
d36207b848a649 Ahmad Fatoum    2021-08-10  453  	 * as div value should always be read from hardware
d9ea9ca2b42012 Leonard Crestez 2019-11-22  454  	 */
b9ef22e1592f4e Peng Fan        2019-12-12  455  	hws[IMX8MQ_CLK_DRAM_CORE] = imx_clk_hw_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mq_dram_core_sels, ARRAY_SIZE(imx8mq_dram_core_sels), CLK_IS_CRITICAL);
d36207b848a649 Ahmad Fatoum    2021-08-10  456  	hws[IMX8MQ_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mq_dram_alt_sels, base + 0xa000);
d36207b848a649 Ahmad Fatoum    2021-08-10  457  	hws[IMX8MQ_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mq_dram_apb_sels, base + 0xa080);
b80522040cd3f0 Abel Vesa       2018-12-01  458  
d9ea9ca2b42012 Leonard Crestez 2019-11-22  459  	/* IP */
b9ef22e1592f4e Peng Fan        2019-12-12  460  	hws[IMX8MQ_CLK_VPU_G1] = imx8m_clk_hw_composite("vpu_g1", imx8mq_vpu_g1_sels, base + 0xa100);
b9ef22e1592f4e Peng Fan        2019-12-12  461  	hws[IMX8MQ_CLK_VPU_G2] = imx8m_clk_hw_composite("vpu_g2", imx8mq_vpu_g2_sels, base + 0xa180);
b9ef22e1592f4e Peng Fan        2019-12-12  462  	hws[IMX8MQ_CLK_DISP_DTRC] = imx8m_clk_hw_composite("disp_dtrc", imx8mq_disp_dtrc_sels, base + 0xa200);
b9ef22e1592f4e Peng Fan        2019-12-12  463  	hws[IMX8MQ_CLK_DISP_DC8000] = imx8m_clk_hw_composite("disp_dc8000", imx8mq_disp_dc8000_sels, base + 0xa280);
b9ef22e1592f4e Peng Fan        2019-12-12  464  	hws[IMX8MQ_CLK_PCIE1_CTRL] = imx8m_clk_hw_composite("pcie1_ctrl", imx8mq_pcie1_ctrl_sels, base + 0xa300);
b9ef22e1592f4e Peng Fan        2019-12-12  465  	hws[IMX8MQ_CLK_PCIE1_PHY] = imx8m_clk_hw_composite("pcie1_phy", imx8mq_pcie1_phy_sels, base + 0xa380);
b9ef22e1592f4e Peng Fan        2019-12-12  466  	hws[IMX8MQ_CLK_PCIE1_AUX] = imx8m_clk_hw_composite("pcie1_aux", imx8mq_pcie1_aux_sels, base + 0xa400);
b9ef22e1592f4e Peng Fan        2019-12-12  467  	hws[IMX8MQ_CLK_DC_PIXEL] = imx8m_clk_hw_composite("dc_pixel", imx8mq_dc_pixel_sels, base + 0xa480);
b9ef22e1592f4e Peng Fan        2019-12-12  468  	hws[IMX8MQ_CLK_LCDIF_PIXEL] = imx8m_clk_hw_composite("lcdif_pixel", imx8mq_lcdif_pixel_sels, base + 0xa500);
b9ef22e1592f4e Peng Fan        2019-12-12  469  	hws[IMX8MQ_CLK_SAI1] = imx8m_clk_hw_composite("sai1", imx8mq_sai1_sels, base + 0xa580);
b9ef22e1592f4e Peng Fan        2019-12-12  470  	hws[IMX8MQ_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mq_sai2_sels, base + 0xa600);
b9ef22e1592f4e Peng Fan        2019-12-12  471  	hws[IMX8MQ_CLK_SAI3] = imx8m_clk_hw_composite("sai3", imx8mq_sai3_sels, base + 0xa680);
b9ef22e1592f4e Peng Fan        2019-12-12  472  	hws[IMX8MQ_CLK_SAI4] = imx8m_clk_hw_composite("sai4", imx8mq_sai4_sels, base + 0xa700);
b9ef22e1592f4e Peng Fan        2019-12-12  473  	hws[IMX8MQ_CLK_SAI5] = imx8m_clk_hw_composite("sai5", imx8mq_sai5_sels, base + 0xa780);
b9ef22e1592f4e Peng Fan        2019-12-12  474  	hws[IMX8MQ_CLK_SAI6] = imx8m_clk_hw_composite("sai6", imx8mq_sai6_sels, base + 0xa800);
b9ef22e1592f4e Peng Fan        2019-12-12  475  	hws[IMX8MQ_CLK_SPDIF1] = imx8m_clk_hw_composite("spdif1", imx8mq_spdif1_sels, base + 0xa880);
b9ef22e1592f4e Peng Fan        2019-12-12  476  	hws[IMX8MQ_CLK_SPDIF2] = imx8m_clk_hw_composite("spdif2", imx8mq_spdif2_sels, base + 0xa900);
b9ef22e1592f4e Peng Fan        2019-12-12  477  	hws[IMX8MQ_CLK_ENET_REF] = imx8m_clk_hw_composite("enet_ref", imx8mq_enet_ref_sels, base + 0xa980);
b9ef22e1592f4e Peng Fan        2019-12-12  478  	hws[IMX8MQ_CLK_ENET_TIMER] = imx8m_clk_hw_composite("enet_timer", imx8mq_enet_timer_sels, base + 0xaa00);
b9ef22e1592f4e Peng Fan        2019-12-12  479  	hws[IMX8MQ_CLK_ENET_PHY_REF] = imx8m_clk_hw_composite("enet_phy", imx8mq_enet_phy_sels, base + 0xaa80);
b9ef22e1592f4e Peng Fan        2019-12-12  480  	hws[IMX8MQ_CLK_NAND] = imx8m_clk_hw_composite("nand", imx8mq_nand_sels, base + 0xab00);
b9ef22e1592f4e Peng Fan        2019-12-12  481  	hws[IMX8MQ_CLK_QSPI] = imx8m_clk_hw_composite("qspi", imx8mq_qspi_sels, base + 0xab80);
b9ef22e1592f4e Peng Fan        2019-12-12  482  	hws[IMX8MQ_CLK_USDHC1] = imx8m_clk_hw_composite("usdhc1", imx8mq_usdhc1_sels, base + 0xac00);
b9ef22e1592f4e Peng Fan        2019-12-12  483  	hws[IMX8MQ_CLK_USDHC2] = imx8m_clk_hw_composite("usdhc2", imx8mq_usdhc2_sels, base + 0xac80);
b9ef22e1592f4e Peng Fan        2019-12-12  484  	hws[IMX8MQ_CLK_I2C1] = imx8m_clk_hw_composite("i2c1", imx8mq_i2c1_sels, base + 0xad00);
b9ef22e1592f4e Peng Fan        2019-12-12  485  	hws[IMX8MQ_CLK_I2C2] = imx8m_clk_hw_composite("i2c2", imx8mq_i2c2_sels, base + 0xad80);
b9ef22e1592f4e Peng Fan        2019-12-12  486  	hws[IMX8MQ_CLK_I2C3] = imx8m_clk_hw_composite("i2c3", imx8mq_i2c3_sels, base + 0xae00);
b9ef22e1592f4e Peng Fan        2019-12-12  487  	hws[IMX8MQ_CLK_I2C4] = imx8m_clk_hw_composite("i2c4", imx8mq_i2c4_sels, base + 0xae80);
b9ef22e1592f4e Peng Fan        2019-12-12  488  	hws[IMX8MQ_CLK_UART1] = imx8m_clk_hw_composite("uart1", imx8mq_uart1_sels, base + 0xaf00);
b9ef22e1592f4e Peng Fan        2019-12-12  489  	hws[IMX8MQ_CLK_UART2] = imx8m_clk_hw_composite("uart2", imx8mq_uart2_sels, base + 0xaf80);
b9ef22e1592f4e Peng Fan        2019-12-12  490  	hws[IMX8MQ_CLK_UART3] = imx8m_clk_hw_composite("uart3", imx8mq_uart3_sels, base + 0xb000);
b9ef22e1592f4e Peng Fan        2019-12-12  491  	hws[IMX8MQ_CLK_UART4] = imx8m_clk_hw_composite("uart4", imx8mq_uart4_sels, base + 0xb080);
b9ef22e1592f4e Peng Fan        2019-12-12  492  	hws[IMX8MQ_CLK_USB_CORE_REF] = imx8m_clk_hw_composite("usb_core_ref", imx8mq_usb_core_sels, base + 0xb100);
b9ef22e1592f4e Peng Fan        2019-12-12  493  	hws[IMX8MQ_CLK_USB_PHY_REF] = imx8m_clk_hw_composite("usb_phy_ref", imx8mq_usb_phy_sels, base + 0xb180);
b9ef22e1592f4e Peng Fan        2019-12-12  494  	hws[IMX8MQ_CLK_GIC] = imx8m_clk_hw_composite_critical("gic", imx8mq_gic_sels, base + 0xb200);
b9ef22e1592f4e Peng Fan        2019-12-12  495  	hws[IMX8MQ_CLK_ECSPI1] = imx8m_clk_hw_composite("ecspi1", imx8mq_ecspi1_sels, base + 0xb280);
b9ef22e1592f4e Peng Fan        2019-12-12  496  	hws[IMX8MQ_CLK_ECSPI2] = imx8m_clk_hw_composite("ecspi2", imx8mq_ecspi2_sels, base + 0xb300);
b9ef22e1592f4e Peng Fan        2019-12-12  497  	hws[IMX8MQ_CLK_PWM1] = imx8m_clk_hw_composite("pwm1", imx8mq_pwm1_sels, base + 0xb380);
b9ef22e1592f4e Peng Fan        2019-12-12  498  	hws[IMX8MQ_CLK_PWM2] = imx8m_clk_hw_composite("pwm2", imx8mq_pwm2_sels, base + 0xb400);
b9ef22e1592f4e Peng Fan        2019-12-12  499  	hws[IMX8MQ_CLK_PWM3] = imx8m_clk_hw_composite("pwm3", imx8mq_pwm3_sels, base + 0xb480);
b9ef22e1592f4e Peng Fan        2019-12-12  500  	hws[IMX8MQ_CLK_PWM4] = imx8m_clk_hw_composite("pwm4", imx8mq_pwm4_sels, base + 0xb500);
b9ef22e1592f4e Peng Fan        2019-12-12  501  	hws[IMX8MQ_CLK_GPT1] = imx8m_clk_hw_composite("gpt1", imx8mq_gpt1_sels, base + 0xb580);
b9ef22e1592f4e Peng Fan        2019-12-12  502  	hws[IMX8MQ_CLK_WDOG] = imx8m_clk_hw_composite("wdog", imx8mq_wdog_sels, base + 0xb900);
b9ef22e1592f4e Peng Fan        2019-12-12  503  	hws[IMX8MQ_CLK_WRCLK] = imx8m_clk_hw_composite("wrclk", imx8mq_wrclk_sels, base + 0xb980);
b9ef22e1592f4e Peng Fan        2019-12-12  504  	hws[IMX8MQ_CLK_CLKO1] = imx8m_clk_hw_composite("clko1", imx8mq_clko1_sels, base + 0xba00);
b9ef22e1592f4e Peng Fan        2019-12-12  505  	hws[IMX8MQ_CLK_CLKO2] = imx8m_clk_hw_composite("clko2", imx8mq_clko2_sels, base + 0xba80);
b9ef22e1592f4e Peng Fan        2019-12-12  506  	hws[IMX8MQ_CLK_DSI_CORE] = imx8m_clk_hw_composite("dsi_core", imx8mq_dsi_core_sels, base + 0xbb00);
b9ef22e1592f4e Peng Fan        2019-12-12  507  	hws[IMX8MQ_CLK_DSI_PHY_REF] = imx8m_clk_hw_composite("dsi_phy_ref", imx8mq_dsi_phy_sels, base + 0xbb80);
b9ef22e1592f4e Peng Fan        2019-12-12  508  	hws[IMX8MQ_CLK_DSI_DBI] = imx8m_clk_hw_composite("dsi_dbi", imx8mq_dsi_dbi_sels, base + 0xbc00);
b9ef22e1592f4e Peng Fan        2019-12-12  509  	hws[IMX8MQ_CLK_DSI_ESC] = imx8m_clk_hw_composite("dsi_esc", imx8mq_dsi_esc_sels, base + 0xbc80);
b9ef22e1592f4e Peng Fan        2019-12-12  510  	hws[IMX8MQ_CLK_DSI_AHB] = imx8m_clk_hw_composite("dsi_ahb", imx8mq_dsi_ahb_sels, base + 0x9200);
b9ef22e1592f4e Peng Fan        2019-12-12  511  	hws[IMX8MQ_CLK_DSI_IPG_DIV] = imx_clk_hw_divider2("dsi_ipg_div", "dsi_ahb", base + 0x9280, 0, 6);
b9ef22e1592f4e Peng Fan        2019-12-12  512  	hws[IMX8MQ_CLK_CSI1_CORE] = imx8m_clk_hw_composite("csi1_core", imx8mq_csi1_core_sels, base + 0xbd00);
b9ef22e1592f4e Peng Fan        2019-12-12  513  	hws[IMX8MQ_CLK_CSI1_PHY_REF] = imx8m_clk_hw_composite("csi1_phy_ref", imx8mq_csi1_phy_sels, base + 0xbd80);
b9ef22e1592f4e Peng Fan        2019-12-12  514  	hws[IMX8MQ_CLK_CSI1_ESC] = imx8m_clk_hw_composite("csi1_esc", imx8mq_csi1_esc_sels, base + 0xbe00);
b9ef22e1592f4e Peng Fan        2019-12-12  515  	hws[IMX8MQ_CLK_CSI2_CORE] = imx8m_clk_hw_composite("csi2_core", imx8mq_csi2_core_sels, base + 0xbe80);
b9ef22e1592f4e Peng Fan        2019-12-12  516  	hws[IMX8MQ_CLK_CSI2_PHY_REF] = imx8m_clk_hw_composite("csi2_phy_ref", imx8mq_csi2_phy_sels, base + 0xbf00);
b9ef22e1592f4e Peng Fan        2019-12-12  517  	hws[IMX8MQ_CLK_CSI2_ESC] = imx8m_clk_hw_composite("csi2_esc", imx8mq_csi2_esc_sels, base + 0xbf80);
b9ef22e1592f4e Peng Fan        2019-12-12  518  	hws[IMX8MQ_CLK_PCIE2_CTRL] = imx8m_clk_hw_composite("pcie2_ctrl", imx8mq_pcie2_ctrl_sels, base + 0xc000);
b9ef22e1592f4e Peng Fan        2019-12-12  519  	hws[IMX8MQ_CLK_PCIE2_PHY] = imx8m_clk_hw_composite("pcie2_phy", imx8mq_pcie2_phy_sels, base + 0xc080);
b9ef22e1592f4e Peng Fan        2019-12-12  520  	hws[IMX8MQ_CLK_PCIE2_AUX] = imx8m_clk_hw_composite("pcie2_aux", imx8mq_pcie2_aux_sels, base + 0xc100);
b9ef22e1592f4e Peng Fan        2019-12-12  521  	hws[IMX8MQ_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mq_ecspi3_sels, base + 0xc180);
b9ef22e1592f4e Peng Fan        2019-12-12  522  
b9ef22e1592f4e Peng Fan        2019-12-12  523  	hws[IMX8MQ_CLK_ECSPI1_ROOT] = imx_clk_hw_gate4("ecspi1_root_clk", "ecspi1", base + 0x4070, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  524  	hws[IMX8MQ_CLK_ECSPI2_ROOT] = imx_clk_hw_gate4("ecspi2_root_clk", "ecspi2", base + 0x4080, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  525  	hws[IMX8MQ_CLK_ECSPI3_ROOT] = imx_clk_hw_gate4("ecspi3_root_clk", "ecspi3", base + 0x4090, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  526  	hws[IMX8MQ_CLK_ENET1_ROOT] = imx_clk_hw_gate4("enet1_root_clk", "enet_axi", base + 0x40a0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  527  	hws[IMX8MQ_CLK_GPIO1_ROOT] = imx_clk_hw_gate4("gpio1_root_clk", "ipg_root", base + 0x40b0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  528  	hws[IMX8MQ_CLK_GPIO2_ROOT] = imx_clk_hw_gate4("gpio2_root_clk", "ipg_root", base + 0x40c0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  529  	hws[IMX8MQ_CLK_GPIO3_ROOT] = imx_clk_hw_gate4("gpio3_root_clk", "ipg_root", base + 0x40d0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  530  	hws[IMX8MQ_CLK_GPIO4_ROOT] = imx_clk_hw_gate4("gpio4_root_clk", "ipg_root", base + 0x40e0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  531  	hws[IMX8MQ_CLK_GPIO5_ROOT] = imx_clk_hw_gate4("gpio5_root_clk", "ipg_root", base + 0x40f0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  532  	hws[IMX8MQ_CLK_GPT1_ROOT] = imx_clk_hw_gate4("gpt1_root_clk", "gpt1", base + 0x4100, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  533  	hws[IMX8MQ_CLK_I2C1_ROOT] = imx_clk_hw_gate4("i2c1_root_clk", "i2c1", base + 0x4170, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  534  	hws[IMX8MQ_CLK_I2C2_ROOT] = imx_clk_hw_gate4("i2c2_root_clk", "i2c2", base + 0x4180, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  535  	hws[IMX8MQ_CLK_I2C3_ROOT] = imx_clk_hw_gate4("i2c3_root_clk", "i2c3", base + 0x4190, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  536  	hws[IMX8MQ_CLK_I2C4_ROOT] = imx_clk_hw_gate4("i2c4_root_clk", "i2c4", base + 0x41a0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  537  	hws[IMX8MQ_CLK_MU_ROOT] = imx_clk_hw_gate4("mu_root_clk", "ipg_root", base + 0x4210, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  538  	hws[IMX8MQ_CLK_OCOTP_ROOT] = imx_clk_hw_gate4("ocotp_root_clk", "ipg_root", base + 0x4220, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  539  	hws[IMX8MQ_CLK_PCIE1_ROOT] = imx_clk_hw_gate4("pcie1_root_clk", "pcie1_ctrl", base + 0x4250, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  540  	hws[IMX8MQ_CLK_PCIE2_ROOT] = imx_clk_hw_gate4("pcie2_root_clk", "pcie2_ctrl", base + 0x4640, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  541  	hws[IMX8MQ_CLK_PWM1_ROOT] = imx_clk_hw_gate4("pwm1_root_clk", "pwm1", base + 0x4280, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  542  	hws[IMX8MQ_CLK_PWM2_ROOT] = imx_clk_hw_gate4("pwm2_root_clk", "pwm2", base + 0x4290, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  543  	hws[IMX8MQ_CLK_PWM3_ROOT] = imx_clk_hw_gate4("pwm3_root_clk", "pwm3", base + 0x42a0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  544  	hws[IMX8MQ_CLK_PWM4_ROOT] = imx_clk_hw_gate4("pwm4_root_clk", "pwm4", base + 0x42b0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  545  	hws[IMX8MQ_CLK_QSPI_ROOT] = imx_clk_hw_gate4("qspi_root_clk", "qspi", base + 0x42f0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  546  	hws[IMX8MQ_CLK_RAWNAND_ROOT] = imx_clk_hw_gate2_shared2("nand_root_clk", "nand", base + 0x4300, 0, &share_count_nand);
b9ef22e1592f4e Peng Fan        2019-12-12  547  	hws[IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK] = imx_clk_hw_gate2_shared2("nand_usdhc_rawnand_clk", "nand_usdhc_bus", base + 0x4300, 0, &share_count_nand);
b9ef22e1592f4e Peng Fan        2019-12-12  548  	hws[IMX8MQ_CLK_SAI1_ROOT] = imx_clk_hw_gate2_shared2("sai1_root_clk", "sai1", base + 0x4330, 0, &share_count_sai1);
b9ef22e1592f4e Peng Fan        2019-12-12  549  	hws[IMX8MQ_CLK_SAI1_IPG] = imx_clk_hw_gate2_shared2("sai1_ipg_clk", "ipg_audio_root", base + 0x4330, 0, &share_count_sai1);
b9ef22e1592f4e Peng Fan        2019-12-12  550  	hws[IMX8MQ_CLK_SAI2_ROOT] = imx_clk_hw_gate2_shared2("sai2_root_clk", "sai2", base + 0x4340, 0, &share_count_sai2);
b9ef22e1592f4e Peng Fan        2019-12-12  551  	hws[IMX8MQ_CLK_SAI2_IPG] = imx_clk_hw_gate2_shared2("sai2_ipg_clk", "ipg_root", base + 0x4340, 0, &share_count_sai2);
b9ef22e1592f4e Peng Fan        2019-12-12  552  	hws[IMX8MQ_CLK_SAI3_ROOT] = imx_clk_hw_gate2_shared2("sai3_root_clk", "sai3", base + 0x4350, 0, &share_count_sai3);
b9ef22e1592f4e Peng Fan        2019-12-12  553  	hws[IMX8MQ_CLK_SAI3_IPG] = imx_clk_hw_gate2_shared2("sai3_ipg_clk", "ipg_root", base + 0x4350, 0, &share_count_sai3);
b9ef22e1592f4e Peng Fan        2019-12-12  554  	hws[IMX8MQ_CLK_SAI4_ROOT] = imx_clk_hw_gate2_shared2("sai4_root_clk", "sai4", base + 0x4360, 0, &share_count_sai4);
b9ef22e1592f4e Peng Fan        2019-12-12  555  	hws[IMX8MQ_CLK_SAI4_IPG] = imx_clk_hw_gate2_shared2("sai4_ipg_clk", "ipg_audio_root", base + 0x4360, 0, &share_count_sai4);
b9ef22e1592f4e Peng Fan        2019-12-12  556  	hws[IMX8MQ_CLK_SAI5_ROOT] = imx_clk_hw_gate2_shared2("sai5_root_clk", "sai5", base + 0x4370, 0, &share_count_sai5);
b9ef22e1592f4e Peng Fan        2019-12-12  557  	hws[IMX8MQ_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
b9ef22e1592f4e Peng Fan        2019-12-12  558  	hws[IMX8MQ_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
b9ef22e1592f4e Peng Fan        2019-12-12  559  	hws[IMX8MQ_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
b9ef22e1592f4e Peng Fan        2019-12-12  560  	hws[IMX8MQ_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  561  	hws[IMX8MQ_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  562  	hws[IMX8MQ_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  563  	hws[IMX8MQ_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", base + 0x44c0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  564  	hws[IMX8MQ_CLK_USB1_CTRL_ROOT] = imx_clk_hw_gate4("usb1_ctrl_root_clk", "usb_bus", base + 0x44d0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  565  	hws[IMX8MQ_CLK_USB2_CTRL_ROOT] = imx_clk_hw_gate4("usb2_ctrl_root_clk", "usb_bus", base + 0x44e0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  566  	hws[IMX8MQ_CLK_USB1_PHY_ROOT] = imx_clk_hw_gate4("usb1_phy_root_clk", "usb_phy_ref", base + 0x44f0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  567  	hws[IMX8MQ_CLK_USB2_PHY_ROOT] = imx_clk_hw_gate4("usb2_phy_root_clk", "usb_phy_ref", base + 0x4500, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  568  	hws[IMX8MQ_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", base + 0x4510, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  569  	hws[IMX8MQ_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", base + 0x4520, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  570  	hws[IMX8MQ_CLK_WDOG1_ROOT] = imx_clk_hw_gate4("wdog1_root_clk", "wdog", base + 0x4530, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  571  	hws[IMX8MQ_CLK_WDOG2_ROOT] = imx_clk_hw_gate4("wdog2_root_clk", "wdog", base + 0x4540, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  572  	hws[IMX8MQ_CLK_WDOG3_ROOT] = imx_clk_hw_gate4("wdog3_root_clk", "wdog", base + 0x4550, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  573  	hws[IMX8MQ_CLK_VPU_G1_ROOT] = imx_clk_hw_gate2_flags("vpu_g1_root_clk", "vpu_g1", base + 0x4560, 0, CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE);
7a8d3b90bdfe44 Peng Fan        2020-01-28  574  	hws[IMX8MQ_CLK_GPU_ROOT] = imx_clk_hw_gate4("gpu_root_clk", "gpu_core", base + 0x4570, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  575  	hws[IMX8MQ_CLK_VPU_G2_ROOT] = imx_clk_hw_gate2_flags("vpu_g2_root_clk", "vpu_g2", base + 0x45a0, 0, CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE);
b9ef22e1592f4e Peng Fan        2019-12-12  576  	hws[IMX8MQ_CLK_DISP_ROOT] = imx_clk_hw_gate2_shared2("disp_root_clk", "disp_dc8000", base + 0x45d0, 0, &share_count_dcss);
b9ef22e1592f4e Peng Fan        2019-12-12  577  	hws[IMX8MQ_CLK_DISP_AXI_ROOT]  = imx_clk_hw_gate2_shared2("disp_axi_root_clk", "disp_axi", base + 0x45d0, 0, &share_count_dcss);
b9ef22e1592f4e Peng Fan        2019-12-12  578  	hws[IMX8MQ_CLK_DISP_APB_ROOT]  = imx_clk_hw_gate2_shared2("disp_apb_root_clk", "disp_apb", base + 0x45d0, 0, &share_count_dcss);
b9ef22e1592f4e Peng Fan        2019-12-12  579  	hws[IMX8MQ_CLK_DISP_RTRM_ROOT] = imx_clk_hw_gate2_shared2("disp_rtrm_root_clk", "disp_rtrm", base + 0x45d0, 0, &share_count_dcss);
b9ef22e1592f4e Peng Fan        2019-12-12  580  	hws[IMX8MQ_CLK_TMU_ROOT] = imx_clk_hw_gate4("tmu_root_clk", "ipg_root", base + 0x4620, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  581  	hws[IMX8MQ_CLK_VPU_DEC_ROOT] = imx_clk_hw_gate2_flags("vpu_dec_root_clk", "vpu_bus", base + 0x4630, 0, CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE);
b9ef22e1592f4e Peng Fan        2019-12-12  582  	hws[IMX8MQ_CLK_CSI1_ROOT] = imx_clk_hw_gate4("csi1_root_clk", "csi1_core", base + 0x4650, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  583  	hws[IMX8MQ_CLK_CSI2_ROOT] = imx_clk_hw_gate4("csi2_root_clk", "csi2_core", base + 0x4660, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  584  	hws[IMX8MQ_CLK_SDMA1_ROOT] = imx_clk_hw_gate4("sdma1_clk", "ipg_root", base + 0x43a0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  585  	hws[IMX8MQ_CLK_SDMA2_ROOT] = imx_clk_hw_gate4("sdma2_clk", "ipg_audio_root", base + 0x43b0, 0);
b9ef22e1592f4e Peng Fan        2019-12-12  586  
b9ef22e1592f4e Peng Fan        2019-12-12  587  	hws[IMX8MQ_GPT_3M_CLK] = imx_clk_hw_fixed_factor("gpt_3m", "osc_25m", 1, 8);
b9ef22e1592f4e Peng Fan        2019-12-12  588  	hws[IMX8MQ_CLK_DRAM_ALT_ROOT] = imx_clk_hw_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
b9ef22e1592f4e Peng Fan        2019-12-12  589  
d6fb02f054127c Peng Fan        2020-02-19  590  	hws[IMX8MQ_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
d6fb02f054127c Peng Fan        2020-02-19  591  					   hws[IMX8MQ_CLK_A53_CORE]->clk,
d6fb02f054127c Peng Fan        2020-02-19  592  					   hws[IMX8MQ_CLK_A53_CORE]->clk,
b9ef22e1592f4e Peng Fan        2019-12-12  593  					   hws[IMX8MQ_ARM_PLL_OUT]->clk,
d6fb02f054127c Peng Fan        2020-02-19  594  					   hws[IMX8MQ_CLK_A53_DIV]->clk);
b9ef22e1592f4e Peng Fan        2019-12-12  595  
b9ef22e1592f4e Peng Fan        2019-12-12  596  	imx_check_clk_hws(hws, IMX8MQ_CLK_END);
b9ef22e1592f4e Peng Fan        2019-12-12  597  
b9ef22e1592f4e Peng Fan        2019-12-12  598  	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
e8760d8a698c3d Anson Huang     2019-08-06  599  	if (err < 0) {
b9ef22e1592f4e Peng Fan        2019-12-12  600  		dev_err(dev, "failed to register hws for i.MX8MQ\n");
b9ef22e1592f4e Peng Fan        2019-12-12  601  		goto unregister_hws;
b9ef22e1592f4e Peng Fan        2019-12-12  602  	}
b9ef22e1592f4e Peng Fan        2019-12-12  603  
2d5513bf7563b4 Peng Fan        2023-01-04  604  	imx_register_uart_clocks();
15c64ff7625513 Anson Huang     2019-06-19  605  
e8760d8a698c3d Anson Huang     2019-08-06  606  	return 0;
e8760d8a698c3d Anson Huang     2019-08-06  607  
b9ef22e1592f4e Peng Fan        2019-12-12  608  unregister_hws:
b9ef22e1592f4e Peng Fan        2019-12-12  609  	imx_unregister_hw_clocks(hws, IMX8MQ_CLK_END);
e8760d8a698c3d Anson Huang     2019-08-06  610  
b80522040cd3f0 Abel Vesa       2018-12-01 @611  	return err;
b80522040cd3f0 Abel Vesa       2018-12-01  612  }
b80522040cd3f0 Abel Vesa       2018-12-01  613  

:::::: The code at line 611 was first introduced by commit
:::::: b80522040cd3f0944410a6635ceda111a6d651be clk: imx: Add clock driver for i.MX8MQ CCM

:::::: TO: Abel Vesa <abel.vesa@nxp.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
