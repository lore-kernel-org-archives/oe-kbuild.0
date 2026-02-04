Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5036A13A3ED
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165057; cv=none; b=Nc1NvmG72DlPABmD1eAVzwt19wjP2JIM5dHhml1Y6v2YuDK8E/11cILx7uEsPoR6UyQfKsprXOlH8qWzVg9MGZfhgrLRwDTnOBvtf8g24VIDRO3CpjjcdUGInMXk9jlFCE0oDieCaP3PcPIbc6ODiibr9PUHPlNfbZAwvCJ/6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165057; c=relaxed/simple;
	bh=lXmtj9e2oXWdbeZXylatAlJebhvamCQD1lHmb51pTpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ttnyyDp43BAokRAVnULFBbi25tK76jCx58XX5nvM4tuHUe6nXNxK8ttt0pcrLLTtT8XLbWrU3IFrvg9HQLidBb335vW3kirOFcQZBL7KcbYr8hHYz2b4MTmA2rUecDNnGFhwUQYzExePvl5j94rA8RVAIN2pGctnVgbXM0VLjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwbTxD6L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwbTxD6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770165055; x=1801701055;
  h=date:from:to:cc:subject:message-id;
  bh=lXmtj9e2oXWdbeZXylatAlJebhvamCQD1lHmb51pTpg=;
  b=TwbTxD6LcFhxqQM8Hr379sH1K5jqjnOBAdo0pMJyPGwBHGogfNWchulP
   G02tUSUvq2pXPR+JkvGJB8rjeHaejmqSWG2Yne0uCDiLhqbbMYkmehmfE
   J75k87wJKHolRwzV55EVRHroKW4k9qfro5MECxUF9jng7wWEWX/t84Xp8
   k0j6B8qRFVW0lhR/DFSHWIhOs6atRmGgV6XLB1dv0CbFTl1wWgByF31ns
   uYgwxZ9GRdDgutyk8Ra/IQeSw0HGHlmJ6BvZbCdtLGcuKgbd7g7kaUZmA
   tH2yaJahI+VcT0hxq7EKyz2P9b2bfdGzptdFjw0pLye9VkW46tRCa3e9d
   g==;
X-CSE-ConnectionGUID: F6GISWhMQC+xA9Mfu6qACg==
X-CSE-MsgGUID: NLNHp8rHQumCYVLOCDehiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73948154"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="73948154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:30:55 -0800
X-CSE-ConnectionGUID: H7m+MKHJTk6ZhDY3jKCklw==
X-CSE-MsgGUID: m+805CjuQWy6QldFpufSog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214723864"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2026 16:30:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQnE-000000003VR-0O8D;
	Wed, 04 Feb 2026 00:30:52 +0000
Date: Wed, 04 Feb 2026 01:30:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../rseq/rseq-riscv-bits.h:8:15: warning: duplicate 'inline'
 declaration specifier
Message-ID: <202602040155.1F0LLxJ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Quan Zhou <zhouquan@iscas.ac.cn>
CC: Anup Patel <anup@brainfault.org>
CC: Dong Yang <dayss1224@gmail.com>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de0674d9bc69699c497477d45172493393ae9007
commit: dbe3d1d1609e171bd26de077abba6ae142de86af KVM: riscv: selftests: Add common supported test cases
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260204/202602040155.1F0LLxJ5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040155.1F0LLxJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602040155.1F0LLxJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
>> ../rseq/rseq-riscv-bits.h:8:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
       8 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:61:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
      61 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:118:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     118 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:162:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     162 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:231:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     231 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:280:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     280 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:171:
   ../rseq/rseq-riscv-bits.h:343:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     343 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:175:
   ../rseq/rseq-riscv-bits.h:280:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     280 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:175:
   ../rseq/rseq-riscv-bits.h:343:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     343 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
>> ../rseq/rseq-riscv-bits.h:8:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
       8 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:61:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
      61 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:118:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     118 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:162:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     162 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:231:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     231 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:280:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     280 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:183:
   ../rseq/rseq-riscv-bits.h:343:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     343 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:187:
   ../rseq/rseq-riscv-bits.h:280:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     280 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   In file included from rseq_test.c:8:
   In file included from ./../rseq/rseq.c:37:
   In file included from ./../rseq/rseq.h:131:
   In file included from ../rseq/rseq-riscv.h:187:
   ../rseq/rseq-riscv-bits.h:343:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     343 | static inline __always_inline
         |               ^
   /usr/include/riscv64-linux-gnu/sys/cdefs.h:595:26: note: expanded from macro '__always_inline'
     595 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
   18 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
