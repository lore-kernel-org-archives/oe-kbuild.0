Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B3128801
	for <oe-kbuild@lists.linux.dev>; Wed,  8 May 2024 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715184765; cv=none; b=LvrD216XmlixzghyvcZbsx0VCNLH0Jy/2DrI/fCr1REQ3wcmZy6qz590xsmZqHZ8T86alNsOQ5B6g8OGbv61DEKVpafOO0sBWUs/B9GDUQkdwkXWKzMt6ARGLsCqGEyATpjQZsoGbYTh6FfShuHpbFuH/O5wlK+cVq0EoVuHDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715184765; c=relaxed/simple;
	bh=6gpmZz3lx7DGVuIcnZJkO0fer+VbhqrG8OjWOI9+0Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpkEIMgup19xZvvbWHifyenKH3WLPlW35GWeHuEhIfuOqIfkMu6Vpx0qNK0E5ROIeXGmSO2z/p7EbR8UO8C8b/TUttuad2iYWFY/ID3061h/xJDhbX7w3Ty28aSVL5i3OfrAQyLNV8TCaGrB0eMpD232gr7HDNp/XymPy8KEjRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1pkdPKF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1pkdPKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715184762; x=1746720762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6gpmZz3lx7DGVuIcnZJkO0fer+VbhqrG8OjWOI9+0Uc=;
  b=Q1pkdPKFMSHxCmtTGWDsPh4FUZLbrl7YAK6uP6JgsoWJ/h9GikUgLiPr
   vA1WqRMnHNO9FYqZF4pQ5vp0RZigeXWFFLsWJcIVPQs0y1Y2KMFriaj7G
   u0aVVo3qu/c3mIcyR4JSrxW8te2arGMpSrF8uDJceOYUbvUZJg6eJw7ks
   R/Z4cOMYpEiJPf+F9U2pUYeDwoBLCKms/7U8HQF/Q5oyE8ymjPf+cHmJW
   MLWZCLitpVoNnKePIQoqeeGs6Dhgpdr1zXAJeOLxZ6yujQJYCqmsQub8/
   5Jnj3oCq9y6V9QISIVKzTsTFYfgjgEVA1LgbAH1Qfv24gNgF68/d7r6dM
   A==;
X-CSE-ConnectionGUID: t464EF5FTJu40TAv5eFbyA==
X-CSE-MsgGUID: xtnaQzEIRyaB5OB3IpymVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14851525"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="14851525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 09:12:42 -0700
X-CSE-ConnectionGUID: fyECZ8P5SxOx9V2KmTmLnQ==
X-CSE-MsgGUID: w4khrgNGS8669A0hQvFBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="59801609"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2024 09:12:40 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4juH-0003iU-2S;
	Wed, 08 May 2024 16:12:37 +0000
Date: Thu, 9 May 2024 00:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10354/12060] drivers/dma/fsl-edma-main.c:567
 fsl_edma_probe() warn: statement has no effect 31
Message-ID: <202405090002.O90z9BPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 3f2282931f00c4c9c5057bb02f46778ba64ff625 [10354/12060] dmaengine: fsl-edma: use _Generic to handle difference type
:::::: branch date: 9 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240508 (https://download.01.org/0day-ci/archive/20240509/202405090002.O90z9BPr-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405090002.O90z9BPr-lkp@intel.com/

New smatch warnings:
drivers/dma/fsl-edma-main.c:567 fsl_edma_probe() warn: statement has no effect 31
drivers/dma/fsl-edma-main.c:567 fsl_edma_probe() warn: statement has no effect 31
drivers/dma/fsl-edma-main.c:696 fsl_edma_resume_early() warn: statement has no effect 31
drivers/dma/fsl-edma-main.c:696 fsl_edma_resume_early() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:439 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:439 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:495 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:495 fsl_edma_fill_tcd() warn: statement has no effect 31

Old smatch warnings:
drivers/dma/fsl-edma-common.c:441 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:441 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:442 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:442 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:444 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:444 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:445 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:445 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:447 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:447 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:448 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:448 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:450 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:450 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:451 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:451 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:452 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:452 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:454 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:454 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:460 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:460 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:475 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:475 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:496 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:496 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:498 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:498 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:500 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:500 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:517 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:517 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:518 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:518 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:520 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:520 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:521 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:521 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:523 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:523 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:525 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:525 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:542 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:542 fsl_edma_fill_tcd() warn: statement has no effect 31

vim +567 drivers/dma/fsl-edma-main.c

72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  439  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  440  static int fsl_edma_probe(struct platform_device *pdev)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  441  {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  442  	struct device_node *np = pdev->dev.of_node;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  443  	struct fsl_edma_engine *fsl_edma;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  444  	const struct fsl_edma_drvdata *drvdata = NULL;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  445  	u32 chan_mask[2] = {0, 0};
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  446  	char clk_name[36];
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  447  	struct edma_regs *regs;
33a0b734543ed5 drivers/dma/fsl-edma.c      Yu Liao           2023-08-21  448  	int chans;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  449  	int ret, i;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  450  
a67ba97dfb3048 drivers/dma/fsl-edma-main.c Rob Herring       2023-10-06  451  	drvdata = device_get_match_data(&pdev->dev);
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  452  	if (!drvdata) {
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  453  		dev_err(&pdev->dev, "unable to find driver data\n");
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  454  		return -EINVAL;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  455  	}
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  456  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  457  	ret = of_property_read_u32(np, "dma-channels", &chans);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  458  	if (ret) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  459  		dev_err(&pdev->dev, "Can't get dma-channels.\n");
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  460  		return ret;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  461  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  462  
33a0b734543ed5 drivers/dma/fsl-edma.c      Yu Liao           2023-08-21  463  	fsl_edma = devm_kzalloc(&pdev->dev, struct_size(fsl_edma, chans, chans),
33a0b734543ed5 drivers/dma/fsl-edma.c      Yu Liao           2023-08-21  464  				GFP_KERNEL);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  465  	if (!fsl_edma)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  466  		return -ENOMEM;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  467  
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  468  	fsl_edma->drvdata = drvdata;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  469  	fsl_edma->n_chans = chans;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  470  	mutex_init(&fsl_edma->fsl_edma_mutex);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  471  
4b23603a251d24 drivers/dma/fsl-edma.c      Tudor Ambarus     2022-11-10  472  	fsl_edma->membase = devm_platform_ioremap_resource(pdev, 0);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  473  	if (IS_ERR(fsl_edma->membase))
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  474  		return PTR_ERR(fsl_edma->membase);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  475  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  476  	if (!(drvdata->flags & FSL_EDMA_DRV_SPLIT_REG)) {
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  477  		fsl_edma_setup_regs(fsl_edma);
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  478  		regs = &fsl_edma->regs;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  479  	}
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  480  
9e006b243962a4 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  481  	if (drvdata->flags & FSL_EDMA_DRV_HAS_DMACLK) {
a9903de3aa1673 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  482  		fsl_edma->dmaclk = devm_clk_get_enabled(&pdev->dev, "dma");
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  483  		if (IS_ERR(fsl_edma->dmaclk)) {
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  484  			dev_err(&pdev->dev, "Missing DMA block clock.\n");
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  485  			return PTR_ERR(fsl_edma->dmaclk);
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  486  		}
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  487  	}
232a7f18cf8ecb drivers/dma/fsl-edma.c      Robin Gong        2019-07-24  488  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  489  	ret = of_property_read_variable_u32_array(np, "dma-channel-mask", chan_mask, 1, 2);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  490  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  491  	if (ret > 0) {
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  492  		fsl_edma->chan_masked = chan_mask[1];
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  493  		fsl_edma->chan_masked <<= 32;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  494  		fsl_edma->chan_masked |= chan_mask[0];
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  495  	}
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  496  
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  497  	for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  498  		char clkname[32];
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  499  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  500  		/* eDMAv3 mux register move to TCD area if ch_mux exist */
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  501  		if (drvdata->flags & FSL_EDMA_DRV_SPLIT_REG)
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  502  			break;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  503  
4b23603a251d24 drivers/dma/fsl-edma.c      Tudor Ambarus     2022-11-10  504  		fsl_edma->muxbase[i] = devm_platform_ioremap_resource(pdev,
4b23603a251d24 drivers/dma/fsl-edma.c      Tudor Ambarus     2022-11-10  505  								      1 + i);
2610acf46b9ed5 drivers/dma/fsl-edma.c      Andreas Platschek 2017-12-14  506  		if (IS_ERR(fsl_edma->muxbase[i])) {
2610acf46b9ed5 drivers/dma/fsl-edma.c      Andreas Platschek 2017-12-14  507  			/* on error: disable all previously enabled clks */
2610acf46b9ed5 drivers/dma/fsl-edma.c      Andreas Platschek 2017-12-14  508  			fsl_disable_clocks(fsl_edma, i);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  509  			return PTR_ERR(fsl_edma->muxbase[i]);
2610acf46b9ed5 drivers/dma/fsl-edma.c      Andreas Platschek 2017-12-14  510  		}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  511  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  512  		sprintf(clkname, "dmamux%d", i);
a9903de3aa1673 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  513  		fsl_edma->muxclk[i] = devm_clk_get_enabled(&pdev->dev, clkname);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  514  		if (IS_ERR(fsl_edma->muxclk[i])) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  515  			dev_err(&pdev->dev, "Missing DMAMUX block clock.\n");
2610acf46b9ed5 drivers/dma/fsl-edma.c      Andreas Platschek 2017-12-14  516  			/* on error: disable all previously enabled clks */
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  517  			return PTR_ERR(fsl_edma->muxclk[i]);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  518  		}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  519  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  520  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  521  	fsl_edma->big_endian = of_property_read_bool(np, "big-endian");
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  522  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  523  	if (drvdata->flags & FSL_EDMA_DRV_HAS_PD) {
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  524  		ret = fsl_edma3_attach_pd(pdev, fsl_edma);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  525  		if (ret)
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  526  			return ret;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  527  	}
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  528  
de7d9cb3b064fd drivers/dma/fsl-edma-main.c Frank Li          2023-12-21  529  	if (drvdata->flags & FSL_EDMA_DRV_TCD64)
de7d9cb3b064fd drivers/dma/fsl-edma-main.c Frank Li          2023-12-21  530  		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
de7d9cb3b064fd drivers/dma/fsl-edma-main.c Frank Li          2023-12-21  531  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  532  	INIT_LIST_HEAD(&fsl_edma->dma_dev.channels);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  533  	for (i = 0; i < fsl_edma->n_chans; i++) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  534  		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  535  		int len;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  536  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  537  		if (fsl_edma->chan_masked & BIT(i))
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  538  			continue;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  539  
9b05554c5ca682 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  540  		snprintf(fsl_chan->chan_name, sizeof(fsl_chan->chan_name), "%s-CH%02d",
9b05554c5ca682 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  541  							   dev_name(&pdev->dev), i);
9b05554c5ca682 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  542  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  543  		fsl_chan->edma = fsl_edma;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  544  		fsl_chan->pm_state = RUNNING;
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li          2024-03-23  545  		fsl_chan->srcid = 0;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  546  		fsl_chan->idle = true;
0fa89f972da607 drivers/dma/fsl-edma.c      Laurentiu Tudor   2019-01-18  547  		fsl_chan->dma_dir = DMA_NONE;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  548  		fsl_chan->vchan.desc_free = fsl_edma_free_desc;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  549  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  550  		len = (drvdata->flags & FSL_EDMA_DRV_SPLIT_REG) ?
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  551  				offsetof(struct fsl_edma3_ch_reg, tcd) : 0;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  552  		fsl_chan->tcd = fsl_edma->membase
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  553  				+ i * drvdata->chreg_space_sz + drvdata->chreg_off + len;
e0a08ed25492b6 drivers/dma/fsl-edma-main.c Frank Li          2023-12-21  554  		fsl_chan->mux_addr = fsl_edma->membase + drvdata->mux_off + i * drvdata->mux_skip;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  555  
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  556  		if (drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK) {
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  557  			snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  558  			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  559  							     (const char *)clk_name);
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  560  
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  561  			if (IS_ERR(fsl_chan->clk))
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  562  				return PTR_ERR(fsl_chan->clk);
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  563  		}
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  564  		fsl_chan->pdev = pdev;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  565  		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  566  
537df9ab2d72bb drivers/dma/fsl-edma-main.c Frank Li          2023-12-21 @567  		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  568  		fsl_edma_chan_mux(fsl_chan, 0, false);
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  569  		if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK)
d8d4355861d874 drivers/dma/fsl-edma-main.c Joy Zou           2024-03-23  570  			clk_disable_unprepare(fsl_chan->clk);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  571  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  572  
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  573  	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
0fe25d61102d44 drivers/dma/fsl-edma.c      Stefan Agner      2015-06-07  574  	if (ret)
0fe25d61102d44 drivers/dma/fsl-edma.c      Stefan Agner      2015-06-07  575  		return ret;
0fe25d61102d44 drivers/dma/fsl-edma.c      Stefan Agner      2015-06-07  576  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  577  	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  578  	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  579  	dma_cap_set(DMA_CYCLIC, fsl_edma->dma_dev.cap_mask);
e0674853943287 drivers/dma/fsl-edma.c      Joy Zou           2021-10-26  580  	dma_cap_set(DMA_MEMCPY, fsl_edma->dma_dev.cap_mask);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  581  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  582  	fsl_edma->dma_dev.dev = &pdev->dev;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  583  	fsl_edma->dma_dev.device_alloc_chan_resources
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  584  		= fsl_edma_alloc_chan_resources;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  585  	fsl_edma->dma_dev.device_free_chan_resources
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  586  		= fsl_edma_free_chan_resources;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  587  	fsl_edma->dma_dev.device_tx_status = fsl_edma_tx_status;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  588  	fsl_edma->dma_dev.device_prep_slave_sg = fsl_edma_prep_slave_sg;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  589  	fsl_edma->dma_dev.device_prep_dma_cyclic = fsl_edma_prep_dma_cyclic;
e0674853943287 drivers/dma/fsl-edma.c      Joy Zou           2021-10-26  590  	fsl_edma->dma_dev.device_prep_dma_memcpy = fsl_edma_prep_memcpy;
d80f381f321ab7 drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  591  	fsl_edma->dma_dev.device_config = fsl_edma_slave_config;
d80f381f321ab7 drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  592  	fsl_edma->dma_dev.device_pause = fsl_edma_pause;
d80f381f321ab7 drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  593  	fsl_edma->dma_dev.device_resume = fsl_edma_resume;
d80f381f321ab7 drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  594  	fsl_edma->dma_dev.device_terminate_all = fsl_edma_terminate_all;
ba1cab79cfc629 drivers/dma/fsl-edma.c      Andrey Smirnov    2019-07-31  595  	fsl_edma->dma_dev.device_synchronize = fsl_edma_synchronize;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  596  	fsl_edma->dma_dev.device_issue_pending = fsl_edma_issue_pending;
f45c431148e1ba drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  597  
f45c431148e1ba drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  598  	fsl_edma->dma_dev.src_addr_widths = FSL_EDMA_BUSWIDTHS;
f45c431148e1ba drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  599  	fsl_edma->dma_dev.dst_addr_widths = FSL_EDMA_BUSWIDTHS;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  600  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  601  	if (drvdata->flags & FSL_EDMA_DRV_BUS_8BYTE) {
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  602  		fsl_edma->dma_dev.src_addr_widths |= BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  603  		fsl_edma->dma_dev.dst_addr_widths |= BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  604  	}
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  605  
f45c431148e1ba drivers/dma/fsl-edma.c      Maxime Ripard     2014-11-17  606  	fsl_edma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  607  	if (drvdata->flags & FSL_EDMA_DRV_DEV_TO_DEV)
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  608  		fsl_edma->dma_dev.directions |= BIT(DMA_DEV_TO_DEV);
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  609  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  610  	fsl_edma->dma_dev.copy_align = drvdata->flags & FSL_EDMA_DRV_ALIGN_64BYTE ?
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  611  					DMAENGINE_ALIGN_64_BYTES :
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  612  					DMAENGINE_ALIGN_32_BYTES;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  613  
e0674853943287 drivers/dma/fsl-edma.c      Joy Zou           2021-10-26  614  	/* Per worst case 'nbytes = 1' take CITER as the max_seg_size */
a79f949a5ce1d4 drivers/dma/fsl-edma-main.c Frank Li          2024-02-07  615  	dma_set_max_seg_size(fsl_edma->dma_dev.dev,
a79f949a5ce1d4 drivers/dma/fsl-edma-main.c Frank Li          2024-02-07  616  			     FIELD_GET(EDMA_TCD_ITER_MASK, EDMA_TCD_ITER_MASK));
e0674853943287 drivers/dma/fsl-edma.c      Joy Zou           2021-10-26  617  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  618  	fsl_edma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  619  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  620  	platform_set_drvdata(pdev, fsl_edma);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  621  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  622  	ret = dma_async_device_register(&fsl_edma->dma_dev);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  623  	if (ret) {
a86144da9d1a43 drivers/dma/fsl-edma.c      Peter Griffin     2016-06-07  624  		dev_err(&pdev->dev,
a86144da9d1a43 drivers/dma/fsl-edma.c      Peter Griffin     2016-06-07  625  			"Can't register Freescale eDMA engine. (%d)\n", ret);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  626  		return ret;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  627  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  628  
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  629  	ret = of_dma_controller_register(np,
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  630  			drvdata->flags & FSL_EDMA_DRV_SPLIT_REG ? fsl_edma3_xlate : fsl_edma_xlate,
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  631  			fsl_edma);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  632  	if (ret) {
a86144da9d1a43 drivers/dma/fsl-edma.c      Peter Griffin     2016-06-07  633  		dev_err(&pdev->dev,
a86144da9d1a43 drivers/dma/fsl-edma.c      Peter Griffin     2016-06-07  634  			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  635  		dma_async_device_unregister(&fsl_edma->dma_dev);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  636  		return ret;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  637  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  638  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  639  	/* enable round robin arbitration */
72f5801a4e2b71 drivers/dma/fsl-edma-main.c Frank Li          2023-08-21  640  	if (!(drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  641  		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  642  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  643  	return 0;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  644  }
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  645  
fa13c3ef3f45bc drivers/dma/fsl-edma-main.c Uwe Kleine-König  2023-09-19  646  static void fsl_edma_remove(struct platform_device *pdev)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  647  {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  648  	struct device_node *np = pdev->dev.of_node;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  649  	struct fsl_edma_engine *fsl_edma = platform_get_drvdata(pdev);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  650  
476c7c809ebeef drivers/dma/fsl-edma.c      Vinod Koul        2016-07-01  651  	fsl_edma_irq_exit(pdev, fsl_edma);
6f93b93b2a1bd5 drivers/dma/fsl-edma.c      Vinod Koul        2016-07-02  652  	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  653  	of_dma_controller_free(np);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  654  	dma_async_device_unregister(&fsl_edma->dma_dev);
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong        2019-06-25  655  	fsl_disable_clocks(fsl_edma, fsl_edma->drvdata->dmamuxs);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  656  }
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu      2014-02-18  657  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  658  static int fsl_edma_suspend_late(struct device *dev)
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  659  {
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  660  	struct fsl_edma_engine *fsl_edma = dev_get_drvdata(dev);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  661  	struct fsl_edma_chan *fsl_chan;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  662  	unsigned long flags;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  663  	int i;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  664  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  665  	for (i = 0; i < fsl_edma->n_chans; i++) {
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  666  		fsl_chan = &fsl_edma->chans[i];
2838a897654c48 drivers/dma/fsl-edma-main.c Xiaolei Wang      2023-11-14  667  		if (fsl_edma->chan_masked & BIT(i))
2838a897654c48 drivers/dma/fsl-edma-main.c Xiaolei Wang      2023-11-14  668  			continue;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  669  		spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  670  		/* Make sure chan is idle or will force disable. */
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  671  		if (unlikely(!fsl_chan->idle)) {
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  672  			dev_warn(dev, "WARN: There is non-idle channel.");
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  673  			fsl_edma_disable_request(fsl_chan);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  674  			fsl_edma_chan_mux(fsl_chan, 0, false);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  675  		}
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  676  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  677  		fsl_chan->pm_state = SUSPENDED;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  678  		spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  679  	}
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  680  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  681  	return 0;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  682  }
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  683  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  684  static int fsl_edma_resume_early(struct device *dev)
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  685  {
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  686  	struct fsl_edma_engine *fsl_edma = dev_get_drvdata(dev);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  687  	struct fsl_edma_chan *fsl_chan;
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  688  	struct edma_regs *regs = &fsl_edma->regs;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  689  	int i;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  690  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  691  	for (i = 0; i < fsl_edma->n_chans; i++) {
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  692  		fsl_chan = &fsl_edma->chans[i];
2838a897654c48 drivers/dma/fsl-edma-main.c Xiaolei Wang      2023-11-14  693  		if (fsl_edma->chan_masked & BIT(i))
2838a897654c48 drivers/dma/fsl-edma-main.c Xiaolei Wang      2023-11-14  694  			continue;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  695  		fsl_chan->pm_state = RUNNING;
7536f8b371adcc drivers/dma/fsl-edma-main.c Frank Li          2023-08-21 @696  		edma_write_tcdreg(fsl_chan, 0, csr);
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li          2024-03-23  697  		if (fsl_chan->srcid != 0)
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li          2024-03-23  698  			fsl_edma_chan_mux(fsl_chan, fsl_chan->srcid, true);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  699  	}
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  700  
3448397a47c08c drivers/dma/fsl-edma-main.c Xiaolei Wang      2023-11-14  701  	if (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
377eaf3b3c4ad7 drivers/dma/fsl-edma.c      Angelo Dureghello 2018-08-19  702  		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  703  
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  704  	return 0;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  705  }
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao          2015-10-30  706  

:::::: The code at line 567 was first introduced by commit
:::::: 537df9ab2d72bb782926a7d263a9f0a101e60b2e dmaengine: fsl-edma: fix spare build warning

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
