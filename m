Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12078C1E
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680291295; x=1711827295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kdm/s7SW+FnJWIVpN9GcauWVu+AusBlSfirHQ0rNvRk=;
  b=VTk3n5bm7LN2jMpBMnfvqBNHg3DpwuiaiMLCcBPmW6b0aNjWrBt8fLxE
   qSXT7gTVarXVT5nDr95xZo9li2TdDFgcIyqsSxd8FLHp4O4EODuTmy4Ha
   0HGzjM/54fNkICTDXmJu82i54RKORr4D9pfL/xbKbsBDqygxLKnpsiDqN
   yn89+91YMFPrLDNEFy88+Q/r30JHcqFOzapk7+j1zuP77O3BKVZYBb4lH
   JwQIXL64GexQmHdEwWXh2TCV++QONZI5MEdQTDX1RtFaTjvvGkCYFCskd
   VT56J2AKMWvQeFi5M8+lpi5WLkmHXQ5KmxUJb5TYAuKMblFepW01P6clV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343212318"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343212318"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 12:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796229994"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="796229994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2023 12:34:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piKWT-000M6D-0u;
	Fri, 31 Mar 2023 19:34:53 +0000
Date: Sat, 1 Apr 2023 03:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6032/8375] lib/cpu_rmap.c:272:2: warning: Use of
 memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202304010351.nILOjoq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/cpu_rmap.c:272:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eli Cohen <elic@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 4e0473f1060aa49621d40a113afde24818101d37 [6032/8375] lib: cpu_rmap: Avoid use after free on rmap->obj array entries
:::::: branch date: 15 hours ago
:::::: commit date: 7 days ago
config: s390-randconfig-c005-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010351.nILOjoq7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4e0473f1060aa49621d40a113afde24818101d37
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4e0473f1060aa49621d40a113afde24818101d37
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304010351.nILOjoq7-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Left side of '||' is false
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:10: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Left side of '||' is false
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:10: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Left side of '||' is true
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:10: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:365:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Taking false branch
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:10: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:377:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Loop condition is false.  Exiting loop
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:10: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/iio/accel/bma400_core.c:1257:3: note: Assigned value is garbage or undefined
                   set_mask_bits(&field_value, BMA400_D_TAP_MSK,
                   ^
   include/linux/bitops.h:350:8: note: expanded from macro 'set_mask_bits'
           old__ = READ_ONCE(*(ptr));                              \
                 ^ ~~~~~~~~~~~~~~~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> lib/cpu_rmap.c:272:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           glue->rmap->obj[glue->index] = NULL;
           ^~~~~~~~~~~~~~~
   lib/cpu_rmap.c:271:2: note: Calling 'cpu_rmap_put'
           cpu_rmap_put(glue->rmap);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:87:9: note: Calling 'kref_put'
           return kref_put(&rmap->refcount, cpu_rmap_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'cpu_rmap_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   lib/cpu_rmap.c:69:2: note: Memory is released
           kfree(rmap);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   lib/cpu_rmap.c:87:9: note: Returning; memory was released
           return kref_put(&rmap->refcount, cpu_rmap_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:271:2: note: Returning; memory was released via 1st parameter
           cpu_rmap_put(glue->rmap);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:272:2: note: Use of memory after it is freed
           glue->rmap->obj[glue->index] = NULL;
           ^~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   arch/s390/include/asm/preempt.h:84:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^
   net/core/gen_stats.c:157:16: note: Assuming 'cpu' is non-null
           WARN_ON_ONCE((cpu || running) && in_hardirq());
                         ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   net/core/gen_stats.c:157:20: note: Left side of '||' is true
           WARN_ON_ONCE((cpu || running) && in_hardirq());
                             ^
   net/core/gen_stats.c:157:35: note: Calling 'preempt_count'
           WARN_ON_ONCE((cpu || running) && in_hardirq());
                                            ^
   include/linux/preempt.h:119:24: note: expanded from macro 'in_hardirq'
   #define in_hardirq()            (hardirq_count())
                                    ^~~~~~~~~~~~~~~
   include/linux/preempt.h:102:26: note: expanded from macro 'hardirq_count'
   #define hardirq_count() (preempt_count() & HARDIRQ_MASK)
                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   arch/s390/include/asm/preempt.h:84:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \

vim +272 lib/cpu_rmap.c

c39649c331c709 Ben Hutchings   2011-01-19  261  
896f97ea95c1d2 David Decotigny 2013-01-11  262  /**
896f97ea95c1d2 David Decotigny 2013-01-11  263   * irq_cpu_rmap_release - reclaiming callback for IRQ subsystem
896f97ea95c1d2 David Decotigny 2013-01-11  264   * @ref: kref to struct irq_affinity_notify passed by irq/manage.c
896f97ea95c1d2 David Decotigny 2013-01-11  265   */
c39649c331c709 Ben Hutchings   2011-01-19  266  static void irq_cpu_rmap_release(struct kref *ref)
c39649c331c709 Ben Hutchings   2011-01-19  267  {
c39649c331c709 Ben Hutchings   2011-01-19  268  	struct irq_glue *glue =
c39649c331c709 Ben Hutchings   2011-01-19  269  		container_of(ref, struct irq_glue, notify.kref);
896f97ea95c1d2 David Decotigny 2013-01-11  270  
896f97ea95c1d2 David Decotigny 2013-01-11  271  	cpu_rmap_put(glue->rmap);
4e0473f1060aa4 Eli Cohen       2023-02-08 @272  	glue->rmap->obj[glue->index] = NULL;
c39649c331c709 Ben Hutchings   2011-01-19  273  	kfree(glue);
c39649c331c709 Ben Hutchings   2011-01-19  274  }
c39649c331c709 Ben Hutchings   2011-01-19  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
