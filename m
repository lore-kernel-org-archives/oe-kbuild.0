Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DD23A98E
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758591406; cv=none; b=E9upid++kJFRfDr2xqOrxGGbE95wTlTEdMfqbAh24O8x9kaOcU5sFUKrZDnDTN1bRpLwW+eW/f2fZf9YvUAXtKBDZa9A96sSgDawHM4PCy6d/3tT7/Qlk/qCXmSadO7BzQlX5RMgWsMdkzgkEytmvRxC2PFK2bvdG85Mz5ivzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758591406; c=relaxed/simple;
	bh=yCz9KoO8iUZWZ3O3Z2L1X1cJ2Sw8vPOeF9kclQpjWsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j61SajHxf9+PTbly2uUmYz56fpD+Dw+CMyMngTu5KBFqyhacuhnecgnwYPVtNK0DWIMiMrnvfW3GV03CkUnUWXouBAX/sBWtTpPQa8EiQGRWaylB5VgQ1tmWKysU8fmdAzvFcRanSoG3xQ7u05Xjd+9Rwb2OOLS4Y6KkBdCnTm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wa4EZ+pc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wa4EZ+pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758591404; x=1790127404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCz9KoO8iUZWZ3O3Z2L1X1cJ2Sw8vPOeF9kclQpjWsI=;
  b=Wa4EZ+pch/nuXrcrPdMtsF75qJC5d1/0NmyyFiGyq2sxemGPkbJNClkX
   Ce1S08DT7/Dt8ZjX4I7ZZJbVxh0tEtU94cZ8jP3TRyGu25MA6jCoXrRfO
   gYnuA4DZGPIXJE11AGMQmN4LosRKazrIJHOvQmgSHwqhPPaIu4wmJ+3dd
   H/PwVGwAUqJv5sUq8ZSh7HVrkM2O2VPLT6NSyCm5rwm8lj0VH8ESPsjnZ
   CE4bNRNNbYO/FSOcKANf7hae2lbpGzRymO09Q5Iu6fvsbkXGT2+BglqVV
   dgDodCeq5N6CXks7zTpcL401ipMwEESRy3kawzC5IGw14Wasydo98wuoP
   g==;
X-CSE-ConnectionGUID: j+xz0k7xRO2DNGLosLApdg==
X-CSE-MsgGUID: n0N9DJ6pQkO4MKrPqYxhCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78306713"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="78306713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:36:44 -0700
X-CSE-ConnectionGUID: 3fQMvJ97SsiMK1dc0/0ODw==
X-CSE-MsgGUID: HxKuy4BYQ62GIcgGNePz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="181788490"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2025 18:36:42 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0rxL-0002cm-1x;
	Tue, 23 Sep 2025 01:36:35 +0000
Date: Tue, 23 Sep 2025 09:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:alloc-token 1/1] drivers/dma/sun6i-dma.c:778
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line
 779)
Message-ID: <202509230915.bPZieQaD-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   0511465fa243023ed1783e2adabe58d8c81ac3ce
commit: 0511465fa243023ed1783e2adabe58d8c81ac3ce [1/1] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc64-randconfig-r071-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230915.bPZieQaD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509230915.bPZieQaD-lkp@intel.com/

smatch warnings:
drivers/dma/sun6i-dma.c:778 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 779)
drivers/dma/sun6i-dma.c:849 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 850)

vim +/v_lli +778 drivers/dma/sun6i-dma.c

555859308723d8 Maxime Ripard       2014-07-17  700  
555859308723d8 Maxime Ripard       2014-07-17  701  static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
555859308723d8 Maxime Ripard       2014-07-17  702  		struct dma_chan *chan, struct scatterlist *sgl,
555859308723d8 Maxime Ripard       2014-07-17  703  		unsigned int sg_len, enum dma_transfer_direction dir,
555859308723d8 Maxime Ripard       2014-07-17  704  		unsigned long flags, void *context)
555859308723d8 Maxime Ripard       2014-07-17  705  {
555859308723d8 Maxime Ripard       2014-07-17  706  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
555859308723d8 Maxime Ripard       2014-07-17  707  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
555859308723d8 Maxime Ripard       2014-07-17  708  	struct dma_slave_config *sconfig = &vchan->cfg;
555859308723d8 Maxime Ripard       2014-07-17  709  	struct sun6i_dma_lli *v_lli, *prev = NULL;
555859308723d8 Maxime Ripard       2014-07-17  710  	struct sun6i_desc *txd;
555859308723d8 Maxime Ripard       2014-07-17  711  	struct scatterlist *sg;
555859308723d8 Maxime Ripard       2014-07-17  712  	dma_addr_t p_lli;
52c871798ff84b Jean-Francois Moine 2016-04-22  713  	u32 lli_cfg;
555859308723d8 Maxime Ripard       2014-07-17  714  	int i, ret;
555859308723d8 Maxime Ripard       2014-07-17  715  
555859308723d8 Maxime Ripard       2014-07-17  716  	if (!sgl)
555859308723d8 Maxime Ripard       2014-07-17  717  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  718  
52c871798ff84b Jean-Francois Moine 2016-04-22  719  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
52c871798ff84b Jean-Francois Moine 2016-04-22  720  	if (ret) {
52c871798ff84b Jean-Francois Moine 2016-04-22  721  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
52c871798ff84b Jean-Francois Moine 2016-04-22  722  		return NULL;
52c871798ff84b Jean-Francois Moine 2016-04-22  723  	}
52c871798ff84b Jean-Francois Moine 2016-04-22  724  
555859308723d8 Maxime Ripard       2014-07-17  725  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
555859308723d8 Maxime Ripard       2014-07-17  726  	if (!txd)
555859308723d8 Maxime Ripard       2014-07-17  727  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  728  
555859308723d8 Maxime Ripard       2014-07-17  729  	for_each_sg(sgl, sg, sg_len, i) {
ec31c5c5949275 Samuel Holland      2022-04-24  730  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  731  		if (!v_lli)
4fbd804e009ae9 Maxime Ripard       2014-07-30  732  			goto err_lli_free;
555859308723d8 Maxime Ripard       2014-07-17  733  
52c871798ff84b Jean-Francois Moine 2016-04-22  734  		v_lli->len = sg_dma_len(sg);
52c871798ff84b Jean-Francois Moine 2016-04-22  735  		v_lli->para = NORMAL_WAIT;
555859308723d8 Maxime Ripard       2014-07-17  736  
52c871798ff84b Jean-Francois Moine 2016-04-22  737  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  738  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  739  					   sg_dma_address(sg),
ec31c5c5949275 Samuel Holland      2022-04-24  740  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  741  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  742  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  743  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
555859308723d8 Maxime Ripard       2014-07-17  744  
555859308723d8 Maxime Ripard       2014-07-17  745  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  746  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  747  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  748  				&sconfig->dst_addr, &sg_dma_address(sg),
555859308723d8 Maxime Ripard       2014-07-17  749  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  750  
555859308723d8 Maxime Ripard       2014-07-17  751  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  752  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  753  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  754  					   sg_dma_address(sg));
802440bdf3b787 Jernej Skrabec      2019-05-27  755  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  756  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  757  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
555859308723d8 Maxime Ripard       2014-07-17  758  
555859308723d8 Maxime Ripard       2014-07-17  759  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  760  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  761  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  762  				&sg_dma_address(sg), &sconfig->src_addr,
555859308723d8 Maxime Ripard       2014-07-17  763  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  764  		}
555859308723d8 Maxime Ripard       2014-07-17  765  
555859308723d8 Maxime Ripard       2014-07-17  766  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
555859308723d8 Maxime Ripard       2014-07-17  767  	}
555859308723d8 Maxime Ripard       2014-07-17  768  
555859308723d8 Maxime Ripard       2014-07-17  769  	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
9aa48806edb8c3 Samuel Holland      2022-04-24  770  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24  771  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  772  		sun6i_dma_dump_lli(vchan, v_lli, p_lli);
555859308723d8 Maxime Ripard       2014-07-17  773  
555859308723d8 Maxime Ripard       2014-07-17  774  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
555859308723d8 Maxime Ripard       2014-07-17  775  
4fbd804e009ae9 Maxime Ripard       2014-07-30  776  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  777  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @778  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24 @779  		dma_pool_free(sdev->pool, v_lli, p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  780  	kfree(txd);
555859308723d8 Maxime Ripard       2014-07-17  781  	return NULL;
555859308723d8 Maxime Ripard       2014-07-17  782  }
555859308723d8 Maxime Ripard       2014-07-17  783  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  784  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
a90e173f3faf29 Jean-Francois Moine 2016-04-28  785  					struct dma_chan *chan,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  786  					dma_addr_t buf_addr,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  787  					size_t buf_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  788  					size_t period_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  789  					enum dma_transfer_direction dir,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  790  					unsigned long flags)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  791  {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  792  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  793  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  794  	struct dma_slave_config *sconfig = &vchan->cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  795  	struct sun6i_dma_lli *v_lli, *prev = NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  796  	struct sun6i_desc *txd;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  797  	dma_addr_t p_lli;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  	u32 lli_cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  799  	unsigned int i, periods = buf_len / period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  800  	int ret;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  801  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  802  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  803  	if (ret) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  804  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  806  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  807  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  808  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  809  	if (!txd)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  810  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  811  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  812  	for (i = 0; i < periods; i++) {
ec31c5c5949275 Samuel Holland      2022-04-24  813  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  814  		if (!v_lli) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  815  			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  816  			goto err_lli_free;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  817  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  818  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  819  		v_lli->len = period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  820  		v_lli->para = NORMAL_WAIT;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  821  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  822  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  823  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  824  					   buf_addr + period_len * i,
ec31c5c5949275 Samuel Holland      2022-04-24  825  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  826  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  827  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  828  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  829  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  830  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  831  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  832  					   buf_addr + period_len * i);
802440bdf3b787 Jernej Skrabec      2019-05-27  833  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  834  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  835  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  836  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  837  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  838  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  839  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  840  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  841  	prev->p_lli_next = txd->p_lli;		/* cyclic list */
a90e173f3faf29 Jean-Francois Moine 2016-04-28  842  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  843  	vchan->cyclic = true;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  844  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  845  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  846  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  847  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  848  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @849  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24 @850  		dma_pool_free(sdev->pool, v_lli, p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  851  	kfree(txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  852  	return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  853  }
a90e173f3faf29 Jean-Francois Moine 2016-04-28  854  

:::::: The code at line 778 was first introduced by commit
:::::: 9aa48806edb8c37e82532dbc6098b03f6bd4245e dmaengine: sun6i: Do not use virt_to_phys

:::::: TO: Samuel Holland <samuel@sholland.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
