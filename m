Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706341684BE
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782510543; cv=none; b=Wqu3r4lPS3SZJEE6fKmdtTAaiVZFTbK9ogBI/F9J1p9kXobvE88JA25zHS2SD2i1G4htkNn1R9qxPhS0PXbEFX+/0zSM+UlxE1VBlrh/rA4LJ9Zh0nNn5q0CRA2uSzIqUBS8ydEyPVH+/Kx2ZqeZ7Im6fD/1UjQTgzuzdEotwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782510543; c=relaxed/simple;
	bh=NCQBCJz+OsUD0L8IXWjXtXClK914AsusIvJCANJhVP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TgMwk5XefrOItAOccFrj2wClegLOaPulJNtw3CnTO+/84WzSfG1zUqnTvEn3cIuamsAU5BaJUwruDqtplv+wLP+pcbIe/m/h8Jq4vv+/hq3RC4SorfqULoc8/Bzj2TrKWv2uMjvav7vNXo7tbcmRVD80j73XppKslkY4cXPdPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmlbC5SE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmlbC5SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782510543; x=1814046543;
  h=date:from:to:cc:subject:message-id;
  bh=NCQBCJz+OsUD0L8IXWjXtXClK914AsusIvJCANJhVP8=;
  b=fmlbC5SEF9KMEVGCLkHOHg21ncb/xo7U+6RASuwnN6iY5E8Bi7g3CJuN
   c67Klb+5t818ZQvOh8iJdUnb7cq6Fd7QaLxKKUSZzqMO93P9H/oAoBCxQ
   9DdJFFk+ixkXaFzkXJnh9+8LVnbbVn5rfaIwJtwGkLopEBZ1BPeF/BAsS
   dbRTK6OwISkdmtMMFQtPWZVsHe2i4KRdsT+3wMQX99CbPRaXu3ehY82W1
   NE7wwQmHKgb2Wn6627nuEZpW5eOUzf2KuahEzlrv3I30Be1bJ8CvjY7kF
   NGxpzKR2DEvD5awvpw3L5Nyf32hvK1+QK3fDELLUjkvrTwguwm693DFiB
   g==;
X-CSE-ConnectionGUID: JMmtE9MDQjCnzCwnKC3YrA==
X-CSE-MsgGUID: UdvB4ojhSFyfYvsZlKtyKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="87212220"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="87212220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 14:49:02 -0700
X-CSE-ConnectionGUID: Gb2kUP3NR4uCR0dZE8armQ==
X-CSE-MsgGUID: 9buM8LybSb6d2HfM1s0Oig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="251034916"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2026 14:49:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdEPy-000000005SH-32qO;
	Fri, 26 Jun 2026 21:48:58 +0000
Date: Sat, 27 Jun 2026 05:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/u64_stats_sync.h:134:2: error: call to
 '__compiletime_assert_522' declared with 'error' attribute: BUILD_BUG_ON
 failed: len % sizeof(u64_stats_t)
Message-ID: <202606270515.rU0tiCwZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Yang <mmyangfl@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dec87d0b195463fc4ea4b0817d3049630aebf3d
commit: 35710f0db8011e7ebbfb5b929a0575c3a09b761d macsec: fix memcpy with u64_stats
date:   5 months ago
:::::: branch date: 81 minutes ago
:::::: commit date: 5 months ago
config: um-randconfig-001-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270515.rU0tiCwZ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270515.rU0tiCwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35710f0db801 ("macsec: fix memcpy with u64_stats")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606270515.rU0tiCwZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/macsec.c:13:
   In file included from include/linux/etherdevice.h:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:17:
   In file included from include/net/netns/mib.h:5:
   In file included from include/net/snmp.h:42:
>> include/linux/u64_stats_sync.h:134:2: error: call to '__compiletime_assert_522' declared with 'error' attribute: BUILD_BUG_ON failed: len % sizeof(u64_stats_t)
     134 |         BUILD_BUG_ON(len % sizeof(u64_stats_t));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:631:2: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:175:1: note: expanded from here
     175 | __compiletime_assert_522
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +134 include/linux/u64_stats_sync.h

316580b69d0a7a Eric Dumazet 2019-11-07  131  
df153517e4d440 David Yang   2026-01-20  132  static inline void *u64_stats_copy(void *dst, const void *src, size_t len)
df153517e4d440 David Yang   2026-01-20  133  {
df153517e4d440 David Yang   2026-01-20 @134  	BUILD_BUG_ON(len % sizeof(u64_stats_t));
df153517e4d440 David Yang   2026-01-20  135  	return memcpy(dst, src, len);
df153517e4d440 David Yang   2026-01-20  136  }
df153517e4d440 David Yang   2026-01-20  137  

:::::: The code at line 134 was first introduced by commit
:::::: df153517e4d4403d13d603cccef68255783d396b u64_stats: Introduce u64_stats_copy()

:::::: TO: David Yang <mmyangfl@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
