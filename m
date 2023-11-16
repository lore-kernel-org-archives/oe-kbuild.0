Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D285638B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1gDmt43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095206; x=1731631206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4CgHhIPJLs22QBr2DQRp1sC9pdIHoSDFSACQjd8ca58=;
  b=S1gDmt43E/f7Hj6RKON0Sc/5/3U/6qdurl/bC6MzJFQv622Sh07vx6qO
   UDm34yhCtxuhPJyqTz3vGoUCkotSdb17Nd2I9Mu/LHZmMjXbBTgkXHNGA
   UAVdzr7NhhL1hvHIMcPPhHqrtMiEgLLkMaUa7bFt+DcFZDYDv38Hx6lne
   100++tZNj3ydpqoBqJSCNSjc6jq1ThIK2ABrd1KcyyPGEH3cRxpz6ooJJ
   mss1w/KMe7DDiMg+3HDLHvtj2bZBIClZOlwvLAgUNAwFDNi3JrNPuWzxZ
   7nMsXeiLSxUmP3afgwgpFtWSbOBSji/TWnOhjObBIN2g8v1TFRxR915lW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388150716"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388150716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="938655451"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="938655451"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 16:40:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QPN-00013L-31;
	Thu, 16 Nov 2023 00:39:16 +0000
Date: Thu, 16 Nov 2023 08:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/entry/common.c:164 exit_to_user_mode_loop() warn: bitwise AND
 condition is false here
Message-ID: <202311160838.sPbDxYkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: "Björn Töpel" <bjorn@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: f0bddf50586da81360627a772be0e355b62f071e riscv: entry: Convert to generic entry
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311160838.sPbDxYkx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160838.sPbDxYkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160838.sPbDxYkx-lkp@intel.com/

smatch warnings:
kernel/entry/common.c:164 exit_to_user_mode_loop() warn: bitwise AND condition is false here
arch/riscv/include/asm/syscall.h:87 syscall_handler() warn: inconsistent indenting

vim +164 kernel/entry/common.c

a9f3a74a29af09 Thomas Gleixner     2020-07-22  146  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  147  static unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
a9f3a74a29af09 Thomas Gleixner     2020-07-22  148  					    unsigned long ti_work)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  149  {
a9f3a74a29af09 Thomas Gleixner     2020-07-22  150  	/*
a9f3a74a29af09 Thomas Gleixner     2020-07-22  151  	 * Before returning to user space ensure that all pending work
a9f3a74a29af09 Thomas Gleixner     2020-07-22  152  	 * items have been completed.
a9f3a74a29af09 Thomas Gleixner     2020-07-22  153  	 */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  154  	while (ti_work & EXIT_TO_USER_MODE_WORK) {
a9f3a74a29af09 Thomas Gleixner     2020-07-22  155  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  156  		local_irq_enable_exit_to_user(ti_work);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  157  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  158  		if (ti_work & _TIF_NEED_RESCHED)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  159  			schedule();
a9f3a74a29af09 Thomas Gleixner     2020-07-22  160  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  161  		if (ti_work & _TIF_UPROBE)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  162  			uprobe_notify_resume(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  163  
a9f3a74a29af09 Thomas Gleixner     2020-07-22 @164  		if (ti_work & _TIF_PATCH_PENDING)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  165  			klp_update_patch_state(current);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  166  
12db8b690010cc Jens Axboe          2020-10-26  167  		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
8ba62d37949e24 Eric W. Biederman   2022-02-09  168  			arch_do_signal_or_restart(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  169  
a68de80f61f6af Sean Christopherson 2021-09-01  170  		if (ti_work & _TIF_NOTIFY_RESUME)
03248addadf1a5 Eric W. Biederman   2022-02-09  171  			resume_user_mode_work(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  172  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  173  		/* Architecture specific TIF work */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  174  		arch_exit_to_user_mode_work(regs, ti_work);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  175  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  176  		/*
a9f3a74a29af09 Thomas Gleixner     2020-07-22  177  		 * Disable interrupts and reevaluate the work flags as they
a9f3a74a29af09 Thomas Gleixner     2020-07-22  178  		 * might have changed while interrupts and preemption was
a9f3a74a29af09 Thomas Gleixner     2020-07-22  179  		 * enabled above.
a9f3a74a29af09 Thomas Gleixner     2020-07-22  180  		 */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  181  		local_irq_disable_exit_to_user();
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  182  
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  183  		/* Check if any of the above work has queued a deferred wakeup */
f268c3737ecaef Frederic Weisbecker 2021-05-27  184  		tick_nohz_user_enter_prepare();
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  185  
6ce895128b3bff Mark Rutland        2021-11-29  186  		ti_work = read_thread_flags();
a9f3a74a29af09 Thomas Gleixner     2020-07-22  187  	}
a9f3a74a29af09 Thomas Gleixner     2020-07-22  188  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  189  	/* Return the latest work state for arch_exit_to_user_mode() */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  190  	return ti_work;
a9f3a74a29af09 Thomas Gleixner     2020-07-22  191  }
a9f3a74a29af09 Thomas Gleixner     2020-07-22  192  

:::::: The code at line 164 was first introduced by commit
:::::: a9f3a74a29af095f3e1b89e9176f8127912ae0f0 entry: Provide generic syscall exit function

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
