Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B751DAEC
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169412; cv=none; b=k1O5/E9slOVUztilt/4L5u5wKW7xglyGrWF7lL9CNdk8X/DMu4HPFNR6jtawXxDjb6MuXeLgAchhWjohEESjGnYEiigqXnSi53Dl40vDvWXeXN583WbHMioHAUEMqQA11Gos+j7GwArTsRZPvbrhZsM+tnAE8BzhQ5gyb0sSvnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169412; c=relaxed/simple;
	bh=fDYxGZGvpl8fjb9XO/zhtijK3e8Gu/xxKZOUQLrwmq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6SZl5+vO5NR/mCge7lMvs2M5g0QTD/lleBb/o1Lu9ftNsdLOCSZnQN9uxlvn72EZX59x2HyWUa20gQ4G3kPxnVWtVsN4Y9RrdqTEw21pryM3+gCFxEWv371NCCLPd1vrWSh/HqTBZCda/lX20ZiJxIvc4pWf76wbFWXsQp/bPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX4rh9lI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX4rh9lI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790169407; x=1821705407;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fDYxGZGvpl8fjb9XO/zhtijK3e8Gu/xxKZOUQLrwmq4=;
  b=MX4rh9lIahMF0Z0QGTf5mVmwHBmy7BthK2K0NYSsTWSd/0eKhwLneoDD
   qhO2rXDvM0gbteOlX64+4k9LHteYDCxH+HgDp0/TXv6flQBDRnH+E1rV6
   7c1qImKkE8ePDneaJaOBTqO7PpRPMTnqaqczEqiqbGHABeWBt7D7SqGqC
   CPR6qTrkPiVT251DJu61enOB1GhRYKhnPV7ImS+F0THFXXmc8caL/VgpJ
   Sy4lWGJ4GUYsLnlDF4P3kIfP15yLnlCbFt2LnUBMfX8tLtcTuqEWgeO5R
   tRHHHgxF5fOTvV9PZcQUNmwv/4LaKfB+FAN2iA4Z8kLQI3P1k/CCYYcVr
   w==;
X-CSE-ConnectionGUID: 4eD/Z8WvT+alJBjI3kKtAQ==
X-CSE-MsgGUID: MpBrLxltRzWB/rO/C5dDBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78417154"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78417154"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:16:46 -0700
X-CSE-ConnectionGUID: QNOWkijySI+tOQJKCIh55w==
X-CSE-MsgGUID: kEig2EIuTM6KQG0ucc3KUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4700086"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 06:16:45 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Mq2-000000000gl-3rL1;
	Wed, 23 Sep 2026 13:16:42 +0000
Date: Wed, 23 Sep 2026 15:16:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <202609231550.rY6WcsbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
References: <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
TO: "Benoît Monin" <benoit.monin@bootlin.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Vinod Koul <vkoul@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: imx@lists.linux.dev
CC: dmaengine@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Benoît Monin" <benoit.monin@bootlin.com>

Hi Benoît,

kernel test robot noticed the following build errors:

[auto build test ERROR on cee9395acd8043be0644b25c34bfa86623f2b935]

url:    https://github.com/intel-lab-lkp/linux/commits/Beno-t-Monin/dmaengine-fsl-edma-Implement-device_prep_peripheral_dma_vec/20260911-151136
base:   cee9395acd8043be0644b25c34bfa86623f2b935
patch link:    https://lore.kernel.org/r/20260911-fsl-edma-dyn-sg-v10-2-700eb72def57%40bootlin.com
patch subject: [PATCH v10 2/2] dmaengine: fsl-edma: Support dynamic scatter/gather chaining
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: sparc-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231550.rY6WcsbN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231550.rY6WcsbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609231550.rY6WcsbN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/fsl-edma-common.c: In function 'fsl_edma_prep_peripheral_dma_vec':
>> drivers/dma/fsl-edma-common.c:758:55: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
     758 |                 if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
         |                                                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_MAX +758 drivers/dma/fsl-edma-common.c

9d831528a6567d Angelo Dureghello 2018-08-19  675  
526bb30b847c23 Benoît Monin      2026-09-11  676  struct dma_async_tx_descriptor *
526bb30b847c23 Benoît Monin      2026-09-11  677  fsl_edma_prep_peripheral_dma_vec(struct dma_chan *chan, const struct dma_vec *vecs,
526bb30b847c23 Benoît Monin      2026-09-11  678  				 size_t nb, enum dma_transfer_direction direction,
526bb30b847c23 Benoît Monin      2026-09-11  679  				 unsigned long flags)
526bb30b847c23 Benoît Monin      2026-09-11  680  {
526bb30b847c23 Benoît Monin      2026-09-11  681  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
526bb30b847c23 Benoît Monin      2026-09-11  682  	dma_addr_t src_addr, dst_addr, last_sg;
526bb30b847c23 Benoît Monin      2026-09-11  683  	struct fsl_edma_desc *fsl_desc;
526bb30b847c23 Benoît Monin      2026-09-11  684  	u16 soff, doff, iter;
526bb30b847c23 Benoît Monin      2026-09-11  685  	u32 nbytes;
526bb30b847c23 Benoît Monin      2026-09-11  686  	int i;
526bb30b847c23 Benoît Monin      2026-09-11  687  
526bb30b847c23 Benoît Monin      2026-09-11  688  	if (!is_slave_direction(direction))
526bb30b847c23 Benoît Monin      2026-09-11  689  		return NULL;
526bb30b847c23 Benoît Monin      2026-09-11  690  
526bb30b847c23 Benoît Monin      2026-09-11  691  	if (!fsl_edma_prep_slave_dma(fsl_chan, direction))
526bb30b847c23 Benoît Monin      2026-09-11  692  		return NULL;
526bb30b847c23 Benoît Monin      2026-09-11  693  
526bb30b847c23 Benoît Monin      2026-09-11  694  	fsl_desc = fsl_edma_alloc_desc(fsl_chan, nb);
526bb30b847c23 Benoît Monin      2026-09-11  695  	if (!fsl_desc)
526bb30b847c23 Benoît Monin      2026-09-11  696  		return NULL;
526bb30b847c23 Benoît Monin      2026-09-11  697  	fsl_desc->iscyclic = flags & DMA_PREP_REPEAT;
526bb30b847c23 Benoît Monin      2026-09-11  698  	fsl_desc->dirn = direction;
526bb30b847c23 Benoît Monin      2026-09-11  699  
526bb30b847c23 Benoît Monin      2026-09-11  700  	if (direction == DMA_MEM_TO_DEV) {
526bb30b847c23 Benoît Monin      2026-09-11  701  		if (!fsl_chan->cfg.src_addr_width)
526bb30b847c23 Benoît Monin      2026-09-11  702  			fsl_chan->cfg.src_addr_width = fsl_chan->cfg.dst_addr_width;
526bb30b847c23 Benoît Monin      2026-09-11  703  		fsl_chan->attr =
526bb30b847c23 Benoît Monin      2026-09-11  704  			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
526bb30b847c23 Benoît Monin      2026-09-11  705  					      fsl_chan->cfg.dst_addr_width);
526bb30b847c23 Benoît Monin      2026-09-11  706  		nbytes = fsl_chan->cfg.dst_addr_width * fsl_chan->cfg.dst_maxburst;
526bb30b847c23 Benoît Monin      2026-09-11  707  	} else {
526bb30b847c23 Benoît Monin      2026-09-11  708  		if (!fsl_chan->cfg.dst_addr_width)
526bb30b847c23 Benoît Monin      2026-09-11  709  			fsl_chan->cfg.dst_addr_width = fsl_chan->cfg.src_addr_width;
526bb30b847c23 Benoît Monin      2026-09-11  710  		fsl_chan->attr =
526bb30b847c23 Benoît Monin      2026-09-11  711  			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
526bb30b847c23 Benoît Monin      2026-09-11  712  					      fsl_chan->cfg.dst_addr_width);
526bb30b847c23 Benoît Monin      2026-09-11  713  		nbytes = fsl_chan->cfg.src_addr_width * fsl_chan->cfg.src_maxburst;
526bb30b847c23 Benoît Monin      2026-09-11  714  	}
526bb30b847c23 Benoît Monin      2026-09-11  715  
526bb30b847c23 Benoît Monin      2026-09-11  716  	for (i = 0; i < nb; i++) {
526bb30b847c23 Benoît Monin      2026-09-11  717  		if (direction == DMA_MEM_TO_DEV) {
526bb30b847c23 Benoît Monin      2026-09-11  718  			src_addr = vecs[i].addr;
526bb30b847c23 Benoît Monin      2026-09-11  719  			dst_addr = fsl_chan->dma_dev_addr;
526bb30b847c23 Benoît Monin      2026-09-11  720  			soff = fsl_chan->cfg.dst_addr_width;
526bb30b847c23 Benoît Monin      2026-09-11  721  			doff = 0;
526bb30b847c23 Benoît Monin      2026-09-11  722  		} else if (direction == DMA_DEV_TO_MEM) {
526bb30b847c23 Benoît Monin      2026-09-11  723  			src_addr = fsl_chan->dma_dev_addr;
526bb30b847c23 Benoît Monin      2026-09-11  724  			dst_addr = vecs[i].addr;
526bb30b847c23 Benoît Monin      2026-09-11  725  			soff = 0;
526bb30b847c23 Benoît Monin      2026-09-11  726  			doff = fsl_chan->cfg.src_addr_width;
526bb30b847c23 Benoît Monin      2026-09-11  727  		} else {
526bb30b847c23 Benoît Monin      2026-09-11  728  			/* DMA_DEV_TO_DEV */
526bb30b847c23 Benoît Monin      2026-09-11  729  			src_addr = fsl_chan->cfg.src_addr;
526bb30b847c23 Benoît Monin      2026-09-11  730  			dst_addr = fsl_chan->cfg.dst_addr;
526bb30b847c23 Benoît Monin      2026-09-11  731  			soff = 0;
526bb30b847c23 Benoît Monin      2026-09-11  732  			doff = 0;
526bb30b847c23 Benoît Monin      2026-09-11  733  		}
526bb30b847c23 Benoît Monin      2026-09-11  734  
526bb30b847c23 Benoît Monin      2026-09-11  735  		/*
526bb30b847c23 Benoît Monin      2026-09-11  736  		 * Choose the suitable burst length if dma_vec length is not
526bb30b847c23 Benoît Monin      2026-09-11  737  		 * multiple of burst length so that the whole transfer length is
526bb30b847c23 Benoît Monin      2026-09-11  738  		 * multiple of minor loop(burst length).
526bb30b847c23 Benoît Monin      2026-09-11  739  		 */
526bb30b847c23 Benoît Monin      2026-09-11  740  		if (nbytes && vecs[i].len % nbytes) {
526bb30b847c23 Benoît Monin      2026-09-11  741  			u32 width = (direction == DMA_DEV_TO_MEM) ? doff : soff;
526bb30b847c23 Benoît Monin      2026-09-11  742  			u32 burst = (direction == DMA_DEV_TO_MEM) ?
526bb30b847c23 Benoît Monin      2026-09-11  743  						fsl_chan->cfg.src_maxburst :
526bb30b847c23 Benoît Monin      2026-09-11  744  						fsl_chan->cfg.dst_maxburst;
526bb30b847c23 Benoît Monin      2026-09-11  745  			int j;
526bb30b847c23 Benoît Monin      2026-09-11  746  
526bb30b847c23 Benoît Monin      2026-09-11  747  			for (j = burst; j > 1; j--) {
526bb30b847c23 Benoît Monin      2026-09-11  748  				if (!(vecs[i].len % (j * width))) {
526bb30b847c23 Benoît Monin      2026-09-11  749  					nbytes = j * width;
526bb30b847c23 Benoît Monin      2026-09-11  750  					break;
526bb30b847c23 Benoît Monin      2026-09-11  751  				}
526bb30b847c23 Benoît Monin      2026-09-11  752  			}
526bb30b847c23 Benoît Monin      2026-09-11  753  			/* Set burst size as 1 if there's no suitable one */
526bb30b847c23 Benoît Monin      2026-09-11  754  			if (j == 1)
526bb30b847c23 Benoît Monin      2026-09-11  755  				nbytes = width;
526bb30b847c23 Benoît Monin      2026-09-11  756  		}
526bb30b847c23 Benoît Monin      2026-09-11  757  
526bb30b847c23 Benoît Monin      2026-09-11 @758  		if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
526bb30b847c23 Benoît Monin      2026-09-11  759  			goto err_free_desc;
526bb30b847c23 Benoît Monin      2026-09-11  760  
526bb30b847c23 Benoît Monin      2026-09-11  761  		iter = vecs[i].len / nbytes;
526bb30b847c23 Benoît Monin      2026-09-11  762  		if (i < nb - 1) {
526bb30b847c23 Benoît Monin      2026-09-11  763  			last_sg = fsl_desc->tcd[(i + 1)].ptcd;
526bb30b847c23 Benoît Monin      2026-09-11  764  			fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
526bb30b847c23 Benoît Monin      2026-09-11  765  					  dst_addr, fsl_chan->attr, soff,
526bb30b847c23 Benoît Monin      2026-09-11  766  					  nbytes, 0, iter, iter, doff, last_sg,
526bb30b847c23 Benoît Monin      2026-09-11  767  					  false, false, true);
526bb30b847c23 Benoît Monin      2026-09-11  768  		} else {
526bb30b847c23 Benoît Monin      2026-09-11  769  			if (fsl_desc->iscyclic) {
526bb30b847c23 Benoît Monin      2026-09-11  770  				last_sg = fsl_desc->tcd[0].ptcd;
526bb30b847c23 Benoît Monin      2026-09-11  771  				fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
526bb30b847c23 Benoît Monin      2026-09-11  772  						  dst_addr, fsl_chan->attr, soff,
526bb30b847c23 Benoît Monin      2026-09-11  773  						  nbytes, 0, iter, iter, doff, last_sg,
526bb30b847c23 Benoît Monin      2026-09-11  774  						  true, false, true);
526bb30b847c23 Benoît Monin      2026-09-11  775  			} else {
526bb30b847c23 Benoît Monin      2026-09-11  776  				last_sg = 0;
526bb30b847c23 Benoît Monin      2026-09-11  777  				fsl_edma_fill_tcd(fsl_chan, fsl_desc->tcd[i].vtcd, src_addr,
526bb30b847c23 Benoît Monin      2026-09-11  778  						  dst_addr, fsl_chan->attr, soff,
526bb30b847c23 Benoît Monin      2026-09-11  779  						  nbytes, 0, iter, iter, doff, last_sg,
526bb30b847c23 Benoît Monin      2026-09-11  780  						  true, true, false);
526bb30b847c23 Benoît Monin      2026-09-11  781  			}
526bb30b847c23 Benoît Monin      2026-09-11  782  		}
526bb30b847c23 Benoît Monin      2026-09-11  783  	}
526bb30b847c23 Benoît Monin      2026-09-11  784  
526bb30b847c23 Benoît Monin      2026-09-11  785  	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
526bb30b847c23 Benoît Monin      2026-09-11  786  
526bb30b847c23 Benoît Monin      2026-09-11  787  err_free_desc:
526bb30b847c23 Benoît Monin      2026-09-11  788  	fsl_edma_free_desc(&fsl_desc->vdesc);
526bb30b847c23 Benoît Monin      2026-09-11  789  	return NULL;
526bb30b847c23 Benoît Monin      2026-09-11  790  }
526bb30b847c23 Benoît Monin      2026-09-11  791  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
