Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF063CC
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695018583; x=1726554583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXX8NB5+p/mrfNySe6G9Cd7IwwCIFpMqvbg3qf5oSLw=;
  b=cMntua7UFxdJE0BHgnExlUufPPbT0xuFRevmu4wbKh9E6DY5dm6JDTmR
   ONe4GDMqYz9pWrjPOqC5Cd+mGx/75dTjvvjsN8ZVdVbnTkICe9l+ArgM2
   YxMTV/fBEN6TxCamQIrkpoAWWBTce/ky08Io0B/5L5ar3MrCz+scuWmNh
   3jt+CAXXTExQv+jNrmnT53wj46/JUGhUcOLsZY8W8aDzusTu/XfHSdUJz
   Er8sEjkopey0GtsLmv5MpLDKuMIRpv2AagSrJev7Yy6vUj14+n3Ebr5DM
   2fk+aSeA8yrat8rBu8SnzIEw/iaqU+I8D54EizwVWOVD6VcwXJcP0zezR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="378488783"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="378488783"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 23:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="815893837"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="815893837"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Sep 2023 23:29:23 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi7l3-0005om-0L;
	Mon, 18 Sep 2023 06:29:21 +0000
Date: Mon, 18 Sep 2023 14:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/dma/swiotlb.c:581 swiotlb_alloc_tlb() warn: ignoring
 unreachable code.
Message-ID: <202309181411.92op7wIZ-lkp@intel.com>
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
TO: Petr Tesarik <petr.tesarik.ext@huawei.com>
CC: Christoph Hellwig <hch@lst.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
commit: 79636caad3618e2b38457f6e298c9b31ba82b489 swiotlb: if swiotlb is full, fall back to a transient memory pool
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141-20230918 (https://download.01.org/0day-ci/archive/20230918/202309181411.92op7wIZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309181411.92op7wIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309181411.92op7wIZ-lkp@intel.com/

smatch warnings:
kernel/dma/swiotlb.c:581 swiotlb_alloc_tlb() warn: ignoring unreachable code.

vim +581 kernel/dma/swiotlb.c

79636caad3618e Petr Tesarik 2023-08-01  545  
79636caad3618e Petr Tesarik 2023-08-01  546  /**
79636caad3618e Petr Tesarik 2023-08-01  547   * swiotlb_alloc_tlb() - allocate a dynamic IO TLB buffer
79636caad3618e Petr Tesarik 2023-08-01  548   * @dev:	Device for which a memory pool is allocated.
79636caad3618e Petr Tesarik 2023-08-01  549   * @bytes:	Size of the buffer.
79636caad3618e Petr Tesarik 2023-08-01  550   * @phys_limit:	Maximum allowed physical address of the buffer.
79636caad3618e Petr Tesarik 2023-08-01  551   * @gfp:	GFP flags for the allocation.
79636caad3618e Petr Tesarik 2023-08-01  552   *
79636caad3618e Petr Tesarik 2023-08-01  553   * Return: Allocated pages, or %NULL on allocation failure.
79636caad3618e Petr Tesarik 2023-08-01  554   */
79636caad3618e Petr Tesarik 2023-08-01  555  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
79636caad3618e Petr Tesarik 2023-08-01  556  		u64 phys_limit, gfp_t gfp)
79636caad3618e Petr Tesarik 2023-08-01  557  {
79636caad3618e Petr Tesarik 2023-08-01  558  	struct page *page;
79636caad3618e Petr Tesarik 2023-08-01  559  
79636caad3618e Petr Tesarik 2023-08-01  560  	/*
79636caad3618e Petr Tesarik 2023-08-01  561  	 * Allocate from the atomic pools if memory is encrypted and
79636caad3618e Petr Tesarik 2023-08-01  562  	 * the allocation is atomic, because decrypting may block.
79636caad3618e Petr Tesarik 2023-08-01  563  	 */
79636caad3618e Petr Tesarik 2023-08-01  564  	if (!gfpflags_allow_blocking(gfp) && dev && force_dma_unencrypted(dev)) {
79636caad3618e Petr Tesarik 2023-08-01  565  		void *vaddr;
79636caad3618e Petr Tesarik 2023-08-01  566  
79636caad3618e Petr Tesarik 2023-08-01  567  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
79636caad3618e Petr Tesarik 2023-08-01  568  			return NULL;
79636caad3618e Petr Tesarik 2023-08-01  569  
79636caad3618e Petr Tesarik 2023-08-01  570  		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
79636caad3618e Petr Tesarik 2023-08-01  571  					   dma_coherent_ok);
79636caad3618e Petr Tesarik 2023-08-01  572  	}
79636caad3618e Petr Tesarik 2023-08-01  573  
79636caad3618e Petr Tesarik 2023-08-01  574  	gfp &= ~GFP_ZONEMASK;
79636caad3618e Petr Tesarik 2023-08-01  575  	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
79636caad3618e Petr Tesarik 2023-08-01  576  		gfp |= __GFP_DMA;
79636caad3618e Petr Tesarik 2023-08-01  577  	else if (phys_limit <= DMA_BIT_MASK(32))
79636caad3618e Petr Tesarik 2023-08-01  578  		gfp |= __GFP_DMA32;
79636caad3618e Petr Tesarik 2023-08-01  579  
79636caad3618e Petr Tesarik 2023-08-01  580  	while ((page = alloc_dma_pages(gfp, bytes)) &&
79636caad3618e Petr Tesarik 2023-08-01 @581  	       page_to_phys(page) + bytes - 1 > phys_limit) {
79636caad3618e Petr Tesarik 2023-08-01  582  		/* allocated, but too high */
79636caad3618e Petr Tesarik 2023-08-01  583  		__free_pages(page, get_order(bytes));
79636caad3618e Petr Tesarik 2023-08-01  584  
79636caad3618e Petr Tesarik 2023-08-01  585  		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
79636caad3618e Petr Tesarik 2023-08-01  586  		    phys_limit < DMA_BIT_MASK(64) &&
79636caad3618e Petr Tesarik 2023-08-01  587  		    !(gfp & (__GFP_DMA32 | __GFP_DMA)))
79636caad3618e Petr Tesarik 2023-08-01  588  			gfp |= __GFP_DMA32;
79636caad3618e Petr Tesarik 2023-08-01  589  		else if (IS_ENABLED(CONFIG_ZONE_DMA) &&
79636caad3618e Petr Tesarik 2023-08-01  590  			 !(gfp & __GFP_DMA))
79636caad3618e Petr Tesarik 2023-08-01  591  			gfp = (gfp & ~__GFP_DMA32) | __GFP_DMA;
79636caad3618e Petr Tesarik 2023-08-01  592  		else
79636caad3618e Petr Tesarik 2023-08-01  593  			return NULL;
79636caad3618e Petr Tesarik 2023-08-01  594  	}
79636caad3618e Petr Tesarik 2023-08-01  595  
79636caad3618e Petr Tesarik 2023-08-01  596  	return page;
79636caad3618e Petr Tesarik 2023-08-01  597  }
79636caad3618e Petr Tesarik 2023-08-01  598  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
