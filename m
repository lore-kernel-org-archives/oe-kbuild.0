Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74422D0C72
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783381029; cv=none; b=KtMJO2cuszFHvJ+qb4aljR9M1lqBnFfMPPC8rYd/6PSbppjS0wRc1sxrbrH4hCC7hRBjoFYKpsmyEx3G5BqmofmY82RKUNYeQ9r+4nuAtG+vz4btkdJLc/uT6eofl/S47hi4fRCtPzaRqFrknN1xo/6pzAtoFCBUU4pdUuiuhWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783381029; c=relaxed/simple;
	bh=A8LK11Fp7vo9CzJtkt+RUOZ1EnZVJh/TmPR6uUB39gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zhq7kRsY6pa0vC5vF0OQeIMSmqHKU28q56SZxlgMkHbo8iIYNhWcTmJtNz0Bcadgtw67QoEBRGWOp0Jt8plTroLJLu6TpOr4KdE3AjBZvtnAHt7Fy5wIe9JGAIBs/WKq3dYPg8PXOGyTraORLJf+I9NUymdSfZjXLUC8JWnPi6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqP0UgT6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqP0UgT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783381028; x=1814917028;
  h=date:from:to:cc:subject:message-id;
  bh=A8LK11Fp7vo9CzJtkt+RUOZ1EnZVJh/TmPR6uUB39gs=;
  b=ZqP0UgT6hhCdzu4IVr17J8PG409j4ulXTrBn8/zyeQCY4TPd0+vvdiPc
   vRGxKnADNeyv+/R6p1tf5EY7COYRyXI+sgVEMpuoLALu+C2HTzv0j4pxq
   TL/HmBfHsH5HOoojJK8/RYMGNH+TfYNxNyxCqNFXpLgYYhuIjS2FT/UVT
   EGWUcc3MTsiu4IQZeNwWs2KXm6PM2ZiLK1bZEkzA0HyqOaAqLpXr91a6L
   EeoacYKNrAd/56ku0pz3+1Rn/OiseMm4AvMoBTwxhglyavHWpppq3izaH
   MJb1prHF3GQOXkTDPrS5IJLo8yu5/FEDzziMOgFDvJPuY2OpUyLJ/3vjh
   Q==;
X-CSE-ConnectionGUID: aew4D+ajT/unfQlfMAylbg==
X-CSE-MsgGUID: FvPYUV1jSVKrSlniOwZr8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="101444875"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="101444875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 16:37:07 -0700
X-CSE-ConnectionGUID: Jh+xlVKkRx6+Ns7aCdDZ5Q==
X-CSE-MsgGUID: hvZ2Q/2hSoqRqPfRpdi41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="254487872"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2026 16:37:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgss4-00000000Eqm-1jEQ;
	Mon, 06 Jul 2026 23:37:04 +0000
Date: Tue, 07 Jul 2026 07:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are
 not supported
Message-ID: <202607070740.ljFeaO89-lkp@intel.com>
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
TO: Ian Rogers <irogers@google.com>
CC: Thomas Gleixner <tglx@kernel.org>

Hi Ian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: a339671db64b12bb02492557d2b0658811286277 vdso: Switch get/put_unaligned() from packed struct to memcpy()
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-002-20260707 (https://download.01.org/0day-ci/archive/20260707/202607070740.ljFeaO89-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070740.ljFeaO89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607070740.ljFeaO89-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/riscv/kernel/vdso/Makefile:61: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1 shuffle=442907691
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:160: vdso_prepare] Error 2 shuffle=442907691
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=442907691
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=442907691
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
