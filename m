Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0E2F999F
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734524; cv=none; b=sahbsq+/PZZhkl+OxquAnEJAMqIXz4W3SINY72a7xXM7LvHViSXpdNqCGtxav31cYPPmdArZiC9DY/p1RnfBSGsW/DPjTLMVkcVhCki7FP7c28Tkg52zoWxX31BWbcxZ/Z276yeWr0YMY8nl/bRBaipVi5IFmzEvdSQXXYmsN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734524; c=relaxed/simple;
	bh=HxHkELdGD4GNhq0xO+7aW/CV5PSvhSAIppGNzGHl0Cw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZsrfLLHhDGl4iUa8uVBb5yX6pVlAN0QZioydXOxSVw7FBo65KjsJjaj/I84nEwhyazwP6aHZ5YClX+UJeo1ABHhntKwaMblAWZAem/2gYV9tV8GABEIAx8s/VAj/wnLlKYjNFdT8mF7sVREDybuZm0h9mTqbEqrRdAuPhYxJxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArpPlIsb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArpPlIsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767734524; x=1799270524;
  h=date:from:to:cc:subject:message-id;
  bh=HxHkELdGD4GNhq0xO+7aW/CV5PSvhSAIppGNzGHl0Cw=;
  b=ArpPlIsbSN5qgFGX76ba8ox3gFkQVpvdG5isHFvUgeaIAtc92IW9EzCg
   QEYpVemHsIGSadeNxTLFKZgrOAZSFtLYMtKqZHuv2+7saouF8vNVesO2T
   h2CAhyV59hbWHXNE37SsPhL0rM4YeGjMwfuA3xOfF1NyK/dUUX7h0PYW9
   hQUdcBixofhI8dIIXEyxV4HPPsLnQzFEQXw3nVkwEFsqew7JLLaRfnp3Q
   lqCl10DNp/MpsPdPx0bUcDTKokXM142s/bxG0CsxVKm06VPhyE9TgEmYO
   Bnnqk7nA4biAkLB5X41ezj0tDoN2z/6hlpWMT2u88wfjxoz8bqrA1Ec02
   Q==;
X-CSE-ConnectionGUID: EcTQbqzIRmKGjvIHUubcMw==
X-CSE-MsgGUID: ORAX9wRvTMSc84NBR/Hxfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69155759"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69155759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:22:03 -0800
X-CSE-ConnectionGUID: TsFx6u78TY6UCz3XywqF0w==
X-CSE-MsgGUID: 2JUM4WgaQSqynNphX+DaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="226275718"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2026 13:22:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEV5-000000003Eb-1xGV;
	Tue, 06 Jan 2026 21:21:59 +0000
Date: Wed, 07 Jan 2026 05:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are
 not supported
Message-ID: <202601070505.xQcLr5KV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: c0087d807ae86cc82cc356e366d2dccf0e3bb225 s390/vdso: Rename vdso64 to vdso
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-r112-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070505.xQcLr5KV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070505.xQcLr5KV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601070505.xQcLr5KV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h: In function 'mm_cid_get':
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
     struct cpumask *cpumask;
                     ^~~~~~~
>> arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/s390/kernel/vdso/Makefile:54: arch/s390/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
