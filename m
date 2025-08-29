Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D1305E32
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756461670; cv=none; b=GypH+p2DAbuKPLes8Od2PiJ6spzUaGJeIbrVavXYGlF4QsB276fRLL7Q38Px7rRvlLEyMi5+uR7GnzEy3Sc1BKa7j4+ksxdFCUaA/x2JGff/qkK2s4s65knRGodvJkOmi2E5QcMRCo0+XsnwGOu0k/lcb+uoyPB47Azu0h8RMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756461670; c=relaxed/simple;
	bh=Dy2YDD6aTO8yP3ZkQZrOrW0WwpHdxC0/BhrTlG+Yy1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7Lp07cQR5Arsu0xKuPV9qdfTEK+ftIs2GmFvIPvA/bew0OkVosgD6sb01paQYS4GRTqnXAKI92a/ynHyrGKQSFwQ1oUjtBxWnwwlvFo3L3RWlCiRc0VbkA3Dqvjho55sj3Ei9cRW2PCSIBGxdOH91SHb9dYsWs++XgCtYPSxKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFqa3q2Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFqa3q2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756461667; x=1787997667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dy2YDD6aTO8yP3ZkQZrOrW0WwpHdxC0/BhrTlG+Yy1I=;
  b=dFqa3q2Yn4oLOi0m5p+ks42e4kV1bQZKaAiuRtoXSnina+GwFVL5TFAp
   kx8ZXLJMljLJIkB8XbFe4V1dk3GhjzjJh+SDI07uMP3Q+FnrSUIqM2R5t
   /73qDLDaLmP3+d7dr1yKHBL0s47ef3f43EXUE+HwSiR/Si9CsRpCdxl5o
   pDmH8e2dRntGefczlXwvkPR+XM1iBDLvfbiXDofK6msUxQKWeP9vHy16n
   vU4bx/egkufgDIzR18g7inc7J+lIAa3Jly90QzwatFw0q4gJ4ruIJSM1X
   RAI/PRPI0iFi1mIb4azJF9E6HKu4j5ePCyLw35T+B3jt8zcXo4M0YWgvr
   A==;
X-CSE-ConnectionGUID: qNTlBvVCQfOAUPOKbaAArw==
X-CSE-MsgGUID: VIzu9eqCSHSibzwNu/mKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58847562"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58847562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:01:06 -0700
X-CSE-ConnectionGUID: RS+XrosqT5+RdiXgppnOLw==
X-CSE-MsgGUID: +PRRVCKDSqqY3j6j5MmIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="193997623"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2025 03:01:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urvtX-000UcB-1G;
	Fri, 29 Aug 2025 10:00:16 +0000
Date: Fri, 29 Aug 2025 17:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 14/14] dmaengine: dma350: Support ARM DMA-250
Message-ID: <202508291734.NUbbsNTw-lkp@intel.com>
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
In-Reply-To: <20250823154009.25992-15-jszhang@kernel.org>
References: <20250823154009.25992-15-jszhang@kernel.org>
TO: Jisheng Zhang <jszhang@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.17-rc3 next-20250829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-15-jszhang%40kernel.org
patch subject: [PATCH 14/14] dmaengine: dma350: Support ARM DMA-250
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291734.NUbbsNTw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508291734.NUbbsNTw-lkp@intel.com/

New smatch warnings:
drivers/dma/arm-dma350.c:680 d250_prep_memcpy() error: uninitialized symbol 'la_cmd'.
drivers/dma/arm-dma350.c:849 d250_prep_cyclic() error: uninitialized symbol 'sg'.

Old smatch warnings:
drivers/dma/arm-dma350.c:1006 d350_get_residue() error: uninitialized symbol 'sgcur'.

vim +/la_cmd +680 drivers/dma/arm-dma350.c

5fd00cdb113f60 Jisheng Zhang 2025-08-23  606  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  607  static struct dma_async_tx_descriptor *d250_prep_memcpy(struct dma_chan *chan,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  608  		dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  609  {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  610  	struct d350_chan *dch = to_d350_chan(chan);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  611  	struct d350_desc *desc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  612  	u32 *cmd, *la_cmd, tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  613  	int sglen, i;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  614  	struct d350_sg *sg;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  615  	size_t xfer_len, step_max;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  616  	dma_addr_t phys;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  617  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  618  	tsz = __ffs(len | dest | src | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  619  	step_max = ((1UL << 16) - 1) << tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  620  	sglen = DIV_ROUND_UP(len, step_max);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  621  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  622  	desc = kzalloc(struct_size(desc, sg, sglen), GFP_NOWAIT);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  623  	if (!desc)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  624  		return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  625  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  626  	desc->sglen = sglen;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  627  	sglen = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  628  	while (len) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  629  		sg = &desc->sg[sglen];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  630  		xfer_len = (len > step_max) ? step_max : len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  631  		sg->tsz = __ffs(xfer_len | dest | src | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  632  		sg->xsize = lower_16_bits(xfer_len >> sg->tsz);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  633  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  634  		sg->command = dma_pool_zalloc(dch->cmd_pool, GFP_NOWAIT, &phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  635  		if (unlikely(!sg->command))
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  636  			goto err_cmd_alloc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  637  		sg->phys = phys;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  638  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  639  		cmd = sg->command;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  640  		if (!sglen) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  641  			cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_DESADDR |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  642  				 LINK_XSIZE | LINK_SRCTRANSCFG |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  643  				 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  644  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  645  			cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, sg->tsz) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  646  				 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  647  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  648  			cmd[2] = lower_32_bits(src);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  649  			cmd[3] = lower_32_bits(dest);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  650  			cmd[4] = FIELD_PREP(CH_XY_SRC, sg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  651  				 FIELD_PREP(CH_XY_DES, sg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  652  			cmd[5] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  653  			cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  654  			cmd[7] = FIELD_PREP(CH_XY_SRC, 1) | FIELD_PREP(CH_XY_DES, 1);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  655  			la_cmd = &cmd[8];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  656  		} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  657  			*la_cmd = phys | CH_LINKADDR_EN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  658  			if (len <= step_max) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  659  				cmd[0] = LINK_CTRL | LINK_XSIZE | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  660  				cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, sg->tsz) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  661  					 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  662  				cmd[2] = FIELD_PREP(CH_XY_SRC, sg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  663  					 FIELD_PREP(CH_XY_DES, sg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  664  				la_cmd = &cmd[3];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  665  			} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  666  				cmd[0] = LINK_XSIZE | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  667  				cmd[1] = FIELD_PREP(CH_XY_SRC, sg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  668  					 FIELD_PREP(CH_XY_DES, sg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  669  				la_cmd = &cmd[2];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  670  			}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  671  		}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  672  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  673  		len -= xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  674  		src += xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  675  		dest += xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  676  		sglen++;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  677  	}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  678  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  679  	/* the last cmdlink */
79c74fe17fc1d1 Jisheng Zhang 2025-08-23 @680  	*la_cmd = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  681  	desc->sg[sglen - 1].command[1] |= FIELD_PREP(CH_CTRL_DONETYPE, CH_CTRL_DONETYPE_CMD);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  682  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  683  	mb();
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  684  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  685  	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  686  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  687  err_cmd_alloc:
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  688  	for (i = 0; i < sglen; i++)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  689  		dma_pool_free(dch->cmd_pool, desc->sg[i].command, desc->sg[i].phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  690  	kfree(desc);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  691  	return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  692  }
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  693  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  694  static struct dma_async_tx_descriptor *
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  695  d250_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  696  		   unsigned int sg_len, enum dma_transfer_direction dir,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  697  		   unsigned long flags, void *context)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  698  {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  699  	struct d350_chan *dch = to_d350_chan(chan);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  700  	dma_addr_t src, dst, phys, mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  701  	size_t xfer_len, step_max;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  702  	u32 len, trig, *cmd, *la_cmd, tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  703  	struct d350_desc *desc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  704  	struct scatterlist *sg;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  705  	struct d350_sg *dsg;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  706  	int i, sglen = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  707  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  708  	if (unlikely(!is_slave_direction(dir) || !sg_len))
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  709  		return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  710  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  711  	if (dir == DMA_MEM_TO_DEV)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  712  		tsz = __ffs(dch->config.dst_addr_width | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  713  	else
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  714  		tsz = __ffs(dch->config.src_addr_width | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  715  	step_max = ((1UL << 16) - 1) << tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  716  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  717  	for_each_sg(sgl, sg, sg_len, i)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  718  		sglen += DIV_ROUND_UP(sg_dma_len(sg), step_max);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  719  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  720  	desc = kzalloc(struct_size(desc, sg, sglen), GFP_NOWAIT);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  721  	if (!desc)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  722  		return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  723  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  724  	desc->sglen = sglen;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  725  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  726  	sglen = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  727  	for_each_sg(sgl, sg, sg_len, i) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  728  		len = sg_dma_len(sg);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  729  		mem_addr = sg_dma_address(sg);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  730  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  731  		do {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  732  			desc->sg[sglen].command = dma_pool_zalloc(dch->cmd_pool, GFP_NOWAIT, &phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  733  			if (unlikely(!desc->sg[sglen].command))
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  734  				goto err_cmd_alloc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  735  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  736  			xfer_len = (len > step_max) ? step_max : len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  737  			desc->sg[sglen].phys = phys;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  738  			dsg = &desc->sg[sglen];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  739  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  740  			if (dir == DMA_MEM_TO_DEV) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  741  				src = mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  742  				dst = dch->config.dst_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  743  				trig = CH_CTRL_USEDESTRIGIN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  744  			} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  745  				src = dch->config.src_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  746  				dst = mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  747  				trig = CH_CTRL_USESRCTRIGIN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  748  			}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  749  			dsg->tsz = tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  750  			dsg->xsize = lower_16_bits(xfer_len >> dsg->tsz);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  751  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  752  			cmd = dsg->command;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  753  			if (!sglen) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  754  				cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_DESADDR |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  755  					 LINK_XSIZE | LINK_SRCTRANSCFG |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  756  					 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  757  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  758  				cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, dsg->tsz) | trig |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  759  					 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  760  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  761  				cmd[2] = lower_32_bits(src);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  762  				cmd[3] = lower_32_bits(dst);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  763  				cmd[4] = FIELD_PREP(CH_XY_SRC, dsg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  764  					 FIELD_PREP(CH_XY_DES, dsg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  765  				if (dir == DMA_MEM_TO_DEV) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  766  					cmd[0] |= LINK_DESTRIGINCFG;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  767  					cmd[5] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  768  					cmd[6] = TRANSCFG_DEVICE;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  769  					cmd[7] = FIELD_PREP(CH_XY_SRC, 1);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  770  					cmd[8] = FIELD_PREP(CH_DESTRIGINMODE, CH_DESTRIG_DMA_FC) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  771  						  FIELD_PREP(CH_DESTRIGINTYPE, CH_DESTRIG_HW_REQ);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  772  				} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  773  					cmd[0] |= LINK_SRCTRIGINCFG;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  774  					cmd[5] = TRANSCFG_DEVICE;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  775  					cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  776  					cmd[7] = FIELD_PREP(CH_XY_DES, 1);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  777  					cmd[8] = FIELD_PREP(CH_SRCTRIGINMODE, CH_SRCTRIG_DMA_FC) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  778  						  FIELD_PREP(CH_SRCTRIGINTYPE, CH_SRCTRIG_HW_REQ);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  779  				}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  780  				la_cmd = &cmd[9];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  781  			} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  782  				*la_cmd = phys | CH_LINKADDR_EN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  783  				if (sglen == desc->sglen - 1) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  784  					cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_DESADDR |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  785  						 LINK_XSIZE | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  786  					cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, dsg->tsz) | trig |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  787  						 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  788  					cmd[2] = lower_32_bits(src);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  789  					cmd[3] = lower_32_bits(dst);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  790  					cmd[4] = FIELD_PREP(CH_XY_SRC, dsg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  791  						 FIELD_PREP(CH_XY_DES, dsg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  792  					la_cmd = &cmd[5];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  793  				} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  794  					cmd[0] = LINK_SRCADDR | LINK_DESADDR |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  795  						 LINK_XSIZE | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  796  					cmd[1] = lower_32_bits(src);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  797  					cmd[2] = lower_32_bits(dst);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  798  					cmd[3] = FIELD_PREP(CH_XY_SRC, dsg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  799  						 FIELD_PREP(CH_XY_DES, dsg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  800  					la_cmd = &cmd[4];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  801  				}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  802  			}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  803  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  804  			len -= xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  805  			mem_addr += xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  806  			sglen++;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  807  		} while (len);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  808  	}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  809  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  810  	/* the last command */
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  811  	*la_cmd = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  812  	desc->sg[sglen - 1].command[1] |= FIELD_PREP(CH_CTRL_DONETYPE, CH_CTRL_DONETYPE_CMD);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  813  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  814  	mb();
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  815  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  816  	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  817  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  818  err_cmd_alloc:
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  819  	for (i = 0; i < sglen; i++)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  820  		dma_pool_free(dch->cmd_pool, desc->sg[i].command, desc->sg[i].phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  821  	kfree(desc);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  822  	return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  823  }
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  824  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  825  static struct dma_async_tx_descriptor *
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  826  d250_prep_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  827  		 size_t buf_len, size_t period_len, enum dma_transfer_direction dir,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  828  		 unsigned long flags)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  829  {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  830  	struct d350_chan *dch = to_d350_chan(chan);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  831  	u32 len, periods, trig, *cmd, tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  832  	dma_addr_t src, dst, phys, mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  833  	size_t xfer_len, step_max;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  834  	struct d350_desc *desc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  835  	struct scatterlist *sg;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  836  	struct d350_sg *dsg;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  837  	int sglen, i;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  838  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  839  	if (unlikely(!is_slave_direction(dir) || !buf_len || !period_len))
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  840  		return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  841  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  842  	if (dir == DMA_MEM_TO_DEV)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  843  		tsz = __ffs(dch->config.dst_addr_width | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  844  	else
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  845  		tsz = __ffs(dch->config.src_addr_width | (1 << dch->tsz));
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  846  	step_max = ((1UL << 16) - 1) << tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  847  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  848  	periods = buf_len / period_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23 @849  	sglen = DIV_ROUND_UP(sg_dma_len(sg), step_max) * periods;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  850  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  851  	desc = kzalloc(struct_size(desc, sg, sglen), GFP_NOWAIT);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  852  	if (!desc)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  853  		return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  854  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  855  	dch->cyclic = true;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  856  	dch->periods = periods;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  857  	desc->sglen = sglen;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  858  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  859  	sglen = 0;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  860  	for (i = 0; i < periods; i++) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  861  		len = period_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  862  		mem_addr = buf_addr + i * period_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  863  		do {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  864  			desc->sg[sglen].command = dma_pool_zalloc(dch->cmd_pool, GFP_NOWAIT, &phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  865  			if (unlikely(!desc->sg[sglen].command))
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  866  				goto err_cmd_alloc;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  867  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  868  			xfer_len = (len > step_max) ? step_max : len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  869  			desc->sg[sglen].phys = phys;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  870  			dsg = &desc->sg[sglen];
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  871  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  872  			if (dir == DMA_MEM_TO_DEV) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  873  				src = mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  874  				dst = dch->config.dst_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  875  				trig = CH_CTRL_USEDESTRIGIN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  876  			} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  877  				src = dch->config.src_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  878  				dst = mem_addr;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  879  				trig = CH_CTRL_USESRCTRIGIN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  880  			}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  881  			dsg->tsz = tsz;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  882  			dsg->xsize = lower_16_bits(xfer_len >> dsg->tsz);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  883  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  884  			cmd = dsg->command;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  885  			cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_DESADDR |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  886  				 LINK_XSIZE | LINK_SRCTRANSCFG |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  887  				 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  888  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  889  			cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, dsg->tsz) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  890  				 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  891  				 FIELD_PREP(CH_CTRL_DONETYPE, CH_CTRL_DONETYPE_CMD) | trig;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  892  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  893  			cmd[2] = lower_32_bits(src);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  894  			cmd[3] = lower_32_bits(dst);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  895  			cmd[4] = FIELD_PREP(CH_XY_SRC, dsg->xsize) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  896  				 FIELD_PREP(CH_XY_DES, dsg->xsize);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  897  			if (dir == DMA_MEM_TO_DEV) {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  898  				cmd[0] |= LINK_DESTRIGINCFG;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  899  				cmd[5] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  900  				cmd[6] = TRANSCFG_DEVICE;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  901  				cmd[7] = FIELD_PREP(CH_XY_SRC, 1);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  902  				cmd[8] = FIELD_PREP(CH_DESTRIGINMODE, CH_DESTRIG_DMA_FC) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  903  					  FIELD_PREP(CH_DESTRIGINTYPE, CH_DESTRIG_HW_REQ);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  904  			} else {
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  905  				cmd[0] |= LINK_SRCTRIGINCFG;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  906  				cmd[5] = TRANSCFG_DEVICE;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  907  				cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  908  				cmd[7] = FIELD_PREP(CH_XY_DES, 1);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  909  				cmd[8] = FIELD_PREP(CH_SRCTRIGINMODE, CH_SRCTRIG_DMA_FC) |
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  910  					  FIELD_PREP(CH_SRCTRIGINTYPE, CH_SRCTRIG_HW_REQ);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  911  			}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  912  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  913  			if (sglen)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  914  				desc->sg[sglen - 1].command[9] = phys | CH_LINKADDR_EN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  915  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  916  			len -= xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  917  			mem_addr += xfer_len;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  918  			sglen++;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  919  		} while (len);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  920  		desc->sg[sglen - 1].command[1] |= FIELD_PREP(CH_CTRL_DONETYPE,
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  921  							     CH_CTRL_DONETYPE_CMD);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  922  	}
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  923  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  924  	/* cyclic list */
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  925  	desc->sg[sglen - 1].command[9] = desc->sg[0].phys | CH_LINKADDR_EN;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  926  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  927  	mb();
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  928  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  929  	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  930  
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  931  err_cmd_alloc:
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  932  	for (i = 0; i < sglen; i++)
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  933  		dma_pool_free(dch->cmd_pool, desc->sg[i].command, desc->sg[i].phys);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  934  	kfree(desc);
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  935  	return NULL;
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  936  }
79c74fe17fc1d1 Jisheng Zhang 2025-08-23  937  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
