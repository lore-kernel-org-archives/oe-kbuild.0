Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F88828
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676937459; x=1708473459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3Pl51MyPfHvqj6yzYfwf/x06pumUmgPIAXK2fOMfPE=;
  b=XlaOhEU73C1y+hXVlm/txNyOre2e0sh3TwM4M/zdQXsOhNysXsciOpxz
   XFNEqRilj7sdH8eDbY3oNIs2WylJ7+k+p03WtdA68/u9IJV+PFfILEoMh
   VWaUAiuRlrwF3iVXUEdwpET0dTrs42NE8V9TzqBDvrE3iq/qtyVoNFzJO
   M1WduajNAyJ7omTyExTRcmK3Rh1uLd1TZ5lIVX+A9Yk/XSEquxMznMy5w
   cCoe0C/LGtCKfjQSsjxQo2oq7ORxq/bvbp/I87Z25veTKW4R3TyOh5wk+
   ZzqcRHRESFf3p1yC2xg3d2IiHmZj7osi0pzUu8k9y4Tc5N8R4F3hxI9ZR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334706518"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="334706518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 15:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000410825"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="1000410825"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 15:57:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUG2I-000EFr-02;
	Mon, 20 Feb 2023 23:57:34 +0000
Date: Tue, 21 Feb 2023 07:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rt-devel:for-kbuild-bot/current-stable 27/46]
 kernel/trace/trace_output.c:485 trace_print_lat_fmt() warn: bitwise AND
 condition is false here
Message-ID: <202302210734.MZWC7uTK-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git for-kbuild-bot/current-stable
head:   d78e0b728f7e392e2464b7c44a8cd4bb616953dd
commit: 6740070af9f8862337339aa115af576063df7489 [27/46] sched: Add support for lazy preemption
:::::: branch date: 8 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230221/202302210734.MZWC7uTK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302210734.MZWC7uTK-lkp@intel.com/

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
6740070af9f886 Thomas Gleixner           2012-10-26  445  	char need_resched_lazy;
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
6740070af9f886 Thomas Gleixner           2012-10-26  466  #ifndef CONFIG_PREEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  467  	case TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  468  		need_resched = 'N';
e5137b50a06400 Peter Zijlstra            2013-10-04  469  		break;
6740070af9f886 Thomas Gleixner           2012-10-26  470  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  471  	case TRACE_FLAG_NEED_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  472  		need_resched = 'n';
e5137b50a06400 Peter Zijlstra            2013-10-04  473  		break;
6740070af9f886 Thomas Gleixner           2012-10-26  474  #ifndef CONFIG_PREEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  475  	case TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  476  		need_resched = 'p';
e5137b50a06400 Peter Zijlstra            2013-10-04  477  		break;
6740070af9f886 Thomas Gleixner           2012-10-26  478  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  479  	default:
e5137b50a06400 Peter Zijlstra            2013-10-04  480  		need_resched = '.';
e5137b50a06400 Peter Zijlstra            2013-10-04  481  		break;
e5137b50a06400 Peter Zijlstra            2013-10-04  482  	}
e5137b50a06400 Peter Zijlstra            2013-10-04  483  
6740070af9f886 Thomas Gleixner           2012-10-26  484  	need_resched_lazy =
6740070af9f886 Thomas Gleixner           2012-10-26 @485  		(entry->flags & TRACE_FLAG_NEED_RESCHED_LAZY) ? 'L' : '.';
6740070af9f886 Thomas Gleixner           2012-10-26  486  
10da37a645b5e9 David Sharp               2010-12-03  487  	hardsoft_irq =
7e6867bf831c71 Peter Zijlstra            2016-03-18  488  		(nmi && hardirq)     ? 'Z' :
7e6867bf831c71 Peter Zijlstra            2016-03-18  489  		nmi                  ? 'z' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  490  		(hardirq && softirq) ? 'H' :
10da37a645b5e9 David Sharp               2010-12-03  491  		hardirq              ? 'h' :
10da37a645b5e9 David Sharp               2010-12-03  492  		softirq              ? 's' :
10da37a645b5e9 David Sharp               2010-12-03  493  		                       '.' ;
10da37a645b5e9 David Sharp               2010-12-03  494  
6740070af9f886 Thomas Gleixner           2012-10-26  495  	trace_seq_printf(s, "%c%c%c%c",
6740070af9f886 Thomas Gleixner           2012-10-26  496  			 irqs_off, need_resched, need_resched_lazy,
6740070af9f886 Thomas Gleixner           2012-10-26  497  			 hardsoft_irq);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  498  
54357f0c9149c8 Thomas Gleixner           2021-08-10  499  	if (entry->preempt_count & 0xf)
54357f0c9149c8 Thomas Gleixner           2021-08-10  500  		trace_seq_printf(s, "%x", entry->preempt_count & 0xf);
54357f0c9149c8 Thomas Gleixner           2021-08-10  501  	else
54357f0c9149c8 Thomas Gleixner           2021-08-10  502  		trace_seq_putc(s, '.');
54357f0c9149c8 Thomas Gleixner           2021-08-10  503  
6740070af9f886 Thomas Gleixner           2012-10-26  504  	if (entry->preempt_lazy_count)
6740070af9f886 Thomas Gleixner           2012-10-26  505  		trace_seq_printf(s, "%x", entry->preempt_lazy_count);
6740070af9f886 Thomas Gleixner           2012-10-26  506  	else
6740070af9f886 Thomas Gleixner           2012-10-26  507  		trace_seq_putc(s, '.');
6740070af9f886 Thomas Gleixner           2012-10-26  508  
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
