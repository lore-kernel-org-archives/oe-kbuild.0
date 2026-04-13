Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2502B35E92D
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776123657; cv=none; b=W7l/Wx3q4fGIr13FJBm8hpc4qKgoDcqk5jisbifPIjNEzmIt/Hfrqm1uLZaps750DZfEd+mFNwKvO5z8PJVZ3wvAgOlWOwgm7lpQiFLYiXCVwJlTdWdRsik2eYGzFVIEaSLuVDaZj8RqeRq+cVtz0IWkrFzWykv9GZTUsDdG9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776123657; c=relaxed/simple;
	bh=8HzZ5YfknEZMdwRiAKb0d89rNVFjvD94JkQWeXsqN/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P3DxSf3KuCMkAgvP5CEXZv5mxcpo3dp6FuFecHBRIPirnbLxnzfgMMhbJuCEh8/wZnP9iCttdP1f0cOPNCgeX7ZlCyeD6dohf/4vzJUddmTKTqTrL6LV3YilAdpKhYTLrKS0CrvFmeppSav9DnlIJukkCFsd69icMVFtMjplKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkU8VbiH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkU8VbiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776123655; x=1807659655;
  h=date:from:to:cc:subject:message-id;
  bh=8HzZ5YfknEZMdwRiAKb0d89rNVFjvD94JkQWeXsqN/I=;
  b=bkU8VbiHYjpLsXcH0ry3AXqOUEPofknipWtB2UpxI18qt+Hs/VYuF30F
   UrmqQmZk40lBHILSx1dWVD0WdkJCm6k6n5UICRRPzPfnZE0V+zDJS0reL
   MgnniAe+SlWjHkG1MJBo44Zc/DMDGQLMy3mZsnMoFzwg5SNDdwAY4qfu3
   vre7qLthnkec4uwIWf/duRmufG3O0VklD0rM4BityQTENlYodRn2d8cVn
   YSCtUJyWVqGx1iMq0DR/vGZLqiTOPIwIhvZOBjfN9UiCDRkOhMt3A76QX
   mkMaiQ/I6IOEUhrfvmZPg/bTSzQIp1QlbXbmiLYMg9P20GivHznwGk3qG
   w==;
X-CSE-ConnectionGUID: q2SR7VYOQACtUOhv9XesdQ==
X-CSE-MsgGUID: V4HCySVITZu2SYC+fs3Kqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87771484"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="87771484"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:40:54 -0700
X-CSE-ConnectionGUID: IFQ4CD1rQOGPSKUvCkGGag==
X-CSE-MsgGUID: 8uCjc8UOQ7+NRlQLA57seg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="230165863"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2026 16:40:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQte-000000000EP-1hUu;
	Mon, 13 Apr 2026 23:40:50 +0000
Date: Tue, 14 Apr 2026 01:40:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/page_alloc.c:1758:48: error: 'page_reporting_host_zeroes'
 undeclared
Message-ID: <202604140114.ftpFWnQ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Michael S. Tsirkin" <mst@redhat.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-S-Tsirkin/mm-page_alloc-propagate-PageReported-flag-across-buddy-splits/20260413-231432
head:   b595bf053bb60e812c690b177ae9b15d9df745d5
commit: 8abc113d8e46f1cc8c8d4264f87923849d312e56 mm: page_reporting: skip redundant zeroing of host-zeroed reported pages
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260414/202604140114.ftpFWnQ0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140114.ftpFWnQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140114.ftpFWnQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/static_key.h:1,
                    from ./arch/x86/include/asm/nospec-branch.h:6,
                    from ./arch/x86/include/asm/irqflags.h:9,
                    from ./include/linux/irqflags.h:18,
                    from ./include/linux/spinlock.h:59,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:8,
                    from mm/page_alloc.c:18:
   mm/page_alloc.c: In function 'page_del_and_expand':
>> mm/page_alloc.c:1758:48: error: 'page_reporting_host_zeroes' undeclared (first use in this function)
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/jump_label.h:503:50: note: in definition of macro 'static_branch_unlikely'
     503 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   mm/page_alloc.c:1758:48: note: each undeclared identifier is reported only once for each function it appears in
    1758 |                        static_branch_unlikely(&page_reporting_host_zeroes);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/jump_label.h:503:50: note: in definition of macro 'static_branch_unlikely'
     503 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^


vim +/page_reporting_host_zeroes +1758 mm/page_alloc.c

94deaf69dcd334 Huan Yang          2024-08-26  1747  
94deaf69dcd334 Huan Yang          2024-08-26  1748  static __always_inline void page_del_and_expand(struct zone *zone,
94deaf69dcd334 Huan Yang          2024-08-26  1749  						struct page *page, int low,
94deaf69dcd334 Huan Yang          2024-08-26  1750  						int high, int migratetype)
94deaf69dcd334 Huan Yang          2024-08-26  1751  {
94deaf69dcd334 Huan Yang          2024-08-26  1752  	int nr_pages = 1 << high;
91a39d1c8f8205 Michael S. Tsirkin 2026-04-12  1753  	bool was_reported = page_reported(page);
94deaf69dcd334 Huan Yang          2024-08-26  1754  
94deaf69dcd334 Huan Yang          2024-08-26  1755  	__del_page_from_free_list(page, zone, high, migratetype);
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1756  
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1757  	was_reported = was_reported &&
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12 @1758  		       static_branch_unlikely(&page_reporting_host_zeroes);
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1759  
91a39d1c8f8205 Michael S. Tsirkin 2026-04-12  1760  	nr_pages -= expand(zone, page, low, high, migratetype, was_reported);
94deaf69dcd334 Huan Yang          2024-08-26  1761  	account_freepages(zone, -nr_pages, migratetype);
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1762  
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1763  	/*
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1764  	 * If the page was reported and the host is known to zero reported
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1765  	 * pages, mark it zeroed via page->private so that
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1766  	 * post_alloc_hook() can skip redundant zeroing.
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1767  	 */
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1768  	if (was_reported)
8abc113d8e46f1 Michael S. Tsirkin 2026-04-12  1769  		set_page_private(page, MAGIC_PAGE_ZEROED);
2f47a91f4dab19 Pavel Tatashin     2017-11-15  1770  }
2f47a91f4dab19 Pavel Tatashin     2017-11-15  1771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
