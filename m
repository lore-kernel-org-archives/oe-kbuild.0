Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE942571B8
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 01:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790299668; cv=none; b=Ght1yJ/IEVAi3Nm+6erm0VmeRwcQdFPHJLYPEl6VBQOYepGEIPPyUeD6c6ba7wTYUtMB7cxKmYfEANrq67EGcicFp4w/U77a/CqkT0/cHrRcGTbgVbmMiRCqe8WUOtF6m/jbEcjUvfnFsOg5YpRiKTN9m3zdWH2eDh1xaWETzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790299668; c=relaxed/simple;
	bh=QcB7KCJdFuo3C//ke7NxePL7i47+znI9pDVl2VINkRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mmNdgKy/RE+TE0nl2u70jNDsqy/uKTc9FSmo2MvvYWJI6bEy2Q69udzQhcb+OJxEiYtq3sOsvxR/ObpMn/f34ifDfJmcIbpwz4LluxYPfYe5dxfA2Ctud0oQxsvw//+how7vdqlqggVAtjejgei/vWhF7N2wyu8LTpxRTUmQ5pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXRElN8g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXRElN8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790299667; x=1821835667;
  h=date:from:to:cc:subject:message-id;
  bh=QcB7KCJdFuo3C//ke7NxePL7i47+znI9pDVl2VINkRU=;
  b=nXRElN8gyYszgbH3y6KUw24WHq5vwIMVotKTTBOnAIo0VAPbVDXt/dJS
   CaVleny8P8XKcFOQvMxrVLM2EBZrbJmOiRB6H+TWNvA5ojAc04ZHuS5Oh
   GwTj+RuIILP41RsZsjrk5ChGSmkSmcMGpp6r0laLoky/Y+oW7dm/hSSWU
   u0vJDE8NYmmh+u/iNRHDSq0u1aPGJvIxmuzj4uKSEKey6HcxInZ9GHO54
   LUkvY/Gc9f8NYQty3wSNNyylmx7/zXepGGRLRTv9v421BX/+8ZWNz39j3
   ieYRArA1pszDcx7n8YDMk6CMjjGLC9yHQgvY0nUAdzS6V1mp7TDEpfexs
   A==;
X-CSE-ConnectionGUID: 55ZUN3/IR16AozL/OFAt6w==
X-CSE-MsgGUID: 23EiEDH0QDyf7/zQw5cY7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="112872261"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="112872261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 18:27:46 -0700
X-CSE-ConnectionGUID: 2YG+mUnITfGhB5C5wd3OhA==
X-CSE-MsgGUID: MSvuHNQJQgqLs5BLmbdKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="303711446"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2026 18:27:45 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9uj0-000000000Yc-2Mqm;
	Fri, 25 Sep 2026 01:27:42 +0000
Date: Fri, 25 Sep 2026 03:27:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 63/112]
 ./linux/mm.h:112:21: error: conflicting types for 'kmalloc'; have 'void
 *(unsigned int,  unsigned int)'
Message-ID: <202609250359.tPKYrQbd-lkp@intel.com>
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
TO: Ian Rogers <irogers@google.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   fcf1fccdc9d5d7fe463c6c1869c9af6edbdd59eb
commit: 63394d06643ae1a094bc1af832d9710d7318f1b3 [63/112] perf test: Isolate test suite from user .perfconfig natively
:::::: branch date: 2 hours ago
:::::: commit date: 6 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260925/202609250359.tPKYrQbd-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250359.tPKYrQbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250359.tPKYrQbd-lkp@intel.com/

Note: the perf-tools-next/tmp.perf-tools-next HEAD fcf1fccdc9d5d7fe463c6c1869c9af6edbdd59eb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from ./linux/scatterlist.h:7,
                    from scatterlist.c:9:
   ../../include/linux/bug.h:9:9: warning: "BUILD_BUG_ON_ZERO" redefined
       9 | #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
         |         ^~~~~~~~~~~~~~~~~
   In file included from ../../include/linux/bits.h:30,
                    from ../../include/linux/gfp_types.h:5,
                    from ../../include/linux/gfp.h:6,
                    from ../../include/linux/slab.h:6,
                    from scatterlist.c:8:
   ../../include/linux/build_bug.h:16:9: note: this is the location of the previous definition
      16 | #define BUILD_BUG_ON_ZERO(e, ...) \
         |         ^~~~~~~~~~~~~~~~~
   In file included from ./linux/scatterlist.h:8:
   ./linux/mm.h:13:9: warning: "unlikely" redefined
      13 | #define unlikely
         |         ^~~~~~~~
   In file included from ../../include/linux/build_bug.h:5:
   ../../include/linux/compiler.h:154:10: note: this is the location of the previous definition
     154 | # define unlikely(x)            __builtin_expect(!!(x), 0)
         |          ^~~~~~~~
   ./linux/mm.h:33:9: warning: "__ALIGN_KERNEL" redefined
      33 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |         ^~~~~~~~~~~~~~
   In file included from ../../include/vdso/const.h:5,
                    from ../../include/vdso/bits.h:5,
                    from ../../include/linux/bits.h:5:
   ../../include/uapi/linux/const.h:48:9: note: this is the location of the previous definition
      48 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |         ^~~~~~~~~~~~~~
   ./linux/mm.h:62:9: warning: "__PASTE" redefined
      62 | #define __PASTE(a,b) ___PASTE(a,b)
         |         ^~~~~~~
   ../../include/linux/compiler.h:243:9: note: this is the location of the previous definition
     243 | #define __PASTE(a, b) ___PASTE(a, b)
         |         ^~~~~~~
>> ./linux/mm.h:112:21: error: conflicting types for 'kmalloc'; have 'void *(unsigned int,  unsigned int)'
     112 | static inline void *kmalloc(unsigned int size, unsigned int flags)
         |                     ^~~~~~~
   ../../include/linux/slab.h:33:7: note: previous declaration of 'kmalloc' with type 'void *(size_t,  gfp_t)' {aka 'void *(long unsigned int,  gfp_t)'}
      33 | void *kmalloc(size_t size, gfp_t gfp);
         |       ^~~~~~~
>> ./linux/mm.h:118:1: error: conflicting types for 'kmalloc_array'; have 'void *(unsigned int,  unsigned int,  unsigned int)'
     118 | kmalloc_array(unsigned int n, unsigned int size, unsigned int flags)
         | ^~~~~~~~~~~~~
   ../../include/linux/slab.h:35:7: note: previous declaration of 'kmalloc_array' with type 'void *(size_t,  size_t,  gfp_t)' {aka 'void *(long unsigned int,  long unsigned int,  gfp_t)'}
      35 | void *kmalloc_array(size_t n, size_t size, gfp_t gfp);
         |       ^~~~~~~~~~~~~
   ./linux/scatterlist.h: In function 'sg_set_page':
   ./linux/scatterlist.h:161:9: error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean 'WARN_ON_ONCE'? [-Wimplicit-function-declaration]
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
         |         ^~~~~~~~~~~~~~~
         |         WARN_ON_ONCE
   ./linux/scatterlist.h:161:26: error: implicit declaration of function 'page_range_contiguous' [-Wimplicit-function-declaration]
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
         |                          ^~~~~~~~~~~~~~~~~~~~~
   ./linux/scatterlist.h: At top level:
   ./linux/scatterlist.h:181:64: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
     181 | static inline void sg_set_folio(struct scatterlist *sg, struct folio *folio,
         |                                                                ^~~~~
   ./linux/scatterlist.h: In function 'sg_set_folio':
   ./linux/scatterlist.h:186:34: error: invalid use of undefined type 'struct folio'
     186 |         sg_assign_page(sg, &folio->page);
         |                                  ^~
   ./linux/scatterlist.h: In function 'sg_page_iter_page':
   ./linux/scatterlist.h:606:35: error: invalid use of undefined type 'struct page'
     606 |         return sg_page(piter->sg) + piter->sg_pgoffset;
         |                                   ^
   scatterlist.c: At top level:
   scatterlist.c:12:10: fatal error: linux/bvec.h: No such file or directory
      12 | #include <linux/bvec.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
