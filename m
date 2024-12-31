Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967B24B26
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735614697; cv=none; b=k91HqZnGIEGUfJJEhiG+ZFY+KaRpWar3/uFKHZuad3qBX3b0yQgq3ECBu+7BiZAxKgkvdFeWufmlP4VpOx2gTlEyXRhldWCUsGaQ12bC9I/USzLMFbC1bDonl5vLpLuubVI2ty2R2y01jvFF61EvkfQpztLrCKNK39w8D0wsQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735614697; c=relaxed/simple;
	bh=buJJRApetZaOMn58TJT+EQhfkF04lduGQiVdSi5yOjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8Y+ab0FV+HByXMpAE6na+vZNc1TFZBPdQV3h1Pw1vt0xVaOGyC8DR6M5oSA+ItbyL/ACgHucXf/JLqcUSFxwGHqIDdTQT3vs+B4TVMyPiBZgOInqyCWQh502KDVNgXXQCQaaSl76jt9S8kTJ4TrzELs1wIXzf9flheSLy8eF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmiccKUi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmiccKUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735614695; x=1767150695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=buJJRApetZaOMn58TJT+EQhfkF04lduGQiVdSi5yOjM=;
  b=LmiccKUidA2yin0mMP3EgUigysMOe6LN2Ys/6DeFFEYJkJ8Zx260qOju
   qMMOAHdxPMuo3ZLflaksfJ/m311WIsXISoDWLtua12feOJfjcLbXi311/
   ad7stOWnWDv4hYg3NfMEqyqPWl5GyXHR0yYKn7UXA4fO/smM+kOTrnRqY
   ra/GD3D4q4txRQJgn4Vctlf4SfNgIZftKE/hC+J6zkwGkHaZutvR4ricy
   i6pgQza8HKbX/ed+MZ3PsNjJ20qavx5a9aU8K36KeexYGN02ry11QdXiM
   /urnj2J3SW+jRGUATCRpCKXPfMG4hqlXx7JrlTKL2VSU8rNgDPemlWvWb
   w==;
X-CSE-ConnectionGUID: r90b1PeqSZuaFWCVMBWWrA==
X-CSE-MsgGUID: L8dKD9bXT/y25BUXnjZ/9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39669529"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="39669529"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 19:11:34 -0800
X-CSE-ConnectionGUID: Cgh9c4KFQ2yjiqu5grb1Lg==
X-CSE-MsgGUID: oubgpdqDQ9u7iWMkVPWXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105002201"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2024 19:11:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSSfL-0006eN-0N;
	Tue, 31 Dec 2024 03:11:31 +0000
Date: Tue, 31 Dec 2024 11:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 11/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <202412311031.781qvq8q-lkp@intel.com>
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
In-Reply-To: <20241229145027.3984542-12-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-12-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: linux-amarula@amarulasolutions.com
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Abel Vesa <abelvesa@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-clk@vger.kernel.org

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on clk/clk-next linus/master v6.13-rc5 next-20241220]
[cannot apply to abelvesa/clk/imx]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-clock-imx8mm-add-VIDEO_PLL-clocks/20241229-225716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241229145027.3984542-12-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v8 11/18] clk: imx: add support for i.MX8MN anatop clock driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r071-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311031.781qvq8q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412311031.781qvq8q-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mn-anatop.c:244 imx8mn_anatop_clocks_probe() error: buffer overflow 'hws' 62 <= 62

vim +/hws +244 drivers/clk/imx/clk-imx8mn-anatop.c

87df58feb5834e Dario Binacchi 2024-12-29   39  
87df58feb5834e Dario Binacchi 2024-12-29   40  static int imx8mn_anatop_clocks_probe(struct platform_device *pdev)
87df58feb5834e Dario Binacchi 2024-12-29   41  {
87df58feb5834e Dario Binacchi 2024-12-29   42  	struct device *dev = &pdev->dev;
87df58feb5834e Dario Binacchi 2024-12-29   43  	struct device_node *np = dev->of_node;
87df58feb5834e Dario Binacchi 2024-12-29   44  	void __iomem *base;
87df58feb5834e Dario Binacchi 2024-12-29   45  	int ret;
87df58feb5834e Dario Binacchi 2024-12-29   46  
87df58feb5834e Dario Binacchi 2024-12-29   47  	base = devm_platform_ioremap_resource(pdev, 0);
87df58feb5834e Dario Binacchi 2024-12-29   48  	if (IS_ERR(base)) {
87df58feb5834e Dario Binacchi 2024-12-29   49  		dev_err(dev, "failed to get base address\n");
87df58feb5834e Dario Binacchi 2024-12-29   50  		return PTR_ERR(base);
87df58feb5834e Dario Binacchi 2024-12-29   51  	}
87df58feb5834e Dario Binacchi 2024-12-29   52  
87df58feb5834e Dario Binacchi 2024-12-29   53  	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
87df58feb5834e Dario Binacchi 2024-12-29   54  						    IMX8MN_ANATOP_CLK_END),
87df58feb5834e Dario Binacchi 2024-12-29   55  				   GFP_KERNEL);
87df58feb5834e Dario Binacchi 2024-12-29   56  	if (WARN_ON(!clk_hw_data))
87df58feb5834e Dario Binacchi 2024-12-29   57  		return -ENOMEM;
87df58feb5834e Dario Binacchi 2024-12-29   58  
87df58feb5834e Dario Binacchi 2024-12-29   59  	clk_hw_data->num = IMX8MN_ANATOP_CLK_END;
87df58feb5834e Dario Binacchi 2024-12-29   60  	hws = clk_hw_data->hws;
87df58feb5834e Dario Binacchi 2024-12-29   61  
87df58feb5834e Dario Binacchi 2024-12-29   62  	hws[IMX8MN_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
87df58feb5834e Dario Binacchi 2024-12-29   63  	hws[IMX8MN_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
87df58feb5834e Dario Binacchi 2024-12-29   64  	hws[IMX8MN_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
87df58feb5834e Dario Binacchi 2024-12-29   65  
87df58feb5834e Dario Binacchi 2024-12-29   66  	hws[IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   67  		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   68  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   69  	hws[IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   70  		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   71  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   72  	hws[IMX8MN_ANATOP_VIDEO_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   73  		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   74  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   75  	hws[IMX8MN_ANATOP_DRAM_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   76  		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   77  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   78  	hws[IMX8MN_ANATOP_GPU_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   79  		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   80  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   81  	hws[IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   82  		imx_clk_hw_mux("m7_alt_pll_ref_sel", base + 0x74, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   83  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   84  	hws[IMX8MN_ANATOP_ARM_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   85  		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   86  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   87  	hws[IMX8MN_ANATOP_SYS_PLL3_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   88  		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   89  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   90  
87df58feb5834e Dario Binacchi 2024-12-29   91  	hws[IMX8MN_ANATOP_AUDIO_PLL1] =
87df58feb5834e Dario Binacchi 2024-12-29   92  		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   93  				   base, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29   94  	hws[IMX8MN_ANATOP_AUDIO_PLL2] =
87df58feb5834e Dario Binacchi 2024-12-29   95  		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   96  				   base + 0x14, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29   97  	hws[IMX8MN_ANATOP_VIDEO_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29   98  		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   99  				   base + 0x28, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  100  	hws[IMX8MN_ANATOP_DRAM_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  101  		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50,
87df58feb5834e Dario Binacchi 2024-12-29  102  				   &imx_1443x_dram_pll);
87df58feb5834e Dario Binacchi 2024-12-29  103  	hws[IMX8MN_ANATOP_GPU_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  104  		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64,
87df58feb5834e Dario Binacchi 2024-12-29  105  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  106  	hws[IMX8MN_ANATOP_M7_ALT_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  107  		imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29  108  				   base + 0x74, &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  109  	hws[IMX8MN_ANATOP_ARM_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  110  		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84,
87df58feb5834e Dario Binacchi 2024-12-29  111  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  112  	hws[IMX8MN_ANATOP_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
87df58feb5834e Dario Binacchi 2024-12-29  113  	hws[IMX8MN_ANATOP_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
87df58feb5834e Dario Binacchi 2024-12-29  114  	hws[IMX8MN_ANATOP_SYS_PLL3] =
87df58feb5834e Dario Binacchi 2024-12-29  115  		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114,
87df58feb5834e Dario Binacchi 2024-12-29  116  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  117  
87df58feb5834e Dario Binacchi 2024-12-29  118  	/* PLL bypass out */
87df58feb5834e Dario Binacchi 2024-12-29  119  	hws[IMX8MN_ANATOP_AUDIO_PLL1_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  120  		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  121  				     audio_pll1_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  122  				     ARRAY_SIZE(audio_pll1_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  123  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  124  	hws[IMX8MN_ANATOP_AUDIO_PLL2_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  125  		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  126  				     audio_pll2_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  127  				     ARRAY_SIZE(audio_pll2_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  128  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  129  	hws[IMX8MN_ANATOP_VIDEO_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  130  		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  131  				     video_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  132  				     ARRAY_SIZE(video_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  133  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  134  	hws[IMX8MN_ANATOP_DRAM_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  135  		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  136  				     dram_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  137  				     ARRAY_SIZE(dram_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  138  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  139  	hws[IMX8MN_ANATOP_GPU_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  140  		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  141  				     gpu_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  142  				     ARRAY_SIZE(gpu_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  143  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  144  	hws[IMX8MN_ANATOP_M7_ALT_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  145  		imx_clk_hw_mux_flags("m7_alt_pll_bypass", base + 0x74, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  146  				     m7_alt_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  147  				     ARRAY_SIZE(m7_alt_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  148  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  149  	hws[IMX8MN_ANATOP_ARM_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  150  		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  151  				     arm_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  152  				     ARRAY_SIZE(arm_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  153  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  154  	hws[IMX8MN_ANATOP_SYS_PLL3_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  155  		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  156  				     sys_pll3_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  157  				     ARRAY_SIZE(sys_pll3_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  158  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  159  
87df58feb5834e Dario Binacchi 2024-12-29  160  	/* PLL out gate */
87df58feb5834e Dario Binacchi 2024-12-29  161  	hws[IMX8MN_ANATOP_AUDIO_PLL1_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  162  		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  163  				base, 13);
87df58feb5834e Dario Binacchi 2024-12-29  164  	hws[IMX8MN_ANATOP_AUDIO_PLL2_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  165  		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  166  				base + 0x14, 13);
87df58feb5834e Dario Binacchi 2024-12-29  167  	hws[IMX8MN_ANATOP_VIDEO_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  168  		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  169  				base + 0x28, 13);
87df58feb5834e Dario Binacchi 2024-12-29  170  	hws[IMX8MN_ANATOP_DRAM_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  171  		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  172  				base + 0x50, 13);
87df58feb5834e Dario Binacchi 2024-12-29  173  	hws[IMX8MN_ANATOP_GPU_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  174  		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  175  				base + 0x64, 11);
87df58feb5834e Dario Binacchi 2024-12-29  176  	hws[IMX8MN_ANATOP_M7_ALT_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  177  		imx_clk_hw_gate("m7_alt_pll_out", "m7_alt_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  178  				base + 0x74, 11);
87df58feb5834e Dario Binacchi 2024-12-29  179  	hws[IMX8MN_ANATOP_ARM_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  180  		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  181  				base + 0x84, 11);
87df58feb5834e Dario Binacchi 2024-12-29  182  	hws[IMX8MN_ANATOP_SYS_PLL3_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  183  		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  184  				base + 0x114, 11);
87df58feb5834e Dario Binacchi 2024-12-29  185  
87df58feb5834e Dario Binacchi 2024-12-29  186  	/* SYS PLL1 fixed output */
87df58feb5834e Dario Binacchi 2024-12-29  187  	hws[IMX8MN_ANATOP_SYS_PLL1_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  188  		imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
87df58feb5834e Dario Binacchi 2024-12-29  189  	hws[IMX8MN_ANATOP_SYS_PLL1_40M] =
87df58feb5834e Dario Binacchi 2024-12-29  190  		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
87df58feb5834e Dario Binacchi 2024-12-29  191  	hws[IMX8MN_ANATOP_SYS_PLL1_80M] =
87df58feb5834e Dario Binacchi 2024-12-29  192  		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
87df58feb5834e Dario Binacchi 2024-12-29  193  	hws[IMX8MN_ANATOP_SYS_PLL1_100M] =
87df58feb5834e Dario Binacchi 2024-12-29  194  		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
87df58feb5834e Dario Binacchi 2024-12-29  195  	hws[IMX8MN_ANATOP_SYS_PLL1_133M] =
87df58feb5834e Dario Binacchi 2024-12-29  196  		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
87df58feb5834e Dario Binacchi 2024-12-29  197  	hws[IMX8MN_ANATOP_SYS_PLL1_160M] =
87df58feb5834e Dario Binacchi 2024-12-29  198  		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
87df58feb5834e Dario Binacchi 2024-12-29  199  	hws[IMX8MN_ANATOP_SYS_PLL1_200M] =
87df58feb5834e Dario Binacchi 2024-12-29  200  		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
87df58feb5834e Dario Binacchi 2024-12-29  201  	hws[IMX8MN_ANATOP_SYS_PLL1_266M] =
87df58feb5834e Dario Binacchi 2024-12-29  202  		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
87df58feb5834e Dario Binacchi 2024-12-29  203  	hws[IMX8MN_ANATOP_SYS_PLL1_400M] =
87df58feb5834e Dario Binacchi 2024-12-29  204  		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
87df58feb5834e Dario Binacchi 2024-12-29  205  	hws[IMX8MN_ANATOP_SYS_PLL1_800M] =
87df58feb5834e Dario Binacchi 2024-12-29  206  		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
87df58feb5834e Dario Binacchi 2024-12-29  207  
87df58feb5834e Dario Binacchi 2024-12-29  208  	/* SYS PLL2 fixed output */
87df58feb5834e Dario Binacchi 2024-12-29  209  	hws[IMX8MN_ANATOP_SYS_PLL2_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  210  		imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
87df58feb5834e Dario Binacchi 2024-12-29  211  	hws[IMX8MN_ANATOP_SYS_PLL2_50M] =
87df58feb5834e Dario Binacchi 2024-12-29  212  		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
87df58feb5834e Dario Binacchi 2024-12-29  213  	hws[IMX8MN_ANATOP_SYS_PLL2_100M] =
87df58feb5834e Dario Binacchi 2024-12-29  214  		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
87df58feb5834e Dario Binacchi 2024-12-29  215  	hws[IMX8MN_ANATOP_SYS_PLL2_125M] =
87df58feb5834e Dario Binacchi 2024-12-29  216  		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
87df58feb5834e Dario Binacchi 2024-12-29  217  	hws[IMX8MN_ANATOP_SYS_PLL2_166M] =
87df58feb5834e Dario Binacchi 2024-12-29  218  		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
87df58feb5834e Dario Binacchi 2024-12-29  219  	hws[IMX8MN_ANATOP_SYS_PLL2_200M] =
87df58feb5834e Dario Binacchi 2024-12-29  220  		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
87df58feb5834e Dario Binacchi 2024-12-29  221  	hws[IMX8MN_ANATOP_SYS_PLL2_250M] =
87df58feb5834e Dario Binacchi 2024-12-29  222  		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
87df58feb5834e Dario Binacchi 2024-12-29  223  	hws[IMX8MN_ANATOP_SYS_PLL2_333M] =
87df58feb5834e Dario Binacchi 2024-12-29  224  		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
87df58feb5834e Dario Binacchi 2024-12-29  225  	hws[IMX8MN_ANATOP_SYS_PLL2_500M] =
87df58feb5834e Dario Binacchi 2024-12-29  226  		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
87df58feb5834e Dario Binacchi 2024-12-29  227  	hws[IMX8MN_ANATOP_SYS_PLL2_1000M] =
87df58feb5834e Dario Binacchi 2024-12-29  228  		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
87df58feb5834e Dario Binacchi 2024-12-29  229  
87df58feb5834e Dario Binacchi 2024-12-29  230  	hws[IMX8MN_ANATOP_CLK_CLKOUT1_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29  231  		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
87df58feb5834e Dario Binacchi 2024-12-29  232  				clkout_sels, ARRAY_SIZE(clkout_sels));
87df58feb5834e Dario Binacchi 2024-12-29  233  	hws[IMX8MN_ANATOP_CLK_CLKOUT1_DIV] =
87df58feb5834e Dario Binacchi 2024-12-29  234  		imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128,
87df58feb5834e Dario Binacchi 2024-12-29  235  				   0, 4);
87df58feb5834e Dario Binacchi 2024-12-29  236  	hws[IMX8MN_ANATOP_CLK_CLKOUT1] =
87df58feb5834e Dario Binacchi 2024-12-29  237  		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
87df58feb5834e Dario Binacchi 2024-12-29  238  	hws[IMX8MN_ANATOP_CLK_CLKOUT2_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29  239  		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
87df58feb5834e Dario Binacchi 2024-12-29  240  				clkout_sels, ARRAY_SIZE(clkout_sels));
87df58feb5834e Dario Binacchi 2024-12-29  241  	hws[IMX8MN_ANATOP_CLK_CLKOUT2_DIV] =
87df58feb5834e Dario Binacchi 2024-12-29  242  		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
87df58feb5834e Dario Binacchi 2024-12-29  243  				   16, 4);
87df58feb5834e Dario Binacchi 2024-12-29 @244  	hws[IMX8MN_ANATOP_CLK_CLKOUT2] =
87df58feb5834e Dario Binacchi 2024-12-29  245  		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
87df58feb5834e Dario Binacchi 2024-12-29  246  
87df58feb5834e Dario Binacchi 2024-12-29  247  	imx_check_clk_hws(hws, IMX8MN_ANATOP_CLK_END);
87df58feb5834e Dario Binacchi 2024-12-29  248  
87df58feb5834e Dario Binacchi 2024-12-29  249  	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
87df58feb5834e Dario Binacchi 2024-12-29  250  	if (ret < 0) {
87df58feb5834e Dario Binacchi 2024-12-29  251  		imx_unregister_hw_clocks(hws, IMX8MN_ANATOP_CLK_END);
87df58feb5834e Dario Binacchi 2024-12-29  252  		return dev_err_probe(dev, ret,
87df58feb5834e Dario Binacchi 2024-12-29  253  				     "failed to register anatop clock provider\n");
87df58feb5834e Dario Binacchi 2024-12-29  254  	}
87df58feb5834e Dario Binacchi 2024-12-29  255  
87df58feb5834e Dario Binacchi 2024-12-29  256  	dev_info(dev, "NXP i.MX8MN anatop clock driver probed\n");
87df58feb5834e Dario Binacchi 2024-12-29  257  	return 0;
87df58feb5834e Dario Binacchi 2024-12-29  258  }
87df58feb5834e Dario Binacchi 2024-12-29  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
