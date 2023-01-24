Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F6A5E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674538003; x=1706074003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwjvyhfEkPQOF09kzGTT9H/TkKo2lXHF7mdnXPi19KU=;
  b=i1j4Six8AXFyQHkHc9vo8TfHQszVaKN8mnk2bOp/9UhT5dx/fI+uSjzk
   Iz1DLOBJxj7sbEraXqsFe73go6Okp+BQ9fU/LlcODLgxxFl5ofSScx26F
   2mmx5S7YhwrFC0dyBDbYs0Vkz1V4XditYWRpzIZMIuTaJWGPQ5ivY3fz0
   Kl9h6SusvnyudShtFxdbyB7MNheoKkn0BEW5/HBuOoIlNH7qtmcsYghUR
   fKRwTlYRlOMu4VYDZwG8ir2QO1QHVJGZrnyJH2aINSRWYcKEzqrcUtnW7
   tahKbeJ48Vff+7TgGradfmecVMKnY0q2jWWRiSnaU6T/hXsVhFGti0Gp3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327490008"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="327490008"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 21:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655303707"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="655303707"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 21:26:41 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKBpQ-0006AO-2d;
	Tue, 24 Jan 2023 05:26:40 +0000
Date: Tue, 24 Jan 2023 13:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/rxrpc/call_object.c:528:27: warning: Value stored to 'conn'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301241336.UeKVayYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/rxrpc/call_object.c:528:27: warning: Value stored to 'conn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
commit: 03fc55adf8761c546d72798264b019c9f672c578 rxrpc: Only disconnect calls in the I/O thread
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230119 (https://download.01.org/0day-ci/archive/20230124/202301241336.UeKVayYx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03fc55adf8761c546d72798264b019c9f672c578
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 03fc55adf8761c546d72798264b019c9f672c578
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~
   net/ipv4/ip_output.c:1649:2: note: Taking false branch
           if (err)
           ^
   net/ipv4/ip_output.c:1653:12: note: Dereference of null pointer
                                  &current->task_frag, getfrag,
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   net/rxrpc/call_object.c:703:2: note: Taking false branch
           _enter("");
           ^
   net/rxrpc/ar-internal.h:1268:25: note: expanded from macro '_enter'
   #define _enter(FMT,...) no_printk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
                           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/rxrpc/call_object.c:705:6: note: Assuming the condition is true
           if (!list_empty(&rxnet->calls)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/call_object.c:705:2: note: Taking true branch
           if (!list_empty(&rxnet->calls)) {
           ^
   net/rxrpc/call_object.c:706:3: note: Calling 'spin_lock'
                   spin_lock(&rxnet->call_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:350:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:216:29: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  Exiting loop
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
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'
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
>> net/rxrpc/call_object.c:528:27: warning: Value stored to 'conn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rxrpc_connection *conn = call->conn;
                                    ^~~~   ~~~~~~~~~~
   net/rxrpc/call_object.c:528:27: note: Value stored to 'conn' during its initialization is never read
           struct rxrpc_connection *conn = call->conn;
                                    ^~~~   ~~~~~~~~~~
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/btrfs/xattr.c:234:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           const bool start_trans = (current->journal_info == NULL);
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/xattr.c:378:2: note: Taking false branch
           if (btrfs_root_readonly(BTRFS_I(inode)->root))
           ^
   fs/btrfs/xattr.c:382:9: note: Calling 'btrfs_setxattr_trans'
           return btrfs_setxattr_trans(inode, name, buffer, size, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/xattr.c:234:28: note: Dereference of null pointer
           const bool start_trans = (current->journal_info == NULL);
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/xattr.c:478:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:478:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:479:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   fs/btrfs/xattr.c:479:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   include/linux/sched/mm.h:321:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/xattr.c:470:14: note: Calling 'memalloc_nofs_save'
           nofs_flag = memalloc_nofs_save();
                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:321:23: note: Dereference of null pointer
           unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   drivers/input/mouse/psmouse-base.c:1484:2: note: Calling 'psmouse_set_state'
           psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/psmouse-base.c:261:2: note: Calling 'serio_pause_rx'
           serio_pause_rx(psmouse->ps2dev.serio);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serio.h:156:2: note: Calling 'spin_lock_irq'
           spin_lock_irq(&serio->lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:375:2: note: Calling '__raw_spin_lock_irq'
           raw_spin_lock_irq(&lock->rlock);
           ^
   include/linux/spinlock.h:273:34: note: expanded from macro 'raw_spin_lock_irq'
   #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)

vim +/conn +528 net/rxrpc/call_object.c

a641fd00d05a5a net/rxrpc/call_object.c David Howells 2019-08-19  522  
e34d4234b0b77a net/rxrpc/call_object.c David Howells 2016-08-30  523  /*
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  524   * Detach a call from its owning socket.
e34d4234b0b77a net/rxrpc/call_object.c David Howells 2016-08-30  525   */
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  526  void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
e34d4234b0b77a net/rxrpc/call_object.c David Howells 2016-08-30  527  {
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08 @528  	struct rxrpc_connection *conn = call->conn;
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  529  	bool put = false;
e34d4234b0b77a net/rxrpc/call_object.c David Howells 2016-08-30  530  
a05754295e01f0 net/rxrpc/call_object.c David Howells 2022-05-21  531  	_enter("{%d,%d}", call->debug_id, refcount_read(&call->ref));
e34d4234b0b77a net/rxrpc/call_object.c David Howells 2016-08-30  532  
cb0fc0c9722c0c net/rxrpc/call_object.c David Howells 2022-10-21  533  	trace_rxrpc_call(call->debug_id, refcount_read(&call->ref),
cb0fc0c9722c0c net/rxrpc/call_object.c David Howells 2022-10-21  534  			 call->flags, rxrpc_call_see_release);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  535  
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  536  	if (test_and_set_bit(RXRPC_CALL_RELEASED, &call->flags))
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  537  		BUG();
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  538  
b7a7d674080328 net/rxrpc/call_object.c David Howells 2020-07-02  539  	rxrpc_put_call_slot(call);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  540  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  541  	/* Make sure we don't get any more notifications */
3dd9c8b5f09fd2 net/rxrpc/call_object.c David Howells 2020-01-24  542  	write_lock(&rx->recvmsg_lock);
e653cfe49cec54 net/rxrpc/call_object.c David Howells 2016-04-04  543  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  544  	if (!list_empty(&call->recvmsg_link)) {
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  545  		_debug("unlinking once-pending call %p { e=%lx f=%lx }",
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  546  		       call, call->events, call->flags);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  547  		list_del(&call->recvmsg_link);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  548  		put = true;
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  549  	}
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  550  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  551  	/* list_empty() must return false in rxrpc_notify_socket() */
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  552  	call->recvmsg_link.next = NULL;
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  553  	call->recvmsg_link.prev = NULL;
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  554  
3dd9c8b5f09fd2 net/rxrpc/call_object.c David Howells 2020-01-24  555  	write_unlock(&rx->recvmsg_lock);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  556  	if (put)
cb0fc0c9722c0c net/rxrpc/call_object.c David Howells 2022-10-21  557  		rxrpc_put_call(call, rxrpc_call_put_unnotify);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  558  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  559  	write_lock(&rx->call_lock);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  560  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  561  	if (test_and_clear_bit(RXRPC_CALL_HAS_USERID, &call->flags)) {
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  562  		rb_erase(&call->sock_node, &rx->calls);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  563  		memset(&call->sock_node, 0xdd, sizeof(call->sock_node));
cb0fc0c9722c0c net/rxrpc/call_object.c David Howells 2022-10-21  564  		rxrpc_put_call(call, rxrpc_call_put_userid_exists);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  565  	}
e653cfe49cec54 net/rxrpc/call_object.c David Howells 2016-04-04  566  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  567  	list_del(&call->sock_link);
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  568  	write_unlock(&rx->call_lock);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  569  
248f219cb8bcbf net/rxrpc/call_object.c David Howells 2016-09-08  570  	_debug("RELEASE CALL %p (%d CONN %p)", call, call->debug_id, conn);
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  571  
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  572  	_leave("");
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  573  }
17926a79320afa net/rxrpc/ar-call.c     David Howells 2007-04-26  574  

:::::: The code at line 528 was first introduced by commit
:::::: 248f219cb8bcbfbd7f132752d44afa2df7c241d1 rxrpc: Rewrite the data and ack handling code

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
