Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7217E259C
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Mar 2025 04:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743395237; cv=none; b=fgmmB9njaSDFOsHDHu+EeRShO2EtgUhAeoO8vEMhtKreG4Nyy/swJp8ql4j/GFPr5iZ+7ItKPxK7Mz4q69Q/kvkJsxGUgJ0jeO5/cXXtOcdXldOr+vb7qoYC7hqH+B31GmwhWpIFweJfdJAF61ZNTySvsTfTcLxedieOEhgwqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743395237; c=relaxed/simple;
	bh=AVyxR6zcQ6RDZZBEgM/IvcC/amIn26xo7O+sj8EmK0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=neweLa9ouqnvoKnunf3KaCjIKN2awM6RvRvTIR7sQV5PZH6jk1Wimlexfwam0lsOQUat7XVabP+9h58pGB5M1ADysVATF3BP2x/DdvUyzmyqjaVc+oQchoG+SXidGWBeue2p0x0D34pZl+7Pp1iJIhISFOOoxfTwLhJyZot+AVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqUP8QTk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqUP8QTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743395235; x=1774931235;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AVyxR6zcQ6RDZZBEgM/IvcC/amIn26xo7O+sj8EmK0Y=;
  b=GqUP8QTk7GxnJKj+4DdgxrzG4Cadaa0YI1Jk+7NVvNS00YkqhxZwOmyR
   CeuoJlzFB/7BseJajkxx2zKPqgx8aJD77ams3lGYo+xiXnArdXp/YETZ8
   +TShBVxLkb7CNNbA/IthPkD+n8x9K/EvndjI40uaIQtZZFDrVcThwS5Rz
   kJpOAlDzK8QytvvWdtYPw5lJCTay26DQUSc7WjYTJ09u95XmSJEqktpHK
   YFXlcI9swLMRROT5tV4k9fdue0dANZw/JGWOXstjeRvOK41C2Ipzpsf4y
   Sc+UI2748n/+tiTodIlKLSiDGKAIJEKpnTrBeQca5Sjjdn1boSfX/EZv4
   Q==;
X-CSE-ConnectionGUID: VASeBd5lRDirsWbfYcJiiQ==
X-CSE-MsgGUID: 0eZuZYr/SX+zTATRbrdhaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44804243"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44804243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 21:27:13 -0700
X-CSE-ConnectionGUID: G3VUAkQ6QGqUosCNdrG24A==
X-CSE-MsgGUID: bW4Z8uBeQ4O0Slp3lfYDzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126896094"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2025 21:27:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz6jt-000930-2I;
	Mon, 31 Mar 2025 04:27:09 +0000
Date: Mon, 31 Mar 2025 12:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Support descriptor setup from
 dma_vecs
Message-ID: <202503311117.9fmhfmqL-lkp@intel.com>
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
In-Reply-To: <D8TV2MP99NTE.1842MMA04VB9N@folker-schwesinger.de>
References: <D8TV2MP99NTE.1842MMA04VB9N@folker-schwesinger.de>
TO: Folker Schwesinger <dev@folker-schwesinger.de>
TO: dmaengine@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Vinod Koul <vkoul@kernel.org>
CC: Michal Simek <monstr@monstr.eu>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Marek Vasut <marex@denx.de>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Hi Folker,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6565439894570a07b00dba0b739729fe6b56fba4]

url:    https://github.com/intel-lab-lkp/linux/commits/Folker-Schwesinger/dmaengine-xilinx_dma-Support-descriptor-setup-from-dma_vecs/20250331-042059
base:   6565439894570a07b00dba0b739729fe6b56fba4
patch link:    https://lore.kernel.org/r/D8TV2MP99NTE.1842MMA04VB9N%40folker-schwesinger.de
patch subject: [PATCH] dmaengine: xilinx_dma: Support descriptor setup from dma_vecs
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-141-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311117.9fmhfmqL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503311117.9fmhfmqL-lkp@intel.com/

New smatch warnings:
drivers/dma/xilinx/xilinx_dma.c:2251 xilinx_dma_prep_peripheral_dma_vec() error: uninitialized symbol 'segment'.

Old smatch warnings:
drivers/dma/xilinx/xilinx_dma.c:3059 xilinx_dma_chan_probe() warn: 'chan->irq' from request_irq() not released on lines: 3056.

vim +/segment +2251 drivers/dma/xilinx/xilinx_dma.c

07b0e7d49cbcad drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  2174  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2175  /**
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2176   * xilinx_dma_prep_peripheral_dma_vec - prepare descriptors for a DMA_SLAVE
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2177   *	transaction from DMA vectors
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2178   * @dchan: DMA channel
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2179   * @vecs: Array of DMA vectors that should be transferred
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2180   * @nb: number of entries in @vecs
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2181   * @direction: DMA direction
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2182   * @flags: transfer ack flags
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2183   *
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2184   * Return: Async transaction descriptor on success and NULL on failure
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2185   */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2186  static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2187  	struct dma_chan *dchan, const struct dma_vec *vecs, size_t nb,
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2188  	enum dma_transfer_direction direction, unsigned long flags)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2189  {
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2190  	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2191  	struct xilinx_dma_tx_descriptor *desc;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2192  	struct xilinx_axidma_tx_segment *segment, *head, *prev = NULL;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2193  	size_t copy;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2194  	size_t sg_used;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2195  	unsigned int i;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2196  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2197  	if (!is_slave_direction(direction) || direction != chan->direction)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2198  		return NULL;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2199  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2200  	desc = xilinx_dma_alloc_tx_descriptor(chan);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2201  	if (!desc)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2202  		return NULL;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2203  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2204  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2205  	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2206  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2207  	/* Build transactions using information from DMA vectors */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2208  	for (i = 0; i < nb; i++) {
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2209  		sg_used = 0;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2210  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2211  		/* Loop until the entire dma_vec entry is used */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2212  		while (sg_used < vecs[i].len) {
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2213  			struct xilinx_axidma_desc_hw *hw;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2214  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2215  			/* Get a free segment */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2216  			segment = xilinx_axidma_alloc_tx_segment(chan);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2217  			if (!segment)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2218  				goto error;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2219  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2220  			/*
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2221  			 * Calculate the maximum number of bytes to transfer,
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2222  			 * making sure it is less than the hw limit
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2223  			 */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2224  			copy = xilinx_dma_calc_copysize(chan, vecs[i].len,
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2225  					sg_used);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2226  			hw = &segment->hw;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2227  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2228  			/* Fill in the descriptor */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2229  			xilinx_axidma_buf(chan, hw, vecs[i].addr, sg_used, 0);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2230  			hw->control = copy;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2231  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2232  			if (prev)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2233  				prev->hw.next_desc = segment->phys;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2234  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2235  			prev = segment;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2236  			sg_used += copy;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2237  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2238  			/*
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2239  			 * Insert the segment into the descriptor segments
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2240  			 * list.
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2241  			 */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2242  			list_add_tail(&segment->node, &desc->segments);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2243  		}
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2244  	}
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2245  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2246  	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2247  	desc->async_tx.phys = head->phys;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2248  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2249  	/* For the last DMA_MEM_TO_DEV transfer, set EOP */
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2250  	if (chan->direction == DMA_MEM_TO_DEV) {
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12 @2251  		segment->hw.control |= XILINX_DMA_BD_SOP;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2252  		segment = list_last_entry(&desc->segments,
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2253  					  struct xilinx_axidma_tx_segment,
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2254  					  node);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2255  		segment->hw.control |= XILINX_DMA_BD_EOP;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2256  	}
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2257  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2258  	if (chan->xdev->has_axistream_connected)
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2259  		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2260  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2261  	return &desc->async_tx;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2262  
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2263  error:
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2264  	xilinx_dma_free_tx_descriptor(chan, desc);
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2265  	return NULL;
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2266  }
4806fd02002cc5 drivers/dma/xilinx/xilinx_dma.c  Folker Schwesinger     2025-03-12  2267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
