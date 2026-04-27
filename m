Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B393B27C9
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282191; cv=none; b=n1TXBJIOLV/bdfl5sKE7ygFbMmtSDpg5eePzd9Let8OHDhe+NHtDmYH6Ukz0d7pWTMKpoHxQDykK9VgSO1RELspQ/N/F6ueEhDRelOhfdEiFCyiQjJ7MeIqkwwWTA8axx3/H6uiQJVisxBazi/KTgFxOxJLB2cXWq40ecNYYGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282191; c=relaxed/simple;
	bh=GztZuDdrbe49/e0YCQ0orNKGnmHp8rC5bg4lccmFLNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pMHA7X5gUuiH30rXFwqh+RSWlGott4MM/CDfms1s1wuCzv9PEAO07JFEbNrH9cu/BRi2MM1pXZT4jmtltIGZell2jxbQ8I+Yl+QG1foSs7okociQdNH6sYi3WGvwnaVv0RLDoaM8ixEmoMQ9RI9kcm21vw04nayJnwTKVL2XRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ro07BCeb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro07BCeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777282189; x=1808818189;
  h=date:from:to:cc:subject:message-id;
  bh=GztZuDdrbe49/e0YCQ0orNKGnmHp8rC5bg4lccmFLNw=;
  b=Ro07BCebWAkmnFckuitXSTaX1lY2VrBP8rgzF0axlSPjnse+I5PRDXKU
   btcDmIDKFkJETBfYOkJx+xhf0DG9M4ZqxXKPtE5Vy+EOvdMGCCjQAguBt
   EB2IwLKw5wtTr7egTc7S+8SjX9eWzL4D1xEJssXHYRfNC2EndYaE783B6
   06hGjF75ktuaUgy6mNLib6RkyYaEpiODqWkjn75HFjYBRoyspAo98dY/D
   wu0OwqyI4bvyPg6ykX9UQWS83zFJeQH2vS0ABmdmRQF36srj/pv0beeRV
   mR7fC7C+C9+xQvdsDesE/I56CZGzD9QMjBCOPo8eTpz8wDit9c7EOa575
   A==;
X-CSE-ConnectionGUID: 1QRmo3wgRlKyUmvfDkXC2Q==
X-CSE-MsgGUID: f/IAeNjMSUWrKKS6n3Kt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88478930"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="88478930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:29:43 -0700
X-CSE-ConnectionGUID: CW3RgJYOSAWPDbBFIbZ2kw==
X-CSE-MsgGUID: gzEootSEQ4icv5Z/aK9buA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="232707643"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2026 02:29:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHIHc-0000000040R-1PRn;
	Mon, 27 Apr 2026 09:29:40 +0000
Date: Mon, 27 Apr 2026 11:28:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 117/130]
 ./include/asm-generic/fixmap.h:77:9: error: implicit declaration of function
 '__set_fixmap'; did you mean 'set_fixmap'?
Message-ID: <202604271114.ebmzs1LE-lkp@intel.com>
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
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260427/202604271114.ebmzs1LE-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604271114.ebmzs1LE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604271114.ebmzs1LE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/powerpc/include/asm/fixmap.h:91,
                    from mm/early_ioremap.c:18:
   ./include/asm-generic/fixmap.h: In function '__set_fixmap_offset':
>> ./include/asm-generic/fixmap.h:77:9: error: implicit declaration of function '__set_fixmap'; did you mean 'set_fixmap'? [-Wimplicit-function-declaration]
      77 |         __set_fixmap(idx, phys, flags);
         |         ^~~~~~~~~~~~
         |         set_fixmap
   ./arch/powerpc/include/asm/fixmap.h: At top level:
>> ./arch/powerpc/include/asm/fixmap.h:93:20: warning: conflicting types for '__set_fixmap'; have 'void(enum fixed_addresses,  phys_addr_t,  pgprot_t)' {aka 'void(enum fixed_addresses,  long long unsigned int,  pgprot_t)'}
      93 | static inline void __set_fixmap(enum fixed_addresses idx,
         |                    ^~~~~~~~~~~~
>> ./arch/powerpc/include/asm/fixmap.h:93:20: error: static declaration of '__set_fixmap' follows non-static declaration
   ./include/asm-generic/fixmap.h:77:9: note: previous implicit declaration of '__set_fixmap' with type 'void(enum fixed_addresses,  phys_addr_t,  pgprot_t)' {aka 'void(enum fixed_addresses,  long long unsigned int,  pgprot_t)'}
      77 |         __set_fixmap(idx, phys, flags);
         |         ^~~~~~~~~~~~


vim +77 ./include/asm-generic/fixmap.h

d57c33c5daa4ef Mark Salter   2014-01-23  72  
d57c33c5daa4ef Mark Salter   2014-01-23  73  /* Return a pointer with offset calculated */
93580c23bb3da5 Andrew Morton 2026-04-25  74  static inline unsigned long
93580c23bb3da5 Andrew Morton 2026-04-25  75  __set_fixmap_offset(enum fixed_addresses idx, phys_addr_t phys, pgprot_t flags)
93580c23bb3da5 Andrew Morton 2026-04-25  76  {
93580c23bb3da5 Andrew Morton 2026-04-25 @77  	__set_fixmap(idx, phys, flags);
93580c23bb3da5 Andrew Morton 2026-04-25  78  	return fix_to_virt(idx) + (phys & (PAGE_SIZE - 1));
93580c23bb3da5 Andrew Morton 2026-04-25  79  }
d57c33c5daa4ef Mark Salter   2014-01-23  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
