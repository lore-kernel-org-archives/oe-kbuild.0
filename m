Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531139479B
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338792; cv=none; b=jDgtxvsBlMsVHW1MJpxrJzsnVX9Cy6WzYcAwuZgVDKIKrz2XSnqhg29Pk62ds/0JQ8ieeeW8iLmNkcXs+yhgqxX4SUA5uh7Yoj6VadP02yk4INHG1+niPGLkIIhmVWn/eqMlBCL10oJBZlkqblFZoJs4D11J8xuGvmxElKyCCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338792; c=relaxed/simple;
	bh=IkGcOHmpEKKLB76ci2+ONKnVijhX0QnoBjswQUJafKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eXZ5o6/BM9qy+2BTNAFHurScx83cvCa8lB1ycJi+v6ZBhpgzrDAKJpX4ijog6sb20Z2OdxD04NmVzKUp5dytMvPX+fiaq8OMm63YBDDWpPxVJSxKNmlf9zgtO+dVtxTZj5RZMNrT1HEwetv6MiW1yJBy5xpU08XiJJ61mEB+iWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBTYRoqI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBTYRoqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789338790; x=1820874790;
  h=date:from:to:cc:subject:message-id;
  bh=IkGcOHmpEKKLB76ci2+ONKnVijhX0QnoBjswQUJafKs=;
  b=oBTYRoqIy1CT0fjc+HvUNHzKeVAmDQQAgBvzFG76N3iou3beiLiIZm5Q
   PrzqEXq+Vdkqif40CZJU+zlM57iQY0MXK20dB7J4VM4Ux21KFIB/s11Ns
   XivNr0ti376/BdhLICCyhNKJUZCk48LffjgPrZ5Jsp+TICmGJSE9YzKnf
   25ZBKvdQgpI2IK9HOeiXX8hTUDhScrE8Dfn7c+nDN2fN4AAeOdNsKJ3gs
   Mwdhu7g93Dlp+N1oQROACCxv6qDQUCm9Qp2Sa1xvqeVhInPfrtJ0n/FIE
   eI36prJtq4QJpXz7dvPPOhmfyPNRWJiJg/E0TSAUdeB9Z+pQoE9C32Fok
   g==;
X-CSE-ConnectionGUID: tejyT0MVR3yNG1KQJ+y4zQ==
X-CSE-MsgGUID: slukSHvjTzOfmEfvD7oOlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100294771"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="100294771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 15:33:09 -0700
X-CSE-ConnectionGUID: B+HXsq8KQKOhbWLerfaFUg==
X-CSE-MsgGUID: F7i1mBztTuSU3MLI5rMeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="276638216"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2026 15:33:08 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5skz-000000001kF-1XMO;
	Sun, 13 Sep 2026 22:33:05 +0000
Date: Mon, 14 Sep 2026 00:32:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:collapse/rfc-wip 41/84] mm/swap_state.c:481
 __swap_cache_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
Message-ID: <202609140034.5e6tLkPc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-wip
head:   36226b1e4970c52a3c0d491dcf17800eb800958a
commit: 1e7fc9164723073d7b48f251446ae662becf45e2 [41/84] mm/huge_memory: let the caller pick the gfp for the deferred-split heads
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r072-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140034.5e6tLkPc-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609140034.5e6tLkPc-lkp@intel.com/

smatch warnings:
mm/swap_state.c:481 __swap_cache_alloc() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +481 mm/swap_state.c

094dc8b059b11e Kairui Song            2025-09-17  403  
e1e6750df3b473 Kairui Song            2026-05-17  404  /*
e1e6750df3b473 Kairui Song            2026-05-17  405   * Try to allocate a folio of given order in the swap cache.
e1e6750df3b473 Kairui Song            2026-05-17  406   *
e1e6750df3b473 Kairui Song            2026-05-17  407   * This helper resolves the potential races of swap allocation
e1e6750df3b473 Kairui Song            2026-05-17  408   * and prepares a folio to be used for swap IO. May return following
e1e6750df3b473 Kairui Song            2026-05-17  409   * value:
e1e6750df3b473 Kairui Song            2026-05-17  410   *
e1e6750df3b473 Kairui Song            2026-05-17  411   * -ENOMEM / -EBUSY: Order is too large or in conflict with sub slot,
e1e6750df3b473 Kairui Song            2026-05-17  412   *                   caller should shrink the order and retry
e1e6750df3b473 Kairui Song            2026-05-17  413   * -ENOENT / -EEXIST: Target swap entry is unavailable or cached, the caller
e1e6750df3b473 Kairui Song            2026-05-17  414   *                    should abort or try to use the cached folio instead
e1e6750df3b473 Kairui Song            2026-05-17  415   */
e1e6750df3b473 Kairui Song            2026-05-17  416  static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
e1e6750df3b473 Kairui Song            2026-05-17  417  					swp_entry_t targ_entry, gfp_t gfp,
e1e6750df3b473 Kairui Song            2026-05-17  418  					unsigned int order, struct vm_fault *vmf,
e1e6750df3b473 Kairui Song            2026-05-17  419  					struct mempolicy *mpol, pgoff_t ilx)
e1e6750df3b473 Kairui Song            2026-05-17  420  {
e1e6750df3b473 Kairui Song            2026-05-17  421  	int err;
e1e6750df3b473 Kairui Song            2026-05-17  422  	swp_entry_t entry;
e1e6750df3b473 Kairui Song            2026-05-17  423  	struct folio *folio;
e1e6750df3b473 Kairui Song            2026-05-17  424  	void *shadow = NULL;
bc34e87a51d9e5 Kairui Song            2026-05-17  425  	unsigned short memcg_id;
e1e6750df3b473 Kairui Song            2026-05-17  426  	unsigned long address, nr_pages = 1UL << order;
e1e6750df3b473 Kairui Song            2026-05-17  427  	struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
e1e6750df3b473 Kairui Song            2026-05-17  428  
e1e6750df3b473 Kairui Song            2026-05-17  429  	VM_WARN_ON_ONCE(nr_pages > SWAPFILE_CLUSTER);
e1e6750df3b473 Kairui Song            2026-05-17  430  	entry.val = round_down(targ_entry.val, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  431  
e1e6750df3b473 Kairui Song            2026-05-17  432  	/* Check if the slot and range are available, skip allocation if not */
e1e6750df3b473 Kairui Song            2026-05-17  433  	spin_lock(&ci->lock);
bc34e87a51d9e5 Kairui Song            2026-05-17  434  	err = __swap_cache_add_check(ci, targ_entry, nr_pages, NULL, NULL);
e1e6750df3b473 Kairui Song            2026-05-17  435  	spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  436  	if (unlikely(err))
e1e6750df3b473 Kairui Song            2026-05-17  437  		return ERR_PTR(err);
e1e6750df3b473 Kairui Song            2026-05-17  438  
e1e6750df3b473 Kairui Song            2026-05-17  439  	/*
e1e6750df3b473 Kairui Song            2026-05-17  440  	 * Limit THP gfp. The limitation is a no-op for typical
e1e6750df3b473 Kairui Song            2026-05-17  441  	 * GFP_HIGHUSER_MOVABLE but matters for shmem.
e1e6750df3b473 Kairui Song            2026-05-17  442  	 */
e1e6750df3b473 Kairui Song            2026-05-17  443  	if (order)
e1e6750df3b473 Kairui Song            2026-05-17  444  		gfp = thp_shmem_limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
e1e6750df3b473 Kairui Song            2026-05-17  445  
e1e6750df3b473 Kairui Song            2026-05-17  446  	if (mpol || !vmf) {
e1e6750df3b473 Kairui Song            2026-05-17  447  		folio = folio_alloc_mpol(gfp, order, mpol, ilx, numa_node_id());
e1e6750df3b473 Kairui Song            2026-05-17  448  	} else {
e1e6750df3b473 Kairui Song            2026-05-17  449  		address = round_down(vmf->address, PAGE_SIZE << order);
e1e6750df3b473 Kairui Song            2026-05-17  450  		folio = vma_alloc_folio(gfp, order, vmf->vma, address);
e1e6750df3b473 Kairui Song            2026-05-17  451  	}
e1e6750df3b473 Kairui Song            2026-05-17  452  	if (unlikely(!folio))
e1e6750df3b473 Kairui Song            2026-05-17  453  		return ERR_PTR(-ENOMEM);
e1e6750df3b473 Kairui Song            2026-05-17  454  
e1e6750df3b473 Kairui Song            2026-05-17  455  	/* Double check the range is still not in conflict */
e1e6750df3b473 Kairui Song            2026-05-17  456  	spin_lock(&ci->lock);
bc34e87a51d9e5 Kairui Song            2026-05-17  457  	err = __swap_cache_add_check(ci, targ_entry, nr_pages, &shadow, &memcg_id);
e1e6750df3b473 Kairui Song            2026-05-17  458  	if (unlikely(err)) {
e1e6750df3b473 Kairui Song            2026-05-17  459  		spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  460  		folio_put(folio);
e1e6750df3b473 Kairui Song            2026-05-17  461  		return ERR_PTR(err);
e1e6750df3b473 Kairui Song            2026-05-17  462  	}
e1e6750df3b473 Kairui Song            2026-05-17  463  
e1e6750df3b473 Kairui Song            2026-05-17  464  	__folio_set_locked(folio);
e1e6750df3b473 Kairui Song            2026-05-17  465  	__folio_set_swapbacked(folio);
e1e6750df3b473 Kairui Song            2026-05-17  466  	__swap_cache_do_add_folio(ci, folio, entry);
e1e6750df3b473 Kairui Song            2026-05-17  467  	spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  468  
bc34e87a51d9e5 Kairui Song            2026-05-17  469  	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
bc34e87a51d9e5 Kairui Song            2026-05-17  470  					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
e1e6750df3b473 Kairui Song            2026-05-17  471  		spin_lock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  472  		__swap_cache_do_del_folio(ci, folio, entry, shadow);
e1e6750df3b473 Kairui Song            2026-05-17  473  		spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  474  		folio_unlock(folio);
e1e6750df3b473 Kairui Song            2026-05-17  475  		/* nr_pages refs from swap cache, 1 from allocation */
e1e6750df3b473 Kairui Song            2026-05-17  476  		folio_put_refs(folio, nr_pages + 1);
e1e6750df3b473 Kairui Song            2026-05-17  477  		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
e1e6750df3b473 Kairui Song            2026-05-17  478  		return ERR_PTR(-ENOMEM);
e1e6750df3b473 Kairui Song            2026-05-17  479  	}
e1e6750df3b473 Kairui Song            2026-05-17  480  
1e7fc916472307 Kiryl Shutsemau (Meta  2026-08-24 @481) 	if (order > 1 && folio_memcg_alloc_deferred(folio, GFP_KERNEL)) {
fafaeceb89a5e2 Johannes Weiner        2026-05-27  482  		spin_lock(&ci->lock);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  483  		__swap_cache_do_del_folio(ci, folio, entry, shadow);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  484  		spin_unlock(&ci->lock);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  485  		folio_unlock(folio);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  486  		/* nr_pages refs from swap cache, 1 from allocation */
fafaeceb89a5e2 Johannes Weiner        2026-05-27  487  		folio_put_refs(folio, nr_pages + 1);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  488  		return ERR_PTR(-ENOMEM);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  489  	}
fafaeceb89a5e2 Johannes Weiner        2026-05-27  490  
945578fee2ec17 Kairui Song            2026-05-17  491  	/* memsw uncharges swap when folio is added to swap cache */
945578fee2ec17 Kairui Song            2026-05-17  492  	memcg1_swapin(folio);
e1e6750df3b473 Kairui Song            2026-05-17  493  	if (shadow)
e1e6750df3b473 Kairui Song            2026-05-17  494  		workingset_refault(folio, shadow);
e1e6750df3b473 Kairui Song            2026-05-17  495  
e1e6750df3b473 Kairui Song            2026-05-17  496  	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  497  	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  498  
e1e6750df3b473 Kairui Song            2026-05-17  499  	/* Caller will initiate read into locked new_folio */
e1e6750df3b473 Kairui Song            2026-05-17  500  	folio_add_lru(folio);
e1e6750df3b473 Kairui Song            2026-05-17  501  	return folio;
e1e6750df3b473 Kairui Song            2026-05-17  502  }
e1e6750df3b473 Kairui Song            2026-05-17  503  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
