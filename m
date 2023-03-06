Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D85D30B
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 05:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678079161; x=1709615161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwiLkud+fuKao4JtN4s0CJ5K2ymnafo6m5GkCKGbrvU=;
  b=FDEcPoqEvPDNImrZID8c6KCCbaJZR/23utg4cdqc4tz01WBLUom4sUae
   0mRNJeMLmTgnDxn62wj2eA/rZTdQtfzI/IWSxK4WfNqr1itquix0CLOxs
   z9IO1mz0g+K56+pZgR2Pp0grktP2+nQNK4a0qoxyvYV5xcwLAzB7s5nBX
   FB+XI5saMboHbOF7502+0s2lo1NVwIULBMtCPCewMictiCc1kVKbGjmz9
   c3MAHdVGuFOPVM31bHpxgnfQL9XRk960d8/PwmTAXOENy8kN+2fa+EER6
   Z/UZ7NnP8lPo6CsMHQm5rP3DiILqXc5+NTOEo7ewsKcTq1bpn4N8Ec4Vi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="334189376"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="334189376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:06:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="765097880"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="765097880"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2023 21:05:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ32h-00002n-2g;
	Mon, 06 Mar 2023 05:05:47 +0000
Date: Mon, 6 Mar 2023 13:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: io_uring/io_uring.c:10999:3: warning: Argument to kfree() is the
 address of the local variable 'list', which is not memory allocated by
 malloc() [clang-analyzer-unix.Malloc]
Message-ID: <202303061313.W9qVh3BN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/io_uring.c:10999:3: warning: Argument to kfree() is the address of the local variable 'list', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: ed29b0b4fd835b058ddd151c49d021e28d631ee6 io_uring: move to separate directory
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230306/202303061313.W9qVh3BN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed29b0b4fd835b058ddd151c49d021e28d631ee6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed29b0b4fd835b058ddd151c49d021e28d631ee6
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303061313.W9qVh3BN-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                 ^
   io_uring/io_uring.c:10986:3: note: Assuming the condition is false
                   if (io_match_task_safe(de->req, task, cancel_all)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   io_uring/io_uring.c:10986:3: note: '?' condition is true
                   if (io_match_task_safe(de->req, task, cancel_all)) {
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
   io_uring/io_uring.c:10986:3: note: Taking true branch
                   if (io_match_task_safe(de->req, task, cancel_all)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   io_uring/io_uring.c:10988:4: note:  Execution continues on line 10991
                           break;
                           ^
   io_uring/io_uring.c:10992:2: note: Assuming the condition is false
           if (list_empty(&list))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   io_uring/io_uring.c:10992:2: note: '?' condition is false
           if (list_empty(&list))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   io_uring/io_uring.c:10992:2: note: Assuming the condition is true
           if (list_empty(&list))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   io_uring/io_uring.c:10992:2: note: '?' condition is false
           if (list_empty(&list))
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
   io_uring/io_uring.c:10992:2: note: Taking false branch
           if (list_empty(&list))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   io_uring/io_uring.c:10995:9: note: Assuming the condition is true
           while (!list_empty(&list)) {
                  ^~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c:10995:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   io_uring/io_uring.c:10999:3: note: Memory is released
                   kfree(de);
                   ^~~~~~~~~
   io_uring/io_uring.c:10995:9: note: Assuming the condition is true
           while (!list_empty(&list)) {
                  ^~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c:10995:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   io_uring/io_uring.c:10998:26: note: Use of memory after it is freed
                   io_req_complete_failed(de->req, -ECANCELED);
                                          ^~~~~~~
>> io_uring/io_uring.c:10999:3: warning: Argument to kfree() is the address of the local variable 'list', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(de);
                   ^
   io_uring/io_uring.c:11033:31: note: Assuming 'task' is null
           struct io_uring_task *tctx = task ? task->io_uring : NULL;
                                        ^~~~
   io_uring/io_uring.c:11033:31: note: '?' condition is false
   io_uring/io_uring.c:11036:6: note: Assuming field 'rings' is non-null
           if (!ctx->rings)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   io_uring/io_uring.c:11036:2: note: '?' condition is false
           if (!ctx->rings)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   io_uring/io_uring.c:11036:12: note: Field 'rings' is non-null
           if (!ctx->rings)
                     ^
   io_uring/io_uring.c:11036:2: note: '?' condition is false
           if (!ctx->rings)
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
   io_uring/io_uring.c:11036:2: note: Taking false branch
           if (!ctx->rings)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   io_uring/io_uring.c:11039:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   io_uring/io_uring.c:11043:3: note: '?' condition is false
                   if (!task) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   io_uring/io_uring.c:11043:8: note: 'task' is null
                   if (!task) {
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   io_uring/io_uring.c:11043:3: note: '?' condition is true
                   if (!task) {
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
   io_uring/io_uring.c:11043:3: note: Taking true branch
                   if (!task) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   io_uring/io_uring.c:11056:8: note: Assuming the condition is false
                   if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) ||
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   io_uring/io_uring.c:11056:44: note: Left side of '&&' is false
                   if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) ||
                                                            ^
   io_uring/io_uring.c:11057:8: note: Assuming field 'sq_data' is null

vim +/list +10999 io_uring/io_uring.c

b711d4eaf0c408 fs/io_uring.c Jens Axboe     2020-08-16  10976  
c072481ded14bc fs/io_uring.c Pavel Begunkov 2021-10-04  10977  static __cold bool io_cancel_defer_files(struct io_ring_ctx *ctx,
c072481ded14bc fs/io_uring.c Pavel Begunkov 2021-10-04  10978  					 struct task_struct *task,
c072481ded14bc fs/io_uring.c Pavel Begunkov 2021-10-04  10979  					 bool cancel_all)
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10980  {
e1915f76a8981f fs/io_uring.c Pavel Begunkov 2021-03-11  10981  	struct io_defer_entry *de;
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10982  	LIST_HEAD(list);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10983  
79ebeaee8a21a0 fs/io_uring.c Jens Axboe     2021-08-10  10984  	spin_lock(&ctx->completion_lock);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10985  	list_for_each_entry_reverse(de, &ctx->defer_list, list) {
6af3f48bf6156a fs/io_uring.c Pavel Begunkov 2021-11-26  10986  		if (io_match_task_safe(de->req, task, cancel_all)) {
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10987  			list_cut_position(&list, &ctx->defer_list, &de->list);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10988  			break;
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10989  		}
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10990  	}
79ebeaee8a21a0 fs/io_uring.c Jens Axboe     2021-08-10  10991  	spin_unlock(&ctx->completion_lock);
e1915f76a8981f fs/io_uring.c Pavel Begunkov 2021-03-11  10992  	if (list_empty(&list))
e1915f76a8981f fs/io_uring.c Pavel Begunkov 2021-03-11  10993  		return false;
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10994  
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06 @10995  	while (!list_empty(&list)) {
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10996  		de = list_first_entry(&list, struct io_defer_entry, list);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  10997  		list_del_init(&de->list);
f41db2732d4835 fs/io_uring.c Pavel Begunkov 2021-02-28  10998  		io_req_complete_failed(de->req, -ECANCELED);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06 @10999  		kfree(de);
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  11000  	}
e1915f76a8981f fs/io_uring.c Pavel Begunkov 2021-03-11  11001  	return true;
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  11002  }
b7ddce3cbf010e fs/io_uring.c Pavel Begunkov 2020-09-06  11003  

:::::: The code at line 10999 was first introduced by commit
:::::: b7ddce3cbf010edbfac6c6d8cc708560a7bcd7a4 io_uring: fix cancel of deferred reqs with ->files

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
