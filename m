Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB40C762D0
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 04:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728360341; cv=none; b=iXMvBrhK5YLFf/aOwvuOj3gr3393916Kj+68RHERU106lamnCiQ/9aQlDah3weAVl1W0JkYeN7DwdvS6cFguYhHgrviAeaH6zDRY5VJtD/meCw6f5bVq5ZxsAb/W0NObmQ/Bvc4UcYdukKktvn64Mrc3irQPAne5MKzh9g9XgaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728360341; c=relaxed/simple;
	bh=y43AL7cCnkGRQJBScqWb7/hEiWen3iiV40iVVmb1Q7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pr9KTY0oleigqQdGXrbfo16afKv5kH6vKG2PQL0DSu5KGoXrYYkCmS93siA1m4pIMcJGQAveRNQyORyfv55mAxGPckxMpNLbu7xw6xkvdgx4YQC85GJK50KaVWnDjlZ4zQGHwe9kuuh/jkm4H1S1hYp6LOBOrKO9Q14JmF5yhlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6HApU5d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6HApU5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728360336; x=1759896336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y43AL7cCnkGRQJBScqWb7/hEiWen3iiV40iVVmb1Q7o=;
  b=Z6HApU5dqaYDVGzKkSUhsYXol4wpR/Zq71lPApCrGeN5QnlkyDpt9Dx1
   WGyubsIWjYAVeJ9vGJwIVgLOZrHtorq9NfSkJKSrAOFQP3vBg0jrOdJEA
   XyptVnK6bwZlpXj+/2Jz5X3yuMSZiNKQDc3UWQCE7mRMNASabbIk+U3u0
   vI5OHPnp1d7rHB+pLyyNHEOPKYkIEhJ/+TdvfGoUuT91bdwXZw2+x+Nan
   ZWl0RJ/uuDw6NxqemBlCbWmcTJA7yq4NtDQT20x8W7EmZ94kBxsR9wXED
   Hn8IU3FaxShOsix8msVz5IzzE4iCsGn3IHwPezQxN2+qtcWdyxbgl9yKW
   g==;
X-CSE-ConnectionGUID: pV1s4brfR4mmU34A2jB+Ow==
X-CSE-MsgGUID: 9RRgzghMRm6ZUfGpM2RRsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31318346"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="31318346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 21:05:34 -0700
X-CSE-ConnectionGUID: EiCzDd4yR1KOxbyOD4C+KA==
X-CSE-MsgGUID: TSXcnEzzQOiFA0DTC/53ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75258906"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2024 21:05:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy1TW-0005sm-1c;
	Tue, 08 Oct 2024 04:05:30 +0000
Date: Tue, 8 Oct 2024 12:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:2519 mtk_tx_alloc()
 error: uninitialized symbol 'txd'.
Message-ID: <202410081101.PlhAGGxk-lkp@intel.com>
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
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: c57e558194430d10d5e5f4acd8a8655b68dade13 net: ethernet: mtk_eth_soc: handle dma buffer size soc specific
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081101.PlhAGGxk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410081101.PlhAGGxk-lkp@intel.com/

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
