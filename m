Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEC7198E8C
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 03:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752205357; cv=none; b=A8Vc2ZgNFFY9fF29d/pg8KkK7Py06eijQWHqwRZ0ENs7ATlyelXFn+wPvQW/HMWGj4pfaYquhXKrTBvsrlOTbPr9YTVa6OhZ6BOwLiTXce3+DwHlSa/BE+hI0BI7ZBcSRiMUpE/Loq9iGLgpDcYNs3+6vOJ1SCh7scSpZNrqdDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752205357; c=relaxed/simple;
	bh=z1idD4R34Nh9QVtJivlkFdtb8J3nOPfgheYSJmrK+o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aU18i6CJFVcr+l1d/NcdndGkUQsUbZoHLDIJmgbjtbK4AAhhqA25F6961fT50MhE8EITKZdHERk7hHiB5iaG3F+Ty3QOC9IdySwmWotB8tsTYhuWIJmmy4xaKNm41x5E9CwxrCFm0qAuxpL1tJCdDkyfgJiKR8q642mi/7rFU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUAGY396; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUAGY396"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752205356; x=1783741356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1idD4R34Nh9QVtJivlkFdtb8J3nOPfgheYSJmrK+o8=;
  b=lUAGY396a4Qpt7tBI+ZU3bH0A1KKz6g4SzKendeee0Gvug4Wh7p3eope
   rNt8mm6uDyiRb9K/Pig4sPbKLS4FiecCnQE3Rbmd6z8Ixc4r37JZ1Pz/F
   uUEBV+bYcvxQcC8mlqL2hKY2rOgdtLDuSfHnANnlG+41UFeXaoChsS2kT
   pmvJY7vyiTZSm3I0w/FZTCsTOyJnZutGYXA4z4RpmhvUQEM/7MC1s5U3z
   SWpm7Lzok7D8KFYi0zMTYUmhTw3tL0hul2k0ANF0DNaP7a/Pkx5YcT0pp
   CpbQJQsOYBtBYzOOHwG7rQpVoRwxu09IfFd09gtq48JWJZHzbXN9rg3tb
   w==;
X-CSE-ConnectionGUID: rQToeN8AQhCuvS7ExhSCYQ==
X-CSE-MsgGUID: UiQPA3mcTtKD39qe2WnI+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65948401"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65948401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 20:42:35 -0700
X-CSE-ConnectionGUID: 2bjpcO+7SDmK6/qR7mOZ3w==
X-CSE-MsgGUID: 62h81evrRNu1+t1sExKAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="160566956"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2025 20:42:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua4ed-0005qP-2Q;
	Fri, 11 Jul 2025 03:42:31 +0000
Date: Fri, 11 Jul 2025 11:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 5/8] mm/shmem, swap: never use swap cache and
 readahead for SWP_SYNCHRONOUS_IO
Message-ID: <202507111152.CvHfG444-lkp@intel.com>
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
In-Reply-To: <20250710033706.71042-6-ryncsn@gmail.com>
References: <20250710033706.71042-6-ryncsn@gmail.com>
TO: Kairui Song <ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-shmem-swap-improve-cached-mTHP-handling-and-fix-potential-hung/20250710-114401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250710033706.71042-6-ryncsn%40gmail.com
patch subject: [PATCH v5 5/8] mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111152.CvHfG444-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507111152.CvHfG444-lkp@intel.com/

smatch warnings:
mm/shmem.c:2057 shmem_swap_alloc_folio() error: uninitialized symbol 'new'.

vim +/new +2057 mm/shmem.c

71fe804b6d56d6 Lee Schermerhorn 2008-04-28  1977  
1dd44c0af4fa1e Baolin Wang      2025-01-08  1978  static struct folio *shmem_swap_alloc_folio(struct inode *inode,
1dd44c0af4fa1e Baolin Wang      2025-01-08  1979  		struct vm_area_struct *vma, pgoff_t index,
1dd44c0af4fa1e Baolin Wang      2025-01-08  1980  		swp_entry_t entry, int order, gfp_t gfp)
1dd44c0af4fa1e Baolin Wang      2025-01-08  1981  {
1dd44c0af4fa1e Baolin Wang      2025-01-08  1982  	struct shmem_inode_info *info = SHMEM_I(inode);
f76a88a3a78d9c Kairui Song      2025-07-10  1983  	int nr_pages = 1 << order;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1984  	struct folio *new;
e04738282a444e Kairui Song      2025-07-10  1985  	gfp_t alloc_gfp;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1986  	void *shadow;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1987  
1dd44c0af4fa1e Baolin Wang      2025-01-08  1988  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  1989  	 * We have arrived here because our zones are constrained, so don't
1dd44c0af4fa1e Baolin Wang      2025-01-08  1990  	 * limit chance of success with further cpuset and node constraints.
1dd44c0af4fa1e Baolin Wang      2025-01-08  1991  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  1992  	gfp &= ~GFP_CONSTRAINT_MASK;
e04738282a444e Kairui Song      2025-07-10  1993  	alloc_gfp = gfp;
f76a88a3a78d9c Kairui Song      2025-07-10  1994  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
f76a88a3a78d9c Kairui Song      2025-07-10  1995  		if (WARN_ON_ONCE(order))
f76a88a3a78d9c Kairui Song      2025-07-10  1996  			return ERR_PTR(-EINVAL);
f76a88a3a78d9c Kairui Song      2025-07-10  1997  	} else if (order) {
f76a88a3a78d9c Kairui Song      2025-07-10  1998  		/*
f76a88a3a78d9c Kairui Song      2025-07-10  1999  		 * If uffd is active for the vma, we need per-page fault
f76a88a3a78d9c Kairui Song      2025-07-10  2000  		 * fidelity to maintain the uffd semantics, then fallback
f76a88a3a78d9c Kairui Song      2025-07-10  2001  		 * to swapin order-0 folio, as well as for zswap case.
f76a88a3a78d9c Kairui Song      2025-07-10  2002  		 * Any existing sub folio in the swap cache also blocks
f76a88a3a78d9c Kairui Song      2025-07-10  2003  		 * mTHP swapin.
f76a88a3a78d9c Kairui Song      2025-07-10  2004  		 */
f76a88a3a78d9c Kairui Song      2025-07-10  2005  		if ((vma && unlikely(userfaultfd_armed(vma))) ||
f76a88a3a78d9c Kairui Song      2025-07-10  2006  		     !zswap_never_enabled() ||
f76a88a3a78d9c Kairui Song      2025-07-10  2007  		     non_swapcache_batch(entry, nr_pages) != nr_pages)
e04738282a444e Kairui Song      2025-07-10  2008  			goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2009  
e04738282a444e Kairui Song      2025-07-10  2010  		alloc_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
e04738282a444e Kairui Song      2025-07-10  2011  	}
e04738282a444e Kairui Song      2025-07-10  2012  retry:
e04738282a444e Kairui Song      2025-07-10  2013  	new = shmem_alloc_folio(alloc_gfp, order, info, index);
e04738282a444e Kairui Song      2025-07-10  2014  	if (!new) {
e04738282a444e Kairui Song      2025-07-10  2015  		new = ERR_PTR(-ENOMEM);
e04738282a444e Kairui Song      2025-07-10  2016  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2017  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2018  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2019  	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
e04738282a444e Kairui Song      2025-07-10  2020  					   alloc_gfp, entry)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2021  		folio_put(new);
e04738282a444e Kairui Song      2025-07-10  2022  		new = ERR_PTR(-ENOMEM);
e04738282a444e Kairui Song      2025-07-10  2023  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2024  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2025  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2026  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  2027  	 * Prevent parallel swapin from proceeding with the swap cache flag.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2028  	 *
1dd44c0af4fa1e Baolin Wang      2025-01-08  2029  	 * Of course there is another possible concurrent scenario as well,
1dd44c0af4fa1e Baolin Wang      2025-01-08  2030  	 * that is to say, the swap cache flag of a large folio has already
1dd44c0af4fa1e Baolin Wang      2025-01-08  2031  	 * been set by swapcache_prepare(), while another thread may have
1dd44c0af4fa1e Baolin Wang      2025-01-08  2032  	 * already split the large swap entry stored in the shmem mapping.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2033  	 * In this case, shmem_add_to_page_cache() will help identify the
1dd44c0af4fa1e Baolin Wang      2025-01-08  2034  	 * concurrent swapin and return -EEXIST.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2035  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  2036  	if (swapcache_prepare(entry, nr_pages)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2037  		folio_put(new);
e04738282a444e Kairui Song      2025-07-10  2038  		new = ERR_PTR(-EEXIST);
e04738282a444e Kairui Song      2025-07-10  2039  		/* Try smaller folio to avoid cache conflict */
e04738282a444e Kairui Song      2025-07-10  2040  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2041  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2042  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2043  	__folio_set_locked(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2044  	__folio_set_swapbacked(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2045  	new->swap = entry;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2046  
89ce924f0bd447 Johannes Weiner  2025-01-24  2047  	memcg1_swapin(entry, nr_pages);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2048  	shadow = get_shadow_from_swap_cache(entry);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2049  	if (shadow)
1dd44c0af4fa1e Baolin Wang      2025-01-08  2050  		workingset_refault(new, shadow);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2051  	folio_add_lru(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2052  	swap_read_folio(new, NULL);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2053  	return new;
e04738282a444e Kairui Song      2025-07-10  2054  fallback:
e04738282a444e Kairui Song      2025-07-10  2055  	/* Order 0 swapin failed, nothing to fallback to, abort */
e04738282a444e Kairui Song      2025-07-10  2056  	if (!order)
e04738282a444e Kairui Song      2025-07-10 @2057  		return new;
e04738282a444e Kairui Song      2025-07-10  2058  	entry.val += index - round_down(index, nr_pages);
e04738282a444e Kairui Song      2025-07-10  2059  	alloc_gfp = gfp;
e04738282a444e Kairui Song      2025-07-10  2060  	nr_pages = 1;
e04738282a444e Kairui Song      2025-07-10  2061  	order = 0;
e04738282a444e Kairui Song      2025-07-10  2062  	goto retry;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2063  }
1dd44c0af4fa1e Baolin Wang      2025-01-08  2064  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
