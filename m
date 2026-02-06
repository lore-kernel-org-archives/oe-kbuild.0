Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BF18DF80
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 01:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770342335; cv=none; b=h1uNk6kuJaNIbguGw1ppzMifR8341nnZRkkTY7x40HzZt2vatMHFzP95uWslrwvZdR8EpeNY7ddkgIMJBwPZQkN+p8JG8SFj7s2jhBoH/yQVJPLNvVu9AkorZ5Cm3ccChzTWgew+xkyC5YMsldOH+y4dU9E3KlKw2EB2PjvpCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770342335; c=relaxed/simple;
	bh=tH+N4e6aR0YlgkWUXkV6K4z5tDdVx4Wgk4TzMBlyV1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ugJrRz8gQ7ZP2qJmsqV4nTPehrgUcUZeebX58VzL8mqcZNihzP21eSuUWdVN5mj8VvWuY11+FdGxtVRLfekkCGOAxEFU8mr39ueYsgCZinP93XIq+i2ZsiI3uCVcYGoDsas82kh111xUWuBd7LYfI3AN1JsrZyOJf6gxy8rKo3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvH5CBll; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvH5CBll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770342334; x=1801878334;
  h=date:from:to:cc:subject:message-id;
  bh=tH+N4e6aR0YlgkWUXkV6K4z5tDdVx4Wgk4TzMBlyV1E=;
  b=SvH5CBllziWxpfV93QrUCfwH3HxLyBwnUhyjPt7bJ+sEOTUJO5aBaJuQ
   GSlDK3A8eDgXXOz687h5p/Vz+ou5dkYeka5Up+wGiD2H1qMNcZBHy/OTi
   bvyJkqGphWXnrmNz6E55daVnESGHRWgetPzvQTwSaCV0e+N9w7FWm8J7E
   Ln7x0Wr5jvDHWV46S9ZDkPNjOKc5PyAOdW4dUeqFjhyWvE6j2b+tsnXuT
   +uO9bhtkWZ5TqWsSXrqWE8wUcyDtazmQFYPHCp3iH5JvPCTvee35fc6AQ
   VnRP2LM0xNX+1rzpD4eU1LWDmDBSJun1t8hSGzKlEYctdXyHeEUnQx5WN
   g==;
X-CSE-ConnectionGUID: 3GWy/FLRRtGIJoXY1foQ/w==
X-CSE-MsgGUID: OpWJHYoxTAmlBAdL/ZxoBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71731884"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71731884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 17:45:34 -0800
X-CSE-ConnectionGUID: d8Y67T1uRwWOon2uxrjqhQ==
X-CSE-MsgGUID: OyIaRF1fS/aNGndS5EX/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210018632"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2026 17:45:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voAuX-000000004If-3ulm;
	Fri, 06 Feb 2026 01:45:29 +0000
Date: Fri, 06 Feb 2026 02:44:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 105/105]
 ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared
Message-ID: <202602060216.tkRq9Wj7-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d9208b34f28d2b57c8c195fd5e1a9d0688f7eb78
commit: cc2f2507f3f05612c61c4b8f11bb91efbb9ad495 [105/105] maple_tree: fix freeing of nodes in rcu mode
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602060216.tkRq9Wj7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060216.tkRq9Wj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602060216.tkRq9Wj7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from maple.c:23:
   ../../../lib/maple_tree.c: In function 'mas_clear_meta':
>> ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared (first use in this function)
     921 |                 fallthrough;
         |                 ^~~~~~~~~~~
   ../../../lib/maple_tree.c:921:17: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from ./linux/scatterlist.h:8,
                    from scatterlist.c:9:
   ./linux/mm.h:113:21: error: conflicting types for 'kmalloc'; have 'void *(unsigned int,  unsigned int)'
     113 | static inline void *kmalloc(unsigned int size, unsigned int flags)
         |                     ^~~~~~~
   In file included from scatterlist.c:8:
   ../../include/linux/slab.h:13:7: note: previous declaration of 'kmalloc' with type 'void *(size_t,  gfp_t)' {aka 'void *(long unsigned int,  gfp_t)'}
      13 | void *kmalloc(size_t size, gfp_t gfp);
         |       ^~~~~~~
   ./linux/scatterlist.h:317:1: error: unterminated comment
     317 | /**
         | ^
   ./linux/scatterlist.h:2: error: unterminated #ifndef
       2 | #ifndef _LINUX_SCATTERLIST_H
   scatterlist.c: In function 'sg_init_table':
>> scatterlist.c:127:9: error: implicit declaration of function 'sg_init_marker'; did you mean 'sg_init_table'? [-Wimplicit-function-declaration]
     127 |         sg_init_marker(sgl, nents);
         |         ^~~~~~~~~~~~~~
         |         sg_init_table
   scatterlist.c: In function 'sg_kmalloc':
>> scatterlist.c:151:22: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     151 |         if (nents == SG_MAX_SINGLE_ALLOC) {
         |                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c:151:22: note: each undeclared identifier is reported only once for each function it appears in
   scatterlist.c: In function 'sg_kfree':
   scatterlist.c:171:22: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     171 |         if (nents == SG_MAX_SINGLE_ALLOC) {
         |                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: At top level:
>> scatterlist.c:194:54: error: unknown type name 'sg_free_fn'
     194 |                      unsigned int nents_first_chunk, sg_free_fn *free_fn,
         |                                                      ^~~~~~~~~~
   scatterlist.c: In function 'sg_free_append_table':
>> scatterlist.c:243:9: error: implicit declaration of function '__sg_free_table' [-Wimplicit-function-declaration]
     243 |         __sg_free_table(&table->sgt, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |         ^~~~~~~~~~~~~~~
   scatterlist.c:243:38: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     243 |         __sg_free_table(&table->sgt, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |                                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_free_table':
   scatterlist.c:256:32: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     256 |         __sg_free_table(table, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |                                ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: At top level:
>> scatterlist.c:285:22: error: unknown type name 'sg_alloc_fn'
     285 |                      sg_alloc_fn *alloc_fn)
         |                      ^~~~~~~~~~~
   scatterlist.c: In function 'sg_alloc_table':
>> scatterlist.c:375:15: error: implicit declaration of function '__sg_alloc_table'; did you mean 'sg_alloc_table'? [-Wimplicit-function-declaration]
     375 |         ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
         |               ^~~~~~~~~~~~~~~~
         |               sg_alloc_table
   scatterlist.c:375:46: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     375 |         ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
         |                                              ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: In function 'get_next_sg':
   scatterlist.c:398:56: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     398 |         alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
         |                                                        ^~~~~~~~~~~~~~~~~~~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:398:22: note: in expansion of macro 'min_t'
     398 |         alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
         |                      ^~~~~
   scatterlist.c: At top level:
>> scatterlist.c:712:34: warning: 'struct sg_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     712 | void __sg_page_iter_start(struct sg_page_iter *piter,
         |                                  ^~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_start':
>> scatterlist.c:716:14: error: invalid use of undefined type 'struct sg_page_iter'
     716 |         piter->__pg_advance = 0;
         |              ^~
   scatterlist.c:717:14: error: invalid use of undefined type 'struct sg_page_iter'
     717 |         piter->__nents = nents;
         |              ^~
   scatterlist.c:719:14: error: invalid use of undefined type 'struct sg_page_iter'
     719 |         piter->sg = sglist;
         |              ^~
   scatterlist.c:720:14: error: invalid use of undefined type 'struct sg_page_iter'
     720 |         piter->sg_pgoffset = pgoffset;
         |              ^~
   scatterlist.c: At top level:
   scatterlist.c:729:33: warning: 'struct sg_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     729 | bool __sg_page_iter_next(struct sg_page_iter *piter)
         |                                 ^~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_next':
   scatterlist.c:731:19: error: invalid use of undefined type 'struct sg_page_iter'
     731 |         if (!piter->__nents || !piter->sg)
         |                   ^~
   scatterlist.c:731:38: error: invalid use of undefined type 'struct sg_page_iter'
     731 |         if (!piter->__nents || !piter->sg)
         |                                      ^~
   scatterlist.c:734:14: error: invalid use of undefined type 'struct sg_page_iter'
     734 |         piter->sg_pgoffset += piter->__pg_advance;
         |              ^~
   scatterlist.c:734:36: error: invalid use of undefined type 'struct sg_page_iter'
     734 |         piter->sg_pgoffset += piter->__pg_advance;
         |                                    ^~
   scatterlist.c:735:14: error: invalid use of undefined type 'struct sg_page_iter'
     735 |         piter->__pg_advance = 1;
         |              ^~
   scatterlist.c:737:21: error: invalid use of undefined type 'struct sg_page_iter'
     737 |         while (piter->sg_pgoffset >= sg_page_count(piter->sg)) {
         |                     ^~
   scatterlist.c:737:57: error: invalid use of undefined type 'struct sg_page_iter'
     737 |         while (piter->sg_pgoffset >= sg_page_count(piter->sg)) {
         |                                                         ^~
   scatterlist.c:738:22: error: invalid use of undefined type 'struct sg_page_iter'
     738 |                 piter->sg_pgoffset -= sg_page_count(piter->sg);
         |                      ^~
   scatterlist.c:738:58: error: invalid use of undefined type 'struct sg_page_iter'
     738 |                 piter->sg_pgoffset -= sg_page_count(piter->sg);
         |                                                          ^~
   scatterlist.c:739:22: error: invalid use of undefined type 'struct sg_page_iter'
     739 |                 piter->sg = sg_next(piter->sg);
         |                      ^~
   scatterlist.c:739:42: error: invalid use of undefined type 'struct sg_page_iter'
     739 |                 piter->sg = sg_next(piter->sg);
         |                                          ^~
   scatterlist.c:740:29: error: invalid use of undefined type 'struct sg_page_iter'
     740 |                 if (!--piter->__nents || !piter->sg)
         |                             ^~
   scatterlist.c:740:48: error: invalid use of undefined type 'struct sg_page_iter'
     740 |                 if (!--piter->__nents || !piter->sg)
         |                                                ^~
   scatterlist.c: At top level:
>> scatterlist.c:753:37: warning: 'struct sg_dma_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     753 | bool __sg_page_iter_dma_next(struct sg_dma_page_iter *dma_iter)
         |                                     ^~~~~~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_dma_next':
>> scatterlist.c:755:47: error: invalid use of undefined type 'struct sg_dma_page_iter'
     755 |         struct sg_page_iter *piter = &dma_iter->base;
         |                                               ^~
   scatterlist.c:757:19: error: invalid use of undefined type 'struct sg_page_iter'
     757 |         if (!piter->__nents || !piter->sg)
         |                   ^~
   scatterlist.c:757:38: error: invalid use of undefined type 'struct sg_page_iter'
     757 |         if (!piter->__nents || !piter->sg)
         |                                      ^~
   scatterlist.c:760:14: error: invalid use of undefined type 'struct sg_page_iter'
     760 |         piter->sg_pgoffset += piter->__pg_advance;
         |              ^~
   scatterlist.c:760:36: error: invalid use of undefined type 'struct sg_page_iter'
     760 |         piter->sg_pgoffset += piter->__pg_advance;
         |                                    ^~
   scatterlist.c:761:14: error: invalid use of undefined type 'struct sg_page_iter'
     761 |         piter->__pg_advance = 1;
         |              ^~
   scatterlist.c:763:21: error: invalid use of undefined type 'struct sg_page_iter'
     763 |         while (piter->sg_pgoffset >= sg_dma_page_count(piter->sg)) {
         |                     ^~
   scatterlist.c:763:61: error: invalid use of undefined type 'struct sg_page_iter'
     763 |         while (piter->sg_pgoffset >= sg_dma_page_count(piter->sg)) {
         |                                                             ^~
   scatterlist.c:764:22: error: invalid use of undefined type 'struct sg_page_iter'
     764 |                 piter->sg_pgoffset -= sg_dma_page_count(piter->sg);
         |                      ^~
   scatterlist.c:764:62: error: invalid use of undefined type 'struct sg_page_iter'
     764 |                 piter->sg_pgoffset -= sg_dma_page_count(piter->sg);
         |                                                              ^~
   scatterlist.c:765:22: error: invalid use of undefined type 'struct sg_page_iter'
     765 |                 piter->sg = sg_next(piter->sg);
         |                      ^~
   scatterlist.c:765:42: error: invalid use of undefined type 'struct sg_page_iter'
     765 |                 piter->sg = sg_next(piter->sg);
         |                                          ^~
   scatterlist.c:766:29: error: invalid use of undefined type 'struct sg_page_iter'
     766 |                 if (!--piter->__nents || !piter->sg)
         |                             ^~
   scatterlist.c:766:48: error: invalid use of undefined type 'struct sg_page_iter'
     766 |                 if (!--piter->__nents || !piter->sg)
         |                                                ^~
   scatterlist.c: At top level:
>> scatterlist.c:786:28: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     786 | void sg_miter_start(struct sg_mapping_iter *miter, struct scatterlist *sgl,
         |                            ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_start':
>> scatterlist.c:789:33: error: invalid application of 'sizeof' to incomplete type 'struct sg_mapping_iter'
     789 |         memset(miter, 0, sizeof(struct sg_mapping_iter));
         |                                 ^~~~~~
>> scatterlist.c:791:36: error: invalid use of undefined type 'struct sg_mapping_iter'
     791 |         __sg_page_iter_start(&miter->piter, sgl, nents, 0);
         |                                    ^~
>> scatterlist.c:792:28: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     792 |         WARN_ON(!(flags & (SG_MITER_TO_SG | SG_MITER_FROM_SG)));
         |                            ^~~~~~~~~~~~~~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> scatterlist.c:792:45: error: 'SG_MITER_FROM_SG' undeclared (first use in this function)
     792 |         WARN_ON(!(flags & (SG_MITER_TO_SG | SG_MITER_FROM_SG)));
         |                                             ^~~~~~~~~~~~~~~~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:793:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     793 |         miter->__flags = flags;
         |              ^~
   scatterlist.c: At top level:
   scatterlist.c:797:36: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                                    ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_get_next_page':
   scatterlist.c:799:19: error: invalid use of undefined type 'struct sg_mapping_iter'
     799 |         if (!miter->__remaining) {
         |                   ^~
   scatterlist.c:802:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     802 |                 if (!__sg_page_iter_next(&miter->piter))
         |                                                ^~
   scatterlist.c:805:27: error: invalid use of undefined type 'struct sg_mapping_iter'
     805 |                 sg = miter->piter.sg;
         |                           ^~
   scatterlist.c:807:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     807 |                 miter->__offset = miter->piter.sg_pgoffset ? 0 : sg->offset;
         |                      ^~
   scatterlist.c:807:40: error: invalid use of undefined type 'struct sg_mapping_iter'
     807 |                 miter->__offset = miter->piter.sg_pgoffset ? 0 : sg->offset;
         |                                        ^~
   scatterlist.c:808:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     808 |                 miter->piter.sg_pgoffset += miter->__offset >> PAGE_SHIFT;
         |                      ^~
   scatterlist.c:808:50: error: invalid use of undefined type 'struct sg_mapping_iter'
     808 |                 miter->piter.sg_pgoffset += miter->__offset >> PAGE_SHIFT;
         |                                                  ^~
   scatterlist.c:809:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     809 |                 miter->__offset &= PAGE_SIZE - 1;
         |                      ^~
   scatterlist.c:810:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     810 |                 miter->__remaining = sg->offset + sg->length -
         |                      ^~
   scatterlist.c:811:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     811 |                                      (miter->piter.sg_pgoffset << PAGE_SHIFT) -
         |                                            ^~
   scatterlist.c:812:43: error: invalid use of undefined type 'struct sg_mapping_iter'
     812 |                                      miter->__offset;
         |                                           ^~
   scatterlist.c:813:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                      ^~
   scatterlist.c:813:64: error: invalid use of undefined type 'struct sg_mapping_iter'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                                                ^~
   ./linux/mm.h:57:20: note: in definition of macro '__min'
      57 |         t1 min1 = (x);                                  \
         |                    ^
   scatterlist.c:813:38: note: in expansion of macro 'min_t'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                      ^~~~~
   scatterlist.c:814:61: error: invalid use of undefined type 'struct sg_mapping_iter'
     814 |                                            PAGE_SIZE - miter->__offset);
         |                                                             ^~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:813:38: note: in expansion of macro 'min_t'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                      ^~~~~
   scatterlist.c: At top level:
   scatterlist.c:837:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     837 | bool sg_miter_skip(struct sg_mapping_iter *miter, off_t offset)
         |                           ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_skip':
>> scatterlist.c:839:9: error: implicit declaration of function 'sg_miter_stop'; did you mean 'sg_miter_skip'? [-Wimplicit-function-declaration]
     839 |         sg_miter_stop(miter);
         |         ^~~~~~~~~~~~~
         |         sg_miter_skip
>> scatterlist.c:844:45: error: passing argument 1 of 'sg_miter_get_next_page' from incompatible pointer type [-Wincompatible-pointer-types]
     844 |                 if (!sg_miter_get_next_page(miter))
         |                                             ^~~~~
         |                                             |
         |                                             struct sg_mapping_iter *
   scatterlist.c:797:53: note: expected 'struct sg_mapping_iter *' but argument is of type 'struct sg_mapping_iter *'
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   scatterlist.c:847:54: error: invalid use of undefined type 'struct sg_mapping_iter'
     847 |                 consumed = min_t(off_t, offset, miter->__remaining);
         |                                                      ^~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:847:28: note: in expansion of macro 'min_t'
     847 |                 consumed = min_t(off_t, offset, miter->__remaining);
         |                            ^~~~~
   scatterlist.c:848:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     848 |                 miter->__offset += consumed;
         |                      ^~
   scatterlist.c:849:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     849 |                 miter->__remaining -= consumed;
         |                      ^~
   scatterlist.c: At top level:
   scatterlist.c:873:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     873 | bool sg_miter_next(struct sg_mapping_iter *miter)
         |                           ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_next':
   scatterlist.c:881:37: error: passing argument 1 of 'sg_miter_get_next_page' from incompatible pointer type [-Wincompatible-pointer-types]
     881 |         if (!sg_miter_get_next_page(miter))
         |                                     ^~~~~
         |                                     |
         |                                     struct sg_mapping_iter *
   scatterlist.c:797:53: note: expected 'struct sg_mapping_iter *' but argument is of type 'struct sg_mapping_iter *'
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   scatterlist.c:884:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |              ^~
>> scatterlist.c:884:23: error: implicit declaration of function 'sg_page_iter_page' [-Wimplicit-function-declaration]
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |                       ^~~~~~~~~~~~~~~~~
   scatterlist.c:884:47: error: invalid use of undefined type 'struct sg_mapping_iter'
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |                                               ^~
   scatterlist.c:885:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |              ^~
   scatterlist.c:885:32: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |                                ^~
   scatterlist.c:885:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |                                                ^~
   scatterlist.c:887:18: error: invalid use of undefined type 'struct sg_mapping_iter'
     887 |         if (miter->__flags & SG_MITER_ATOMIC)
         |                  ^~
>> scatterlist.c:887:30: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     887 |         if (miter->__flags & SG_MITER_ATOMIC)
         |                              ^~~~~~~~~~~~~~~
   scatterlist.c:888:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                      ^~
   scatterlist.c:888:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                                                ^~
   scatterlist.c:888:63: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                                                               ^~
   scatterlist.c:890:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                      ^~
   scatterlist.c:890:41: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                                         ^~
   scatterlist.c:890:56: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                                                        ^~
   scatterlist.c: At top level:
   scatterlist.c:909:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     909 | void sg_miter_stop(struct sg_mapping_iter *miter)
         |                           ^~~~~~~~~~~~~~~
>> scatterlist.c:909:6: warning: conflicting types for 'sg_miter_stop'; have 'void(struct sg_mapping_iter *)'
     909 | void sg_miter_stop(struct sg_mapping_iter *miter)
         |      ^~~~~~~~~~~~~
   scatterlist.c:839:9: note: previous implicit declaration of 'sg_miter_stop' with type 'void(struct sg_mapping_iter *)'
     839 |         sg_miter_stop(miter);
         |         ^~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_stop':
   scatterlist.c:911:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     911 |         WARN_ON(miter->consumed > miter->length);
         |                      ^~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:911:40: error: invalid use of undefined type 'struct sg_mapping_iter'
     911 |         WARN_ON(miter->consumed > miter->length);
         |                                        ^~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:914:18: error: invalid use of undefined type 'struct sg_mapping_iter'
     914 |         if (miter->addr) {
         |                  ^~
   scatterlist.c:915:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     915 |                 miter->__offset += miter->consumed;
         |                      ^~
   scatterlist.c:915:41: error: invalid use of undefined type 'struct sg_mapping_iter'
     915 |                 miter->__offset += miter->consumed;
         |                                         ^~
   scatterlist.c:916:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     916 |                 miter->__remaining -= miter->consumed;
         |                      ^~
   scatterlist.c:916:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     916 |                 miter->__remaining -= miter->consumed;
         |                                            ^~
   scatterlist.c:918:26: error: invalid use of undefined type 'struct sg_mapping_iter'
     918 |                 if (miter->__flags & SG_MITER_TO_SG)
         |                          ^~
   scatterlist.c:918:38: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     918 |                 if (miter->__flags & SG_MITER_TO_SG)
         |                                      ^~~~~~~~~~~~~~
   scatterlist.c:921:26: error: invalid use of undefined type 'struct sg_mapping_iter'
     921 |                 if (miter->__flags & SG_MITER_ATOMIC) {
         |                          ^~
   scatterlist.c:921:38: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     921 |                 if (miter->__flags & SG_MITER_ATOMIC) {
         |                                      ^~~~~~~~~~~~~~~
   scatterlist.c:923:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     923 |                         kunmap_atomic(miter->addr);
         |                                            ^~
   scatterlist.c:925:37: error: invalid use of undefined type 'struct sg_mapping_iter'
     925 |                         kunmap(miter->page);
         |                                     ^~
   scatterlist.c:927:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     927 |                 miter->page = NULL;
         |                      ^~
   scatterlist.c:928:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     928 |                 miter->addr = NULL;
         |                      ^~
   scatterlist.c:929:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     929 |                 miter->length = 0;
         |                      ^~
   scatterlist.c:930:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     930 |                 miter->consumed = 0;
         |                      ^~
   scatterlist.c: In function 'sg_copy_buffer':
   scatterlist.c:952:32: error: storage size of 'miter' isn't known
     952 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c:953:33: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     953 |         unsigned int sg_flags = SG_MITER_ATOMIC;
         |                                 ^~~~~~~~~~~~~~~
   scatterlist.c:956:29: error: 'SG_MITER_FROM_SG' undeclared (first use in this function)
     956 |                 sg_flags |= SG_MITER_FROM_SG;
         |                             ^~~~~~~~~~~~~~~~
   scatterlist.c:958:29: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     958 |                 sg_flags |= SG_MITER_TO_SG;
         |                             ^~~~~~~~~~~~~~
   ./linux/mm.h:59:23: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      59 |         (void) (&min1 == &min2);                        \
         |                       ^~
   ./linux/mm.h:68:9: note: in expansion of macro '__min'
      68 |         __min(typeof(x), typeof(y),                     \
         |         ^~~~~
   scatterlist.c:968:23: note: in expansion of macro 'min'
     968 |                 len = min(miter.length, buflen - offset);
         |                       ^~~
   scatterlist.c:952:32: warning: unused variable 'miter' [-Wunused-variable]
     952 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c: In function 'sg_zero_buffer':
   scatterlist.c:1067:32: error: storage size of 'miter' isn't known
    1067 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c:1068:33: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
    1068 |         unsigned int sg_flags = SG_MITER_ATOMIC | SG_MITER_TO_SG;
         |                                 ^~~~~~~~~~~~~~~
   scatterlist.c:1068:51: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
    1068 |         unsigned int sg_flags = SG_MITER_ATOMIC | SG_MITER_TO_SG;
         |                                                   ^~~~~~~~~~~~~~
   ./linux/mm.h:59:23: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      59 |         (void) (&min1 == &min2);                        \

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
