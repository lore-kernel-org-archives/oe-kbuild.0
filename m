Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0B345ECB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898899; cv=none; b=PFM20HcQSVHIKXkYUjkquBl3+DblPQBXXSe1bXHHNzbioSgx9z3tvQR6SW/0F0o6va3AYg7rNfX+jAWkG5nmrmLRZ7Sr+8VCzVWtpsy7djpaxcnTaMH02BJy7+H2UR3HR+CmiGA6t1oFJveFgn8351ZSbFv3nmohmP0vh2J9TIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898899; c=relaxed/simple;
	bh=30BL1CdpiyLefZGPZpRSOPHHSts3/cZf259yHEKoMP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fIva8rBScdJ0ZBJYdj1KX7hmL9T8bP0tGbiXUF3TpjftnYiWW8laGLYAvg98TIjmUZRxyWrKUbAhxjUTlp+IVad9MuXQvcljhp0WI+2Tv1nX/0R+rXbhj1ySdLs2OESzH2q3K/PTUpKTVp8ycdcR2SnqkBnnmaNsehDvadt7j9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdSy3Ygf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdSy3Ygf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784898897; x=1816434897;
  h=date:from:to:cc:subject:message-id;
  bh=30BL1CdpiyLefZGPZpRSOPHHSts3/cZf259yHEKoMP0=;
  b=gdSy3YgfYiY0XCpVdpteguPFTZgZMemYUVu/FFwpz1s9kYeuIPhDAMBW
   9U9zNPsL9ZjA8Em+W+/QAUa+cLohK/Wa6ByJkfDxVqBWTLt3ZzUSL4+U6
   kB6E78z1W2GUoI2MVvKnaMtg7audiC7s4X605EPmZeZ324oNtWYA7jVb3
   PoNtVaQrieth06qslkOruqq4+eSh13wPM4k7vFbFvFv6IhdVvFZwGeMkQ
   3/3lypS7C54M7m4a++nRRlOrP4fFXMv6IVc0L51MWJ7SAinSgL3Mt9B3W
   D5eiQTjVz+ZYnWqEJcuPXjaPqcQJHnrqpkW3uImL0NfiMpX0J3AH3AvjS
   g==;
X-CSE-ConnectionGUID: CxCjafP7Tm6j9hnmBNzSmg==
X-CSE-MsgGUID: 6uGLKD25QByZ0nFTWt1goQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88101361"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="88101361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 06:14:54 -0700
X-CSE-ConnectionGUID: S3HEzhiwRVCAYKXAu0ewJg==
X-CSE-MsgGUID: DI0k0CT4SrOFCZjgz7fKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="254768365"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2026 06:14:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnFjm-00000000aoR-3tzA;
	Fri, 24 Jul 2026 13:14:50 +0000
Date: Fri, 24 Jul 2026 21:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm/crc64-neon.h:11:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202607242030.gEsyDfTe-lkp@intel.com>
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
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: e3babebfb83865ec2be90e64d3f73f9aca140b3a lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r123-20260724 (https://download.01.org/0day-ci/archive/20260724/202607242030.gEsyDfTe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607242030.gEsyDfTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3babebfb838 ("lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607242030.gEsyDfTe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/crc64-neon.c: note: in included file:
   arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
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
