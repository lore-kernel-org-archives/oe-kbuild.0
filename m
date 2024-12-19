Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3F317C
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 00:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734569789; cv=none; b=OT5/PC6GsC9iCWZneFh3a9oOWZgmfcYDrjkc+fDkpJe/Xa+SAZ3cGtsXlOFLrCtU1J1r4YPVe7qLxhgpxfcVxzaeFPcKCTbGQwQl5erOYNo2FKlJNaDKyCK2iVKipHHV2OVB6rThirDO3jNWOj8ASZl9ie80Xpi5ACV8jaA3GcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734569789; c=relaxed/simple;
	bh=oowfIDIiHKDmf7MAfFzF4zusmzQd9KGhHnqKq+AvbVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRnZWbRf8/d8Xzd79jT8lSIHbKNTIMYOH72yw44nr9S2a4ibE5MwxUCSVraGgCQBAjCti+hOhZOnNJM1Ac2PU8O35stURrR1MtnHocaQnrvnXChFx59jcioH8ALo0W/TaN64ZPVtahICdzEa2amC3BwI+aZRgoSrAisIIMuBKro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6Q+exOV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6Q+exOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734569787; x=1766105787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oowfIDIiHKDmf7MAfFzF4zusmzQd9KGhHnqKq+AvbVs=;
  b=R6Q+exOVvpQTXoj8vvcdqw2hI8WG0YaydfeNL9aeYALQvcllrvnDRMie
   lRjYgLlnIUrDcl0WjVG+pgt/oX12Kz8Phf+Z0EdiJYLHBhee4/GCgdzeG
   cDT2y96mbmdYCb42+eK2VE1gsBRyv+feLYm+kVqthnzg+yRkzVgPxTY2E
   EsixS174IG+fqrcXlS7pXWHEZp+6XmzJ5hD4HAcCXj1ncpGnPX5ywb1y7
   a0Bzgrr2mixJ5dEJMVkC02p0oGRseGOeYEioRjNmjKGnT1mW7IZqkBD4K
   HNLieN20gJLw/wsT5sN3ZsjrazOFatvW3KE+mDyrdjTmiXJ60k21AQ9A7
   g==;
X-CSE-ConnectionGUID: FNMg12ACRpq49q/e7gfoBw==
X-CSE-MsgGUID: edDIweg5RemFri9LvkF9EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34349032"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="34349032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 16:56:26 -0800
X-CSE-ConnectionGUID: 9A2tqD4aQcW5ZigY0Sk8UA==
X-CSE-MsgGUID: hxrZmhTPTviJvklbwSwtBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="102872608"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2024 16:55:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO4pI-000GjG-2Q;
	Thu, 19 Dec 2024 00:55:40 +0000
Date: Thu, 19 Dec 2024 08:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/mempolicy.c:2303 vma_alloc_folio_noprof() warn: bitwise AND
 condition is false here
Message-ID: <202412190857.YhGq5KiV-lkp@intel.com>
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
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eabcdba3ad4098460a376538df2ae36500223c1e
commit: 9651fcedf7b92d3f7f1ab179e8ab55b85ee10fc1 mm: add MAP_DROPPABLE for designating always lazily freeable mappings
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241219/202412190857.YhGq5KiV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412190857.YhGq5KiV-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:2303 vma_alloc_folio_noprof() warn: bitwise AND condition is false here

vim +2303 mm/mempolicy.c

ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2279  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2280  /**
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2281   * vma_alloc_folio - Allocate a folio for a VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2282   * @gfp: GFP flags.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2283   * @order: Order of the folio.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2284   * @vma: Pointer to VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2285   * @addr: Virtual address of the allocation.  Must be inside @vma.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2286   * @hugepage: Unused (was: For hugepages try only preferred node if possible).
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2287   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2288   * Allocate a folio for a specific address in @vma, using the appropriate
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2289   * NUMA policy.  The caller must hold the mmap_lock of the mm_struct of the
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2290   * VMA to prevent it from going away.  Should be used for all allocations
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2291   * for folios that will be mapped into user space, excepting hugetlbfs, and
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2292   * excepting where direct use of alloc_pages_mpol() is more appropriate.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2293   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2294   * Return: The folio on success or NULL if allocation fails.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2295   */
b951aaff503502 Suren Baghdasaryan      2024-03-21  2296  struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2297  		unsigned long addr, bool hugepage)
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2298  {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2299  	struct mempolicy *pol;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2300  	pgoff_t ilx;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2301  	struct page *page;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2302  
9651fcedf7b92d Jason A. Donenfeld      2022-12-08 @2303  	if (vma->vm_flags & VM_DROPPABLE)
9651fcedf7b92d Jason A. Donenfeld      2022-12-08  2304  		gfp |= __GFP_NOWARN;
9651fcedf7b92d Jason A. Donenfeld      2022-12-08  2305  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2306  	pol = get_vma_policy(vma, addr, order, &ilx);
b951aaff503502 Suren Baghdasaryan      2024-03-21  2307  	page = alloc_pages_mpol_noprof(gfp | __GFP_COMP, order,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2308  				       pol, ilx, numa_node_id());
d51e9894d27492 Vlastimil Babka         2017-01-24  2309  	mpol_cond_put(pol);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2310  	return page_rmappable_folio(page);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2311) }
b951aaff503502 Suren Baghdasaryan      2024-03-21  2312  EXPORT_SYMBOL(vma_alloc_folio_noprof);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2313) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
