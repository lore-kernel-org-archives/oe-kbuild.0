Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8312F3C18
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616626; cv=none; b=JkCcyYyB/UNeqcyv8UxxYgcafREkdszjDFCII7injhNJvmCIW3MSnLAYn+H+j2uv/OODquP7csnYe1v0uXPUIbWb3EKYHXkR2dVg5mSY2quRl3SQslGN4JaXxhfqEAHz3oq4wBZRiF+YTTeVluGcqmkw0CVdEN8BOB+H9QNKp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616626; c=relaxed/simple;
	bh=YCGZni2goBZyJE0zU69+YugYK3z7kx63EVgyaeDE2gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SyOHadJAKp6XLocfCV44ZK6avBQLFX/TZ/wG9MXBpcUkCXqZgos7kLknpEH+8I7miLsWdqJJkag/vDCvS3f1QlPqFV+njbM9DQEREQvnJAfKfQDioGnHuLy7dSi32zg9Y/x8DeuCxNfkrIOaNOsE+FJLP/XlJJ+mDsGpOiKKSM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWPAtWuS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWPAtWuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781616625; x=1813152625;
  h=date:from:to:cc:subject:message-id;
  bh=YCGZni2goBZyJE0zU69+YugYK3z7kx63EVgyaeDE2gg=;
  b=eWPAtWuSbAMgHjxK6lsg1+jYEDlJxmBkiq+ccjcA9qmgwg3BYi58Opi7
   WvDpxZa2PdwH8dNhla9FmBiN/egelZYfVBLcCFQ23Hpz+KX6MJBL0fIMl
   gHWVcLvaalMAJUT9TiSm0AEgHCgGjWXv+IAnkyTV/0XDq8GEPjAbsD2Cg
   wCzwS9vtc4fN+Vtifo4OUrsC0n29VfZnQsn112dbIQ2xZbTHKZCXeu3wK
   RbXVt8lE+IRGNACpioQlsu/Ml/YWBQwxEBQTsgYv5mfEK6cZSrFBO6/Qa
   kRMLJgAvQBp51inAimmlAh9TmCTVITudtCCz2tpVI1LGldDBIav7db26K
   A==;
X-CSE-ConnectionGUID: q2iqKSaGShWMS4EzACOHJg==
X-CSE-MsgGUID: po+x3DdoQpqIuiVUS2v+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99798746"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="99798746"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:30:24 -0700
X-CSE-ConnectionGUID: zq0DuPXTTYyTmzpNYGc6ng==
X-CSE-MsgGUID: DiWH35VkTNmvz0pfT6xJsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243408613"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2026 06:30:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZTrw-00000000TD0-3rsG;
	Tue, 16 Jun 2026 13:30:20 +0000
Date: Tue, 16 Jun 2026 21:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse:
 You should compile this file with '-march=armv7-a -mfloat-abi=softfp
 -mfpu=neon'
Message-ID: <202606162116.QEohc7gs-lkp@intel.com>
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
head:   6b5a2b7d9bc156e505f09e698d85d6a1547c1206
commit: a967b1f51c83b65372a93d652a888e3addd9c5a3 xor/arm: Replace vectorized implementation with arm64's intrinsics
date:   3 weeks ago
:::::: branch date: 67 minutes ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-r122-20260616 (https://download.01.org/0day-ci/archive/20260616/202606162116.QEohc7gs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162116.QEohc7gs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a967b1f51c83 ("xor/arm: Replace vectorized implementation with arm64's intrinsics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606162116.QEohc7gs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/xor/xor-neon.c: note: in included file:
>> arch/arm/include/asm/neon-intrinsics.h:7:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
   lib/raid/xor/xor-neon.c: note: in included file (through arch/arm/include/asm/neon-intrinsics.h):
   ../lib/gcc/arm-linux-gnueabi/16.1.0/include/arm_neon.h:45:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
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
