Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB65D461
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711448400; cv=none; b=fyD2bVTmbp2qReTYZgdn/Mhzxz3loh3Tegh11rDyiU6R0nueMzdjDeuEQ8WS+Vbyq82xbx/rw2dqATHrKUm3+6ZiI12WbSkdaaq3nV5Dq8y9Q9Tca1H/qUDy4PKzXCSo42kvPKEZOHHltiEloxLcx/nI89kfgXYfiuY9AOxzShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711448400; c=relaxed/simple;
	bh=ha3hgbYA+n6Pys8Dm6f7QYZUhWDpt5Kk35QRaOnKBjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPdNYxPTpFNh4cvdviHeV0dJYg9D2CxSB0RC0ei8U6W4+bm/8FCUKtGMuDilBKVlV+PIuALM3jwVTrf/bgFK02a3IHiY/VdXlywZhwYC4dZx83/VtMULl7PnBm3dWQV1XWj6L783mb8NPxO4uRMbrUrvg3nv6QG9c8MDXXEPbGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJHxV8Y1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJHxV8Y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711448398; x=1742984398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ha3hgbYA+n6Pys8Dm6f7QYZUhWDpt5Kk35QRaOnKBjQ=;
  b=JJHxV8Y11KeY4YHsEB2MSjTPX6eL0Nxpk4g9wtxF2pQd6tQqo7Rq3e2q
   ucLRN+QYqHV/NseCaVsEhPI/jFZvUS7Bq59NuYjqkBIpQvp6pmXXLqPQT
   jmG3HR5Y2214AXnvTx9d0aUxt3GeEbvOtigYZeoBQyGmUSUkdHVkyADtb
   Q1w8KIOCngo4IVl75+veoyD6TFzPJ1MxkxrLUnTJMimw9TP4ipDyznDXn
   N9uAjRgqkJuD9PUWfu1Lzyhx9vxD5V3NhGz4y3SkBjA8O13enW+LSKXcE
   KLpOIJ2CfBebw4FOP2QcIaACQujAZrVZM57G6LNWOZnnCoRiA+JQ40W6g
   A==;
X-CSE-ConnectionGUID: lzJ95uMrSLisXuNJR0LzIA==
X-CSE-MsgGUID: WuTXUI+bQ2mJYvcshvJwbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="31926824"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="31926824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 03:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="15954053"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2024 03:19:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp3uK-000NIk-2o;
	Tue, 26 Mar 2024 10:19:52 +0000
Date: Tue, 26 Mar 2024 18:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1083/1266] drivers/dma/sun6i-dma.c:777
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli'
Message-ID: <202403261808.c8ovEmC1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   084c8e315db34b59d38d06e684b1a0dd07d30287
commit: c64e38ed88d13557ebeb4cb8def02390a8f3dfc4 [1083/1266] mm/slab: enable slab allocation tagging for kmalloc and friends
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261808.c8ovEmC1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403261808.c8ovEmC1-lkp@intel.com/

smatch warnings:
drivers/dma/sun6i-dma.c:777 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli'
drivers/dma/sun6i-dma.c:848 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli'

vim +/v_lli +777 drivers/dma/sun6i-dma.c

555859308723d8 Maxime Ripard       2014-07-17  699  
555859308723d8 Maxime Ripard       2014-07-17  700  static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
555859308723d8 Maxime Ripard       2014-07-17  701  		struct dma_chan *chan, struct scatterlist *sgl,
555859308723d8 Maxime Ripard       2014-07-17  702  		unsigned int sg_len, enum dma_transfer_direction dir,
555859308723d8 Maxime Ripard       2014-07-17  703  		unsigned long flags, void *context)
555859308723d8 Maxime Ripard       2014-07-17  704  {
555859308723d8 Maxime Ripard       2014-07-17  705  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
555859308723d8 Maxime Ripard       2014-07-17  706  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
555859308723d8 Maxime Ripard       2014-07-17  707  	struct dma_slave_config *sconfig = &vchan->cfg;
555859308723d8 Maxime Ripard       2014-07-17  708  	struct sun6i_dma_lli *v_lli, *prev = NULL;
555859308723d8 Maxime Ripard       2014-07-17  709  	struct sun6i_desc *txd;
555859308723d8 Maxime Ripard       2014-07-17  710  	struct scatterlist *sg;
555859308723d8 Maxime Ripard       2014-07-17  711  	dma_addr_t p_lli;
52c871798ff84b Jean-Francois Moine 2016-04-22  712  	u32 lli_cfg;
555859308723d8 Maxime Ripard       2014-07-17  713  	int i, ret;
555859308723d8 Maxime Ripard       2014-07-17  714  
555859308723d8 Maxime Ripard       2014-07-17  715  	if (!sgl)
555859308723d8 Maxime Ripard       2014-07-17  716  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  717  
52c871798ff84b Jean-Francois Moine 2016-04-22  718  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
52c871798ff84b Jean-Francois Moine 2016-04-22  719  	if (ret) {
52c871798ff84b Jean-Francois Moine 2016-04-22  720  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
52c871798ff84b Jean-Francois Moine 2016-04-22  721  		return NULL;
52c871798ff84b Jean-Francois Moine 2016-04-22  722  	}
52c871798ff84b Jean-Francois Moine 2016-04-22  723  
555859308723d8 Maxime Ripard       2014-07-17  724  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
555859308723d8 Maxime Ripard       2014-07-17  725  	if (!txd)
555859308723d8 Maxime Ripard       2014-07-17  726  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  727  
555859308723d8 Maxime Ripard       2014-07-17  728  	for_each_sg(sgl, sg, sg_len, i) {
ec31c5c5949275 Samuel Holland      2022-04-24  729  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  730  		if (!v_lli)
4fbd804e009ae9 Maxime Ripard       2014-07-30  731  			goto err_lli_free;
555859308723d8 Maxime Ripard       2014-07-17  732  
52c871798ff84b Jean-Francois Moine 2016-04-22  733  		v_lli->len = sg_dma_len(sg);
52c871798ff84b Jean-Francois Moine 2016-04-22  734  		v_lli->para = NORMAL_WAIT;
555859308723d8 Maxime Ripard       2014-07-17  735  
52c871798ff84b Jean-Francois Moine 2016-04-22  736  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  737  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  738  					   sg_dma_address(sg),
ec31c5c5949275 Samuel Holland      2022-04-24  739  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  740  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  741  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  742  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
555859308723d8 Maxime Ripard       2014-07-17  743  
555859308723d8 Maxime Ripard       2014-07-17  744  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  745  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  746  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  747  				&sconfig->dst_addr, &sg_dma_address(sg),
555859308723d8 Maxime Ripard       2014-07-17  748  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  749  
555859308723d8 Maxime Ripard       2014-07-17  750  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  751  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  752  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  753  					   sg_dma_address(sg));
802440bdf3b787 Jernej Skrabec      2019-05-27  754  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  755  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  756  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
555859308723d8 Maxime Ripard       2014-07-17  757  
555859308723d8 Maxime Ripard       2014-07-17  758  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  759  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  760  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  761  				&sg_dma_address(sg), &sconfig->src_addr,
555859308723d8 Maxime Ripard       2014-07-17  762  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  763  		}
555859308723d8 Maxime Ripard       2014-07-17  764  
555859308723d8 Maxime Ripard       2014-07-17  765  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
555859308723d8 Maxime Ripard       2014-07-17  766  	}
555859308723d8 Maxime Ripard       2014-07-17  767  
555859308723d8 Maxime Ripard       2014-07-17  768  	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
9aa48806edb8c3 Samuel Holland      2022-04-24  769  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24  770  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  771  		sun6i_dma_dump_lli(vchan, v_lli, p_lli);
555859308723d8 Maxime Ripard       2014-07-17  772  
555859308723d8 Maxime Ripard       2014-07-17  773  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
555859308723d8 Maxime Ripard       2014-07-17  774  
4fbd804e009ae9 Maxime Ripard       2014-07-30  775  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  776  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @777  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  778  		dma_pool_free(sdev->pool, v_lli, p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  779  	kfree(txd);
555859308723d8 Maxime Ripard       2014-07-17  780  	return NULL;
555859308723d8 Maxime Ripard       2014-07-17  781  }
555859308723d8 Maxime Ripard       2014-07-17  782  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  783  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
a90e173f3faf29 Jean-Francois Moine 2016-04-28  784  					struct dma_chan *chan,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  785  					dma_addr_t buf_addr,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  786  					size_t buf_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  787  					size_t period_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  788  					enum dma_transfer_direction dir,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  789  					unsigned long flags)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  790  {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  791  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  792  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  793  	struct dma_slave_config *sconfig = &vchan->cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  794  	struct sun6i_dma_lli *v_lli, *prev = NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  795  	struct sun6i_desc *txd;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  796  	dma_addr_t p_lli;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  797  	u32 lli_cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  	unsigned int i, periods = buf_len / period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  799  	int ret;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  800  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  801  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  802  	if (ret) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  803  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  804  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  806  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  807  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  808  	if (!txd)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  809  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  810  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  811  	for (i = 0; i < periods; i++) {
ec31c5c5949275 Samuel Holland      2022-04-24  812  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  813  		if (!v_lli) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  814  			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  815  			goto err_lli_free;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  816  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  817  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  818  		v_lli->len = period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  819  		v_lli->para = NORMAL_WAIT;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  820  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  821  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  822  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  823  					   buf_addr + period_len * i,
ec31c5c5949275 Samuel Holland      2022-04-24  824  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  825  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  826  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  827  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  828  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  829  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  830  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  831  					   buf_addr + period_len * i);
802440bdf3b787 Jernej Skrabec      2019-05-27  832  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  833  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  834  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  835  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  836  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  837  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  838  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  839  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  840  	prev->p_lli_next = txd->p_lli;		/* cyclic list */
a90e173f3faf29 Jean-Francois Moine 2016-04-28  841  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  842  	vchan->cyclic = true;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  843  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  844  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  845  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  846  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  847  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @848  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  849  		dma_pool_free(sdev->pool, v_lli, p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  850  	kfree(txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  851  	return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  852  }
a90e173f3faf29 Jean-Francois Moine 2016-04-28  853  

:::::: The code at line 777 was first introduced by commit
:::::: 9aa48806edb8c37e82532dbc6098b03f6bd4245e dmaengine: sun6i: Do not use virt_to_phys

:::::: TO: Samuel Holland <samuel@sholland.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
