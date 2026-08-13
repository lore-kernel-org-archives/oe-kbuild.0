Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571E438029
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655129; cv=none; b=SBZlG0+G/Bn31RbY4DZEnF/bK+O2lLtbyzFmi3NL3QeUzeO9ZvycJ56Ot1/udnoIWqg7w2bUd32eItCI6qSBAjWg6tU/IOoNhcVXgbSAE70u4WK3xgmmmNgCGxCBnFxPF42uF1qhrtMonqQYGdUHJWxP7AAxFxyQRu+SdbS0af4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655129; c=relaxed/simple;
	bh=+m1CREjT6kYIneZR02D1JaU3PuQ68yCVVy05PwGhKGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dwv9eGGaHVh/Na7+gcyGbaigtO/T7oq3yJYbKf5EWK8axNeOS29joB1wVUVuYB6pmNUKZ7H28hut0VOQHLMfJ9EFDxLUGPgDk04Buo+pc9tNzAg/sZBKSuNeH+BuahUzN/dWMf0IAnblkGMWBvxnxRA13nRQj/9T2axrfpDeEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOVwnLS4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOVwnLS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786655127; x=1818191127;
  h=date:from:to:cc:subject:message-id;
  bh=+m1CREjT6kYIneZR02D1JaU3PuQ68yCVVy05PwGhKGQ=;
  b=NOVwnLS4S1MPeGfksCgrk/qNxqr7P/JotKAeT94dzYave+ec8eOODsrm
   bVa/oN1ReCzWX3w00FPHcTLFwHDvuyBbkMK0wdddhZOJkxna2tYyisfah
   TKtsWHk0Z3X5v8nBnhcZcNk090romxni9IW/VBfafEpK9Dc/8xRV87wTB
   HMogyfEAYezDNfqkhc9xtWH6TQNAWUtQFlXwF7V3dY1epJlqUVMH78SpX
   7wMUm1QRDrocfxQEknupwSCwkssFQIJUqTNCK7QLD7CZGoejvjHXRcUh9
   AViouaoi4I6gV6WFH4+dWVEHTrmJDGXVHP9qoOV1tNLMezbBnd6b10m5H
   A==;
X-CSE-ConnectionGUID: lAmPLSMbTEOEru/AodUVnQ==
X-CSE-MsgGUID: //swXMM/T8WrzL0xXAeAcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87456781"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87456781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:05:25 -0700
X-CSE-ConnectionGUID: 7Po6mHvhR26KvT/XCs1KzA==
X-CSE-MsgGUID: WaSqLMCzSJ2N4brWmCALCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268316818"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 14:05:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wucc5-00000000Wee-47M2;
	Thu, 13 Aug 2026 21:05:21 +0000
Date: Fri, 14 Aug 2026 05:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to
 use reserved word 'return' as identifier
Message-ID: <202608140503.1aVGKxXk-lkp@intel.com>
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
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 061cef5fcee5a4bbaa8726f8c5fc1d5e2f89bff7 lib/crc: Turn NEON intrinsics crc64 implementation into common code
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r112-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140503.1aVGKxXk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140503.1aVGKxXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 061cef5fcee5 ("lib/crc: Turn NEON intrinsics crc64 implementation into common code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608140503.1aVGKxXk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-844a18e753/lib/clang/24/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
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
