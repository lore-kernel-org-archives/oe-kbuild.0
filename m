Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63973CBE96
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540943; cv=none; b=fK77YmYGx/SN8eJ0d+DXoLQE4AMa/Tsdgb971KvQtRW8XcxgzlLPZgHZ1qe9+JRw0dyeoBIvOIw25bCAPIp4cnuPEjGBnSfV3kflno9TNOWLLm4jLqXzZ7u7PdciL7EpTy3admuaYxG3CdwpH88pGEs5OJmOSdlmgcICLY7ObiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540943; c=relaxed/simple;
	bh=MtTJNJvdGJlT3r+itqd55L5NfI5e52JusdTVA78REU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gf+sUIDlh89UX1imVCg7ZPMEgLGR0PXMKdNIlcuQrC3fVhN878Dz1gR9GmxllxVKPQBceFCHtN6/E4iYdrre+rb/aV/Xl1Xz1jbc8I+1r9wUYhH/0lrPoftYwvvFnSl1S6Qcl+iTvfkG22CNHpUKjzeS5NTR2t/cWSOwvCK+ycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJQW/My/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJQW/My/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783540942; x=1815076942;
  h=date:from:to:cc:subject:message-id;
  bh=MtTJNJvdGJlT3r+itqd55L5NfI5e52JusdTVA78REU8=;
  b=AJQW/My/jUU6QeOPtZaxAH2YMg0y5NJb97tM/pkNxwHNbTfmo4bv+OT2
   Nc6oV5KRye0MR3+++tmmxpYSNtVxCclp0puS5gJsVs2psAICMrDZl7+VH
   22oX4DhOu28/8htyRAhVWtcxPVdfMPuB23mRxazoCrdbOCntB503uoUwy
   0GKCwmBH41dviobj2hNhI3fBC3qA6q96UlAVYY9+3DEiQMQerzCIyYBAF
   SrjQusHhp5jGvhxCHixAq169pSbsggtXmLnqaZ7Cyaejvoq3QPQu1UFTE
   Es7bYCkXRvdNtVqon9AqTtilhCOYu5E6HHy8YaDbtL4OnPVmH2/Qd6ifF
   A==;
X-CSE-ConnectionGUID: KVlRyyGnTV6O91HHthNNuA==
X-CSE-MsgGUID: HR3rnJxBRSaJKskssmdx9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84188998"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84188998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 13:02:22 -0700
X-CSE-ConnectionGUID: jTctnOWASLe8LFcy7jfPow==
X-CSE-MsgGUID: ODodIoLUS6W6QqtLzS3z/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258253685"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2026 13:02:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whYTK-00000000GoL-0Vzb;
	Wed, 08 Jul 2026 20:02:18 +0000
Date: Thu, 09 Jul 2026 04:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to
 use reserved word 'return' as identifier
Message-ID: <202607090311.fsN30k2z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 061cef5fcee5a4bbaa8726f8c5fc1d5e2f89bff7 lib/crc: Turn NEON intrinsics crc64 implementation into common code
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r112-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090311.fsN30k2z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090311.fsN30k2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 061cef5fcee5 ("lib/crc: Turn NEON intrinsics crc64 implementation into common code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090311.fsN30k2z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-6009708b43/lib/clang/17/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm64/crc64-neon.h:3:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:3:26: sparse: sparse: got pmull64
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: got m
>> lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: got vreinterpretq_u64_p128
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:22:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:22:20: sparse: sparse: got fold_consts
   lib/crc/crc64-neon.c:23:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:23:20: sparse: sparse: got v0
   lib/crc/crc64-neon.c:24:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:24:20: sparse: sparse: got zero
   lib/crc/crc64-neon.c:41:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:41:20: sparse: sparse: got bconsts
   lib/crc/crc64-neon.c:42:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:42:20: sparse: sparse: got final
   lib/crc/crc64-neon.c:27:17: sparse: sparse: undefined identifier 'v0'
   lib/crc/crc64-neon.c:27:23: sparse: sparse: undefined identifier 'vreinterpretq_u64_u8'
   lib/crc/crc64-neon.c:34:17: sparse: sparse: undefined identifier 'v0'
   lib/crc/crc64-neon.c:34:22: sparse: sparse: undefined identifier 'pmull64'
   lib/crc/crc64-neon.c:34:49: sparse: sparse: undefined identifier 'pmull64_high'
   lib/crc/crc64-neon.c:38:9: sparse: sparse: undefined identifier 'v0'
   lib/crc/crc64-neon.c:38:14: sparse: sparse: undefined identifier 'vextq_u64'
   lib/crc/crc64-neon.c:38:39: sparse: sparse: undefined identifier 'pmull64_hi_lo'
   lib/crc/crc64-neon.c:44:9: sparse: sparse: undefined identifier 'v0'
   lib/crc/crc64-neon.c:44:15: sparse: sparse: undefined identifier 'vextq_u64'
   lib/crc/crc64-neon.c:44:43: sparse: sparse: undefined identifier 'pmull64_hi_lo'
   lib/crc/crc64-neon.c:46:16: sparse: sparse: undefined identifier 'vgetq_lane_u64'

vim +/return +14 lib/crc/arm64/crc64-neon.h

061cef5fcee5a4 Ard Biesheuvel 2026-04-22   8  
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   9  static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  10  {
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  11  	poly64x2_t l = vreinterpretq_p64_u64(a);
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  12  	poly64x2_t m = vreinterpretq_p64_u64(b);
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  13  
061cef5fcee5a4 Ard Biesheuvel 2026-04-22 @14  	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  15  }
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  16  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
