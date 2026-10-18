Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB93D8105
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364260; cv=none; b=XyL0eKkervLQeD960Y+1lAyGStx+otvoMFtuwfBiQ2OdsEoo8pMvfu1QNXszujU3CQsfjlqNGAnXQj1iUCOy7KrTlezVYRjNez1yD5q5NuIzym/oS/SjLEuuBQcBBqenjuBjAEKwta2xZqvDlmlJwVhud8XOqu/AB9yTZIDb3qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364260; c=relaxed/simple;
	bh=EOWCw0e1XoNd5MlywLol29JIDA2Muodue3/uxKJkqGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5QyL33xjaQOhewHL9ubqwBH4ASvEj2E+goLAKU57YvvFSSi7tdGlP9nrrzz1hwtxKuMnLhUOFBuovDO6XoEFRbYB5LGR2jfRQAtegHxiEMx3U3rVQAt3rZhSvZaHXQ5zKQcmpEGp+yMqIoOj4DBkJdIjCZLYC3ZYAcyw2+seks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3zlQvm5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3zlQvm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792364259; x=1823900259;
  h=date:from:to:cc:subject:message-id;
  bh=EOWCw0e1XoNd5MlywLol29JIDA2Muodue3/uxKJkqGE=;
  b=f3zlQvm5yI/stNM4MsHvBWLYdKp1yOkNLK+eMul9KGF4H2gc42xAwlKx
   +Io+EHIL/jd7ia9V5FFTeDXoJl8Q5tgDI2kkMvrLkOAcdi3XEHwKZYloN
   TJ3qEc7CenEUG9GRirbLtKuH0afPFwleUJI0cYwh8YCIHAxPUKgGVIAM3
   V5gtTA7mBwIvGpeI77Y+TVjQA2NLZ6xSXfGwox/3sIGgjUF2cGVuOj13y
   kVyeCYntwG+hwHS99Y8Hi7vcVcuD4hqH/rTXVmXOebXZ2H5wfL34j7jjs
   qMIJV9/pBJsLtMoCCVEdaK6ugPszlOb1Ct4KELgIaAnmbCf07vIxB+bPJ
   Q==;
X-CSE-ConnectionGUID: +lXB5Tc5QuqGnJuVdlyLAA==
X-CSE-MsgGUID: XA05KiFDS5iPhKGYMKj4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1049720"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1049720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 15:57:38 -0700
X-CSE-ConnectionGUID: ytI5IPtvRSys0J0DlZxjOw==
X-CSE-MsgGUID: uowjXUNLQlWRybmoD2hQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2373515"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2026 15:57:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIZos-000000005K5-0jyP;
	Sun, 18 Oct 2026 22:57:34 +0000
Date: Mon, 19 Oct 2026 00:57:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned
 expression compared with zero: bit < 0
Message-ID: <202610190011.8qaaFYbN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f909e534f5e34feb2ea2701d54df63e21aa506fc
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 unwind_user/x86: Enable frame pointer unwinding on x86
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-2102-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190011.8qaaFYbN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 49cf34c0815f ("unwind_user/x86: Enable frame pointer unwinding on x86")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610190011.8qaaFYbN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression compared with zero: bit < 0

vim +257 kernel/unwind/deferred.c

b3b9cb11aa034cf Steven Rostedt 2025-07-29  204  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  205  /**
2dffa355f6c279e Josh Poimboeuf 2025-07-29  206   * unwind_deferred_request - Request a user stacktrace on task kernel exit
2dffa355f6c279e Josh Poimboeuf 2025-07-29  207   * @work: Unwind descriptor requesting the trace
2dffa355f6c279e Josh Poimboeuf 2025-07-29  208   * @cookie: The cookie of the first request made for this task
2dffa355f6c279e Josh Poimboeuf 2025-07-29  209   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  210   * Schedule a user space unwind to be done in task work before exiting the
2dffa355f6c279e Josh Poimboeuf 2025-07-29  211   * kernel.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  212   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  213   * The returned @cookie output is the generated cookie of the very first
2dffa355f6c279e Josh Poimboeuf 2025-07-29  214   * request for a user space stacktrace for this task since it entered the
2dffa355f6c279e Josh Poimboeuf 2025-07-29  215   * kernel. It can be from a request by any caller of this infrastructure.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  216   * Its value will also be passed to the callback function.  It can be
2dffa355f6c279e Josh Poimboeuf 2025-07-29  217   * used to stitch kernel and user stack traces together in post-processing.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  218   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  219   * It's valid to call this function multiple times for the same @work within
2dffa355f6c279e Josh Poimboeuf 2025-07-29  220   * the same task entry context.  Each call will return the same cookie
2dffa355f6c279e Josh Poimboeuf 2025-07-29  221   * while the task hasn't left the kernel. If the callback is not pending
2dffa355f6c279e Josh Poimboeuf 2025-07-29  222   * because it has already been previously called for the same entry context,
2dffa355f6c279e Josh Poimboeuf 2025-07-29  223   * it will be called again with the same stack trace and cookie.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  224   *
be3d526a5b34109 Steven Rostedt 2025-07-29  225   * Return: 0 if the callback successfully was queued.
be3d526a5b34109 Steven Rostedt 2025-07-29  226   *         1 if the callback is pending or was already executed.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  227   *         Negative if there's an error.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  228   *         @cookie holds the cookie of the first request by any user
2dffa355f6c279e Josh Poimboeuf 2025-07-29  229   */
2dffa355f6c279e Josh Poimboeuf 2025-07-29  230  int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
2dffa355f6c279e Josh Poimboeuf 2025-07-29  231  {
2dffa355f6c279e Josh Poimboeuf 2025-07-29  232  	struct unwind_task_info *info = &current->unwind_info;
a38a64712e740d6 Peter Zijlstra 2025-09-22  233  	int twa_mode = TWA_RESUME;
be3d526a5b34109 Steven Rostedt 2025-07-29  234  	unsigned long old, bits;
357eda2d745054e Steven Rostedt 2025-07-29  235  	unsigned long bit;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  236  	int ret;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  237  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  238  	*cookie = 0;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  239  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  240  	if ((current->flags & (PF_KTHREAD | PF_EXITING)) ||
2dffa355f6c279e Josh Poimboeuf 2025-07-29  241  	    !user_mode(task_pt_regs(current)))
2dffa355f6c279e Josh Poimboeuf 2025-07-29  242  		return -EINVAL;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  243  
055c7060e7ca71b Steven Rostedt 2025-07-29  244  	/*
055c7060e7ca71b Steven Rostedt 2025-07-29  245  	 * NMI requires having safe cmpxchg operations.
055c7060e7ca71b Steven Rostedt 2025-07-29  246  	 * Trigger a warning to make it obvious that an architecture
055c7060e7ca71b Steven Rostedt 2025-07-29  247  	 * is using this in NMI when it should not be.
055c7060e7ca71b Steven Rostedt 2025-07-29  248  	 */
a38a64712e740d6 Peter Zijlstra 2025-09-22  249  	if (in_nmi()) {
a38a64712e740d6 Peter Zijlstra 2025-09-22  250  		if (WARN_ON_ONCE(!CAN_USE_IN_NMI))
055c7060e7ca71b Steven Rostedt 2025-07-29  251  			return -EINVAL;
a38a64712e740d6 Peter Zijlstra 2025-09-22  252  		twa_mode = TWA_NMI_CURRENT;
a38a64712e740d6 Peter Zijlstra 2025-09-22  253  	}
055c7060e7ca71b Steven Rostedt 2025-07-29  254  
357eda2d745054e Steven Rostedt 2025-07-29  255  	/* Do not allow cancelled works to request again */
357eda2d745054e Steven Rostedt 2025-07-29  256  	bit = READ_ONCE(work->bit);
357eda2d745054e Steven Rostedt 2025-07-29 @257  	if (WARN_ON_ONCE(bit < 0))
357eda2d745054e Steven Rostedt 2025-07-29  258  		return -EINVAL;
357eda2d745054e Steven Rostedt 2025-07-29  259  
357eda2d745054e Steven Rostedt 2025-07-29  260  	/* Only need the mask now */
357eda2d745054e Steven Rostedt 2025-07-29  261  	bit = BIT(bit);
357eda2d745054e Steven Rostedt 2025-07-29  262  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  263  	guard(irqsave)();
2dffa355f6c279e Josh Poimboeuf 2025-07-29  264  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  265  	*cookie = get_cookie(info);
2dffa355f6c279e Josh Poimboeuf 2025-07-29  266  
639214f65b1db87 Peter Zijlstra 2025-09-22  267  	old = atomic_long_read(&info->unwind_mask);
055c7060e7ca71b Steven Rostedt 2025-07-29  268  
be3d526a5b34109 Steven Rostedt 2025-07-29  269  	/* Is this already queued or executed */
be3d526a5b34109 Steven Rostedt 2025-07-29  270  	if (old & bit)
2dffa355f6c279e Josh Poimboeuf 2025-07-29  271  		return 1;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  272  
be3d526a5b34109 Steven Rostedt 2025-07-29  273  	/*
be3d526a5b34109 Steven Rostedt 2025-07-29  274  	 * This work's bit hasn't been set yet. Now set it with the PENDING
be3d526a5b34109 Steven Rostedt 2025-07-29  275  	 * bit and fetch the current value of unwind_mask. If ether the
be3d526a5b34109 Steven Rostedt 2025-07-29  276  	 * work's bit or PENDING was already set, then this is already queued
be3d526a5b34109 Steven Rostedt 2025-07-29  277  	 * to have a callback.
be3d526a5b34109 Steven Rostedt 2025-07-29  278  	 */
be3d526a5b34109 Steven Rostedt 2025-07-29  279  	bits = UNWIND_PENDING | bit;
639214f65b1db87 Peter Zijlstra 2025-09-22  280  	old = atomic_long_fetch_or(bits, &info->unwind_mask);
be3d526a5b34109 Steven Rostedt 2025-07-29  281  	if (old & bits) {
be3d526a5b34109 Steven Rostedt 2025-07-29  282  		/*
be3d526a5b34109 Steven Rostedt 2025-07-29  283  		 * If the work's bit was set, whatever set it had better
be3d526a5b34109 Steven Rostedt 2025-07-29  284  		 * have also set pending and queued a callback.
be3d526a5b34109 Steven Rostedt 2025-07-29  285  		 */
be3d526a5b34109 Steven Rostedt 2025-07-29  286  		WARN_ON_ONCE(!(old & UNWIND_PENDING));
be3d526a5b34109 Steven Rostedt 2025-07-29  287  		return old & bit;
be3d526a5b34109 Steven Rostedt 2025-07-29  288  	}
be3d526a5b34109 Steven Rostedt 2025-07-29  289  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  290  	/* The work has been claimed, now schedule it. */
a38a64712e740d6 Peter Zijlstra 2025-09-22  291  	ret = task_work_add(current, &info->work, twa_mode);
2dffa355f6c279e Josh Poimboeuf 2025-07-29  292  
be3d526a5b34109 Steven Rostedt 2025-07-29  293  	if (WARN_ON_ONCE(ret))
639214f65b1db87 Peter Zijlstra 2025-09-22  294  		atomic_long_set(&info->unwind_mask, 0);
be3d526a5b34109 Steven Rostedt 2025-07-29  295  
be3d526a5b34109 Steven Rostedt 2025-07-29  296  	return ret;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  297  }
2dffa355f6c279e Josh Poimboeuf 2025-07-29  298  

:::::: The code at line 257 was first introduced by commit
:::::: 357eda2d745054eb737397368bc9b0f84814b0a5 unwind deferred: Use SRCU unwind_deferred_task_work()

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
