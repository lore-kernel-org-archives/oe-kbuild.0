Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232DD1CDFD5
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761434738; cv=none; b=uaiIgit7TUkm0gDU93mV2TRf0ztitjQLnjy7VxWS4mTbWY/UCtybdqOESYYSmieQvH5NIzdTs2hL9zrVFTdq2etlX6TSlHd5w+jZI46GKCMV3gEcDFTFSqajYw2SRvqpAkUdvhp90SeLYt6qbPf2wACZXZ6DaOM7kLAFGvoLMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761434738; c=relaxed/simple;
	bh=IbTUqPKtDn9zsfILYsmMECz1TUc928lSABz1Z8vl14U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e26pMQ+qQvmkPvXDwZx+8OmC0u7tj2FQE7Pgw2A6KAtUyPk1AhMUBIpX9mbZucig+/UpkAJ23PEY2p4ipouXFExHSW5pJ+RN1dHIL4YH4y0MDfQQmJCQnJtmIkUPETnGTozZiJ3eTdBohD5ApVEA2bVNI5KCA7tFYjj/dkrnT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1l0S2fr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1l0S2fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761434736; x=1792970736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbTUqPKtDn9zsfILYsmMECz1TUc928lSABz1Z8vl14U=;
  b=n1l0S2fr8b+qBV9u3vk2Pt9f1TuDRtl+qeteMxAwq+WUkRfHkqIMqz8K
   ykZEsAdNI69bHAQsG4gpFOp1EGlXUqkZkzW4kf49NqkjMUQ1YTr8VE4Bj
   lCi5VDMjJdx+KpPrZ+MNOIilnZACA+/clYIFKwdhnnURhZ5cimCpVAB4P
   QbDwbc9+5Vqd8WmM/2Ni7wTPL5gsC1yialbnq6SPjgps0QlJA3ix0flbo
   Wx7BpNYzSW+fPwYVU9l3qx/1gGYRGc+w/gPQgDFTD4+Kbs2MSO1yw7gT1
   +0i3n4fCgA/mPqrNJTvWWcycUK0Dy3g4SkTcD9JfXbGk7u8K3vYr/dTq6
   A==;
X-CSE-ConnectionGUID: J+9k9fvHT1SlN6FhUk6+5Q==
X-CSE-MsgGUID: jbHzLcqGTlqF/pcJ6V0nVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51142388"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="51142388"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 16:25:35 -0700
X-CSE-ConnectionGUID: pe8MV/RhSM6Sge/WHxc9pQ==
X-CSE-MsgGUID: UdShE6lPSI2hWN3LIbwyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184420887"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2025 16:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCndc-000Fgb-19;
	Sat, 25 Oct 2025 23:25:32 +0000
Date: Sun, 26 Oct 2025 07:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../rseq/rseq-riscv-bits.h:8:15: warning: duplicate 'inline'
 declaration specifier
Message-ID: <202510260727.DNCWXWNO-lkp@intel.com>
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
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: dbe3d1d1609e171bd26de077abba6ae142de86af KVM: riscv: selftests: Add common supported test cases
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510260727.DNCWXWNO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260727.DNCWXWNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260727.DNCWXWNO-lkp@intel.com/

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
