Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CC32FA1B
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570519; cv=none; b=hH3mPpbNUYfuULgRPx2ScUQ8LKOm/oJpoxWhtxd7c+04YjDUzp87XENLHTAtgkAgosmnijh8Nw6xH8HIqZNz7Q3YAWw+mdchsd/q4YLB5dsFCPjVgpYxeb96z5z4C57k053p4PcLBinzYfJq8rQdwdWaGag9pZtriCHjptGBt2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570519; c=relaxed/simple;
	bh=fIWV39nKGpgL5aUUd2kiugYPuLKIr2BxidZBZtzjLaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nhy5EGFh5fsILn9ogHpV/46kFeROnn9Jfe0dPeTZa/scfM/nzo7b6Aog15rVZNxTQ7pr9WtyboLCJOII/GqOtiTg6VDF2PwOSkQ/ltQYQI65o2HNiCyLGTu1C41v7VmSYE+1jMPX7jWsRMuJnL6Rva9zb3aiDyA12vbfnymyyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fch4eEQe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fch4eEQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766570517; x=1798106517;
  h=date:from:to:cc:subject:message-id;
  bh=fIWV39nKGpgL5aUUd2kiugYPuLKIr2BxidZBZtzjLaw=;
  b=fch4eEQeqdqX/mNATtstwQkEbiWfJRLh+Q0j7b4r2jY3X0roQmdrM4lZ
   RBBYQDf2xyLR5w293aNVViRdNU6nIDw4psXecaAC/puHIDdMa6wzZ+Fdc
   SYsqTEYW53tGXmg1N3dg6ZBMO1Ga1ATWMDVLIy1JsOrIEs3bekJaI9JmG
   6WFYZfaSFo1K04AV+CDeR2KmDngfbf6dOt9weAQhF6PS5sp1xas6zH/qi
   qYFRSYY5A4mY7slj7bA6+LDKk2R7g1+qLcSjb7UcMDqVXiFwGCKi+MgkJ
   f9kuQYFeOw6zQPuHC819rpU77qYbFZ1uVn+WJw5SGG/FSzsM+X8QxJdiy
   g==;
X-CSE-ConnectionGUID: Kiz97aRzTpuAv7e3qtwctQ==
X-CSE-MsgGUID: JsjVyM14T8iMZULdxcc0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68456112"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68456112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 02:01:56 -0800
X-CSE-ConnectionGUID: 5kvR0PgIRdCy6/k02AmLsQ==
X-CSE-MsgGUID: zDmGxS3mRtCojvJZoFr9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204529126"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2025 02:01:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYLgm-000000002uf-39RG;
	Wed, 24 Dec 2025 10:01:52 +0000
Date: Wed, 24 Dec 2025 18:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 455/799]
 /opt/cross/clang-4ef602d446/lib/clang/22/include/arm_neon.h:30:2: sparse:
 sparse: "NEON intrinsics not available with the soft-float ABI. Please use
 -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202512241703.DqVBXHps-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-4ef602d446/lib/clang/22/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: a4a93d12aeb60e58a144d8ab6d197440f18bf4e7 [455/799] lib: Give XOR_BLOCKS, RAID6_PQ config opts names
:::::: branch date: 7 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r134-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241703.DqVBXHps-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241703.DqVBXHps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512241703.DqVBXHps-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/lib/xor-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
>> /opt/cross/clang-4ef602d446/lib/clang/22/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   arch/arm64/lib/xor-neon.c:19:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:19:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:48:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:48:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:86:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:86:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:133:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:133:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:184:26: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:184:26: sparse: sparse: got eor3
   arch/arm64/lib/xor-neon.c:191:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/arm64/lib/xor-neon.c:191:16: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:191:16: sparse: sparse: got res
   arch/arm64/lib/xor-neon.c:192:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:192:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:203:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:203:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:206:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:206:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:206:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:218:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:218:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:219:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:219:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:220:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:220:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:221:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:221:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:223:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:223:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:224:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:224:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:225:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:225:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:226:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:226:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:227:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:240:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:240:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:243:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:243:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:261:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:261:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:262:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:262:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:263:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:263:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:264:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:264:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:266:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:266:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:267:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:267:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:268:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:268:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:269:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:269:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:270:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:270:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:271:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:286:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:286:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:289:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:289:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:289:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:307:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:307:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:308:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:308:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:309:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:309:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:310:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:310:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:312:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:312:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:313:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:313:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:314:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:314:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:315:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:315:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:316:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:316:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:317:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:317:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:318:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:318:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:324:37: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:324:37: sparse: sparse: got .
   arch/arm64/lib/xor-neon.c:325:37: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:325:37: sparse: sparse: got .
   arch/arm64/lib/xor-neon.c:326:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:326:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:328:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:328:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:329:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:329:1: sparse: sparse: got }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
