Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795730471;
	b=P+BbiWgDN5d73p7H7Z7+gmu7Go/15h5qMDOI4FzBY4oYPI5g2XbafRnNJyiVp2RrwrL+
	 xaEBP3NlB+oNg8rIjN70BwT0V1It0oiQXEqPcVRIbaVUJEORFl2CVRlW3Atg3b+1WMKAl
	 nlIjXaKaLEm/c7qzj9/lzDFJj4qbPV45TuMPdg4BDnuTjHRtB0tvpl1C0jo20OimvlYdk
	 lXaVe8L5mXjsvOMW8Qh/++gT73Isn/q4G8TlPXyUmmkjV2W148rYIK8jb/ow1eG5ooO6o
	 kKDNZ/HmU3mk9IPc6VUvGjtQ1mIQReZu/V1VOgJv4di8adwhhNJ3EgIhOwb2LywLxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730471;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LSsffIpW6ejfWKDcjjoSp5sq5YYxh/kzzDAyabxiIvs=;
	b=aYvKcdMU+eE5ISg+LUZpj9aiL0NREoqoVP6qnHEJPzkVhPCrwLi/5fnYvzlOLSzlM22t
	 UzFQJ1RCAXXVrSOQJxg3Sv/e6YvSqwHFzJ6Y47rWufHan2L/Cs4aprxGg29RfukB+IeCZ
	 21jlZQxrCF67DK0XAgR+vk3WMxtFK9mtsqYIy51m6J91lShpL429TMwnTZeA9UsLTu9cv
	 ZkO8mQyLcIP3gn9KWoXvlt8qLzsvGeAlTri420T2hRKC0X59heGkh+mxXW9ixLo+TI9pL
	 kJVCgqoAphfD7Hp2TmzTdg6mr6cVkWJd2sJzxJcRWkIPsLpVGsMS5F3hhIRXlj9b6TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaRee+8+;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F816606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F816606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaRee+8+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795730470; x=1827266470;
  h=date:from:to:cc:subject:message-id;
  bh=h7pJ1VjKTUSMOVdFla2KEu4SVkLoA2+uPKchBEYKJH4=;
  b=WaRee+8+yXF7wHJv/siWqd/5cFosFyEGC5tIZh8mNHPnxFynqtHgg3q6
   pWTzW27La+xybPCCD+LeAhcvo8cJ4WQGqDymA8q6kVIwnPn0Rc5NwFguh
   h/qq5JBL8zrqTww5PXqhtYJm70IFzxu3hgJkvShmDVAl9B+YlhOUBoPgf
   pZWAJtU776oFqVtFIWcfaEX0aOPXi2yJs4zUIi2KBw9EZNBrdabis4olJ
   sbcTcOe41Ps8DVHN5k8BKpyN7Bv33FjwrPUzYB1lEoirAD1lyGMQqNV7H
   UakpFN/Z2SJkYN2bhmkQ7jJPjHNbG//tjjbdSYk5UwvxnYfzxcU1aQsM1
   g==;
X-CSE-ConnectionGUID: 46fRSEOzSgGf6Vfv71FSnA==
X-CSE-MsgGUID: IuF6yDtZQzmk9RhVGDS1gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4643082"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4643082"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 14:01:09 -0800
X-CSE-ConnectionGUID: DSGAkdOiRF2/wrO9ChtFEg==
X-CSE-MsgGUID: pv4raa2AQqWOyG3xTUfOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="13938541"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 26 Nov 2026 14:01:07 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWhWa-000000000CU-1ztg;
	Thu, 26 Nov 2026 22:01:04 +0000
Date: Thu, 26 Nov 2026 23:00:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mm:for-test 8/10] mm/vmscan.c:6324:38: error: 'struct
 scan_control' has no member named 'nofragment'
Message-ID: <20261126225320.UXhcPpks-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-test
head:   36a5408f22c511a0e2a3105244b88e0f8feb772d
commit: 5cd57ec259efa2dfa64c2b7a48553febb8ab6149 [8/10] Merge https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable into for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261126/20261126225320.UXhcPpks-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126225320.UXhcPpks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126225320.UXhcPpks-lkp@intel.com/

Note: the mm/for-test HEAD 36a5408f22c511a0e2a3105244b88e0f8feb772d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'allocation_can_succeed':
>> mm/vmscan.c:6324:38: error: 'struct scan_control' has no member named 'nofragment'
    6324 |         unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
         |                                      ^~
   mm/vmscan.c: In function 'try_to_free_pages':
   mm/vmscan.c:6993:18: error: 'struct scan_control' has no member named 'nofragment'
    6993 |                 .nofragment = !!(alloc_flags & ALLOC_NOFRAGMENT),
         |                  ^~~~~~~~~~
--
   mm/hugetlb.c: In function 'hugetlb_unmap_range':
>> mm/hugetlb.c:5480:38: error: implicit declaration of function 'tlb_delay_rmap'; did you mean 'tlb_can_delay_rmap'? [-Wimplicit-function-declaration]
    5480 |                         delay_rmap = tlb_delay_rmap(tlb);
         |                                      ^~~~~~~~~~~~~~
         |                                      tlb_can_delay_rmap
--
   mm/huge_memory.c: In function 'zap_huge_pmd_folio':
>> mm/huge_memory.c:2560:18: error: too few arguments to function '__tlb_remove_page_size'
    2560 |         else if (__tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE))
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/tlb.h:8,
                    from mm/huge_memory.c:46:
   include/asm-generic/tlb.h:248:6: note: declared here
     248 | bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +6324 mm/vmscan.c

23b9da55c5b0fe Mel Gorman             2012-05-29  6320  
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6321) static bool allocation_can_succeed(struct zone *zone, struct scan_control *sc,
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6322) 				   unsigned long mark)
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6323) {
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16 @6324) 	unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6325) 	long free_pages = zone_page_state(zone, NR_FREE_PAGES);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6326) 	int migratetype = gfp_migratetype(sc->gfp_mask);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6327) 
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6328) 	return __zone_watermark_ok_mt(zone, sc->order, mark, sc->reclaim_idx,
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6329) 				      alloc_flags, free_pages, migratetype);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6330) }
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6331) 

:::::: The code at line 6324 was first introduced by commit
:::::: dbbc5a3d50f9c0404903d4ca31311175fb6aae8c mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT

:::::: TO: Kiryl Shutsemau (Meta) <kas@kernel.org>
:::::: CC: Vlastimil Babka (SUSE) <vbabka@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
