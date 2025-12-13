Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C423EAB2
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765651458; cv=none; b=cpIF+JnRETbT+REI8VXpUZxGt8EXAZ9sYB35g3MKcgXpIGOe+UmGOg/cdJb1ugK+phGE1LdC1fnOpOt1jBcHukuSM8j1oEt9TE/rfUhx5+P/KxmBY1R7nvf1/crYJIPegVMndU7bVSei78vMGZefjkmg9l66GpAjjkpV2j2YGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765651458; c=relaxed/simple;
	bh=dkt2Xm5eLJ/0WYbToiMcWwH530YjBabprcdwbrIuX9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2cIAsFm1t+Py3GnIeqfCIezK6Q/9i2D5myAIMcy5rDSTlrXnOVO8OPcThM7WPnflKGS/zmQzlKwxXm1NBQicN9mYhyDLlFFAXM3PkgMEkSttJZAQ4CMAtm9rM7LwwjHoMQsSiEK0zNL2Z5aoqe+0jdaCzYSBGNjaf7puldznOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuL19gEu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuL19gEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765651457; x=1797187457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkt2Xm5eLJ/0WYbToiMcWwH530YjBabprcdwbrIuX9c=;
  b=SuL19gEu7P3F4V7bcgGXBOSv1M3abYg4G2NTCUj5YNz2jl8Gz7MUEy1B
   IMDaGn7uB6HI/QbPtc/xG6AxAbVFWVcKtDDgVLr/W49pSLe1A7WTIN/hf
   Ky3oNERZ2Jvm4alBLBtYUGKdMSKfJC3wcmTwOIIal3orRDfJPX1BKc70F
   akUH2C85Uv7jLA1SPc9b/S8O6+BIw1CSoR+BHJqtEK5WFZriv7ku6votZ
   yFXVveJT0pFP86ldnd0FZz4cCSM6yeWsxgJBUR1ejy4TUfiIEqaAZAZur
   ZIyy27vT7eT7sTLiz6tVEogTYEC597M4gxJ9dHyWAT4/vy+BhGdQjjbNg
   Q==;
X-CSE-ConnectionGUID: hUP4XTuJQsq+eY2yRe6kGQ==
X-CSE-MsgGUID: ldck14SkTGGwJNdj0papOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77933505"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="77933505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:44:14 -0800
X-CSE-ConnectionGUID: scA8PGuZQluSONl58SGb9g==
X-CSE-MsgGUID: qndoTA1ARGyxm6E1oHl6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202266409"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 10:44:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUbB-0000000084R-3njh;
	Sat, 13 Dec 2025 18:44:09 +0000
Date: Sun, 14 Dec 2025 02:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/xilinx/xilinx_dma.c:2251
 xilinx_dma_prep_peripheral_dma_vec() error: uninitialized symbol 'segment'.
Message-ID: <202512140215.txgmFWED-lkp@intel.com>
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
TO: Folker Schwesinger <dev@folker-schwesinger.de>
CC: Vinod Koul <vkoul@kernel.org>
CC: Suraj Gupta <suraj.gupta2@amd.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 38433a6fdfb75d12a90ffff262705e1ecfe88556 dmaengine: xilinx_dma: Support descriptor setup from dma_vecs
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140215.txgmFWED-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140215.txgmFWED-lkp@intel.com/

New smatch warnings:
drivers/dma/xilinx/xilinx_dma.c:2251 xilinx_dma_prep_peripheral_dma_vec() error: uninitialized symbol 'segment'.

Old smatch warnings:
drivers/dma/xilinx/xilinx_dma.c:3061 xilinx_dma_chan_probe() warn: 'chan->irq' from request_irq() not released on lines: 3058.

vim +/segment +2251 drivers/dma/xilinx/xilinx_dma.c

07b0e7d49cbcad drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  2174  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2175  /**
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2176   * xilinx_dma_prep_peripheral_dma_vec - prepare descriptors for a DMA_SLAVE
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2177   *	transaction from DMA vectors
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2178   * @dchan: DMA channel
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2179   * @vecs: Array of DMA vectors that should be transferred
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2180   * @nb: number of entries in @vecs
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2181   * @direction: DMA direction
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2182   * @flags: transfer ack flags
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2183   *
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2184   * Return: Async transaction descriptor on success and NULL on failure
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2185   */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2186  static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2187  	struct dma_chan *dchan, const struct dma_vec *vecs, size_t nb,
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2188  	enum dma_transfer_direction direction, unsigned long flags)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2189  {
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2190  	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2191  	struct xilinx_dma_tx_descriptor *desc;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2192  	struct xilinx_axidma_tx_segment *segment, *head, *prev = NULL;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2193  	size_t copy;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2194  	size_t sg_used;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2195  	unsigned int i;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2196  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2197  	if (!is_slave_direction(direction) || direction != chan->direction)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2198  		return NULL;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2199  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2200  	desc = xilinx_dma_alloc_tx_descriptor(chan);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2201  	if (!desc)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2202  		return NULL;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2203  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2204  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2205  	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2206  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2207  	/* Build transactions using information from DMA vectors */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2208  	for (i = 0; i < nb; i++) {
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2209  		sg_used = 0;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2210  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2211  		/* Loop until the entire dma_vec entry is used */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2212  		while (sg_used < vecs[i].len) {
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2213  			struct xilinx_axidma_desc_hw *hw;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2214  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2215  			/* Get a free segment */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2216  			segment = xilinx_axidma_alloc_tx_segment(chan);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2217  			if (!segment)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2218  				goto error;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2219  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2220  			/*
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2221  			 * Calculate the maximum number of bytes to transfer,
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2222  			 * making sure it is less than the hw limit
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2223  			 */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2224  			copy = xilinx_dma_calc_copysize(chan, vecs[i].len,
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2225  					sg_used);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2226  			hw = &segment->hw;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2227  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2228  			/* Fill in the descriptor */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2229  			xilinx_axidma_buf(chan, hw, vecs[i].addr, sg_used, 0);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2230  			hw->control = copy;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2231  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2232  			if (prev)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2233  				prev->hw.next_desc = segment->phys;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2234  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2235  			prev = segment;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2236  			sg_used += copy;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2237  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2238  			/*
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2239  			 * Insert the segment into the descriptor segments
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2240  			 * list.
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2241  			 */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2242  			list_add_tail(&segment->node, &desc->segments);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2243  		}
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2244  	}
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2245  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2246  	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2247  	desc->async_tx.phys = head->phys;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2248  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2249  	/* For the last DMA_MEM_TO_DEV transfer, set EOP */
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2250  	if (chan->direction == DMA_MEM_TO_DEV) {
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26 @2251  		segment->hw.control |= XILINX_DMA_BD_SOP;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2252  		segment = list_last_entry(&desc->segments,
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2253  					  struct xilinx_axidma_tx_segment,
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2254  					  node);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2255  		segment->hw.control |= XILINX_DMA_BD_EOP;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2256  	}
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2257  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2258  	if (chan->xdev->has_axistream_connected)
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2259  		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2260  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2261  	return &desc->async_tx;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2262  
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2263  error:
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2264  	xilinx_dma_free_tx_descriptor(chan, desc);
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2265  	return NULL;
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2266  }
38433a6fdfb75d drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-08-26  2267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
