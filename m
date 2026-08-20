Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8878409613
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219438; cv=none; b=utPd1ayJvxuKKONR6R9vmjJ+EY0BiQ6cE6AorOyVldjeHqvULb54u5WIIX5EPQeqFUUVkBHrIKygftbg2chWOHqPR4Gb2XU3TH+Ei/C4FdtkkHprx6qZrfFkwWAQJXy8YIXaCacQuDEz2OPdcYskPYab5Md5N6uB3hlJK5liVP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219438; c=relaxed/simple;
	bh=4y7hoqxiorWvFUSQ+QXh9z06PT4PJNTtnDvzkhkt1Vg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bAZrqVNjjBtJAi6ndEhQM6fK2q1rQlyybigtu5ZvqroJMCa8o0hApINJNZYiaDHO4jqVJCGjOcYR2iqElVwPF+2qLAkXPw3HZOK1oF3JdKhdEIXE6UWl3+dT+aE2KM7ZehA3w27arJp4ED9+5yMoYm8YYpvBkETsTY1TPKVObdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJqJOD+g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJqJOD+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787219434; x=1818755434;
  h=date:from:to:cc:subject:message-id;
  bh=4y7hoqxiorWvFUSQ+QXh9z06PT4PJNTtnDvzkhkt1Vg=;
  b=JJqJOD+guFEqzgcdUUIqicMM4YXDnO/E/LD6KCTf1g3y5AN+Du0UY/3P
   gS10dTnNn3UzFVWDg600UbzjN1mGVd4He5C+9fo2/TqfafGelVR/FPoeZ
   WQDHVsGpjXiah5tFoPk+F4JUGK+Dz3OLBVXtLTfYYI6Bc3QtceFVrhnwJ
   JAROaXtGQ9ca6N/LNAEotgMGYeKhVchk4HxEOrgmHFt98e763JKlT4axS
   maWaQtlkY7xRxRFD4U9mm2bW2C8bGtIioab3GETt70x/DMNhgd0D4IgJz
   WNgtMYhcXCqdcQyIb5vsoaZmT46764SWcWstKsUXlaCnBWy2KrC+FKa+b
   g==;
X-CSE-ConnectionGUID: aXAAAU+yTaWSgADMpVqISw==
X-CSE-MsgGUID: TL8QG7Q+RQCFj4TVllECkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87513013"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87513013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:50:29 -0700
X-CSE-ConnectionGUID: dAfAlM9QRaWzzIZXcMWrEA==
X-CSE-MsgGUID: zdUsFWQkSUWKy7EzbIXdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="262179635"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2026 02:50:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwzPm-00000000ibV-1ajw;
	Thu, 20 Aug 2026 09:50:26 +0000
Date: Thu, 20 Aug 2026 17:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target CPU 'la32v1.0'
Message-ID: <202608201754.T3ir4GYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r064-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201754.T3ir4GYE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201754.T3ir4GYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5643c6b2c830 ("LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608201754.T3ir4GYE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1372: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
