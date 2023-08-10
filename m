Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E420F92
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691703036; x=1723239036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5rl7QIgo6vVLQIHyFVYWoq6el5vTpHf4KUMvBCJPw0=;
  b=SNwom2KL3+lXoVbtEGe7pZg01wsfJw7djeOmww/77trtAG/+tdkohset
   em7Js88GZ/ok/cydsOc/9E2iRDg8UrQL91GHMBGk4CxUqoQfNsUOiI888
   o2f+FIE2vmymSfUWkuuMCp4Shl0H9EpvFOx+pIjwdBJr0+2QqsNwpi3EJ
   N2+FqVxSOTj1tCiEDdkVvVRfuhtnI7PHd6PSlRD7hQethyKW8b1eh4P+f
   TwRsrG7tHJDQHIcaMl7LwLGcLv2nhSiNKiE/fR8llK4VtruzwIMsMJw8g
   a7yAyYkIwNGV0RmUxTuwYfQS5qtOOibLZN6EcTSNsZ4P/RKhHDQ9ugBQB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370429623"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="370429623"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 14:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802402421"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="802402421"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 14:30:20 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUDEZ-0007GC-1D;
	Thu, 10 Aug 2023 21:30:19 +0000
Date: Fri, 11 Aug 2023 05:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:armnommu 3/3] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_659' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(struct ieee80211_rx_status) > sizeof(skb->cb)
Message-ID: <202308110529.NeByZ1A8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_659' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct ieee80211_rx_status) > sizeof(skb->cb)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@uclinux.org>

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   f4d1ef8d8e85040d9b835d26b96890256b2974aa
commit: 186f7b66943a8d9c97e9afe21109c1aef3bd47aa [3/3] ARM: versatile: support configuring versatile machine for no-MMU
:::::: branch date: 11 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r083-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110529.NeByZ1A8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110529.NeByZ1A8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308110529.NeByZ1A8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/mac80211/rx.c: In function 'ieee80211_rx_irqsafe':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_659' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct ieee80211_rx_status) > sizeof(skb->cb)
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
   net/mac80211/rx.c:5427:9: note: in expansion of macro 'BUILD_BUG_ON'
    5427 |         BUILD_BUG_ON(sizeof(struct ieee80211_rx_status) > sizeof(skb->cb));
         |         ^~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:775:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:775:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:775:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:790:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:790:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:790:25: sparse:     got unsigned short [usertype] *ip

vim +/__compiletime_assert_659 +397 include/linux/compiler_types.h

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
