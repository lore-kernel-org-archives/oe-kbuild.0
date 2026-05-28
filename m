Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF11A6823
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 01:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779932083; cv=none; b=LwkUtK83cTCHWfKQG2kA1/CUMfD4GNqBeKu8iv1yBaxt0eixoR0GOuV2U+cM9cY+4bNiYVwuJG6gSBhoVliJbl90I5FSymPvuTwCewWFUNKwvXPrKz4Bo4Ex66FbLK4GHkG4qU/FTnNI6H+7XuCbhpGlTiGe55y7p26A4x9UHKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779932083; c=relaxed/simple;
	bh=Szk/af2Pp4ndoJ3jYaO8wsvpcYAoYBsnq/mwz+2bMxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dka+uEYr2zlaKfL917BRONSFVrFRGM4628dEjJElljc4uQa2nZO6ti88WEF74VOQXIwCEwkXYfYz4Wa7NSVyK91HD2iHBRBwvVifZarFmeSinwvSxYGndvtOs035CNJ2LWQn8pw0d22qW4sIRHUtHUL3kiuGP+/ysxQDogx/E+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtHghmkt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtHghmkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779932081; x=1811468081;
  h=date:from:to:cc:subject:message-id;
  bh=Szk/af2Pp4ndoJ3jYaO8wsvpcYAoYBsnq/mwz+2bMxE=;
  b=EtHghmktnXil78h0hT8G0PBV9enKpZvsIKoBYig5j/RgJ/0PHYkhnuGh
   OA/ZqN9r0itEVQCnRAxZdXkjhgfnQo5AmhocNcGoy/zhRO2uUyGDzrrzg
   Tu21iH9nW5ahuac+d9Wzvn960o/Ik+h0vBACSt5xtFPV9oqLuoZlaPOPA
   jUWzinqjf3ru/JgxNXVH4gsm9NjqrqgvlGRgOvMvhPgKGCzsZE+KKHw6G
   KUhzKKbAzToxe2K6+ZRFLqPgEN2qymVGodm4BmT5vxxH2R/dtOe1QbDEq
   4IRyMK763g1i8PrzZYnCvIZWcp78FI0lkxi2euF/1zuf1FxlpQO/SOpea
   Q==;
X-CSE-ConnectionGUID: SlD28l7WTO2jG3E8/w8bEg==
X-CSE-MsgGUID: Nu7WyDLvQOezxKhSHQSgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91460904"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="91460904"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:34:41 -0700
X-CSE-ConnectionGUID: RBjeaJ0yTQ+t9xsIpIXC8A==
X-CSE-MsgGUID: XeuhKyVgQs61mTSxxCr6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="247351927"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2026 18:34:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSPdt-000000005PS-085N;
	Thu, 28 May 2026 01:34:37 +0000
Date: Thu, 28 May 2026 09:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_fp8.h:43:11: sparse:
 sparse: '__mfp8' has implicit type
Message-ID: <202605280906.SVYPCQ6y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_fp8.h:43:11: sparse: sparse: '__mfp8' has implicit type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Demian Shulhan <demyansh@gmail.com>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: 63432fd625372a0e79fb00a4009af204f4edc013 lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation
date:   8 weeks ago
:::::: branch date: 29 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r111-20260528 (https://download.01.org/0day-ci/archive/20260528/202605280906.SVYPCQ6y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280906.SVYPCQ6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63432fd62537 ("lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605280906.SVYPCQ6y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/arm64/crc64-neon-inner.c: note: in included file (through ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h, arch/arm64/include/asm/neon-intrinsics.h):
>> ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_fp8.h:43:11: sparse: sparse: '__mfp8' has implicit type
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_fp8.h:43:18: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_fp8.h:43:18: sparse: sparse: got mfloat8_t
   lib/crc/arm64/crc64-neon-inner.c: note: in included file (through ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h, arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:35:20: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:35:20: sparse: sparse: got int8x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:36:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:36:21: sparse: sparse: got int16x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:37:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:37:21: sparse: sparse: got int32x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:38:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:38:21: sparse: sparse: got int64x1_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:39:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:39:23: sparse: sparse: got float16x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:40:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:40:23: sparse: sparse: got float32x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:41:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:41:21: sparse: sparse: got poly8x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:42:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:42:22: sparse: sparse: got poly16x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:43:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:43:21: sparse: sparse: got uint8x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:44:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:44:22: sparse: sparse: got uint16x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:45:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:45:22: sparse: sparse: got uint32x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:46:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:46:23: sparse: sparse: got float64x1_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:47:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:47:22: sparse: sparse: got uint64x1_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:48:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:48:21: sparse: sparse: got int8x16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:49:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:49:21: sparse: sparse: got int16x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:50:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:50:21: sparse: sparse: got int32x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:51:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:51:21: sparse: sparse: got int64x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:52:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:52:23: sparse: sparse: got float16x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:53:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:53:23: sparse: sparse: got float32x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:54:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:54:23: sparse: sparse: got float64x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:55:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:55:22: sparse: sparse: got poly8x16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:56:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:56:22: sparse: sparse: got poly16x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:57:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:57:22: sparse: sparse: got poly64x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:58:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:58:22: sparse: sparse: got poly64x1_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:59:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:59:22: sparse: sparse: got uint8x16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:60:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:60:22: sparse: sparse: got uint16x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:61:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:61:22: sparse: sparse: got uint32x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:62:22: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:62:22: sparse: sparse: got uint64x2_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:64:19: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:64:19: sparse: sparse: got poly8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:65:20: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:65:20: sparse: sparse: got poly16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:66:20: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:66:20: sparse: sparse: got poly64_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:67:21: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:67:21: sparse: sparse: got poly128_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:69:23: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:69:23: sparse: sparse: got mfloat8x8_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:70:24: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:70:24: sparse: sparse: got mfloat8x16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:72:16: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:72:16: sparse: sparse: got float16_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:76:24: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:76:24: sparse: sparse: got bfloat16x4_t
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:77:24: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_private_neon_types.h:77:24: sparse: sparse: got bfloat16x8_t
   lib/crc/arm64/crc64-neon-inner.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:199:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:199:1: sparse: sparse: got vadd_s8
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:202:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:209:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:216:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:223:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:223:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:230:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:230:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:237:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:244:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:244:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:251:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:251:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:258:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:258:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:265:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/15.2.0/include/arm_neon.h:265:1: sparse: sparse: got }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
