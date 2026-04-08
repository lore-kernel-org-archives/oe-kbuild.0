Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF222E2DF2
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 04:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775622348; cv=none; b=qz0Q6v7lANCpIYEFv9CBaQGVrC94XP0EeLfKDlnEkoQrQC49bEMh9Dpu3KvOkE702ansr+DkdxcTnbiDMuxtk7hALYPj7L3ELE8a7n9sJEbEloAiDDxX1QwVTBVwIbt+5ZVrAU8NzAHAOWteaFJMuWYe3R252Oawi8ML9icDwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775622348; c=relaxed/simple;
	bh=GecmD2YN2a88grM28IK9MD4Ve/256rdKUA8MadIV4es=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JviQoNTjXMTUBDLqIuWpxlrzxE5gCEjT/35woi8tHUREFzVIScxLj7QhffK77WbXLyg+j+Vy/i/6XmPUvSGeVC7MlIiipM2zL0oV4B03YlGeB7u3r7XAXXBFI3GcVhfbEyCmVVo5AI8fvhSt2aMYW2L2X/MUev1rH9/qsez3gMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZFkozcb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZFkozcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775622345; x=1807158345;
  h=date:from:to:cc:subject:message-id;
  bh=GecmD2YN2a88grM28IK9MD4Ve/256rdKUA8MadIV4es=;
  b=NZFkozcbLIwYxyficyZQyLOn/ep8/nQDDuBmShuwUmn4TEDLBxBUIJfa
   hDppa3Xc0Anjcc2Laui0qkGyFsO3iqrxGxF9q3t8KxfNeR/WJCxNxj8vc
   zmYuYz+qfiPDDw5Rqf0XVP7gVmOWYEs97GWXqcixTogDJAwVvqZqXtqKe
   gvoJL6Uy8a39FOxLff/SzL+mLtU4By9w6IIGAKy2XdhIOUXE/LdYdVexS
   ZecvUktwm0eHvQIyFtVqNibELG9aV9Rue+PLJ7lPxKRuoFh1MehnEcg/y
   s/1ms7Bl7QOk8z2nbLAxr1caz2I4EJLrdob0e6AgXdTd5yWBxPjfX+V6K
   A==;
X-CSE-ConnectionGUID: J0F+NyNcRxyuCG7rswRTJA==
X-CSE-MsgGUID: sOKPfM1wRDSdQikpc8gNqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75633358"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="75633358"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 21:25:44 -0700
X-CSE-ConnectionGUID: 0HufXPmKR+StH3/14i2deQ==
X-CSE-MsgGUID: YU+EqcOZRNiiw/vl1zO07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="232402808"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 21:25:43 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAKU0-00000000AOz-49OI;
	Wed, 08 Apr 2026 04:25:40 +0000
Date: Wed, 08 Apr 2026 06:24:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/page_alloc.c:414:44: error: invalid use of undefined type
 'const struct pageblock_data'
Message-ID: <202604080625.I1FdysJj-lkp@intel.com>
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
TO: Johannes Weiner <hannes@cmpxchg.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260407-193348
head:   fed3344e092819bacd3a25de239265aa067bd4e7
commit: fed3344e092819bacd3a25de239265aa067bd4e7 mm: page_alloc: per-cpu pageblock buddy allocator
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080625.I1FdysJj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080625.I1FdysJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080625.I1FdysJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
   mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
   mm/page_alloc.c:363:44: error: invalid use of undefined type 'struct pageblock_data'
     363 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
   In file included from <command-line>:
   mm/page_alloc.c: In function 'pbd_migratetype':
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:642:53: note: in definition of macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   ./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from ./include/linux/compiler.h:372,
                    from ./include/asm-generic/bug.h:5,
                    from ./arch/x86/include/asm/bug.h:193,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./include/linux/mm.h:7,
                    from mm/page_alloc.c:18:
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   mm/page_alloc.c: In function 'init_pageblock_migratetype':
   mm/page_alloc.c:542:12: error: invalid use of undefined type 'struct pageblock_data'
     542 |         pbd->block_pfn = pfn;
         |            ^~
   mm/page_alloc.c:543:28: error: invalid use of undefined type 'struct pageblock_data'
     543 |         INIT_LIST_HEAD(&pbd->cpu_node);
         |                            ^~
   mm/page_alloc.c: In function 'clear_pcpblock_owner':
   mm/page_alloc.c:712:12: error: invalid use of undefined type 'struct pageblock_data'
     712 |         pbd->cpu = 0;
         |            ^~
   mm/page_alloc.c:713:27: error: invalid use of undefined type 'struct pageblock_data'
     713 |         list_del_init(&pbd->cpu_node);
         |                           ^~
   mm/page_alloc.c: In function 'set_pcpblock_owner':
   mm/page_alloc.c:718:50: error: invalid use of undefined type 'struct pageblock_data'
     718 |         pfn_to_pageblock(page, page_to_pfn(page))->cpu = cpu + 1;
         |                                                  ^~
   mm/page_alloc.c: In function 'get_pcpblock_owner':
   mm/page_alloc.c:723:57: error: invalid use of undefined type 'struct pageblock_data'
     723 |         return pfn_to_pageblock(page, page_to_pfn(page))->cpu - 1;
         |                                                         ^~
   mm/page_alloc.c: In function 'free_pcppages_bulk':
   mm/page_alloc.c:1603:52: error: invalid use of undefined type 'struct pageblock_data'
    1603 |                                 if (list_empty(&pbd->cpu_node))
         |                                                    ^~
   mm/page_alloc.c:1604:54: error: invalid use of undefined type 'struct pageblock_data'
    1604 |                                         list_add(&pbd->cpu_node, &pcp->owned_blocks);
         |                                                      ^~
   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:31:
   mm/page_alloc.c: In function 'rmqueue_bulk':
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:17:
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/list.h:5,
                    from ./include/linux/smp.h:12,
                    from ./include/linux/lockdep.h:14,
                    from ./include/linux/spinlock.h:63,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:8:
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:773:26: error: invalid use of undefined type 'struct pageblock_data'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   ./include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2722:31: error: invalid use of undefined type 'struct pageblock_data'
    2722 |                 base_pfn = pbd->block_pfn;
         |                               ^~
   mm/page_alloc.c:2743:35: error: invalid use of undefined type 'struct pageblock_data'
    2743 |                 list_del_init(&pbd->cpu_node);
         |                                   ^~
   mm/page_alloc.c: In function '__free_frozen_pages':
   mm/page_alloc.c:3248:24: error: invalid use of undefined type 'struct pageblock_data'
    3248 |         owner_cpu = pbd->cpu - 1;
         |                        ^~
   mm/page_alloc.c: In function 'free_unref_folios':
   mm/page_alloc.c:3333:32: error: invalid use of undefined type 'struct pageblock_data'
    3333 |                 owner_cpu = pbd->cpu - 1;
         |                                ^~
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
   mm/page_alloc.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
     364 | }
         | ^


vim +414 mm/page_alloc.c

0b423ca22f95a8 Mel Gorman      2016-05-19  406  
fed3344e092819 Johannes Weiner 2026-04-03  407  /*
fed3344e092819 Johannes Weiner 2026-04-03  408   * Extract migratetype from a pageblock_data pointer. Callers that
fed3344e092819 Johannes Weiner 2026-04-03  409   * already have the pbd can avoid a redundant pfn_to_pageblock().
fed3344e092819 Johannes Weiner 2026-04-03  410   */
fed3344e092819 Johannes Weiner 2026-04-03  411  static __always_inline enum migratetype
fed3344e092819 Johannes Weiner 2026-04-03  412  pbd_migratetype(const struct pageblock_data *pbd)
fed3344e092819 Johannes Weiner 2026-04-03  413  {
fed3344e092819 Johannes Weiner 2026-04-03 @414  	unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
fed3344e092819 Johannes Weiner 2026-04-03  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
