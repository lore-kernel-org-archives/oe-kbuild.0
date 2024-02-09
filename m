Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3812E4C
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707475225; cv=none; b=D7upGIwYYbtGmkT1kuXjGowJuacgEPeHbnpjqFH1LTgpoNM1Y68iaCT5VVWNYR879v1IZAU0shly+Fpzpq4fKyTuQPnbe3AaTTXn3ZqJRKSH+bVJNYQXNh61wbmrdgUPqzdY04B4gQwr/nfrwsj1lx0dUk0Fr1vpwdqzX8S5FW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707475225; c=relaxed/simple;
	bh=lLCuRw4IMcYQDEiErJ57m+7Q53T4X8ZkJl6x9WGt6kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qItSviyzzW85LFV4bSMyVwyMWCVBSRYkrZFBh5yzutcpNCZ44gfVhQDI1DSy2YjA1/iPKfrainPj+I+52RhqvTAiAWEbI1n/lkGFWBA5Tv4zhJTpaAUMG1zfoD38uhEb2FHp5BVD+YhsJ9kFpkxbFqfmndO2JiAfc0EM40aTw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj6g9kR1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj6g9kR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707475223; x=1739011223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLCuRw4IMcYQDEiErJ57m+7Q53T4X8ZkJl6x9WGt6kc=;
  b=Wj6g9kR1sclhUPTyWIRzEkbheiCcIG1QGx5y7L9RS1xL1rB6ktAQLWgp
   8BedJAwAWhrFYXd2+SVVig9y0Q8KIp5xlWZrZ4/JjgQtJAkmuQEJmDVDu
   AHwAZCpy88l1sIByv91PoYwpEQDArJsuBtXuZM3qX1vf+bqM/ynj1CwBb
   QgyNAFKs8zxRROxr9fP3zvZ3gSR/UXPMtJal8AH7enHa9z2ZLikWaXcz1
   Ri1KDYkv6Hz0vPoGP+V/JxsbzSBGUFJyyQJRJjdj8T0HSfOjNRo86idtr
   DVABqFNibDjS1ilkAAXonJ+fcu11ysBmXeaAPeQnN8brMJ5pbs6cTXteq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1559992"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1559992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 02:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1898027"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 02:40:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYOIs-0004cw-37;
	Fri, 09 Feb 2024 10:40:18 +0000
Date: Fri, 9 Feb 2024 18:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: videocc-sm8550: Add support for SM8650
 videocc
Message-ID: <202402091804.SdrSLt10-lkp@intel.com>
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
In-Reply-To: <20240206113145.31096-3-quic_jkona@quicinc.com>
References: <20240206113145.31096-3-quic_jkona@quicinc.com>
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Imran Shaik <quic_imrashai@quicinc.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>
CC: Jagadeesh Kona <quic_jkona@quicinc.com>

Hi Jagadeesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.8-rc3]
[cannot apply to next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagadeesh-Kona/dt-bindings-clock-qcom-Add-video-clock-bindings-for-SM8650/20240206-194148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240206113145.31096-3-quic_jkona%40quicinc.com
patch subject: [PATCH 2/5] clk: qcom: videocc-sm8550: Add support for SM8650 videocc
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r071-20240207 (https://download.01.org/0day-ci/archive/20240209/202402091804.SdrSLt10-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402091804.SdrSLt10-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/videocc-sm8550.c:590 video_cc_sm8550_probe() error: uninitialized symbol 'offset'.

vim +/offset +590 drivers/clk/qcom/videocc-sm8550.c

f53153a37969c1 Jagadeesh Kona   2023-05-24  542  
f53153a37969c1 Jagadeesh Kona   2023-05-24  543  static int video_cc_sm8550_probe(struct platform_device *pdev)
f53153a37969c1 Jagadeesh Kona   2023-05-24  544  {
f53153a37969c1 Jagadeesh Kona   2023-05-24  545  	struct regmap *regmap;
f53153a37969c1 Jagadeesh Kona   2023-05-24  546  	int ret;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  547  	u32 offset;
f53153a37969c1 Jagadeesh Kona   2023-05-24  548  
f53153a37969c1 Jagadeesh Kona   2023-05-24  549  	ret = devm_pm_runtime_enable(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  550  	if (ret)
f53153a37969c1 Jagadeesh Kona   2023-05-24  551  		return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  552  
f53153a37969c1 Jagadeesh Kona   2023-05-24  553  	ret = pm_runtime_resume_and_get(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  554  	if (ret)
f53153a37969c1 Jagadeesh Kona   2023-05-24  555  		return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  556  
f53153a37969c1 Jagadeesh Kona   2023-05-24  557  	regmap = qcom_cc_map(pdev, &video_cc_sm8550_desc);
f53153a37969c1 Jagadeesh Kona   2023-05-24  558  	if (IS_ERR(regmap)) {
f53153a37969c1 Jagadeesh Kona   2023-05-24  559  		pm_runtime_put(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  560  		return PTR_ERR(regmap);
f53153a37969c1 Jagadeesh Kona   2023-05-24  561  	}
f53153a37969c1 Jagadeesh Kona   2023-05-24  562  
5ab3df7257a04f Jagadeesh Kona   2024-02-06  563  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8550-videocc")) {
5ab3df7257a04f Jagadeesh Kona   2024-02-06  564  		video_cc_sm8550_clocks[VIDEO_CC_MVS0_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  565  		video_cc_sm8550_clocks[VIDEO_CC_MVS0C_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  566  		video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  567  		video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  568  		video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  569  		offset = 0x8140;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  570  	} else  if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
5ab3df7257a04f Jagadeesh Kona   2024-02-06  571  		video_cc_pll0_config.l = 0x1e;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  572  		video_cc_pll0_config.alpha = 0xa000;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  573  		video_cc_pll1_config.l = 0x2b;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  574  		video_cc_pll1_config.alpha = 0xc000;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  575  		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_sm8650;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  576  		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_sm8650;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  577  		offset = 0x8150;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  578  	}
5ab3df7257a04f Jagadeesh Kona   2024-02-06  579  
a2620539ae2529 Dmitry Baryshkov 2023-10-16  580  	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
a2620539ae2529 Dmitry Baryshkov 2023-10-16  581  	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
f53153a37969c1 Jagadeesh Kona   2023-05-24  582  
f53153a37969c1 Jagadeesh Kona   2023-05-24  583  	/*
f53153a37969c1 Jagadeesh Kona   2023-05-24  584  	 * Keep clocks always enabled:
f53153a37969c1 Jagadeesh Kona   2023-05-24  585  	 *	video_cc_ahb_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  586  	 *	video_cc_sleep_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  587  	 *	video_cc_xo_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  588  	 */
f53153a37969c1 Jagadeesh Kona   2023-05-24  589  	regmap_update_bits(regmap, 0x80f4, BIT(0), BIT(0));
5ab3df7257a04f Jagadeesh Kona   2024-02-06 @590  	regmap_update_bits(regmap, offset, BIT(0), BIT(0));
f53153a37969c1 Jagadeesh Kona   2023-05-24  591  	regmap_update_bits(regmap, 0x8124, BIT(0), BIT(0));
f53153a37969c1 Jagadeesh Kona   2023-05-24  592  
f53153a37969c1 Jagadeesh Kona   2023-05-24  593  	ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
f53153a37969c1 Jagadeesh Kona   2023-05-24  594  
f53153a37969c1 Jagadeesh Kona   2023-05-24  595  	pm_runtime_put(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  596  
f53153a37969c1 Jagadeesh Kona   2023-05-24  597  	return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  598  }
f53153a37969c1 Jagadeesh Kona   2023-05-24  599  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
