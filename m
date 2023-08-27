Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4522F3A
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693168619; x=1724704619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FyBfDacU+rx2/owBcWwYR/s1PMEj7lduVNfn/lc5EME=;
  b=SpjV/4A0/DeJPeRc9EXN3Q1oiTlyuzUN/q5xCZxH4dhIg2qRZ51K2LpZ
   EcqTpSqosZ0CVRjEHbJpSZ/HUckgfraaVfxzT31tj71RspM+TZbA5sm25
   va7X3hmkw6NgDGoq5ex+/zk+1T1kTAmMqQL4smw2Fdp+u8SRUMy64Zq+G
   aGPwz9LZVMjT2tIDt0bLhA6ljLGUKGciZT9H/LMfTlJqlHYIT/dBwqzTt
   SNvnvcToFEpQKw539M07JyneK24X9j6jREH/JF5WFwr0rb8S9c304Vt7t
   7BnJIZdggV1jnVnGGN9p+VElNftE7b0PN5p1t09BkD+YPlIvLumhxFlNo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461335548"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461335548"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 13:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="828114477"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="828114477"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2023 13:36:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaMVE-0006Al-27;
	Sun, 27 Aug 2023 20:36:56 +0000
Date: Mon, 28 Aug 2023 04:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
Message-ID: <202308280414.vR49R4gm-lkp@intel.com>
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
[also build test WARNING on linus/master v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/hugetlb-Remove-a-few-calls-to-page_folio/20230823-002932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230822162808.4131399-2-willy%40infradead.org
patch subject: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20230827 (https://download.01.org/0day-ci/archive/20230828/202308280414.vR49R4gm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280414.vR49R4gm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308280414.vR49R4gm-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:2246 remove_pool_huge_page() error: uninitialized symbol 'folio'.

vim +/folio +2246 mm/hugetlb.c

b2261026825ed34 Joonsoo Kim             2013-09-11  2216  
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2217  /*
10c6ec49802b177 Mike Kravetz            2021-05-04  2218   * Remove huge page from pool from next node to free.  Attempt to keep
10c6ec49802b177 Mike Kravetz            2021-05-04  2219   * persistent huge pages more or less balanced over allowed nodes.
10c6ec49802b177 Mike Kravetz            2021-05-04  2220   * This routine only 'removes' the hugetlb page.  The caller must make
10c6ec49802b177 Mike Kravetz            2021-05-04  2221   * an additional call to free the page to low level allocators.
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2222   * Called with hugetlb_lock locked.
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2223   */
10c6ec49802b177 Mike Kravetz            2021-05-04  2224  static struct page *remove_pool_huge_page(struct hstate *h,
10c6ec49802b177 Mike Kravetz            2021-05-04  2225  						nodemask_t *nodes_allowed,
6ae11b278bca1cd Lee Schermerhorn        2009-12-14  2226  						 bool acct_surplus)
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2227  {
b2261026825ed34 Joonsoo Kim             2013-09-11  2228  	int nr_nodes, node;
cfd5082b514765f Sidhartha Kumar         2022-11-29  2229  	struct folio *folio;
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2230  
9487ca60fd7fa2c Mike Kravetz            2021-05-04  2231  	lockdep_assert_held(&hugetlb_lock);
b2261026825ed34 Joonsoo Kim             2013-09-11  2232  	for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
685f345708096ed Lee Schermerhorn        2009-09-21  2233  		/*
685f345708096ed Lee Schermerhorn        2009-09-21  2234  		 * If we're returning unused surplus pages, only examine
685f345708096ed Lee Schermerhorn        2009-09-21  2235  		 * nodes with surplus pages.
685f345708096ed Lee Schermerhorn        2009-09-21  2236  		 */
b2261026825ed34 Joonsoo Kim             2013-09-11  2237  		if ((!acct_surplus || h->surplus_huge_pages_node[node]) &&
b2261026825ed34 Joonsoo Kim             2013-09-11  2238  		    !list_empty(&h->hugepage_freelists[node])) {
e601ce76a2aabd2 Matthew Wilcox (Oracle  2023-08-22  2239) 			folio = list_entry(h->hugepage_freelists[node].next,
e601ce76a2aabd2 Matthew Wilcox (Oracle  2023-08-22  2240) 					  struct folio, lru);
cfd5082b514765f Sidhartha Kumar         2022-11-29  2241  			remove_hugetlb_folio(h, folio, acct_surplus);
9a76db099709388 Lee Schermerhorn        2009-12-14  2242  			break;
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2243  		}
b2261026825ed34 Joonsoo Kim             2013-09-11  2244  	}
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2245  
e601ce76a2aabd2 Matthew Wilcox (Oracle  2023-08-22 @2246) 	return &folio->page;
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2247  }
e8c5c8249878fb6 Lee Schermerhorn        2009-09-21  2248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
