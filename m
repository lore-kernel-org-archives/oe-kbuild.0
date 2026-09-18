Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E1432E65
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765059; cv=none; b=vFE2+kO4GgjCzPtLHQ1fDkcRUfg72oQEX68Xzu+2sVkhg1ZfvTq8YUQ6SKYQ4+cfPe/Fl6jRrLuZhhVH9iC4RjiwRA+drW7Bu4Z0LG332jzMNXIEcK4J2pLEm4q8+8Xo5w4loRXhxPDvp48Gc3qcPvnZC2AH5EZqeLqnaGr/A70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765059; c=relaxed/simple;
	bh=kGTnMnTznahggiV5NnZk9zxzYt27CZcjCH/Nkxlaebo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n+CxTcqNTq68HzijlNq0sJgpYRTwqoPNeGModPJyDYIGFbU2UrLlKTfFigEjC5V0s0u2dD67FkK76AO+3BsY/V1Oza25uSVFQe25lvfYz/L+ZENwtYPMLEwdgqBg6HYjuNjW/0mhQA0Eu8z3KtYJYcACuF/ZEeveJbaV2LTOkPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9Ms3F0P; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9Ms3F0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789765058; x=1821301058;
  h=date:from:to:cc:subject:message-id;
  bh=kGTnMnTznahggiV5NnZk9zxzYt27CZcjCH/Nkxlaebo=;
  b=R9Ms3F0POwP1/6w0QINVs3NuaS1WWLr4bVNsfZq+CRZJddFKPFfaMpKD
   2vpThCLTHwbcg29jazR08EEXml2b89MXfXs79rai1uYd3T+do+w2vACy6
   IL6FI1ks1Fo6i8DjnXgHVMDroSVvOzraVzlS6UdmSknHYQmMTNlLMdNCE
   Ay2zSvXROkB9YAAjrE1WAAEiWDO9zamSy7QqCZiDMipx2SXg0GvTG6T4L
   aIcz3RuxQtwW3/octpTRL017xWIlhzjLVk6W6V8I9//bZE6xJCh/Io5/u
   afI+VepsQ+oR7Nj13yfE0vkJ1CymF0oLIQ/85k45IgTYbLSAG9AGKNYbq
   w==;
X-CSE-ConnectionGUID: SPtDDOYjSnSBnhYdDExc1A==
X-CSE-MsgGUID: DffPa2aTSRKVg0klwW5xlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="797788"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="797788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 13:57:38 -0700
X-CSE-ConnectionGUID: E3lVhcybQcu6G71hvaueqA==
X-CSE-MsgGUID: 1x9GlONoSUqi860SmGK6SQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Sep 2026 13:57:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7feI-00000000AKj-0M4L;
	Fri, 18 Sep 2026 20:57:34 +0000
Date: Sat, 19 Sep 2026 04:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse:
 You should compile this file with '-march=armv7-a -mfloat-abi=softfp
 -mfpu=neon'
Message-ID: <202609190441.srqJZVds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: e3babebfb83865ec2be90e64d3f73f9aca140b3a lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r1300-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190441.srqJZVds-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190441.srqJZVds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3babebfb838 ("lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609190441.srqJZVds-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file:
>> arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
   lib/crc/crc64-neon.c: note: in included file (through arch/arm/include/asm/neon-intrinsics.h):
   ../lib/gcc/arm-linux-gnueabi/15.2.0/include/arm_neon.h:45:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm/crc64-neon.h:3:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:3:26: sparse: sparse: got pmull64
   lib/crc/arm/crc64-neon.h:7:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm/crc64-neon.h:7:20: sparse: sparse: got result
   lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use reserved word 'return' as identifier
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

vim +7 arch/arm/include/asm/neon-intrinsics.h

4156e65624f8a1 Ard Biesheuvel 2026-04-22  5  
4156e65624f8a1 Ard Biesheuvel 2026-04-22  6  #ifndef __ARM_NEON__
4156e65624f8a1 Ard Biesheuvel 2026-04-22 @7  #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
4156e65624f8a1 Ard Biesheuvel 2026-04-22  8  #endif
4156e65624f8a1 Ard Biesheuvel 2026-04-22  9  

:::::: The code at line 7 was first introduced by commit
:::::: 4156e65624f8a1816cad423ec005b336e280999d ARM: Add a neon-intrinsics.h header like on arm64

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
