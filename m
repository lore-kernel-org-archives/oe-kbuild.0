Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE44273FE
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695064913; x=1726600913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVNtVM48FnYRAKq/i+NKy0snyXzARZ/Wy7GgfmmtZFw=;
  b=marS3m03UImMt33NIfCOUKrufNLnH9EH+qFnMh4aMPTUXXpKP025VkgM
   Y5iDvX3c5AAjL7yky2wH4P/cUzWYQ8TY2c1Hmrfk++opofEKBRWTA0YID
   HRhe98UznErCXsmJQNCJRhDiATZVoZr/c/SA4Cepj1j3GAhrEgFxqH4y4
   KQJluzASmj92s1x4Yiam+AINWnV44ZmgpzPvgB4vz52eYlshOX4A6Ev7N
   HxNSNlgUgv9V4ublXkIY+IGteVyPrj0ZFwcwy0WgHNjnAGbw0f2JOuDz5
   O8vdkjBbmqULzchKvBKPPhbrjaofXLrAyd8X6opYl+jeUHg4L91AJ5NSK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446210776"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="446210776"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 12:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836146843"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="836146843"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 12:21:51 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiJoa-0006Oi-36;
	Mon, 18 Sep 2023 19:21:49 +0000
Date: Tue, 19 Sep 2023 03:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/dma/swiotlb.c:581 swiotlb_alloc_tlb() warn: ignoring
 unreachable code.
Message-ID: <202309190334.Lr7ejWXE-lkp@intel.com>
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
:::::: branch date: 22 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141-20230918 (https://download.01.org/0day-ci/archive/20230919/202309190334.Lr7ejWXE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309190334.Lr7ejWXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309190334.Lr7ejWXE-lkp@intel.com/

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
