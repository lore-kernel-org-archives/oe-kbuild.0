Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071658;
	b=SOMDOOwb6rowhKCdEzGMFd98ZnWwhPZtlcfURUdRV58mGh1Gpb0xgfXx6iA87Z8h/pEn
	 PX7XGMpSdJUiFbSu+wCpPojto6hoSvwPdBawUIEOlXjA9KywwJTSXVjvZNwqjliP8MUK1
	 8HEtfAfSF4bGVFX107IbshVhd5IN2MQ+i04nNoR3Ib/8YDbqNSWbRT4icxoaqPAOZPs5I
	 tOLy6wEt6yZ0A7vItN4gwxNErpxPWTTKkMUrmXi1EDyeCaXoit22nieqCk5khnAMUyrCJ
	 CdDARJi1Db1WkEiyekoT1X5zM9V82vblqCkNVqooKfFj8w9tC94BPzu5xjHihoqYuLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071658;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZRfP63ghV9Kf35xMU3i7Dlvj/+zB3BuU6jme9NLBR3c=;
	b=Ii0s3FS/VQkyqagJv4cDftm3RLL7nlFMdHpmm2A3hJr/t+hzg/mJSzgEq/ufQlyq+D66
	 b/FP7V7xj/9FdqGMlZA+uRxg58SwvXuIB6Xfetl6TqiAt8iqvdYT2bhCiXXin6/YWISVY
	 hT1rWt4RoD7qkEF7er3CPJhxtbHYn2743RkskTSIYNYSmgeLZBURG1pHzJWtj/2u4snKm
	 jZUggnuaYBbnG9s3xa25DvkvVZdqXwyoNzYVUEMWeDroMKScsuEa7DTswVKaJKH/S9l4T
	 YD5xNfdcGXD2ko2SJzRk9TfwGkh6Shu5V6RsyTn0gp2nN+JXcZMOzUslHyNPu0vNzkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoYKXAwv;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EDD606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 07:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EDD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoYKXAwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795071657; x=1826607657;
  h=date:from:to:cc:subject:message-id;
  bh=5ZA+MQwYyur2+DVF0jSlSOi8ImRTydMTovT94GxAioE=;
  b=HoYKXAwv0GxYUVYNnF2mxna8q35+JnDJPT3UCseppxjYeH1x5PdoLCmA
   FsLFOtKOWbFFEhvDLxPlBBrTeo9O1qWa/0V0NYO5Fs57FE+mZcgQwJb8T
   ZD6y1oz6XoNNn6yl6ruOhvaGFg3wd1tZACSZ1LYI918e4OVPyTycqHcdd
   7DTMF145gGjQ/+NN/M7eQxvCw4XjlnV9pC41Hlp+V7eXYfGr3H2Uqwm36
   /YSw5TWXD4F6GLASroMczOr9uX5emqdAssHj/9I6ptSA3b9ostxvthffA
   Up9ODnfNNlKbaIEuJ1W0WykqHS98Nh+uuyoMfESjaUxYYdTp61/8fpjk9
   w==;
X-CSE-ConnectionGUID: B3w1pEbiSKa9XuBSWT0ehQ==
X-CSE-MsgGUID: is2bV8y7R5CAzva5Qwv4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3928963"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3928963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:00:56 -0800
X-CSE-ConnectionGUID: SPjHHg7PSs+kwNWBoIFtUw==
X-CSE-MsgGUID: Z/6BE+frTqWu0NbhVCDWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10497082"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 23:00:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTw8a-000000003hh-35Ve;
	Thu, 19 Nov 2026 07:00:52 +0000
Date: Thu, 19 Nov 2026 08:00:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm64:for-next/fixes 20/20] lib/crc/crc64-neon.c:26:9:
 sparse: sparse: Trying to use reserved word 'for' as identifier
Message-ID: <20261119075110.rk4w6gCt-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: lib/crc/crc64-neon.c:26:9: sparse: sparse: Trying to use reserved word 'for' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/fixes
head:   a041bdbe1f3a8efa8a527a89c84d3771232b4942
commit: a041bdbe1f3a8efa8a527a89c84d3771232b4942 [20/20] arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-r2300-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119075110.rk4w6gCt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119075110.rk4w6gCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119075110.rk4w6gCt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file:
   /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through /opt/cross/clang-8db60b003f/lib/clang/24/include/stddef.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-8db60b003f/lib/clang/24/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/crc/crc64-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm64/crc64-neon.h:3:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:3:26: sparse: sparse: got pmull64
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: got m
   lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: got vreinterpretq_u64_p128
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:14:23: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:14:23: sparse: sparse: got fold_consts_val
   lib/crc/crc64-neon.c:17:23: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:17:23: sparse: sparse: got bconsts_val
   lib/crc/crc64-neon.c:20:50: sparse: sparse: Expected ) in function declarator
   lib/crc/crc64-neon.c:20:50: sparse: sparse: got len
   lib/crc/crc64-neon.c:23:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:23:20: sparse: sparse: got v0
   lib/crc/crc64-neon.c:24:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:24:20: sparse: sparse: got zero
   lib/crc/crc64-neon.c:26:14: sparse: sparse: Expected ) in function declarator
   lib/crc/crc64-neon.c:26:14: sparse: sparse: got ;
>> lib/crc/crc64-neon.c:26:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/crc/crc64-neon.c:26:16: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:26:16: sparse: sparse: got )
   lib/crc/crc64-neon.c:29:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:29:19: sparse: sparse: got +=
   lib/crc/crc64-neon.c:30:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:30:21: sparse: sparse: got -=
   lib/crc/crc64-neon.c:31:25: sparse: sparse: Expected ) in function declarator
   lib/crc/crc64-neon.c:31:25: sparse: sparse: got <
>> lib/crc/crc64-neon.c:31:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/crc/crc64-neon.c:35:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:35:9: sparse: sparse: got }
   lib/crc/crc64-neon.c:41:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:41:20: sparse: sparse: got bconsts
   lib/crc/crc64-neon.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:42:20: sparse: sparse: got final
   lib/crc/crc64-neon.c:44:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:44:12: sparse: sparse: got ^=
>> lib/crc/crc64-neon.c:46:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/crc64-neon.c:46:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:46:16: sparse: sparse: got vgetq_lane_u64
   lib/crc/crc64-neon.c:47:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:47:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:34:22: sparse: sparse: undefined identifier 'pmull64'
   lib/crc/crc64-neon.c:34:49: sparse: sparse: undefined identifier 'pmull64_high'
--
   lib/raid/xor/xor-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-8db60b003f/lib/clang/24/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>> lib/raid/xor/xor-neon.c:14:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:14:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:14:37: sparse: sparse: got p1
   lib/raid/xor/xor-neon.c:15:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:15:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:15:37: sparse: sparse: got p2
   lib/raid/xor/xor-neon.c:17:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:17:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:42:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:42:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:42:37: sparse: sparse: got p1
   lib/raid/xor/xor-neon.c:43:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:43:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:43:37: sparse: sparse: got p2
   lib/raid/xor/xor-neon.c:44:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:44:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:44:37: sparse: sparse: got p3
   lib/raid/xor/xor-neon.c:46:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:46:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:79:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:79:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:79:37: sparse: sparse: got p1
   lib/raid/xor/xor-neon.c:80:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:80:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:80:37: sparse: sparse: got p2
   lib/raid/xor/xor-neon.c:81:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:81:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:81:37: sparse: sparse: got p3
   lib/raid/xor/xor-neon.c:82:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:82:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:82:37: sparse: sparse: got p4
   lib/raid/xor/xor-neon.c:84:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:84:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:125:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:125:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:125:37: sparse: sparse: got p1
   lib/raid/xor/xor-neon.c:126:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:126:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:126:37: sparse: sparse: got p2
   lib/raid/xor/xor-neon.c:127:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:127:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:127:37: sparse: sparse: got p3
   lib/raid/xor/xor-neon.c:128:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:128:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:128:37: sparse: sparse: got p4
   lib/raid/xor/xor-neon.c:129:36: sparse: sparse: No right hand side of '*'-expression
   lib/raid/xor/xor-neon.c:129:37: sparse: sparse: Expected ; at end of statement
   lib/raid/xor/xor-neon.c:129:37: sparse: sparse: got p5
   lib/raid/xor/xor-neon.c:131:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:131:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:14:9: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:14:19: sparse: sparse: undefined identifier 'dp1'
   lib/raid/xor/xor-neon.c:14:26: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:15:9: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:15:19: sparse: sparse: undefined identifier 'dp2'
   lib/raid/xor/xor-neon.c:15:26: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:22:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:22:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:23:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:23:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:24:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:24:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:25:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:25:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:28:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:29:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:30:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:31:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:33:17: sparse: sparse: undefined identifier 'dp1'
   lib/raid/xor/xor-neon.c:34:17: sparse: sparse: undefined identifier 'dp2'
   lib/raid/xor/xor-neon.c:42:9: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:42:19: sparse: sparse: undefined identifier 'dp1'
   lib/raid/xor/xor-neon.c:42:26: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:43:9: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:43:19: sparse: sparse: undefined identifier 'dp2'
   lib/raid/xor/xor-neon.c:43:26: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:44:9: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:44:19: sparse: sparse: undefined identifier 'dp3'
   lib/raid/xor/xor-neon.c:44:26: sparse: sparse: undefined identifier 'uint64_t'
   lib/raid/xor/xor-neon.c:51:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:51:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:52:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:52:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:53:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:53:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:54:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:54:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:57:17: sparse: sparse: undefined identifier 'v0'
   lib/raid/xor/xor-neon.c:57:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:58:17: sparse: sparse: undefined identifier 'v1'
   lib/raid/xor/xor-neon.c:58:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:59:17: sparse: sparse: undefined identifier 'v2'
   lib/raid/xor/xor-neon.c:59:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:60:17: sparse: sparse: undefined identifier 'v3'
   lib/raid/xor/xor-neon.c:60:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/xor-neon.c:63:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:64:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:65:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:66:17: sparse: sparse: undefined identifier 'vst1q_u64'
   lib/raid/xor/xor-neon.c:68:17: sparse: sparse: undefined identifier 'dp1'
   lib/raid/xor/xor-neon.c:69:17: sparse: sparse: undefined identifier 'dp2'

vim +/for +26 lib/crc/crc64-neon.c

63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  12  
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  13  /* x^191 mod G, x^127 mod G */
ff049836f05f5e lib/crc/crc64-neon.c             Ard Biesheuvel 2026-10-29  14  static const uint64_t fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  15  					     0x21e9761e252621acULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  16  /* floor(x^127 / G), (G - x^64) / x */
ff049836f05f5e lib/crc/crc64-neon.c             Ard Biesheuvel 2026-10-29  17  static const uint64_t bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  18  					 0x34d926535897936aULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  19  
061cef5fcee5a4 lib/crc/crc64-neon.c             Ard Biesheuvel 2026-04-22  20  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  21  {
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  22  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  23  	uint64x2_t v0 = { crc, 0 };
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  24  	uint64x2_t zero = { };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  25  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30 @26  	for (;;) {
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  27  		v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  28  
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  29  		p += 16;
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  30  		len -= 16;
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30 @31  		if (len < 16)
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  32  			break;
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  33  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  34  		v0 = pmull64(fold_consts, v0) ^ pmull64_high(fold_consts, v0);
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  35  	}
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  36  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  37  	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  38  	v0 = vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  39  
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  40  	/* Final Barrett reduction */
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  41  	uint64x2_t bconsts = vld1q_u64(bconsts_val);
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  42  	uint64x2_t final = pmull64(bconsts, v0);
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  43  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  44  	v0 ^= vextq_u64(zero, final, 1) ^ pmull64_hi_lo(bconsts, final);
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  45  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30 @46  	return vgetq_lane_u64(v0, 1);

:::::: The code at line 26 was first introduced by commit
:::::: 8fdef85d601db670e9c178314eedffe7bbb07e52 lib/crc: arm64: Simplify intrinsics implementation

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
