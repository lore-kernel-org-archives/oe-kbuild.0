Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361011C3F31
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775615025; cv=none; b=a3ZseyfGkfBu4lF9KUA5DDM0KZq6IIYSgu/PHRMrkhzK1BIuwyV6gKmOCv5WeVROt2Hmhdu5b6xNbtr1eI56wZdxohLTVROga6Sq+pQ0pJzXazvfsNGXZ5prwpGpASZgozbMgp/WxfOdIoMg9OstWUSlpZW0QY2whL5LsDzJgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775615025; c=relaxed/simple;
	bh=2SJCVCSeWwcqpjlxtfXHBzoxrDK3s+kI1Tqglck9e0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3W157ALVO+s1o5an105H3jFWjGOu4+dW0cVRgYXZUuVojX7sBs7AjiseZTqBFFe0HfkCbjPYg51qKd6b4Y00crKvYW2svA2XvfnRCcb6I2xvsZ1gtIxd3WbQUcZZI8NaaVt4k68qxKN2evGd3/upCT9YRzp9/Ay652LPacTRlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbskWB9S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbskWB9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775615023; x=1807151023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2SJCVCSeWwcqpjlxtfXHBzoxrDK3s+kI1Tqglck9e0Q=;
  b=JbskWB9S54HoPlD7AyE6hpTq/sfWUyXL2xNprEnW6dkMd+zbeNXsalua
   kRj3v0Qe8x8gFxF3cakvQHZQwQChiNaGrGTgOimX0c2AZe3FD0teK41oa
   DTNyNqrT41by5LJMh5iOcSM4SrxAQPldC7x2TPT+Mk0ywcxLvAqYib92U
   VjguXhknEGjFRV9zM8eNb9Rzkn2AdBErM7SAD7qfSAPWLEtdx3zIPxhFP
   X8DNrEAWa+wf35N5xbGPY0kKIU2Fv7kSzPZxUf+62oOOiRRAE9vI1TArB
   4U8019oMGqZEmPUxOe0CB/hCybXW51KioMo6tJt+2PtbnyXL7LNkuiH7d
   w==;
X-CSE-ConnectionGUID: 5+ueCnu2TvKoK/pUVqBzwA==
X-CSE-MsgGUID: 3r3d6jYIQ6iQDtvwRDdPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76661420"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76661420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:23:42 -0700
X-CSE-ConnectionGUID: Zh7fQ8YERRS5uKV/LeZpjg==
X-CSE-MsgGUID: MGhg0fbhSgKtZTGYmpJ4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="221791644"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2026 19:23:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAIZv-00000000ANx-42wp;
	Wed, 08 Apr 2026 02:23:39 +0000
Date: Wed, 8 Apr 2026 04:22:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
Message-ID: <202604080453.g3eQBKxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260403194526.477775-3-hannes@cmpxchg.org>
References: <20260403194526.477775-3-hannes@cmpxchg.org>
TO: Johannes Weiner <hannes@cmpxchg.org>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/for-next]
[also build test ERROR on rppt-memblock/fixes linus/master v7.0-rc7 next-20260407]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260407-193348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20260403194526.477775-3-hannes%40cmpxchg.org
patch subject: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080453.g3eQBKxN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080453.g3eQBKxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080453.g3eQBKxN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:118:
   kernel/../mm/internal.h: In function 'pfn_to_pageblock':
>> kernel/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/filemap.c:54:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/mm_init.c:35:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/mm_init.c: In function 'usemap_size':
>> mm/mm_init.c:1456:39: error: invalid application of 'sizeof' to incomplete type 'struct pageblock_data'
    1456 |         return nr_pageblocks * sizeof(struct pageblock_data);
         |                                       ^~~~~~
>> mm/mm_init.c:1457:1: warning: control reaches end of non-void function [-Wreturn-type]
    1457 | }
         | ^
--
   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
>> mm/page_alloc.c:363:44: error: invalid use of undefined type 'struct pageblock_data'
     363 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
>> mm/page_alloc.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
     364 | }
         | ^
--
   In file included from fs/exec.c:82:
   fs/../mm/internal.h: In function 'pfn_to_pageblock':
>> fs/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from lib/vsprintf.c:51:
   lib/../mm/internal.h: In function 'pfn_to_pageblock':
>> lib/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^


vim +803 kernel/../mm/internal.h

8170ac4700d26f Zi Yan          2022-04-28  789  
d88d3563065850 Johannes Weiner 2026-04-03  790  static inline struct pageblock_data *pfn_to_pageblock(const struct page *page,
d88d3563065850 Johannes Weiner 2026-04-03  791  						      unsigned long pfn)
d88d3563065850 Johannes Weiner 2026-04-03  792  {
d88d3563065850 Johannes Weiner 2026-04-03  793  #ifdef CONFIG_SPARSEMEM
d88d3563065850 Johannes Weiner 2026-04-03  794  	struct mem_section *ms = __pfn_to_section(pfn);
d88d3563065850 Johannes Weiner 2026-04-03  795  	unsigned long idx = (pfn & (PAGES_PER_SECTION - 1)) >> pageblock_order;
d88d3563065850 Johannes Weiner 2026-04-03  796  
d88d3563065850 Johannes Weiner 2026-04-03  797  	return &section_to_usemap(ms)[idx];
d88d3563065850 Johannes Weiner 2026-04-03  798  #else
d88d3563065850 Johannes Weiner 2026-04-03  799  	struct zone *zone = page_zone(page);
d88d3563065850 Johannes Weiner 2026-04-03  800  	unsigned long idx;
d88d3563065850 Johannes Weiner 2026-04-03  801  
d88d3563065850 Johannes Weiner 2026-04-03  802  	idx = (pfn - pageblock_start_pfn(zone->zone_start_pfn)) >> pageblock_order;
d88d3563065850 Johannes Weiner 2026-04-03 @803  	return &zone->pageblock_data[idx];
d88d3563065850 Johannes Weiner 2026-04-03  804  #endif
d88d3563065850 Johannes Weiner 2026-04-03  805  }
d88d3563065850 Johannes Weiner 2026-04-03  806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
