Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8219EED3
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778459038; cv=none; b=VZaKBFEPHltGsXJsm65kXDfWZxrVwqi3Auzz6hmQnZCXsj1G0mAj5pG3jNMFtZzbst4lb2xdtuBjssHmzreovyc17BOjwVweECepp6OknJmm+E1xM6tLPleh41seeUvGXpwbTtrkltZgIQFall9O7b7Vx/xPuJgT3D3fcYB7A2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778459038; c=relaxed/simple;
	bh=KDl0Sk+AiKXoOiv26XzSFRn7g7By2xTcSiAuT9JOAmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdL7xgp44y6o5TeSiEp8vyJX83TMaDScENgEO0tYQSPut8fLIvH9HGPMzwZkSW+wxtSF7nv1WzaEdwIYWxmfg+P1IcNgza09TNb5aft2dRaxupdo6u0EUZMliWM+efDR9mY3ZNYD/giEGbpdlGZVLH30Zk3WiEbKkQ5mLOcLPs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gqkkn1mY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gqkkn1mY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778459037; x=1809995037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDl0Sk+AiKXoOiv26XzSFRn7g7By2xTcSiAuT9JOAmc=;
  b=Gqkkn1mYecPgvktqZNjfeOrgcZV7bCwDEGFfj1VLHtXOyOfocq0i5aNS
   O3b2NDLUGZkm2g8QEK1JJR/IY62TeS2aPBnS5E9Vv/7Lxt+L89prNt2lf
   HEfZgIwsDYMlm4XmuCKlwNqPo8HdSYnMLcItD2jYnwmhmHeSHO/xGqCSm
   6VcP2OlRo11f+YdF8BYjOeGdEeTQHiS1lDM8RXM8WWr7AxXq2vubPTE7T
   INpNWOtd8hv9eDC+DCcGbnfWc0HVPQNnjeO0pQ4iR9fqlejhNrvs37hpK
   y6N8nSzWwlOWPQTHpMVFtfW9OCXrH94tVNRdn5T2ndg6Cn2VfvRyx10SX
   g==;
X-CSE-ConnectionGUID: ueFLvsCtQ7GIFZ2WLY410g==
X-CSE-MsgGUID: pXIxEHPrQiqMfDS1I+rJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79367338"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79367338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 17:23:53 -0700
X-CSE-ConnectionGUID: U131tT37QqmYFxypzJpVFg==
X-CSE-MsgGUID: Q5Aiun97TCWdT6A3Lif6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237399411"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2026 17:23:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMER3-000000007qz-3tdi;
	Mon, 11 May 2026 00:23:49 +0000
Date: Mon, 11 May 2026 02:23:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] tools: include: add proper strscpy() declaration
Message-ID: <202605110223.Yionans2-lkp@intel.com>
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
In-Reply-To: <20260504212301.63750-1-lucasp.linux@gmail.com>
References: <20260504212301.63750-1-lucasp.linux@gmail.com>
TO: Lucas Poupeau <lucasp.linux@gmail.com>
TO: jpoimboe@kernel.org
TO: pmladek@suse.com
CC: m32285159@gmail.com
CC: linux-kernel@vger.kernel.org
CC: Lucas Poupeau <lucasp.linux@gmail.com>

Hi Lucas,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/tools-include-add-proper-strscpy-declaration/20260511-022707
base:   linus/master
patch link:    https://lore.kernel.org/r/20260504212301.63750-1-lucasp.linux%40gmail.com
patch subject: [PATCH] tools: include: add proper strscpy() declaration
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605110223.Yionans2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110223.Yionans2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110223.Yionans2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./linux/scatterlist.h:5,
                    from scatterlist.c:9:
>> ../../include/linux/string.h:32:8: error: unknown type name 'ssize_t'; did you mean 'size_t'?
      32 | extern ssize_t strscpy(char *dest, const char *src, size_t count);
         |        ^~~~~~~
         |        size_t
   In file included from ./linux/scatterlist.h:7:
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
   ./linux/mm.h:112:21: error: conflicting types for 'kmalloc'; have 'void *(unsigned int,  unsigned int)'
     112 | static inline void *kmalloc(unsigned int size, unsigned int flags)
         |                     ^~~~~~~
   ../../include/linux/slab.h:33:7: note: previous declaration of 'kmalloc' with type 'void *(size_t,  gfp_t)' {aka 'void *(long unsigned int,  gfp_t)'}
      33 | void *kmalloc(size_t size, gfp_t gfp);
         |       ^~~~~~~
   ./linux/mm.h:118:1: error: conflicting types for 'kmalloc_array'; have 'void *(unsigned int,  unsigned int,  unsigned int)'
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
