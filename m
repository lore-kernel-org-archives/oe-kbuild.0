Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BEB2BE7C6
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052177; cv=none; b=vEjgrcx79h7l+vWV2IWWmpzLdcVO4sn8D93om5yCpaQSqvmGpiWWoyNNhNWqoHrNsdd0t5mq7KYnQwpCUauMYziqx9dFPwaIcWmevkONuXtcyjGv0meuu2v6UH2zhmfOJJ9Qc00Qk/uHH2dWZBZH+D+ZEDIP2pss7x9e3iGVzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052177; c=relaxed/simple;
	bh=ZmtV32lKR5EobidoOgK2eZDDVu/I3iiECWbQkYSsqiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiuMqk3PlbKuz6D0056tRIpSoakjXEsUmk5zwd7gXys//GYeWBbQ4BHa5cIX4G2eKFNJgaZNdiwBa5/OazSVK3la9PpuSJVU7K5uCRwy0oEp+y1piyi0cK0Nxh31RxLGxFtx91N3ADichTKtqKgZGeHo7O8XYgRLJmqN1cYXVV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUzkOL0Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUzkOL0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766052175; x=1797588175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmtV32lKR5EobidoOgK2eZDDVu/I3iiECWbQkYSsqiE=;
  b=kUzkOL0ZXigepuDJbDh7wrwXbE+Kbmv79fGkOBbL46/oL8kev4K19z3L
   hoBAflMDEkI7JUDpvXRObz0pa/Dn0jw8YR+NeDk6JQ847x3TEjkScEy0g
   i0z/cpo6oDHMkrwfjXGz6GjQP96gB+vDv6SpX0wxeEgVXIR/s7mBRdaOh
   EVA3bSuq6vpDL72r4Se0AVNHF2ihLCoMuN5H8LkBeE1TvxKDVwM0AUrNM
   KMXgni585EvWl4BEzxLmCS+E5Pj5Nyg2782IEibsA1FVBOOEUWdAAoUsA
   6lr/hvoemuhtJH3DPos0L/6NrnlP//wwZ6fK5t8VNH747VdRvajJBtyIi
   g==;
X-CSE-ConnectionGUID: /jEXadIZSQ+OEihZ+Lmtig==
X-CSE-MsgGUID: obg0VkjbRea/cM1lvaXz7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79125890"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="79125890"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:02:55 -0800
X-CSE-ConnectionGUID: mJvsAKivQO6Gvu0uI94Z0w==
X-CSE-MsgGUID: RilvmtwhTleOinH0jV0GUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="229608161"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 02:02:53 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWAqR-000000001vD-2Puf;
	Thu, 18 Dec 2025 10:02:51 +0000
Date: Thu, 18 Dec 2025 18:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/unwind/deferred.c:257:13: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202512181724.yp1BFY94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/unwind/deferred.c:257:13: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 unwind_user/x86: Enable frame pointer unwinding on x86
date:   7 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-122-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181724.yp1BFY94-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181724.yp1BFY94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181724.yp1BFY94-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/unwind/deferred.c:149:13: sparse: sparse: context imbalance in 'process_unwind_deferred' - different lock contexts for basic block
>> kernel/unwind/deferred.c:257:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/unwind/deferred.c:256:15: sparse: signed value source

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
