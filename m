Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E778B361
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676597396; x=1708133396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qQ05mP2CucvDy5tQJjfrlBkawP49jnDpFWXVWVE/a8=;
  b=YIiaZmfXnQcPBo73jBTW1lGyPRO/mDxl0g6nlnEBpZtKVZJMkKhLrfUq
   AWnJqck471HWjA1f5UCI2gR7AoDRV6jRl0Lt8YuElVTKgkosH2LG57Cgr
   DKBeKjcKFzcA8QDYYkV8e9NnlF6YUhNTh7I2PJ4ILfakrv6rCKop3japa
   fhGfPn7J/pLoKfYquGjLEsiA+YdTNxyR9EuiLQS7E/r3kE9SE50a8jSQH
   9DQdbph1/IbR5M6VGU0KWKG3IXZf/f33QJ/gi2JXx3ATb18J0jE1oNtHy
   i0psKRk5ARaQcN4vk4eBrSjvGqZvasPdN9mXgSCc4wldq/PcYXDFj9us4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333244012"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333244012"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 17:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915913738"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="915913738"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 17:29:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSpZS-000B1B-1l;
	Fri, 17 Feb 2023 01:29:54 +0000
Date: Fri, 17 Feb 2023 09:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11281/13217] drivers/dma/idma64.c:143:9: warning:
 Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302170903.Lpz04lpZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma/idma64.c:143:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aman Kumar <aman.kumar@intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Srikanth Thokala <srikanth.thokala@intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: 1f6484614d740c237c3a204c07be7e97bc419410 [11281/13217] dmaengine: idma64: Update bytes_transferred field
:::::: branch date: 21 hours ago
:::::: commit date: 7 days ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170903.Lpz04lpZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1f6484614d740c237c3a204c07be7e97bc419410
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1f6484614d740c237c3a204c07be7e97bc419410
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302170903.Lpz04lpZ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                                   ^
   include/linux/lockdep.h:522:48: note: expanded from macro 'lock_acquire_exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:360:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:120:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:481:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:186:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_once'
           if (!arch_spin_trylock_once(lp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   drivers/dma/idma64.c:521:2: note: Calling 'vchan_free_chan_resources'
           vchan_free_chan_resources(to_virt_chan(chan));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/virt-dma.h:193:2: note: Calling '__raw_spin_lock_irqsave'
           spin_lock_irqsave(&vc->lock, flags);
           ^
   include/linux/spinlock.h:380:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:11: note: expanded from macro 'raw_spin_lock_irqsave'
                   flags = _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:59:38: note: expanded from macro '_raw_spin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_save'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq_save'
           do {                                            \
           ^
   include/linux/spinlock_api_smp.h:108:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_save'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
                                   ^
   include/linux/spinlock_api_smp.h:110:2: note: Loop condition is false.  Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:526:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:522:48: note: expanded from macro 'lock_acquire_exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:360:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:111:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:481:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:186:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_once'
           if (!arch_spin_trylock_once(lp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
>> drivers/dma/idma64.c:143:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           stat = this_cpu_ptr(idma64c->vchan.chan.local);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_ptr'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   drivers/dma/idma64.c:143:9: note: Loop condition is false.  Exiting loop
           stat = this_cpu_ptr(idma64c->vchan.chan.local);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/dma/idma64.c:143:9: note: Dereference of null pointer
           stat = this_cpu_ptr(idma64c->vchan.chan.local);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_ptr'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   net/core/request_sock.c:99:2: note: Left side of '||' is false
           RCU_INIT_POINTER(tcp_sk(sk)->fastopen_rsk, NULL);
           ^
   include/linux/rcupdate.h:930:3: note: expanded from macro 'RCU_INIT_POINTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   net/core/request_sock.c:99:2: note: Left side of '||' is false
           RCU_INIT_POINTER(tcp_sk(sk)->fastopen_rsk, NULL);
           ^
   include/linux/rcupdate.h:930:3: note: expanded from macro 'RCU_INIT_POINTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   net/core/request_sock.c:99:2: note: Left side of '||' is false
           RCU_INIT_POINTER(tcp_sk(sk)->fastopen_rsk, NULL);
           ^
   include/linux/rcupdate.h:930:3: note: expanded from macro 'RCU_INIT_POINTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \

vim +143 drivers/dma/idma64.c

667dfed98615ae Andy Shevchenko 2015-07-27  135  
667dfed98615ae Andy Shevchenko 2015-07-27  136  static void idma64_chan_irq(struct idma64 *idma64, unsigned short c,
667dfed98615ae Andy Shevchenko 2015-07-27  137  		u32 status_err, u32 status_xfer)
667dfed98615ae Andy Shevchenko 2015-07-27  138  {
667dfed98615ae Andy Shevchenko 2015-07-27  139  	struct idma64_chan *idma64c = &idma64->chan[c];
1f6484614d740c Aman Kumar      2023-02-03  140  	struct dma_chan_percpu *stat;
667dfed98615ae Andy Shevchenko 2015-07-27  141  	struct idma64_desc *desc;
667dfed98615ae Andy Shevchenko 2015-07-27  142  
1f6484614d740c Aman Kumar      2023-02-03 @143  	stat = this_cpu_ptr(idma64c->vchan.chan.local);
1f6484614d740c Aman Kumar      2023-02-03  144  
7645d26f3b35c2 Zhaoxiong Yuan  2018-09-08  145  	spin_lock(&idma64c->vchan.lock);
667dfed98615ae Andy Shevchenko 2015-07-27  146  	desc = idma64c->desc;
667dfed98615ae Andy Shevchenko 2015-07-27  147  	if (desc) {
667dfed98615ae Andy Shevchenko 2015-07-27  148  		if (status_err & (1 << c)) {
667dfed98615ae Andy Shevchenko 2015-07-27  149  			dma_writel(idma64, CLEAR(ERROR), idma64c->mask);
667dfed98615ae Andy Shevchenko 2015-07-27  150  			desc->status = DMA_ERROR;
667dfed98615ae Andy Shevchenko 2015-07-27  151  		} else if (status_xfer & (1 << c)) {
667dfed98615ae Andy Shevchenko 2015-07-27  152  			dma_writel(idma64, CLEAR(XFER), idma64c->mask);
667dfed98615ae Andy Shevchenko 2015-07-27  153  			desc->status = DMA_COMPLETE;
667dfed98615ae Andy Shevchenko 2015-07-27  154  			vchan_cookie_complete(&desc->vdesc);
1f6484614d740c Aman Kumar      2023-02-03  155  			stat->bytes_transferred += desc->length;
667dfed98615ae Andy Shevchenko 2015-07-27  156  			idma64_start_transfer(idma64c);
667dfed98615ae Andy Shevchenko 2015-07-27  157  		}
667dfed98615ae Andy Shevchenko 2015-07-27  158  
667dfed98615ae Andy Shevchenko 2015-07-27  159  		/* idma64_start_transfer() updates idma64c->desc */
667dfed98615ae Andy Shevchenko 2015-07-27  160  		if (idma64c->desc == NULL || desc->status == DMA_ERROR)
667dfed98615ae Andy Shevchenko 2015-07-27  161  			idma64_stop_transfer(idma64c);
667dfed98615ae Andy Shevchenko 2015-07-27  162  	}
7645d26f3b35c2 Zhaoxiong Yuan  2018-09-08  163  	spin_unlock(&idma64c->vchan.lock);
667dfed98615ae Andy Shevchenko 2015-07-27  164  }
667dfed98615ae Andy Shevchenko 2015-07-27  165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
