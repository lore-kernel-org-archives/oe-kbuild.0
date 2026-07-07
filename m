Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A57719ADA4
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783403373; cv=none; b=IyyoybTHBdXls23u8of+XHdEVET4vF/8v8wstSlxEwC6TpjuYOa0dayehiUsciVF7KXrzNc9oRPVZisffqtX7Dm0Jiqt7FZJJwrJLf9pG1k/O5Zkxf6bFFBGjt/VuPqP4UCiTdPLJGkdzrFltB2loN7pID1uS5965Go3mTifcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783403373; c=relaxed/simple;
	bh=owNsynGHVGt0ic8VEh9r+uDdUQD+isBpXhlDPNojYM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KoNnbk3wmnBxvaoyUUPdLE71kWAES4vkMCokIYxL7PqvaBKjMGsCV1oiePLgqoQuryoZPXW+CK8jvsxYDC9KlWTvzSgG6mEEfqW+x6ZJoBtu7I3fmLvPacw3LeWgJlYbs7ny/c3Ddwd697DrQnIYo6rL+jLwNgLdRY8vnqS7K2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO8o6OiM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO8o6OiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783403370; x=1814939370;
  h=date:from:to:cc:subject:message-id;
  bh=owNsynGHVGt0ic8VEh9r+uDdUQD+isBpXhlDPNojYM4=;
  b=OO8o6OiMibthY1keUa5C0+oNzd+Uuq3D3xctMfQ3j0FuM+PXrJvuEDgx
   nP8QzYPc98zGAZXSahRdlKN+CL0BPxo6yy47p/C7Rp1eEtAUihn0AjQ1V
   gcALL5KG5aYBv2WTuonBco/lJWFsEXIhI64jexcWaGb29DUApMlhVPXwD
   Xko4vpVbfrr1QTajJtRSsuMmIhAmolyZPN0CSHL8blhRENbygdJfLGIH/
   6yJ+5/+DZmUgQI88QgGh7my6qMZOD05VM7miIKi0FnAb7CWU+7aqcks6l
   o1k6DMvmy6Ap0oSnVR3ek7edMF5CkLHjKMTTqP7WxNv4GsRoMj3xdohok
   g==;
X-CSE-ConnectionGUID: joFR95PXTJKEV32HWHrArQ==
X-CSE-MsgGUID: +tIhTHg8RxqiVP4LIY0X5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71564420"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71564420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 22:49:30 -0700
X-CSE-ConnectionGUID: WmYYRl0sQlepjYeUxIZPUA==
X-CSE-MsgGUID: rvSPmHtBTmSSxdIaDJuoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254552987"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2026 22:49:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgygQ-000000002UL-1VuA;
	Tue, 07 Jul 2026 05:49:26 +0000
Date: Tue, 07 Jul 2026 07:49:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./linux/mm.h:113:21: error: conflicting types for 'kmalloc';
 have 'void *(unsigned int,  unsigned int)'
Message-ID: <202607070734.M7fpSgzB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: a001cd248ab244633c5fabe4f7c707e13fc1d1cc rseq/selftests: Use weak symbol reference, not definition, to link with glibc
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607070734.M7fpSgzB-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070734.M7fpSgzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a001cd248ab2 ("rseq/selftests: Use weak symbol reference, not definition, to link with glibc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607070734.M7fpSgzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./linux/scatterlist.h:7,
                    from scatterlist.c:9:
   ../../include/linux/bug.h:9:9: warning: "BUILD_BUG_ON_ZERO" redefined
       9 | #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
         |         ^~~~~~~~~~~~~~~~~
   In file included from ../../include/linux/bits.h:30,
                    from ../../include/linux/../../../include/linux/gfp_types.h:5,
                    from ../../include/linux/gfp_types.h:1,
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
   ../../include/linux/compiler.h:150:10: note: this is the location of the previous definition
     150 | # define unlikely(x)            __builtin_expect(!!(x), 0)
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
   ./linux/mm.h:63:9: warning: "__PASTE" redefined
      63 | #define __PASTE(a,b) ___PASTE(a,b)
         |         ^~~~~~~
   ../../include/linux/compiler.h:239:9: note: this is the location of the previous definition
     239 | #define __PASTE(a, b) ___PASTE(a, b)
         |         ^~~~~~~
>> ./linux/mm.h:113:21: error: conflicting types for 'kmalloc'; have 'void *(unsigned int,  unsigned int)'
     113 | static inline void *kmalloc(unsigned int size, unsigned int flags)
         |                     ^~~~~~~
   ../../include/linux/slab.h:13:7: note: previous declaration of 'kmalloc' with type 'void *(size_t,  gfp_t)' {aka 'void *(long unsigned int,  gfp_t)'}
      13 | void *kmalloc(size_t size, gfp_t gfp);
         |       ^~~~~~~
>> ./linux/mm.h:119:1: error: conflicting types for 'kmalloc_array'; have 'void *(unsigned int,  unsigned int,  unsigned int)'
     119 | kmalloc_array(unsigned int n, unsigned int size, unsigned int flags)
         | ^~~~~~~~~~~~~
   ../../include/linux/slab.h:15:7: note: previous declaration of 'kmalloc_array' with type 'void *(size_t,  size_t,  gfp_t)' {aka 'void *(long unsigned int,  long unsigned int,  gfp_t)'}
      15 | void *kmalloc_array(size_t n, size_t size, gfp_t gfp);
         |       ^~~~~~~~~~~~~
   ./linux/scatterlist.h:180:64: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
     180 | static inline void sg_set_folio(struct scatterlist *sg, struct folio *folio,
         |                                                                ^~~~~
   ./linux/scatterlist.h: In function 'sg_set_folio':
>> ./linux/scatterlist.h:185:34: error: invalid use of undefined type 'struct folio'
     185 |         sg_assign_page(sg, &folio->page);
         |                                  ^~
   scatterlist.c: At top level:
   scatterlist.c:12:10: fatal error: linux/bvec.h: No such file or directory
      12 | #include <linux/bvec.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
