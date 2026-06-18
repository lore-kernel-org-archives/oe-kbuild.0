Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98121ABC9
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jun 2026 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762475; cv=none; b=P2jF0wVPH8ClclWcbKW9fW/v5FJve3gFY1AtZNBT9cEFONRpnmZ6sPpSoctnZAV+K2fIHgFIQsb8Gz3VZikePnOf/SH3nbZ43r2gMd1X84ZKFeAfnJMpKRxgOPE7x6tBxI1na4eWUZw+FLqFecTzJksIN9WyIREXqnW0IGX9jfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762475; c=relaxed/simple;
	bh=n+aV8ZHRg+rA1yfLd7ZjKXgKKxHvISBpv0V+2o1JsbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IlPMhkGoHLh+6ZsWCQViworfPEfxrhHrW/+k1EvZHWeITGxwb3ePfMuGft+PEnsTnE5kvZcz+RMUd1zK5iqOz5AQ3/70N521VxTpjLhjuaaYboDuqzxbfaXszNxxB8AiriO8fZLIcUm1ymkL8/bM4l5V+6pUh+ng8qxj5FFuanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RP86j92w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RP86j92w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762473; x=1813298473;
  h=date:from:to:cc:subject:message-id;
  bh=n+aV8ZHRg+rA1yfLd7ZjKXgKKxHvISBpv0V+2o1JsbQ=;
  b=RP86j92wtxkExsJ15Qu43c9dnRK+etC8xT6Qdzp3TTSpfjS8iFaYACAP
   cT6q5gIcc4yJaiyBD+ysJymnzx7f8E8MrO+9Y5w3ckg5Lmjb6D2AzBmMS
   aMZGCwtbtAL75XT5vO+JAmSH0MBDVBnyjspdX8S9qGP3yQdEPHPtGwpfQ
   /Y/P8xP1TdjoCOE3IPqCEpexiaJuL9wy3eAxVSaxugyu3BBNJujC0G4Yi
   B/LVd2shOodixRPortfhS5GbopiznKmYTbAYY1Yu9gViofPMVndxbEqT0
   pDsRaWTiN8CX69ype5lrWobNuQSbBEaAotKqSF1eW+R6rNIEcZntwc3EH
   g==;
X-CSE-ConnectionGUID: PNsaDeL2TZmojk/YsMsOYg==
X-CSE-MsgGUID: 1+/E/7peRYiWhnxUn3SthA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81572381"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81572381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:01:12 -0700
X-CSE-ConnectionGUID: mvxgZD5kT4meI4n5Cn792w==
X-CSE-MsgGUID: sCgmW/gOTF2HPwFQWowVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="286389934"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 23:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5oK-00000000VHe-3uNO;
	Thu, 18 Jun 2026 06:01:08 +0000
Date: Thu, 18 Jun 2026 14:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202606181200.hWkw6EH4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: e3babebfb83865ec2be90e64d3f73f9aca140b3a lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-r112-20260618 (https://download.01.org/0day-ci/archive/20260618/202606181200.hWkw6EH4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181200.hWkw6EH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3babebfb838 ("lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606181200.hWkw6EH4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file:
   arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
   lib/crc/crc64-neon.c: note: in included file (through arch/arm/include/asm/neon-intrinsics.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm/crc64-neon.h:3:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:3:26: sparse: sparse: got pmull64
   lib/crc/arm/crc64-neon.h:7:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:7:20: sparse: sparse: got result
>> lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm/crc64-neon.h:11:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:11:16: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:12:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm/crc64-neon.h:12:1: sparse: sparse: got }
   lib/crc/arm/crc64-neon.h:18:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:18:20: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:22:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm/crc64-neon.h:22:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:22:16: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm/crc64-neon.h:23:1: sparse: sparse: got }
   lib/crc/arm/crc64-neon.h:29:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:29:20: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:33:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm/crc64-neon.h:33:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:33:16: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm/crc64-neon.h:34:1: sparse: sparse: got }
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
   lib/crc/arm/crc64-neon.h:6:22: sparse: sparse: undefined identifier 'vgetq_lane_u64'
   lib/crc/arm/crc64-neon.h:17:22: sparse: sparse: undefined identifier 'vgetq_lane_u64'
   lib/crc/arm/crc64-neon.h:17:18: sparse: sparse: symbol 'm' has multiple initializers (originally initialized at lib/crc/arm/crc64-neon.h:6)
   lib/crc/arm/crc64-neon.h:28:22: sparse: sparse: undefined identifier 'vgetq_lane_u64'
   lib/crc/arm/crc64-neon.h:28:18: sparse: sparse: symbol 'm' has multiple initializers (originally initialized at lib/crc/arm/crc64-neon.h:17)
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

vim +/return +11 lib/crc/arm/crc64-neon.h

e3babebfb83865 Ard Biesheuvel 2026-04-22   2  
e3babebfb83865 Ard Biesheuvel 2026-04-22   3  static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
e3babebfb83865 Ard Biesheuvel 2026-04-22   4  {
e3babebfb83865 Ard Biesheuvel 2026-04-22   5  	uint64_t l = vgetq_lane_u64(a, 0);
e3babebfb83865 Ard Biesheuvel 2026-04-22   6  	uint64_t m = vgetq_lane_u64(b, 0);
e3babebfb83865 Ard Biesheuvel 2026-04-22   7  	uint64x2_t result;
e3babebfb83865 Ard Biesheuvel 2026-04-22   8  
e3babebfb83865 Ard Biesheuvel 2026-04-22   9  	asm("vmull.p64	%q0, %P1, %P2" : "=w"(result) : "w"(l), "w"(m));
e3babebfb83865 Ard Biesheuvel 2026-04-22  10  
e3babebfb83865 Ard Biesheuvel 2026-04-22 @11  	return result;
e3babebfb83865 Ard Biesheuvel 2026-04-22  12  }
e3babebfb83865 Ard Biesheuvel 2026-04-22  13  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
