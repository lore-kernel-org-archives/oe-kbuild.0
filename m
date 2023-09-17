Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CF627
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694910155; x=1726446155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8a886rTGa3b+FZVH4wanyjROHUvLMuJXLGX0XWJ41Pw=;
  b=L+/0YDHnBmlQ/Ij2XOxQQWJ/F+ilQADXS4Q0k6JHIA8OuCqdGAsjO80t
   u0ExcQ7i07SrU0L4fQ9UIYyKlctueKl2e8CwOUBK00LPexLOcDBYm8Oco
   QxTn2a8boxNjPmz9XDZcKAOwLe7HWQtSxaG+HrYZ2V4uExnCJtCtNFYas
   8oYGiZqbJjPwhjPzEXh4Rw5T9twhNSRBcpb6JalPrcBL42oo9c5F54vbf
   5Z/kS+957ls+2UdwTSXmXzU1loPqA1R+yrpnz5Jz/oOkqW4UJig6NYFxM
   soXozktTsCLvw7whv4hgllmc705wwEqlEGt6o8Y8HNXXY8JC+Ye6CW/xr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382193641"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382193641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 17:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="780516801"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="780516801"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2023 17:22:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhfYU-0004mm-34;
	Sun, 17 Sep 2023 00:22:31 +0000
Date: Sun, 17 Sep 2023 08:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 06/12] hugetlb: restructure pool allocations
Message-ID: <202309170859.U6qXMfXX-lkp@intel.com>
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
In-Reply-To: <20230915221548.552084-7-mike.kravetz@oracle.com>
References: <20230915221548.552084-7-mike.kravetz@oracle.com>
TO: Mike Kravetz <mike.kravetz@oracle.com>
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
CC: Muchun Song <songmuchun@bytedance.com>
CC: Joao Martins <joao.m.martins@oracle.com>
CC: Oscar Salvador <osalvador@suse.de>
CC: David Hildenbrand <david@redhat.com>
CC: Miaohe Lin <linmiaohe@huawei.com>
CC: David Rientjes <rientjes@google.com>
CC: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Naoya Horiguchi <naoya.horiguchi@linux.dev>
CC: Barry Song <song.bao.hua@hisilicon.com>
CC: Michal Hocko <mhocko@suse.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: Xiongchun Duan <duanxiongchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mike Kravetz <mike.kravetz@oracle.com>

Hi Mike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230915]
[cannot apply to akpm-mm/mm-everything v6.6-rc1 v6.5 v6.5-rc7 linus/master v6.6-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Kravetz/mm-page_alloc-remove-pcppage-migratetype-caching-fix/20230916-061835
base:   next-20230915
patch link:    https://lore.kernel.org/r/20230915221548.552084-7-mike.kravetz%40oracle.com
patch subject: [PATCH v3 06/12] hugetlb: restructure pool allocations
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20230917 (https://download.01.org/0day-ci/archive/20230917/202309170859.U6qXMfXX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170859.U6qXMfXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309170859.U6qXMfXX-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:3287 gather_bootmem_prealloc() error: uninitialized symbol 'h'.

vim +/h +3287 mm/hugetlb.c

aa888a74977a8f Andi Kleen              2008-07-23  3243  
48b8d744ea841b Mike Kravetz            2021-06-30  3244  /*
48b8d744ea841b Mike Kravetz            2021-06-30  3245   * Put bootmem huge pages into the standard lists after mem_map is up.
48b8d744ea841b Mike Kravetz            2021-06-30  3246   * Note: This only applies to gigantic (order > MAX_ORDER) pages.
48b8d744ea841b Mike Kravetz            2021-06-30  3247   */
aa888a74977a8f Andi Kleen              2008-07-23  3248  static void __init gather_bootmem_prealloc(void)
aa888a74977a8f Andi Kleen              2008-07-23  3249  {
a5c1afb18be30d Mike Kravetz            2023-09-15  3250  	LIST_HEAD(folio_list);
aa888a74977a8f Andi Kleen              2008-07-23  3251  	struct huge_bootmem_page *m;
a5c1afb18be30d Mike Kravetz            2023-09-15  3252  	struct hstate *h, *prev_h = NULL;
aa888a74977a8f Andi Kleen              2008-07-23  3253  
aa888a74977a8f Andi Kleen              2008-07-23  3254  	list_for_each_entry(m, &huge_boot_pages, list) {
40d18ebffb3974 Mike Kravetz            2018-08-17  3255  		struct page *page = virt_to_page(m);
7f325a8d25631e Sidhartha Kumar         2022-11-29  3256  		struct folio *folio = page_folio(page);
a5c1afb18be30d Mike Kravetz            2023-09-15  3257  
a5c1afb18be30d Mike Kravetz            2023-09-15  3258  		h = m->hstate;
a5c1afb18be30d Mike Kravetz            2023-09-15  3259  		/*
a5c1afb18be30d Mike Kravetz            2023-09-15  3260  		 * It is possible to gave multiple huge page sizes (hstates)
a5c1afb18be30d Mike Kravetz            2023-09-15  3261  		 * in this list.  If so, process each size separately.
a5c1afb18be30d Mike Kravetz            2023-09-15  3262  		 */
a5c1afb18be30d Mike Kravetz            2023-09-15  3263  		if (h != prev_h && prev_h != NULL)
a5c1afb18be30d Mike Kravetz            2023-09-15  3264  			prep_and_add_allocated_folios(prev_h, &folio_list);
a5c1afb18be30d Mike Kravetz            2023-09-15  3265  		prev_h = h;
ee8f248d266ec6 Becky Bruce             2011-07-25  3266  
48b8d744ea841b Mike Kravetz            2021-06-30  3267  		VM_BUG_ON(!hstate_is_gigantic(h));
d1c6095572d0cf Sidhartha Kumar         2022-11-29  3268  		WARN_ON(folio_ref_count(folio) != 1);
d1c6095572d0cf Sidhartha Kumar         2022-11-29  3269  		if (prep_compound_gigantic_folio(folio, huge_page_order(h))) {
d1c6095572d0cf Sidhartha Kumar         2022-11-29  3270  			WARN_ON(folio_test_reserved(folio));
a5c1afb18be30d Mike Kravetz            2023-09-15  3271  			init_new_hugetlb_folio(h, folio);
a5c1afb18be30d Mike Kravetz            2023-09-15  3272  			list_add(&folio->lru, &folio_list);
7118fc2906e292 Mike Kravetz            2021-06-30  3273  		} else {
416d85ed3e08c1 Mike Kravetz            2021-09-02  3274  			/* VERY unlikely inflated ref count on a tail page */
7f325a8d25631e Sidhartha Kumar         2022-11-29  3275  			free_gigantic_folio(folio, huge_page_order(h));
7118fc2906e292 Mike Kravetz            2021-06-30  3276  		}
af0fb9df784174 Michal Hocko            2018-01-31  3277  
b0320c7b7d1ac1 Rafael Aquini           2011-06-15  3278  		/*
48b8d744ea841b Mike Kravetz            2021-06-30  3279  		 * We need to restore the 'stolen' pages to totalram_pages
48b8d744ea841b Mike Kravetz            2021-06-30  3280  		 * in order to fix confusing memory reports from free(1) and
48b8d744ea841b Mike Kravetz            2021-06-30  3281  		 * other side-effects, like CommitLimit going negative.
b0320c7b7d1ac1 Rafael Aquini           2011-06-15  3282  		 */
c78a7f3639932c Miaohe Lin              2021-02-24  3283  		adjust_managed_page_count(page, pages_per_huge_page(h));
520495fe96d74e Cannon Matthews         2018-07-03  3284  		cond_resched();
aa888a74977a8f Andi Kleen              2008-07-23  3285  	}
a5c1afb18be30d Mike Kravetz            2023-09-15  3286  
a5c1afb18be30d Mike Kravetz            2023-09-15 @3287  	prep_and_add_allocated_folios(h, &folio_list);
aa888a74977a8f Andi Kleen              2008-07-23  3288  }
b5389086ad7be0 Zhenguo Yao             2021-11-05  3289  static void __init hugetlb_hstate_alloc_pages_onenode(struct hstate *h, int nid)
b5389086ad7be0 Zhenguo Yao             2021-11-05  3290  {
b5389086ad7be0 Zhenguo Yao             2021-11-05  3291  	unsigned long i;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3292  	char buf[32];
b5389086ad7be0 Zhenguo Yao             2021-11-05  3293  
b5389086ad7be0 Zhenguo Yao             2021-11-05  3294  	for (i = 0; i < h->max_huge_pages_node[nid]; ++i) {
b5389086ad7be0 Zhenguo Yao             2021-11-05  3295  		if (hstate_is_gigantic(h)) {
b5389086ad7be0 Zhenguo Yao             2021-11-05  3296  			if (!alloc_bootmem_huge_page(h, nid))
b5389086ad7be0 Zhenguo Yao             2021-11-05  3297  				break;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3298  		} else {
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  3299  			struct folio *folio;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3300  			gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3301  
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  3302  			folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
b5389086ad7be0 Zhenguo Yao             2021-11-05  3303  					&node_states[N_MEMORY], NULL);
19fc1a7e8b2b3b Sidhartha Kumar         2022-11-29  3304  			if (!folio)
b5389086ad7be0 Zhenguo Yao             2021-11-05  3305  				break;
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  3306) 			free_huge_folio(folio); /* free it into the hugepage allocator */
b5389086ad7be0 Zhenguo Yao             2021-11-05  3307  		}
b5389086ad7be0 Zhenguo Yao             2021-11-05  3308  		cond_resched();
b5389086ad7be0 Zhenguo Yao             2021-11-05  3309  	}
b5389086ad7be0 Zhenguo Yao             2021-11-05  3310  	if (i == h->max_huge_pages_node[nid])
b5389086ad7be0 Zhenguo Yao             2021-11-05  3311  		return;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3312  
b5389086ad7be0 Zhenguo Yao             2021-11-05  3313  	string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
b5389086ad7be0 Zhenguo Yao             2021-11-05  3314  	pr_warn("HugeTLB: allocating %u of page size %s failed node%d.  Only allocated %lu hugepages.\n",
b5389086ad7be0 Zhenguo Yao             2021-11-05  3315  		h->max_huge_pages_node[nid], buf, nid, i);
b5389086ad7be0 Zhenguo Yao             2021-11-05  3316  	h->max_huge_pages -= (h->max_huge_pages_node[nid] - i);
b5389086ad7be0 Zhenguo Yao             2021-11-05  3317  	h->max_huge_pages_node[nid] = i;
b5389086ad7be0 Zhenguo Yao             2021-11-05  3318  }
aa888a74977a8f Andi Kleen              2008-07-23  3319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
