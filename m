Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52683D34A6
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440517; cv=none; b=gxao4dlZ0qXVx+iGp1Fc3H3l0I86KfjX4V1k8USXr8ab/ehZ4Z9gu5RElXBBVDzzVXstA26H5+d1qTS7oYgqAbWAH86BwcNbdus/rmuqKMFy1E1FvhGp2donzVUud0C4z3ZNsOBnWcHvjlQd0BlLyECNyPpbUrwsBFGkHHduFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440517; c=relaxed/simple;
	bh=oAr3MHbXSfjSC+jIsEcdEzHV9HVXiJ30Omp6WnjzFk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XuVsHRfnERpMYrgrt1Ha4TQ5Kxt/vBpSRO1FOFCl0IgNDGVFvHLdNaXjLXp37hufNFSsa0FOXrjANZBDb6SIVycO9OQZiE05Si1DycRS5HQ/UfLwYXOhr7d3gwcKCDS76wGvRtX/THxy7QcVs9/hyACDCICIqQj2olYRt7AyLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP5bicgg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP5bicgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440517; x=1805976517;
  h=date:from:to:cc:subject:message-id;
  bh=oAr3MHbXSfjSC+jIsEcdEzHV9HVXiJ30Omp6WnjzFk0=;
  b=UP5bicggImnZ4Cm+GSoNpKlr050ACsvrSIg2sN/VBF0Kfju1mAEC8ulg
   qgKLahub4CyXrYeLeqARuSN2M014s5eSUnlIlVa3oCACAszdVdXiagP2x
   S4/F9RPtwlPw6ern4I4elRT+PIIGtofbN8cJTlLIMdh5YEe396kX9D0+U
   ZNNc53kvKw11350tUpHpPp/3Rdf6gwO7+b4qo1V5M4rLP4yc9IvOU3Cr/
   ipIPm7fPB8S1njH8Qez+/N9AG68PhAFbZEa050+oIsm2jvVxYxrR7MHPv
   jbx9mOfvYVugfTn4d3OFfO9kNLB+SrE+Nodu5maXv1eyvmrXDES2hM6TV
   g==;
X-CSE-ConnectionGUID: y+E56rB+TEqbJUCnwa2vnw==
X-CSE-MsgGUID: KuIg5MQDRiGPnWnY0FM/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79330524"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79330524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:35 -0700
X-CSE-ConnectionGUID: xCWEjU0TQhKqZ4OQrPcbvg==
X-CSE-MsgGUID: ihWz7aHiRRulV/cRNNpzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224925536"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 05:08:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5N2D-000000006mV-0bWV;
	Wed, 25 Mar 2026 12:08:29 +0000
Date: Wed, 25 Mar 2026 20:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-amlogic-spisg.c:314
 aml_spisg_setup_transfer() error: we previously assumed 'exdesc' could be
 null (see line 261)
Message-ID: <202603252043.rBMS8OEW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sunny Luo <sunny.luo@amlogic.com>
CC: Mark Brown <broonie@kernel.org>
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: cef9991e04aed3305c61c392e880f6e01a0c2ea4 spi: Add Amlogic SPISG driver
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: hexagon-randconfig-r072-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252043.rBMS8OEW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603252043.rBMS8OEW-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-amlogic-spisg.c:314 aml_spisg_setup_transfer() error: we previously assumed 'exdesc' could be null (see line 261)

Old smatch warnings:
drivers/spi/spi-amlogic-spisg.c:175 spi_delay_to_sclk() warn: unsigned 'ns' is never less than zero.
drivers/spi/spi-amlogic-spisg.c:652 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'
drivers/spi/spi-amlogic-spisg.c:658 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'
drivers/spi/spi-amlogic-spisg.c:708 aml_spisg_clk_init() warn: passing zero to 'PTR_ERR'

vim +/exdesc +314 drivers/spi/spi-amlogic-spisg.c

cef9991e04aed33 Sunny Luo 2025-07-18  247  
cef9991e04aed33 Sunny Luo 2025-07-18  248  static int aml_spisg_setup_transfer(struct spisg_device *spisg,
cef9991e04aed33 Sunny Luo 2025-07-18  249  				    struct spi_transfer *xfer,
cef9991e04aed33 Sunny Luo 2025-07-18  250  				    struct spisg_descriptor *desc,
cef9991e04aed33 Sunny Luo 2025-07-18  251  				    struct spisg_descriptor_extra *exdesc)
cef9991e04aed33 Sunny Luo 2025-07-18  252  {
cef9991e04aed33 Sunny Luo 2025-07-18  253  	int block_size, blocks;
cef9991e04aed33 Sunny Luo 2025-07-18  254  	struct device *dev = &spisg->pdev->dev;
cef9991e04aed33 Sunny Luo 2025-07-18  255  	struct spisg_sg_link *ccsg;
cef9991e04aed33 Sunny Luo 2025-07-18  256  	int ccsg_len;
cef9991e04aed33 Sunny Luo 2025-07-18  257  	dma_addr_t paddr;
cef9991e04aed33 Sunny Luo 2025-07-18  258  	int ret;
cef9991e04aed33 Sunny Luo 2025-07-18  259  
cef9991e04aed33 Sunny Luo 2025-07-18  260  	memset(desc, 0, sizeof(*desc));
cef9991e04aed33 Sunny Luo 2025-07-18 @261  	if (exdesc)
cef9991e04aed33 Sunny Luo 2025-07-18  262  		memset(exdesc, 0, sizeof(*exdesc));
cef9991e04aed33 Sunny Luo 2025-07-18  263  	aml_spisg_set_speed(spisg, xfer->speed_hz);
cef9991e04aed33 Sunny Luo 2025-07-18  264  	xfer->effective_speed_hz = spisg->effective_speed_hz;
cef9991e04aed33 Sunny Luo 2025-07-18  265  
cef9991e04aed33 Sunny Luo 2025-07-18  266  	desc->cfg_start = spisg->cfg_start;
cef9991e04aed33 Sunny Luo 2025-07-18  267  	desc->cfg_bus = spisg->cfg_bus;
cef9991e04aed33 Sunny Luo 2025-07-18  268  
cef9991e04aed33 Sunny Luo 2025-07-18  269  	block_size = xfer->bits_per_word >> 3;
cef9991e04aed33 Sunny Luo 2025-07-18  270  	blocks = xfer->len / block_size;
cef9991e04aed33 Sunny Luo 2025-07-18  271  
cef9991e04aed33 Sunny Luo 2025-07-18  272  	desc->cfg_start |= FIELD_PREP(CFG_EOC, 0);
cef9991e04aed33 Sunny Luo 2025-07-18  273  	desc->cfg_bus |= FIELD_PREP(CFG_KEEP_SS, !xfer->cs_change);
cef9991e04aed33 Sunny Luo 2025-07-18  274  	desc->cfg_bus |= FIELD_PREP(CFG_NULL_CTL, 0);
cef9991e04aed33 Sunny Luo 2025-07-18  275  
cef9991e04aed33 Sunny Luo 2025-07-18  276  	if (xfer->tx_buf || xfer->tx_dma) {
cef9991e04aed33 Sunny Luo 2025-07-18  277  		desc->cfg_bus |= FIELD_PREP(CFG_LANE, nbits_to_lane[xfer->tx_nbits]);
cef9991e04aed33 Sunny Luo 2025-07-18  278  		desc->cfg_start |= FIELD_PREP(CFG_OP_MODE, SPISG_OP_MODE_WRITE);
cef9991e04aed33 Sunny Luo 2025-07-18  279  	}
cef9991e04aed33 Sunny Luo 2025-07-18  280  	if (xfer->rx_buf || xfer->rx_dma) {
cef9991e04aed33 Sunny Luo 2025-07-18  281  		desc->cfg_bus |= FIELD_PREP(CFG_LANE, nbits_to_lane[xfer->rx_nbits]);
cef9991e04aed33 Sunny Luo 2025-07-18  282  		desc->cfg_start |= FIELD_PREP(CFG_OP_MODE, SPISG_OP_MODE_READ);
cef9991e04aed33 Sunny Luo 2025-07-18  283  	}
cef9991e04aed33 Sunny Luo 2025-07-18  284  
cef9991e04aed33 Sunny Luo 2025-07-18  285  	if (FIELD_GET(CFG_OP_MODE, desc->cfg_start) == SPISG_OP_MODE_READ_STS) {
cef9991e04aed33 Sunny Luo 2025-07-18  286  		desc->cfg_start |= FIELD_PREP(CFG_BLOCK_SIZE, blocks) |
cef9991e04aed33 Sunny Luo 2025-07-18  287  				   FIELD_PREP(CFG_BLOCK_NUM, 1);
cef9991e04aed33 Sunny Luo 2025-07-18  288  	} else {
cef9991e04aed33 Sunny Luo 2025-07-18  289  		blocks = min_t(int, blocks, SPISG_BLOCK_MAX);
cef9991e04aed33 Sunny Luo 2025-07-18  290  		desc->cfg_start |= FIELD_PREP(CFG_BLOCK_SIZE, block_size & 0x7) |
cef9991e04aed33 Sunny Luo 2025-07-18  291  				   FIELD_PREP(CFG_BLOCK_NUM, blocks);
cef9991e04aed33 Sunny Luo 2025-07-18  292  	}
cef9991e04aed33 Sunny Luo 2025-07-18  293  
cef9991e04aed33 Sunny Luo 2025-07-18  294  	if (xfer->tx_sg.nents && xfer->tx_sg.sgl) {
cef9991e04aed33 Sunny Luo 2025-07-18  295  		ccsg_len = xfer->tx_sg.nents * sizeof(struct spisg_sg_link);
cef9991e04aed33 Sunny Luo 2025-07-18  296  		ccsg = kzalloc(ccsg_len, GFP_KERNEL | GFP_DMA);
cef9991e04aed33 Sunny Luo 2025-07-18  297  		if (!ccsg) {
cef9991e04aed33 Sunny Luo 2025-07-18  298  			dev_err(dev, "alloc tx_ccsg failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  299  			return -ENOMEM;
cef9991e04aed33 Sunny Luo 2025-07-18  300  		}
cef9991e04aed33 Sunny Luo 2025-07-18  301  
cef9991e04aed33 Sunny Luo 2025-07-18  302  		aml_spisg_sg_xlate(&xfer->tx_sg, ccsg);
cef9991e04aed33 Sunny Luo 2025-07-18  303  		paddr = dma_map_single(dev, (void *)ccsg,
cef9991e04aed33 Sunny Luo 2025-07-18  304  				       ccsg_len, DMA_TO_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  305  		ret = dma_mapping_error(dev, paddr);
cef9991e04aed33 Sunny Luo 2025-07-18  306  		if (ret) {
cef9991e04aed33 Sunny Luo 2025-07-18  307  			kfree(ccsg);
cef9991e04aed33 Sunny Luo 2025-07-18  308  			dev_err(dev, "tx ccsg map failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  309  			return ret;
cef9991e04aed33 Sunny Luo 2025-07-18  310  		}
cef9991e04aed33 Sunny Luo 2025-07-18  311  
cef9991e04aed33 Sunny Luo 2025-07-18  312  		desc->tx_paddr = paddr;
cef9991e04aed33 Sunny Luo 2025-07-18  313  		desc->cfg_start |= FIELD_PREP(CFG_TXD_MODE, SPISG_DATA_MODE_SG);
cef9991e04aed33 Sunny Luo 2025-07-18 @314  		exdesc->tx_ccsg = ccsg;
cef9991e04aed33 Sunny Luo 2025-07-18  315  		exdesc->tx_ccsg_len = ccsg_len;
cef9991e04aed33 Sunny Luo 2025-07-18  316  		dma_sync_sgtable_for_device(spisg->controller->cur_tx_dma_dev,
cef9991e04aed33 Sunny Luo 2025-07-18  317  					    &xfer->tx_sg, DMA_TO_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  318  	} else if (xfer->tx_buf || xfer->tx_dma) {
cef9991e04aed33 Sunny Luo 2025-07-18  319  		paddr = xfer->tx_dma;
cef9991e04aed33 Sunny Luo 2025-07-18  320  		if (!paddr) {
cef9991e04aed33 Sunny Luo 2025-07-18  321  			paddr = dma_map_single(dev, (void *)xfer->tx_buf,
cef9991e04aed33 Sunny Luo 2025-07-18  322  					       xfer->len, DMA_TO_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  323  			ret = dma_mapping_error(dev, paddr);
cef9991e04aed33 Sunny Luo 2025-07-18  324  			if (ret) {
cef9991e04aed33 Sunny Luo 2025-07-18  325  				dev_err(dev, "tx buf map failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  326  				return ret;
cef9991e04aed33 Sunny Luo 2025-07-18  327  			}
cef9991e04aed33 Sunny Luo 2025-07-18  328  		}
cef9991e04aed33 Sunny Luo 2025-07-18  329  		desc->tx_paddr = paddr;
cef9991e04aed33 Sunny Luo 2025-07-18  330  		desc->cfg_start |= FIELD_PREP(CFG_TXD_MODE, SPISG_DATA_MODE_MEM);
cef9991e04aed33 Sunny Luo 2025-07-18  331  	}
cef9991e04aed33 Sunny Luo 2025-07-18  332  
cef9991e04aed33 Sunny Luo 2025-07-18  333  	if (xfer->rx_sg.nents && xfer->rx_sg.sgl) {
cef9991e04aed33 Sunny Luo 2025-07-18  334  		ccsg_len = xfer->rx_sg.nents * sizeof(struct spisg_sg_link);
cef9991e04aed33 Sunny Luo 2025-07-18  335  		ccsg = kzalloc(ccsg_len, GFP_KERNEL | GFP_DMA);
cef9991e04aed33 Sunny Luo 2025-07-18  336  		if (!ccsg) {
cef9991e04aed33 Sunny Luo 2025-07-18  337  			dev_err(dev, "alloc rx_ccsg failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  338  			return -ENOMEM;
cef9991e04aed33 Sunny Luo 2025-07-18  339  		}
cef9991e04aed33 Sunny Luo 2025-07-18  340  
cef9991e04aed33 Sunny Luo 2025-07-18  341  		aml_spisg_sg_xlate(&xfer->rx_sg, ccsg);
cef9991e04aed33 Sunny Luo 2025-07-18  342  		paddr = dma_map_single(dev, (void *)ccsg,
cef9991e04aed33 Sunny Luo 2025-07-18  343  				       ccsg_len, DMA_TO_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  344  		ret = dma_mapping_error(dev, paddr);
cef9991e04aed33 Sunny Luo 2025-07-18  345  		if (ret) {
cef9991e04aed33 Sunny Luo 2025-07-18  346  			kfree(ccsg);
cef9991e04aed33 Sunny Luo 2025-07-18  347  			dev_err(dev, "rx ccsg map failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  348  			return ret;
cef9991e04aed33 Sunny Luo 2025-07-18  349  		}
cef9991e04aed33 Sunny Luo 2025-07-18  350  
cef9991e04aed33 Sunny Luo 2025-07-18  351  		desc->rx_paddr = paddr;
cef9991e04aed33 Sunny Luo 2025-07-18  352  		desc->cfg_start |= FIELD_PREP(CFG_RXD_MODE, SPISG_DATA_MODE_SG);
cef9991e04aed33 Sunny Luo 2025-07-18  353  		exdesc->rx_ccsg = ccsg;
cef9991e04aed33 Sunny Luo 2025-07-18  354  		exdesc->rx_ccsg_len = ccsg_len;
cef9991e04aed33 Sunny Luo 2025-07-18  355  		dma_sync_sgtable_for_device(spisg->controller->cur_rx_dma_dev,
cef9991e04aed33 Sunny Luo 2025-07-18  356  					    &xfer->rx_sg, DMA_FROM_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  357  	} else if (xfer->rx_buf || xfer->rx_dma) {
cef9991e04aed33 Sunny Luo 2025-07-18  358  		paddr = xfer->rx_dma;
cef9991e04aed33 Sunny Luo 2025-07-18  359  		if (!paddr) {
cef9991e04aed33 Sunny Luo 2025-07-18  360  			paddr = dma_map_single(dev, xfer->rx_buf,
cef9991e04aed33 Sunny Luo 2025-07-18  361  					       xfer->len, DMA_FROM_DEVICE);
cef9991e04aed33 Sunny Luo 2025-07-18  362  			ret = dma_mapping_error(dev, paddr);
cef9991e04aed33 Sunny Luo 2025-07-18  363  			if (ret) {
cef9991e04aed33 Sunny Luo 2025-07-18  364  				dev_err(dev, "rx buf map failed\n");
cef9991e04aed33 Sunny Luo 2025-07-18  365  				return ret;
cef9991e04aed33 Sunny Luo 2025-07-18  366  			}
cef9991e04aed33 Sunny Luo 2025-07-18  367  		}
cef9991e04aed33 Sunny Luo 2025-07-18  368  
cef9991e04aed33 Sunny Luo 2025-07-18  369  		desc->rx_paddr = paddr;
cef9991e04aed33 Sunny Luo 2025-07-18  370  		desc->cfg_start |= FIELD_PREP(CFG_RXD_MODE, SPISG_DATA_MODE_MEM);
cef9991e04aed33 Sunny Luo 2025-07-18  371  	}
cef9991e04aed33 Sunny Luo 2025-07-18  372  
cef9991e04aed33 Sunny Luo 2025-07-18  373  	return 0;
cef9991e04aed33 Sunny Luo 2025-07-18  374  }
cef9991e04aed33 Sunny Luo 2025-07-18  375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
