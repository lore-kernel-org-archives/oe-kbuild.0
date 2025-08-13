Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6FD1369B4
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 00:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755046643; cv=none; b=TqRBvo7YCmIctbfqhdJHZ1UV7N5kEWwG5saafzq8bjSSY4biyPgDsD25HwO/8ZVBRnI02Z3YqM/nCdPSUvWDiLijJe0sU/+DQt9NL3WOxbhHvU23dYx8LrgvsXmwT/cK3lEMRdHRpCwc6XXjuemyCRFIzffZzvSKqRY4i87dga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755046643; c=relaxed/simple;
	bh=8AGZH6k8tkOw6CpbeJsXyzrE1qUv0iE/c/6q/qRzaz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYNFUN4OEUZN8sZ80S6iaEQ458ZGB9RuQx+ec5PveDbuR1j1DHHoF+y8tqpD0DPCmFIRy2AbrC/VIvFVnHBDEEhXMHihvZq5EFxVhoKD4xs1t6Lzr4XATvplryytr04il9LU/XsmLqlVtgTZXuXR3yBBoTVssdw12HB6SNo1Ei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loERJsQO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loERJsQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755046642; x=1786582642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AGZH6k8tkOw6CpbeJsXyzrE1qUv0iE/c/6q/qRzaz4=;
  b=loERJsQOMVRqFIe0Lg1kaVVsS1gT0zA/ARopvJUS7tzj5F5VLzPD0ITU
   VM60XI5jah9SO7fmJF7/k2s5dYqzAHOP1y7AeRlcU26Hr1ulCBmBPm7cB
   pty/LQN0jit5vDpuxvmTHwG9ZW6sbMjum5vKKFiXKbua2DMAsYdTek5ga
   jVs1OrmfTXpk4ZWgupYIfiymcMxVdaN6z1ANBhd2WpZbAL12DAciCfRRZ
   p+bNnHfm+dH+pEkBANo2RENRlt8d43NV4vtER9mHW/MVmojrfMOcuQgkY
   6tqXfwDl51lsonsQkhM6EBSg/pBu5ygkpI2ji/eu1a/Ta9ZDnkgvd9N91
   w==;
X-CSE-ConnectionGUID: D6sddFM/Qzuc4fANg1QQfg==
X-CSE-MsgGUID: LSQBgaOIQjyXJjCgaeKlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68705644"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68705644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 17:57:18 -0700
X-CSE-ConnectionGUID: ZPpKZs88Q8qZxLSX7MK9hw==
X-CSE-MsgGUID: 6DtekzoIQiqF0TUCpSFJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166703122"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2025 17:57:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulznQ-0009QM-31;
	Wed, 13 Aug 2025 00:56:55 +0000
Date: Wed, 13 Aug 2025 08:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sbates130272-p2pmem:switchtec-dma-v9 2/3]
 drivers/dma/switchtec_dma.c:429 switchtec_dma_cleanup_completed() error:
 uninitialized symbol 'i'.
Message-ID: <202508130828.LQq27XRK-lkp@intel.com>
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
TO: Logan Gunthorpe <logang@deltatee.com>
CC: Kelvin Cao <kelvin.cao@microchip.com>
CC: George Ge <george.ge@microchip.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-v9
head:   9c53658085c7c2f6dd1707ba385702659ec58ddf
commit: 969ba8a3fe0ed09d888d754bd416c6e96f3366ba [2/3] dmaengine: switchtec-dma: Implement hardware initialization and cleanup
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130828.LQq27XRK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508130828.LQq27XRK-lkp@intel.com/

smatch warnings:
drivers/dma/switchtec_dma.c:429 switchtec_dma_cleanup_completed() error: uninitialized symbol 'i'.
drivers/dma/switchtec_dma.c:1099 switchtec_dma_create() warn: 'irq' from pci_request_irq() not released on lines: 1099.

vim +/i +429 drivers/dma/switchtec_dma.c

969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  396  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  397  static void
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  398  switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  399  {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  400  	struct device *chan_dev = &swdma_chan->dma_chan.dev->device;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  401  	struct switchtec_dma_desc *desc;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  402  	struct switchtec_dma_hw_ce *ce;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  403  	struct dmaengine_result res;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  404  	int tail, cid, se_idx, i;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  405  	__le16 phase_tag;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  406  	u32 sts_code;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  407  	__le32 *p;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  408  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  409  	do {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  410  		spin_lock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  411  		if (!swdma_chan->comp_ring_active) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  412  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  413  			break;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  414  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  415  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  416  		ce = &swdma_chan->hw_cq[swdma_chan->cq_tail];
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  417  		/*
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  418  		 * phase_tag is updated by hardware, ensure the value is
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  419  		 * not from the cache
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  420  		 */
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  421  		phase_tag = smp_load_acquire(&ce->phase_tag);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  422  		if (le16_to_cpu(phase_tag) == swdma_chan->phase_tag) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  423  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  424  			break;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  425  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  426  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  427  		cid = le16_to_cpu(ce->cid);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  428  		se_idx = cid & (SWITCHTEC_DMA_SQ_SIZE - 1);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05 @429  		desc = swdma_chan->desc_ring[i];
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  430  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  431  		tail = swdma_chan->tail;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  432  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  433  		res.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  434  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  435  		sts_code = le32_to_cpu(ce->sts_code);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  436  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  437  		if (!(sts_code & SWITCHTEC_CE_SC_MASK)) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  438  			res.result = DMA_TRANS_NOERROR;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  439  		} else {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  440  			if (sts_code & SWITCHTEC_CE_SC_D_RD_CTO)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  441  				res.result = DMA_TRANS_READ_FAILED;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  442  			else
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  443  				res.result = DMA_TRANS_WRITE_FAILED;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  444  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  445  			dev_err(chan_dev, "CID 0x%04x failed, SC 0x%08x\n", cid,
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  446  				(u32)(sts_code & SWITCHTEC_CE_SC_MASK));
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  447  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  448  			p = (__le32 *)ce;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  449  			for (i = 0; i < sizeof(*ce) / 4; i++) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  450  				dev_err(chan_dev, "CE DW%d: 0x%08x\n", i,
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  451  					le32_to_cpu(*p));
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  452  				p++;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  453  			}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  454  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  455  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  456  		desc->completed = true;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  457  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  458  		swdma_chan->cq_tail++;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  459  		swdma_chan->cq_tail &= SWITCHTEC_DMA_CQ_SIZE - 1;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  460  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  461  		rcu_read_lock();
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  462  		if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  463  			rcu_read_unlock();
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  464  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  465  			return;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  466  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  467  		writew(swdma_chan->cq_tail, &swdma_chan->mmio_chan_hw->cq_head);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  468  		rcu_read_unlock();
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  469  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  470  		if (swdma_chan->cq_tail == 0)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  471  			swdma_chan->phase_tag = !swdma_chan->phase_tag;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  472  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  473  		/*  Out of order CE */
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  474  		if (se_idx != tail) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  475  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  476  			continue;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  477  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  478  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  479  		do {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  480  			dma_cookie_complete(&desc->txd);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  481  			dma_descriptor_unmap(&desc->txd);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  482  			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  483  			desc->txd.callback = NULL;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  484  			desc->txd.callback_result = NULL;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  485  			desc->completed = false;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  486  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  487  			tail++;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  488  			tail &= SWITCHTEC_DMA_SQ_SIZE - 1;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  489  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  490  			/*
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  491  			 * Ensure the desc updates are visible before updating
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  492  			 * the tail index
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  493  			 */
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  494  			smp_store_release(&swdma_chan->tail, tail);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  495  			desc = swdma_chan->desc_ring[swdma_chan->tail];
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  496  			if (!desc->completed)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  497  				break;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  498  		} while (CIRC_CNT(READ_ONCE(swdma_chan->head), swdma_chan->tail,
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  499  				  SWITCHTEC_DMA_SQ_SIZE));
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  500  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  501  		spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  502  	} while (1);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  503  }
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  504  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
