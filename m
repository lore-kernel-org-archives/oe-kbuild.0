Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB43446C7
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Sep 2026 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788583433; cv=none; b=NM/LJ08J4N4YMshNk8MgyFEHHMpn0+UeQLl4TV1mYcBXeY7MozzZLQ+OGnwaW3jcVeoKvBptiCAPbe0T0QBBA+F0vvTm4lb9EcuFqQsy989pLGwDZK+uN4LYrNAo4bFWthXxo38kkazigGx26tb8GxRnR1tfabgOAtGiOvx7lDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788583433; c=relaxed/simple;
	bh=9Q7D50UtmIE1GPf199fCaxfuW859WDMZtjNI8ZufmKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=umU2b7+1O+7t3aC/q/1Y9mTTr1dRpwxR6j+LOqqFhYHh0N/v/1rCFSWMwtzHoW5y1sNMX9JM1MTKXiARQOjFY/h+7tgx+HCs4dJYdUIwGEONCIwo8QR5DRq/BP/Y1jydClX8k5hiOgrubTxNyZe999P75VO6PcFZZO+kA9GKOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kb66eZNd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kb66eZNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788583433; x=1820119433;
  h=date:from:to:cc:subject:message-id;
  bh=9Q7D50UtmIE1GPf199fCaxfuW859WDMZtjNI8ZufmKI=;
  b=kb66eZNdsUcPHfr3DetjSnu6kl91gaHymAKKW+8VFI/ks19cePMoAhZr
   Wh+pdiCvvaCo7MIiGOfg73giYEbQU7UiRttoG4FwrVMlMLXCq1DFhKYXt
   1z9D9m6kObMtNCdLUMaeawC6NF3fatzzAkv25aQB0BrLEaJApQiINyztT
   lROMBQzYwkFt0G9NLdwd5pToujbxmUmwwnLrar4fGllOL2Ugp1FtLJVuE
   wAD/5FzjGVtEKHaJkLcWkjiQo19YD98heQoOFbfdFFTOA/xHc6tAagvVL
   3Q+p668wwb0J82DtSnRxt7z3syxhHZRFtfZA8UX6/RFp18LRgRlsyqWpR
   g==;
X-CSE-ConnectionGUID: 8KKPBgPdS1CRU1Aq6yqiag==
X-CSE-MsgGUID: eSbN+gnGQzCenhP2ofnipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88928903"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88928903"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 21:43:52 -0700
X-CSE-ConnectionGUID: LOb6OsmsRPy+iqKp5Sz//w==
X-CSE-MsgGUID: hJNUH0YOS8CBM52dgddQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268903889"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 21:43:51 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2iFo-0000000001x-3f79;
	Sat, 05 Sep 2026 04:43:48 +0000
Date: Sat, 05 Sep 2026 12:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target CPU 'la32v1.0'
Message-ID: <202609051229.DDMe3oo5-lkp@intel.com>
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
head:   4d7d9486c04d917265f64c55bd23b2cc4fe7749c
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r054-20260905 (https://download.01.org/0day-ci/archive/20260905/202609051229.DDMe3oo5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051229.DDMe3oo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5643c6b2c830 ("LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609051229.DDMe3oo5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
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
