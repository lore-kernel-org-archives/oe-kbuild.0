Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D02E413
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKWleaiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701904873; x=1733440873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=025llu64/cNzlbwdGqKzrWt8bFFiEM2NcYoUquNK6Jo=;
  b=JKWleaiQdUuUw89Jd/RkY34CzRfks2s1YYGZt4u/zu+zXMQH/MfHO1Sq
   9ni/aFt4kyVXGV1Q2tt6WC1qNMYYMCcQlcjLC8QdHNztwjv1/lcmLDGqs
   DiHevgAhi227o5Mjo83PbZ0sRQ9RC4Z7JyjPjulkz0AOhIpOR6NBsilLE
   I0YaJszLsxKzI6W7WdrzQOcz94lsvo626dD4z5oj4ltRM1HRQBt+DhfNy
   nXHskfqRHeUHm6k1tfM8TpWsR1MzslWOEo9ZgTK4Sqz2GARYfpgRGygTJ
   B7rVqvC9bwL4s0w8B5/hCahvkS/6T+M1OEUuefpID+f5/E1RabC7J/G68
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1211465"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1211465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800516898"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800516898"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 15:21:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1CT-000BYK-0X;
	Wed, 06 Dec 2023 23:21:05 +0000
Date: Thu, 7 Dec 2023 07:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 1/1] kernel/ptrace.c:489 ptrace_attach() warn:
 sleeping in atomic context
Message-ID: <202312070733.dnhJZ3nq-lkp@intel.com>
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
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Oleg Nesterov <oleg@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a51749ab34d9e5dec548fe38ede7e01e8bb26454
commit: 5431fdd2c181dd2eac218e45b44deb2925fa48f0 [1/1] ptrace: Convert ptrace_attach() to use lock guards
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: m68k-randconfig-r071-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070733.dnhJZ3nq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070733.dnhJZ3nq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312070733.dnhJZ3nq-lkp@intel.com/

smatch warnings:
kernel/ptrace.c:489 ptrace_attach() warn: sleeping in atomic context

vim +489 kernel/ptrace.c

5431fdd2c181dd Peter Zijlstra     2023-09-17  416  
3544d72a0e10d0 Tejun Heo          2011-06-14  417  static int ptrace_attach(struct task_struct *task, long request,
aa9147c98f2755 Denys Vlasenko     2012-03-23  418  			 unsigned long addr,
3544d72a0e10d0 Tejun Heo          2011-06-14  419  			 unsigned long flags)
ab8d11beb46f0b Miklos Szeredi     2005-09-06  420  {
3544d72a0e10d0 Tejun Heo          2011-06-14  421  	bool seize = (request == PTRACE_SEIZE);
ab8d11beb46f0b Miklos Szeredi     2005-09-06  422  	int retval;
f5b40e363ad604 Linus Torvalds     2006-05-07  423  
aa9147c98f2755 Denys Vlasenko     2012-03-23  424  	if (seize) {
aa9147c98f2755 Denys Vlasenko     2012-03-23  425  		if (addr != 0)
5431fdd2c181dd Peter Zijlstra     2023-09-17  426  			return -EIO;
ee1fee900537b5 Jann Horn          2022-03-19  427  		/*
ee1fee900537b5 Jann Horn          2022-03-19  428  		 * This duplicates the check in check_ptrace_options() because
ee1fee900537b5 Jann Horn          2022-03-19  429  		 * ptrace_attach() and ptrace_setoptions() have historically
ee1fee900537b5 Jann Horn          2022-03-19  430  		 * used different error codes for unknown ptrace options.
ee1fee900537b5 Jann Horn          2022-03-19  431  		 */
aa9147c98f2755 Denys Vlasenko     2012-03-23  432  		if (flags & ~(unsigned long)PTRACE_O_MASK)
5431fdd2c181dd Peter Zijlstra     2023-09-17  433  			return -EIO;
5431fdd2c181dd Peter Zijlstra     2023-09-17  434  
ee1fee900537b5 Jann Horn          2022-03-19  435  		retval = check_ptrace_options(flags);
ee1fee900537b5 Jann Horn          2022-03-19  436  		if (retval)
ee1fee900537b5 Jann Horn          2022-03-19  437  			return retval;
aa9147c98f2755 Denys Vlasenko     2012-03-23  438  		flags = PT_PTRACED | PT_SEIZED | (flags << PT_OPT_FLAG_SHIFT);
aa9147c98f2755 Denys Vlasenko     2012-03-23  439  	} else {
aa9147c98f2755 Denys Vlasenko     2012-03-23  440  		flags = PT_PTRACED;
aa9147c98f2755 Denys Vlasenko     2012-03-23  441  	}
3544d72a0e10d0 Tejun Heo          2011-06-14  442  
a5cb013da773a6 Al Viro            2007-03-20  443  	audit_ptrace(task);
a5cb013da773a6 Al Viro            2007-03-20  444  
e8b33b8cfafcfc Jens Axboe         2021-03-25  445  	if (unlikely(task->flags & PF_KTHREAD))
5431fdd2c181dd Peter Zijlstra     2023-09-17  446  		return -EPERM;
bac0abd6174e42 Pavel Emelyanov    2007-10-18  447  	if (same_thread_group(task, current))
5431fdd2c181dd Peter Zijlstra     2023-09-17  448  		return -EPERM;
f5b40e363ad604 Linus Torvalds     2006-05-07  449  
f2f0b00ad61d53 Oleg Nesterov      2009-06-17  450  	/*
f2f0b00ad61d53 Oleg Nesterov      2009-06-17  451  	 * Protect exec's credential calculations against our interference;
86b6c1f301faf0 Denys Vlasenko     2012-03-23  452  	 * SUID, SGID and LSM creds get determined differently
5e751e992f3fb0 David Howells      2009-05-08  453  	 * under ptrace.
d84f4f992cbd76 David Howells      2008-11-14  454  	 */
5431fdd2c181dd Peter Zijlstra     2023-09-17  455  	scoped_cond_guard (mutex_intr, return -ERESTARTNOINTR,
5431fdd2c181dd Peter Zijlstra     2023-09-17  456  			   &task->signal->cred_guard_mutex) {
f5b40e363ad604 Linus Torvalds     2006-05-07  457  
5431fdd2c181dd Peter Zijlstra     2023-09-17  458  		scoped_guard (task_lock, task) {
caaee6234d05a5 Jann Horn          2016-01-20  459  			retval = __ptrace_may_access(task, PTRACE_MODE_ATTACH_REALCREDS);
^1da177e4c3f41 Linus Torvalds     2005-04-16  460  			if (retval)
5431fdd2c181dd Peter Zijlstra     2023-09-17  461  				return retval;
5431fdd2c181dd Peter Zijlstra     2023-09-17  462  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  463  
5431fdd2c181dd Peter Zijlstra     2023-09-17  464  		scoped_guard (write_lock_irq, &tasklist_lock) {
b79b7ba93df14a Oleg Nesterov      2009-06-17  465  			if (unlikely(task->exit_state))
5431fdd2c181dd Peter Zijlstra     2023-09-17  466  				return -EPERM;
f2f0b00ad61d53 Oleg Nesterov      2009-06-17  467  			if (task->ptrace)
5431fdd2c181dd Peter Zijlstra     2023-09-17  468  				return -EPERM;
b79b7ba93df14a Oleg Nesterov      2009-06-17  469  
aa9147c98f2755 Denys Vlasenko     2012-03-23  470  			task->ptrace = flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  471  
c70d9d809fdeec Eric W. Biederman  2017-05-22  472  			ptrace_link(task, current);
3544d72a0e10d0 Tejun Heo          2011-06-14  473  
3544d72a0e10d0 Tejun Heo          2011-06-14  474  			/* SEIZE doesn't trap tracee on attach */
3544d72a0e10d0 Tejun Heo          2011-06-14  475  			if (!seize)
079b22dc9be985 Eric W. Biederman  2018-09-03  476  				send_sig_info(SIGSTOP, SEND_SIG_PRIV, task);
b79b7ba93df14a Oleg Nesterov      2009-06-17  477  
5431fdd2c181dd Peter Zijlstra     2023-09-17  478  			ptrace_set_stopped(task);
5431fdd2c181dd Peter Zijlstra     2023-09-17  479  		}
31cae1eaae4fd6 Peter Zijlstra     2022-05-03  480  	}
d79fdd6d96f46f Tejun Heo          2011-03-23  481  
7c3b00e06d731a Oleg Nesterov      2016-01-20  482  	/*
7c3b00e06d731a Oleg Nesterov      2016-01-20  483  	 * We do not bother to change retval or clear JOBCTL_TRAPPING
7c3b00e06d731a Oleg Nesterov      2016-01-20  484  	 * if wait_on_bit() was interrupted by SIGKILL. The tracer will
7c3b00e06d731a Oleg Nesterov      2016-01-20  485  	 * not return to user-mode, it will exit and clear this bit in
7c3b00e06d731a Oleg Nesterov      2016-01-20  486  	 * __ptrace_unlink() if it wasn't already cleared by the tracee;
7c3b00e06d731a Oleg Nesterov      2016-01-20  487  	 * and until then nobody can ptrace this task.
7c3b00e06d731a Oleg Nesterov      2016-01-20  488  	 */
7c3b00e06d731a Oleg Nesterov      2016-01-20 @489  	wait_on_bit(&task->jobctl, JOBCTL_TRAPPING_BIT, TASK_KILLABLE);
f701e5b73a1a79 Vladimir Zapolskiy 2011-07-15  490  	proc_ptrace_connector(task, PTRACE_ATTACH);
f701e5b73a1a79 Vladimir Zapolskiy 2011-07-15  491  
5431fdd2c181dd Peter Zijlstra     2023-09-17  492  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  494  

:::::: The code at line 489 was first introduced by commit
:::::: 7c3b00e06d731a28fc3d17ed02ba250642b15b81 ptrace: make wait_on_bit(JOBCTL_TRAPPING_BIT) in ptrace_attach() killable

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
