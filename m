Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC837757C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 04:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534562; cv=none; b=QMSA0ybukwlG0BaQVNJccCwVKyVgpjHLfzvdrqViY1F6YFpS1poi9e8CIJwTu23lTn61wbXG318BJxStuezHMNmefQb1im3vI0Mb78sdUJANw/yFIb203xS1JvQX6dI/ERk2i8AghKU0rJrhTzBfkO4902eQJMLxiAAo/Q1X0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534562; c=relaxed/simple;
	bh=g5kXg+GuXpBBKKeEjXWKNXZr169BQGSIMthnDcIuTdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GRtWC//UklqTPhgWkh8fXfw6ARiNsgKCX+J8SvkbjsuxDtiUQINnneVYGayTtaX1wmAw/FqtpruSmGNv6ilA3qZUk7/5N7rr0tM3k46jMCwamLhm6nwLKMQpcSaeBFAKg413rJpXgT7GFQbCGDvGNIRblXinm0rLhja9AeGiF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFJyAPb/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFJyAPb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534561; x=1807070561;
  h=date:from:to:cc:subject:message-id;
  bh=g5kXg+GuXpBBKKeEjXWKNXZr169BQGSIMthnDcIuTdY=;
  b=oFJyAPb/K3gfA4v4+I2W2gYjMQccnq9HklZFoy/ZMLToUg4eBQIcfhob
   3ANv4pTTGIyKKyfMPsqRDFjcJtGe5lC8UdJXFxQCYWvrqtZLlQVxk7xPR
   Cg8zBAdlfo3MrAveDYvhYq2fNi16/HcMUB3zhOvQTkRpDZ5Nbahd3R9Ls
   gcnqpODMW41VE0WGdAsCko4r2NpXD2+PuuuXvJQbN7+mLhvvxz0Vt143T
   9A6T+M4iyomx2Tt1ZTP74e+fd9dUrOxLPoEJMKQ/+kP1aZD8d6vEsuj4t
   ESGVSegHqFMfLjHRj/BS/rFCra15HuEhoXXRUmR8zjD4ur+Xg7E40uVP1
   w==;
X-CSE-ConnectionGUID: WJkov32nSmSkrYLzocNP2Q==
X-CSE-MsgGUID: ZxB6g5vVTYmGKtseHn4wdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386024"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: CWqm+VfQT7SK9CjM7uPpQg==
X-CSE-MsgGUID: ClY8BAbtQI+fTSPOosa+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957162"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-0000000008J-42k0;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned
 expression compared with zero: bit < 0
Message-ID: <202604061428.rzg6h0V1-lkp@intel.com>
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
head:   591cd656a1bf5ea94a222af5ef2ee76df029c1d2
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 unwind_user/x86: Enable frame pointer unwinding on x86
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-101-20260405 (https://download.01.org/0day-ci/archive/20260406/202604061428.rzg6h0V1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 49cf34c0815f ("unwind_user/x86: Enable frame pointer unwinding on x86")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604061428.rzg6h0V1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression compared with zero: bit < 0

vim +257 kernel/unwind/deferred.c

b3b9cb11aa034c Steven Rostedt 2025-07-29  204  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  205  /**
2dffa355f6c279 Josh Poimboeuf 2025-07-29  206   * unwind_deferred_request - Request a user stacktrace on task kernel exit
2dffa355f6c279 Josh Poimboeuf 2025-07-29  207   * @work: Unwind descriptor requesting the trace
2dffa355f6c279 Josh Poimboeuf 2025-07-29  208   * @cookie: The cookie of the first request made for this task
2dffa355f6c279 Josh Poimboeuf 2025-07-29  209   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  210   * Schedule a user space unwind to be done in task work before exiting the
2dffa355f6c279 Josh Poimboeuf 2025-07-29  211   * kernel.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  212   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  213   * The returned @cookie output is the generated cookie of the very first
2dffa355f6c279 Josh Poimboeuf 2025-07-29  214   * request for a user space stacktrace for this task since it entered the
2dffa355f6c279 Josh Poimboeuf 2025-07-29  215   * kernel. It can be from a request by any caller of this infrastructure.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  216   * Its value will also be passed to the callback function.  It can be
2dffa355f6c279 Josh Poimboeuf 2025-07-29  217   * used to stitch kernel and user stack traces together in post-processing.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  218   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  219   * It's valid to call this function multiple times for the same @work within
2dffa355f6c279 Josh Poimboeuf 2025-07-29  220   * the same task entry context.  Each call will return the same cookie
2dffa355f6c279 Josh Poimboeuf 2025-07-29  221   * while the task hasn't left the kernel. If the callback is not pending
2dffa355f6c279 Josh Poimboeuf 2025-07-29  222   * because it has already been previously called for the same entry context,
2dffa355f6c279 Josh Poimboeuf 2025-07-29  223   * it will be called again with the same stack trace and cookie.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  224   *
be3d526a5b3410 Steven Rostedt 2025-07-29  225   * Return: 0 if the callback successfully was queued.
be3d526a5b3410 Steven Rostedt 2025-07-29  226   *         1 if the callback is pending or was already executed.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  227   *         Negative if there's an error.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  228   *         @cookie holds the cookie of the first request by any user
2dffa355f6c279 Josh Poimboeuf 2025-07-29  229   */
2dffa355f6c279 Josh Poimboeuf 2025-07-29  230  int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
2dffa355f6c279 Josh Poimboeuf 2025-07-29  231  {
2dffa355f6c279 Josh Poimboeuf 2025-07-29  232  	struct unwind_task_info *info = &current->unwind_info;
a38a64712e740d Peter Zijlstra 2025-09-22  233  	int twa_mode = TWA_RESUME;
be3d526a5b3410 Steven Rostedt 2025-07-29  234  	unsigned long old, bits;
357eda2d745054 Steven Rostedt 2025-07-29  235  	unsigned long bit;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  236  	int ret;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  237  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  238  	*cookie = 0;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  239  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  240  	if ((current->flags & (PF_KTHREAD | PF_EXITING)) ||
2dffa355f6c279 Josh Poimboeuf 2025-07-29  241  	    !user_mode(task_pt_regs(current)))
2dffa355f6c279 Josh Poimboeuf 2025-07-29  242  		return -EINVAL;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  243  
055c7060e7ca71 Steven Rostedt 2025-07-29  244  	/*
055c7060e7ca71 Steven Rostedt 2025-07-29  245  	 * NMI requires having safe cmpxchg operations.
055c7060e7ca71 Steven Rostedt 2025-07-29  246  	 * Trigger a warning to make it obvious that an architecture
055c7060e7ca71 Steven Rostedt 2025-07-29  247  	 * is using this in NMI when it should not be.
055c7060e7ca71 Steven Rostedt 2025-07-29  248  	 */
a38a64712e740d Peter Zijlstra 2025-09-22  249  	if (in_nmi()) {
a38a64712e740d Peter Zijlstra 2025-09-22  250  		if (WARN_ON_ONCE(!CAN_USE_IN_NMI))
055c7060e7ca71 Steven Rostedt 2025-07-29  251  			return -EINVAL;
a38a64712e740d Peter Zijlstra 2025-09-22  252  		twa_mode = TWA_NMI_CURRENT;
a38a64712e740d Peter Zijlstra 2025-09-22  253  	}
055c7060e7ca71 Steven Rostedt 2025-07-29  254  
357eda2d745054 Steven Rostedt 2025-07-29  255  	/* Do not allow cancelled works to request again */
357eda2d745054 Steven Rostedt 2025-07-29  256  	bit = READ_ONCE(work->bit);
357eda2d745054 Steven Rostedt 2025-07-29 @257  	if (WARN_ON_ONCE(bit < 0))
357eda2d745054 Steven Rostedt 2025-07-29  258  		return -EINVAL;
357eda2d745054 Steven Rostedt 2025-07-29  259  
357eda2d745054 Steven Rostedt 2025-07-29  260  	/* Only need the mask now */
357eda2d745054 Steven Rostedt 2025-07-29  261  	bit = BIT(bit);
357eda2d745054 Steven Rostedt 2025-07-29  262  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  263  	guard(irqsave)();
2dffa355f6c279 Josh Poimboeuf 2025-07-29  264  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  265  	*cookie = get_cookie(info);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  266  
639214f65b1db8 Peter Zijlstra 2025-09-22  267  	old = atomic_long_read(&info->unwind_mask);
055c7060e7ca71 Steven Rostedt 2025-07-29  268  
be3d526a5b3410 Steven Rostedt 2025-07-29  269  	/* Is this already queued or executed */
be3d526a5b3410 Steven Rostedt 2025-07-29  270  	if (old & bit)
2dffa355f6c279 Josh Poimboeuf 2025-07-29  271  		return 1;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  272  
be3d526a5b3410 Steven Rostedt 2025-07-29  273  	/*
be3d526a5b3410 Steven Rostedt 2025-07-29  274  	 * This work's bit hasn't been set yet. Now set it with the PENDING
be3d526a5b3410 Steven Rostedt 2025-07-29  275  	 * bit and fetch the current value of unwind_mask. If ether the
be3d526a5b3410 Steven Rostedt 2025-07-29  276  	 * work's bit or PENDING was already set, then this is already queued
be3d526a5b3410 Steven Rostedt 2025-07-29  277  	 * to have a callback.
be3d526a5b3410 Steven Rostedt 2025-07-29  278  	 */
be3d526a5b3410 Steven Rostedt 2025-07-29  279  	bits = UNWIND_PENDING | bit;
639214f65b1db8 Peter Zijlstra 2025-09-22  280  	old = atomic_long_fetch_or(bits, &info->unwind_mask);
be3d526a5b3410 Steven Rostedt 2025-07-29  281  	if (old & bits) {
be3d526a5b3410 Steven Rostedt 2025-07-29  282  		/*
be3d526a5b3410 Steven Rostedt 2025-07-29  283  		 * If the work's bit was set, whatever set it had better
be3d526a5b3410 Steven Rostedt 2025-07-29  284  		 * have also set pending and queued a callback.
be3d526a5b3410 Steven Rostedt 2025-07-29  285  		 */
be3d526a5b3410 Steven Rostedt 2025-07-29  286  		WARN_ON_ONCE(!(old & UNWIND_PENDING));
be3d526a5b3410 Steven Rostedt 2025-07-29  287  		return old & bit;
be3d526a5b3410 Steven Rostedt 2025-07-29  288  	}
be3d526a5b3410 Steven Rostedt 2025-07-29  289  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  290  	/* The work has been claimed, now schedule it. */
a38a64712e740d Peter Zijlstra 2025-09-22  291  	ret = task_work_add(current, &info->work, twa_mode);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  292  
be3d526a5b3410 Steven Rostedt 2025-07-29  293  	if (WARN_ON_ONCE(ret))
639214f65b1db8 Peter Zijlstra 2025-09-22  294  		atomic_long_set(&info->unwind_mask, 0);
be3d526a5b3410 Steven Rostedt 2025-07-29  295  
be3d526a5b3410 Steven Rostedt 2025-07-29  296  	return ret;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  297  }
2dffa355f6c279 Josh Poimboeuf 2025-07-29  298  

:::::: The code at line 257 was first introduced by commit
:::::: 357eda2d745054eb737397368bc9b0f84814b0a5 unwind deferred: Use SRCU unwind_deferred_task_work()

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
