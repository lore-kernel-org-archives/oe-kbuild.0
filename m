Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D371754B
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742720501; cv=none; b=FQ/uj6m0EnwP+Vk+Fw5QLRUC77rFB0Ho6fzi66XPr0oXqBpRh12GQNgAOQaoU7GHRiGcKpGiV8x450YxIGBVYahbe/c6dXAAiSwwLxWMU9Dd61iujXJDXqC/KUD9PIc8wzf/MTAAFXbH1q7g/htamMWV6fULgNMkaJEgf4mOEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742720501; c=relaxed/simple;
	bh=KZyYIgu6rL+2ojw+n4yYH1B9dK5t7gSSjcjo8lukH/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPjiEfNvbTrPlEXM4cAuOf5wFzsOe5LYdTlLELINeohEPXGYRsEK3Uj05v5dJTXjyJET+SzTPQUNg8N93qYqXSBxSyNCCQoLfceoCl1/9pjBTgEVEz7/sc9FQp216XykGCRDaffVlzIB1IOCtICydorsSAHLj+rkKHDpLsdUPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ies4o5bX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ies4o5bX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742720499; x=1774256499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZyYIgu6rL+2ojw+n4yYH1B9dK5t7gSSjcjo8lukH/g=;
  b=ies4o5bXnKbQs0bX3F/S3gcxAdS2oFZOfQdhx+VeOyMKKq7wS8rdTR98
   F1TurO1VofXpLuOglAINwsVRGEc2mBlMzL5cE+uE6PfY9ZwJjSrGDHrzE
   T/r9X4BrrYrai6A2//J0lY4gtHhCirp8FPDV6Lwe5+TCOksjCo32mvvvr
   iZ46YVTijWAljkQFpZ6twFPuGzf+lh1jCs7sSFopjJ/tqwao3yu1QCCxi
   2EIXd5IkPVv20gvIfMkmn0vzf9z4eXUpmEjrdtB3T34iZhas06RPV8MbV
   nggGsyCCJl8a0gqCPppjUaaFRRZ92iT5B8riCTEcIUtTvNz+UFhd4kDXF
   w==;
X-CSE-ConnectionGUID: 14dYlJtPTRSyrK9TWnzrVQ==
X-CSE-MsgGUID: JRG1uIoPSOq4CMeaTc7JIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43947469"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="43947469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 02:01:38 -0700
X-CSE-ConnectionGUID: td2SicEqRfe5CniwR2ffjQ==
X-CSE-MsgGUID: EYUQ+BDkTFyrmib7EVy0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="124238823"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2025 02:01:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twHCt-0002gF-1X;
	Sun, 23 Mar 2025 09:01:32 +0000
Date: Sun, 23 Mar 2025 17:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9040/13068]
 drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn:
 variable dereferenced before check 'desc' (see line 345)
Message-ID: <202503231648.IEt8P4U5-lkp@intel.com>
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
TO: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 6565439894570a07b00dba0b739729fe6b56fba4 [9040/13068] dmaengine: ptdma: Utilize the AE4DMA engine's multi-queue functionality
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231648.IEt8P4U5-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503231648.IEt8P4U5-lkp@intel.com/

smatch warnings:
drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn: variable dereferenced before check 'desc' (see line 345)

vim +/desc +358 drivers/dma/amd/ptdma/ptdma-dmaengine.c

b0b4a6b10577a2 drivers/dma/ptdma/ptdma-dmaengine.c     Sanjay R Mehta    2021-08-17  335  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  336  static void pt_cmd_callback_work(void *data, int err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  337  {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  338  	struct dma_async_tx_descriptor *tx_desc;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  339  	struct pt_dma_desc *desc = data;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  340  	struct dma_chan *dma_chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  341  	struct virt_dma_desc *vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  342  	struct pt_dma_chan *chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  343  	unsigned long flags;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  344  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @345  	dma_chan = desc->vd.tx.chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  346  	chan = to_pt_chan(dma_chan);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  347  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  348  	if (err == -EINPROGRESS)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  349  		return;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  350  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  351  	tx_desc = &desc->vd.tx;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  352  	vd = &desc->vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  353  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  354  	if (err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  355  		desc->status = DMA_ERROR;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  356  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  357  	spin_lock_irqsave(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @358  	if (desc) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  359  		if (desc->status != DMA_COMPLETE) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  360  			if (desc->status != DMA_ERROR)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  361  				desc->status = DMA_COMPLETE;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  362  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  363  			dma_cookie_complete(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  364  			dma_descriptor_unmap(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  365  		} else {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  366  			tx_desc = NULL;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  367  		}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  368  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  369  	spin_unlock_irqrestore(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  370  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  371  	if (tx_desc) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  372  		dmaengine_desc_get_callback_invoke(tx_desc, NULL);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  373  		dma_run_dependencies(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  374  		list_del(&desc->vd.node);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  375  		vchan_vdesc_fini(vd);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  376  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  377  }
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  378  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
