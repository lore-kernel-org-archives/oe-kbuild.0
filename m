Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0078F4A
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679604465; x=1711140465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SPurVZEL3dgGQrlXszlA0Jj5vPkDhwAtRpuOO+V9yps=;
  b=nIwQ5uQAky0JKG/AwKkkksatP4gfsumG3dJx0X+fWEjuCiu0RYNese9v
   Zm8bADOztc2wsUoFi9d2cG109lXpHvhuts+B9APd11DeRNLeA2BlldOmG
   pd2AmaMs4pWfT9ycDqxaGfR0fsTunqovXz/4+ybLv7Rh0X+PI7XFtPmfx
   j7hW4i5DrK5seGsAFVxqXqrHtAXvGM2Q+qrMe1nDq+nYikvSK+T31Yfg0
   Hh6F76E4Fe94pZ6Y6gKemUFz9TkSgjDlthTUXhgoehVgKvK8MfmtampCR
   vcIA2eep8nHp7QoRVeISIZSl7VQFHrQ0HQcKOzorFCappIxEMgoZ4zhbc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341180543"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341180543"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1011983046"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="1011983046"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 13:47:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfRqY-000Eh2-1O;
	Thu, 23 Mar 2023 20:47:42 +0000
Date: Fri, 24 Mar 2023 04:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <202303240430.oprzwsoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_491' declared with attribute error: BUILD_BUG_ON failed: (((12 - 3) * (4 - (2)) + 3)-12) > -1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230323092156.2545741-3-rppt@kernel.org>
References: <20230323092156.2545741-3-rppt@kernel.org>
TO: Mike Rapoport <rppt@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Guo Ren <guoren@kernel.org>
CC: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Max Filippov <jcmvbkbc@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Mike Rapoport <rppt@kernel.org>
CC: Rich Felker <dalias@libc.org>
CC: Russell King <linux@armlinux.org.uk>
CC: Will Deacon <will@kernel.org>
CC: Yoshinori Sato <ysato@users.sourceforge.jp>
CC: Zi Yan <ziy@nvidia.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-csky@vger.kernel.org
CC: linux-ia64@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-m68k@lists.linux-m68k.org
CC: linux-sh@vger.kernel.org
CC: linux-xtensa@linux-xtensa.org
CC: linuxppc-dev@lists.ozlabs.org
CC: sparclinux@vger.kernel.org

Hi Mike,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 51551d71edbc998fd8c8afa7312db3d270f5998e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
base:   51551d71edbc998fd8c8afa7312db3d270f5998e
patch link:    https://lore.kernel.org/r/20230323092156.2545741-3-rppt%40kernel.org
patch subject: [PATCH 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-c034-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240430.oprzwsoZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0522f943c071abf1610651ea40405b7489c50987
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
        git checkout 0522f943c071abf1610651ea40405b7489c50987
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303240430.oprzwsoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/huge_memory.c: In function 'hugepage_init':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_491' declared with attribute error: BUILD_BUG_ON failed: (((12 - 3) * (4 - (2)) + 3)-12) > -1
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
   include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
      24 |                         BUILD_BUG_ON(cond);             \
         |                         ^~~~~~~~~~~~
   mm/huge_memory.c:470:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
     470 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_ORDER);
         |         ^~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_491 +397 include/linux/compiler_types.h

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
