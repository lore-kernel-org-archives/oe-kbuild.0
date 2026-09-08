Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142C23815B
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854062; cv=none; b=WbbkjTAkoHjipR1qmaSbeWllXqH6f7xA5f30eE1v4xblP5aUro8aMcyYXkHuSalDlX3zR1SEJwzIsB5YyNyPKpdtrS9z+SB2V0IYHL5uzNGPD+nTE4GanJdFqnaL3l0eq9KQo+9FHaLI/IwhFao0rGZWqOZewcS06TUf+ksmYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854062; c=relaxed/simple;
	bh=yUUrNzBbhQEyGX//HmnO3wnutI5+WquBcQSo98j3Rr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Av8b1+3jm6NGFIjA57/uQjnKnkNhF1ex9qPwtYJdUIey2KZUqebGOIVwCdeQFRCvyrcCbUI3k+Jo/daWMqzG8UWzTM+LttDfoxoS/Fz1UXjns5kxptSGon3SeZQyuA3HVtGtWF3KuPwIu27eZ/fkTRGOGg6b6nOmwyBQy/Q/ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldJtHd5w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldJtHd5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788854060; x=1820390060;
  h=date:from:to:cc:subject:message-id;
  bh=yUUrNzBbhQEyGX//HmnO3wnutI5+WquBcQSo98j3Rr4=;
  b=ldJtHd5wAfZSZv7sMAFkMPfjdfCsrLtEN5ieUweYsA+JnxiDRRFf+DZg
   ultAELplXl2OQJzRIc2PKoUqhYhZ2yXeU6jfWypjOdBet7GEp4Ko8eFju
   umsVeWKCqhrHBv2buscvhBpkPi+yKlkzyok24vyi+47tAZ9q95oIZ5SYA
   sURF1uy1WZ6F2ugsbziiHel6a7Qpv5zLYrIOvHqrRCP/KBA8V2XeAjB5P
   kP2fu84HmSVZFH9B7pj+aqWZ6xhOGfGjpRe3nswZ/VUmTn2zIah7vA2EC
   i904unhSJ4bZADK4sN3vfd6v/7bMCdt1UDFoInJqHi4J9WXaJXSw50+wr
   A==;
X-CSE-ConnectionGUID: 0UJdAMV7RGKgbly56OyQ3A==
X-CSE-MsgGUID: IMCbXNzKRm24talCGSK4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93067301"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93067301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:54:19 -0700
X-CSE-ConnectionGUID: EXEcACSkQI+0W0QAkcRQ+Q==
X-CSE-MsgGUID: rV6nw6cBSrGjWLx07BA5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269600837"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 00:54:18 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3qel-000000001rA-3wPZ;
	Tue, 08 Sep 2026 07:54:15 +0000
Date: Tue, 08 Sep 2026 15:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3481/4316] mm/hugetlb.c:3086
 alloc_hugetlb_folio() warn: mixing irq and irqsave
Message-ID: <202609081528.N9VrC0I3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Zhao Li <enderaoelyther@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: cdf1d821e3e4fbbb91fe4b3890482f5458e2d7c6 [3481/4316] mm/hugetlb: fix max-only subpool accounting on alloc_hugetlb_folio failure
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081528.N9VrC0I3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609081528.N9VrC0I3-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:3086 alloc_hugetlb_folio() warn: mixing irq and irqsave

vim +3086 mm/hugetlb.c

923682a0dd5706 Peter Xu         2025-01-07  2942  
30cef82bc6e897 Peter Xu         2025-01-07  2943  /*
30cef82bc6e897 Peter Xu         2025-01-07  2944   * NOTE! "cow_from_owner" represents a very hacky usage only used in CoW
30cef82bc6e897 Peter Xu         2025-01-07  2945   * faults of hugetlb private mappings on top of a non-page-cache folio (in
30cef82bc6e897 Peter Xu         2025-01-07  2946   * which case even if there's a private vma resv map it won't cover such
30cef82bc6e897 Peter Xu         2025-01-07  2947   * allocation).  New call sites should (probably) never set it to true!!
30cef82bc6e897 Peter Xu         2025-01-07  2948   * When it's set, the allocation will bypass all vma level reservations.
30cef82bc6e897 Peter Xu         2025-01-07  2949   */
d0ce0e47b323a8 Sidhartha Kumar  2023-01-25  2950  struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
30cef82bc6e897 Peter Xu         2025-01-07  2951  				    unsigned long addr, bool cow_from_owner)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2952  {
90481622d75715 David Gibson     2012-03-21  2953  	struct hugepage_subpool *spool = subpool_vma(vma);
a5516438959d90 Andi Kleen       2008-07-23  2954  	struct hstate *h = hstate_vma(vma);
d4ab0316cc33ae Sidhartha Kumar  2022-11-01  2955  	struct folio *folio;
a833a693a490ec Wupeng Ma        2025-04-10  2956  	long retval, gbl_chg, gbl_reserve;
923682a0dd5706 Peter Xu         2025-01-07  2957  	map_chg_state map_chg;
a492abe28bece8 Ackerley Tng     2026-07-02  2958  	struct mempolicy_interpreted mpoli;
66a4e9e11e43f1 Ackerley Tng     2026-07-02  2959  	gfp_t gfp = htlb_alloc_mask(h);
a492abe28bece8 Ackerley Tng     2026-07-02  2960  	struct mempolicy *mpol;
a492abe28bece8 Ackerley Tng     2026-07-02  2961  	nodemask_t *nodemask;
5737df3826dee4 Ackerley Tng     2026-07-02  2962  	u8 alloc_flags = 0;
a492abe28bece8 Ackerley Tng     2026-07-02  2963  	int nid;
5737df3826dee4 Ackerley Tng     2026-07-02  2964  	int ret;
923682a0dd5706 Peter Xu         2025-01-07  2965  
923682a0dd5706 Peter Xu         2025-01-07  2966  	/* Whether we need a separate per-vma reservation? */
923682a0dd5706 Peter Xu         2025-01-07  2967  	if (cow_from_owner) {
923682a0dd5706 Peter Xu         2025-01-07  2968  		/*
923682a0dd5706 Peter Xu         2025-01-07  2969  		 * Special case!  Since it's a CoW on top of a reserved
923682a0dd5706 Peter Xu         2025-01-07  2970  		 * page, the private resv map doesn't count.  So it cannot
923682a0dd5706 Peter Xu         2025-01-07  2971  		 * consume the per-vma resv map even if it's reserved.
923682a0dd5706 Peter Xu         2025-01-07  2972  		 */
923682a0dd5706 Peter Xu         2025-01-07  2973  		map_chg = MAP_CHG_ENFORCED;
923682a0dd5706 Peter Xu         2025-01-07  2974  	} else {
a1e78772d72b26 Mel Gorman       2008-07-23  2975  		/*
d85f69b0b533ec Mike Kravetz     2015-09-08  2976  		 * Examine the region/reserve map to determine if the process
d85f69b0b533ec Mike Kravetz     2015-09-08  2977  		 * has a reservation for the page to be allocated.  A return
d85f69b0b533ec Mike Kravetz     2015-09-08  2978  		 * code of zero indicates a reservation exists (no change).
a1e78772d72b26 Mel Gorman       2008-07-23  2979  		 */
923682a0dd5706 Peter Xu         2025-01-07  2980  		retval = vma_needs_reservation(h, vma, addr);
923682a0dd5706 Peter Xu         2025-01-07  2981  		if (retval < 0)
76dcee75c1aff6 Aneesh Kumar K.V 2012-07-31  2982  			return ERR_PTR(-ENOMEM);
923682a0dd5706 Peter Xu         2025-01-07  2983  		map_chg = retval ? MAP_CHG_NEEDED : MAP_CHG_REUSE;
923682a0dd5706 Peter Xu         2025-01-07  2984  	}
d85f69b0b533ec Mike Kravetz     2015-09-08  2985  
d85f69b0b533ec Mike Kravetz     2015-09-08  2986  	/*
923682a0dd5706 Peter Xu         2025-01-07  2987  	 * Whether we need a separate global reservation?
923682a0dd5706 Peter Xu         2025-01-07  2988  	 *
d85f69b0b533ec Mike Kravetz     2015-09-08  2989  	 * Processes that did not create the mapping will have no
d85f69b0b533ec Mike Kravetz     2015-09-08  2990  	 * reserves as indicated by the region/reserve map. Check
d85f69b0b533ec Mike Kravetz     2015-09-08  2991  	 * that the allocation will not exceed the subpool limit.
923682a0dd5706 Peter Xu         2025-01-07  2992  	 * Or if it can get one from the pool reservation directly.
d85f69b0b533ec Mike Kravetz     2015-09-08  2993  	 */
923682a0dd5706 Peter Xu         2025-01-07  2994  	if (map_chg) {
d85f69b0b533ec Mike Kravetz     2015-09-08  2995  		gbl_chg = hugepage_subpool_get_pages(spool, 1);
564b2eeeb9ad1a Ackerley Tng     2026-07-02  2996  		if (gbl_chg < 0) {
564b2eeeb9ad1a Ackerley Tng     2026-07-02  2997  			ret = -ENOSPC;
8cba9576df601c Nhat Pham        2023-10-06  2998  			goto out_end_reservation;
564b2eeeb9ad1a Ackerley Tng     2026-07-02  2999  		}
923682a0dd5706 Peter Xu         2025-01-07  3000  	} else {
923682a0dd5706 Peter Xu         2025-01-07  3001  		/*
923682a0dd5706 Peter Xu         2025-01-07  3002  		 * If we have the vma reservation ready, no need for extra
923682a0dd5706 Peter Xu         2025-01-07  3003  		 * global reservation.
923682a0dd5706 Peter Xu         2025-01-07  3004  		 */
923682a0dd5706 Peter Xu         2025-01-07  3005  		gbl_chg = 0;
d85f69b0b533ec Mike Kravetz     2015-09-08  3006  	}
d85f69b0b533ec Mike Kravetz     2015-09-08  3007  
923682a0dd5706 Peter Xu         2025-01-07  3008  	/*
5737df3826dee4 Ackerley Tng     2026-07-02  3009  	 * If allocation doesn't reuse a reservation in the resv_map,
5737df3826dee4 Ackerley Tng     2026-07-02  3010  	 * charge for the reservation.
08cf9faf755802 Mina Almasry     2020-04-01  3011  	 */
5737df3826dee4 Ackerley Tng     2026-07-02  3012  	if (map_chg != MAP_CHG_REUSE)
5737df3826dee4 Ackerley Tng     2026-07-02  3013  		alloc_flags |= HUGETLB_ALLOC_CHARG_CGROUP_RSVD;
08cf9faf755802 Mina Almasry     2020-04-01  3014  
d85f69b0b533ec Mike Kravetz     2015-09-08  3015  	/*
5737df3826dee4 Ackerley Tng     2026-07-02  3016  	 * gbl_chg == 0 indicates a reservation exists for this
5737df3826dee4 Ackerley Tng     2026-07-02  3017  	 * allocation, so try to use it.
d85f69b0b533ec Mike Kravetz     2015-09-08  3018  	 */
5737df3826dee4 Ackerley Tng     2026-07-02  3019  	if (gbl_chg == 0)
5737df3826dee4 Ackerley Tng     2026-07-02  3020  		alloc_flags |= HUGETLB_ALLOC_USE_GLOBAL_RESERVATIONS;
ff7d853b031302 Sidhartha Kumar  2023-01-13  3021  
a492abe28bece8 Ackerley Tng     2026-07-02  3022  	/* Takes reference on mpol. */
a492abe28bece8 Ackerley Tng     2026-07-02  3023  	nid = huge_node(vma, addr, gfp, &mpol, &nodemask);
a492abe28bece8 Ackerley Tng     2026-07-02  3024  	mpoli = (struct mempolicy_interpreted){
a492abe28bece8 Ackerley Tng     2026-07-02  3025  		.nid = nid,
a492abe28bece8 Ackerley Tng     2026-07-02  3026  #ifdef CONFIG_NUMA
a492abe28bece8 Ackerley Tng     2026-07-02  3027  		.mode = mpol ? mpol->mode : MPOL_DEFAULT,
a492abe28bece8 Ackerley Tng     2026-07-02  3028  #else
a492abe28bece8 Ackerley Tng     2026-07-02  3029  		.mode = MPOL_DEFAULT,
a492abe28bece8 Ackerley Tng     2026-07-02  3030  #endif
a492abe28bece8 Ackerley Tng     2026-07-02  3031  		.nodemask = nodemask,
a492abe28bece8 Ackerley Tng     2026-07-02  3032  	};
f931af2e41ab40 Peter Xu         2025-01-07  3033  
5737df3826dee4 Ackerley Tng     2026-07-02  3034  	folio = hugetlb_alloc_folio(h, &mpoli, alloc_flags);
08cf9faf755802 Mina Almasry     2020-04-01  3035  
66a4e9e11e43f1 Ackerley Tng     2026-07-02  3036  	mpol_cond_put(mpol);
7893d1d505d59d Adam Litke       2007-10-16  3037  
5737df3826dee4 Ackerley Tng     2026-07-02  3038  	if (IS_ERR(folio)) {
5737df3826dee4 Ackerley Tng     2026-07-02  3039  		ret = PTR_ERR(folio);
177e1cbbb58128 Ackerley Tng     2026-07-02  3040  		goto out_subpool_put;
177e1cbbb58128 Ackerley Tng     2026-07-02  3041  	}
7893d1d505d59d Adam Litke       2007-10-16  3042  
ff7d853b031302 Sidhartha Kumar  2023-01-13  3043  	hugetlb_set_folio_subpool(folio, spool);
a1e78772d72b26 Mel Gorman       2008-07-23  3044  
923682a0dd5706 Peter Xu         2025-01-07  3045  	if (map_chg != MAP_CHG_ENFORCED) {
923682a0dd5706 Peter Xu         2025-01-07  3046  		/* commit() is only needed if the map_chg is not enforced */
923682a0dd5706 Peter Xu         2025-01-07  3047  		retval = vma_commit_reservation(h, vma, addr);
33039678c8da81 Mike Kravetz     2015-06-24  3048  		/*
923682a0dd5706 Peter Xu         2025-01-07  3049  		 * Check for possible race conditions. When it happens..
33039678c8da81 Mike Kravetz     2015-06-24  3050  		 * The page was added to the reservation map between
33039678c8da81 Mike Kravetz     2015-06-24  3051  		 * vma_needs_reservation and vma_commit_reservation.
33039678c8da81 Mike Kravetz     2015-06-24  3052  		 * This indicates a race with hugetlb_reserve_pages.
33039678c8da81 Mike Kravetz     2015-06-24  3053  		 * Adjust for the subpool count incremented above AND
33039678c8da81 Mike Kravetz     2015-06-24  3054  		 * in hugetlb_reserve_pages for the same page.	Also,
33039678c8da81 Mike Kravetz     2015-06-24  3055  		 * the reservation count added in hugetlb_reserve_pages
33039678c8da81 Mike Kravetz     2015-06-24  3056  		 * no longer applies.
33039678c8da81 Mike Kravetz     2015-06-24  3057  		 */
923682a0dd5706 Peter Xu         2025-01-07  3058  		if (unlikely(map_chg == MAP_CHG_NEEDED && retval == 0)) {
33039678c8da81 Mike Kravetz     2015-06-24  3059  			long rsv_adjust;
33039678c8da81 Mike Kravetz     2015-06-24  3060  
33039678c8da81 Mike Kravetz     2015-06-24  3061  			rsv_adjust = hugepage_subpool_put_pages(spool, 1);
33039678c8da81 Mike Kravetz     2015-06-24  3062  			hugetlb_acct_memory(h, -rsv_adjust);
b76b46902c2d03 Peter Xu         2024-04-17  3063  			spin_lock_irq(&hugetlb_lock);
923682a0dd5706 Peter Xu         2025-01-07  3064  			hugetlb_cgroup_uncharge_folio_rsvd(
a1c655f5544415 Joshua Hahn      2026-01-16  3065  			    hstate_index(h), pages_per_huge_page(h), folio);
b76b46902c2d03 Peter Xu         2024-04-17  3066  			spin_unlock_irq(&hugetlb_lock);
b76b46902c2d03 Peter Xu         2024-04-17  3067  		}
33039678c8da81 Mike Kravetz     2015-06-24  3068  	}
8cba9576df601c Nhat Pham        2023-10-06  3069  
d0ce0e47b323a8 Sidhartha Kumar  2023-01-25  3070  	return folio;
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3071  
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3072  out_subpool_put:
cdf1d821e3e4fb Zhao Li          2026-04-28  3073  	if (map_chg) {
cdf1d821e3e4fb Zhao Li          2026-04-28  3074  		if (!gbl_chg) {
cdf1d821e3e4fb Zhao Li          2026-04-28  3075  			/* Full inverse when subpool_get_pages() consumed rsv_hpages. */
a833a693a490ec Wupeng Ma        2025-04-10  3076  			gbl_reserve = hugepage_subpool_put_pages(spool, 1);
a833a693a490ec Wupeng Ma        2025-04-10  3077  			hugetlb_acct_memory(h, -gbl_reserve);
cdf1d821e3e4fb Zhao Li          2026-04-28  3078  		} else if (gbl_chg > 0 && spool && spool->min_hpages == -1 &&
cdf1d821e3e4fb Zhao Li          2026-04-28  3079  			   spool->max_hpages != -1) {
cdf1d821e3e4fb Zhao Li          2026-04-28  3080  			unsigned long flags;
cdf1d821e3e4fb Zhao Li          2026-04-28  3081  
cdf1d821e3e4fb Zhao Li          2026-04-28  3082  			/*
cdf1d821e3e4fb Zhao Li          2026-04-28  3083  			 * For max-only subpools, subpool_get_pages() took only a
cdf1d821e3e4fb Zhao Li          2026-04-28  3084  			 * speculative used_hpages slot. Drop that slot directly.
cdf1d821e3e4fb Zhao Li          2026-04-28  3085  			 */
cdf1d821e3e4fb Zhao Li          2026-04-28 @3086  			spin_lock_irqsave(&spool->lock, flags);
cdf1d821e3e4fb Zhao Li          2026-04-28  3087  			if (spool->used_hpages > 0)
cdf1d821e3e4fb Zhao Li          2026-04-28  3088  				spool->used_hpages--;
cdf1d821e3e4fb Zhao Li          2026-04-28  3089  			unlock_or_release_subpool(spool, flags);
cdf1d821e3e4fb Zhao Li          2026-04-28  3090  		}
a833a693a490ec Wupeng Ma        2025-04-10  3091  	}
a833a693a490ec Wupeng Ma        2025-04-10  3092  
8cba9576df601c Nhat Pham        2023-10-06  3093  out_end_reservation:
923682a0dd5706 Peter Xu         2025-01-07  3094  	if (map_chg != MAP_CHG_ENFORCED)
feba16e25a5780 Mike Kravetz     2015-09-08  3095  		vma_end_reservation(h, vma, addr);
564b2eeeb9ad1a Ackerley Tng     2026-07-02  3096  	return ERR_PTR(ret);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3097  }
b45b5bd65f668a David Gibson     2006-03-22  3098  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
