Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87805A51
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmbR5tfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697165640; x=1728701640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vnRvfhnFzxvchLKsq6/aIGaz3qsXNYI644rUx4xV11A=;
  b=YmbR5tfsNfgH8hKSfnAnRHeLvxS2WepNBh7rEJA8/ZPr5VC/6VI6YuuY
   f80z7NSn2RLXL2N6hafZetLF8sJJ39NsGjPUTGmUIiAgUlkvepnsbA0RP
   T/K8kLqMl60lOHWRS0TV7XeGGLudI9d7i+ZHFFfVPsanULot9PQ1IB4Oi
   Vteo+G1436jsh3gFg+pRRVuUbINgY5AOOreKUOtTBJM32Y8PS9RwW7pcO
   XIi5Jdkh4cBeHoLrrQhQrzy3+QhZDEpbegHX7kGD7Raj9A9qU4H0eb0py
   orYDXhUVNl7a8U2H3Cq58c7XhTD/8T0lWZnjF3inM4JhpVY4AQcs0j4pC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3681515"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3681515"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824865086"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824865086"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 19:53:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr8J8-0004Ft-05;
	Fri, 13 Oct 2023 02:53:46 +0000
Date: Fri, 13 Oct 2023 10:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
Message-ID: <202310131039.ZgssYfIB-lkp@intel.com>
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
In-Reply-To: <20230822162808.4131399-2-willy@infradead.org>
References: <20230822162808.4131399-2-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Mike Kravetz <mike.kravetz@oracle.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Muchun Song <muchun.song@linux.dev>
CC: linux-mm@kvack.org
CC: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc5]
[cannot apply to next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/hugetlb-Remove-a-few-calls-to-page_folio/20230823-002932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230822162808.4131399-2-willy%40infradead.org
patch subject: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-161-20230827 (https://download.01.org/0day-ci/archive/20231013/202310131039.ZgssYfIB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131039.ZgssYfIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131039.ZgssYfIB-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:2246 remove_pool_huge_page() error: uninitialized symbol 'folio'.

vim +/folio +2246 mm/hugetlb.c

b2261026825ed3 Joonsoo Kim             2013-09-11  2216  
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2217  /*
10c6ec49802b17 Mike Kravetz            2021-05-04  2218   * Remove huge page from pool from next node to free.  Attempt to keep
10c6ec49802b17 Mike Kravetz            2021-05-04  2219   * persistent huge pages more or less balanced over allowed nodes.
10c6ec49802b17 Mike Kravetz            2021-05-04  2220   * This routine only 'removes' the hugetlb page.  The caller must make
10c6ec49802b17 Mike Kravetz            2021-05-04  2221   * an additional call to free the page to low level allocators.
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2222   * Called with hugetlb_lock locked.
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2223   */
10c6ec49802b17 Mike Kravetz            2021-05-04  2224  static struct page *remove_pool_huge_page(struct hstate *h,
10c6ec49802b17 Mike Kravetz            2021-05-04  2225  						nodemask_t *nodes_allowed,
6ae11b278bca1c Lee Schermerhorn        2009-12-14  2226  						 bool acct_surplus)
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2227  {
b2261026825ed3 Joonsoo Kim             2013-09-11  2228  	int nr_nodes, node;
cfd5082b514765 Sidhartha Kumar         2022-11-29  2229  	struct folio *folio;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2230  
9487ca60fd7fa2 Mike Kravetz            2021-05-04  2231  	lockdep_assert_held(&hugetlb_lock);
b2261026825ed3 Joonsoo Kim             2013-09-11  2232  	for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
685f345708096e Lee Schermerhorn        2009-09-21  2233  		/*
685f345708096e Lee Schermerhorn        2009-09-21  2234  		 * If we're returning unused surplus pages, only examine
685f345708096e Lee Schermerhorn        2009-09-21  2235  		 * nodes with surplus pages.
685f345708096e Lee Schermerhorn        2009-09-21  2236  		 */
b2261026825ed3 Joonsoo Kim             2013-09-11  2237  		if ((!acct_surplus || h->surplus_huge_pages_node[node]) &&
b2261026825ed3 Joonsoo Kim             2013-09-11  2238  		    !list_empty(&h->hugepage_freelists[node])) {
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2239) 			folio = list_entry(h->hugepage_freelists[node].next,
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2240) 					  struct folio, lru);
cfd5082b514765 Sidhartha Kumar         2022-11-29  2241  			remove_hugetlb_folio(h, folio, acct_surplus);
9a76db09970938 Lee Schermerhorn        2009-12-14  2242  			break;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2243  		}
b2261026825ed3 Joonsoo Kim             2013-09-11  2244  	}
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2245  
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22 @2246) 	return &folio->page;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2247  }
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
