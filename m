Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76D26C3B0
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777255479; cv=none; b=VRdsnWzIKYw4azmT72yxuJeQ4uFDfE7Tmu+yhdcGL1Zp6iPStss8ud1J1D59x0Nt3CFKbxcHNJyLJtDuQAgjRDLOOCc1HsaGinVQW/t1GRJZlM/8FkRXwyM1bgpA0Oy9Ct000sowJsRALNtgYuec29H5MDS8lnaaxsWlEzihTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777255479; c=relaxed/simple;
	bh=JWCJZ8lrs7ejX5Y3W1d84tKr5hFqbw47d+IZ3oaBE5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJJSwWrj/B1JaVwjmLimI///Kw3W7HWiBsJZKoLbqEuEeURG6m9s49wgnxYnQga7/977+AVyuDFr2ub3EgmLh72J34kG/xd/tsMBY/JtL2rAH+4lnL/krzQqFQjgfP+9oVH5WZey7TXMK6nRqyVOZFQ7n39dmQXX9bnEoxWUAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKry07ks; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKry07ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777255477; x=1808791477;
  h=date:from:to:cc:subject:message-id;
  bh=JWCJZ8lrs7ejX5Y3W1d84tKr5hFqbw47d+IZ3oaBE5A=;
  b=LKry07ks0MiPmA0wRiI/aLmHipsRxK/qwZMd1aiUPWSEWmULOJKBG3Nu
   pxZUAkMlyvjK0uHsvLjqqs/xF1F/MkBJHTY5CHybYlacVLbpTPtxgqArm
   o6+8Pm/pniW26ncQiKKorMU8IrkW2C6i9MbC7Wo2XWQCa5Tae+DZ8lVP6
   qUe6oLoRf+SmuIg4DLyW2RO7qUPmjQPWFdV96v6wmoZX+z1P3m+P0+A+u
   hJw0kuUpCOQG7o2jrtN3uSbUuz2fkG85xgNZUf2kzAGi04uoI9xZNkkS7
   swzOKNw+Dy6msxcVTq0uX1dTA+AeJNYVRQ0E1WgWloTXw3VuqTxdk3046
   A==;
X-CSE-ConnectionGUID: QP2G3yO2QHipHXcEGtyRUg==
X-CSE-MsgGUID: hG+ZJLx9SFC5LuYfau97gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89222805"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89222805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 19:04:36 -0700
X-CSE-ConnectionGUID: 3aN0tCFYQh6UpNkYrq6+bA==
X-CSE-MsgGUID: 1p+jESzJSjymNQJcdoITFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="233776140"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Apr 2026 19:04:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHBKq-000000003qL-1jkh;
	Mon, 27 Apr 2026 02:04:32 +0000
Date: Mon, 27 Apr 2026 04:04:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 117/130]
 ./include/asm-generic/fixmap.h:54:29: error: 'PAGE_KERNEL_NOCACHE'
 undeclared; did you mean 'PAGE_KERNEL_ROX'?
Message-ID: <202604270418.cI9ojRxN-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Davidlohr Bueso <dave@stgolabs.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   4f7b2cc1ad8719d55a8de9675a0aca65cb17c364
commit: 93580c23bb3da5dd2926d6ae991ef04c2cdacaf2 [117/130] include/asm-generic/fixmap.h: reimplement nasty macros in C
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260427/202604270418.cI9ojRxN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604270418.cI9ojRxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604270418.cI9ojRxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/fixmap.h:118,
                    from ./arch/arm64/include/asm/pgtable.h:36,
                    from ./include/linux/pgtable.h:6,
                    from ./include/linux/kasan.h:38,
                    from ./include/linux/slab.h:264,
                    from ./include/linux/resource_ext.h:11,
                    from ./include/linux/acpi.h:14,
                    from ./include/acpi/apei.h:9,
                    from ./include/acpi/ghes.h:5,
                    from ./include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   ./include/asm-generic/fixmap.h: In function 'set_fixmap_nocache':
>> ./include/asm-generic/fixmap.h:54:29: error: 'PAGE_KERNEL_NOCACHE' undeclared (first use in this function); did you mean 'PAGE_KERNEL_ROX'?
      54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
         |                             ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/fixmap.h:93:33: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
      93 |         __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE);
         |                                 ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/fixmap.h:54:29: note: each undeclared identifier is reported only once for each function it appears in
      54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
         |                             ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/fixmap.h:93:33: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
      93 |         __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE);
         |                                 ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/fixmap.h: In function 'set_fixmap_offset_nocache':
>> ./include/asm-generic/fixmap.h:54:29: error: 'PAGE_KERNEL_NOCACHE' undeclared (first use in this function); did you mean 'PAGE_KERNEL_ROX'?
      54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
         |                             ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/fixmap.h:99:40: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
      99 |         __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NOCACHE);
         |                                        ^~~~~~~~~~~~~~~~~~~


vim +54 ./include/asm-generic/fixmap.h

d57c33c5daa4ef Mark Salter   2014-01-23  41  
d57c33c5daa4ef Mark Salter   2014-01-23  42  /*
d57c33c5daa4ef Mark Salter   2014-01-23  43   * Provide some reasonable defaults for page flags.
d57c33c5daa4ef Mark Salter   2014-01-23  44   * Not all architectures use all of these different types and some
d57c33c5daa4ef Mark Salter   2014-01-23  45   * architectures use different names.
d57c33c5daa4ef Mark Salter   2014-01-23  46   */
d57c33c5daa4ef Mark Salter   2014-01-23  47  #ifndef FIXMAP_PAGE_NORMAL
d57c33c5daa4ef Mark Salter   2014-01-23  48  #define FIXMAP_PAGE_NORMAL PAGE_KERNEL
d57c33c5daa4ef Mark Salter   2014-01-23  49  #endif
2592dbbbf4c675 Juergen Gross 2015-07-17  50  #if !defined(FIXMAP_PAGE_RO) && defined(PAGE_KERNEL_RO)
2592dbbbf4c675 Juergen Gross 2015-07-17  51  #define FIXMAP_PAGE_RO PAGE_KERNEL_RO
2592dbbbf4c675 Juergen Gross 2015-07-17  52  #endif
d57c33c5daa4ef Mark Salter   2014-01-23  53  #ifndef FIXMAP_PAGE_NOCACHE
d57c33c5daa4ef Mark Salter   2014-01-23 @54  #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
d57c33c5daa4ef Mark Salter   2014-01-23  55  #endif
d57c33c5daa4ef Mark Salter   2014-01-23  56  #ifndef FIXMAP_PAGE_IO
d57c33c5daa4ef Mark Salter   2014-01-23  57  #define FIXMAP_PAGE_IO PAGE_KERNEL_IO
d57c33c5daa4ef Mark Salter   2014-01-23  58  #endif
d57c33c5daa4ef Mark Salter   2014-01-23  59  #ifndef FIXMAP_PAGE_CLEAR
d57c33c5daa4ef Mark Salter   2014-01-23  60  #define FIXMAP_PAGE_CLEAR __pgprot(0)
d57c33c5daa4ef Mark Salter   2014-01-23  61  #endif
d57c33c5daa4ef Mark Salter   2014-01-23  62  

:::::: The code at line 54 was first introduced by commit
:::::: d57c33c5daa4efa9e4d303bd0faf868080b532be add generic fixmap.h

:::::: TO: Mark Salter <msalter@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
