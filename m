Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67515631
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 05:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679721830; x=1711257830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w08aA5k0x5pYCTp+kJ+JJANKiCtNr1Eg0N0FYL4cIPM=;
  b=Y3TQkyIbYIKw7WTuDch7s+1d4Ym21VV1wvp9NeOpZWTh+h6wuhprAJz7
   RgWjXYgEFX3Xv6BHVN4CZKOf7ca3NA23A89beRF2+NLEyfhbr3ALRWC1D
   dLu3H0BxroSpxJ8iWySbXqluekKn21essM62eKU9+5mAb9TTv6F/S4dvD
   kzEWigNAR7pJu0afV/vgBavgY0XkJwKJXNbk4uOepp1v9nYNwKUs4lAXf
   WlLrj2Ds/iO0R5BLijBzy3N+X3DWZVoXeB2pJIT0Nz0MzCzI2lDWR4o2a
   +aHxUEa8U0Phz5j/jSYDiZl6ioZbL3GBo6JilUM7KqyKlFXmVEs3xa1lp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="426200589"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="426200589"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 22:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="806910615"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="806910615"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2023 22:23:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfwNX-000Fyl-23;
	Sat, 25 Mar 2023 05:23:47 +0000
Date: Sat, 25 Mar 2023 13:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mcgrof:20230317-module-alloc-opts 27/31]
 kernel/module/main.c:2262:5: warning: Value stored to 'ret' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303251332.hj1hgdGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/module/main.c:2262:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b [27/31] module: add stop-grap sanity check on module memcpy()
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-c005-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251332.hj1hgdGz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=139e5ac36c4aa1e28a51bf98a7304d3040c6da6b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230317-module-alloc-opts
        git checkout 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303251332.hj1hgdGz-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~
   kernel/module/main.c:2831:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:2836:2: note: Taking false branch
           if (IS_ERR(mod)) {
           ^
   kernel/module/main.c:2841:2: note: Calling 'audit_log_kern_module'
           audit_log_kern_module(mod->name);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/audit.h:523:7: note: Calling 'audit_dummy_context'
           if (!audit_dummy_context())
                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/audit.h:320:12: note: Calling 'audit_context'
           void *p = audit_context();
                     ^~~~~~~~~~~~~~~
   include/linux/audit.h:315:9: note: Dereference of null pointer
           return current->audit_context;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/module/main.c:897:14: warning: Value stored to 'state' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *state = "unknown";
                       ^~~~~   ~~~~~~~~~
   kernel/module/main.c:897:14: note: Value stored to 'state' during its initialization is never read
           const char *state = "unknown";
                       ^~~~~   ~~~~~~~~~
   kernel/module/main.c:1134:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           sched_annotate_sleep();
           ^
   include/linux/kernel.h:151:34: note: expanded from macro 'sched_annotate_sleep'
   # define sched_annotate_sleep() (current->task_state_change = 0)
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/module/main.c:1376:14: note: Assuming the condition is true
           for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:1376:2: note: Loop condition is true.  Entering loop body
           for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
           ^
   kernel/module/main.c:1379:3: note: Control jumps to 'case 0:'  at line 1405
                   switch (sym[i].st_shndx) {
                   ^
   kernel/module/main.c:1406:11: note: Calling 'resolve_symbol_wait'
                           ksym = resolve_symbol_wait(mod, info, name);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:1180:6: note: Loop condition is false.  Exiting loop
           if (wait_event_interruptible_timeout(module_wq,
               ^
   include/linux/wait.h:533:2: note: expanded from macro 'wait_event_interruptible_timeout'
           might_sleep();                                                          \
           ^
   include/linux/kernel.h:143:42: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
                                                   ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   kernel/module/main.c:1180:6: note: Loop condition is false.  Exiting loop
           if (wait_event_interruptible_timeout(module_wq,
               ^
   include/linux/wait.h:533:2: note: expanded from macro 'wait_event_interruptible_timeout'
           might_sleep();                                                          \
           ^
   include/linux/kernel.h:143:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
           ^
   kernel/module/main.c:1181:19: note: Calling 'resolve_symbol'
                           !IS_ERR(ksym = resolve_symbol(mod, info, name, owner))
                                          ^
   include/linux/wait.h:534:28: note: expanded from macro 'wait_event_interruptible_timeout'
           if (!___wait_cond_timeout(condition))                                   \
                                     ^~~~~~~~~
   include/linux/wait.h:276:17: note: expanded from macro '___wait_cond_timeout'
           bool __cond = (condition);                                              \
                          ^~~~~~~~~
   kernel/module/main.c:1124:12: note: Assuming the condition is false
                   .gplok  = !(mod->taints & (1 << TAINT_PROPRIETARY_MODULE)),
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:1134:2: note: Dereference of null pointer
           sched_annotate_sleep();
           ^
   include/linux/kernel.h:151:34: note: expanded from macro 'sched_annotate_sleep'
   # define sched_annotate_sleep() (current->task_state_change = 0)
                                    ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> kernel/module/main.c:2262:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret = -ENOEXEC;
                                   ^     ~~~~~~~~
   kernel/module/main.c:2262:5: note: Value stored to 'ret' is never read
                                   ret = -ENOEXEC;
                                   ^     ~~~~~~~~
   kernel/module/main.c:2611:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           sched_annotate_sleep();
           ^
   include/linux/kernel.h:151:34: note: expanded from macro 'sched_annotate_sleep'
   # define sched_annotate_sleep() (current->task_state_change = 0)
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/module/main.c:2670:8: note: Calling 'module_patient_check_exists'
           err = module_patient_check_exists(mod->name);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:2628:6: note: Assuming 'old' is not equal to NULL
           if (old == NULL)
               ^~~~~~~~~~~
   kernel/module/main.c:2628:2: note: Taking false branch
           if (old == NULL)
           ^
   kernel/module/main.c:2631:6: note: Assuming field 'state' is equal to MODULE_STATE_COMING
           if (old->state == MODULE_STATE_COMING
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:2632:6: note: Left side of '||' is true
               || old->state == MODULE_STATE_UNFORMED) {
               ^
   kernel/module/main.c:2635:9: note: Loop condition is false.  Exiting loop
                   err = wait_event_interruptible(module_wq,
                         ^
   include/linux/wait.h:499:2: note: expanded from macro 'wait_event_interruptible'
           might_sleep();                                                          \
           ^
   include/linux/kernel.h:143:42: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
                                                   ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   kernel/module/main.c:2635:9: note: Loop condition is false.  Exiting loop
                   err = wait_event_interruptible(module_wq,
                         ^
   include/linux/wait.h:499:2: note: expanded from macro 'wait_event_interruptible'
           might_sleep();                                                          \
           ^
   include/linux/kernel.h:143:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
           ^
   kernel/module/main.c:2636:12: note: Calling 'finished_loading'
                                          finished_loading(name));
                                          ^
   include/linux/wait.h:500:8: note: expanded from macro 'wait_event_interruptible'
           if (!(condition))                                                       \
                 ^~~~~~~~~
   kernel/module/main.c:2611:2: note: Dereference of null pointer
           sched_annotate_sleep();
           ^
   include/linux/kernel.h:151:34: note: expanded from macro 'sched_annotate_sleep'
   # define sched_annotate_sleep() (current->task_state_change = 0)
                                    ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 11 warnings (9 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   security/keys/request_key.c:119:21: warning: Value stored to 'cred' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct cred *cred = current_cred();
                              ^~~~
   security/keys/request_key.c:119:21: note: Value stored to 'cred' during its initialization is never read
           const struct cred *cred = current_cred();
                              ^~~~
   security/keys/request_key.c:119:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:673:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:471:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/keys/request_key.c:119:28: note: Left side of '&&' is false
           const struct cred *cred = current_cred();

vim +/ret +2262 kernel/module/main.c

f91a13bb99b739 kernel/module.c      Linus Torvalds   2010-08-05  2211  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2212  static int move_module(struct module *mod, struct load_info *info)
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2213  {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2214  	int i;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2215  	void *ptr;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2216  	enum mod_mem_type t;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2217  	int ret = -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2218  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2219  	for_each_mod_mem_type(type) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2220  		if (!mod->mem[type].size) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2221  			mod->mem[type].base = NULL;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2222  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2223  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2224  		mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2225  		ptr = module_memory_alloc(mod->mem[type].size, type);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2226  
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2227  		/*
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2228  		 * The pointer to this block is stored in the module structure
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2229  		 * which is inside the block. Just mark it as not being a
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2230  		 * leak.
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2231  		 */
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2232  		kmemleak_ignore(ptr);
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2233  		if (!ptr) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2234  			t = type;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2235  			goto out_enomem;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2236  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2237  		memset(ptr, 0, mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2238  		mod->mem[type].base = ptr;
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2239  	}
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2240  
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2241  	/* Transfer each section which specifies SHF_ALLOC */
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2242  	pr_debug("final section addresses:\n");
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2243  	for (i = 0; i < info->hdr->e_shnum; i++) {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2244  		void *dest;
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2245  		Elf_Shdr *shdr = &info->sechdrs[i];
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2246  		enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2247  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2248  		if (!(shdr->sh_flags & SHF_ALLOC))
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2249  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2250  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2251  		dest = mod->mem[type].base + (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2252  
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2253  		if (shdr->sh_type != SHT_NOBITS) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2254  			/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2255  			 * Our ELF checker already validated this, but let's
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2256  			 * be pedantic and make the goal clearer. We actually
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2257  			 * end up copying over all modifications made to the
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2258  			 * userspace copy of the entire struct module.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2259  			 */
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2260  			if (i == info->index.mod &&
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2261  			   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17 @2262  				ret = -ENOEXEC;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2263  				goto out_enomem;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2264  			}
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2265  			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2266  		}
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2267  		/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2268  		 * Update the userspace copy's ELF section address to point to
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2269  		 * our newly allocated memory as a pure convenience so that
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2270  		 * users of info can keep taking advantage and using the newly
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2271  		 * minted official memory area.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2272  		 */
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2273  		shdr->sh_addr = (unsigned long)dest;
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2274  		pr_debug("\t0x%lx %s\n",
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2275  			 (long)shdr->sh_addr, info->secstrings + shdr->sh_name);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2276  	}
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2277  
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2278  	return 0;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2279  out_enomem:
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2280  	for (t--; t >= 0; t--)
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2281  		module_memory_free(mod->mem[t].base, t);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2282  	return -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2283  }
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
