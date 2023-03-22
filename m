Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559442566
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679485177; x=1711021177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpkLSV8nSoIrww4xxDPoO+mkAS845T1I3dri50v4wSg=;
  b=P23s9uEK4+fgKt6gWJ2v8lo09O0fG14TgzvyI0rXwyEXRUkImTGjPuFy
   m6qjspmxH5OrPffRxX7B5++EoLiSZNZJtnkCFYt/BAqHxIeUYxXd1kmj/
   k1KIK6FrIpb0b5WdNUo3GYC7ZlAb1WesAhQhWokxea8+f9kMiWYsUw8/K
   ZHzYe7ZNd3jvWYVkeoLK9aGNt+OROd01aNT70yS5UwAUBMTfjbSKwk7pU
   2+8wRSq43ZhsCMfU/4e1X4dDQ6Z42wIyNzaaKCfTdW3bF/RtncgeWXfrY
   cUKLBVanGu2khsQzNec0DYmnyiSmLbStSyMa0DTQBYZaEJs7fQiI4KH4f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319581958"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="319581958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 04:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011327718"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="1011327718"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2023 04:39:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pewoY-000DFQ-3B;
	Wed, 22 Mar 2023 11:39:34 +0000
Date: Wed, 22 Mar 2023 19:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/compat_signal.c:116 compat_restore_sigcontext()
 warn: maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202303221911.0Y0bXa7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Guo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a1effab7a3a35a837dd9d2b974a1bc4939df1ad5
commit: 9be8459298eadb39b9fe9974b890239e9c123107 riscv: compat: Add COMPAT Kbuild skeletal support
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-m031-20230322 (https://download.01.org/0day-ci/archive/20230322/202303221911.0Y0bXa7A-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221911.0Y0bXa7A-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/compat_signal.c:116 compat_restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/compat_signal.c:173 compat_setup_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +116 arch/riscv/kernel/compat_signal.c

7383ee05314be5 Guo Ren 2022-04-05  101  
7383ee05314be5 Guo Ren 2022-04-05  102  static long compat_restore_sigcontext(struct pt_regs *regs,
7383ee05314be5 Guo Ren 2022-04-05  103  	struct compat_sigcontext __user *sc)
7383ee05314be5 Guo Ren 2022-04-05  104  {
7383ee05314be5 Guo Ren 2022-04-05  105  	long err;
7383ee05314be5 Guo Ren 2022-04-05  106  	struct compat_user_regs_struct cregs;
7383ee05314be5 Guo Ren 2022-04-05  107  
7383ee05314be5 Guo Ren 2022-04-05  108  	/* sc_regs is structured the same as the start of pt_regs */
7383ee05314be5 Guo Ren 2022-04-05  109  	err = __copy_from_user(&cregs, &sc->sc_regs, sizeof(sc->sc_regs));
7383ee05314be5 Guo Ren 2022-04-05  110  
7383ee05314be5 Guo Ren 2022-04-05  111  	cregs_to_regs(&cregs, regs);
7383ee05314be5 Guo Ren 2022-04-05  112  
7383ee05314be5 Guo Ren 2022-04-05  113  	/* Restore the floating-point state. */
7383ee05314be5 Guo Ren 2022-04-05  114  	if (has_fpu())
7383ee05314be5 Guo Ren 2022-04-05  115  		err |= compat_restore_fp_state(regs, &sc->sc_fpregs);
7383ee05314be5 Guo Ren 2022-04-05 @116  	return err;
7383ee05314be5 Guo Ren 2022-04-05  117  }
7383ee05314be5 Guo Ren 2022-04-05  118  
7383ee05314be5 Guo Ren 2022-04-05  119  COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
7383ee05314be5 Guo Ren 2022-04-05  120  {
7383ee05314be5 Guo Ren 2022-04-05  121  	struct pt_regs *regs = current_pt_regs();
7383ee05314be5 Guo Ren 2022-04-05  122  	struct compat_rt_sigframe __user *frame;
7383ee05314be5 Guo Ren 2022-04-05  123  	struct task_struct *task;
7383ee05314be5 Guo Ren 2022-04-05  124  	sigset_t set;
7383ee05314be5 Guo Ren 2022-04-05  125  
7383ee05314be5 Guo Ren 2022-04-05  126  	/* Always make any pending restarted system calls return -EINTR */
7383ee05314be5 Guo Ren 2022-04-05  127  	current->restart_block.fn = do_no_restart_syscall;
7383ee05314be5 Guo Ren 2022-04-05  128  
7383ee05314be5 Guo Ren 2022-04-05  129  	frame = (struct compat_rt_sigframe __user *)regs->sp;
7383ee05314be5 Guo Ren 2022-04-05  130  
7383ee05314be5 Guo Ren 2022-04-05  131  	if (!access_ok(frame, sizeof(*frame)))
7383ee05314be5 Guo Ren 2022-04-05  132  		goto badframe;
7383ee05314be5 Guo Ren 2022-04-05  133  
7383ee05314be5 Guo Ren 2022-04-05  134  	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
7383ee05314be5 Guo Ren 2022-04-05  135  		goto badframe;
7383ee05314be5 Guo Ren 2022-04-05  136  
7383ee05314be5 Guo Ren 2022-04-05  137  	set_current_blocked(&set);
7383ee05314be5 Guo Ren 2022-04-05  138  
7383ee05314be5 Guo Ren 2022-04-05  139  	if (compat_restore_sigcontext(regs, &frame->uc.uc_mcontext))
7383ee05314be5 Guo Ren 2022-04-05  140  		goto badframe;
7383ee05314be5 Guo Ren 2022-04-05  141  
7383ee05314be5 Guo Ren 2022-04-05  142  	if (compat_restore_altstack(&frame->uc.uc_stack))
7383ee05314be5 Guo Ren 2022-04-05  143  		goto badframe;
7383ee05314be5 Guo Ren 2022-04-05  144  
7383ee05314be5 Guo Ren 2022-04-05  145  	return regs->a0;
7383ee05314be5 Guo Ren 2022-04-05  146  
7383ee05314be5 Guo Ren 2022-04-05  147  badframe:
7383ee05314be5 Guo Ren 2022-04-05  148  	task = current;
7383ee05314be5 Guo Ren 2022-04-05  149  	if (show_unhandled_signals) {
7383ee05314be5 Guo Ren 2022-04-05  150  		pr_info_ratelimited(
7383ee05314be5 Guo Ren 2022-04-05  151  			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
7383ee05314be5 Guo Ren 2022-04-05  152  			task->comm, task_pid_nr(task), __func__,
7383ee05314be5 Guo Ren 2022-04-05  153  			frame, (void *)regs->epc, (void *)regs->sp);
7383ee05314be5 Guo Ren 2022-04-05  154  	}
7383ee05314be5 Guo Ren 2022-04-05  155  	force_sig(SIGSEGV);
7383ee05314be5 Guo Ren 2022-04-05  156  	return 0;
7383ee05314be5 Guo Ren 2022-04-05  157  }
7383ee05314be5 Guo Ren 2022-04-05  158  
7383ee05314be5 Guo Ren 2022-04-05  159  static long compat_setup_sigcontext(struct compat_rt_sigframe __user *frame,
7383ee05314be5 Guo Ren 2022-04-05  160  	struct pt_regs *regs)
7383ee05314be5 Guo Ren 2022-04-05  161  {
7383ee05314be5 Guo Ren 2022-04-05  162  	struct compat_sigcontext __user *sc = &frame->uc.uc_mcontext;
7383ee05314be5 Guo Ren 2022-04-05  163  	struct compat_user_regs_struct cregs;
7383ee05314be5 Guo Ren 2022-04-05  164  	long err;
7383ee05314be5 Guo Ren 2022-04-05  165  
7383ee05314be5 Guo Ren 2022-04-05  166  	regs_to_cregs(&cregs, regs);
7383ee05314be5 Guo Ren 2022-04-05  167  
7383ee05314be5 Guo Ren 2022-04-05  168  	/* sc_regs is structured the same as the start of pt_regs */
7383ee05314be5 Guo Ren 2022-04-05  169  	err = __copy_to_user(&sc->sc_regs, &cregs, sizeof(sc->sc_regs));
7383ee05314be5 Guo Ren 2022-04-05  170  	/* Save the floating-point state. */
7383ee05314be5 Guo Ren 2022-04-05  171  	if (has_fpu())
7383ee05314be5 Guo Ren 2022-04-05  172  		err |= compat_save_fp_state(regs, &sc->sc_fpregs);
7383ee05314be5 Guo Ren 2022-04-05 @173  	return err;
7383ee05314be5 Guo Ren 2022-04-05  174  }
7383ee05314be5 Guo Ren 2022-04-05  175  

:::::: The code at line 116 was first introduced by commit
:::::: 7383ee05314be58f8f9f018ee0ac53bef3808aea riscv: compat: signal: Add rt_frame implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
