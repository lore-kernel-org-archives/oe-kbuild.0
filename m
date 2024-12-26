Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1A19AD89
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735204378; cv=none; b=V76/5ekmxhfRVBBwYSkSPqgjJgMeBUgE+zaD5YD5Hg4lJvLGWixItttuyzy2Lxo4yerHRdOenLb8BVQtdcdu+FJD0bFdyi1IxIZEGU2f7v+E9JJtBwlLAbKwbGY2kiUxNLZK+Q7H8abnrr6BRmmA4mw3d+xM3IVx1zhvl615Mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735204378; c=relaxed/simple;
	bh=XNzUuCw23SRFBjG5iFMQDU4elr6AjTyrlcEO5IWTDXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfbw7z5ThrJtw53wzSm8cLII1d8cX/2w+Wh8CSHoT3aGHk6sAnorAtUfrIWeMAs/wZfps3WNSJb33roMHmhD/9aqERWwOE1CMUWZwu9+f+WOkhJeMNPqct8GRHgasO4aHw59xKpmZxkH+Z5DjHK/laB384JE9V03E+UPKhoYHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOZYrdEL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOZYrdEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735204376; x=1766740376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNzUuCw23SRFBjG5iFMQDU4elr6AjTyrlcEO5IWTDXo=;
  b=gOZYrdELQ7ysxwgBrecPzwdgMCgBdTp1j7Z+F0cLWjWeZGxd+12s2gti
   FD3Hmam3cuw/UiNe8olm9WAL9MWTXB0vVxe8/C4vUrh3Tj0uGK8AiLMcy
   +CurY8CyIHUb562Kyt93TEohS6Ui54TAOOrLM5NFsXi6hJICeDUrAieFd
   MLiQLxCsEIsw4ZZKicA7UPIKUFCQDer0zoAOsp6kVeoGOXVK3ZF1WLVcZ
   ZeUz3zd9vhwC1Mq/SY2IODMfc8lC/LBgIAYl/Jxiwds7jB6qjTIR1aZbf
   VCNm+jULE2k7RKMWgy9qQp1pwjr0ZcosXdVd90EKOK5kVjGX22bjDhjtf
   A==;
X-CSE-ConnectionGUID: 2cowTjBzSS6WPNE92UACMg==
X-CSE-MsgGUID: KHL6Z6SxSC2AK9T9XOQ2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46997737"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="46997737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 01:12:53 -0800
X-CSE-ConnectionGUID: jghGTcExQzCGZqrvbMzS+w==
X-CSE-MsgGUID: IkmmtRz2Rx+B481cEcTFbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99742462"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Dec 2024 01:12:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQjvF-0002Qr-2O;
	Thu, 26 Dec 2024 09:12:49 +0000
Date: Thu, 26 Dec 2024 17:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:2519 mtk_tx_alloc()
 error: uninitialized symbol 'txd'.
Message-ID: <202412261743.unBO9pAU-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: c57e558194430d10d5e5f4acd8a8655b68dade13 net: ethernet: mtk_eth_soc: handle dma buffer size soc specific
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r072-20241225 (https://download.01.org/0day-ci/archive/20241226/202412261743.unBO9pAU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412261743.unBO9pAU-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:2519 mtk_tx_alloc() error: uninitialized symbol 'txd'.

vim +/txd +2519 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08  2453  
656e705243fd0c John Crispin     2016-03-08  2454  static int mtk_tx_alloc(struct mtk_eth *eth)
656e705243fd0c John Crispin     2016-03-08  2455  {
0e05744beda4ae Lorenzo Bianconi 2022-05-20  2456  	const struct mtk_soc_data *soc = eth->soc;
656e705243fd0c John Crispin     2016-03-08  2457  	struct mtk_tx_ring *ring = &eth->tx_ring;
ecb51fa37ee22f Lorenzo Bianconi 2024-05-08  2458  	int i, sz = soc->tx.desc_size;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2459  	struct mtk_tx_dma_v2 *txd;
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2460  	int ring_size;
f63959c7eec315 Felix Fietkau    2022-11-16  2461  	u32 ofs, val;
656e705243fd0c John Crispin     2016-03-08  2462  
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2463  	if (MTK_HAS_CAPS(soc->caps, MTK_QDMA))
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2464  		ring_size = MTK_QDMA_RING_SIZE;
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2465  	else
c57e558194430d Frank Wunderlich 2024-06-03  2466  		ring_size = soc->tx.dma_size;
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2467  
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2468  	ring->buf = kcalloc(ring_size, sizeof(*ring->buf),
656e705243fd0c John Crispin     2016-03-08  2469  			       GFP_KERNEL);
656e705243fd0c John Crispin     2016-03-08  2470  	if (!ring->buf)
656e705243fd0c John Crispin     2016-03-08  2471  		goto no_tx_mem;
656e705243fd0c John Crispin     2016-03-08  2472  
ebb1e4f9cf38da Daniel Golle     2023-08-22  2473  	if (MTK_HAS_CAPS(soc->caps, MTK_SRAM)) {
c57e558194430d Frank Wunderlich 2024-06-03  2474  		ring->dma = eth->sram_base + soc->tx.fq_dma_size * sz;
c57e558194430d Frank Wunderlich 2024-06-03  2475  		ring->phys = eth->phy_scratch_ring + soc->tx.fq_dma_size * (dma_addr_t)sz;
ebb1e4f9cf38da Daniel Golle     2023-08-22  2476  	} else {
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2477  		ring->dma = dma_alloc_coherent(eth->dma_dev, ring_size * sz,
62dfb4cc444649 Lorenzo Bianconi 2022-05-20  2478  					       &ring->phys, GFP_KERNEL);
ebb1e4f9cf38da Daniel Golle     2023-08-22  2479  	}
ebb1e4f9cf38da Daniel Golle     2023-08-22  2480  
656e705243fd0c John Crispin     2016-03-08  2481  	if (!ring->dma)
656e705243fd0c John Crispin     2016-03-08  2482  		goto no_tx_mem;
656e705243fd0c John Crispin     2016-03-08  2483  
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2484  	for (i = 0; i < ring_size; i++) {
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2485  		int next = (i + 1) % ring_size;
656e705243fd0c John Crispin     2016-03-08  2486  		u32 next_ptr = ring->phys + next * sz;
656e705243fd0c John Crispin     2016-03-08  2487  
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20  2488  		txd = ring->dma + i * sz;
0e05744beda4ae Lorenzo Bianconi 2022-05-20  2489  		txd->txd2 = next_ptr;
0e05744beda4ae Lorenzo Bianconi 2022-05-20  2490  		txd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
0e05744beda4ae Lorenzo Bianconi 2022-05-20  2491  		txd->txd4 = 0;
a008e2a84e6b2b Lorenzo Bianconi 2023-07-25  2492  		if (mtk_is_netsys_v2_or_greater(eth)) {
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2493  			txd->txd5 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2494  			txd->txd6 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2495  			txd->txd7 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2496  			txd->txd8 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2497  		}
656e705243fd0c John Crispin     2016-03-08  2498  	}
656e705243fd0c John Crispin     2016-03-08  2499  
296c9120752bab Stefan Roese     2019-08-16  2500  	/* On MT7688 (PDMA only) this driver uses the ring->dma structs
296c9120752bab Stefan Roese     2019-08-16  2501  	 * only as the framework. The real HW descriptors are the PDMA
296c9120752bab Stefan Roese     2019-08-16  2502  	 * descriptors in ring->dma_pdma.
296c9120752bab Stefan Roese     2019-08-16  2503  	 */
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2504  	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2505  		ring->dma_pdma = dma_alloc_coherent(eth->dma_dev, ring_size * sz,
62dfb4cc444649 Lorenzo Bianconi 2022-05-20  2506  						    &ring->phys_pdma, GFP_KERNEL);
296c9120752bab Stefan Roese     2019-08-16  2507  		if (!ring->dma_pdma)
296c9120752bab Stefan Roese     2019-08-16  2508  			goto no_tx_mem;
296c9120752bab Stefan Roese     2019-08-16  2509  
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2510  		for (i = 0; i < ring_size; i++) {
296c9120752bab Stefan Roese     2019-08-16  2511  			ring->dma_pdma[i].txd2 = TX_DMA_DESP2_DEF;
296c9120752bab Stefan Roese     2019-08-16  2512  			ring->dma_pdma[i].txd4 = 0;
296c9120752bab Stefan Roese     2019-08-16  2513  		}
296c9120752bab Stefan Roese     2019-08-16  2514  	}
296c9120752bab Stefan Roese     2019-08-16  2515  
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2516  	ring->dma_size = ring_size;
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2517  	atomic_set(&ring->free_count, ring_size - 2);
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20  2518  	ring->next_free = ring->dma;
0e05744beda4ae Lorenzo Bianconi 2022-05-20 @2519  	ring->last_free = (void *)txd;
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2520  	ring->last_free_ptr = (u32)(ring->phys + ((ring_size - 1) * sz));
04698cccb1de54 John Crispin     2016-06-10  2521  	ring->thresh = MAX_SKB_FRAGS;
656e705243fd0c John Crispin     2016-03-08  2522  
656e705243fd0c John Crispin     2016-03-08  2523  	/* make sure that all changes to the dma ring are flushed before we
656e705243fd0c John Crispin     2016-03-08  2524  	 * continue
656e705243fd0c John Crispin     2016-03-08  2525  	 */
656e705243fd0c John Crispin     2016-03-08  2526  	wmb();
656e705243fd0c John Crispin     2016-03-08  2527  
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2528  	if (MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2529  		mtk_w32(eth, ring->phys, soc->reg_map->qdma.ctx_ptr);
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2530  		mtk_w32(eth, ring->phys, soc->reg_map->qdma.dtx_ptr);
656e705243fd0c John Crispin     2016-03-08  2531  		mtk_w32(eth,
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2532  			ring->phys + ((ring_size - 1) * sz),
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2533  			soc->reg_map->qdma.crx_ptr);
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2534  		mtk_w32(eth, ring->last_free_ptr, soc->reg_map->qdma.drx_ptr);
f63959c7eec315 Felix Fietkau    2022-11-16  2535  
f63959c7eec315 Felix Fietkau    2022-11-16  2536  		for (i = 0, ofs = 0; i < MTK_QDMA_NUM_QUEUES; i++) {
f63959c7eec315 Felix Fietkau    2022-11-16  2537  			val = (QDMA_RES_THRES << 8) | QDMA_RES_THRES;
f63959c7eec315 Felix Fietkau    2022-11-16  2538  			mtk_w32(eth, val, soc->reg_map->qdma.qtx_cfg + ofs);
f63959c7eec315 Felix Fietkau    2022-11-16  2539  
f63959c7eec315 Felix Fietkau    2022-11-16  2540  			val = MTK_QTX_SCH_MIN_RATE_EN |
f63959c7eec315 Felix Fietkau    2022-11-16  2541  			      /* minimum: 10 Mbps */
f63959c7eec315 Felix Fietkau    2022-11-16  2542  			      FIELD_PREP(MTK_QTX_SCH_MIN_RATE_MAN, 1) |
f63959c7eec315 Felix Fietkau    2022-11-16  2543  			      FIELD_PREP(MTK_QTX_SCH_MIN_RATE_EXP, 4) |
f63959c7eec315 Felix Fietkau    2022-11-16  2544  			      MTK_QTX_SCH_LEAKY_BUCKET_SIZE;
a008e2a84e6b2b Lorenzo Bianconi 2023-07-25  2545  			if (mtk_is_netsys_v1(eth))
f63959c7eec315 Felix Fietkau    2022-11-16  2546  				val |= MTK_QTX_SCH_LEAKY_BUCKET_EN;
f63959c7eec315 Felix Fietkau    2022-11-16  2547  			mtk_w32(eth, val, soc->reg_map->qdma.qtx_sch + ofs);
f63959c7eec315 Felix Fietkau    2022-11-16  2548  			ofs += MTK_QTX_OFFSET;
f63959c7eec315 Felix Fietkau    2022-11-16  2549  		}
f63959c7eec315 Felix Fietkau    2022-11-16  2550  		val = MTK_QDMA_TX_SCH_MAX_WFQ | (MTK_QDMA_TX_SCH_MAX_WFQ << 16);
f63959c7eec315 Felix Fietkau    2022-11-16  2551  		mtk_w32(eth, val, soc->reg_map->qdma.tx_sch_rate);
a008e2a84e6b2b Lorenzo Bianconi 2023-07-25  2552  		if (mtk_is_netsys_v2_or_greater(eth))
f63959c7eec315 Felix Fietkau    2022-11-16  2553  			mtk_w32(eth, val, soc->reg_map->qdma.tx_sch_rate + 4);
296c9120752bab Stefan Roese     2019-08-16  2554  	} else {
296c9120752bab Stefan Roese     2019-08-16  2555  		mtk_w32(eth, ring->phys_pdma, MT7628_TX_BASE_PTR0);
c30e0b9b88b3cf Felix Fietkau    2022-11-16  2556  		mtk_w32(eth, ring_size, MT7628_TX_MAX_CNT0);
296c9120752bab Stefan Roese     2019-08-16  2557  		mtk_w32(eth, 0, MT7628_TX_CTX_IDX0);
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2558  		mtk_w32(eth, MT7628_PST_DTX_IDX0, soc->reg_map->pdma.rst_idx);
296c9120752bab Stefan Roese     2019-08-16  2559  	}
656e705243fd0c John Crispin     2016-03-08  2560  
656e705243fd0c John Crispin     2016-03-08  2561  	return 0;
656e705243fd0c John Crispin     2016-03-08  2562  
656e705243fd0c John Crispin     2016-03-08  2563  no_tx_mem:
656e705243fd0c John Crispin     2016-03-08  2564  	return -ENOMEM;
656e705243fd0c John Crispin     2016-03-08  2565  }
656e705243fd0c John Crispin     2016-03-08  2566  

:::::: The code at line 2519 was first introduced by commit
:::::: 0e05744beda4ae2d65100ed217e4bd50130b4078 net: ethernet: mtk_eth_soc: rely on txd_size in mtk_tx_alloc/mtk_tx_clean

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
