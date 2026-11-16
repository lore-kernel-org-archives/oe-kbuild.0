Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841751;
	b=lp1l2IZALxPKTRFVXBtnnR4/UJYSkUjAwfQ7YgJJw9FNb6yvppQvVB8TPFmT0qqfNZLK
	 hW+fS0zFOYQuQXUW1wJMc1dLp1PW7wulCmtILFdOoKaLrYU0dGPeZ5BqZeyZDoUKlJIHP
	 jSQkq4MnlzKmo6tlnKoKc0nDytH4MhPFJV6dlBOIGTzyxtVtBOoMM+L2YIBdNyVk4lr3u
	 Tp92Hh7jaWOAErithmgr9MAJmwbv7Hi5ST2GOHEokNocQzg13dlumlnM5ZXThqgqhU6zd
	 RBV7xKKU1r36tHyFaibHJT+mRuYxwQnR1KBmf+tEdwxQUtO5Zaz5PquyqxCS98BXD6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841751;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MHoArMvEli5rtJS7u3aQHjORpnMCeaaqvj0P8TZCSAs=;
	b=MoIJgvzpVFM1Lo2P9xhUFdBdn6N7r2SiDbYJ2wN+KK34tPjWEVnrYkiNipdCCnTDntyw
	 R0wLkycEah8bIlKBwOgJVyc3CPgaOO6gyAWrVZa/pGC0bODetZKq7mnd62y4wv6Cep8q0
	 ATnRKP8qIAWkZkC1NSdg47N3MMm1STqU95yfnvNL989ghZ4xWgeBjKOvEjy8gN22SDns7
	 GG0uJ97woWGeByELVOSfA+C4khvzN3/B1ExqlHevET23tc8siLeY5yga3u8IS1N6kXHi2
	 NYJCc3xmnBo41ho09A7kCWPEe7uWnKxoTwAVjMxKC/gQCgGSBUGF6Sc4nqH52II3AYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SvDQRdpD;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D18606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 15:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SvDQRdpD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794841750; x=1826377750;
  h=date:from:to:cc:subject:message-id;
  bh=g930/Y3gnq/5Vgvo6xs7Sn65P3oQJFuPBDRPZu8QYxE=;
  b=SvDQRdpD0jslHlGlPufhfRlav8yykGA7gV1ZR8X6C+/ZxDy2chHEi7F2
   MEK1tN8Q0o4C00jipfKbFXKGLyw2B9USwsdWfkemtjQYN7zUcCfYFpTsa
   xcr3IuYQwtIPpUUtrgn+ZBlbKslXSnQtGdQHNCrZVdINFwh1WecUaLM85
   qScCWFPsPeBVtE8IXeRpdnhSThPGyluBb4g2NYDUfrCsW816VFxzKybUo
   dcAaD7BKm4S1Xx1im2Yq6tjb12HBdXFL/LCBa8L770nnRnJP9t17du5B5
   /SkAO6BStmnJBJkLhPv+hH7B0aCex/8BL1jdjqBc/lv3koait/krw1ZCY
   w==;
X-CSE-ConnectionGUID: K05s97HkTDey5GkQT7c+2Q==
X-CSE-MsgGUID: dMPadvt5Q7ypGneNz6seYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3596790"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3596790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:09:10 -0800
X-CSE-ConnectionGUID: hmVRbG6IR9+XoL6TucsHvw==
X-CSE-MsgGUID: aYDChR9QSrmf+6qcCtsOMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9974707"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 07:09:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSyKQ-000000002jA-0xR5;
	Mon, 16 Nov 2026 15:09:06 +0000
Date: Mon, 16 Nov 2026 16:08:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_816' declared with attribute error: BUILD_BUG failed
Message-ID: <202611161556.839E897D-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Balbir Singh <balbirs@nvidia.com>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpages calculation for migrate_vma_setup
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-r2102-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161556.839E897D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161556.839E897D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611161556.839E897D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'drm_pagemap_cpages',
       inlined from 'drm_pagemap_migrate_to_devmem' at drivers/gpu/drm/drm_pagemap.c:593:6:
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_816' declared with attribute error: BUILD_BUG failed
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_pagemap.c:480:33: note: in expansion of macro 'HPAGE_PMD_ORDER'
     480 |                         order = HPAGE_PMD_ORDER;
         |                                 ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_816 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
