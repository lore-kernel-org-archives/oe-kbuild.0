Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7337D101
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893796; cv=none; b=B4U5zfw/pdHSFKt4bkmg5BNLOs9zYlTp/RSSHymMJq7myqnAz+AdCLZyQ3UUHVkXDJK2z1cru16GGnlvdtsPDRSTyQTt+bWfJX+5MV+L0/au7h8QzNp9CsND+mnq+XxHZhX8b8nxgxZXTabt+srTwWP4aJzP+atfe7YOYkV+5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893796; c=relaxed/simple;
	bh=ip9m8gWob759pY0SvgXKweCkH+Dj6/Q5eKmayw2p0Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UEvGVtGRfk3ka4oHmyK1WD8vNl8qx8vDoCZuXiUv+ssfmzK+QBE9Oj4SbVFwOf02HPCzHKqas9mLx9uO+CTJFEB+iBUokmTWWx6FOorFDJU9NOnuUQ/5jzRWe1Fw3ZZN7MBfz9FbNz6rhLi4YKpgCW2+zc+m9nxYEhyQ6uuM5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcWZKjNN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcWZKjNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784893794; x=1816429794;
  h=date:from:to:cc:subject:message-id;
  bh=ip9m8gWob759pY0SvgXKweCkH+Dj6/Q5eKmayw2p0Ak=;
  b=jcWZKjNNBqB83P96R4Xpbwf3tmTdP4hJ5TOQcmKq8Fks/igEUofvR7hF
   9YCgTwoseGfh26FUCZjTMi7UkY9JzDA1FuYFEcNTRDzormAsgNujohppT
   y6j3EzDtJbgJqumAyCY8zpE2yd4SoTUHgBDFX6xqhI3CaXZ1eFW1w6H3s
   KRxyfz6lDmZzgwxvgQ5MoLJ/b/btHy+h8Oi3617TTecdPXQjNhyaihQxh
   1KBVALYAwgAkAaSdUhylYlr6ErRb99hmZW9bSiIlZYtzMpEscVSb3DnaQ
   TBuDDd3RG2U8wfq+XY5b4XUiCWd8MVAwtR6uI2h0Gj2/l2ZshC9OP701X
   A==;
X-CSE-ConnectionGUID: +ZwGxMV+RlywheVKGLHJnA==
X-CSE-MsgGUID: ejcOCxVhR8GWitX9N3C0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85605495"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85605495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 04:49:53 -0700
X-CSE-ConnectionGUID: Y/WbV9avTOG+tp1wrYR99A==
X-CSE-MsgGUID: SC3Tq+K4QtiDURvJL8f4fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="254379278"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jul 2026 04:49:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnEPT-00000000am3-2NF4;
	Fri, 24 Jul 2026 11:49:47 +0000
Date: Fri, 24 Jul 2026 19:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse:
 You should compile this file with '-march=armv7-a -mfloat-abi=softfp
 -mfpu=neon'
Message-ID: <202607241901.auL4DmRt-lkp@intel.com>
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
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: a967b1f51c83b65372a93d652a888e3addd9c5a3 xor/arm: Replace vectorized implementation with arm64's intrinsics
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r123-20260724 (https://download.01.org/0day-ci/archive/20260724/202607241901.auL4DmRt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241901.auL4DmRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a967b1f51c83 ("xor/arm: Replace vectorized implementation with arm64's intrinsics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607241901.auL4DmRt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/xor/xor-neon.c: note: in included file:
>> arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
   lib/raid/xor/xor-neon.c: note: in included file (through arch/arm/include/asm/neon-intrinsics.h):
   ../lib/gcc/arm-linux-gnueabi/8.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/xor/xor-neon.c:18:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:18:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:47:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:47:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:85:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:85:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:132:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:132:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:23:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:23:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:24:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:24:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:25:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:25:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:26:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:26:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:29:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:30:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:31:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:32:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:52:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:52:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:53:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:53:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:54:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:54:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:55:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:55:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:58:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:58:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:59:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:59:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:60:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:60:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:61:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:61:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:64:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:65:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:66:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:67:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:90:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:90:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:91:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:91:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:92:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:92:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:93:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:93:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:96:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:96:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:97:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:97:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:98:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:98:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:99:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:99:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:102:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:102:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:103:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:103:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:104:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:104:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:105:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:105:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:108:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:109:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:110:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:111:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:137:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:137:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:138:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:138:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:139:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:139:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:140:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:140:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:143:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:143:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:144:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:144:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:145:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:145:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:146:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:146:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:149:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:149:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:150:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:150:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:151:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:151:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:152:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:152:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:155:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:155:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:156:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:156:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:157:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:157:22: sparse: sparse: undefined identifier 'veorq_u64'

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
