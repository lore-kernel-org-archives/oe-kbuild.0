Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C122798EA
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695902; cv=none; b=LT+Gn4G4/rwtHArn45Gk/MeGHZDbsivBqPC/N/+9MjXjAJ4Q2UFyIvQ10Gnv+YdMr3OB0PSht4y44b+bTX03PiqDsU2QTY8ESvv02CdcKJNwM5319c+sdB6ALuuCPQBwrLeAsznbnmtcmlfJxUfudGdCsnGeX+y8k8QsYNdm3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695902; c=relaxed/simple;
	bh=7aUhODsrZmrYGQEWq49fCTJsrHO9NGW7MKckCcUvbq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwHnk4JQvoO4T/YhG8QUFJ80OsLmabaAZbVtP7OkE8ogYBrGh+8Eh2DogbcAkO/v53UUCieNx419hZoUyvnicHzwcQte85IUwtH6l+yxjXTir+71Wt6QhuTjOSifwKlq3siMxvgvmDYy5qOEvAnTz2ihv1qO6JjqsubOS5wX3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTfY73vI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTfY73vI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765695899; x=1797231899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aUhODsrZmrYGQEWq49fCTJsrHO9NGW7MKckCcUvbq0=;
  b=jTfY73vI34fXWNwmFJ+4H0xaDB8+iBx40Jhoa4e8RnwApGnjID9BAymm
   x54P/4+ms6kWM6etahgXrYkorBT7pHD8648IVgtresIbhDkv80WZxix7J
   pQtluRvhpU9ajL0Pbq4nw0y4Cx+mJJKKbPRZOt8Tb4dRcwUyctmKcW2B9
   vtH+nh/sy6n/ucw06qDSLo7DBtv77xs37Z7FFDwAajFOPM0BJb9zgOlGp
   DnScKHdHnCSo9uFvRu4gWWqk2HO+w2rzewhDbtwYbcJFQfIRwvIrpGCdj
   hYG93XgfFx8NNEijb4qmiZ0uQ3MO0GhXPrkm7VsvhVR4Uzdg4aI2loPv+
   Q==;
X-CSE-ConnectionGUID: eElO3rlqQEijmtnhrusdyA==
X-CSE-MsgGUID: Dbp8oKmTT7ygA/TjoN0HEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70215570"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70215570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:04:57 -0800
X-CSE-ConnectionGUID: /pGdSs50SCeWYOHujygtyg==
X-CSE-MsgGUID: uDUgKjnTT/eGKRB2Gf99xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228114825"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 23:04:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgA0-000000008nn-17Oi;
	Sun, 14 Dec 2025 07:04:52 +0000
Date: Sun, 14 Dec 2025 15:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1942/1942] fs/proc/array.c:614:9:
 warning: 'gtime' may be used uninitialized in this function
Message-ID: <202512141436.2LQYGI7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zhao Wenhui <zhaowenhui8@huawei.com>

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 4f8730514c736b09927b1b9c08ad946b70639545 [1942/1942] fs/proc: do_task_stat: use sig->stats_lock to gather the threads/children stats
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 8 months ago
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141436.2LQYGI7f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141436.2LQYGI7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512141436.2LQYGI7f-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from fs/proc/array.c:68:
   include/linux/signal.h: In function 'sigemptyset':
   include/linux/signal.h:180:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
     180 |         case 2: set->sig[1] = 0;
         |                 ~~~~~~~~~~~~^~~
   include/linux/signal.h:181:9: note: here
     181 |         case 1: set->sig[0] = 0;
         |         ^~~~
   fs/proc/array.c: In function 'do_task_stat':
>> fs/proc/array.c:614:9: warning: 'gtime' may be used uninitialized in this function [-Wmaybe-uninitialized]
     614 |         seq_put_decimal_ull(m, " ", nsec_to_clock_t(gtime));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/proc/array.c:567:9: warning: 'maj_flt' may be used uninitialized in this function [-Wmaybe-uninitialized]
     567 |         seq_put_decimal_ull(m, " ", maj_flt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/proc/array.c:565:9: warning: 'min_flt' may be used uninitialized in this function [-Wmaybe-uninitialized]
     565 |         seq_put_decimal_ull(m, " ", min_flt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gtime +614 fs/proc/array.c

^1da177e4c3f415 Linus Torvalds      2005-04-16  432  
ee992744ea53db0 Eric W. Biederman   2008-02-08  433  static int do_task_stat(struct seq_file *m, struct pid_namespace *ns,
ee992744ea53db0 Eric W. Biederman   2008-02-08  434  			struct pid *pid, struct task_struct *task, int whole)
^1da177e4c3f415 Linus Torvalds      2005-04-16  435  {
b2f73922d119686 Ingo Molnar         2015-09-30  436  	unsigned long vsize, eip, esp, wchan = 0;
715be1fce0d964a Jan Engelhardt      2012-05-31  437  	int priority, nice;
^1da177e4c3f415 Linus Torvalds      2005-04-16  438  	int tty_pgrp = -1, tty_nr = 0;
^1da177e4c3f415 Linus Torvalds      2005-04-16  439  	sigset_t sigign, sigcatch;
^1da177e4c3f415 Linus Torvalds      2005-04-16  440  	char state;
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  441  	pid_t ppid = 0, pgid = -1, sid = -1;
^1da177e4c3f415 Linus Torvalds      2005-04-16  442  	int num_threads = 0;
f83ce3e6b02d5e4 Jake Edge           2009-05-04  443  	int permitted;
^1da177e4c3f415 Linus Torvalds      2005-04-16  444  	struct mm_struct *mm;
^1da177e4c3f415 Linus Torvalds      2005-04-16  445  	unsigned long long start_time;
4f8730514c736b0 Oleg Nesterov       2024-04-13  446  	unsigned long cmin_flt, cmaj_flt, min_flt, maj_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  447  	u64 cutime, cstime, cgtime, utime, stime, gtime;
^1da177e4c3f415 Linus Torvalds      2005-04-16  448  	unsigned long rsslim = 0;
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  449  	unsigned long flags;
08132d3d089b9ae Eric W. Biederman   2024-04-13  450  	int exit_code = task->exit_code;
4f8730514c736b0 Oleg Nesterov       2024-04-13  451  	struct signal_struct *sig = task->signal;
4f8730514c736b0 Oleg Nesterov       2024-04-13  452  	unsigned int seq = 1;
^1da177e4c3f415 Linus Torvalds      2005-04-16  453  
^1da177e4c3f415 Linus Torvalds      2005-04-16  454  	state = *get_task_state(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  455  	vsize = eip = esp = 0;
caaee6234d05a58 Jann Horn           2016-01-20  456  	permitted = ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS | PTRACE_MODE_NOAUDIT);
^1da177e4c3f415 Linus Torvalds      2005-04-16  457  	mm = get_task_mm(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  458  	if (mm) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  459  		vsize = task_vsize(mm);
0a1eb2d474edfe7 Andy Lutomirski     2016-09-30  460  		/*
0a1eb2d474edfe7 Andy Lutomirski     2016-09-30  461  		 * esp and eip are intentionally zeroed out.  There is no
0a1eb2d474edfe7 Andy Lutomirski     2016-09-30  462  		 * non-racy way to read them without freezing the task.
0a1eb2d474edfe7 Andy Lutomirski     2016-09-30  463  		 * Programs that need reliable values can use ptrace(2).
fd7d56270b526ca John Ogness         2017-09-14  464  		 *
fd7d56270b526ca John Ogness         2017-09-14  465  		 * The only exception is if the task is core dumping because
fd7d56270b526ca John Ogness         2017-09-14  466  		 * a program is not able to use ptrace(2) in that case. It is
fd7d56270b526ca John Ogness         2017-09-14  467  		 * safe because the task has stopped executing permanently.
0a1eb2d474edfe7 Andy Lutomirski     2016-09-30  468  		 */
ef7622dbb877763 John Ogness         2019-07-04  469  		if (permitted && (task->flags & (PF_EXITING|PF_DUMPCORE))) {
8bb2ee192e482c5 Alexey Dobriyan     2018-01-18  470  			if (try_get_task_stack(task)) {
fd7d56270b526ca John Ogness         2017-09-14  471  				eip = KSTK_EIP(task);
fd7d56270b526ca John Ogness         2017-09-14  472  				esp = KSTK_ESP(task);
8bb2ee192e482c5 Alexey Dobriyan     2018-01-18  473  				put_task_stack(task);
8bb2ee192e482c5 Alexey Dobriyan     2018-01-18  474  			}
fd7d56270b526ca John Ogness         2017-09-14  475  		}
f83ce3e6b02d5e4 Jake Edge           2009-05-04  476  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  477  
^1da177e4c3f415 Linus Torvalds      2005-04-16  478  	sigemptyset(&sigign);
^1da177e4c3f415 Linus Torvalds      2005-04-16  479  	sigemptyset(&sigcatch);
3cfd0885fac78c1 Alan Cox            2006-09-29  480  
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  481  	if (lock_task_sighand(task, &flags)) {
915935041281c64 Oleg Nesterov       2006-12-08  482  		if (sig->tty) {
5d0fdf1e0189980 Alan Cox            2008-04-30  483  			struct pid *pgrp = tty_get_pgrp(sig->tty);
5d0fdf1e0189980 Alan Cox            2008-04-30  484  			tty_pgrp = pid_nr_ns(pgrp, ns);
5d0fdf1e0189980 Alan Cox            2008-04-30  485  			put_pid(pgrp);
915935041281c64 Oleg Nesterov       2006-12-08  486  			tty_nr = new_encode_dev(tty_devnum(sig->tty));
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  487  		}
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  488  
7e49827cc937a74 Oleg Nesterov       2010-05-26  489  		num_threads = get_nr_threads(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  490  		collect_sigign_sigcatch(task, &sigign, &sigcatch);
^1da177e4c3f415 Linus Torvalds      2005-04-16  491  
6aa7de059173a98 Mark Rutland        2017-10-23  492  		rsslim = READ_ONCE(sig->rlim[RLIMIT_RSS].rlim_cur);
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  493  
^1da177e4c3f415 Linus Torvalds      2005-04-16  494  		if (whole) {
08132d3d089b9ae Eric W. Biederman   2024-04-13  495  			if (sig->flags & (SIGNAL_GROUP_EXIT | SIGNAL_STOP_STOPPED))
08132d3d089b9ae Eric W. Biederman   2024-04-13  496  				exit_code = sig->group_exit_code;
^1da177e4c3f415 Linus Torvalds      2005-04-16  497  		}
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  498  
b488893a390edfe Pavel Emelyanov     2007-10-18  499  		sid = task_session_nr_ns(task, ns);
a98fdcef941e107 Oleg Nesterov       2008-01-15  500  		ppid = task_tgid_nr_ns(task->real_parent, ns);
b488893a390edfe Pavel Emelyanov     2007-10-18  501  		pgid = task_pgrp_nr_ns(task, ns);
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  502  
a593d6edeb0a5a2 Oleg Nesterov       2006-10-02  503  		unlock_task_sighand(task, &flags);
^1da177e4c3f415 Linus Torvalds      2005-04-16  504  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  505  
f83ce3e6b02d5e4 Jake Edge           2009-05-04  506  	if (permitted && (!whole || num_threads < 2))
^1da177e4c3f415 Linus Torvalds      2005-04-16  507  		wchan = get_wchan(task);
f59c1abf66d1590 Oleg Nesterov       2024-04-13  508  
4f8730514c736b0 Oleg Nesterov       2024-04-13  509  	do {
4f8730514c736b0 Oleg Nesterov       2024-04-13  510  		seq++; /* 2 on the 1st/lockless path, otherwise odd */
4f8730514c736b0 Oleg Nesterov       2024-04-13  511  		flags = read_seqbegin_or_lock_irqsave(&sig->stats_lock, &seq);
4f8730514c736b0 Oleg Nesterov       2024-04-13  512  
4f8730514c736b0 Oleg Nesterov       2024-04-13  513  		cmin_flt = sig->cmin_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  514  		cmaj_flt = sig->cmaj_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  515  		cutime = sig->cutime;
4f8730514c736b0 Oleg Nesterov       2024-04-13  516  		cstime = sig->cstime;
4f8730514c736b0 Oleg Nesterov       2024-04-13  517  		cgtime = sig->cgtime;
4f8730514c736b0 Oleg Nesterov       2024-04-13  518  
4f8730514c736b0 Oleg Nesterov       2024-04-13  519  		if (whole) {
4f8730514c736b0 Oleg Nesterov       2024-04-13  520  			struct task_struct *t;
4f8730514c736b0 Oleg Nesterov       2024-04-13  521  
4f8730514c736b0 Oleg Nesterov       2024-04-13  522  			min_flt = sig->min_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  523  			maj_flt = sig->maj_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  524  			gtime = sig->gtime;
4f8730514c736b0 Oleg Nesterov       2024-04-13  525  
4f8730514c736b0 Oleg Nesterov       2024-04-13  526  			rcu_read_lock();
4f8730514c736b0 Oleg Nesterov       2024-04-13  527  			__for_each_thread(sig, t) {
4f8730514c736b0 Oleg Nesterov       2024-04-13  528  				min_flt += t->min_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  529  				maj_flt += t->maj_flt;
4f8730514c736b0 Oleg Nesterov       2024-04-13  530  				gtime += task_gtime(t);
4f8730514c736b0 Oleg Nesterov       2024-04-13  531  			}
4f8730514c736b0 Oleg Nesterov       2024-04-13  532  			rcu_read_unlock();
4f8730514c736b0 Oleg Nesterov       2024-04-13  533  		}
4f8730514c736b0 Oleg Nesterov       2024-04-13  534  	} while (need_seqretry(&sig->stats_lock, seq));
4f8730514c736b0 Oleg Nesterov       2024-04-13  535  	done_seqretry_irqrestore(&sig->stats_lock, seq, flags);
4f8730514c736b0 Oleg Nesterov       2024-04-13  536  
f59c1abf66d1590 Oleg Nesterov       2024-04-13  537  	if (whole) {
f59c1abf66d1590 Oleg Nesterov       2024-04-13  538  		thread_group_cputime_adjusted(task, &utime, &stime);
f59c1abf66d1590 Oleg Nesterov       2024-04-13  539  	} else {
f59c1abf66d1590 Oleg Nesterov       2024-04-13  540  		task_cputime_adjusted(task, &utime, &stime);
^1da177e4c3f415 Linus Torvalds      2005-04-16  541  		min_flt = task->min_flt;
^1da177e4c3f415 Linus Torvalds      2005-04-16  542  		maj_flt = task->maj_flt;
6fac4829ce0ef9b Frederic Weisbecker 2012-11-13  543  		gtime = task_gtime(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  544  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  545  
^1da177e4c3f415 Linus Torvalds      2005-04-16  546  	/* scale priority and nice values from timeslices to -20..20 */
^1da177e4c3f415 Linus Torvalds      2005-04-16  547  	/* to make it look like a "normal" Unix priority/nice value  */
^1da177e4c3f415 Linus Torvalds      2005-04-16  548  	priority = task_prio(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  549  	nice = task_nice(task);
^1da177e4c3f415 Linus Torvalds      2005-04-16  550  
^1da177e4c3f415 Linus Torvalds      2005-04-16  551  	/* convert nsec -> ticks */
57e0be041d9e21a Thomas Gleixner     2014-07-16  552  	start_time = nsec_to_clock_t(task->real_start_time);
^1da177e4c3f415 Linus Torvalds      2005-04-16  553  
d0f02231222b313 Andrei Vagin        2018-04-10  554  	seq_put_decimal_ull(m, "", pid_nr_ns(pid, ns));
d0f02231222b313 Andrei Vagin        2018-04-10  555  	seq_puts(m, " (");
88b72b31e15f9df Tejun Heo           2018-05-18  556  	proc_task_name(m, task, false);
d0f02231222b313 Andrei Vagin        2018-04-10  557  	seq_puts(m, ") ");
d0f02231222b313 Andrei Vagin        2018-04-10  558  	seq_putc(m, state);
75ba1d07fd6a494 Joe Perches         2016-10-07  559  	seq_put_decimal_ll(m, " ", ppid);
75ba1d07fd6a494 Joe Perches         2016-10-07  560  	seq_put_decimal_ll(m, " ", pgid);
75ba1d07fd6a494 Joe Perches         2016-10-07  561  	seq_put_decimal_ll(m, " ", sid);
75ba1d07fd6a494 Joe Perches         2016-10-07  562  	seq_put_decimal_ll(m, " ", tty_nr);
75ba1d07fd6a494 Joe Perches         2016-10-07  563  	seq_put_decimal_ll(m, " ", tty_pgrp);
75ba1d07fd6a494 Joe Perches         2016-10-07  564  	seq_put_decimal_ull(m, " ", task->flags);
75ba1d07fd6a494 Joe Perches         2016-10-07 @565  	seq_put_decimal_ull(m, " ", min_flt);
75ba1d07fd6a494 Joe Perches         2016-10-07  566  	seq_put_decimal_ull(m, " ", cmin_flt);
75ba1d07fd6a494 Joe Perches         2016-10-07 @567  	seq_put_decimal_ull(m, " ", maj_flt);
75ba1d07fd6a494 Joe Perches         2016-10-07  568  	seq_put_decimal_ull(m, " ", cmaj_flt);
5613fda9a503cd6 Frederic Weisbecker 2017-01-31  569  	seq_put_decimal_ull(m, " ", nsec_to_clock_t(utime));
5613fda9a503cd6 Frederic Weisbecker 2017-01-31  570  	seq_put_decimal_ull(m, " ", nsec_to_clock_t(stime));
5613fda9a503cd6 Frederic Weisbecker 2017-01-31  571  	seq_put_decimal_ll(m, " ", nsec_to_clock_t(cutime));
5613fda9a503cd6 Frederic Weisbecker 2017-01-31  572  	seq_put_decimal_ll(m, " ", nsec_to_clock_t(cstime));
75ba1d07fd6a494 Joe Perches         2016-10-07  573  	seq_put_decimal_ll(m, " ", priority);
75ba1d07fd6a494 Joe Perches         2016-10-07  574  	seq_put_decimal_ll(m, " ", nice);
75ba1d07fd6a494 Joe Perches         2016-10-07  575  	seq_put_decimal_ll(m, " ", num_threads);
75ba1d07fd6a494 Joe Perches         2016-10-07  576  	seq_put_decimal_ull(m, " ", 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  577  	seq_put_decimal_ull(m, " ", start_time);
75ba1d07fd6a494 Joe Perches         2016-10-07  578  	seq_put_decimal_ull(m, " ", vsize);
75ba1d07fd6a494 Joe Perches         2016-10-07  579  	seq_put_decimal_ull(m, " ", mm ? get_mm_rss(mm) : 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  580  	seq_put_decimal_ull(m, " ", rsslim);
75ba1d07fd6a494 Joe Perches         2016-10-07  581  	seq_put_decimal_ull(m, " ", mm ? (permitted ? mm->start_code : 1) : 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  582  	seq_put_decimal_ull(m, " ", mm ? (permitted ? mm->end_code : 1) : 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  583  	seq_put_decimal_ull(m, " ", (permitted && mm) ? mm->start_stack : 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  584  	seq_put_decimal_ull(m, " ", esp);
75ba1d07fd6a494 Joe Perches         2016-10-07  585  	seq_put_decimal_ull(m, " ", eip);
^1da177e4c3f415 Linus Torvalds      2005-04-16  586  	/* The signal information here is obsolete.
^1da177e4c3f415 Linus Torvalds      2005-04-16  587  	 * It must be decimal for Linux 2.0 compatibility.
^1da177e4c3f415 Linus Torvalds      2005-04-16  588  	 * Use /proc/#/status for real-time signals.
^1da177e4c3f415 Linus Torvalds      2005-04-16  589  	 */
75ba1d07fd6a494 Joe Perches         2016-10-07  590  	seq_put_decimal_ull(m, " ", task->pending.signal.sig[0] & 0x7fffffffUL);
75ba1d07fd6a494 Joe Perches         2016-10-07  591  	seq_put_decimal_ull(m, " ", task->blocked.sig[0] & 0x7fffffffUL);
75ba1d07fd6a494 Joe Perches         2016-10-07  592  	seq_put_decimal_ull(m, " ", sigign.sig[0] & 0x7fffffffUL);
75ba1d07fd6a494 Joe Perches         2016-10-07  593  	seq_put_decimal_ull(m, " ", sigcatch.sig[0] & 0x7fffffffUL);
b2f73922d119686 Ingo Molnar         2015-09-30  594  
b2f73922d119686 Ingo Molnar         2015-09-30  595  	/*
b2f73922d119686 Ingo Molnar         2015-09-30  596  	 * We used to output the absolute kernel address, but that's an
b2f73922d119686 Ingo Molnar         2015-09-30  597  	 * information leak - so instead we show a 0/1 flag here, to signal
b2f73922d119686 Ingo Molnar         2015-09-30  598  	 * to user-space whether there's a wchan field in /proc/PID/wchan.
b2f73922d119686 Ingo Molnar         2015-09-30  599  	 *
b2f73922d119686 Ingo Molnar         2015-09-30  600  	 * This works with older implementations of procps as well.
b2f73922d119686 Ingo Molnar         2015-09-30  601  	 */
b2f73922d119686 Ingo Molnar         2015-09-30  602  	if (wchan)
b2f73922d119686 Ingo Molnar         2015-09-30  603  		seq_puts(m, " 1");
b2f73922d119686 Ingo Molnar         2015-09-30  604  	else
b2f73922d119686 Ingo Molnar         2015-09-30  605  		seq_puts(m, " 0");
b2f73922d119686 Ingo Molnar         2015-09-30  606  
75ba1d07fd6a494 Joe Perches         2016-10-07  607  	seq_put_decimal_ull(m, " ", 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  608  	seq_put_decimal_ull(m, " ", 0);
75ba1d07fd6a494 Joe Perches         2016-10-07  609  	seq_put_decimal_ll(m, " ", task->exit_signal);
75ba1d07fd6a494 Joe Perches         2016-10-07  610  	seq_put_decimal_ll(m, " ", task_cpu(task));
75ba1d07fd6a494 Joe Perches         2016-10-07  611  	seq_put_decimal_ull(m, " ", task->rt_priority);
75ba1d07fd6a494 Joe Perches         2016-10-07  612  	seq_put_decimal_ull(m, " ", task->policy);
75ba1d07fd6a494 Joe Perches         2016-10-07  613  	seq_put_decimal_ull(m, " ", delayacct_blkio_ticks(task));
16a6d9be90373fb Frederic Weisbecker 2017-01-31 @614  	seq_put_decimal_ull(m, " ", nsec_to_clock_t(gtime));
16a6d9be90373fb Frederic Weisbecker 2017-01-31  615  	seq_put_decimal_ll(m, " ", nsec_to_clock_t(cgtime));
5b172087f991894 Cyrill Gorcunov     2012-05-31  616  
5b172087f991894 Cyrill Gorcunov     2012-05-31  617  	if (mm && permitted) {
75ba1d07fd6a494 Joe Perches         2016-10-07  618  		seq_put_decimal_ull(m, " ", mm->start_data);
75ba1d07fd6a494 Joe Perches         2016-10-07  619  		seq_put_decimal_ull(m, " ", mm->end_data);
75ba1d07fd6a494 Joe Perches         2016-10-07  620  		seq_put_decimal_ull(m, " ", mm->start_brk);
75ba1d07fd6a494 Joe Perches         2016-10-07  621  		seq_put_decimal_ull(m, " ", mm->arg_start);
75ba1d07fd6a494 Joe Perches         2016-10-07  622  		seq_put_decimal_ull(m, " ", mm->arg_end);
75ba1d07fd6a494 Joe Perches         2016-10-07  623  		seq_put_decimal_ull(m, " ", mm->env_start);
75ba1d07fd6a494 Joe Perches         2016-10-07  624  		seq_put_decimal_ull(m, " ", mm->env_end);
5b172087f991894 Cyrill Gorcunov     2012-05-31  625  	} else
75ba1d07fd6a494 Joe Perches         2016-10-07  626  		seq_puts(m, " 0 0 0 0 0 0 0");
5b172087f991894 Cyrill Gorcunov     2012-05-31  627  
5b172087f991894 Cyrill Gorcunov     2012-05-31  628  	if (permitted)
08132d3d089b9ae Eric W. Biederman   2024-04-13  629  		seq_put_decimal_ll(m, " ", exit_code);
5b172087f991894 Cyrill Gorcunov     2012-05-31  630  	else
75ba1d07fd6a494 Joe Perches         2016-10-07  631  		seq_puts(m, " 0");
5b172087f991894 Cyrill Gorcunov     2012-05-31  632  
bda7bad62bc4c4e KAMEZAWA Hiroyuki   2012-03-23  633  	seq_putc(m, '\n');
^1da177e4c3f415 Linus Torvalds      2005-04-16  634  	if (mm)
^1da177e4c3f415 Linus Torvalds      2005-04-16  635  		mmput(mm);
ee992744ea53db0 Eric W. Biederman   2008-02-08  636  	return 0;
^1da177e4c3f415 Linus Torvalds      2005-04-16  637  }
^1da177e4c3f415 Linus Torvalds      2005-04-16  638  

:::::: The code at line 614 was first introduced by commit
:::::: 16a6d9be90373fb0b521850cd0185a4d460dd152 sched/cputime: Convert guest time accounting to nsecs (u64)

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
