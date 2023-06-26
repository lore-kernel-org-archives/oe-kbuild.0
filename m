Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743046BA
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687776908; x=1719312908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QAAkMdDRjKqGMkatFpHE4M6LUx5vQyyvUv/b2UGcOeA=;
  b=TANyf6Sf/TPa5nFKz3jP/JGDkXXu+aVwZuukfu6aK3u2ZD2mPdm4qN96
   KiEdJnhaS933nIe1QePT7cXvci+nWZGDyNikebNIvfN8hRGkTD6pFfceU
   6EqdfI3kiLtYEmfe7MWkwB2tDtDbwl6VlAO9b1SL7ZiMAHwrztoZmuH2C
   fgmDVf6ansq4bu62GsD1Vbhe8x3ovzIrMeFLu5698xZztQVQCrqA9ZRmQ
   l+3yTTSe9ymua5DyCIH4dYA9sxUapC+yQC2uYqaDqkpgp8+KKKnb7W/w0
   zALx+rBjb8Gr+qACMc/2D0LxjgcHGGsawEKU8LLXr7t2XzLVAdfn8r6Fb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="427231918"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="427231918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 03:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="890244130"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="890244130"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 03:55:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDjsA-000Aez-1G;
	Mon, 26 Jun 2023 10:55:06 +0000
Date: Mon, 26 Jun 2023 18:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_386' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(mstat) > sizeof(skb->cb)
Message-ID: <202306261838.EVIyaUhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_386' declared with attribute error: BUILD_BUG_ON failed: sizeof(mstat) > sizeof(skb->cb)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6995e2de6891c724bfeb2db33d7b87775f913ad1
commit: 021af945997ffaeaa37c9673d71afad7cde6bdef wifi: mt76: mt7996: add eht rx rate support
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-r083-20230626 (https://download.01.org/0day-ci/archive/20230626/202306261838.EVIyaUhu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261838.EVIyaUhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306261838.EVIyaUhu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from drivers/net/wireless/mediatek/mt76/mac80211.c:5:
   In function 'fortify_memset_chk',
       inlined from 'mt76_rx_convert.constprop' at drivers/net/wireless/mediatek/mt76/mac80211.c:1063:2:
   include/linux/fortify-string.h:430:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     430 |                         __write_overflow_field(p_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_rx_convert.constprop':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_386' declared with attribute error: BUILD_BUG_ON failed: sizeof(mstat) > sizeof(skb->cb)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mac80211.c:1094:9: note: in expansion of macro 'BUILD_BUG_ON'
    1094 |         BUILD_BUG_ON(sizeof(mstat) > sizeof(skb->cb));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_386 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
