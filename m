Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D78D50B
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678375901; x=1709911901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5l+NZrZBg5Uq3L1797PuDB6wPV2G+I/MoptnBDuUR8=;
  b=aBqfkr61d6Xa2HZkqDMotfjMH990WbE2w5ttFt8m2L3/HI2I03/RW13c
   7DeSZre2egtuXjz5C0iETqF4xAzktzWwWf8BkGDvNw/Swd9l9HsKPLVIf
   slxXXhNSYylxnyNJPfL5Dn9KXKj78SSFRXhC+H87RkmGolBQAOhCPZ+Uu
   l5L0diShBIfDgfgajCIhdnvLj0wlZZ16QrfAYksJDePKUd0rbPH8UO3KI
   kAi5KKuZDqbvQbNywO9U5TLZ5qINod1qT73fMXQb/pn9oCNY0rJNat/h3
   7GD3VRTntoAtW0u2aC4CPmA7iSdA5OfpOmoRB9ONz33LJDLHO4Fczsd7Z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335176593"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="335176593"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 07:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677406026"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="677406026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 07:31:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paIEp-00032T-2N;
	Thu, 09 Mar 2023 15:31:27 +0000
Date: Thu, 9 Mar 2023 23:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:unmapped-alloc/rfc-v1 4/5] mm/vmalloc.c:2895
 vm_area_alloc_pages() warn: bitwise AND condition is false here
Message-ID: <202303092357.T7fVHknR-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v1
head:   d1cc346aca5bb7ab68a248c3f5a3d59b8a9d8319
commit: c782952f0d4203c3f8734ab014341e3b8b21895a [4/5] EXPERIMENTAL: x86: use __GFP_UNMAPPED for modele_alloc()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-m031-20230308 (https://download.01.org/0day-ci/archive/20230309/202303092357.T7fVHknR-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303092357.T7fVHknR-lkp@intel.com/

New smatch warnings:
mm/vmalloc.c:2895 vm_area_alloc_pages() warn: bitwise AND condition is false here

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +2895 mm/vmalloc.c

3e9a9e256b1e1e Christoph Hellwig       2020-10-17  2880  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2881  static inline unsigned int
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2882  vm_area_alloc_pages(gfp_t gfp, int nid,
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2883) 		unsigned int order, unsigned int nr_pages, struct page **pages)
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2884  {
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2885  	unsigned int nr_allocated = 0;
ffb29b1c255ab4 Chen Wandun             2021-10-28  2886  	struct page *page;
ffb29b1c255ab4 Chen Wandun             2021-10-28  2887  	int i;
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2888  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2889  	/*
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2890  	 * For order-0 pages we make use of bulk allocator, if
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2891  	 * the page array is partly or not at all populated due
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2892  	 * to fails, fallback to a single page allocator that is
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2893  	 * more permissive.
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2894  	 */
c782952f0d4203 Mike Rapoport (IBM      2022-11-17 @2895) 	if (!order && !(gfp & __GFP_UNMAPPED)) {
9376130c390a76 Michal Hocko            2022-01-14  2896  		gfp_t bulk_gfp = gfp & ~__GFP_NOFAIL;
9376130c390a76 Michal Hocko            2022-01-14  2897  
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2898) 		while (nr_allocated < nr_pages) {
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2899) 			unsigned int nr, nr_pages_request;
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2900) 
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2901) 			/*
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2902) 			 * A maximum allowed request is hard-coded and is 100
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2903) 			 * pages per call. That is done in order to prevent a
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2904) 			 * long preemption off scenario in the bulk-allocator
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2905) 			 * so the range is [1:100].
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2906) 			 */
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2907) 			nr_pages_request = min(100U, nr_pages - nr_allocated);
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2908) 
c00b6b9610991c Chen Wandun             2021-11-05  2909  			/* memory allocation should consider mempolicy, we can't
c00b6b9610991c Chen Wandun             2021-11-05  2910  			 * wrongly use nearest node when nid == NUMA_NO_NODE,
c00b6b9610991c Chen Wandun             2021-11-05  2911  			 * otherwise memory may be allocated in only one node,
98af39d52e336b Yixuan Cao              2022-04-28  2912  			 * but mempolicy wants to alloc memory by interleaving.
c00b6b9610991c Chen Wandun             2021-11-05  2913  			 */
c00b6b9610991c Chen Wandun             2021-11-05  2914  			if (IS_ENABLED(CONFIG_NUMA) && nid == NUMA_NO_NODE)
9376130c390a76 Michal Hocko            2022-01-14  2915  				nr = alloc_pages_bulk_array_mempolicy(bulk_gfp,
c00b6b9610991c Chen Wandun             2021-11-05  2916  							nr_pages_request,
c00b6b9610991c Chen Wandun             2021-11-05  2917  							pages + nr_allocated);
c00b6b9610991c Chen Wandun             2021-11-05  2918  
c00b6b9610991c Chen Wandun             2021-11-05  2919  			else
9376130c390a76 Michal Hocko            2022-01-14  2920  				nr = alloc_pages_bulk_array_node(bulk_gfp, nid,
c00b6b9610991c Chen Wandun             2021-11-05  2921  							nr_pages_request,
c00b6b9610991c Chen Wandun             2021-11-05  2922  							pages + nr_allocated);
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2923) 
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2924) 			nr_allocated += nr;
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2925) 			cond_resched();
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2926) 
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2927) 			/*
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2928) 			 * If zero or pages were obtained partly,
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2929) 			 * fallback to a single page allocator.
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2930) 			 */
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2931) 			if (nr != nr_pages_request)
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2932) 				break;
343ab8178f318b Uladzislau Rezki (Sony  2021-09-02  2933) 		}
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2934  	}
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2935  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2936  	/* High-order pages or fallback path if "bulk" fails. */
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2937  
ffb29b1c255ab4 Chen Wandun             2021-10-28  2938  	while (nr_allocated < nr_pages) {
dd544141b9eb8f Vasily Averin           2021-11-05  2939  		if (fatal_signal_pending(current))
dd544141b9eb8f Vasily Averin           2021-11-05  2940  			break;
dd544141b9eb8f Vasily Averin           2021-11-05  2941  
ffb29b1c255ab4 Chen Wandun             2021-10-28  2942  		if (nid == NUMA_NO_NODE)
ffb29b1c255ab4 Chen Wandun             2021-10-28  2943  			page = alloc_pages(gfp, order);
ffb29b1c255ab4 Chen Wandun             2021-10-28  2944  		else
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2945  			page = alloc_pages_node(nid, gfp, order);
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2946  		if (unlikely(!page))
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2947  			break;
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2948  		/*
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2949  		 * Higher order allocations must be able to be treated as
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2950  		 * indepdenent small pages by callers (as they can with
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2951  		 * small-page vmallocs). Some drivers do their own refcounting
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2952  		 * on vmalloc_to_page() pages, some use page->mapping,
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2953  		 * page->lru, etc.
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2954  		 */
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2955  		if (order)
3b8000ae185cb0 Nicholas Piggin         2022-04-22  2956  			split_page(page, order);
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2957  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2958  		/*
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2959  		 * Careful, we allocate and map page-order pages, but
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2960  		 * tracking is done per PAGE_SIZE page so as to keep the
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2961  		 * vm_struct APIs independent of the physical/mapped size.
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2962  		 */
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2963  		for (i = 0; i < (1U << order); i++)
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2964  			pages[nr_allocated + i] = page + i;
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2965  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2966  		cond_resched();
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2967  		nr_allocated += 1U << order;
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2968  	}
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2969  
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2970  	return nr_allocated;
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2971  }
12b9f873a5d0e6 Uladzislau Rezki        2021-06-28  2972  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
