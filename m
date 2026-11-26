Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667020;
	b=fLuQCrR2CGf0sGF2kCSd2LR8tzB64DP5412MIvgBwscyu+EigXFeyTbgtmtjVtm9aGJB
	 7DTUVYBf2bEuYFzQoLXJ0ub2y07qTN9WNmviJNH893NxEyxR6tPjaRegSYTyyW4OE0o1R
	 Jj7C6Fr1Z/Ia+6VwooJ7IaL+tsIG/BgrXbhTiOufjYEbMxwnzkDU4WAglONSbQqCDXY4s
	 gGhZ4dGzwWqFa+BUxDBR6MMUMEb0WZQPrOO1sGMDqgpqzCu4sJ1uk04ae6ACzYaOKR6WM
	 nojakICGcCtDXB+2uthLS93Evm3GHFm9VpbIwEc8DoxvZx2HJg8TB8awMqlf10g01Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=b/0pHL4tlUhGKp8GYZVAJ+rZxpmAc+oGZhfSla5Zxvo=;
	b=uvGaC9gjA3VC/mk1hOHH0dn2oDOWOm6K0hRecPrN9tc9OAVza8MnRdDqqAQmuCDdFJaA
	 Kx1Fc6GbYOsIMvx1nedBPVSY0AwYoaK/e1FdPCgKZa93Je1m3s1f0fmQspXe5AkB2Y8Oi
	 MGkD7bN4oEkrajmdo2osI39N1/hg93Dxc/urNufq68QagS8PCJyrI11nTYqJkjKcMex1i
	 sCjVw3f162ZzBtjpmumZVeKN0E+hzGSrVyDw2y6w+inG+boCQAOIKfH/7mcD/1CC2Wuzl
	 53w0nVgAAThcdDtkl4A6bw87GTvO+mkq/w+vEaeo7R5p/iz0JTolOXViYM440rKaEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ509A7y;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC1606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 04:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ509A7y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667020; x=1827203020;
  h=date:from:to:cc:subject:message-id;
  bh=ZrfXqfWTIbqpoHVDJgPCnuibjE+3qWmrcYJWKq2rnPE=;
  b=PQ509A7yK2QtWn/yQEJihTEEurDvkn0874GaRAMQpQdK9qvGcSovejrA
   5uv9WTX4W8IfCVHe3zLvLU8XxCRzcldRtdcumLNXpvJux+J+qpp7aMozu
   uOUCqX4H7SaKgejnclWMgkk3G/GAvQn07oJpiPesp8vn7E3B6VPUhzguq
   EHM8hktcwNdntfXo+iNzZBo/Pb7jSpqYsTzQM+94HbKgDR0JaVKFFvBmH
   UJR8OZZi1B80Fn2tntcXxrxPnewmADzUdGgGI4YZXVW+brQZ+AXiTyVkU
   97hWQUiOmSF6vLC8Uei3dXIKydGzyz1ZMrFl3n+UnlHnQRMd4idyy6DFd
   g==;
X-CSE-ConnectionGUID: gGbkTMT4QiSEZx6nt5aijg==
X-CSE-MsgGUID: VKre/M/zTfGluCTaoDaxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4556989"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4556989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:23:39 -0800
X-CSE-ConnectionGUID: GbzlKG+4RbqozFX8UY1Fjg==
X-CSE-MsgGUID: h0YsmLxXQXaorSUsxf7k4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12208766"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2026 20:23:38 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWR1D-000000000EB-2sMz;
	Thu, 26 Nov 2026 04:23:35 +0000
Date: Thu, 26 Nov 2026 05:22:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: loongarch64-linux-gcc: error: unrecognized argument in
 option '-march=la32v1.0'
Message-ID: <20261126051756.6SHWeXmh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ebb7a8dc1e74c705daffe11c2faf38ec2628f838
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-2000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126051756.6SHWeXmh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126051756.6SHWeXmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126051756.6SHWeXmh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: la464 loongarch64 native
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: la464 loongarch64 native
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=7465291
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: la464 loongarch64 native
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=7465291
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2 shuffle=7465291
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=7465291
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=7465291
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
