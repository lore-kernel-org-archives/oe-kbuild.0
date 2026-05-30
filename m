Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2553A450A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136801; cv=none; b=nkVJLLRiQXnQtbeHQ1rc0uRwMcw9+LWs4YGh0Ht2vJLkWnzNbsa30GUZMfZdJEha8f+A8TlRjhs6f+gxoR6NXNjchaZ098EI5N1CRFZireaVuUYfQaHFz3X8j6SGPDw7FNTTXhYU5c04/TCaCQChnjCop6mR+05RXbRDIgDAVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136801; c=relaxed/simple;
	bh=+dUUkgLtykr1j2xWvr5cN3mmp9TT/Ww5h/n8PuY4wMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q0rAGDIvBC++spXDXNt368u0Z+ckQtOS1Hg/1gW4KF5vCcglfr+KCvVoYOr8Oaq25phK7glkzK7NYYV2yXCkqfroa+yVwv40u/gQBfJjx7rBDs8TSO3uEiHPCKH0s8yGm0rEqIcmUnFfl0GXwfz2/r+X+XWju/27NgPhnKugfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1UrMKF0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1UrMKF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780136795; x=1811672795;
  h=date:from:to:cc:subject:message-id;
  bh=+dUUkgLtykr1j2xWvr5cN3mmp9TT/Ww5h/n8PuY4wMg=;
  b=A1UrMKF0phjaB5CkvVDLzGYzOfT0IYtTrKtZ+IUcOUVQNlQ+uUy03Uay
   5spRi/Toi5rvPpvjtvA4MBJ7O1Mnrk8plB2R0sw2BYUijGJ6S9GnR+8NI
   kA/JU6ZtYlZ5K6dKJoOjHdx1c8XGGPZckvtcjsgt8NI+eU309KB6Myjgv
   H1OvtUIhFh26oZG2eYVEVG7DWyClu+v06W0YBMIi0+mUaOGzQYzaXgVTP
   vj6cBOCgpM71j4S+9O7jFS09u1MzIxeJPS4kM03WYL7zRWIk+FEBC6KKk
   lPF+e2uBhmM5b9fe+MQdJFegIeR4Nx/QPekCIqHhJ4WgCzc5eRee99+HE
   Q==;
X-CSE-ConnectionGUID: zrXe5UifSnGeePKEvKjFUQ==
X-CSE-MsgGUID: Pl9JvWD5Q2CCC0OPWdcoWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92086757"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92086757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 03:26:34 -0700
X-CSE-ConnectionGUID: 6cAMuGbXR0KETDgWDhtqPQ==
X-CSE-MsgGUID: atXG6DgrSYKxtTVLr4A5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="243168395"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2026 03:26:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGtj-000000008KL-1Aj9;
	Sat, 30 May 2026 10:26:31 +0000
Date: Sat, 30 May 2026 18:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: slub.c:undefined reference to `bpf_arena_alloc_slab_page'
Message-ID: <202605301811.Mkm2dlt3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Alexei-Starovoitov/slab-Introduce-kmem_cache_alloc_arena_nolock-and-kfree_arena_nolock/20260530-091530, commit: b76d09903028979bc6ee776d527701c97e9fa75c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/slab-Introduce-kmem_cache_alloc_arena_nolock-and-kfree_arena_nolock/20260530-091530
head:   3d01ecf4de7c4ea67e7e84597b640dc717a8a6c9
commit: b76d09903028979bc6ee776d527701c97e9fa75c bpf,slab: Add slub-backed allocator for bpf_arena
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: sh-randconfig-001-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301811.Mkm2dlt3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301811.Mkm2dlt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301811.Mkm2dlt3-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/slub.o: in function `alloc_slab_page.isra.0':
>> slub.c:(.text+0x16b8): undefined reference to `bpf_arena_alloc_slab_page'
   sh4-linux-ld: mm/slub.o: in function `__free_slab':
>> slub.c:(.text+0x51c4): undefined reference to `bpf_arena_free_slab_page'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x17a0): undefined reference to `devm_clk_hw_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
