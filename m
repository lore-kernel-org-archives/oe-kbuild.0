Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274083;
	b=fdJYpRANmOZfVRJnb7d0V+uhRKMDEVB+9cYEFVuNTF/cNvsa8XnDiFdVUIDx77KVz4+0
	 xWJK0/9lnzCtZ5c1xVxffXM25irLDC81NlFXjDnerAutoy7Tz6VvRs037x6mwxuyD086Z
	 73J54LCViFDVtJAlL9nbiRKn3bQY1iylUUkQ7Fc4QsTioY+O1OJlOQFmflyTL61ziUP/F
	 j0MQQAw7kb0RFdamWt65WwGSsbbpqwyWA9qkCaO4v8VJddutMIFBkqOmsmbCN6tTarVpn
	 hwsUn/JA6ephBFfLUj9o9ribmLPsKcDCG3MLnjJiJDHops6v+zT7nf3yAbdRqa4fj9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k9LfRwB49z5cq1YCLIxMDJrpHEGXTRagCPvDH5F0tNk=;
	b=Wg1qkz+4Jtt71h6UJzhKJp14WS6FpyQ3S/RS3z4ScjDV3qpFfxqqMj0RSKsR/mWuftxD
	 sNowAdHlEvwKIz4+xcUJanaqIMIh2e/Zll0aiNh4+cWk5u/r+RCH0R0KD6VHv+QtX+R4f
	 O8yRE1UbYdZb20jnKozQ9M3A+NuZpAsRH6wNoPdm0D2pkIvZIRqzRGzSfXGNjN4+r+nWt
	 sUykCdIaTo7N0/dfCHIRFEnUeJPZYk3XoFZ8JAbIkUvFXjTKudsoUm0OdtlvCpMzHbxpK
	 oXHYiw8B9EO7m1jbXetA50T3mNQfVSoiW9IfPcsfbKaeZa+soI8Jrkj4dOwUFDgxeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IfiIFwOh;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC78606A31A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 11:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IfiIFwOh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793274081; x=1824810081;
  h=date:from:to:cc:subject:message-id;
  bh=Qf7sbWHh0ZbYuZtWUVDw1Iqv/vtkvXIUKWLXw68gtik=;
  b=IfiIFwOhnPqtqSBghmqy2n/0toTvnVCvb4cDTa2nREgx/mM1Zrx6EKZY
   3SffWRh06mHQ18smVzQaed8haxeYKDPQSa2Pzy5Wezj28uSy0CIfI8EBO
   7eM9yGxBA/S/WXWKEswggQRALDpmgnGGUa3+ht0+xOaXHLW2BTJRSj4Tx
   NJWrSrsyWbe6EzFTKkUbhr3Vq12/3AqZxivHouf7dyR5Bvih9tfEsb+Bw
   /L7LVz6E7DQdPciRlqZfUengzksKKEOsr/OzOrxZ6R1TRG4wwUv7lB3Mb
   26O7iWSw09Y50sUH9VPs2hioGM8SH3ZLUx9WtC7+TaLVMFSlYkeF/bire
   Q==;
X-CSE-ConnectionGUID: gFkUMDD/SYuUuW9DOHflwQ==
X-CSE-MsgGUID: u6Uf5dgaQ+mrlG20+9rZHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1896673"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1896673"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:41:21 -0700
X-CSE-ConnectionGUID: IhSHe5+KRvWl1Q1kWBlFmw==
X-CSE-MsgGUID: Zx44YResSWO44DzNbQsudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5449303"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2026 04:41:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMOVR-000000005EP-3zhq;
	Thu, 29 Oct 2026 11:41:17 +0000
Date: Thu, 29 Oct 2026 12:40:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202610291252.JmWyJwds-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c339f4010dea8b0d754f84ace70cd1b089878ef8
commit: e3babebfb83865ec2be90e64d3f73f9aca140b3a lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-r2310-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291252.JmWyJwds-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291252.JmWyJwds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3babebfb838 ("lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610291252.JmWyJwds-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file:
>> arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
   lib/crc/crc64-neon.c: note: in included file (through arch/arm/include/asm/neon-intrinsics.h):
   ../lib/gcc/arm-linux-gnueabi/8.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
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
e3babebfb83865 Ard Biesheuvel 2026-04-22  @3  static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
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
