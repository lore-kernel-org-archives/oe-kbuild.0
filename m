Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24DD4A0C
	for <oe-kbuild@lists.linux.dev>; Tue, 30 May 2023 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685443237; x=1716979237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGyff5iOTsIOnt97rsbLUvko39eU6Okb1GhT5hUum/o=;
  b=lxJIMLOI7H9h3CpA6SQ0bitrR10Fn1NtqAHoZf2Uj/hZYTf/nwc/MQtJ
   pe7+HRcztHbzM86PQpIpKNUQpOpOi8bcdsMwq6tyhyjrOHzwWbOjUZ77e
   3AIO+Fm2Xr98svl8Wng/11hCZNLeQ8nFFX85DFn8G7P2K1T9HWmynii1c
   WoJXArylkiWmtG6H2YZ2m9JLBLXY3HmNZYEpQ6e3RSnUoWLUXCpiD9gu3
   Pl4aKYBPJdnEu6Yl4FNUd+Ljp0reb1B4mx0f9cP3n5NrgoNTsx0Um4F6p
   1QZGfRTvTXnmqSnL1lv/nJPPEYOA2CuPG/LhvZV/WVqkvBIwBs2/VS5c/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418362122"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="418362122"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 03:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="700571507"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="700571507"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 May 2023 03:40:35 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3wmJ-0000He-0p;
	Tue, 30 May 2023 10:40:35 +0000
Date: Tue, 30 May 2023 18:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sparc/include/asm/spinlock_types.h:13:9: sparse: this was the
 original definition
Message-ID: <202305301806.ZO4024dN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/sparc/include/asm/spinlock_types.h:13:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b817fded42d8fe3a0eb47b1149d907851a3c942
commit: 2c230431e1e809270178905974f57cf3878939f5 sparc: Fix the generic IO helpers
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: sparc-randconfig-s041-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301806.ZO4024dN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2c230431e1e809270178905974f57cf3878939f5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2c230431e1e809270178905974f57cf3878939f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash arch/sparc/vdso/ drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305301806.ZO4024dN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/qspinlock.h, arch/sparc/include/asm/spinlock_64.h, arch/sparc/include/asm/spinlock.h, ...):
   include/asm-generic/qspinlock_types.h:49:9: sparse: sparse: preprocessor token __ARCH_SPIN_LOCK_UNLOCKED redefined
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, include/linux/printk.h, ...):
>> arch/sparc/include/asm/spinlock_types.h:13:9: sparse: this was the original definition
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/qrwlock.h, arch/sparc/include/asm/spinlock_64.h, arch/sparc/include/asm/spinlock.h, ...):
   include/asm-generic/qrwlock_types.h:29:9: sparse: sparse: preprocessor token __ARCH_RW_LOCK_UNLOCKED redefined
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, include/linux/printk.h, ...):
   arch/sparc/include/asm/spinlock_types.h:23:9: sparse: this was the original definition
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:63:46: sparse: sparse: Expected ) in function declarator
   arch/sparc/include/asm/atomic_64.h:63:46: sparse: sparse: got *
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1343:45: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1343:45: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:1347:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1347:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:1347:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got volatile
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1348:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1349:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1349:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: got volatile
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1350:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1351:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1351:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1351:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1351:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1351:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1352:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1352:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1355:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1355:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1364:17: sparse: sparse: Expected ; at the end of type declaration

vim +13 arch/sparc/include/asm/spinlock_types.h

fb1c8f93d869b3 include/asm-sparc/spinlock_types.h      Ingo Molnar     2005-09-10  12  
edc35bd72e2079 arch/sparc/include/asm/spinlock_types.h Thomas Gleixner 2009-12-03 @13  #define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
145d9785859774 arch/sparc/include/asm/spinlock_types.h Babu Moger      2017-05-24  14  #endif /* CONFIG_QUEUED_SPINLOCKS */
fb1c8f93d869b3 include/asm-sparc/spinlock_types.h      Ingo Molnar     2005-09-10  15  

:::::: The code at line 13 was first introduced by commit
:::::: edc35bd72e2079b25f99c5da7d7a65dbbffc4a26 locking: Rename __RAW_SPIN_LOCK_UNLOCKED to __ARCH_SPIN_LOCK_UNLOCKED

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
