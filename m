Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70D33A70E
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808411; cv=none; b=lkiMz/VdTLaCYY7xabijW57QIYJ6JjiVA+mcMP6i3at2XvonDMm13GiG2FcWIo2l/E09EessFHGbmfNNgOUDfQ7f3CiWoAQBSY2lGV0JEFEFzhKUlYjQBOW46m91t7wfezXlu2U2x3x5Mr1VWHEdxpaMnQvj0DRcE4boqUdUeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808411; c=relaxed/simple;
	bh=2X+iFusLDK9fTALfK0ZaZOtFt0I0QoxISuUkCAjiO3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QM20S79lXyuyD1SCMzYMHhyBxIUnErl0jk+sYra6OALWaumUD2cK2aWlUFawz2KKgk5dWBsHFxHEptUHyW6WskwdcCYm3QVKRfoWrYcfovo7UTOPGhIqY9VaPV5/z2Woq/ZTgfvvocXUMgEL1XphZAGD6LGMKBJAojykBfc7kiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8BzN9Nv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8BzN9Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772808410; x=1804344410;
  h=date:from:to:cc:subject:message-id;
  bh=2X+iFusLDK9fTALfK0ZaZOtFt0I0QoxISuUkCAjiO3k=;
  b=W8BzN9Nv9nJaFohqVW473juoQJWymA4KrX66TPp1cjx7+r6vdGOZLuFm
   wajqxG/GZ14hTWZPCq1JnzRqkQbjHxpX59+L3JoHe0cmLrGS/z+756lhH
   2bdmyy96SN+wVX00OOma3vjOOh6dorrbCIN5GhCpUuzyQFhpYCsDJ8mlr
   vBlMqkyLVob2LmBrzkoae2tJ4AOtqKsCE/VQVxirgaP1il663SCJg+aGd
   efhDQ0c8zhbpy36dVH/1JzNUgnbsNL/VvwWhVy9dUudjsGuahMIOhpPWn
   ULjhAPCF6vme8JwVFGiOZFyPj4hmUzT6HBOuJRAfMxaCOrMQSUKfLiyZ5
   w==;
X-CSE-ConnectionGUID: xmfe1HGKSxO85z9S2aICtQ==
X-CSE-MsgGUID: F0xesItRR8u4Vu+3PfuGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77786986"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77786986"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:46:49 -0800
X-CSE-ConnectionGUID: CdTXOHfSQ9S70BR3QPoYvw==
X-CSE-MsgGUID: Uuj7A7KRQfSY4SodDcpb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="245303192"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2026 06:46:48 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWRy-000000000xH-0CNN;
	Fri, 06 Mar 2026 14:46:46 +0000
Date: Fri, 06 Mar 2026 22:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/u64_stats_sync.h:84:2: error: call to
 '__compiletime_assert_620' declared with 'error' attribute: BUILD_BUG_ON
 failed: len % sizeof(u64_stats_t)
Message-ID: <202603062206.FySwRik2-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: 35710f0db8011e7ebbfb5b929a0575c3a09b761d macsec: fix memcpy with u64_stats
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062206.FySwRik2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062206.FySwRik2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603062206.FySwRik2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/macsec.c:13:
   In file included from include/linux/etherdevice.h:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:17:
   In file included from include/net/netns/mib.h:5:
   In file included from include/net/snmp.h:42:
>> include/linux/u64_stats_sync.h:84:2: error: call to '__compiletime_assert_620' declared with 'error' attribute: BUILD_BUG_ON failed: len % sizeof(u64_stats_t)
      84 |         BUILD_BUG_ON(len % sizeof(u64_stats_t));
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
   <scratch space>:7:1: note: expanded from here
       7 | __compiletime_assert_620
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +84 include/linux/u64_stats_sync.h

316580b69d0a7a Eric Dumazet 2019-11-07  81  
df153517e4d440 David Yang   2026-01-20  82  static inline void *u64_stats_copy(void *dst, const void *src, size_t len)
df153517e4d440 David Yang   2026-01-20  83  {
df153517e4d440 David Yang   2026-01-20 @84  	BUILD_BUG_ON(len % sizeof(u64_stats_t));
df153517e4d440 David Yang   2026-01-20  85  	for (size_t i = 0; i < len / sizeof(u64_stats_t); i++)
df153517e4d440 David Yang   2026-01-20  86  		((u64 *)dst)[i] = local64_read(&((local64_t *)src)[i]);
df153517e4d440 David Yang   2026-01-20  87  	return dst;
df153517e4d440 David Yang   2026-01-20  88  }
df153517e4d440 David Yang   2026-01-20  89  

:::::: The code at line 84 was first introduced by commit
:::::: df153517e4d4403d13d603cccef68255783d396b u64_stats: Introduce u64_stats_copy()

:::::: TO: David Yang <mmyangfl@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
