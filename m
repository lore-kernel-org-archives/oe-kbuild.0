Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22B7494
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 21:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679176316; x=1710712316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gY1TgIUiMXYaLEPz+kC9aEmNS1u5YB5hwxRNfOAe+o=;
  b=KQjGvOWP0m7HF3gSEHakRu+fB2jFaRty1X3TxJ4xKsbsYuVJP8J2oUb0
   E5v3iTwczEsbI37sc4LERLYPNquF9Aj8+jVynCpnwqUhkQbUYwhJEc8Cb
   JmlNDYDLZsu2rDSs2164HGlHD9Dj1q6gUIzQ0rDCsEXGiWEO6R/HLDVOA
   ReLBHqPLQOVVgNdT1wxlJ12sXW/LoWNbd9ApgwI1WHjFQKQgTiXKBRwrK
   7fcsvApU8xHsdjHsm3FdLVExw8XusfoP2UQZrlBk+TEXDZhreJUeK7wT7
   FYqZzdgtyuz+b3miz0yD4R792sHoAWrhM07QFOhBjt4y16Gy2zDp0YS+F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="340821343"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="340821343"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 14:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="854836223"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="854836223"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 14:51:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdeSw-000AHa-0i;
	Sat, 18 Mar 2023 21:51:54 +0000
Date: Sun, 19 Mar 2023 05:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rt-devel:linux-6.1.y-rt-rebase 32/51]
 kernel/trace/trace_output.c:485 trace_print_lat_fmt() warn: bitwise AND
 condition is false here
Message-ID: <202303190541.Fju427V8-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase
head:   90d96fee668dc306dd748393383c0fc74b798eee
commit: 7707fc9d0d972426584f7bbba712d1574f33740a [32/51] sched: Add support for lazy preemption
:::::: branch date: 4 weeks ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230319/202303190541.Fju427V8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303190541.Fju427V8-lkp@intel.com/

smatch warnings:
kernel/trace/trace_output.c:485 trace_print_lat_fmt() warn: bitwise AND condition is false here

vim +485 kernel/trace/trace_output.c

f0868d1e23a8ef Steven Rostedt            2008-12-23  432  
f81c972d27c367 Steven Rostedt            2009-09-11  433  /**
f81c972d27c367 Steven Rostedt            2009-09-11  434   * trace_print_lat_fmt - print the irq, preempt and lockdep fields
f81c972d27c367 Steven Rostedt            2009-09-11  435   * @s: trace seq struct to write to
f81c972d27c367 Steven Rostedt            2009-09-11  436   * @entry: The trace entry field from the ring buffer
f81c972d27c367 Steven Rostedt            2009-09-11  437   *
f81c972d27c367 Steven Rostedt            2009-09-11  438   * Prints the generic fields of irqs off, in hard or softirq, preempt
e6e1e2593592a8 Steven Rostedt            2011-03-09  439   * count.
f81c972d27c367 Steven Rostedt            2009-09-11  440   */
f81c972d27c367 Steven Rostedt            2009-09-11  441  int trace_print_lat_fmt(struct trace_seq *s, struct trace_entry *entry)
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  442  {
10da37a645b5e9 David Sharp               2010-12-03  443  	char hardsoft_irq;
10da37a645b5e9 David Sharp               2010-12-03  444  	char need_resched;
7707fc9d0d9724 Thomas Gleixner           2012-10-26  445  	char need_resched_lazy;
10da37a645b5e9 David Sharp               2010-12-03  446  	char irqs_off;
10da37a645b5e9 David Sharp               2010-12-03  447  	int hardirq;
10da37a645b5e9 David Sharp               2010-12-03  448  	int softirq;
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  449  	int bh_off;
7e6867bf831c71 Peter Zijlstra            2016-03-18  450  	int nmi;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  451  
7e6867bf831c71 Peter Zijlstra            2016-03-18  452  	nmi = entry->flags & TRACE_FLAG_NMI;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  453  	hardirq = entry->flags & TRACE_FLAG_HARDIRQ;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  454  	softirq = entry->flags & TRACE_FLAG_SOFTIRQ;
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  455  	bh_off = entry->flags & TRACE_FLAG_BH_OFF;
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  456  
10da37a645b5e9 David Sharp               2010-12-03  457  	irqs_off =
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  458  		(entry->flags & TRACE_FLAG_IRQS_OFF && bh_off) ? 'D' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  459  		(entry->flags & TRACE_FLAG_IRQS_OFF) ? 'd' :
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  460  		bh_off ? 'b' :
10da37a645b5e9 David Sharp               2010-12-03  461  		(entry->flags & TRACE_FLAG_IRQS_NOSUPPORT) ? 'X' :
10da37a645b5e9 David Sharp               2010-12-03  462  		'.';
e5137b50a06400 Peter Zijlstra            2013-10-04  463  
e5137b50a06400 Peter Zijlstra            2013-10-04  464  	switch (entry->flags & (TRACE_FLAG_NEED_RESCHED |
e5137b50a06400 Peter Zijlstra            2013-10-04  465  				TRACE_FLAG_PREEMPT_RESCHED)) {
7707fc9d0d9724 Thomas Gleixner           2012-10-26  466  #ifndef CONFIG_PREEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  467  	case TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  468  		need_resched = 'N';
e5137b50a06400 Peter Zijlstra            2013-10-04  469  		break;
7707fc9d0d9724 Thomas Gleixner           2012-10-26  470  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  471  	case TRACE_FLAG_NEED_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  472  		need_resched = 'n';
e5137b50a06400 Peter Zijlstra            2013-10-04  473  		break;
7707fc9d0d9724 Thomas Gleixner           2012-10-26  474  #ifndef CONFIG_PREEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  475  	case TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  476  		need_resched = 'p';
e5137b50a06400 Peter Zijlstra            2013-10-04  477  		break;
7707fc9d0d9724 Thomas Gleixner           2012-10-26  478  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  479  	default:
e5137b50a06400 Peter Zijlstra            2013-10-04  480  		need_resched = '.';
e5137b50a06400 Peter Zijlstra            2013-10-04  481  		break;
e5137b50a06400 Peter Zijlstra            2013-10-04  482  	}
e5137b50a06400 Peter Zijlstra            2013-10-04  483  
7707fc9d0d9724 Thomas Gleixner           2012-10-26  484  	need_resched_lazy =
7707fc9d0d9724 Thomas Gleixner           2012-10-26 @485  		(entry->flags & TRACE_FLAG_NEED_RESCHED_LAZY) ? 'L' : '.';
7707fc9d0d9724 Thomas Gleixner           2012-10-26  486  
10da37a645b5e9 David Sharp               2010-12-03  487  	hardsoft_irq =
7e6867bf831c71 Peter Zijlstra            2016-03-18  488  		(nmi && hardirq)     ? 'Z' :
7e6867bf831c71 Peter Zijlstra            2016-03-18  489  		nmi                  ? 'z' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  490  		(hardirq && softirq) ? 'H' :
10da37a645b5e9 David Sharp               2010-12-03  491  		hardirq              ? 'h' :
10da37a645b5e9 David Sharp               2010-12-03  492  		softirq              ? 's' :
10da37a645b5e9 David Sharp               2010-12-03  493  		                       '.' ;
10da37a645b5e9 David Sharp               2010-12-03  494  
7707fc9d0d9724 Thomas Gleixner           2012-10-26  495  	trace_seq_printf(s, "%c%c%c%c",
7707fc9d0d9724 Thomas Gleixner           2012-10-26  496  			 irqs_off, need_resched, need_resched_lazy,
7707fc9d0d9724 Thomas Gleixner           2012-10-26  497  			 hardsoft_irq);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  498  
54357f0c9149c8 Thomas Gleixner           2021-08-10  499  	if (entry->preempt_count & 0xf)
54357f0c9149c8 Thomas Gleixner           2021-08-10  500  		trace_seq_printf(s, "%x", entry->preempt_count & 0xf);
54357f0c9149c8 Thomas Gleixner           2021-08-10  501  	else
54357f0c9149c8 Thomas Gleixner           2021-08-10  502  		trace_seq_putc(s, '.');
54357f0c9149c8 Thomas Gleixner           2021-08-10  503  
7707fc9d0d9724 Thomas Gleixner           2012-10-26  504  	if (entry->preempt_lazy_count)
7707fc9d0d9724 Thomas Gleixner           2012-10-26  505  		trace_seq_printf(s, "%x", entry->preempt_lazy_count);
7707fc9d0d9724 Thomas Gleixner           2012-10-26  506  	else
7707fc9d0d9724 Thomas Gleixner           2012-10-26  507  		trace_seq_putc(s, '.');
7707fc9d0d9724 Thomas Gleixner           2012-10-26  508  
54357f0c9149c8 Thomas Gleixner           2021-08-10  509  	if (entry->preempt_count & 0xf0)
54357f0c9149c8 Thomas Gleixner           2021-08-10  510  		trace_seq_printf(s, "%x", entry->preempt_count >> 4);
637e7e864103a7 Steven Rostedt            2009-09-11  511  	else
19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  512) 		trace_seq_putc(s, '.');
829b876dfc94ea Steven Rostedt            2009-09-27  513  
19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  514) 	return !trace_seq_has_overflowed(s);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  515  }
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
