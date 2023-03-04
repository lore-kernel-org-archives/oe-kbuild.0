Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DC1FD0
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677928733; x=1709464733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGi9BgXR8PtS+pBLz7u4MzGxskncoXqdfNkxx3DFCj4=;
  b=XeVayih7I0O2pGx35Y4NaOKulTTt6DS2Pi/ZFsoUkEAdr28QNzB9qGNq
   fyB6ETxeU2TQBi5g20+GtcpkdgbC1yIXhHP+RTWzCe8R2OK875qNITmB/
   4GJjCrq0gDqFEngY+CbnWggFybJ0xVyD6uK8K7K629X9Vlin9mUsMwzuH
   2dZddqazG75u6WA4G1BnLt7jIxkuXwaGBAtC2avWzKVo8xmMwxfnwRlZP
   cPWb87e+Jn6MgodDqj1jGphsc3C1EgQWussFlnhVyVYEYvXDvUUf60Lw2
   szgtyBmqADGDqUpbyJjJxT+8yXArHepkP7LhW2VddQl40VE8/ADgjQ37L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336769540"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="336769540"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 03:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799499912"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="799499912"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2023 03:18:51 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYPuc-00026q-1r;
	Sat, 04 Mar 2023 11:18:50 +0000
Date: Sat, 4 Mar 2023 19:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/bpf_local_storage.c:473:2: warning: Potential leak of
 memory pointed to by 'selem' [clang-analyzer-unix.Malloc]
Message-ID: <202303041959.sXwu8Fkf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/bpf_local_storage.c:473:2: warning: Potential leak of memory pointed to by 'selem' [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Joanne Koong <joannelkoong@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: b00fa38a9c1cba044a32a601b49a55a18ed719d1 bpf: Enable non-atomic allocations in local storage
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230304/202303041959.sXwu8Fkf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b00fa38a9c1cba044a32a601b49a55a18ed719d1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b00fa38a9c1cba044a32a601b49a55a18ed719d1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303041959.sXwu8Fkf-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiting loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:81:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instrumentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiting loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:82:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);                  \
           ^
   arch/x86/include/asm/bug.h:25:43: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags, extra)                                   \
                                                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiting loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:83:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instrumentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiting loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:78:33: note: expanded from macro '__WARN_FLAGS'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   kernel/trace/ring_buffer.c:3500:3: note: Taking false branch
                   if (likely(!(info->add_timestamp &
                   ^
   kernel/trace/ring_buffer.c:3509:25: note: The right operand of '!=' is a garbage value
                   if (unlikely(info->ts != save_before)) {
                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> kernel/bpf/bpf_local_storage.c:473:2: warning: Potential leak of memory pointed to by 'selem' [clang-analyzer-unix.Malloc]
           raw_spin_unlock_irqrestore(&local_storage->lock, flags);
           ^
   include/linux/spinlock.h:279:13: note: expanded from macro 'raw_spin_unlock_irqrestore'
                   typecheck(unsigned long, flags);                \
                             ^
   kernel/bpf/bpf_local_storage.c:363:15: note: Assuming the condition is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:363:6: note: Left side of '||' is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
               ^
   include/linux/compiler.h:48:23: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^
   kernel/bpf/bpf_local_storage.c:365:16: note: Assuming the condition is true
               unlikely((map_flags & BPF_F_LOCK) &&
                         ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
               unlikely((map_flags & BPF_F_LOCK) &&
                        ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
   kernel/bpf/bpf_local_storage.c:363:2: note: '?' condition is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   kernel/bpf/bpf_local_storage.c:363:6: note: Left side of '||' is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
               ^
   include/linux/compiler.h:48:23: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
               unlikely((map_flags & BPF_F_LOCK) &&
                        ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
   kernel/bpf/bpf_local_storage.c:363:2: note: '?' condition is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   kernel/bpf/bpf_local_storage.c:363:2: note: Taking false branch
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/bpf/bpf_local_storage.c:369:6: note: Assuming the condition is true
           if (gfp_flags == GFP_KERNEL && (map_flags & ~BPF_F_LOCK) != BPF_NOEXIST)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:369:6: note: Left side of '&&' is true
           if (gfp_flags == GFP_KERNEL && (map_flags & ~BPF_F_LOCK) != BPF_NOEXIST)
               ^
   kernel/bpf/bpf_local_storage.c:369:33: note: Assuming the condition is false
           if (gfp_flags == GFP_KERNEL && (map_flags & ~BPF_F_LOCK) != BPF_NOEXIST)
                                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~

vim +/selem +473 kernel/bpf/bpf_local_storage.c

450af8d0f6be2e KP Singh     2020-08-25  346  
450af8d0f6be2e KP Singh     2020-08-25  347  /* sk cannot be going away because it is linking new elem
450af8d0f6be2e KP Singh     2020-08-25  348   * to sk->sk_bpf_storage. (i.e. sk->sk_refcnt cannot be 0).
450af8d0f6be2e KP Singh     2020-08-25  349   * Otherwise, it will become a leak (and other memory issues
450af8d0f6be2e KP Singh     2020-08-25  350   * during map destruction).
450af8d0f6be2e KP Singh     2020-08-25  351   */
450af8d0f6be2e KP Singh     2020-08-25  352  struct bpf_local_storage_data *
450af8d0f6be2e KP Singh     2020-08-25  353  bpf_local_storage_update(void *owner, struct bpf_local_storage_map *smap,
b00fa38a9c1cba Joanne Koong 2022-03-17  354  			 void *value, u64 map_flags, gfp_t gfp_flags)
450af8d0f6be2e KP Singh     2020-08-25  355  {
450af8d0f6be2e KP Singh     2020-08-25  356  	struct bpf_local_storage_data *old_sdata = NULL;
b00fa38a9c1cba Joanne Koong 2022-03-17  357  	struct bpf_local_storage_elem *selem = NULL;
450af8d0f6be2e KP Singh     2020-08-25  358  	struct bpf_local_storage *local_storage;
a10787e6d58c24 Song Liu     2021-02-25  359  	unsigned long flags;
450af8d0f6be2e KP Singh     2020-08-25  360  	int err;
450af8d0f6be2e KP Singh     2020-08-25  361  
450af8d0f6be2e KP Singh     2020-08-25  362  	/* BPF_EXIST and BPF_NOEXIST cannot be both set */
450af8d0f6be2e KP Singh     2020-08-25  363  	if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
450af8d0f6be2e KP Singh     2020-08-25  364  	    /* BPF_F_LOCK can only be used in a value with spin_lock */
450af8d0f6be2e KP Singh     2020-08-25  365  	    unlikely((map_flags & BPF_F_LOCK) &&
450af8d0f6be2e KP Singh     2020-08-25  366  		     !map_value_has_spin_lock(&smap->map)))
450af8d0f6be2e KP Singh     2020-08-25  367  		return ERR_PTR(-EINVAL);
450af8d0f6be2e KP Singh     2020-08-25  368  
b00fa38a9c1cba Joanne Koong 2022-03-17  369  	if (gfp_flags == GFP_KERNEL && (map_flags & ~BPF_F_LOCK) != BPF_NOEXIST)
b00fa38a9c1cba Joanne Koong 2022-03-17  370  		return ERR_PTR(-EINVAL);
b00fa38a9c1cba Joanne Koong 2022-03-17  371  
0fe4b381a59ebc KP Singh     2021-12-24  372  	local_storage = rcu_dereference_check(*owner_storage(smap, owner),
0fe4b381a59ebc KP Singh     2021-12-24  373  					      bpf_rcu_lock_held());
450af8d0f6be2e KP Singh     2020-08-25  374  	if (!local_storage || hlist_empty(&local_storage->list)) {
450af8d0f6be2e KP Singh     2020-08-25  375  		/* Very first elem for the owner */
450af8d0f6be2e KP Singh     2020-08-25  376  		err = check_flags(NULL, map_flags);
450af8d0f6be2e KP Singh     2020-08-25  377  		if (err)
450af8d0f6be2e KP Singh     2020-08-25  378  			return ERR_PTR(err);
450af8d0f6be2e KP Singh     2020-08-25  379  
b00fa38a9c1cba Joanne Koong 2022-03-17  380  		selem = bpf_selem_alloc(smap, owner, value, true, gfp_flags);
450af8d0f6be2e KP Singh     2020-08-25  381  		if (!selem)
450af8d0f6be2e KP Singh     2020-08-25  382  			return ERR_PTR(-ENOMEM);
450af8d0f6be2e KP Singh     2020-08-25  383  
b00fa38a9c1cba Joanne Koong 2022-03-17  384  		err = bpf_local_storage_alloc(owner, smap, selem, gfp_flags);
450af8d0f6be2e KP Singh     2020-08-25  385  		if (err) {
450af8d0f6be2e KP Singh     2020-08-25  386  			kfree(selem);
450af8d0f6be2e KP Singh     2020-08-25  387  			mem_uncharge(smap, owner, smap->elem_size);
450af8d0f6be2e KP Singh     2020-08-25  388  			return ERR_PTR(err);
450af8d0f6be2e KP Singh     2020-08-25  389  		}
450af8d0f6be2e KP Singh     2020-08-25  390  
450af8d0f6be2e KP Singh     2020-08-25  391  		return SDATA(selem);
450af8d0f6be2e KP Singh     2020-08-25  392  	}
450af8d0f6be2e KP Singh     2020-08-25  393  
450af8d0f6be2e KP Singh     2020-08-25  394  	if ((map_flags & BPF_F_LOCK) && !(map_flags & BPF_NOEXIST)) {
450af8d0f6be2e KP Singh     2020-08-25  395  		/* Hoping to find an old_sdata to do inline update
450af8d0f6be2e KP Singh     2020-08-25  396  		 * such that it can avoid taking the local_storage->lock
450af8d0f6be2e KP Singh     2020-08-25  397  		 * and changing the lists.
450af8d0f6be2e KP Singh     2020-08-25  398  		 */
450af8d0f6be2e KP Singh     2020-08-25  399  		old_sdata =
450af8d0f6be2e KP Singh     2020-08-25  400  			bpf_local_storage_lookup(local_storage, smap, false);
450af8d0f6be2e KP Singh     2020-08-25  401  		err = check_flags(old_sdata, map_flags);
450af8d0f6be2e KP Singh     2020-08-25  402  		if (err)
450af8d0f6be2e KP Singh     2020-08-25  403  			return ERR_PTR(err);
450af8d0f6be2e KP Singh     2020-08-25  404  		if (old_sdata && selem_linked_to_storage(SELEM(old_sdata))) {
450af8d0f6be2e KP Singh     2020-08-25  405  			copy_map_value_locked(&smap->map, old_sdata->data,
450af8d0f6be2e KP Singh     2020-08-25  406  					      value, false);
450af8d0f6be2e KP Singh     2020-08-25  407  			return old_sdata;
450af8d0f6be2e KP Singh     2020-08-25  408  		}
450af8d0f6be2e KP Singh     2020-08-25  409  	}
450af8d0f6be2e KP Singh     2020-08-25  410  
b00fa38a9c1cba Joanne Koong 2022-03-17  411  	if (gfp_flags == GFP_KERNEL) {
b00fa38a9c1cba Joanne Koong 2022-03-17  412  		selem = bpf_selem_alloc(smap, owner, value, true, gfp_flags);
b00fa38a9c1cba Joanne Koong 2022-03-17  413  		if (!selem)
b00fa38a9c1cba Joanne Koong 2022-03-17  414  			return ERR_PTR(-ENOMEM);
b00fa38a9c1cba Joanne Koong 2022-03-17  415  	}
b00fa38a9c1cba Joanne Koong 2022-03-17  416  
a10787e6d58c24 Song Liu     2021-02-25  417  	raw_spin_lock_irqsave(&local_storage->lock, flags);
450af8d0f6be2e KP Singh     2020-08-25  418  
450af8d0f6be2e KP Singh     2020-08-25  419  	/* Recheck local_storage->list under local_storage->lock */
450af8d0f6be2e KP Singh     2020-08-25  420  	if (unlikely(hlist_empty(&local_storage->list))) {
450af8d0f6be2e KP Singh     2020-08-25  421  		/* A parallel del is happening and local_storage is going
450af8d0f6be2e KP Singh     2020-08-25  422  		 * away.  It has just been checked before, so very
450af8d0f6be2e KP Singh     2020-08-25  423  		 * unlikely.  Return instead of retry to keep things
450af8d0f6be2e KP Singh     2020-08-25  424  		 * simple.
450af8d0f6be2e KP Singh     2020-08-25  425  		 */
450af8d0f6be2e KP Singh     2020-08-25  426  		err = -EAGAIN;
450af8d0f6be2e KP Singh     2020-08-25  427  		goto unlock_err;
450af8d0f6be2e KP Singh     2020-08-25  428  	}
450af8d0f6be2e KP Singh     2020-08-25  429  
450af8d0f6be2e KP Singh     2020-08-25  430  	old_sdata = bpf_local_storage_lookup(local_storage, smap, false);
450af8d0f6be2e KP Singh     2020-08-25  431  	err = check_flags(old_sdata, map_flags);
450af8d0f6be2e KP Singh     2020-08-25  432  	if (err)
450af8d0f6be2e KP Singh     2020-08-25  433  		goto unlock_err;
450af8d0f6be2e KP Singh     2020-08-25  434  
450af8d0f6be2e KP Singh     2020-08-25  435  	if (old_sdata && (map_flags & BPF_F_LOCK)) {
450af8d0f6be2e KP Singh     2020-08-25  436  		copy_map_value_locked(&smap->map, old_sdata->data, value,
450af8d0f6be2e KP Singh     2020-08-25  437  				      false);
450af8d0f6be2e KP Singh     2020-08-25  438  		selem = SELEM(old_sdata);
450af8d0f6be2e KP Singh     2020-08-25  439  		goto unlock;
450af8d0f6be2e KP Singh     2020-08-25  440  	}
450af8d0f6be2e KP Singh     2020-08-25  441  
b00fa38a9c1cba Joanne Koong 2022-03-17  442  	if (gfp_flags != GFP_KERNEL) {
450af8d0f6be2e KP Singh     2020-08-25  443  		/* local_storage->lock is held.  Hence, we are sure
450af8d0f6be2e KP Singh     2020-08-25  444  		 * we can unlink and uncharge the old_sdata successfully
450af8d0f6be2e KP Singh     2020-08-25  445  		 * later.  Hence, instead of charging the new selem now
450af8d0f6be2e KP Singh     2020-08-25  446  		 * and then uncharge the old selem later (which may cause
450af8d0f6be2e KP Singh     2020-08-25  447  		 * a potential but unnecessary charge failure),  avoid taking
450af8d0f6be2e KP Singh     2020-08-25  448  		 * a charge at all here (the "!old_sdata" check) and the
450af8d0f6be2e KP Singh     2020-08-25  449  		 * old_sdata will not be uncharged later during
450af8d0f6be2e KP Singh     2020-08-25  450  		 * bpf_selem_unlink_storage_nolock().
450af8d0f6be2e KP Singh     2020-08-25  451  		 */
b00fa38a9c1cba Joanne Koong 2022-03-17  452  		selem = bpf_selem_alloc(smap, owner, value, !old_sdata, gfp_flags);
450af8d0f6be2e KP Singh     2020-08-25  453  		if (!selem) {
450af8d0f6be2e KP Singh     2020-08-25  454  			err = -ENOMEM;
450af8d0f6be2e KP Singh     2020-08-25  455  			goto unlock_err;
450af8d0f6be2e KP Singh     2020-08-25  456  		}
b00fa38a9c1cba Joanne Koong 2022-03-17  457  	}
450af8d0f6be2e KP Singh     2020-08-25  458  
450af8d0f6be2e KP Singh     2020-08-25  459  	/* First, link the new selem to the map */
450af8d0f6be2e KP Singh     2020-08-25  460  	bpf_selem_link_map(smap, selem);
450af8d0f6be2e KP Singh     2020-08-25  461  
450af8d0f6be2e KP Singh     2020-08-25  462  	/* Second, link (and publish) the new selem to local_storage */
450af8d0f6be2e KP Singh     2020-08-25  463  	bpf_selem_link_storage_nolock(local_storage, selem);
450af8d0f6be2e KP Singh     2020-08-25  464  
450af8d0f6be2e KP Singh     2020-08-25  465  	/* Third, remove old selem, SELEM(old_sdata) */
450af8d0f6be2e KP Singh     2020-08-25  466  	if (old_sdata) {
450af8d0f6be2e KP Singh     2020-08-25  467  		bpf_selem_unlink_map(SELEM(old_sdata));
450af8d0f6be2e KP Singh     2020-08-25  468  		bpf_selem_unlink_storage_nolock(local_storage, SELEM(old_sdata),
450af8d0f6be2e KP Singh     2020-08-25  469  						false);
450af8d0f6be2e KP Singh     2020-08-25  470  	}
450af8d0f6be2e KP Singh     2020-08-25  471  
450af8d0f6be2e KP Singh     2020-08-25  472  unlock:
a10787e6d58c24 Song Liu     2021-02-25 @473  	raw_spin_unlock_irqrestore(&local_storage->lock, flags);
450af8d0f6be2e KP Singh     2020-08-25  474  	return SDATA(selem);
450af8d0f6be2e KP Singh     2020-08-25  475  
450af8d0f6be2e KP Singh     2020-08-25  476  unlock_err:
a10787e6d58c24 Song Liu     2021-02-25  477  	raw_spin_unlock_irqrestore(&local_storage->lock, flags);
b00fa38a9c1cba Joanne Koong 2022-03-17  478  	if (selem) {
b00fa38a9c1cba Joanne Koong 2022-03-17  479  		mem_uncharge(smap, owner, smap->elem_size);
b00fa38a9c1cba Joanne Koong 2022-03-17  480  		kfree(selem);
b00fa38a9c1cba Joanne Koong 2022-03-17  481  	}
450af8d0f6be2e KP Singh     2020-08-25  482  	return ERR_PTR(err);
450af8d0f6be2e KP Singh     2020-08-25  483  }
450af8d0f6be2e KP Singh     2020-08-25  484  

:::::: The code at line 473 was first introduced by commit
:::::: a10787e6d58c24b51e91c19c6d16c5da89fcaa4b bpf: Enable task local storage for tracing programs

:::::: TO: Song Liu <songliubraving@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
