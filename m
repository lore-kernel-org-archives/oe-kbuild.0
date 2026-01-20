Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EDB186A
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 00:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867528; cv=none; b=kWcBnjYgKpQMuPePhYSYvgG29q2z/hQ3rvAOSXb5+BoCS4vfYX1BjC9pUoBqEylsQKS5vG1dwk9kUXFNOodKTHzpY9i+6tdZhD1jw5Wsbx1z8zK3FlOJSJ4iIdZRA2y+b9m+TU9bmDLhZ2k/hgsdrmY3AUgU6Zu6yhw9JRgMzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867528; c=relaxed/simple;
	bh=f6UnK9PFdxVwCY1izB0Ql7wcXZ5cbSfaoVeXJxPYGiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANy4FnVtTmjlH10eiXk4XTK7dYuzmULm9Sc8miikAQYMVOFjP0p9ZGOV1R5LCUqsGKAeyxAle/Fl5HtEbkS4JAJuPD913qKvvT6ouBMdAS4ZpQgM2YpGAJqhX7dvLhiT1RfhoZGGPNCPLaiGGLguZlEzJJl8qookRmPyF6hxMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMo2pSmQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMo2pSmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768867525; x=1800403525;
  h=date:from:to:cc:subject:message-id;
  bh=f6UnK9PFdxVwCY1izB0Ql7wcXZ5cbSfaoVeXJxPYGiE=;
  b=iMo2pSmQbr8TELOxiBn2A9bfl92aVUUSRyAoTOyk2sOghIOhd6EHbWqt
   qHPPh6kauOJgcUYGX8xaFisF8dELxTT9LGAc80fbJKMAI/+a1BUGF6kq+
   fWqv3s4UrfiLdzHmhJiCicDd7xhcUB+RfphCyLam/og0AJ9ALLZjkTlwH
   /L5tBOeFUj7NZ0JdroAggfKfiL727d+UOivq53WD0U2yarCUX1iuYyrfK
   dpiQeuf7ThHknn6XV1+bhVFy9SJMlXBlKx1q9cdnDVGOBAvH0KrePDMYa
   BFTDAmjlNZT+HnzI7FKJOfWkYqq/FDBS9urgV1GFbJMq06ntPyNZP3jDH
   Q==;
X-CSE-ConnectionGUID: g3ztrcV7Rf2/PQutcooFzQ==
X-CSE-MsgGUID: 7twag0P2T1ONJI1x/ZKz8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69085714"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="69085714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 16:05:25 -0800
X-CSE-ConnectionGUID: 0U6GYwgaT2Khcn7H+ich6Q==
X-CSE-MsgGUID: Sim8dzV5RRiqHa8eeL8yUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205877039"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2026 16:05:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhzFJ-00000000OP1-3Rjf;
	Tue, 20 Jan 2026 00:05:21 +0000
Date: Tue, 20 Jan 2026 08:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5545/6121] lib/tests/uuid_kunit.c:104:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601200750.sFxLwOJr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/uuid_kunit.c:104:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ryota Sakamoto <sakamo.ryota@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 67cb8b4501b4d2709c720dcd31d6984f6c8604ea [5545/6121] lib/tests: convert test_uuid module to KUnit
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: alpha-randconfig-r121-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200750.sFxLwOJr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200750.sFxLwOJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601200750.sFxLwOJr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/uuid_kunit.c:104:1: sparse: sparse: bad integer constant expression
   lib/tests/uuid_kunit.c:104:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/uuid_kunit.c:105:1: sparse: sparse: bad integer constant expression
   lib/tests/uuid_kunit.c:105:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/tests/uuid_kunit.c:106:1: sparse: sparse: bad integer constant expression
   lib/tests/uuid_kunit.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/tests/uuid_kunit.c:106:1: sparse: sparse: bad integer constant expression
   lib/tests/uuid_kunit.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +104 lib/tests/uuid_kunit.c

67cb8b4501b4d2 Ryota Sakamoto 2025-12-15  103  
67cb8b4501b4d2 Ryota Sakamoto 2025-12-15 @104  MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
