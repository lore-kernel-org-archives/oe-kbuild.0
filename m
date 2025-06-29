Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB11220F37
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202089; cv=none; b=hRA2FnKu5Ui05uH4O7z6GuIwgFXyS+KFQcFPe5DuERaCLpQpHHi9P2dAxLCvIQgRrmRT2fHU/7dP6i7yofoYCf2ys6+olcaQiwxT3kJ/bs+/sfPt9miwopPHsrS436WTXpeQhlP1JRQ+iSeuqgur4otxgvUeQWOj19CfpM4BgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202089; c=relaxed/simple;
	bh=kD8BjIvx/OwZf4tPEd+IVVDiVV5w9efKCxd0Hr2nkxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWnNZcp4Je8MNB/yujIIrgU4+4dppQRavbMLFZvdaY+UP8ArS0go9+ShP3BCKpU9edWrRZUv7VynMPf+ioWRDqVXIxqTdpG2HV1eebHQ0O38gohBt9WcNQk5ezyarbJxSk/XKyKlXXF+xqNzt5vKCrGE1Yl14pSqwMvO6PinH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSX5bfCf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSX5bfCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751202087; x=1782738087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kD8BjIvx/OwZf4tPEd+IVVDiVV5w9efKCxd0Hr2nkxc=;
  b=bSX5bfCfz/TopBOz7x+bcWV2Z+t3zuN79PKKykkUZW3VJFNakDv59J65
   fQIFKlT68ppQ80gPrajmZ1ef2svslhUnt8C1QUMYx3jckZ3JiIKTTL5fb
   BoFIP83Zxv59LfF55g7T9ZqQ8R7RRiVbwQ9znqaDw7is0JGYCqPjzfE4c
   V5bvShGPrghia+ieklKE9dwIX7WYgONxQjyVxazJMsfBxCEouurBSKqqp
   yrgCMt3q4o6BUwA8oZ31AqqIqJu9NzNBqF9fNtGyNKYxOUWoMk5n1EZHq
   wHZngcTVOvQbyzJ+sLCOX9Fw43hMumshw9T0YjXgKZ4pd6jJPM09bfQHS
   w==;
X-CSE-ConnectionGUID: 88hLBdBdSV6r5/iJA150eg==
X-CSE-MsgGUID: vqZs4+MGTF67H8/paXFenQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57244857"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="57244857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 06:01:26 -0700
X-CSE-ConnectionGUID: XcegWszhRe2TsKium3oykg==
X-CSE-MsgGUID: Z6IBkVtHRUqcf48q0M/CQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="157755319"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jun 2025 06:01:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVres-000XwI-1h;
	Sun, 29 Jun 2025 13:01:22 +0000
Date: Sun, 29 Jun 2025 21:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 236/258] mm/shmem.c:2057 shmem_swapin_direct()
 error: uninitialized symbol 'new'.
Message-ID: <202506292026.gM1BBBr7-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   2e462e10265dcdce546cab85a902b716e2b26d9f
commit: da38b6caa23a57a77760489f13a7ab3686b21d05 [236/258] mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250629 (https://download.01.org/0day-ci/archive/20250629/202506292026.gM1BBBr7-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506292026.gM1BBBr7-lkp@intel.com/

smatch warnings:
mm/shmem.c:2057 shmem_swapin_direct() error: uninitialized symbol 'new'.

vim +/new +2057 mm/shmem.c

71fe804b6d56d6 Lee Schermerhorn 2008-04-28  1977  
da38b6caa23a57 Kairui Song      2025-06-27  1978  static struct folio *shmem_swapin_direct(struct inode *inode,
1dd44c0af4fa1e Baolin Wang      2025-01-08  1979  		struct vm_area_struct *vma, pgoff_t index,
1dd44c0af4fa1e Baolin Wang      2025-01-08  1980  		swp_entry_t entry, int order, gfp_t gfp)
1dd44c0af4fa1e Baolin Wang      2025-01-08  1981  {
1dd44c0af4fa1e Baolin Wang      2025-01-08  1982  	struct shmem_inode_info *info = SHMEM_I(inode);
946970b3240a61 Kairui Song      2025-06-27  1983  	int nr_pages = 1 << order;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1984  	struct folio *new;
da38b6caa23a57 Kairui Song      2025-06-27  1985  	pgoff_t offset;
da38b6caa23a57 Kairui Song      2025-06-27  1986  	gfp_t swap_gfp;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1987  	void *shadow;
1dd44c0af4fa1e Baolin Wang      2025-01-08  1988  
1dd44c0af4fa1e Baolin Wang      2025-01-08  1989  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  1990  	 * We have arrived here because our zones are constrained, so don't
1dd44c0af4fa1e Baolin Wang      2025-01-08  1991  	 * limit chance of success with further cpuset and node constraints.
1dd44c0af4fa1e Baolin Wang      2025-01-08  1992  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  1993  	gfp &= ~GFP_CONSTRAINT_MASK;
da38b6caa23a57 Kairui Song      2025-06-27  1994  	swap_gfp = gfp;
946970b3240a61 Kairui Song      2025-06-27  1995  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
946970b3240a61 Kairui Song      2025-06-27  1996  		if (WARN_ON_ONCE(order))
946970b3240a61 Kairui Song      2025-06-27  1997  			return ERR_PTR(-EINVAL);
946970b3240a61 Kairui Song      2025-06-27  1998  	} else if (order) {
946970b3240a61 Kairui Song      2025-06-27  1999  		/*
946970b3240a61 Kairui Song      2025-06-27  2000  		 * If uffd is active for the vma, we need per-page fault
946970b3240a61 Kairui Song      2025-06-27  2001  		 * fidelity to maintain the uffd semantics, then fallback
946970b3240a61 Kairui Song      2025-06-27  2002  		 * to swapin order-0 folio, as well as for zswap case.
946970b3240a61 Kairui Song      2025-06-27  2003  		 * Any existing sub folio in the swap cache also blocks
946970b3240a61 Kairui Song      2025-06-27  2004  		 * mTHP swapin.
946970b3240a61 Kairui Song      2025-06-27  2005  		 */
946970b3240a61 Kairui Song      2025-06-27  2006  		if ((vma && unlikely(userfaultfd_armed(vma))) ||
946970b3240a61 Kairui Song      2025-06-27  2007  		     !zswap_never_enabled() ||
946970b3240a61 Kairui Song      2025-06-27  2008  		     non_swapcache_batch(entry, nr_pages) != nr_pages) {
da38b6caa23a57 Kairui Song      2025-06-27  2009  			goto fallback;
946970b3240a61 Kairui Song      2025-06-27  2010  		} else {
da38b6caa23a57 Kairui Song      2025-06-27  2011  			swap_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
946970b3240a61 Kairui Song      2025-06-27  2012  		}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2013  	}
da38b6caa23a57 Kairui Song      2025-06-27  2014  retry:
da38b6caa23a57 Kairui Song      2025-06-27  2015  	new = shmem_alloc_folio(swap_gfp, order, info, index);
da38b6caa23a57 Kairui Song      2025-06-27  2016  	if (!new) {
da38b6caa23a57 Kairui Song      2025-06-27  2017  		new = ERR_PTR(-ENOMEM);
da38b6caa23a57 Kairui Song      2025-06-27  2018  		goto fallback;
da38b6caa23a57 Kairui Song      2025-06-27  2019  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2020  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2021  	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
da38b6caa23a57 Kairui Song      2025-06-27  2022  					   swap_gfp, entry)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2023  		folio_put(new);
da38b6caa23a57 Kairui Song      2025-06-27  2024  		new = ERR_PTR(-ENOMEM);
da38b6caa23a57 Kairui Song      2025-06-27  2025  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2026  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2027  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2028  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  2029  	 * Prevent parallel swapin from proceeding with the swap cache flag.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2030  	 *
1dd44c0af4fa1e Baolin Wang      2025-01-08  2031  	 * Of course there is another possible concurrent scenario as well,
1dd44c0af4fa1e Baolin Wang      2025-01-08  2032  	 * that is to say, the swap cache flag of a large folio has already
1dd44c0af4fa1e Baolin Wang      2025-01-08  2033  	 * been set by swapcache_prepare(), while another thread may have
1dd44c0af4fa1e Baolin Wang      2025-01-08  2034  	 * already split the large swap entry stored in the shmem mapping.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2035  	 * In this case, shmem_add_to_page_cache() will help identify the
1dd44c0af4fa1e Baolin Wang      2025-01-08  2036  	 * concurrent swapin and return -EEXIST.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2037  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  2038  	if (swapcache_prepare(entry, nr_pages)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2039  		folio_put(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2040  		return ERR_PTR(-EEXIST);
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
da38b6caa23a57 Kairui Song      2025-06-27  2054  fallback:
da38b6caa23a57 Kairui Song      2025-06-27  2055  	/* Order 0 swapin failed, nothing to fallback to, abort */
da38b6caa23a57 Kairui Song      2025-06-27  2056  	if (!order)
da38b6caa23a57 Kairui Song      2025-06-27 @2057  		return new;
da38b6caa23a57 Kairui Song      2025-06-27  2058  	/* High order swapin failed, fallback to order 0 and retry */
da38b6caa23a57 Kairui Song      2025-06-27  2059  	order = 0;
da38b6caa23a57 Kairui Song      2025-06-27  2060  	nr_pages = 1;
da38b6caa23a57 Kairui Song      2025-06-27  2061  	swap_gfp = gfp;
da38b6caa23a57 Kairui Song      2025-06-27  2062  	offset = index - round_down(index, nr_pages);
da38b6caa23a57 Kairui Song      2025-06-27  2063  	entry = swp_entry(swp_type(entry), swp_offset(entry) + offset);
da38b6caa23a57 Kairui Song      2025-06-27  2064  	goto retry;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2065  }
1dd44c0af4fa1e Baolin Wang      2025-01-08  2066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
