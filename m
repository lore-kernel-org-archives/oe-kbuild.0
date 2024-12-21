Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938EAEDE
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734743443; cv=none; b=p0DJlwc073PnbS0nvbnLlK9h7nzqwtSWfKrAS3a/Plyqh/NnAt44htn96Ho1r6o5vOLfLE6qOyXnm17TfnHEjlo0QAeCFMMOXcG+6xB/jArcK2DXxYCOxGQKmy2YZhKJvYTRpes4BaxTvEFwfp+OuEV6q6VvPBhMhEcNw54oO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734743443; c=relaxed/simple;
	bh=duO2DcIm8tiz8mtz/667ETZd0ZgVL9e2oCwQuCRhJME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmE+u4Osji95pVQvdnqesBsRCN9WydGTvoMXo9v7O2gub6IvftfZJOoFr42IR8kShIRu7AXHJGhYP9lghYvQQ+Vk/DJJI9W054wPKApD0rNMGTr3cSbe616ikUDOM2QC4fdae408zIWrizq+lvID3oRrn2YocfkfeIe74quTFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ic/rG7R4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ic/rG7R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734743442; x=1766279442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=duO2DcIm8tiz8mtz/667ETZd0ZgVL9e2oCwQuCRhJME=;
  b=ic/rG7R4qP4VwUupyE/UjwPzXBnPtFdEM/J/Uz8YwBtoHrBTnbbTEDSy
   GnhVrVeVe6UbBUEucJbWGy1lm+OzQmWZElra43UPUI+MEEEyWGrHWcMmA
   d6ORTskaA8g3/LLBXt4IAcpmf5nq5yZNulwziW62fiDngQm78OD8NrE8g
   YMbXzDrfju/zePpC2ibuRfURBdr3p8P5yS4zdM6ueBY4x4k8TEAk4CYyR
   K4QdbXX0BaO3m5zOtqu3HFVY2Y2okvZu5cDRgVeRniUyd6zSYQqWB+Pp6
   24zRRdTX9iRJUWPUtCXCRgE07OkvEcNPW8mMAH1kbRx54vFb2QCNSgYdg
   w==;
X-CSE-ConnectionGUID: GHuL4nYlRJmhNIkty3ebsw==
X-CSE-MsgGUID: liv1iyxJR8+TnHBXxETVMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46679171"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="46679171"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:10:38 -0800
X-CSE-ConnectionGUID: lyPWVLrVRj62XYp8vks9AQ==
X-CSE-MsgGUID: GXowdOCjScKXXeANC7d1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103726747"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2024 17:10:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOo0n-0001p9-2P;
	Sat, 21 Dec 2024 01:10:33 +0000
Date: Sat, 21 Dec 2024 09:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/pl330.c:2758 pl330_prep_dma_cyclic() error:
 uninitialized symbol 'dst'.
Message-ID: <202412210939.Tu0owCiy-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: a22fe1d6dec7e98535b97249fdc95c2be79120bb dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r072-20241219 (https://download.01.org/0day-ci/archive/20241221/202412210939.Tu0owCiy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412210939.Tu0owCiy-lkp@intel.com/

smatch warnings:
drivers/dma/pl330.c:2758 pl330_prep_dma_cyclic() error: uninitialized symbol 'dst'.
drivers/dma/pl330.c:2758 pl330_prep_dma_cyclic() error: uninitialized symbol 'src'.

vim +/dst +2758 drivers/dma/pl330.c

b3040e40675ec2c Jassi Brar         2010-05-23  2684  
42bc9cf45939c26 Boojin Kim         2011-09-02  2685  static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
42bc9cf45939c26 Boojin Kim         2011-09-02  2686  		struct dma_chan *chan, dma_addr_t dma_addr, size_t len,
185ecb5f4fd4391 Alexandre Bounine  2012-03-08  2687  		size_t period_len, enum dma_transfer_direction direction,
31c1e5a1350ae8d Laurent Pinchart   2014-08-01  2688  		unsigned long flags)
42bc9cf45939c26 Boojin Kim         2011-09-02  2689  {
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2690  	struct dma_pl330_desc *desc = NULL, *first = NULL;
42bc9cf45939c26 Boojin Kim         2011-09-02  2691  	struct dma_pl330_chan *pch = to_pchan(chan);
f6f2421c0a1cb6c Lars-Peter Clausen 2014-07-06  2692  	struct pl330_dmac *pl330 = pch->dmac;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2693  	unsigned int i;
42bc9cf45939c26 Boojin Kim         2011-09-02  2694  	dma_addr_t dst;
42bc9cf45939c26 Boojin Kim         2011-09-02  2695  	dma_addr_t src;
42bc9cf45939c26 Boojin Kim         2011-09-02  2696  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2697  	if (len % period_len != 0)
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2698  		return NULL;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2699  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2700  	if (!is_slave_direction(direction)) {
f6f2421c0a1cb6c Lars-Peter Clausen 2014-07-06  2701  		dev_err(pch->dmac->ddma.dev, "%s:%d Invalid dma direction\n",
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2702  		__func__, __LINE__);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2703  		return NULL;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2704  	}
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2705  
445897cbc9d3e2b Vinod Koul         2018-10-25  2706  	pl330_config_write(chan, &pch->slave_config, direction);
445897cbc9d3e2b Vinod Koul         2018-10-25  2707  
4d6d74e22096543 Robin Murphy       2017-05-19  2708  	if (!pl330_prep_slave_fifo(pch, direction))
4d6d74e22096543 Robin Murphy       2017-05-19  2709  		return NULL;
4d6d74e22096543 Robin Murphy       2017-05-19  2710  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2711  	for (i = 0; i < len / period_len; i++) {
42bc9cf45939c26 Boojin Kim         2011-09-02  2712  		desc = pl330_get_desc(pch);
42bc9cf45939c26 Boojin Kim         2011-09-02  2713  		if (!desc) {
4ad5dd2d7876d79 Bumyong Lee        2021-05-07  2714  			unsigned long iflags;
4ad5dd2d7876d79 Bumyong Lee        2021-05-07  2715  
f6f2421c0a1cb6c Lars-Peter Clausen 2014-07-06  2716  			dev_err(pch->dmac->ddma.dev, "%s:%d Unable to fetch desc\n",
42bc9cf45939c26 Boojin Kim         2011-09-02  2717  				__func__, __LINE__);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2718  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2719  			if (!first)
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2720  				return NULL;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2721  
4ad5dd2d7876d79 Bumyong Lee        2021-05-07  2722  			spin_lock_irqsave(&pl330->pool_lock, iflags);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2723  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2724  			while (!list_empty(&first->node)) {
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2725  				desc = list_entry(first->node.next,
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2726  						struct dma_pl330_desc, node);
f6f2421c0a1cb6c Lars-Peter Clausen 2014-07-06  2727  				list_move_tail(&desc->node, &pl330->desc_pool);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2728  			}
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2729  
f6f2421c0a1cb6c Lars-Peter Clausen 2014-07-06  2730  			list_move_tail(&first->node, &pl330->desc_pool);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2731  
4ad5dd2d7876d79 Bumyong Lee        2021-05-07  2732  			spin_unlock_irqrestore(&pl330->pool_lock, iflags);
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2733  
42bc9cf45939c26 Boojin Kim         2011-09-02  2734  			return NULL;
42bc9cf45939c26 Boojin Kim         2011-09-02  2735  		}
42bc9cf45939c26 Boojin Kim         2011-09-02  2736  
42bc9cf45939c26 Boojin Kim         2011-09-02  2737  		switch (direction) {
db8196df4bb6f11 Vinod Koul         2011-10-13  2738  		case DMA_MEM_TO_DEV:
42bc9cf45939c26 Boojin Kim         2011-09-02  2739  			desc->rqcfg.src_inc = 1;
42bc9cf45939c26 Boojin Kim         2011-09-02  2740  			desc->rqcfg.dst_inc = 0;
42bc9cf45939c26 Boojin Kim         2011-09-02  2741  			src = dma_addr;
4d6d74e22096543 Robin Murphy       2017-05-19  2742  			dst = pch->fifo_dma;
42bc9cf45939c26 Boojin Kim         2011-09-02  2743  			break;
db8196df4bb6f11 Vinod Koul         2011-10-13  2744  		case DMA_DEV_TO_MEM:
42bc9cf45939c26 Boojin Kim         2011-09-02  2745  			desc->rqcfg.src_inc = 0;
42bc9cf45939c26 Boojin Kim         2011-09-02  2746  			desc->rqcfg.dst_inc = 1;
4d6d74e22096543 Robin Murphy       2017-05-19  2747  			src = pch->fifo_dma;
42bc9cf45939c26 Boojin Kim         2011-09-02  2748  			dst = dma_addr;
42bc9cf45939c26 Boojin Kim         2011-09-02  2749  			break;
42bc9cf45939c26 Boojin Kim         2011-09-02  2750  		default:
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2751  			break;
42bc9cf45939c26 Boojin Kim         2011-09-02  2752  		}
42bc9cf45939c26 Boojin Kim         2011-09-02  2753  
9dc5a315fe515e9 Lars-Peter Clausen 2014-07-06  2754  		desc->rqtype = direction;
42bc9cf45939c26 Boojin Kim         2011-09-02  2755  		desc->rqcfg.brst_size = pch->burst_sz;
1d48745b192a7a4 Frank Mori Hess    2018-04-18  2756  		desc->rqcfg.brst_len = pch->burst_len;
aee4d1fac887252 Robert Baldyga     2015-02-11  2757  		desc->bytes_requested = period_len;
fc51446021f42ac Lars-Peter Clausen 2013-07-23 @2758  		fill_px(&desc->px, dst, src, period_len);
42bc9cf45939c26 Boojin Kim         2011-09-02  2759  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2760  		if (!first)
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2761  			first = desc;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2762  		else
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2763  			list_add_tail(&desc->node, &first->node);
42bc9cf45939c26 Boojin Kim         2011-09-02  2764  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2765  		dma_addr += period_len;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2766  	}
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2767  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2768  	if (!desc)
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2769  		return NULL;
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2770  
fc51446021f42ac Lars-Peter Clausen 2013-07-23  2771  	pch->cyclic = true;
42bc9cf45939c26 Boojin Kim         2011-09-02  2772  
42bc9cf45939c26 Boojin Kim         2011-09-02  2773  	return &desc->txd;
42bc9cf45939c26 Boojin Kim         2011-09-02  2774  }
42bc9cf45939c26 Boojin Kim         2011-09-02  2775  

:::::: The code at line 2758 was first introduced by commit
:::::: fc51446021f42aca8906e701fc2292965aafcb15 dma: pl330: Fix cyclic transfers

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
