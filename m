Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D46019F130
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jan 2025 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064260; cv=none; b=lxkbw9mlcn5yn79wCkjpx0kXxwjp3d1nMP2ZvvqLMHxlx/BovsGkphiugWj/nLjZgpC6R7BUPXtRJ+/OrJtrbRZ2MBPRruSSIqfofML24hMzP6a92xxTW4fb+f97pXasU4QQbKUHX9HUWozyBdSU4WNilaw4RVUj+903QD93gN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064260; c=relaxed/simple;
	bh=k1qpb1Rir8lSADPoN9fYjOFp8eYsrVktm+XQYDJp/is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nkfdyk0QEbVDenvDRLfuOVDvAI3dORbCGrA8t1JLoo+SbAusKUNseHMP14l2juTkqLXI2pmITjvS/SKm2Ow/OuY/2T1nQGvgqjsTQs3ZZTZmsxy4dVMlFY2ZgS4cj98lWpLNrl9Y3F1HGWXulV9sGrjho/XkcXKxWmhni1UXkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTHmkIg7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTHmkIg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738064255; x=1769600255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1qpb1Rir8lSADPoN9fYjOFp8eYsrVktm+XQYDJp/is=;
  b=HTHmkIg77JQePQ3/7WGOaQsUGLqBWqhlBIrl94ihHtAaXAV9szrJQb2m
   oTuBxgzBcGnkYR4PosF9nOqbsNxd1M1XNDE2//jJX4YwW1ohZeacbyRSu
   Z1Bf7OzCp7JKsCJhANgtEJLzePLcrqPluGtJ9TJSUDdDQ+fXAexYOPMfL
   f7KsN/64FAQ2lUH6cKP60PFHOupgJ03brDG2lprUb+7d1Up0b6IYkWqYK
   IsUwI1ExLJ/3/noQATlpw0uqCzGrhhPPkgRF+k4Up1gX02nTTVk8Mlar9
   w6a5G/x0zgpf2tswv1YCU92no+i/xp6nrJR6qEW+Q893Un3N6TaAYLuov
   g==;
X-CSE-ConnectionGUID: VxOqyaaqRdCrAntFFGUpNQ==
X-CSE-MsgGUID: e1QImsWYQ4qdnEDMq5JqgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="61013615"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="61013615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:37:33 -0800
X-CSE-ConnectionGUID: L7X7ZpOARCaJnM+7kF/3Dg==
X-CSE-MsgGUID: FWJhZlm8T+KtYV+mzXQJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139576692"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2025 03:37:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcjuL-000hjF-2w;
	Tue, 28 Jan 2025 11:37:29 +0000
Date: Tue, 28 Jan 2025 19:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nathan:b4/llvm-trap-unreachable 2/2] clang-14: error: unknown
 argument: '-mllvm=-trap-unreachable'
Message-ID: <202501281938.BMoGVs3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   58c89b7cf0908b7d20a353b724bc2336c56a735a
commit: 58c89b7cf0908b7d20a353b724bc2336c56a735a [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: hexagon-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281938.BMoGVs3S-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281938.BMoGVs3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501281938.BMoGVs3S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang-14: error: unknown argument: '-mllvm=-trap-unreachable'
>> clang-14: error: unknown argument: '-mllvm=-trap-unreachable'
   make[3]: *** [scripts/Makefile.build:194: scripts/mod/empty.o] Error 1 shuffle=4091035674
   make[3]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1 shuffle=4091035674
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1267: prepare0] Error 2 shuffle=4091035674
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=4091035674
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=4091035674
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
