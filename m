Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD51A76BC
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751652749; cv=none; b=MRy773KToV2JSFp7zF1Rh5d3ma02rMa++jZP1QHmrwYANeraAVqplRMxY1jrztzn599UHolV+4MeT9qxnB9qFLZVxPovNUfMMo0oreh8l3yLHgYUHGysrMWnL4AflYxrT1IvSTlSHFB5cSiRuKRKd1G4PdVZFkCWAZqEfLb3QOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751652749; c=relaxed/simple;
	bh=sDbSmmELZAQwWMk4yfDxJpqTyNPCzGhYCSdU+TO4jcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDq3U5Dd3qH7H7NLQR+AQhVjhnpeFVoJpQCVz+YYtKbKkGPUlbPO22Uvt88kVp9CN3ihLitfgUNyS+ZpjfJsZzrz5Q0x1GH/CSFulUNHXCOmjZJbgQJ8CbgV5heeXPqjTlLpG74PYZ/ZjWGQ79/KgN/gDJI2Wsow3AVisK+SkMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArQyE6JS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArQyE6JS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751652747; x=1783188747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sDbSmmELZAQwWMk4yfDxJpqTyNPCzGhYCSdU+TO4jcg=;
  b=ArQyE6JSNRxhVHPbcy38b98iQrdZxdZFCknLUeYUsy2s2vgt9px4hnut
   X11xAPCVFEu+PQjlGd4Bf4m0O+nYlSpeVvHrjYxFTf5/D9QT+wUOSHQ/h
   osuJVxC3HeKwAT1wnFHZ7aKk2YOw+hTbFeLRlebxUMoidztdYqg0TnCvT
   ejObbd1C603QuQ9NLMpzKVKkTmOQg2mMaerS75jDw0a/9sLsICxcPpYHj
   z+6SN2wQpI+IUdBPSZGhzuQf3vY8aQnKHzkhX8ASu3bJysrtjJjJt7tWM
   2BP8YXbsjoQoNUOR0UYcfgXHpYXZBYu2KYvN1SaNmnB86IQpTb//4ve3u
   A==;
X-CSE-ConnectionGUID: 1RUvsybgQD+it2tFOhfAPg==
X-CSE-MsgGUID: 3mEHgi+sSdSmsORi97qLlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64678919"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="64678919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:12:26 -0700
X-CSE-ConnectionGUID: enZClj7YSD62jg9YKIMfzA==
X-CSE-MsgGUID: 9fKFqzsjTxif6HQA6lL3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154439402"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2025 11:12:25 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXkta-0003yl-32;
	Fri, 04 Jul 2025 18:12:22 +0000
Date: Sat, 5 Jul 2025 02:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [v1 resend 04/12] mm/migrate_device: THP migration of zone
 device pages
Message-ID: <202507050121.dLfdMtAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250703233511.2028395-5-balbirs@nvidia.com>
References: <20250703233511.2028395-5-balbirs@nvidia.com>
TO: Balbir Singh <balbirs@nvidia.com>
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: linux-kernel@vger.kernel.org
CC: Balbir Singh <balbirs@nvidia.com>
CC: Karol Herbst <kherbst@redhat.com>
CC: Lyude Paul <lyude@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: "Jérôme Glisse" <jglisse@redhat.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Hildenbrand <david@redhat.com>
CC: Barry Song <baohua@kernel.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: Peter Xu <peterx@redhat.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Jane Chu <jane.chu@oracle.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Donet Tom <donettom@linux.ibm.com>

Hi Balbir,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20250704]
[cannot apply to akpm-mm/mm-nonmm-unstable shuah-kselftest/next shuah-kselftest/fixes linus/master v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250704-073807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250703233511.2028395-5-balbirs%40nvidia.com
patch subject: [v1 resend 04/12] mm/migrate_device: THP migration of zone device pages
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250705/202507050121.dLfdMtAI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050121.dLfdMtAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507050121.dLfdMtAI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate_device.c:1015:10: error: call to '__compiletime_assert_715' declared with 'error' attribute: BUILD_BUG failed
    1015 |                                 nr = HPAGE_PMD_NR;
         |                                      ^
   include/linux/huge_mm.h:115:26: note: expanded from macro 'HPAGE_PMD_NR'
     115 | #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
         |                          ^
   include/linux/huge_mm.h:114:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     114 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:110:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     110 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:115:1: note: expanded from here
     115 | __compiletime_assert_715
         | ^
   1 error generated.


vim +1015 mm/migrate_device.c

76cbbead253ddc Christoph Hellwig       2022-02-16   968  
e778406b40dbb1 Alistair Popple         2022-09-28   969  static void __migrate_device_pages(unsigned long *src_pfns,
241f6885965683 Alistair Popple         2022-09-28   970  				unsigned long *dst_pfns, unsigned long npages,
241f6885965683 Alistair Popple         2022-09-28   971  				struct migrate_vma *migrate)
76cbbead253ddc Christoph Hellwig       2022-02-16   972  {
76cbbead253ddc Christoph Hellwig       2022-02-16   973  	struct mmu_notifier_range range;
241f6885965683 Alistair Popple         2022-09-28   974  	unsigned long i;
76cbbead253ddc Christoph Hellwig       2022-02-16   975  	bool notified = false;
76cbbead253ddc Christoph Hellwig       2022-02-16   976  
7a40e7ad868d8f Balbir Singh            2025-07-04   977  	for (i = 0; i < npages; ) {
241f6885965683 Alistair Popple         2022-09-28   978  		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
241f6885965683 Alistair Popple         2022-09-28   979  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
76cbbead253ddc Christoph Hellwig       2022-02-16   980  		struct address_space *mapping;
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24   981  		struct folio *newfolio, *folio;
15b0c79cfadad6 Kefeng Wang             2024-05-24   982  		int r, extra_cnt = 0;
7a40e7ad868d8f Balbir Singh            2025-07-04   983  		unsigned long nr = 1;
76cbbead253ddc Christoph Hellwig       2022-02-16   984  
76cbbead253ddc Christoph Hellwig       2022-02-16   985  		if (!newpage) {
241f6885965683 Alistair Popple         2022-09-28   986  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04   987  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16   988  		}
76cbbead253ddc Christoph Hellwig       2022-02-16   989  
76cbbead253ddc Christoph Hellwig       2022-02-16   990  		if (!page) {
241f6885965683 Alistair Popple         2022-09-28   991  			unsigned long addr;
241f6885965683 Alistair Popple         2022-09-28   992  
e778406b40dbb1 Alistair Popple         2022-09-28   993  			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
7a40e7ad868d8f Balbir Singh            2025-07-04   994  				goto next;
e778406b40dbb1 Alistair Popple         2022-09-28   995  
b05a79d4377f6d Alistair Popple         2022-07-15   996  			/*
b05a79d4377f6d Alistair Popple         2022-07-15   997  			 * The only time there is no vma is when called from
5c8525a37b78dd Kefeng Wang             2024-08-26   998  			 * migrate_device_coherent_folio(). However this isn't
b05a79d4377f6d Alistair Popple         2022-07-15   999  			 * called if the page could not be unmapped.
b05a79d4377f6d Alistair Popple         2022-07-15  1000  			 */
241f6885965683 Alistair Popple         2022-09-28  1001  			VM_BUG_ON(!migrate);
241f6885965683 Alistair Popple         2022-09-28  1002  			addr = migrate->start + i*PAGE_SIZE;
76cbbead253ddc Christoph Hellwig       2022-02-16  1003  			if (!notified) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1004  				notified = true;
76cbbead253ddc Christoph Hellwig       2022-02-16  1005  
76cbbead253ddc Christoph Hellwig       2022-02-16  1006  				mmu_notifier_range_init_owner(&range,
7d4a8be0c4b2b7 Alistair Popple         2023-01-10  1007  					MMU_NOTIFY_MIGRATE, 0,
76cbbead253ddc Christoph Hellwig       2022-02-16  1008  					migrate->vma->vm_mm, addr, migrate->end,
76cbbead253ddc Christoph Hellwig       2022-02-16  1009  					migrate->pgmap_owner);
76cbbead253ddc Christoph Hellwig       2022-02-16  1010  				mmu_notifier_invalidate_range_start(&range);
76cbbead253ddc Christoph Hellwig       2022-02-16  1011  			}
7a40e7ad868d8f Balbir Singh            2025-07-04  1012  
7a40e7ad868d8f Balbir Singh            2025-07-04  1013  			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
7a40e7ad868d8f Balbir Singh            2025-07-04  1014  				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
7a40e7ad868d8f Balbir Singh            2025-07-04 @1015  				nr = HPAGE_PMD_NR;
7a40e7ad868d8f Balbir Singh            2025-07-04  1016  				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
7a40e7ad868d8f Balbir Singh            2025-07-04  1017  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04  1018  				goto next;
7a40e7ad868d8f Balbir Singh            2025-07-04  1019  			}
7a40e7ad868d8f Balbir Singh            2025-07-04  1020  
7a40e7ad868d8f Balbir Singh            2025-07-04  1021  			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
241f6885965683 Alistair Popple         2022-09-28  1022  						&src_pfns[i]);
7a40e7ad868d8f Balbir Singh            2025-07-04  1023  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1024  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  1025  
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1026  		newfolio = page_folio(newpage);
e18a9faf06c240 Matthew Wilcox (Oracle  2024-04-23  1027) 		folio = page_folio(page);
e18a9faf06c240 Matthew Wilcox (Oracle  2024-04-23  1028) 		mapping = folio_mapping(folio);
76cbbead253ddc Christoph Hellwig       2022-02-16  1029  
7a40e7ad868d8f Balbir Singh            2025-07-04  1030  		/*
7a40e7ad868d8f Balbir Singh            2025-07-04  1031  		 * If THP migration is enabled, check if both src and dst
7a40e7ad868d8f Balbir Singh            2025-07-04  1032  		 * can migrate large pages
7a40e7ad868d8f Balbir Singh            2025-07-04  1033  		 */
7a40e7ad868d8f Balbir Singh            2025-07-04  1034  		if (thp_migration_supported()) {
7a40e7ad868d8f Balbir Singh            2025-07-04  1035  			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
7a40e7ad868d8f Balbir Singh            2025-07-04  1036  				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
7a40e7ad868d8f Balbir Singh            2025-07-04  1037  				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
7a40e7ad868d8f Balbir Singh            2025-07-04  1038  
7a40e7ad868d8f Balbir Singh            2025-07-04  1039  				if (!migrate) {
7a40e7ad868d8f Balbir Singh            2025-07-04  1040  					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
7a40e7ad868d8f Balbir Singh            2025-07-04  1041  							 MIGRATE_PFN_COMPOUND);
7a40e7ad868d8f Balbir Singh            2025-07-04  1042  					goto next;
7a40e7ad868d8f Balbir Singh            2025-07-04  1043  				}
7a40e7ad868d8f Balbir Singh            2025-07-04  1044  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04  1045  			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
7a40e7ad868d8f Balbir Singh            2025-07-04  1046  				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
7a40e7ad868d8f Balbir Singh            2025-07-04  1047  				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
7a40e7ad868d8f Balbir Singh            2025-07-04  1048  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04  1049  			}
7a40e7ad868d8f Balbir Singh            2025-07-04  1050  		}
7a40e7ad868d8f Balbir Singh            2025-07-04  1051  
7a40e7ad868d8f Balbir Singh            2025-07-04  1052  
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1053  		if (folio_is_device_private(newfolio) ||
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1054  		    folio_is_device_coherent(newfolio)) {
df263d9a7dffee Mika Penttilä           2023-06-07  1055  			if (mapping) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1056  				/*
f25cbb7a95a24f Alex Sierra             2022-07-15  1057  				 * For now only support anonymous memory migrating to
f25cbb7a95a24f Alex Sierra             2022-07-15  1058  				 * device private or coherent memory.
df263d9a7dffee Mika Penttilä           2023-06-07  1059  				 *
df263d9a7dffee Mika Penttilä           2023-06-07  1060  				 * Try to get rid of swap cache if possible.
76cbbead253ddc Christoph Hellwig       2022-02-16  1061  				 */
df263d9a7dffee Mika Penttilä           2023-06-07  1062  				if (!folio_test_anon(folio) ||
df263d9a7dffee Mika Penttilä           2023-06-07  1063  				    !folio_free_swap(folio)) {
241f6885965683 Alistair Popple         2022-09-28  1064  					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04  1065  					goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1066  				}
df263d9a7dffee Mika Penttilä           2023-06-07  1067  			}
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1068  		} else if (folio_is_zone_device(newfolio)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1069  			/*
76cbbead253ddc Christoph Hellwig       2022-02-16  1070  			 * Other types of ZONE_DEVICE page are not supported.
76cbbead253ddc Christoph Hellwig       2022-02-16  1071  			 */
241f6885965683 Alistair Popple         2022-09-28  1072  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
7a40e7ad868d8f Balbir Singh            2025-07-04  1073  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1074  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  1075  
15b0c79cfadad6 Kefeng Wang             2024-05-24  1076  		BUG_ON(folio_test_writeback(folio));
15b0c79cfadad6 Kefeng Wang             2024-05-24  1077  
241f6885965683 Alistair Popple         2022-09-28  1078  		if (migrate && migrate->fault_page == page)
15b0c79cfadad6 Kefeng Wang             2024-05-24  1079  			extra_cnt = 1;
15b0c79cfadad6 Kefeng Wang             2024-05-24  1080  		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
76cbbead253ddc Christoph Hellwig       2022-02-16  1081  		if (r != MIGRATEPAGE_SUCCESS)
241f6885965683 Alistair Popple         2022-09-28  1082  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
15b0c79cfadad6 Kefeng Wang             2024-05-24  1083  		else
15b0c79cfadad6 Kefeng Wang             2024-05-24  1084  			folio_migrate_flags(newfolio, folio);
7a40e7ad868d8f Balbir Singh            2025-07-04  1085  next:
7a40e7ad868d8f Balbir Singh            2025-07-04  1086  		i += nr;
76cbbead253ddc Christoph Hellwig       2022-02-16  1087  	}
76cbbead253ddc Christoph Hellwig       2022-02-16  1088  
76cbbead253ddc Christoph Hellwig       2022-02-16  1089  	if (notified)
ec8832d007cb7b Alistair Popple         2023-07-25  1090  		mmu_notifier_invalidate_range_end(&range);
76cbbead253ddc Christoph Hellwig       2022-02-16  1091  }
76cbbead253ddc Christoph Hellwig       2022-02-16  1092  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
