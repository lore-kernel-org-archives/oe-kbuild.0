Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FA3205
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675639605; x=1707175605;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xsi+fl0v2PdYRJIMUGSyAc8JBlbXa0t+ms6QmvlwIuM=;
  b=IMqB2mxX8zAgghcXjDnIu+UUxHT6BE1b0bj1ze3SupgJn0R3CcT5z0KP
   UC9Yt0FQrPeY0bwHQ8c4RPalHF7JQYclgVB6dFXCK189RzFV8wI87WUi+
   IplobHJutemmef8hkeF/zJXFeY7CwQPOol8YKZ/UhLNlxCfOoZqpfEh20
   iE2ogfoOSmM29Td72DyYw1jBf73Rds872SypEulxHSoobPPz6Mx+cKlBz
   Vd0i/23BA60oNTNT6H7Lo6NkqCBhrJ14YrM4MZAY0rQEttRtFBQsny1rc
   rSTzsj6y1wnVfk/aA8pBELQ9S6xe7tOEayVJrs/1W7zZoE1TrRD7VWSCi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309434122"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309434122"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 15:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696700395"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="696700395"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Feb 2023 15:26:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOoP9-0002HS-0q;
	Sun, 05 Feb 2023 23:26:39 +0000
Date: Mon, 6 Feb 2023 07:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage
 or undefined [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202302060738.m9inCfPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ec5183ec48656cec489c49f989c508b68b518e3
commit: 538b9265c063f081ca6b1228d242575a1db60711 ARM: unwind: track location of LR value in stack frame
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230204 (https://download.01.org/0day-ci/archive/20230206/202302060738.m9inCfPp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=538b9265c063f081ca6b1228d242575a1db60711
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 538b9265c063f081ca6b1228d242575a1db60711
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   security/keys/process_keys.c:626:13: note: Left side of '&&' is false
           ctx.cred = get_current_cred();
                      ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:626:13: note: Loop condition is false.  Exiting loop
           ctx.cred = get_current_cred();
                      ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:629:2: note: Control jumps to 'case -5:'  at line 703
           switch (id) {
           ^
   security/keys/process_keys.c:704:9: note: Calling 'look_up_user_keyrings'
                   ret = look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:77:28: note: Left side of '&&' is false
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:77:28: note: Loop condition is false.  Exiting loop
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:88:2: note: Taking false branch
           kenter("%u", uid);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "==> %s("FMT")\n", __func__, ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/process_keys.c:91:2: note: Taking true branch
           if (IS_ERR(reg_keyring))
           ^
   security/keys/process_keys.c:92:3: note: Returning without writing to '*_user_session_keyring'
                   return PTR_ERR(reg_keyring);
                   ^
   security/keys/process_keys.c:704:9: note: Returning from 'look_up_user_keyrings'
                   ret = look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:705:7: note: 'ret' is >= 0
                   if (ret < 0)
                       ^~~
   security/keys/process_keys.c:705:3: note: Taking false branch
                   if (ret < 0)
                   ^
   security/keys/process_keys.c:707:13: note: 1st function call argument is an uninitialized value
                   key_ref = make_key_ref(key, 1);
                             ^            ~~~
   4 warnings generated.
>> arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           frame->lr_addr = ctrl.lr_addr;
                          ^
   arch/arm/kernel/unwind.c:489:2: note: Taking false branch
           pr_debug("%s(regs = %p tsk = %p)\n", __func__, regs, tsk);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynamic_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   arch/arm/kernel/unwind.c:489:2: note: Loop condition is false.  Exiting loop
           pr_debug("%s(regs = %p tsk = %p)\n", __func__, regs, tsk);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynamic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   arch/arm/kernel/unwind.c:491:6: note: Assuming 'tsk' is non-null
           if (!tsk)
               ^~~~
   arch/arm/kernel/unwind.c:491:2: note: Taking false branch
           if (!tsk)
           ^
   arch/arm/kernel/unwind.c:494:6: note: Assuming 'regs' is null
           if (regs) {
               ^~~~
   arch/arm/kernel/unwind.c:494:2: note: Taking false branch
           if (regs) {
           ^
   arch/arm/kernel/unwind.c:499:13: note: Assuming the condition is false
           } else if (tsk == current) {
                      ^~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:499:9: note: Taking false branch
           } else if (tsk == current) {
                  ^
   arch/arm/kernel/unwind.c:516:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   arch/arm/kernel/unwind.c:520:9: note: Calling 'unwind_frame'
                   urc = unwind_frame(&frame);
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:398:2: note: Taking false branch
           pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynamic_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   arch/arm/kernel/unwind.c:398:2: note: Loop condition is false.  Exiting loop
           pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynamic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   arch/arm/kernel/unwind.c:401:8: note: Calling 'unwind_find_idx'
           idx = unwind_find_idx(frame->pc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:175:2: note: Taking false branch
           pr_debug("%s(%08lx)\n", __func__, addr);
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)

vim +479 arch/arm/kernel/unwind.c

bff595c15c92b9 Catalin Marinas  2009-02-16  383  
bff595c15c92b9 Catalin Marinas  2009-02-16  384  /*
bff595c15c92b9 Catalin Marinas  2009-02-16  385   * Unwind a single frame starting with *sp for the symbol at *pc. It
bff595c15c92b9 Catalin Marinas  2009-02-16  386   * updates the *pc and *sp with the new values.
bff595c15c92b9 Catalin Marinas  2009-02-16  387   */
bff595c15c92b9 Catalin Marinas  2009-02-16  388  int unwind_frame(struct stackframe *frame)
bff595c15c92b9 Catalin Marinas  2009-02-16  389  {
de66a979012dbc Uwe Kleine-König 2011-12-05  390  	const struct unwind_idx *idx;
bff595c15c92b9 Catalin Marinas  2009-02-16  391  	struct unwind_ctrl_block ctrl;
bff595c15c92b9 Catalin Marinas  2009-02-16  392  
a51345770e5195 Anurag Aggarwal  2014-02-24  393  	/* store the highest address on the stack to avoid crossing it*/
b6506981f880de Ard Biesheuvel   2021-10-05  394  	ctrl.sp_low = frame->sp;
a1c510d0adc604 Ard Biesheuvel   2021-09-23  395  	ctrl.sp_high = ALIGN(ctrl.sp_low - THREAD_SIZE, THREAD_ALIGN)
a1c510d0adc604 Ard Biesheuvel   2021-09-23  396  		       + THREAD_SIZE;
bff595c15c92b9 Catalin Marinas  2009-02-16  397  
bff595c15c92b9 Catalin Marinas  2009-02-16  398  	pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
bff595c15c92b9 Catalin Marinas  2009-02-16  399  		 frame->pc, frame->lr, frame->sp);
bff595c15c92b9 Catalin Marinas  2009-02-16  400  
bff595c15c92b9 Catalin Marinas  2009-02-16  401  	idx = unwind_find_idx(frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  402  	if (!idx) {
8b521cb2947d88 Joe Perches      2014-09-16  403  		pr_warn("unwind: Index not found %08lx\n", frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  404  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  405  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  406  
bff595c15c92b9 Catalin Marinas  2009-02-16  407  	ctrl.vrs[FP] = frame->fp;
bff595c15c92b9 Catalin Marinas  2009-02-16  408  	ctrl.vrs[SP] = frame->sp;
bff595c15c92b9 Catalin Marinas  2009-02-16  409  	ctrl.vrs[LR] = frame->lr;
bff595c15c92b9 Catalin Marinas  2009-02-16  410  	ctrl.vrs[PC] = 0;
bff595c15c92b9 Catalin Marinas  2009-02-16  411  
bff595c15c92b9 Catalin Marinas  2009-02-16  412  	if (idx->insn == 1)
bff595c15c92b9 Catalin Marinas  2009-02-16  413  		/* can't unwind */
bff595c15c92b9 Catalin Marinas  2009-02-16  414  		return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  415  	else if (frame->pc == prel31_to_addr(&idx->addr_offset)) {
532319b9c418fc Ard Biesheuvel   2021-10-04  416  		/*
532319b9c418fc Ard Biesheuvel   2021-10-04  417  		 * Unwinding is tricky when we're halfway through the prologue,
532319b9c418fc Ard Biesheuvel   2021-10-04  418  		 * since the stack frame that the unwinder expects may not be
532319b9c418fc Ard Biesheuvel   2021-10-04  419  		 * fully set up yet. However, one thing we do know for sure is
532319b9c418fc Ard Biesheuvel   2021-10-04  420  		 * that if we are unwinding from the very first instruction of
532319b9c418fc Ard Biesheuvel   2021-10-04  421  		 * a function, we are still effectively in the stack frame of
532319b9c418fc Ard Biesheuvel   2021-10-04  422  		 * the caller, and the unwind info has no relevance yet.
532319b9c418fc Ard Biesheuvel   2021-10-04  423  		 */
532319b9c418fc Ard Biesheuvel   2021-10-04  424  		if (frame->pc == frame->lr)
532319b9c418fc Ard Biesheuvel   2021-10-04  425  			return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  426  		frame->sp_low = frame->sp;
532319b9c418fc Ard Biesheuvel   2021-10-04  427  		frame->pc = frame->lr;
532319b9c418fc Ard Biesheuvel   2021-10-04  428  		return URC_OK;
532319b9c418fc Ard Biesheuvel   2021-10-04  429  	} else if ((idx->insn & 0x80000000) == 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  430  		/* prel31 to the unwind table */
bff595c15c92b9 Catalin Marinas  2009-02-16  431  		ctrl.insn = (unsigned long *)prel31_to_addr(&idx->insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  432  	else if ((idx->insn & 0xff000000) == 0x80000000)
bff595c15c92b9 Catalin Marinas  2009-02-16  433  		/* only personality routine 0 supported in the index */
bff595c15c92b9 Catalin Marinas  2009-02-16  434  		ctrl.insn = &idx->insn;
bff595c15c92b9 Catalin Marinas  2009-02-16  435  	else {
8b521cb2947d88 Joe Perches      2014-09-16  436  		pr_warn("unwind: Unsupported personality routine %08lx in the index at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  437  			idx->insn, idx);
bff595c15c92b9 Catalin Marinas  2009-02-16  438  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  439  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  440  
bff595c15c92b9 Catalin Marinas  2009-02-16  441  	/* check the personality routine */
bff595c15c92b9 Catalin Marinas  2009-02-16  442  	if ((*ctrl.insn & 0xff000000) == 0x80000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  443  		ctrl.byte = 2;
bff595c15c92b9 Catalin Marinas  2009-02-16  444  		ctrl.entries = 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  445  	} else if ((*ctrl.insn & 0xff000000) == 0x81000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  446  		ctrl.byte = 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  447  		ctrl.entries = 1 + ((*ctrl.insn & 0x00ff0000) >> 16);
bff595c15c92b9 Catalin Marinas  2009-02-16  448  	} else {
8b521cb2947d88 Joe Perches      2014-09-16  449  		pr_warn("unwind: Unsupported personality routine %08lx at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  450  			*ctrl.insn, ctrl.insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  451  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  452  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  453  
a51345770e5195 Anurag Aggarwal  2014-02-24  454  	ctrl.check_each_pop = 0;
a51345770e5195 Anurag Aggarwal  2014-02-24  455  
bff595c15c92b9 Catalin Marinas  2009-02-16  456  	while (ctrl.entries > 0) {
a51345770e5195 Anurag Aggarwal  2014-02-24  457  		int urc;
a51345770e5195 Anurag Aggarwal  2014-02-24  458  		if ((ctrl.sp_high - ctrl.vrs[SP]) < sizeof(ctrl.vrs))
a51345770e5195 Anurag Aggarwal  2014-02-24  459  			ctrl.check_each_pop = 1;
a51345770e5195 Anurag Aggarwal  2014-02-24  460  		urc = unwind_exec_insn(&ctrl);
bff595c15c92b9 Catalin Marinas  2009-02-16  461  		if (urc < 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  462  			return urc;
b6506981f880de Ard Biesheuvel   2021-10-05  463  		if (ctrl.vrs[SP] < ctrl.sp_low || ctrl.vrs[SP] > ctrl.sp_high)
c894ed6956f126 Catalin Marinas  2009-06-19  464  			return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  465  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  466  
bff595c15c92b9 Catalin Marinas  2009-02-16  467  	if (ctrl.vrs[PC] == 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  468  		ctrl.vrs[PC] = ctrl.vrs[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  469  
c894ed6956f126 Catalin Marinas  2009-06-19  470  	/* check for infinite loop */
8d54a275938968 Russell King     2019-12-22  471  	if (frame->pc == ctrl.vrs[PC] && frame->sp == ctrl.vrs[SP])
c894ed6956f126 Catalin Marinas  2009-06-19  472  		return -URC_FAILURE;
c894ed6956f126 Catalin Marinas  2009-06-19  473  
bff595c15c92b9 Catalin Marinas  2009-02-16  474  	frame->fp = ctrl.vrs[FP];
bff595c15c92b9 Catalin Marinas  2009-02-16  475  	frame->sp = ctrl.vrs[SP];
bff595c15c92b9 Catalin Marinas  2009-02-16  476  	frame->lr = ctrl.vrs[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  477  	frame->pc = ctrl.vrs[PC];
4ab6827081c63b Ard Biesheuvel   2021-10-05  478  	frame->sp_low = ctrl.sp_low;
538b9265c063f0 Ard Biesheuvel   2022-01-24 @479  	frame->lr_addr = ctrl.lr_addr;
bff595c15c92b9 Catalin Marinas  2009-02-16  480  
bff595c15c92b9 Catalin Marinas  2009-02-16  481  	return URC_OK;
bff595c15c92b9 Catalin Marinas  2009-02-16  482  }
bff595c15c92b9 Catalin Marinas  2009-02-16  483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
