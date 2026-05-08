Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00353279798
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 04:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213230; cv=none; b=gAVgqPtaRwFSm/3xAPhn3Galr/U04n1exVJqjzHxNcM1x+VUqF9fzREEX/GB1mBHVxEPl/WXV3phsn3v9WbEowhF0ZUgWbAiG1P1WDWHWjU+MqLIxst9qXTsvmqcr/cr/1h+uc0oYNDCziAG7bpzL/I4aj0Gc/I+NT9nJ92iPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213230; c=relaxed/simple;
	bh=3nIbYOjHxhC+ltWaHQaJs/gjQc3sL7z/RDxGm9OGC6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=itwwIwCTPozyJx59GCForVbrHG6F99vFjOSR5qKa1V9A5tGBCq4EPmjaAQhZ+XaNcNoTF2VUjXts+nDSR8Ki/RAgZbECmnNyGSXH10k2p53H26PWuSwxyZVJbTHqMHum4XjvqHb3xlEsW56vBrkBXb0Uu3hgYK/jEWg7+jwrRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhXlQ1dm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhXlQ1dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778213228; x=1809749228;
  h=date:from:to:cc:subject:message-id;
  bh=3nIbYOjHxhC+ltWaHQaJs/gjQc3sL7z/RDxGm9OGC6Q=;
  b=fhXlQ1dmpeXOUcfmK42y8lxsu6MOTPePCUW9Tp58rgnozo95hSrF6IL8
   90AbAOv5X+Va3eBjLNwZT2HNqT3iPhrYDsCDnsFAn1wahYfcFBZEPsjhq
   JJdxN7Q+7Z6lEGGkEJqLM6DgrHEM2Ud6E6vBZjOD4YTWZnf6BhPS1wufE
   h5pJW/HT+wh9Wsw5yRHwAJ0/ZAG38w8eme0hMxf/bopjZlh+3YoSSxP3q
   yrKNuqtx62Ipol36RzQDgEgvR50j5Te7nOL3L7a7JxtWFxJVCZkmDf1ck
   OtFibRLENg9s2VMAWT6Mhwe7zGEYtDML/lOcmSAnRiSxt1GdSSxfKc4Mv
   w==;
X-CSE-ConnectionGUID: Q5IStmYuQYyIaEjUzL5N4w==
X-CSE-MsgGUID: lFAviL/JRZO6gvAlJ+84+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79115097"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79115097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 21:07:08 -0700
X-CSE-ConnectionGUID: 38LM2YWUQxmjjbZHE3nPOw==
X-CSE-MsgGUID: 6anEgNu9SP2DSPlUXY4qwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="274780403"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2026 21:07:07 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLCUS-000000000ln-1a6u;
	Fri, 08 May 2026 04:07:04 +0000
Date: Fri, 08 May 2026 12:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should
 compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
Message-ID: <202605081203.pCn453Ej-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: 0d64a24ec0c02f75e5068065b503d98e10a60d01 arm: move the XOR code to lib/raid/
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-r122-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081203.pCn453Ej-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081203.pCn453Ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d64a24ec0c0 ("arm: move the XOR code to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081203.pCn453Ej-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'

vim +9 lib/raid/xor/arm/xor-neon.c

01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17   7  
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17   8  #ifndef __ARM_NEON__
de9c0d49d85dc5 arch/arm/lib/xor-neon.c Nathan Chancellor 2019-02-02  @9  #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17  10  #endif
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17  11  

:::::: The code at line 9 was first introduced by commit
:::::: de9c0d49d85dc563549972edc5589d195cd5e859 ARM: 8833/1: Ensure that NEON code always compiles with Clang

:::::: TO: Nathan Chancellor <natechancellor@gmail.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
