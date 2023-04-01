Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB527C
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 01:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680312128; x=1711848128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuvxltwtGpRfNgVhim7tauFoJnnO6tGyMO83hZ4TZ10=;
  b=fvU4mab+9IjxWTXRvy6n/NiuVNOWh3XCGGPGTyPKGHs9oM+/7Zew6iRw
   9qSkrZszeo2xu8cSTkT+B6mc1GAIKPkZcgJ++Wks0M3ymaJ4Mlv2djzlG
   cB7OUUQ7ARTZtftB0mcRRKH0Bk9ME17ncbLJl/unv8OGoK0viXtB1dABZ
   Juobxkig1Cp+69e6PAYtSWHCCQuQV2IDmcxndcWnSAoOY+kp+76G3Li9Q
   NT2bLliCFdhhN1wzxgqaxeRiomPy57LD428aPLPstpPQ0vjqk7ejrnsoT
   iwKWQcdrMVFX/xXPJAp6fVMXsJDvD5Pbl43zmgy5pcC/eV2aYhxmSIm3x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321987526"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="321987526"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 18:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809217728"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="809217728"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 18:22:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piPwT-000MKz-1r;
	Sat, 01 Apr 2023 01:22:05 +0000
Date: Sat, 1 Apr 2023 09:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7131/8375] net/vmw_vsock/vsock_bpf.c:41:2:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202304010939.Rv5BSsng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/vmw_vsock/vsock_bpf.c:41:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bobby Eshleman <bobby.eshleman@bytedance.com>
CC: Stefano Garzarella <sgarzare@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 634f1a7110b439c65fd8a809171c1d2d28bcea6f [7131/8375] vsock: support sockmap
:::::: branch date: 21 hours ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010939.Rv5BSsng-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=634f1a7110b439c65fd8a809171c1d2d28bcea6f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 634f1a7110b439c65fd8a809171c1d2d28bcea6f
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304010939.Rv5BSsng-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/gro.c:448:2: note: Left side of '&&' is false
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:27: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                           ^
   net/core/gro.c:448:2: note: Taking false branch
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:3: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                   ^
   net/core/gro.c:448:2: note: Taking false branch
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:3: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                   ^
   net/core/gro.c:448:2: note: Null pointer passed as 2nd argument to memory copy function
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:585:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   Suppressed 30 warnings (18 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   32 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   net/vmw_vsock/vsock_bpf.c:82:10: note: Calling 'sk_psock_get'
           psock = sk_psock_get(sk);
                   ^~~~~~~~~~~~~~~~
   include/linux/skmsg.h:440:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:771:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
>> net/vmw_vsock/vsock_bpf.c:41:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/vmw_vsock/vsock_bpf.c:41:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 30 warnings (18 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (18 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   block/partitions/core.c:451:2: note: Taking false branch
           if (!disk_live(disk)) {
           ^
   block/partitions/core.c:456:6: note: Calling 'partition_overlaps'
           if (partition_overlaps(disk, start, length, -1)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/core.c:430:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:771:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (19 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/clk/clkdev.c:379:9: warning: 3rd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           return devm_add_action_or_reset(dev, devm_clkdev_release, cl);
                  ^                                                  ~~
   drivers/clk/clkdev.c:372:2: note: 'cl' declared without an initial value
           struct clk_lookup *cl;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clkdev.c:375:9: note: Calling 'do_clk_register_clkdev'
           rval = do_clk_register_clkdev(hw, &cl, con_id, dev_id);

vim +41 net/vmw_vsock/vsock_bpf.c

634f1a7110b439 Bobby Eshleman 2023-03-27  36  
634f1a7110b439 Bobby Eshleman 2023-03-27  37  static bool vsock_msg_wait_data(struct sock *sk, struct sk_psock *psock, long timeo)
634f1a7110b439 Bobby Eshleman 2023-03-27  38  {
634f1a7110b439 Bobby Eshleman 2023-03-27  39  	bool ret;
634f1a7110b439 Bobby Eshleman 2023-03-27  40  
634f1a7110b439 Bobby Eshleman 2023-03-27 @41  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
634f1a7110b439 Bobby Eshleman 2023-03-27  42  
634f1a7110b439 Bobby Eshleman 2023-03-27  43  	if (sk->sk_shutdown & RCV_SHUTDOWN)
634f1a7110b439 Bobby Eshleman 2023-03-27  44  		return true;
634f1a7110b439 Bobby Eshleman 2023-03-27  45  
634f1a7110b439 Bobby Eshleman 2023-03-27  46  	if (!timeo)
634f1a7110b439 Bobby Eshleman 2023-03-27  47  		return false;
634f1a7110b439 Bobby Eshleman 2023-03-27  48  
634f1a7110b439 Bobby Eshleman 2023-03-27  49  	add_wait_queue(sk_sleep(sk), &wait);
634f1a7110b439 Bobby Eshleman 2023-03-27  50  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
634f1a7110b439 Bobby Eshleman 2023-03-27  51  	ret = vsock_has_data(sk, psock);
634f1a7110b439 Bobby Eshleman 2023-03-27  52  	if (!ret) {
634f1a7110b439 Bobby Eshleman 2023-03-27  53  		wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
634f1a7110b439 Bobby Eshleman 2023-03-27  54  		ret = vsock_has_data(sk, psock);
634f1a7110b439 Bobby Eshleman 2023-03-27  55  	}
634f1a7110b439 Bobby Eshleman 2023-03-27  56  	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
634f1a7110b439 Bobby Eshleman 2023-03-27  57  	remove_wait_queue(sk_sleep(sk), &wait);
634f1a7110b439 Bobby Eshleman 2023-03-27  58  	return ret;
634f1a7110b439 Bobby Eshleman 2023-03-27  59  }
634f1a7110b439 Bobby Eshleman 2023-03-27  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
