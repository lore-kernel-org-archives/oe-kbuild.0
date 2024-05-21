Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EC610C
	for <oe-kbuild@lists.linux.dev>; Tue, 21 May 2024 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716268284; cv=none; b=o9uFb+VPLg/30HSmmp/057H4KxJcNH/hp42EYiEY49LhrZqsRPWYzLi3AiW/IL2u7UPmu+6b6OYWhXlYezW/RkMdPVCfG9JHMVbEcziDVEpfO3pM4KqyQrvtp7SS+p212g5oaAkHCacSlTnhSgjGOUvAEz5LPcwd5WPU8YYUcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716268284; c=relaxed/simple;
	bh=OFo9NJQsUPgWdNC21ym+wUkMtJI6Q2GncXdaJSdzAM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAbaR42t2tgE878CeU6Ktm9wzVTx/2CnMHus+ZJnFPZBOcrQK6CyBwH8OBY8vr+qFz/uoI1T8EFTFeWQKPizry6UmZ5l8gtPdWAZTf1nPROUgDGNJPsqfxmBOIAyJ7jZcpl5fwX0afIYexukFoueGxO7N51CiwA60WB2pXw0NSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvr5+1Rk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvr5+1Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716268283; x=1747804283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFo9NJQsUPgWdNC21ym+wUkMtJI6Q2GncXdaJSdzAM4=;
  b=gvr5+1RkUIvArfeaZG9+O8L+lkVcuDruH+oIrz6YQMhWzS8SWhexNmoB
   1Kh0icydclhO9kLwHlIsEv2ZTXFoPBhHtD9GwfffrFyt8Joa7JV63HsIi
   EI8QBguF1xgcBwSTceJsTF9fnm+aZbftt+UjwkoaJjdCGzuUMPRjbryNZ
   4mSAZTLUfzUdqmryvo5oE6zWxuRBqxFO/Fz8KHMR9gxNL+Uy2kfDzckxN
   AkZ19dvXDlgI0Em5o/Y/4RlLqRH9n6SBUXhs9hf2rg0CXWLBeH/lBSfar
   h+nJYSxFjQ6XJyAS7D9AinSl1bZH2WZe7D+FlM4Bn8y3wRkqkwK6WvDhN
   Q==;
X-CSE-ConnectionGUID: J4Jz7wW9TRSH+kzPo/n0LA==
X-CSE-MsgGUID: u+Z0kqPnQlivCLkDXv3iOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29958773"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="29958773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 22:11:22 -0700
X-CSE-ConnectionGUID: i941j+yvQBiCzDup+jaEzw==
X-CSE-MsgGUID: 7beTRhwaTJC/EOnW1m8sPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37312845"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2024 22:11:21 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9HmQ-0005u8-31;
	Tue, 21 May 2024 05:11:18 +0000
Date: Tue, 21 May 2024 13:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [crng-random:vdso-droppable 5/10] mm/mempolicy.c:2302
 vma_alloc_folio() warn: bitwise AND condition is false here
Message-ID: <202405211354.hRfxYd6I-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso-droppable
head:   a7eca399da39972132d1fb50f4160b86b7498198
commit: b6309ec1cf280cca230a49f06915930114ff3a29 [5/10] mm: add VM_DROPPABLE for designating always lazily freeable mappings
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc-randconfig-r081-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211354.hRfxYd6I-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405211354.hRfxYd6I-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:2302 vma_alloc_folio() warn: bitwise AND condition is false here

vim +2302 mm/mempolicy.c

ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2278  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2279  /**
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2280   * vma_alloc_folio - Allocate a folio for a VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2281   * @gfp: GFP flags.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2282   * @order: Order of the folio.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2283   * @vma: Pointer to VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2284   * @addr: Virtual address of the allocation.  Must be inside @vma.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2285   * @hugepage: Unused (was: For hugepages try only preferred node if possible).
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2286   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2287   * Allocate a folio for a specific address in @vma, using the appropriate
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2288   * NUMA policy.  The caller must hold the mmap_lock of the mm_struct of the
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2289   * VMA to prevent it from going away.  Should be used for all allocations
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2290   * for folios that will be mapped into user space, excepting hugetlbfs, and
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2291   * excepting where direct use of alloc_pages_mpol() is more appropriate.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2292   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2293   * Return: The folio on success or NULL if allocation fails.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2294   */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2295  struct folio *vma_alloc_folio(gfp_t gfp, int order, struct vm_area_struct *vma,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2296  		unsigned long addr, bool hugepage)
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2297  {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2298  	struct mempolicy *pol;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2299  	pgoff_t ilx;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2300  	struct page *page;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2301  
b6309ec1cf280c Jason A. Donenfeld      2022-12-08 @2302  	if (vma->vm_flags & VM_DROPPABLE)
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  2303  		gfp |= __GFP_NOWARN | __GFP_NORETRY;
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  2304  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2305  	pol = get_vma_policy(vma, addr, order, &ilx);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2306  	page = alloc_pages_mpol(gfp | __GFP_COMP, order,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2307  				pol, ilx, numa_node_id());
d51e9894d27492 Vlastimil Babka         2017-01-24  2308  	mpol_cond_put(pol);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2309  	return page_rmappable_folio(page);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2310) }
adf88aa8ea7ff1 Matthew Wilcox (Oracle  2022-05-12  2311) EXPORT_SYMBOL(vma_alloc_folio);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2312) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
