Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC068288
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS0Ee/pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702496957; x=1734032957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FuUZrdFO1Wcxomg6AIvL/RMSmaTzaPy7MRMdGFbmOqY=;
  b=MS0Ee/pAgYdm4Uoi+0jRdGWlRL5mn+KZydn9ansZcJ6KTZ/dRnLWgAqN
   TxYDxT2YJj396im1y3XXGobh5cy/YXssb59/1ywOZqpPRdDlzKpUE9GAU
   cmCpOY9MKfqhi3/mjmgGRfS6kzOm2HoxqxtuqK6+CSVf7YXcjLRBeqkeY
   X7rEtoWpM2QwBgXNTdFfJr/5XRpOo+c6BKuFAcpUPftq0ttfEp+byqkHL
   cMXcDe/1JKCjgjttdKYRvNhgChUtts+5b9sMnYRp07PDOTahYXnhBFt/L
   fDJnZUt0AhrDak3puOOBf+GadCD3BhpgelpvtSsrVDGA7uNKmRo2bdk1B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="13715431"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="13715431"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1021236427"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="1021236427"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2023 11:49:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDVED-000L4x-2F;
	Wed, 13 Dec 2023 19:49:09 +0000
Date: Thu, 14 Dec 2023 03:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/3] entry: move exit to usermode functions to header file
Message-ID: <202312140345.y20Pgw79-lkp@intel.com>
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
In-Reply-To: <20231205133015.752543-2-svens@linux.ibm.com>
References: <20231205133015.752543-2-svens@linux.ibm.com>
TO: Sven Schnelle <svens@linux.ibm.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Andy Lutomirski <luto@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: Heiko Carstens <hca@linux.ibm.com>

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/core/entry]
[also build test WARNING on linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-Schnelle/entry-move-exit-to-usermode-functions-to-header-file/20231205-213501
base:   tip/core/entry
patch link:    https://lore.kernel.org/r/20231205133015.752543-2-svens%40linux.ibm.com
patch subject: [PATCH 1/3] entry: move exit to usermode functions to header file
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231214/202312140345.y20Pgw79-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140345.y20Pgw79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312140345.y20Pgw79-lkp@intel.com/

smatch warnings:
include/linux/entry-common.h:285 exit_to_user_mode_loop() warn: bitwise AND condition is false here

vim +285 include/linux/entry-common.h

a9f3a74a29af09 Thomas Gleixner 2020-07-22  264  
f682d70e117d9c Sven Schnelle   2023-12-05  265  /**
f682d70e117d9c Sven Schnelle   2023-12-05  266   * exit_to_user_mode_loop - do any pending work before leaving to user space
f682d70e117d9c Sven Schnelle   2023-12-05  267   */
f682d70e117d9c Sven Schnelle   2023-12-05  268  static __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
f682d70e117d9c Sven Schnelle   2023-12-05  269  							    unsigned long ti_work)
f682d70e117d9c Sven Schnelle   2023-12-05  270  {
f682d70e117d9c Sven Schnelle   2023-12-05  271  	/*
f682d70e117d9c Sven Schnelle   2023-12-05  272  	 * Before returning to user space ensure that all pending work
f682d70e117d9c Sven Schnelle   2023-12-05  273  	 * items have been completed.
f682d70e117d9c Sven Schnelle   2023-12-05  274  	 */
f682d70e117d9c Sven Schnelle   2023-12-05  275  	while (ti_work & EXIT_TO_USER_MODE_WORK) {
f682d70e117d9c Sven Schnelle   2023-12-05  276  
f682d70e117d9c Sven Schnelle   2023-12-05  277  		local_irq_enable_exit_to_user(ti_work);
f682d70e117d9c Sven Schnelle   2023-12-05  278  
f682d70e117d9c Sven Schnelle   2023-12-05  279  		if (ti_work & _TIF_NEED_RESCHED)
f682d70e117d9c Sven Schnelle   2023-12-05  280  			schedule();
f682d70e117d9c Sven Schnelle   2023-12-05  281  
f682d70e117d9c Sven Schnelle   2023-12-05  282  		if (ti_work & _TIF_UPROBE)
f682d70e117d9c Sven Schnelle   2023-12-05  283  			uprobe_notify_resume(regs);
f682d70e117d9c Sven Schnelle   2023-12-05  284  
f682d70e117d9c Sven Schnelle   2023-12-05 @285  		if (ti_work & _TIF_PATCH_PENDING)
f682d70e117d9c Sven Schnelle   2023-12-05  286  			klp_update_patch_state(current);
f682d70e117d9c Sven Schnelle   2023-12-05  287  
f682d70e117d9c Sven Schnelle   2023-12-05  288  		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
f682d70e117d9c Sven Schnelle   2023-12-05  289  			arch_do_signal_or_restart(regs);
f682d70e117d9c Sven Schnelle   2023-12-05  290  
f682d70e117d9c Sven Schnelle   2023-12-05  291  		if (ti_work & _TIF_NOTIFY_RESUME)
f682d70e117d9c Sven Schnelle   2023-12-05  292  			resume_user_mode_work(regs);
f682d70e117d9c Sven Schnelle   2023-12-05  293  
f682d70e117d9c Sven Schnelle   2023-12-05  294  		/* Architecture specific TIF work */
f682d70e117d9c Sven Schnelle   2023-12-05  295  		arch_exit_to_user_mode_work(regs, ti_work);
f682d70e117d9c Sven Schnelle   2023-12-05  296  
f682d70e117d9c Sven Schnelle   2023-12-05  297  		/*
f682d70e117d9c Sven Schnelle   2023-12-05  298  		 * Disable interrupts and reevaluate the work flags as they
f682d70e117d9c Sven Schnelle   2023-12-05  299  		 * might have changed while interrupts and preemption was
f682d70e117d9c Sven Schnelle   2023-12-05  300  		 * enabled above.
f682d70e117d9c Sven Schnelle   2023-12-05  301  		 */
f682d70e117d9c Sven Schnelle   2023-12-05  302  		local_irq_disable_exit_to_user();
f682d70e117d9c Sven Schnelle   2023-12-05  303  
f682d70e117d9c Sven Schnelle   2023-12-05  304  		/* Check if any of the above work has queued a deferred wakeup */
f682d70e117d9c Sven Schnelle   2023-12-05  305  		tick_nohz_user_enter_prepare();
f682d70e117d9c Sven Schnelle   2023-12-05  306  
f682d70e117d9c Sven Schnelle   2023-12-05  307  		ti_work = read_thread_flags();
f682d70e117d9c Sven Schnelle   2023-12-05  308  	}
f682d70e117d9c Sven Schnelle   2023-12-05  309  
f682d70e117d9c Sven Schnelle   2023-12-05  310  	/* Return the latest work state for arch_exit_to_user_mode() */
f682d70e117d9c Sven Schnelle   2023-12-05  311  	return ti_work;
f682d70e117d9c Sven Schnelle   2023-12-05  312  }
f682d70e117d9c Sven Schnelle   2023-12-05  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
