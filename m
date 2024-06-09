Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3F210E4
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717947739; cv=none; b=PpQ4sh43y91btOFT6f7h6r7pm62aM82bDM79/G7TVrwnGszHzOBKptL1kY8VQ3ZzuSdcUlHBiYtAC2QhiGRz49b05rdDfQmgV627+Svkh4ZaEjH6IMMOKamTIybD7Kc3A+ifMP7So1BFJRypE7D/U2WhtbZrZvPcpfqwie4kpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717947739; c=relaxed/simple;
	bh=65XXxa9BTIfe7dk8LBQb9lLvPjgWJuOO6xBSvyfUHlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdB8ToHSJ4biYBJwtdrOKynCuwze+6ARlk7qgf3X/jrMNl8/f5gJDSHkH0zF+E+ThZu7PMb3XHpI4HmzH1+Lmjb90pBihOdIu75Q6QjUVqEnNzuPyRbEGGwGygf/JtYMeM8Y7ue5Lel2gd6c/h8cYegugFo6O6DkojJm98JpFlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS/wSLW1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS/wSLW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717947736; x=1749483736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65XXxa9BTIfe7dk8LBQb9lLvPjgWJuOO6xBSvyfUHlM=;
  b=VS/wSLW1i3VdQFtgoQkBkXEhJqYXq0LL4fCtLxS/GevSOqo9MKKUsROr
   08hIdQs7EqV02AmTexfpil/m7rTksCriUZiWRImy0IqrqIl7KX+kDAlKi
   +rIbr3a0YAgy9SEgkqU5XTqKAKyXe1QzKsGMy8FcpEH2swhIHVNbpqdG/
   9lFmNlrWGDGgv3TIeSqr8mZTal6iyMhPAmyPGrg9b+RnaJwdsO8mIHsWL
   fE6y/a2JihtYofyrEJYbRHLAPJlSe1GoPOvW6WejlXGJ44ppl/EbayEpd
   MDEWr/qjy0cWoG+brfJqSWBZ1J2ZofaxrQBwqMzGT51leggtgRqhDcp4R
   A==;
X-CSE-ConnectionGUID: I/PoaX7AR3mvBtITOuoXFg==
X-CSE-MsgGUID: yBXOqSH0QTKKbvMhhheK9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14452399"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14452399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 08:42:16 -0700
X-CSE-ConnectionGUID: OtSHOSUuQu6s1wvSLTJ3uQ==
X-CSE-MsgGUID: TOD8Zm72TWSJrNvNm6odug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38948561"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2024 08:42:15 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGKgO-0001MC-1J;
	Sun, 09 Jun 2024 15:42:12 +0000
Date: Sun, 9 Jun 2024 23:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Message-ID: <202406092325.eDrcikT8-lkp@intel.com>
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
In-Reply-To: <20240607103241.1298388-1-wangkefeng.wang@huawei.com>
References: <20240607103241.1298388-1-wangkefeng.wang@huawei.com>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: ying.huang@intel.com
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: David Hildenbrand <david@redhat.com>
CC: John Hubbard <jhubbard@nvidia.com>
CC: Mel Gorman <mgorman@suse.de>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: liushixin2@huawei.com
CC: Kefeng Wang <wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-fix-possible-OOB-in-numa_rebuild_large_mapping/20240607-183609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240607103241.1298388-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092325.eDrcikT8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406092325.eDrcikT8-lkp@intel.com/

smatch warnings:
mm/memory.c:5370 do_numa_page() error: uninitialized symbol 'nr_pages'.

vim +/nr_pages +5370 mm/memory.c

9532fec118d485 Mel Gorman        2012-11-15  5264  
2b7403035459c7 Souptick Joarder  2018-08-23  5265  static vm_fault_t do_numa_page(struct vm_fault *vmf)
d10e63f29488b0 Mel Gorman        2012-10-25  5266  {
82b0f8c39a3869 Jan Kara          2016-12-14  5267  	struct vm_area_struct *vma = vmf->vma;
6695cf68b15c21 Kefeng Wang       2023-09-21  5268  	struct folio *folio = NULL;
6695cf68b15c21 Kefeng Wang       2023-09-21  5269  	int nid = NUMA_NO_NODE;
d2136d749d76af Baolin Wang       2024-03-29  5270  	bool writable = false, ignore_writable = false;
d2136d749d76af Baolin Wang       2024-03-29  5271  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
90572890d20252 Peter Zijlstra    2013-10-07  5272  	int last_cpupid;
cbee9f88ec1b8d Peter Zijlstra    2012-10-25  5273  	int target_nid;
04a8645304500b Aneesh Kumar K.V  2019-03-05  5274  	pte_t pte, old_pte;
d2136d749d76af Baolin Wang       2024-03-29  5275  	int flags = 0, nr_pages;
d10e63f29488b0 Mel Gorman        2012-10-25  5276  
d10e63f29488b0 Mel Gorman        2012-10-25  5277  	/*
6c1b748ebf27be John Hubbard      2024-02-27  5278  	 * The pte cannot be used safely until we verify, while holding the page
6c1b748ebf27be John Hubbard      2024-02-27  5279  	 * table lock, that its contents have not changed during fault handling.
d10e63f29488b0 Mel Gorman        2012-10-25  5280  	 */
82b0f8c39a3869 Jan Kara          2016-12-14  5281  	spin_lock(vmf->ptl);
6c1b748ebf27be John Hubbard      2024-02-27  5282  	/* Read the live PTE from the page tables: */
6c1b748ebf27be John Hubbard      2024-02-27  5283  	old_pte = ptep_get(vmf->pte);
6c1b748ebf27be John Hubbard      2024-02-27  5284  
6c1b748ebf27be John Hubbard      2024-02-27  5285  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara          2016-12-14  5286  		pte_unmap_unlock(vmf->pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman        2012-11-02  5287  		goto out;
4daae3b4b9e49b Mel Gorman        2012-11-02  5288  	}
4daae3b4b9e49b Mel Gorman        2012-11-02  5289  
04a8645304500b Aneesh Kumar K.V  2019-03-05  5290  	pte = pte_modify(old_pte, vma->vm_page_prot);
d10e63f29488b0 Mel Gorman        2012-10-25  5291  
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5292  	/*
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5293  	 * Detect now whether the PTE could be writable; this information
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5294  	 * is only valid while holding the PT lock.
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5295  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5296  	writable = pte_write(pte);
d2136d749d76af Baolin Wang       2024-03-29  5297  	if (!writable && pte_write_upgrade &&
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5298  	    can_change_pte_writable(vma, vmf->address, pte))
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5299  		writable = true;
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5300  
6695cf68b15c21 Kefeng Wang       2023-09-21  5301  	folio = vm_normal_folio(vma, vmf->address, pte);
6695cf68b15c21 Kefeng Wang       2023-09-21  5302  	if (!folio || folio_is_zone_device(folio))
b99a342d4f11a5 Huang Ying        2021-04-29  5303  		goto out_map;
d10e63f29488b0 Mel Gorman        2012-10-25  5304  
6688cc05473b36 Peter Zijlstra    2013-10-07  5305  	/*
bea66fbd11af1c Mel Gorman        2015-03-25  5306  	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
bea66fbd11af1c Mel Gorman        2015-03-25  5307  	 * much anyway since they can be in shared cache state. This misses
bea66fbd11af1c Mel Gorman        2015-03-25  5308  	 * the case where a mapping is writable but the process never writes
bea66fbd11af1c Mel Gorman        2015-03-25  5309  	 * to it but pte_write gets cleared during protection updates and
bea66fbd11af1c Mel Gorman        2015-03-25  5310  	 * pte_dirty has unpredictable behaviour between PTE scan updates,
bea66fbd11af1c Mel Gorman        2015-03-25  5311  	 * background writeback, dirty balancing and application behaviour.
bea66fbd11af1c Mel Gorman        2015-03-25  5312  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5313  	if (!writable)
6688cc05473b36 Peter Zijlstra    2013-10-07  5314  		flags |= TNF_NO_GROUP;
6688cc05473b36 Peter Zijlstra    2013-10-07  5315  
dabe1d992414a6 Rik van Riel      2013-10-07  5316  	/*
6695cf68b15c21 Kefeng Wang       2023-09-21  5317  	 * Flag if the folio is shared between multiple address spaces. This
dabe1d992414a6 Rik van Riel      2013-10-07  5318  	 * is later used when determining whether to group tasks together
dabe1d992414a6 Rik van Riel      2013-10-07  5319  	 */
ebb34f78d72c23 David Hildenbrand 2024-02-27  5320  	if (folio_likely_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
dabe1d992414a6 Rik van Riel      2013-10-07  5321  		flags |= TNF_SHARED;
dabe1d992414a6 Rik van Riel      2013-10-07  5322  
6695cf68b15c21 Kefeng Wang       2023-09-21  5323  	nid = folio_nid(folio);
d2136d749d76af Baolin Wang       2024-03-29  5324  	nr_pages = folio_nr_pages(folio);
33024536bafd91 Huang Ying        2022-07-13  5325  	/*
33024536bafd91 Huang Ying        2022-07-13  5326  	 * For memory tiering mode, cpupid of slow memory page is used
33024536bafd91 Huang Ying        2022-07-13  5327  	 * to record page access time.  So use default value.
33024536bafd91 Huang Ying        2022-07-13  5328  	 */
33024536bafd91 Huang Ying        2022-07-13  5329  	if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
6695cf68b15c21 Kefeng Wang       2023-09-21  5330  	    !node_is_toptier(nid))
33024536bafd91 Huang Ying        2022-07-13  5331  		last_cpupid = (-1 & LAST_CPUPID_MASK);
33024536bafd91 Huang Ying        2022-07-13  5332  	else
67b33e3ff58374 Kefeng Wang       2023-10-18  5333  		last_cpupid = folio_last_cpupid(folio);
f8fd525ba3a298 Donet Tom         2024-03-08  5334  	target_nid = numa_migrate_prep(folio, vmf, vmf->address, nid, &flags);
98fa15f34cb379 Anshuman Khandual 2019-03-05  5335  	if (target_nid == NUMA_NO_NODE) {
6695cf68b15c21 Kefeng Wang       2023-09-21  5336  		folio_put(folio);
b99a342d4f11a5 Huang Ying        2021-04-29  5337  		goto out_map;
4daae3b4b9e49b Mel Gorman        2012-11-02  5338  	}
b99a342d4f11a5 Huang Ying        2021-04-29  5339  	pte_unmap_unlock(vmf->pte, vmf->ptl);
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5340  	writable = false;
d2136d749d76af Baolin Wang       2024-03-29  5341  	ignore_writable = true;
4daae3b4b9e49b Mel Gorman        2012-11-02  5342  
4daae3b4b9e49b Mel Gorman        2012-11-02  5343  	/* Migrate to the requested node */
6695cf68b15c21 Kefeng Wang       2023-09-21  5344  	if (migrate_misplaced_folio(folio, vma, target_nid)) {
6695cf68b15c21 Kefeng Wang       2023-09-21  5345  		nid = target_nid;
6688cc05473b36 Peter Zijlstra    2013-10-07  5346  		flags |= TNF_MIGRATED;
b99a342d4f11a5 Huang Ying        2021-04-29  5347  	} else {
074c238177a75f Mel Gorman        2015-03-25  5348  		flags |= TNF_MIGRATE_FAIL;
c7ad08804fae5b Hugh Dickins      2023-06-08  5349  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
c7ad08804fae5b Hugh Dickins      2023-06-08  5350  					       vmf->address, &vmf->ptl);
c7ad08804fae5b Hugh Dickins      2023-06-08  5351  		if (unlikely(!vmf->pte))
c7ad08804fae5b Hugh Dickins      2023-06-08  5352  			goto out;
c33c794828f212 Ryan Roberts      2023-06-12  5353  		if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
b99a342d4f11a5 Huang Ying        2021-04-29  5354  			pte_unmap_unlock(vmf->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying        2021-04-29  5355  			goto out;
b99a342d4f11a5 Huang Ying        2021-04-29  5356  		}
b99a342d4f11a5 Huang Ying        2021-04-29  5357  		goto out_map;
b99a342d4f11a5 Huang Ying        2021-04-29  5358  	}
4daae3b4b9e49b Mel Gorman        2012-11-02  5359  
4daae3b4b9e49b Mel Gorman        2012-11-02  5360  out:
6695cf68b15c21 Kefeng Wang       2023-09-21  5361  	if (nid != NUMA_NO_NODE)
d2136d749d76af Baolin Wang       2024-03-29  5362  		task_numa_fault(last_cpupid, nid, nr_pages, flags);
d10e63f29488b0 Mel Gorman        2012-10-25  5363  	return 0;
b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))
8d27aa5be8ed93 Kefeng Wang       2024-06-07 @5370  		numa_rebuild_large_mapping(vmf, vma, folio, nr_pages, pte,
8d27aa5be8ed93 Kefeng Wang       2024-06-07  5371  					   ignore_writable, pte_write_upgrade);
d2136d749d76af Baolin Wang       2024-03-29  5372  	else
d2136d749d76af Baolin Wang       2024-03-29  5373  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
d2136d749d76af Baolin Wang       2024-03-29  5374  					    writable);
b99a342d4f11a5 Huang Ying        2021-04-29  5375  	pte_unmap_unlock(vmf->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying        2021-04-29  5376  	goto out;
d10e63f29488b0 Mel Gorman        2012-10-25  5377  }
d10e63f29488b0 Mel Gorman        2012-10-25  5378  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
