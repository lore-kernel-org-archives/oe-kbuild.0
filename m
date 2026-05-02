Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D8188596
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777712324; cv=none; b=SSJxAa9UKSFIBWmXaf9F6uZaRA0Uao5jPR64uYs21tmcU4JJPfEAW0JDPVwLASBRF43O6iQ2SZWmu7GV6qZ5f3SpgTqW/wZ/+GU5ZRf/FX6Dua+mtMuOaWj39uK0nK/1b05kS6pFJq7Ek2vLlS7+Wf/FnqpiXDtaiR4a8Ewslnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777712324; c=relaxed/simple;
	bh=C0cmldqQjhtcQZx8QyOcHdhXKipbpANqPHLPjnRAUag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U97g6ADW0skAhfItyZDRChit6s8Dc57tk3JWTmsvdujK5OkfOW1mi+h0KaVPTuDZjmCo3No2QvapVdXP3psg1yHPePAOG040+bcXH8HF26vEaaY3UiCyqVThYNJ/1qnerUqaCekanJtwvaB79hlV+/ciP6sPC9fZUzf0JWwKcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYzY5FJW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYzY5FJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777712321; x=1809248321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0cmldqQjhtcQZx8QyOcHdhXKipbpANqPHLPjnRAUag=;
  b=OYzY5FJWO4LfRdQFBk+dPI5tSX0Uj7v/qrhwlfMi5N4wDphK6u8U2Rt9
   Ckvul11BDw8Jyx3k5IUrKdjS3NVxP3PALPKVukULPDEHoLqo3aZ49z8vz
   8jBLdGW/tixfy9ntgM5LahShXu7u1gslu1h/KMqLSdzUvsw3ho4pGYTtK
   zGURz4CCmfZ2DIFURzXw3G2NaSfgfN4uuJy+fpiE8e/cUXpyBkdRvJuML
   BcoIRCYb4zGcxjL3bsYDxG0n/eaoYufXIl08O49t/z6HTpDjtlRqskjR+
   791BzkuQDE10IeRCZjDR2Nh/VO6lTXGUPASefplgIPZNI6+M0fus/C+sd
   g==;
X-CSE-ConnectionGUID: jA8PFBZRRh6UBk8l3rYM+w==
X-CSE-MsgGUID: GeF10hIOTFWZn7woiBw9IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89347100"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="89347100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 01:58:38 -0700
X-CSE-ConnectionGUID: YjFnYC1ARcGv24q0fPdPeA==
X-CSE-MsgGUID: AOFme1PKRAS/polCzeq2Hg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2026 01:58:36 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ6BG-000000001HL-3H8K;
	Sat, 02 May 2026 08:58:34 +0000
Date: Sat, 2 May 2026 16:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix max-only subpool accounting on
 alloc_hugetlb_folio failure
Message-ID: <202605021600.IYZD9zHl-lkp@intel.com>
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
In-Reply-To: <20260428113037.88766-2-enderaoelyther@gmail.com>
References: <20260428113037.88766-2-enderaoelyther@gmail.com>
TO: Zhao Li <enderaoelyther@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mawupeng1@huawei.com
CC: Zhao Li <enderaoelyther@gmail.com>
CC: Muchun Song <muchun.song@linux.dev>
CC: Oscar Salvador <osalvador@suse.de>
CC: David Hildenbrand <david@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org

Hi Zhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc1 next-20260430]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhao-Li/mm-hugetlb-fix-max-only-subpool-accounting-on-alloc_hugetlb_folio-failure/20260429-135834
base:   linus/master
patch link:    https://lore.kernel.org/r/20260428113037.88766-2-enderaoelyther%40gmail.com
patch subject: [PATCH v3] mm/hugetlb: fix max-only subpool accounting on alloc_hugetlb_folio failure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20260501 (https://download.01.org/0day-ci/archive/20260502/202605021600.IYZD9zHl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605021600.IYZD9zHl-lkp@intel.com/

New smatch warnings:
mm/hugetlb.c:3041 alloc_hugetlb_folio() warn: mixing irq and irqsave

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:223 early_mmu_has_feature() warn: bitwise AND condition is false here
arch/powerpc/include/asm/book3s/64/pgtable.h:678 pte_swp_soft_dirty() warn: bitwise AND condition is false here

vim +3041 mm/hugetlb.c

923682a0dd57065 Peter Xu         2025-01-07  2864  
30cef82bc6e8975 Peter Xu         2025-01-07  2865  /*
30cef82bc6e8975 Peter Xu         2025-01-07  2866   * NOTE! "cow_from_owner" represents a very hacky usage only used in CoW
30cef82bc6e8975 Peter Xu         2025-01-07  2867   * faults of hugetlb private mappings on top of a non-page-cache folio (in
30cef82bc6e8975 Peter Xu         2025-01-07  2868   * which case even if there's a private vma resv map it won't cover such
30cef82bc6e8975 Peter Xu         2025-01-07  2869   * allocation).  New call sites should (probably) never set it to true!!
30cef82bc6e8975 Peter Xu         2025-01-07  2870   * When it's set, the allocation will bypass all vma level reservations.
30cef82bc6e8975 Peter Xu         2025-01-07  2871   */
d0ce0e47b323a8d Sidhartha Kumar  2023-01-25  2872  struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
30cef82bc6e8975 Peter Xu         2025-01-07  2873  				    unsigned long addr, bool cow_from_owner)
^1da177e4c3f415 Linus Torvalds   2005-04-16  2874  {
90481622d75715b David Gibson     2012-03-21  2875  	struct hugepage_subpool *spool = subpool_vma(vma);
a5516438959d90b Andi Kleen       2008-07-23  2876  	struct hstate *h = hstate_vma(vma);
d4ab0316cc33aee Sidhartha Kumar  2022-11-01  2877  	struct folio *folio;
a833a693a490ecf Wupeng Ma        2025-04-10  2878  	long retval, gbl_chg, gbl_reserve;
923682a0dd57065 Peter Xu         2025-01-07  2879  	map_chg_state map_chg;
991135774c0e05a Joshua Hahn      2024-12-11  2880  	int ret, idx;
d0ce0e47b323a8d Sidhartha Kumar  2023-01-25  2881  	struct hugetlb_cgroup *h_cg = NULL;
8cba9576df601c3 Nhat Pham        2023-10-06  2882  	gfp_t gfp = htlb_alloc_mask(h) | __GFP_RETRY_MAYFAIL;
8cba9576df601c3 Nhat Pham        2023-10-06  2883  
6d76dcf40405144 Aneesh Kumar K.V 2012-07-31  2884  	idx = hstate_index(h);
923682a0dd57065 Peter Xu         2025-01-07  2885  
923682a0dd57065 Peter Xu         2025-01-07  2886  	/* Whether we need a separate per-vma reservation? */
923682a0dd57065 Peter Xu         2025-01-07  2887  	if (cow_from_owner) {
923682a0dd57065 Peter Xu         2025-01-07  2888  		/*
923682a0dd57065 Peter Xu         2025-01-07  2889  		 * Special case!  Since it's a CoW on top of a reserved
923682a0dd57065 Peter Xu         2025-01-07  2890  		 * page, the private resv map doesn't count.  So it cannot
923682a0dd57065 Peter Xu         2025-01-07  2891  		 * consume the per-vma resv map even if it's reserved.
923682a0dd57065 Peter Xu         2025-01-07  2892  		 */
923682a0dd57065 Peter Xu         2025-01-07  2893  		map_chg = MAP_CHG_ENFORCED;
923682a0dd57065 Peter Xu         2025-01-07  2894  	} else {
a1e78772d72b261 Mel Gorman       2008-07-23  2895  		/*
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2896  		 * Examine the region/reserve map to determine if the process
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2897  		 * has a reservation for the page to be allocated.  A return
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2898  		 * code of zero indicates a reservation exists (no change).
a1e78772d72b261 Mel Gorman       2008-07-23  2899  		 */
923682a0dd57065 Peter Xu         2025-01-07  2900  		retval = vma_needs_reservation(h, vma, addr);
923682a0dd57065 Peter Xu         2025-01-07  2901  		if (retval < 0)
76dcee75c1aff61 Aneesh Kumar K.V 2012-07-31  2902  			return ERR_PTR(-ENOMEM);
923682a0dd57065 Peter Xu         2025-01-07  2903  		map_chg = retval ? MAP_CHG_NEEDED : MAP_CHG_REUSE;
923682a0dd57065 Peter Xu         2025-01-07  2904  	}
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2905  
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2906  	/*
923682a0dd57065 Peter Xu         2025-01-07  2907  	 * Whether we need a separate global reservation?
923682a0dd57065 Peter Xu         2025-01-07  2908  	 *
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2909  	 * Processes that did not create the mapping will have no
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2910  	 * reserves as indicated by the region/reserve map. Check
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2911  	 * that the allocation will not exceed the subpool limit.
923682a0dd57065 Peter Xu         2025-01-07  2912  	 * Or if it can get one from the pool reservation directly.
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2913  	 */
923682a0dd57065 Peter Xu         2025-01-07  2914  	if (map_chg) {
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2915  		gbl_chg = hugepage_subpool_get_pages(spool, 1);
8cba9576df601c3 Nhat Pham        2023-10-06  2916  		if (gbl_chg < 0)
8cba9576df601c3 Nhat Pham        2023-10-06  2917  			goto out_end_reservation;
923682a0dd57065 Peter Xu         2025-01-07  2918  	} else {
923682a0dd57065 Peter Xu         2025-01-07  2919  		/*
923682a0dd57065 Peter Xu         2025-01-07  2920  		 * If we have the vma reservation ready, no need for extra
923682a0dd57065 Peter Xu         2025-01-07  2921  		 * global reservation.
923682a0dd57065 Peter Xu         2025-01-07  2922  		 */
923682a0dd57065 Peter Xu         2025-01-07  2923  		gbl_chg = 0;
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2924  	}
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2925  
923682a0dd57065 Peter Xu         2025-01-07  2926  	/*
923682a0dd57065 Peter Xu         2025-01-07  2927  	 * If this allocation is not consuming a per-vma reservation,
923682a0dd57065 Peter Xu         2025-01-07  2928  	 * charge the hugetlb cgroup now.
08cf9faf7558020 Mina Almasry     2020-04-01  2929  	 */
923682a0dd57065 Peter Xu         2025-01-07  2930  	if (map_chg) {
08cf9faf7558020 Mina Almasry     2020-04-01  2931  		ret = hugetlb_cgroup_charge_cgroup_rsvd(
08cf9faf7558020 Mina Almasry     2020-04-01  2932  			idx, pages_per_huge_page(h), &h_cg);
8f34af6f93aee88 Jianyu Zhan      2014-06-04  2933  		if (ret)
8f34af6f93aee88 Jianyu Zhan      2014-06-04  2934  			goto out_subpool_put;
08cf9faf7558020 Mina Almasry     2020-04-01  2935  	}
08cf9faf7558020 Mina Almasry     2020-04-01  2936  
08cf9faf7558020 Mina Almasry     2020-04-01  2937  	ret = hugetlb_cgroup_charge_cgroup(idx, pages_per_huge_page(h), &h_cg);
08cf9faf7558020 Mina Almasry     2020-04-01  2938  	if (ret)
08cf9faf7558020 Mina Almasry     2020-04-01  2939  		goto out_uncharge_cgroup_reservation;
8f34af6f93aee88 Jianyu Zhan      2014-06-04  2940  
db71ef79b59bb2e Mike Kravetz     2021-05-04  2941  	spin_lock_irq(&hugetlb_lock);
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2942  	/*
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2943  	 * glb_chg is passed to indicate whether or not a page must be taken
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2944  	 * from the global free pool (global change).  gbl_chg == 0 indicates
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2945  	 * a reservation exists for the allocation.
d85f69b0b533ec6 Mike Kravetz     2015-09-08  2946  	 */
58db7c5fbe7daa4 Peter Xu         2025-01-07  2947  	folio = dequeue_hugetlb_folio_vma(h, vma, addr, gbl_chg);
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2948  	if (!folio) {
db71ef79b59bb2e Mike Kravetz     2021-05-04  2949  		spin_unlock_irq(&hugetlb_lock);
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2950  		folio = alloc_buddy_hugetlb_folio_with_mpol(h, vma, addr);
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2951  		if (!folio)
8f34af6f93aee88 Jianyu Zhan      2014-06-04  2952  			goto out_uncharge_cgroup;
12df140f0bdfae5 Rik van Riel     2022-10-17  2953  		spin_lock_irq(&hugetlb_lock);
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2954  		list_add(&folio->lru, &h->hugepage_activelist);
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2955  		folio_ref_unfreeze(folio, 1);
81a6fcae3ff3f6a Joonsoo Kim      2013-09-11  2956  		/* Fall through */
68842c9b94560e6 Ken Chen         2008-01-14  2957  	}
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2958  
f931af2e41ab406 Peter Xu         2025-01-07  2959  	/*
f931af2e41ab406 Peter Xu         2025-01-07  2960  	 * Either dequeued or buddy-allocated folio needs to add special
f931af2e41ab406 Peter Xu         2025-01-07  2961  	 * mark to the folio when it consumes a global reservation.
f931af2e41ab406 Peter Xu         2025-01-07  2962  	 */
f931af2e41ab406 Peter Xu         2025-01-07  2963  	if (!gbl_chg) {
f931af2e41ab406 Peter Xu         2025-01-07  2964  		folio_set_hugetlb_restore_reserve(folio);
f931af2e41ab406 Peter Xu         2025-01-07  2965  		h->resv_huge_pages--;
f931af2e41ab406 Peter Xu         2025-01-07  2966  	}
f931af2e41ab406 Peter Xu         2025-01-07  2967  
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2968  	hugetlb_cgroup_commit_charge(idx, pages_per_huge_page(h), h_cg, folio);
08cf9faf7558020 Mina Almasry     2020-04-01  2969  	/* If allocation is not consuming a reservation, also store the
08cf9faf7558020 Mina Almasry     2020-04-01  2970  	 * hugetlb_cgroup pointer on the page.
08cf9faf7558020 Mina Almasry     2020-04-01  2971  	 */
923682a0dd57065 Peter Xu         2025-01-07  2972  	if (map_chg) {
08cf9faf7558020 Mina Almasry     2020-04-01  2973  		hugetlb_cgroup_commit_charge_rsvd(idx, pages_per_huge_page(h),
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2974  						  h_cg, folio);
08cf9faf7558020 Mina Almasry     2020-04-01  2975  	}
08cf9faf7558020 Mina Almasry     2020-04-01  2976  
db71ef79b59bb2e Mike Kravetz     2021-05-04  2977  	spin_unlock_irq(&hugetlb_lock);
7893d1d505d59db Adam Litke       2007-10-16  2978  
ff7d853b0313023 Sidhartha Kumar  2023-01-13  2979  	hugetlb_set_folio_subpool(folio, spool);
a1e78772d72b261 Mel Gorman       2008-07-23  2980  
923682a0dd57065 Peter Xu         2025-01-07  2981  	if (map_chg != MAP_CHG_ENFORCED) {
923682a0dd57065 Peter Xu         2025-01-07  2982  		/* commit() is only needed if the map_chg is not enforced */
923682a0dd57065 Peter Xu         2025-01-07  2983  		retval = vma_commit_reservation(h, vma, addr);
33039678c8da813 Mike Kravetz     2015-06-24  2984  		/*
923682a0dd57065 Peter Xu         2025-01-07  2985  		 * Check for possible race conditions. When it happens..
33039678c8da813 Mike Kravetz     2015-06-24  2986  		 * The page was added to the reservation map between
33039678c8da813 Mike Kravetz     2015-06-24  2987  		 * vma_needs_reservation and vma_commit_reservation.
33039678c8da813 Mike Kravetz     2015-06-24  2988  		 * This indicates a race with hugetlb_reserve_pages.
33039678c8da813 Mike Kravetz     2015-06-24  2989  		 * Adjust for the subpool count incremented above AND
33039678c8da813 Mike Kravetz     2015-06-24  2990  		 * in hugetlb_reserve_pages for the same page.	Also,
33039678c8da813 Mike Kravetz     2015-06-24  2991  		 * the reservation count added in hugetlb_reserve_pages
33039678c8da813 Mike Kravetz     2015-06-24  2992  		 * no longer applies.
33039678c8da813 Mike Kravetz     2015-06-24  2993  		 */
923682a0dd57065 Peter Xu         2025-01-07  2994  		if (unlikely(map_chg == MAP_CHG_NEEDED && retval == 0)) {
33039678c8da813 Mike Kravetz     2015-06-24  2995  			long rsv_adjust;
33039678c8da813 Mike Kravetz     2015-06-24  2996  
33039678c8da813 Mike Kravetz     2015-06-24  2997  			rsv_adjust = hugepage_subpool_put_pages(spool, 1);
33039678c8da813 Mike Kravetz     2015-06-24  2998  			hugetlb_acct_memory(h, -rsv_adjust);
b76b46902c2d039 Peter Xu         2024-04-17  2999  			spin_lock_irq(&hugetlb_lock);
923682a0dd57065 Peter Xu         2025-01-07  3000  			hugetlb_cgroup_uncharge_folio_rsvd(
a1c655f55444156 Joshua Hahn      2026-01-16  3001  			    hstate_index(h), pages_per_huge_page(h), folio);
b76b46902c2d039 Peter Xu         2024-04-17  3002  			spin_unlock_irq(&hugetlb_lock);
b76b46902c2d039 Peter Xu         2024-04-17  3003  		}
33039678c8da813 Mike Kravetz     2015-06-24  3004  	}
8cba9576df601c3 Nhat Pham        2023-10-06  3005  
991135774c0e05a Joshua Hahn      2024-12-11  3006  	ret = mem_cgroup_charge_hugetlb(folio, gfp);
991135774c0e05a Joshua Hahn      2024-12-11  3007  	/*
991135774c0e05a Joshua Hahn      2024-12-11  3008  	 * Unconditionally increment NR_HUGETLB here. If it turns out that
991135774c0e05a Joshua Hahn      2024-12-11  3009  	 * mem_cgroup_charge_hugetlb failed, then immediately free the page and
991135774c0e05a Joshua Hahn      2024-12-11  3010  	 * decrement NR_HUGETLB.
991135774c0e05a Joshua Hahn      2024-12-11  3011  	 */
05d4532b60e3e6e Joshua Hahn      2024-11-01  3012  	lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
991135774c0e05a Joshua Hahn      2024-12-11  3013  
991135774c0e05a Joshua Hahn      2024-12-11  3014  	if (ret == -ENOMEM) {
991135774c0e05a Joshua Hahn      2024-12-11  3015  		free_huge_folio(folio);
991135774c0e05a Joshua Hahn      2024-12-11  3016  		return ERR_PTR(-ENOMEM);
991135774c0e05a Joshua Hahn      2024-12-11  3017  	}
8cba9576df601c3 Nhat Pham        2023-10-06  3018  
d0ce0e47b323a8d Sidhartha Kumar  2023-01-25  3019  	return folio;
8f34af6f93aee88 Jianyu Zhan      2014-06-04  3020  
8f34af6f93aee88 Jianyu Zhan      2014-06-04  3021  out_uncharge_cgroup:
8f34af6f93aee88 Jianyu Zhan      2014-06-04  3022  	hugetlb_cgroup_uncharge_cgroup(idx, pages_per_huge_page(h), h_cg);
08cf9faf7558020 Mina Almasry     2020-04-01  3023  out_uncharge_cgroup_reservation:
923682a0dd57065 Peter Xu         2025-01-07  3024  	if (map_chg)
08cf9faf7558020 Mina Almasry     2020-04-01  3025  		hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
08cf9faf7558020 Mina Almasry     2020-04-01  3026  						    h_cg);
8f34af6f93aee88 Jianyu Zhan      2014-06-04  3027  out_subpool_put:
f7c7f89890cf4f3 Zhao Li          2026-04-28  3028  	if (map_chg) {
f7c7f89890cf4f3 Zhao Li          2026-04-28  3029  		if (!gbl_chg) {
f7c7f89890cf4f3 Zhao Li          2026-04-28  3030  			/* Full inverse when subpool_get_pages() consumed rsv_hpages. */
a833a693a490ecf Wupeng Ma        2025-04-10  3031  			gbl_reserve = hugepage_subpool_put_pages(spool, 1);
a833a693a490ecf Wupeng Ma        2025-04-10  3032  			hugetlb_acct_memory(h, -gbl_reserve);
f7c7f89890cf4f3 Zhao Li          2026-04-28  3033  		} else if (gbl_chg > 0 && spool && spool->min_hpages == -1 &&
f7c7f89890cf4f3 Zhao Li          2026-04-28  3034  			   spool->max_hpages != -1) {
f7c7f89890cf4f3 Zhao Li          2026-04-28  3035  			unsigned long flags;
f7c7f89890cf4f3 Zhao Li          2026-04-28  3036  
f7c7f89890cf4f3 Zhao Li          2026-04-28  3037  			/*
f7c7f89890cf4f3 Zhao Li          2026-04-28  3038  			 * For max-only subpools, subpool_get_pages() took only a
f7c7f89890cf4f3 Zhao Li          2026-04-28  3039  			 * speculative used_hpages slot. Drop that slot directly.
f7c7f89890cf4f3 Zhao Li          2026-04-28  3040  			 */
f7c7f89890cf4f3 Zhao Li          2026-04-28 @3041  			spin_lock_irqsave(&spool->lock, flags);
f7c7f89890cf4f3 Zhao Li          2026-04-28  3042  			if (spool->used_hpages > 0)
f7c7f89890cf4f3 Zhao Li          2026-04-28  3043  				spool->used_hpages--;
f7c7f89890cf4f3 Zhao Li          2026-04-28  3044  			unlock_or_release_subpool(spool, flags);
f7c7f89890cf4f3 Zhao Li          2026-04-28  3045  		}
a833a693a490ecf Wupeng Ma        2025-04-10  3046  	}
a833a693a490ecf Wupeng Ma        2025-04-10  3047  
a833a693a490ecf Wupeng Ma        2025-04-10  3048  
8cba9576df601c3 Nhat Pham        2023-10-06  3049  out_end_reservation:
923682a0dd57065 Peter Xu         2025-01-07  3050  	if (map_chg != MAP_CHG_ENFORCED)
feba16e25a57808 Mike Kravetz     2015-09-08  3051  		vma_end_reservation(h, vma, addr);
8f34af6f93aee88 Jianyu Zhan      2014-06-04  3052  	return ERR_PTR(-ENOSPC);
^1da177e4c3f415 Linus Torvalds   2005-04-16  3053  }
b45b5bd65f668a6 David Gibson     2006-03-22  3054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
