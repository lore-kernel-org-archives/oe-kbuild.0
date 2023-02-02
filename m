Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706763B7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675347576; x=1706883576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueEG3pFmyfy+UXkl0iB77fXdqWfPO25MrtO8EoeXeJk=;
  b=L0lIKfqR/bIP4oOKrvP0IjjNcZQu04Jj49ZhBFPzvZn44049qaVyucK1
   +f9sObf9B8i8H+gtdvTIm1otpwdaxCItrC2osPMLEgPbIxA8yoMjEfWLa
   C6DVB7b9DFBFnY6BOvSlvgD+z8nqCve+8gmjNLTraOHu9rzx1QGfsUFaO
   GO37F3kVDpHZ1bhrinGOVmaMbLPJy/wgAT6FeVWSqRoz6AbRXIzz8VPfO
   XCz70Df++EEdds2ksp32Sx3y1oqu13P6qAzPvlA4y+DcvcG6MyUS7rKZs
   YfmDFNA7NZrmeUlD0rrnFkMB4U4JnBOXXvn9JLzzbFcxuox8tgIaRt7uX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355796322"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="355796322"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 06:19:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733951630"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="733951630"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 06:19:34 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNaR4-0006aV-0m;
	Thu, 02 Feb 2023 14:19:34 +0000
Date: Thu, 2 Feb 2023 22:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH v2 3/5] rmap: add page_add_file_rmap_range()
Message-ID: <202302022240.ptsY32y6-lkp@intel.com>
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
In-Reply-To: <20230201081737.2330141-4-fengwei.yin@intel.com>
References: <20230201081737.2330141-4-fengwei.yin@intel.com>
TO: Yin Fengwei <fengwei.yin@intel.com>

Hi Yin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20230201]
[cannot apply to linus/master v6.2-rc6 v6.2-rc5 v6.2-rc4 v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Fengwei/mm-Enable-fault-around-for-shared-file-page-fault/20230201-161810
patch link:    https://lore.kernel.org/r/20230201081737.2330141-4-fengwei.yin%40intel.com
patch subject: [RFC PATCH v2 3/5] rmap: add page_add_file_rmap_range()
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arc-randconfig-c44-20230129 (https://download.01.org/0day-ci/archive/20230202/202302022240.ptsY32y6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> mm/rmap.c:1354:17-19: WARNING: Unsigned expression compared with zero: nr < 0

vim +1354 mm/rmap.c

9617d95e6e9ffd Nicholas Piggin         2006-01-06  1304  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1305  /**
aa15ac22bbf926 Yin Fengwei             2023-02-01  1306   * page_add_file_rmap_range - add pte mapping to a sub page range of a folio
aa15ac22bbf926 Yin Fengwei             2023-02-01  1307   * @folio:	The filio to add the mapping to
aa15ac22bbf926 Yin Fengwei             2023-02-01  1308   * @start:	The first sub page index in folio
aa15ac22bbf926 Yin Fengwei             2023-02-01  1309   * @nr_pages:	The number of sub pages from the first page
cea86fe246b694 Hugh Dickins            2022-02-14  1310   * @vma:	the vm area in which the mapping is added
e8b098fc5747a7 Mike Rapoport           2018-04-05  1311   * @compound:	charge the page as compound or small page
^1da177e4c3f41 Linus Torvalds          2005-04-16  1312   *
aa15ac22bbf926 Yin Fengwei             2023-02-01  1313   * The sub page range of folio is defined by
aa15ac22bbf926 Yin Fengwei             2023-02-01  1314   * 	[first_sub_page, first_sub_page + nr_pages)
aa15ac22bbf926 Yin Fengwei             2023-02-01  1315   *
b8072f099b7829 Hugh Dickins            2005-10-29  1316   * The caller needs to hold the pte lock.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1317   */
aa15ac22bbf926 Yin Fengwei             2023-02-01  1318  void page_add_file_rmap_range(struct folio *folio, unsigned long start,
aa15ac22bbf926 Yin Fengwei             2023-02-01  1319  			unsigned int nr_pages, struct vm_area_struct *vma,
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1320) 			bool compound)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1321  {
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1322) 	atomic_t *mapped = &folio->_nr_pages_mapped;
aa15ac22bbf926 Yin Fengwei             2023-02-01  1323  	unsigned int nr = 0, nr_pmdmapped = 0, first;
dd78fedde4b99b Kirill A. Shutemov      2016-07-26  1324  
aa15ac22bbf926 Yin Fengwei             2023-02-01  1325  	VM_WARN_ON_FOLIO(compound && !folio_test_pmd_mappable(folio), folio);
9bd3155ed83b72 Hugh Dickins            2022-11-02  1326  
be5ef2d9b006bb Hugh Dickins            2022-11-22  1327  	/* Is page being mapped by PTE? Is this its first map to be added? */
be5ef2d9b006bb Hugh Dickins            2022-11-22  1328  	if (likely(!compound)) {
aa15ac22bbf926 Yin Fengwei             2023-02-01  1329  		struct page *page = folio_page(folio, start);
aa15ac22bbf926 Yin Fengwei             2023-02-01  1330  
aa15ac22bbf926 Yin Fengwei             2023-02-01  1331  		nr_pages = min_t(unsigned int, nr_pages,
aa15ac22bbf926 Yin Fengwei             2023-02-01  1332  					folio_nr_pages(folio) - start);
aa15ac22bbf926 Yin Fengwei             2023-02-01  1333  
aa15ac22bbf926 Yin Fengwei             2023-02-01  1334  		do {
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1335  			first = atomic_inc_and_test(&page->_mapcount);
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1336) 			if (first && folio_test_large(folio)) {
aa15ac22bbf926 Yin Fengwei             2023-02-01  1337  				first = atomic_inc_return_relaxed(mapped);
aa15ac22bbf926 Yin Fengwei             2023-02-01  1338  				first = (nr < COMPOUND_MAPPED);
be5ef2d9b006bb Hugh Dickins            2022-11-22  1339  			}
aa15ac22bbf926 Yin Fengwei             2023-02-01  1340  
aa15ac22bbf926 Yin Fengwei             2023-02-01  1341  			if (first)
aa15ac22bbf926 Yin Fengwei             2023-02-01  1342  				nr++;
aa15ac22bbf926 Yin Fengwei             2023-02-01  1343  		} while (page++, --nr_pages > 0);
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1344) 	} else if (folio_test_pmd_mappable(folio)) {
be5ef2d9b006bb Hugh Dickins            2022-11-22  1345  		/* That test is redundant: it's for safety or to optimize out */
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1346  
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1347) 		first = atomic_inc_and_test(&folio->_entire_mapcount);
9bd3155ed83b72 Hugh Dickins            2022-11-02  1348  		if (first) {
4b51634cd16a01 Hugh Dickins            2022-11-22  1349  			nr = atomic_add_return_relaxed(COMPOUND_MAPPED, mapped);
6287b7dae80944 Hugh Dickins            2022-12-04  1350  			if (likely(nr < COMPOUND_MAPPED + COMPOUND_MAPPED)) {
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1351) 				nr_pmdmapped = folio_nr_pages(folio);
23e4d1d73d0155 Matthew Wilcox (Oracle  2023-01-11  1352) 				nr = nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
6287b7dae80944 Hugh Dickins            2022-12-04  1353  				/* Raced ahead of a remove and another add? */
6287b7dae80944 Hugh Dickins            2022-12-04 @1354  				if (unlikely(nr < 0))
6287b7dae80944 Hugh Dickins            2022-12-04  1355  					nr = 0;
6287b7dae80944 Hugh Dickins            2022-12-04  1356  			} else {
6287b7dae80944 Hugh Dickins            2022-12-04  1357  				/* Raced ahead of a remove of COMPOUND_MAPPED */
6287b7dae80944 Hugh Dickins            2022-12-04  1358  				nr = 0;
6287b7dae80944 Hugh Dickins            2022-12-04  1359  			}
9bd3155ed83b72 Hugh Dickins            2022-11-02  1360  		}
dd78fedde4b99b Kirill A. Shutemov      2016-07-26  1361  	}
9bd3155ed83b72 Hugh Dickins            2022-11-02  1362  
9bd3155ed83b72 Hugh Dickins            2022-11-02  1363  	if (nr_pmdmapped)
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1364) 		__lruvec_stat_mod_folio(folio, folio_test_swapbacked(folio) ?
9bd3155ed83b72 Hugh Dickins            2022-11-02  1365  			NR_SHMEM_PMDMAPPED : NR_FILE_PMDMAPPED, nr_pmdmapped);
5d543f13e2f558 Hugh Dickins            2022-03-24  1366  	if (nr)
f8328c0f2aa1fd Matthew Wilcox (Oracle  2023-01-11  1367) 		__lruvec_stat_mod_folio(folio, NR_FILE_MAPPED, nr);
cea86fe246b694 Hugh Dickins            2022-02-14  1368  
18b8b3a3769ea1 Matthew Wilcox (Oracle  2023-01-16  1369) 	mlock_vma_folio(folio, vma, compound);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1370  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1371  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
