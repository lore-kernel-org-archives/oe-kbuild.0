Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ECD361DCB
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 04:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086812; cv=none; b=KfuIGxpLtte6RZ2h4pGj5tELdgtFNHbfAyvuBYKNVIM+1y99ogkEVmYQm8BtyAbJzZiRDLN3mEgoaY/MQS+AdyMx20OunMbOQ96uXQcVrsh6RZiCLK59D/jiubTmu5djfZdzUcy2R3p0AJuRHqg1zIxiydEUqLjuswyjrZCe0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086812; c=relaxed/simple;
	bh=9UgKOrFfYCWTYE5SLgUOhi5WcRLH8s45kLn5TpCNWmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlLLhujZM7ZCx1uXfhB3ZAK/8SnvUd6WaXGCAabRFwaKR0zakTaFtsYz3lo+S9UPEDzFOssIPg7wQDHo7edvdni1eQo4WrOS0S1QprC5D3dM2iX2mqZKuZpOQfg2QCvGXaNMSw79sSxKxV/Z/cq6plPkBaIW8/1AUyBk4g3FJHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aH7iZ8X2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aH7iZ8X2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791086810; x=1822622810;
  h=date:from:to:cc:subject:message-id;
  bh=9UgKOrFfYCWTYE5SLgUOhi5WcRLH8s45kLn5TpCNWmU=;
  b=aH7iZ8X2v/G/qjKX3Z7UU2S8FjBhVnw/7qjJ9KwgE7pLVPqHskkz1Zxw
   +F7BQftLiCsKmZW4GDZCRuEWTBH4tlLTlI2Rez99YSiALD9UBkFj+EkkY
   KfBtCjR0njgYn3zI7dQCuKNrMZma+CewpLhvJXQNvmcMNQZxmx5uKfq4p
   qFM1LdR5p8H/N67PklS2mi7K9tfihTOgBeTCrtLfaTUJW8FUBtn7rMBi4
   H7QUfOiCs9FN4zyNKcm873zZ9bt/QUMCUoMe2nP1WZuraNL3rXWA7vYyv
   B5bWAk9wPog7UibluRj4ygr12vi/+EJW/sHa/phfi7+WEYZdjUHwrGlr3
   A==;
X-CSE-ConnectionGUID: FEoOjVlLSXe7lmKDo2IJ6Q==
X-CSE-MsgGUID: uA1CnKHJQ16h7iDIm54kaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94282559"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="94282559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:06:46 -0700
X-CSE-ConnectionGUID: UDjjrVhwS9GroAVhjj8+Fw==
X-CSE-MsgGUID: vthpcmoWRmmKLfRG/eQKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279798779"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2026 21:06:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDUp-00000000URT-0Bmb;
	Sun, 04 Oct 2026 04:06:43 +0000
Date: Sun, 04 Oct 2026 12:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON
 failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
Message-ID: <202610041125.0hFLPRMR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512, commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kairui Song <kasong@tencent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e mm/mglru: frequency guided workingset promotion (MGLRU-FG)
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: parisc-randconfig-1001-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041125.0hFLPRMR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041125.0hFLPRMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041125.0hFLPRMR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'lru_tier_from_refs',
       inlined from 'lru_gen_eviction' at mm/workingset.c:251:13,
       inlined from 'workingset_eviction' at mm/workingset.c:415:10:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:149:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
     ^~~~~~~~~~~~
   In function 'lru_tier_from_refs',
       inlined from 'lru_gen_refault' at mm/workingset.c:323:9,
       inlined from 'workingset_refault' at mm/workingset.c:568:3:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:149:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
     ^~~~~~~~~~~~


vim +/__compiletime_assert_432 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
