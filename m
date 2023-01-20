Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB62256E
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674224473; x=1705760473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBUCLxlFW/t6mqK5whpjOPF4Gx5ISfYOe4ioyK/Iqng=;
  b=c3eAUSd3Oj8ttdPP6JQ4aJIcPOHFXSP0z+NY+0SZD1R6v4EJbHgrCS5K
   3lMydTAfO/GlIS/ySxn+N1qdJqPD8Lh0uHJJQFA2IFq/y8DlNJMQF1H3U
   LFSYPyEIAjsL4P7CaY6MJEOW5azXoCbQnsPQy4XCj79pqSQffZblovvhs
   5D/WQkZ7+Wex4ytuDcPar3zomrDXFpKY/Eh952CSIbZSsncsyoqs0w7w9
   8zUErOuexZBF8/seQVtZdCymP2QdcQAwSkEFwE6ld8FtqIC95hXx53H5+
   lE3TNe3fgkUzLhmc5m2N1+1RXhOylbuE9IyaodymL3tsXdknIO6D0UcSV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324268959"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324268959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 06:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905978501"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="905978501"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2023 06:21:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIsGP-0002cM-13;
	Fri, 20 Jan 2023 14:21:05 +0000
Date: Fri, 20 Jan 2023 22:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6810/6912] mm/hugetlb.c:3101
 alloc_hugetlb_folio() error: uninitialized symbol 'h_cg'.
Message-ID: <202301202207.AHQn9hKW-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sidhartha Kumar <sidhartha.kumar@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: ee2b5e0fb8de76a4acc5cf4aa340270e995aaea2 [6810/6912] mm/hugetlb: convert alloc_huge_page to alloc_hugetlb_folio
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230120/202301202207.AHQn9hKW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/hugetlb.c:3101 alloc_hugetlb_folio() error: uninitialized symbol 'h_cg'.

vim +/h_cg +3101 mm/hugetlb.c

369fa227c21949 Oscar Salvador   2021-05-04  3016  
ee2b5e0fb8de76 Sidhartha Kumar  2023-01-19  3017  struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
04f2cbe35699d2 Mel Gorman       2008-07-23  3018  				    unsigned long addr, int avoid_reserve)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3019  {
90481622d75715 David Gibson     2012-03-21  3020  	struct hugepage_subpool *spool = subpool_vma(vma);
a5516438959d90 Andi Kleen       2008-07-23  3021  	struct hstate *h = hstate_vma(vma);
d4ab0316cc33ae Sidhartha Kumar  2022-11-01  3022  	struct folio *folio;
d85f69b0b533ec Mike Kravetz     2015-09-08  3023  	long map_chg, map_commit;
d85f69b0b533ec Mike Kravetz     2015-09-08  3024  	long gbl_chg;
6d76dcf4040514 Aneesh Kumar K.V 2012-07-31  3025  	int ret, idx;
6d76dcf4040514 Aneesh Kumar K.V 2012-07-31  3026  	struct hugetlb_cgroup *h_cg;
08cf9faf755802 Mina Almasry     2020-04-01  3027  	bool deferred_reserve;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3028  
6d76dcf4040514 Aneesh Kumar K.V 2012-07-31  3029  	idx = hstate_index(h);
a1e78772d72b26 Mel Gorman       2008-07-23  3030  	/*
d85f69b0b533ec Mike Kravetz     2015-09-08  3031  	 * Examine the region/reserve map to determine if the process
d85f69b0b533ec Mike Kravetz     2015-09-08  3032  	 * has a reservation for the page to be allocated.  A return
d85f69b0b533ec Mike Kravetz     2015-09-08  3033  	 * code of zero indicates a reservation exists (no change).
a1e78772d72b26 Mel Gorman       2008-07-23  3034  	 */
d85f69b0b533ec Mike Kravetz     2015-09-08  3035  	map_chg = gbl_chg = vma_needs_reservation(h, vma, addr);
d85f69b0b533ec Mike Kravetz     2015-09-08  3036  	if (map_chg < 0)
76dcee75c1aff6 Aneesh Kumar K.V 2012-07-31  3037  		return ERR_PTR(-ENOMEM);
d85f69b0b533ec Mike Kravetz     2015-09-08  3038  
d85f69b0b533ec Mike Kravetz     2015-09-08  3039  	/*
d85f69b0b533ec Mike Kravetz     2015-09-08  3040  	 * Processes that did not create the mapping will have no
d85f69b0b533ec Mike Kravetz     2015-09-08  3041  	 * reserves as indicated by the region/reserve map. Check
d85f69b0b533ec Mike Kravetz     2015-09-08  3042  	 * that the allocation will not exceed the subpool limit.
d85f69b0b533ec Mike Kravetz     2015-09-08  3043  	 * Allocations for MAP_NORESERVE mappings also need to be
d85f69b0b533ec Mike Kravetz     2015-09-08  3044  	 * checked against any subpool limit.
d85f69b0b533ec Mike Kravetz     2015-09-08  3045  	 */
d85f69b0b533ec Mike Kravetz     2015-09-08  3046  	if (map_chg || avoid_reserve) {
d85f69b0b533ec Mike Kravetz     2015-09-08  3047  		gbl_chg = hugepage_subpool_get_pages(spool, 1);
d85f69b0b533ec Mike Kravetz     2015-09-08  3048  		if (gbl_chg < 0) {
feba16e25a5780 Mike Kravetz     2015-09-08  3049  			vma_end_reservation(h, vma, addr);
76dcee75c1aff6 Aneesh Kumar K.V 2012-07-31  3050  			return ERR_PTR(-ENOSPC);
5e9113731a3ce6 Mike Kravetz     2015-09-08  3051  		}
b45b5bd65f668a David Gibson     2006-03-22  3052  
d85f69b0b533ec Mike Kravetz     2015-09-08  3053  		/*
d85f69b0b533ec Mike Kravetz     2015-09-08  3054  		 * Even though there was no reservation in the region/reserve
d85f69b0b533ec Mike Kravetz     2015-09-08  3055  		 * map, there could be reservations associated with the
d85f69b0b533ec Mike Kravetz     2015-09-08  3056  		 * subpool that can be used.  This would be indicated if the
d85f69b0b533ec Mike Kravetz     2015-09-08  3057  		 * return value of hugepage_subpool_get_pages() is zero.
d85f69b0b533ec Mike Kravetz     2015-09-08  3058  		 * However, if avoid_reserve is specified we still avoid even
d85f69b0b533ec Mike Kravetz     2015-09-08  3059  		 * the subpool reservations.
d85f69b0b533ec Mike Kravetz     2015-09-08  3060  		 */
d85f69b0b533ec Mike Kravetz     2015-09-08  3061  		if (avoid_reserve)
d85f69b0b533ec Mike Kravetz     2015-09-08  3062  			gbl_chg = 1;
d85f69b0b533ec Mike Kravetz     2015-09-08  3063  	}
d85f69b0b533ec Mike Kravetz     2015-09-08  3064  
08cf9faf755802 Mina Almasry     2020-04-01  3065  	/* If this allocation is not consuming a reservation, charge it now.
08cf9faf755802 Mina Almasry     2020-04-01  3066  	 */
6501fe5f162395 Miaohe Lin       2021-05-04  3067  	deferred_reserve = map_chg || avoid_reserve;
08cf9faf755802 Mina Almasry     2020-04-01  3068  	if (deferred_reserve) {
08cf9faf755802 Mina Almasry     2020-04-01  3069  		ret = hugetlb_cgroup_charge_cgroup_rsvd(
08cf9faf755802 Mina Almasry     2020-04-01  3070  			idx, pages_per_huge_page(h), &h_cg);
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3071  		if (ret)
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3072  			goto out_subpool_put;
08cf9faf755802 Mina Almasry     2020-04-01  3073  	}
08cf9faf755802 Mina Almasry     2020-04-01  3074  
08cf9faf755802 Mina Almasry     2020-04-01  3075  	ret = hugetlb_cgroup_charge_cgroup(idx, pages_per_huge_page(h), &h_cg);
08cf9faf755802 Mina Almasry     2020-04-01  3076  	if (ret)
08cf9faf755802 Mina Almasry     2020-04-01  3077  		goto out_uncharge_cgroup_reservation;
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3078  
db71ef79b59bb2 Mike Kravetz     2021-05-04  3079  	spin_lock_irq(&hugetlb_lock);
d85f69b0b533ec Mike Kravetz     2015-09-08  3080  	/*
d85f69b0b533ec Mike Kravetz     2015-09-08  3081  	 * glb_chg is passed to indicate whether or not a page must be taken
d85f69b0b533ec Mike Kravetz     2015-09-08  3082  	 * from the global free pool (global change).  gbl_chg == 0 indicates
d85f69b0b533ec Mike Kravetz     2015-09-08  3083  	 * a reservation exists for the allocation.
d85f69b0b533ec Mike Kravetz     2015-09-08  3084  	 */
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3085  	folio = dequeue_hugetlb_folio_vma(h, vma, addr, avoid_reserve, gbl_chg);
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3086  	if (!folio) {
db71ef79b59bb2 Mike Kravetz     2021-05-04  3087  		spin_unlock_irq(&hugetlb_lock);
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3088  		folio = alloc_buddy_hugetlb_folio_with_mpol(h, vma, addr);
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3089  		if (!folio)
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3090  			goto out_uncharge_cgroup;
12df140f0bdfae Rik van Riel     2022-10-17  3091  		spin_lock_irq(&hugetlb_lock);
a88c769548047b Naoya Horiguchi  2015-12-11  3092  		if (!avoid_reserve && vma_has_reserves(vma, gbl_chg)) {
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3093  			folio_set_hugetlb_restore_reserve(folio);
a88c769548047b Naoya Horiguchi  2015-12-11  3094  			h->resv_huge_pages--;
a88c769548047b Naoya Horiguchi  2015-12-11  3095  		}
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3096  		list_add(&folio->lru, &h->hugepage_activelist);
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3097  		folio_ref_unfreeze(folio, 1);
81a6fcae3ff3f6 Joonsoo Kim      2013-09-11  3098  		/* Fall through */
68842c9b94560e Ken Chen         2008-01-14  3099  	}
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3100  
3468080c04cfe8 Sidhartha Kumar  2023-01-13 @3101  	hugetlb_cgroup_commit_charge(idx, pages_per_huge_page(h), h_cg, folio);
08cf9faf755802 Mina Almasry     2020-04-01  3102  	/* If allocation is not consuming a reservation, also store the
08cf9faf755802 Mina Almasry     2020-04-01  3103  	 * hugetlb_cgroup pointer on the page.
08cf9faf755802 Mina Almasry     2020-04-01  3104  	 */
08cf9faf755802 Mina Almasry     2020-04-01  3105  	if (deferred_reserve) {
08cf9faf755802 Mina Almasry     2020-04-01  3106  		hugetlb_cgroup_commit_charge_rsvd(idx, pages_per_huge_page(h),
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3107  						  h_cg, folio);
08cf9faf755802 Mina Almasry     2020-04-01  3108  	}
08cf9faf755802 Mina Almasry     2020-04-01  3109  
db71ef79b59bb2 Mike Kravetz     2021-05-04  3110  	spin_unlock_irq(&hugetlb_lock);
7893d1d505d59d Adam Litke       2007-10-16  3111  
3468080c04cfe8 Sidhartha Kumar  2023-01-13  3112  	hugetlb_set_folio_subpool(folio, spool);
a1e78772d72b26 Mel Gorman       2008-07-23  3113  
d85f69b0b533ec Mike Kravetz     2015-09-08  3114  	map_commit = vma_commit_reservation(h, vma, addr);
d85f69b0b533ec Mike Kravetz     2015-09-08  3115  	if (unlikely(map_chg > map_commit)) {
33039678c8da81 Mike Kravetz     2015-06-24  3116  		/*
33039678c8da81 Mike Kravetz     2015-06-24  3117  		 * The page was added to the reservation map between
33039678c8da81 Mike Kravetz     2015-06-24  3118  		 * vma_needs_reservation and vma_commit_reservation.
33039678c8da81 Mike Kravetz     2015-06-24  3119  		 * This indicates a race with hugetlb_reserve_pages.
33039678c8da81 Mike Kravetz     2015-06-24  3120  		 * Adjust for the subpool count incremented above AND
33039678c8da81 Mike Kravetz     2015-06-24  3121  		 * in hugetlb_reserve_pages for the same page.  Also,
33039678c8da81 Mike Kravetz     2015-06-24  3122  		 * the reservation count added in hugetlb_reserve_pages
33039678c8da81 Mike Kravetz     2015-06-24  3123  		 * no longer applies.
33039678c8da81 Mike Kravetz     2015-06-24  3124  		 */
33039678c8da81 Mike Kravetz     2015-06-24  3125  		long rsv_adjust;
33039678c8da81 Mike Kravetz     2015-06-24  3126  
33039678c8da81 Mike Kravetz     2015-06-24  3127  		rsv_adjust = hugepage_subpool_put_pages(spool, 1);
33039678c8da81 Mike Kravetz     2015-06-24  3128  		hugetlb_acct_memory(h, -rsv_adjust);
79aa925bf239c2 Mike Kravetz     2020-11-01  3129  		if (deferred_reserve)
d4ab0316cc33ae Sidhartha Kumar  2022-11-01  3130  			hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
d4ab0316cc33ae Sidhartha Kumar  2022-11-01  3131  					pages_per_huge_page(h), folio);
33039678c8da81 Mike Kravetz     2015-06-24  3132  	}
ee2b5e0fb8de76 Sidhartha Kumar  2023-01-19  3133  	return folio;
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3134  
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3135  out_uncharge_cgroup:
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3136  	hugetlb_cgroup_uncharge_cgroup(idx, pages_per_huge_page(h), h_cg);
08cf9faf755802 Mina Almasry     2020-04-01  3137  out_uncharge_cgroup_reservation:
08cf9faf755802 Mina Almasry     2020-04-01  3138  	if (deferred_reserve)
08cf9faf755802 Mina Almasry     2020-04-01  3139  		hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
08cf9faf755802 Mina Almasry     2020-04-01  3140  						    h_cg);
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3141  out_subpool_put:
d85f69b0b533ec Mike Kravetz     2015-09-08  3142  	if (map_chg || avoid_reserve)
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3143  		hugepage_subpool_put_pages(spool, 1);
feba16e25a5780 Mike Kravetz     2015-09-08  3144  	vma_end_reservation(h, vma, addr);
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3145  	return ERR_PTR(-ENOSPC);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3146  }
b45b5bd65f668a David Gibson     2006-03-22  3147  

:::::: The code at line 3101 was first introduced by commit
:::::: 3468080c04cfe8609ffb785c6121451f1e1341ef mm/hugetlb: increase use of folios in alloc_huge_page()

:::::: TO: Sidhartha Kumar <sidhartha.kumar@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
