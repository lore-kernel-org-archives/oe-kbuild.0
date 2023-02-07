Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CD7F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 01:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675734869; x=1707270869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJO/TXyj0mAw2SDClF3wDySdhjVC/4EsXUzE1lnoIek=;
  b=QErsX7YGBicli+COn4WqCMoL/CAMWy0yYJqPEtufAX8FExL6JM/kh668
   pI6+YTFW1erDzU0a8X0Jhzp5hQ87s3ebfLVJKAktBNpZkBSy2LaduSUOA
   pIZEJ2oYMn+Z7ZBfcIvvc3jV64CVQB9CevRl42PWeLdyBT6hQzXjsqSWw
   U5FvIUB4kyVu2c+e34B0cEDf7HcahQqTrBd16vWRfeY78f8XFhtUdcUEo
   QkwEFFTOd0saVkKuh+mCGcFs+V54rsMgMjGYfmO4w99sega5ssCKUAAHW
   gNobxEIAoTT6InKu2uKakIiH9uTO24EEBeAJwQDIxXK/lxVEP9EKhUPo9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="393973398"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="393973398"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 17:54:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="995548603"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="995548603"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2023 17:54:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPDBi-0002wQ-1T;
	Tue, 07 Feb 2023 01:54:26 +0000
Date: Tue, 7 Feb 2023 09:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/rxrpc/call_object.c:528:27: warning: Value stored to 'conn'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302070959.sI0MyjXY-lkp@intel.com>
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
head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
commit: 03fc55adf8761c546d72798264b019c9f672c578 rxrpc: Only disconnect calls in the I/O thread
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20230204 (https://download.01.org/0day-ci/archive/20230207/202302070959.sI0MyjXY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03fc55adf8761c546d72798264b019c9f672c578
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 03fc55adf8761c546d72798264b019c9f672c578
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                             ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   lib/test_lockup.c:569:5: note: '?' condition is false
                     reacquire_locks ? "reacquire_locks " : "");
                     ^
   lib/test_lockup.c:571:6: note: Assuming 'alloc_pages_nr' is 0
           if (alloc_pages_nr)
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:571:2: note: Taking false branch
           if (alloc_pages_nr)
           ^
   lib/test_lockup.c:576:6: note: Assuming 'all_cpus' is false
           if (all_cpus) {
               ^~~~~~~~
   lib/test_lockup.c:576:2: note: Taking false branch
           if (all_cpus) {
           ^
   lib/test_lockup.c:595:3: note: Calling 'test_lockup'
                   test_lockup(true);
                   ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:355:2: note: Loop condition is false.  Exiting loop
           pr_notice("Start on CPU%d\n", raw_smp_processor_id());
           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:403:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   lib/test_lockup.c:359:2: note: Calling 'test_alloc_pages'
           test_alloc_pages(&pages);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:309:14: note: Assuming 'i' is >= 'alloc_pages_nr'
           for (i = 0; i < alloc_pages_nr; i++) {
                       ^~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:309:2: note: Loop condition is false. Execution continues on line 309
           for (i = 0; i < alloc_pages_nr; i++) {
           ^
   lib/test_lockup.c:359:2: note: Returning from 'test_alloc_pages'
           test_alloc_pages(&pages);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:361:9: note: Assuming the condition is false
           while (iter++ < iterations && !signal_pending(main_task)) {
                  ^~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:361:29: note: Left side of '&&' is false
           while (iter++ < iterations && !signal_pending(main_task)) {
                                      ^
   lib/test_lockup.c:395:2: note: Loop condition is false.  Exiting loop
           pr_notice("Finish on CPU%d in %lld ns\n", raw_smp_processor_id(),
           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:403:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   lib/test_lockup.c:398:2: note: Calling 'test_free_pages'
           test_free_pages(&pages);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:323:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:2: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
           ^              ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/rxrpc/call_object.c:528:27: warning: Value stored to 'conn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rxrpc_connection *conn = call->conn;
                                    ^~~~   ~~~~~~~~~~
   net/rxrpc/call_object.c:528:27: note: Value stored to 'conn' during its initialization is never read
           struct rxrpc_connection *conn = call->conn;
                                    ^~~~   ~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/rxrpc/conn_client.c:160:20: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           unsigned int id = bundle->debug_id;
                             ^
   net/rxrpc/conn_client.c:724:2: note: Taking false branch
           _enter("{%d,%lx},", call->debug_id, call->user_call_ID);
           ^
   net/rxrpc/ar-internal.h:1268:25: note: expanded from macro '_enter'
   #define _enter(FMT,...) no_printk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
                           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/rxrpc/conn_client.c:731:2: note: Taking false branch
           if (IS_ERR(bundle)) {
           ^
   net/rxrpc/conn_client.c:737:6: note: Assuming field 'state' is not equal to RXRPC_CALL_CLIENT_AWAIT_CONN
           if (call->state == RXRPC_CALL_CLIENT_AWAIT_CONN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:737:2: note: Taking false branch
           if (call->state == RXRPC_CALL_CLIENT_AWAIT_CONN) {
           ^
   net/rxrpc/conn_client.c:748:2: note: Calling 'rxrpc_deactivate_bundle'
           rxrpc_deactivate_bundle(bundle);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:959:6: note: Assuming the condition is true
           if (atomic_dec_and_lock(&bundle->active, &local->client_bundles_lock)) {
               ^
   include/linux/spinlock.h:472:21: note: expanded from macro 'atomic_dec_and_lock'
                   __cond_lock(lock, _atomic_dec_and_lock(atomic, lock))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:63:28: note: expanded from macro '__cond_lock'
   # define __cond_lock(x,c) (c)
                              ^
   net/rxrpc/conn_client.c:959:2: note: Taking true branch
           if (atomic_dec_and_lock(&bundle->active, &local->client_bundles_lock)) {
           ^
   net/rxrpc/conn_client.c:960:7: note: Assuming field 'exclusive' is false
                   if (!bundle->exclusive) {
                       ^~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:960:3: note: Taking true branch
                   if (!bundle->exclusive) {
                   ^
   net/rxrpc/conn_client.c:961:4: note: Taking false branch
                           _debug("erase bundle");
                           ^
   net/rxrpc/ar-internal.h:1270:25: note: expanded from macro '_debug'
   #define _debug(FMT,...) no_printk("    "FMT ,##__VA_ARGS__)
                           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/rxrpc/conn_client.c:967:7: note: 'need_put' is true
                   if (need_put)
                       ^~~~~~~~
   net/rxrpc/conn_client.c:967:3: note: Taking true branch
                   if (need_put)
                   ^
   net/rxrpc/conn_client.c:968:4: note: Calling 'rxrpc_put_bundle'
                           rxrpc_put_bundle(bundle, rxrpc_bundle_put_discard);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:166:6: note: 'dead' is true
           if (dead)
               ^~~~
   net/rxrpc/conn_client.c:166:2: note: Taking true branch
           if (dead)
           ^
   net/rxrpc/conn_client.c:167:3: note: Calling 'rxrpc_free_bundle'
                   rxrpc_free_bundle(bundle);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:155:2: note: Memory is released
           kfree(bundle);
           ^~~~~~~~~~~~~
   net/rxrpc/conn_client.c:167:3: note: Returning; memory was released
                   rxrpc_free_bundle(bundle);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:968:4: note: Returning; memory was released
                           rxrpc_put_bundle(bundle, rxrpc_bundle_put_discard);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:748:2: note: Returning; memory was released
           rxrpc_deactivate_bundle(bundle);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:749:2: note: Calling 'rxrpc_put_bundle'
           rxrpc_put_bundle(bundle, rxrpc_bundle_get_client_call);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:160:20: note: Use of memory after it is freed
           unsigned int id = bundle->debug_id;
                             ^~~~~~~~~~~~~~~~
   net/rxrpc/conn_client.c:749:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           rxrpc_put_bundle(bundle, rxrpc_bundle_get_client_call);
           ^                ~~~~~~
   net/rxrpc/conn_client.c:724:2: note: Taking false branch
           _enter("{%d,%lx},", call->debug_id, call->user_call_ID);

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
