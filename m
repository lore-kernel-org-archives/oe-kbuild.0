Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3818B1A
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8RHKP8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701419249; x=1732955249;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cwvddZD4nxFVPnn5DSXCpSutUjGtt+dYlpQ1ChDvvbY=;
  b=F8RHKP8rfzCARPic/AMHa1VoRotRvajaB/VZ4WWLXl5nhLn5+gEWR6EE
   5EuWZDSPMVERX05Ll1uZtMi2PRuhwlnEcgqnjRt36clA6TtX9NGmwX7um
   aolUtIVMVkk9knORmHmvRkOSXuhrTyKXjJ+G/giF11ZbymW92wDV71Ejy
   ZBoDbnzsQI/pQwGzsH0EI6pFO+/kiO3/k05e1HHENyJ1RcaCH3h9QmL7h
   w4vZYHvMIDsg2DE2kHZf46vu2N5EBBkF9YqWk04EUE3lvvKtXxRbINt8d
   KmUhh1Xr0G6EV5ICG2+ZvAGIS5omN5biABWnvktJ02UJjko0DYsGfgm26
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6704964"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="6704964"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 00:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016955633"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="1016955633"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2023 00:27:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8yrs-0003Jk-2N;
	Fri, 01 Dec 2023 08:27:24 +0000
Date: Fri, 1 Dec 2023 16:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/ttm/ttm_pool.c:93 ttm_pool_alloc_page() warn: use
 'gfp_flags' here instead of GFP_KERNEL?
Message-ID: <202312011622.LjF0DtPn-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Christian König" <christian.koenig@amd.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Madhav Chauhan <madhav.chauhan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: d099fc8f540add80f725014fdd4f7f49f3c58911 drm/ttm: new TT backend allocation pool v3
date:   3 years, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 years, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231201/202312011622.LjF0DtPn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011622.LjF0DtPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312011622.LjF0DtPn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_pool.c:93 ttm_pool_alloc_page() warn: use 'gfp_flags' here instead of GFP_KERNEL?

vim +/gfp_flags +93 drivers/gpu/drm/ttm/ttm_pool.c

d099fc8f540add Christian König 2020-10-22   69  
d099fc8f540add Christian König 2020-10-22   70  /* Allocate pages of size 1 << order with the given gfp_flags */
d099fc8f540add Christian König 2020-10-22   71  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
d099fc8f540add Christian König 2020-10-22   72  					unsigned int order)
d099fc8f540add Christian König 2020-10-22   73  {
d099fc8f540add Christian König 2020-10-22   74  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
d099fc8f540add Christian König 2020-10-22   75  	struct ttm_pool_dma *dma;
d099fc8f540add Christian König 2020-10-22   76  	struct page *p;
d099fc8f540add Christian König 2020-10-22   77  	void *vaddr;
d099fc8f540add Christian König 2020-10-22   78  
d099fc8f540add Christian König 2020-10-22   79  	if (order) {
d099fc8f540add Christian König 2020-10-22   80  		gfp_flags |= GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
d099fc8f540add Christian König 2020-10-22   81  			__GFP_KSWAPD_RECLAIM;
d099fc8f540add Christian König 2020-10-22   82  		gfp_flags &= ~__GFP_MOVABLE;
d099fc8f540add Christian König 2020-10-22   83  		gfp_flags &= ~__GFP_COMP;
d099fc8f540add Christian König 2020-10-22   84  	}
d099fc8f540add Christian König 2020-10-22   85  
d099fc8f540add Christian König 2020-10-22   86  	if (!pool->use_dma_alloc) {
d099fc8f540add Christian König 2020-10-22   87  		p = alloc_pages(gfp_flags, order);
d099fc8f540add Christian König 2020-10-22   88  		if (p)
d099fc8f540add Christian König 2020-10-22   89  			p->private = order;
d099fc8f540add Christian König 2020-10-22   90  		return p;
d099fc8f540add Christian König 2020-10-22   91  	}
d099fc8f540add Christian König 2020-10-22   92  
d099fc8f540add Christian König 2020-10-22  @93  	dma = kmalloc(sizeof(*dma), GFP_KERNEL);
d099fc8f540add Christian König 2020-10-22   94  	if (!dma)
d099fc8f540add Christian König 2020-10-22   95  		return NULL;
d099fc8f540add Christian König 2020-10-22   96  
d099fc8f540add Christian König 2020-10-22   97  	if (order)
d099fc8f540add Christian König 2020-10-22   98  		attr |= DMA_ATTR_NO_WARN;
d099fc8f540add Christian König 2020-10-22   99  
d099fc8f540add Christian König 2020-10-22  100  	vaddr = dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
d099fc8f540add Christian König 2020-10-22  101  				&dma->addr, gfp_flags, attr);
d099fc8f540add Christian König 2020-10-22  102  	if (!vaddr)
d099fc8f540add Christian König 2020-10-22  103  		goto error_free;
d099fc8f540add Christian König 2020-10-22  104  
d099fc8f540add Christian König 2020-10-22  105  	/* TODO: This is an illegal abuse of the DMA API, but we need to rework
d099fc8f540add Christian König 2020-10-22  106  	 * TTM page fault handling and extend the DMA API to clean this up.
d099fc8f540add Christian König 2020-10-22  107  	 */
d099fc8f540add Christian König 2020-10-22  108  	if (is_vmalloc_addr(vaddr))
d099fc8f540add Christian König 2020-10-22  109  		p = vmalloc_to_page(vaddr);
d099fc8f540add Christian König 2020-10-22  110  	else
d099fc8f540add Christian König 2020-10-22  111  		p = virt_to_page(vaddr);
d099fc8f540add Christian König 2020-10-22  112  
d099fc8f540add Christian König 2020-10-22  113  	dma->vaddr = (unsigned long)vaddr | order;
d099fc8f540add Christian König 2020-10-22  114  	p->private = (unsigned long)dma;
d099fc8f540add Christian König 2020-10-22  115  	return p;
d099fc8f540add Christian König 2020-10-22  116  
d099fc8f540add Christian König 2020-10-22  117  error_free:
d099fc8f540add Christian König 2020-10-22  118  	kfree(dma);
d099fc8f540add Christian König 2020-10-22  119  	return NULL;
d099fc8f540add Christian König 2020-10-22  120  }
d099fc8f540add Christian König 2020-10-22  121  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
