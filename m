Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7737E25B08E
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 01:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142941; cv=none; b=cBZv9DgQea9VD89HBslRo6Zl48pMGWb0TGzDqPELAdL0cHwnpHa2IIr0My5wr3fgvNxWT2irP/mtmzOg7+qv5GNA9Pqb/DllSvfIquMtf0bTpT3zMtRXj3BLk1ZXW2EZvmr2tpXn9oVLAFUFBScC+Dt/alk8vif2zRWoC54o5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142941; c=relaxed/simple;
	bh=5u7dpTbEYwFyIQuIi1PnbleoKreIXhqrmoVP9sIGIZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=smB+mIyaPYnPpnK1x38zFUnWrEWumAlnL4PiicJUQI7lvDrStBWrh/SNu/YKFn1+jxG7r63hZkTLZVoKY2tMT0R2zBcEBeQQlpYr5gMHTzBM0ymOf9NgOTEB9VAJaWaEWamUCWUhtML57BZ//MfnIN1c0GFZ0MKbdPjFmRrhW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XH/z1Zt2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XH/z1Zt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781142936; x=1812678936;
  h=date:from:to:cc:subject:message-id;
  bh=5u7dpTbEYwFyIQuIi1PnbleoKreIXhqrmoVP9sIGIZQ=;
  b=XH/z1Zt265fvohTx2C7fVvcg6KZv49aj6BXBnJzLqCP+NKQe5tCWQ14B
   T1TIk1xjgLKs/t1zgAS1kTqn6gEfFvUkjb0Wf2BcUIYeE6ru5aW705oss
   EqnibavhMQYsdyjPksWjhkXXW60/u32KCtBuCx6GMnH03lIrX7cYJ77ZL
   gqxOE64K3efzspxyKcs9hJsJIpGpF04pZYbQ1lk1rIed5g2OXRjkApK32
   xgWCXoyzD84gVGNxuxAVS2jQeAGvx+LtM6/znQCqLD6V6k7c5YnklXodp
   eYd492aPvJ0aBQ99xIAmUUFER8z221fg2sObjfEHK6+/zne89koBNRMj5
   Q==;
X-CSE-ConnectionGUID: IkdnmeoTQ4iYQoVluDoo2w==
X-CSE-MsgGUID: fkVdfmSyQGqfgBH6Fsctxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80964339"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="80964339"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:55:35 -0700
X-CSE-ConnectionGUID: KXXzgAZaTBuGaia94DZZQw==
X-CSE-MsgGUID: OokpJgYcReO9oCHZJGRmYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251255386"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2026 18:55:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUdn-00000000M9G-2JL9;
	Thu, 11 Jun 2026 01:55:31 +0000
Date: Thu, 11 Jun 2026 09:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4283/12670] drivers/dma/sun6i-dma.c:792
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line
 793)
Message-ID: <202606110958.2CPRMnM0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/12670] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 32 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110958.2CPRMnM0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606110958.2CPRMnM0-lkp@intel.com/

smatch warnings:
drivers/dma/sun6i-dma.c:792 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
drivers/dma/sun6i-dma.c:873 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 874)

vim +/v_lli +792 drivers/dma/sun6i-dma.c

555859308723d8 Maxime Ripard       2014-07-17  714  
555859308723d8 Maxime Ripard       2014-07-17  715  static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
555859308723d8 Maxime Ripard       2014-07-17  716  		struct dma_chan *chan, struct scatterlist *sgl,
555859308723d8 Maxime Ripard       2014-07-17  717  		unsigned int sg_len, enum dma_transfer_direction dir,
555859308723d8 Maxime Ripard       2014-07-17  718  		unsigned long flags, void *context)
555859308723d8 Maxime Ripard       2014-07-17  719  {
555859308723d8 Maxime Ripard       2014-07-17  720  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
555859308723d8 Maxime Ripard       2014-07-17  721  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
555859308723d8 Maxime Ripard       2014-07-17  722  	struct dma_slave_config *sconfig = &vchan->cfg;
555859308723d8 Maxime Ripard       2014-07-17  723  	struct sun6i_dma_lli *v_lli, *prev = NULL;
555859308723d8 Maxime Ripard       2014-07-17  724  	struct sun6i_desc *txd;
555859308723d8 Maxime Ripard       2014-07-17  725  	struct scatterlist *sg;
555859308723d8 Maxime Ripard       2014-07-17  726  	dma_addr_t p_lli;
52c871798ff84b Jean-Francois Moine 2016-04-22  727  	u32 lli_cfg;
555859308723d8 Maxime Ripard       2014-07-17  728  	int i, ret;
555859308723d8 Maxime Ripard       2014-07-17  729  
555859308723d8 Maxime Ripard       2014-07-17  730  	if (!sgl)
555859308723d8 Maxime Ripard       2014-07-17  731  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  732  
52c871798ff84b Jean-Francois Moine 2016-04-22  733  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
52c871798ff84b Jean-Francois Moine 2016-04-22  734  	if (ret) {
52c871798ff84b Jean-Francois Moine 2016-04-22  735  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
52c871798ff84b Jean-Francois Moine 2016-04-22  736  		return NULL;
52c871798ff84b Jean-Francois Moine 2016-04-22  737  	}
52c871798ff84b Jean-Francois Moine 2016-04-22  738  
69050f8d6d075d Kees Cook           2026-02-20  739  	txd = kzalloc_obj(*txd, GFP_NOWAIT);
555859308723d8 Maxime Ripard       2014-07-17  740  	if (!txd)
555859308723d8 Maxime Ripard       2014-07-17  741  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  742  
555859308723d8 Maxime Ripard       2014-07-17  743  	for_each_sg(sgl, sg, sg_len, i) {
ec31c5c5949275 Samuel Holland      2022-04-24  744  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  745  		if (!v_lli)
4fbd804e009ae9 Maxime Ripard       2014-07-30  746  			goto err_lli_free;
555859308723d8 Maxime Ripard       2014-07-17  747  
52c871798ff84b Jean-Francois Moine 2016-04-22  748  		v_lli->len = sg_dma_len(sg);
52c871798ff84b Jean-Francois Moine 2016-04-22  749  		v_lli->para = NORMAL_WAIT;
555859308723d8 Maxime Ripard       2014-07-17  750  
52c871798ff84b Jean-Francois Moine 2016-04-22  751  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  752  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  753  					   sg_dma_address(sg),
ec31c5c5949275 Samuel Holland      2022-04-24  754  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  755  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  756  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  757  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
555859308723d8 Maxime Ripard       2014-07-17  758  
555859308723d8 Maxime Ripard       2014-07-17  759  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  760  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  761  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  762  				&sconfig->dst_addr, &sg_dma_address(sg),
555859308723d8 Maxime Ripard       2014-07-17  763  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  764  
555859308723d8 Maxime Ripard       2014-07-17  765  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  766  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  767  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  768  					   sg_dma_address(sg));
802440bdf3b787 Jernej Skrabec      2019-05-27  769  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  770  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  771  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
555859308723d8 Maxime Ripard       2014-07-17  772  
555859308723d8 Maxime Ripard       2014-07-17  773  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  774  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  775  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  776  				&sg_dma_address(sg), &sconfig->src_addr,
555859308723d8 Maxime Ripard       2014-07-17  777  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  778  		}
555859308723d8 Maxime Ripard       2014-07-17  779  
555859308723d8 Maxime Ripard       2014-07-17  780  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
555859308723d8 Maxime Ripard       2014-07-17  781  	}
555859308723d8 Maxime Ripard       2014-07-17  782  
555859308723d8 Maxime Ripard       2014-07-17  783  	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
9aa48806edb8c3 Samuel Holland      2022-04-24  784  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24  785  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  786  		sun6i_dma_dump_lli(vchan, v_lli, p_lli);
555859308723d8 Maxime Ripard       2014-07-17  787  
555859308723d8 Maxime Ripard       2014-07-17  788  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
555859308723d8 Maxime Ripard       2014-07-17  789  
4fbd804e009ae9 Maxime Ripard       2014-07-30  790  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  791  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @792  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24 @793  		dma_pool_free(sdev->pool, v_lli, p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  794  	kfree(txd);
555859308723d8 Maxime Ripard       2014-07-17  795  	return NULL;
555859308723d8 Maxime Ripard       2014-07-17  796  }
555859308723d8 Maxime Ripard       2014-07-17  797  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
a90e173f3faf29 Jean-Francois Moine 2016-04-28  799  					struct dma_chan *chan,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  800  					dma_addr_t buf_addr,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  801  					size_t buf_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  802  					size_t period_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  803  					enum dma_transfer_direction dir,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  804  					unsigned long flags)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  806  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  807  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  808  	struct dma_slave_config *sconfig = &vchan->cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  809  	struct sun6i_dma_lli *v_lli, *prev = NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  810  	struct sun6i_desc *txd;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  811  	dma_addr_t p_lli;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  812  	u32 lli_cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  813  	unsigned int i, periods = buf_len / period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  814  	int ret;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  815  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  816  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  817  	if (ret) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  818  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  819  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  820  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  821  
69050f8d6d075d Kees Cook           2026-02-20  822  	txd = kzalloc_obj(*txd, GFP_NOWAIT);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  823  	if (!txd)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  824  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  825  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  826  	for (i = 0; i < periods; i++) {
ec31c5c5949275 Samuel Holland      2022-04-24  827  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  828  		if (!v_lli) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  829  			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  830  			goto err_lli_free;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  831  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  832  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  833  		v_lli->len = period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  834  		v_lli->para = NORMAL_WAIT;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  835  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  836  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  837  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  838  					   buf_addr + period_len * i,
ec31c5c5949275 Samuel Holland      2022-04-24  839  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  840  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  841  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  842  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  843  			dev_dbg(chan2dev(chan),
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  844  				"%s; chan: %d, dest: %pad, src: %pad, len: %zu. flags: 0x%08lx\n",
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  845  				__func__, vchan->vc.chan.chan_id,
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  846  				&sconfig->dst_addr, &buf_addr,
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  847  				buf_len, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  848  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  849  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  850  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  851  					   buf_addr + period_len * i);
802440bdf3b787 Jernej Skrabec      2019-05-27  852  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  853  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  854  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  855  			dev_dbg(chan2dev(chan),
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  856  				"%s; chan: %d, dest: %pad, src: %pad, len: %zu. flags: 0x%08lx\n",
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  857  				__func__, vchan->vc.chan.chan_id,
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  858  				&buf_addr, &sconfig->src_addr,
7105e968d1f6f6 Chen-Yu Tsai        2025-12-21  859  				buf_len, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  860  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  861  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  862  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  863  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  864  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  865  	prev->p_lli_next = txd->p_lli;		/* cyclic list */
a90e173f3faf29 Jean-Francois Moine 2016-04-28  866  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  867  	vchan->cyclic = true;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  868  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  869  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  870  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  871  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  872  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @873  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24 @874  		dma_pool_free(sdev->pool, v_lli, p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  875  	kfree(txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  876  	return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  877  }
a90e173f3faf29 Jean-Francois Moine 2016-04-28  878  

:::::: The code at line 792 was first introduced by commit
:::::: 9aa48806edb8c37e82532dbc6098b03f6bd4245e dmaengine: sun6i: Do not use virt_to_phys

:::::: TO: Samuel Holland <samuel@sholland.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
