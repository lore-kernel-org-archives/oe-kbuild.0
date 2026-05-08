Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB53D8129
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265024; cv=none; b=bnKMwPYnarC8xbRg5vcb2l9vIbBiCzd9zf6G+pLqQ7BpMc5g/UKmPue6q5r7748a/z2h2552HujCu0zhUZxg1HNdQIGyRlarI/aJOExwKkLVGCrzeXHkHWwakoI0Tp9wVys3Mo2cau5AXq9U3m/nFO6UxL9XM/sPkRIf11YeH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265024; c=relaxed/simple;
	bh=6c2jt3pt/ZHrRGSsT1hXEVMewr0lbXeebqIQ2ubPmyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xok4H2Ta0iySEJaN381mWmxK8FNhsq3JYDjjtAJoclAlTlFLxwTmv7J9W6JU6iTqG576wpEWoh023JxKkGiY2VvgvlWJXEjkQGWWxdmqnSWVS1m10iVTIJcN0NP1o6pLXDabMFHdMVwCCOK5kh1MLt616an+aOTJdBMW/UzRlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chxDPRTc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chxDPRTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778265023; x=1809801023;
  h=date:from:to:cc:subject:message-id;
  bh=6c2jt3pt/ZHrRGSsT1hXEVMewr0lbXeebqIQ2ubPmyI=;
  b=chxDPRTc49xvkqT2Z4/hnVKeug+SWcqZa6vin4YSvumf52dgJ+QHd03d
   y8rf6fxyPYMX26kZQPaKc4/jz7AJNkqTgSwRLBsn+KWH6Ubsf5TczOc4R
   zunK8xfU6gGYW4wm6B4PifNVC9xDSXcl2lEYx7vU4qSlMWsNzCf9dldMJ
   Topest6r1MwTJtK5PDDOpDdAY3Lx5LYkeODAF44bwiPMYrZMLB46vKad3
   L34L+D9oDQpOI/LwieUxeTP9+0noCj0NLVd5yXx32+eneNlMHeCFQu6Ed
   wRbiPihqL2hOz0laCQhouuKs3/HLCqRvphnV2oa3VQ4pXKxoq1xAl04IZ
   Q==;
X-CSE-ConnectionGUID: YxH3CZAkS2mmvdKRRbECqQ==
X-CSE-MsgGUID: mXmYx4IwTKOE76Y42Tg19A==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79232893"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79232893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:30:23 -0700
X-CSE-ConnectionGUID: 9cBhFK0FSuiqoa+Mk4/Mpw==
X-CSE-MsgGUID: 9GpxzTumT/uTqKlQYZJ75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="236961040"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 11:30:22 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLPxr-000000000M7-1Pnn;
	Fri, 08 May 2026 18:30:19 +0000
Date: Sat, 09 May 2026 02:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target CPU 'la32rv1.0'
Message-ID: <202605090223.jyTPzBbb-lkp@intel.com>
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
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
date:   5 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-002-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090223.jyTPzBbb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090223.jyTPzBbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5643c6b2c830 ("LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090223.jyTPzBbb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'la32rv1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32rv1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=4078331999
>> error: unknown target CPU 'la32rv1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=4078331999
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1372: prepare0] Error 2 shuffle=4078331999
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4078331999
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4078331999
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
