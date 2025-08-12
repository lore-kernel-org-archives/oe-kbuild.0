Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351D27FB27
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012652; cv=none; b=u88sjUrsL41GryBleHrl73zyBrx7e+FR3gHOt6xHZo/F7pHLs5S/4I64nxrk4x01DTyMfl4WTLcIAVE+roSQROmHwjNLwkyPgyUUTpittFkVd1G1/SKFRq4Wu1IoVigW4JfrRTlN8jIgaykG/JVxS0FeQx42bx9D2vWiPnPtjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012652; c=relaxed/simple;
	bh=yWR6wB5l+N/IIOXBDDXQCil+D7w6Y63WFQlB4VQyiiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfHjtdQTyl2x7pcgqDKJDgJVJ4ZMQhhbhEBm9ZHL9usbKUN8VFVjssK7InvNNUyNHNv679zbqiFR+M7e09tzJK3wDrnIgvFxCwumjPqpLZXsQ+HzUhtS27ArEtLZpBm4YXt6gG1D7Yqx9l9JkFbMKge38VZkNeZGnMmOK2hmw+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFChvgHA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFChvgHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755012650; x=1786548650;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yWR6wB5l+N/IIOXBDDXQCil+D7w6Y63WFQlB4VQyiiY=;
  b=dFChvgHAuaI6euuyVLDwhbqMkajqin71RqKSE6g/cxrzkliZ9qOZcTWe
   RgvcNaq6Y7BNvOkFvhsZ8Fdk5ZY3Bqsg3ZZJVjM3qwbEmc9fEGnNzMU49
   cxk7So6KGzStyteDYq940shS0aOJvyXcElLkbHMzxsQHnRjOhbw/3S6X9
   MXsuD4Y1oX7SksJ3Zf09dKj0aJuuOziKn1anBJmc1xl3V3eUwve/aX2u1
   gS0CPLfd4fSLkmeeoA8WdnfgANo4ztj7SIQpYC49kGutX8/Wu/eTsccEc
   IyH5EiAAQqxoFMvKREwf0qPVxQqt7Z6jwA1zQ/XJMGkvmXpgIgdOTjLg8
   g==;
X-CSE-ConnectionGUID: LwBE1bk0TbOWS3VqPIJiHw==
X-CSE-MsgGUID: gI/GzRG5SLWgqNf7kIB+pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57247857"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57247857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:30:48 -0700
X-CSE-ConnectionGUID: ukP8e3+vRM2MSTzlUQ+vkA==
X-CSE-MsgGUID: jbtY+4tAT4apTfpOTSpnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166587024"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2025 08:30:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulqxY-0006vr-1L;
	Tue, 12 Aug 2025 15:30:44 +0000
Date: Tue, 12 Aug 2025 23:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
Message-ID: <202508122324.gsUhyHjU-lkp@intel.com>
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
In-Reply-To: <20250812024036.690064-4-balbirs@nvidia.com>
References: <20250812024036.690064-4-balbirs@nvidia.com>
TO: Balbir Singh <balbirs@nvidia.com>
TO: dri-devel@lists.freedesktop.org
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
CC: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>
CC: Rakie Kim <rakie.kim@sk.com>
CC: Byungchul Park <byungchul@sk.com>
CC: Gregory Price <gourry@gourry.net>
CC: Ying Huang <ying.huang@linux.alibaba.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Oscar Salvador <osalvador@suse.de>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Nico Pache <npache@redhat.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Dev Jain <dev.jain@arm.com>
CC: Barry Song <baohua@kernel.org>
CC: Lyude Paul <lyude@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: Ralph Campbell <rcampbell@nvidia.com>
CC: "Mika Penttilä" <mpenttil@redhat.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>

Hi Balbir,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250812-105145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250812024036.690064-4-balbirs%40nvidia.com
patch subject: [v3 03/11] mm/migrate_device: THP migration of zone device pages
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: s390-randconfig-002-20250812 (https://download.01.org/0day-ci/archive/20250812/202508122324.gsUhyHjU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508122324.gsUhyHjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508122324.gsUhyHjU-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate_device.c:266:19: warning: variable 'new_folio' set but not used [-Wunused-but-set-variable]
     266 |                                 struct folio *new_folio;
         |                                               ^
>> mm/migrate_device.c:1066:10: error: call to '__compiletime_assert_462' declared with 'error' attribute: BUILD_BUG failed
    1066 |                                 nr = HPAGE_PMD_NR;
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
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_462
         | ^
   1 warning and 1 error generated.


vim +1066 mm/migrate_device.c

76cbbead253ddc Christoph Hellwig       2022-02-16  1019  
e778406b40dbb1 Alistair Popple         2022-09-28  1020  static void __migrate_device_pages(unsigned long *src_pfns,
241f6885965683 Alistair Popple         2022-09-28  1021  				unsigned long *dst_pfns, unsigned long npages,
241f6885965683 Alistair Popple         2022-09-28  1022  				struct migrate_vma *migrate)
76cbbead253ddc Christoph Hellwig       2022-02-16  1023  {
76cbbead253ddc Christoph Hellwig       2022-02-16  1024  	struct mmu_notifier_range range;
241f6885965683 Alistair Popple         2022-09-28  1025  	unsigned long i;
76cbbead253ddc Christoph Hellwig       2022-02-16  1026  	bool notified = false;
76cbbead253ddc Christoph Hellwig       2022-02-16  1027  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1028  	for (i = 0; i < npages; ) {
241f6885965683 Alistair Popple         2022-09-28  1029  		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
241f6885965683 Alistair Popple         2022-09-28  1030  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
76cbbead253ddc Christoph Hellwig       2022-02-16  1031  		struct address_space *mapping;
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1032  		struct folio *newfolio, *folio;
15b0c79cfadad6 Kefeng Wang             2024-05-24  1033  		int r, extra_cnt = 0;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1034  		unsigned long nr = 1;
76cbbead253ddc Christoph Hellwig       2022-02-16  1035  
76cbbead253ddc Christoph Hellwig       2022-02-16  1036  		if (!newpage) {
241f6885965683 Alistair Popple         2022-09-28  1037  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1038  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1039  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  1040  
76cbbead253ddc Christoph Hellwig       2022-02-16  1041  		if (!page) {
241f6885965683 Alistair Popple         2022-09-28  1042  			unsigned long addr;
241f6885965683 Alistair Popple         2022-09-28  1043  
e778406b40dbb1 Alistair Popple         2022-09-28  1044  			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
4d11f7ecab6e07 Balbir Singh            2025-08-12  1045  				goto next;
e778406b40dbb1 Alistair Popple         2022-09-28  1046  
b05a79d4377f6d Alistair Popple         2022-07-15  1047  			/*
b05a79d4377f6d Alistair Popple         2022-07-15  1048  			 * The only time there is no vma is when called from
5c8525a37b78dd Kefeng Wang             2024-08-26  1049  			 * migrate_device_coherent_folio(). However this isn't
b05a79d4377f6d Alistair Popple         2022-07-15  1050  			 * called if the page could not be unmapped.
b05a79d4377f6d Alistair Popple         2022-07-15  1051  			 */
241f6885965683 Alistair Popple         2022-09-28  1052  			VM_BUG_ON(!migrate);
241f6885965683 Alistair Popple         2022-09-28  1053  			addr = migrate->start + i*PAGE_SIZE;
76cbbead253ddc Christoph Hellwig       2022-02-16  1054  			if (!notified) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1055  				notified = true;
76cbbead253ddc Christoph Hellwig       2022-02-16  1056  
76cbbead253ddc Christoph Hellwig       2022-02-16  1057  				mmu_notifier_range_init_owner(&range,
7d4a8be0c4b2b7 Alistair Popple         2023-01-10  1058  					MMU_NOTIFY_MIGRATE, 0,
76cbbead253ddc Christoph Hellwig       2022-02-16  1059  					migrate->vma->vm_mm, addr, migrate->end,
76cbbead253ddc Christoph Hellwig       2022-02-16  1060  					migrate->pgmap_owner);
76cbbead253ddc Christoph Hellwig       2022-02-16  1061  				mmu_notifier_invalidate_range_start(&range);
76cbbead253ddc Christoph Hellwig       2022-02-16  1062  			}
4d11f7ecab6e07 Balbir Singh            2025-08-12  1063  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1064  			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
4d11f7ecab6e07 Balbir Singh            2025-08-12  1065  				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
4d11f7ecab6e07 Balbir Singh            2025-08-12 @1066  				nr = HPAGE_PMD_NR;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1067  				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1068  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1069  				goto next;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1070  			}
4d11f7ecab6e07 Balbir Singh            2025-08-12  1071  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1072  			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
241f6885965683 Alistair Popple         2022-09-28  1073  						&src_pfns[i]);
4d11f7ecab6e07 Balbir Singh            2025-08-12  1074  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1075  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  1076  
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1077  		newfolio = page_folio(newpage);
e18a9faf06c240 Matthew Wilcox (Oracle  2024-04-23  1078) 		folio = page_folio(page);
e18a9faf06c240 Matthew Wilcox (Oracle  2024-04-23  1079) 		mapping = folio_mapping(folio);
76cbbead253ddc Christoph Hellwig       2022-02-16  1080  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1081  		/*
4d11f7ecab6e07 Balbir Singh            2025-08-12  1082  		 * If THP migration is enabled, check if both src and dst
4d11f7ecab6e07 Balbir Singh            2025-08-12  1083  		 * can migrate large pages
4d11f7ecab6e07 Balbir Singh            2025-08-12  1084  		 */
4d11f7ecab6e07 Balbir Singh            2025-08-12  1085  		if (thp_migration_supported()) {
4d11f7ecab6e07 Balbir Singh            2025-08-12  1086  			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
4d11f7ecab6e07 Balbir Singh            2025-08-12  1087  				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
4d11f7ecab6e07 Balbir Singh            2025-08-12  1088  				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
4d11f7ecab6e07 Balbir Singh            2025-08-12  1089  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1090  				if (!migrate) {
4d11f7ecab6e07 Balbir Singh            2025-08-12  1091  					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
4d11f7ecab6e07 Balbir Singh            2025-08-12  1092  							 MIGRATE_PFN_COMPOUND);
4d11f7ecab6e07 Balbir Singh            2025-08-12  1093  					goto next;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1094  				}
4d11f7ecab6e07 Balbir Singh            2025-08-12  1095  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1096  			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
4d11f7ecab6e07 Balbir Singh            2025-08-12  1097  				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
4d11f7ecab6e07 Balbir Singh            2025-08-12  1098  				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
4d11f7ecab6e07 Balbir Singh            2025-08-12  1099  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1100  			}
4d11f7ecab6e07 Balbir Singh            2025-08-12  1101  		}
4d11f7ecab6e07 Balbir Singh            2025-08-12  1102  
4d11f7ecab6e07 Balbir Singh            2025-08-12  1103  
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1104  		if (folio_is_device_private(newfolio) ||
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1105  		    folio_is_device_coherent(newfolio)) {
df263d9a7dffee Mika Penttilä           2023-06-07  1106  			if (mapping) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1107  				/*
f25cbb7a95a24f Alex Sierra             2022-07-15  1108  				 * For now only support anonymous memory migrating to
f25cbb7a95a24f Alex Sierra             2022-07-15  1109  				 * device private or coherent memory.
df263d9a7dffee Mika Penttilä           2023-06-07  1110  				 *
df263d9a7dffee Mika Penttilä           2023-06-07  1111  				 * Try to get rid of swap cache if possible.
76cbbead253ddc Christoph Hellwig       2022-02-16  1112  				 */
df263d9a7dffee Mika Penttilä           2023-06-07  1113  				if (!folio_test_anon(folio) ||
df263d9a7dffee Mika Penttilä           2023-06-07  1114  				    !folio_free_swap(folio)) {
241f6885965683 Alistair Popple         2022-09-28  1115  					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1116  					goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1117  				}
df263d9a7dffee Mika Penttilä           2023-06-07  1118  			}
6aaaef5b6fe3f5 Kefeng Wang             2024-05-24  1119  		} else if (folio_is_zone_device(newfolio)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  1120  			/*
76cbbead253ddc Christoph Hellwig       2022-02-16  1121  			 * Other types of ZONE_DEVICE page are not supported.
76cbbead253ddc Christoph Hellwig       2022-02-16  1122  			 */
241f6885965683 Alistair Popple         2022-09-28  1123  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
4d11f7ecab6e07 Balbir Singh            2025-08-12  1124  			goto next;
76cbbead253ddc Christoph Hellwig       2022-02-16  1125  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  1126  
15b0c79cfadad6 Kefeng Wang             2024-05-24  1127  		BUG_ON(folio_test_writeback(folio));
15b0c79cfadad6 Kefeng Wang             2024-05-24  1128  
241f6885965683 Alistair Popple         2022-09-28  1129  		if (migrate && migrate->fault_page == page)
15b0c79cfadad6 Kefeng Wang             2024-05-24  1130  			extra_cnt = 1;
15b0c79cfadad6 Kefeng Wang             2024-05-24  1131  		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
76cbbead253ddc Christoph Hellwig       2022-02-16  1132  		if (r != MIGRATEPAGE_SUCCESS)
241f6885965683 Alistair Popple         2022-09-28  1133  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
15b0c79cfadad6 Kefeng Wang             2024-05-24  1134  		else
15b0c79cfadad6 Kefeng Wang             2024-05-24  1135  			folio_migrate_flags(newfolio, folio);
4d11f7ecab6e07 Balbir Singh            2025-08-12  1136  next:
4d11f7ecab6e07 Balbir Singh            2025-08-12  1137  		i += nr;
76cbbead253ddc Christoph Hellwig       2022-02-16  1138  	}
76cbbead253ddc Christoph Hellwig       2022-02-16  1139  
76cbbead253ddc Christoph Hellwig       2022-02-16  1140  	if (notified)
ec8832d007cb7b Alistair Popple         2023-07-25  1141  		mmu_notifier_invalidate_range_end(&range);
76cbbead253ddc Christoph Hellwig       2022-02-16  1142  }
76cbbead253ddc Christoph Hellwig       2022-02-16  1143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
