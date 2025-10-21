Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5225E44E
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761028991; cv=none; b=ezU/KWfwh3yBNtbz+o1nq6F7eQONGfuaVxUz8wM75IFhMB0CMt32Qie898eN9MFVyRzmjnrCeWvHW157Alr7I242eh3qyEt+BeJhoNpMxJ0qh9yiGUoI0p9ZOTj8ajj4s2DjXDG3UBuo9/jk68FujqmlaJp9uq7JOlbnka70m90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761028991; c=relaxed/simple;
	bh=/snG5jF2hyBMP65mgO+xtwyquJr0IrbFkcJVIDXZmQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgkUuGmr5Tq7IE9YLEQgeRqvELiBZQWiZBj2Zeoe4i5lyqOWOswyxmT6481Diwp4udpayB/Aicj4+Dsxv2OaX77BNDkYPuKvnRYr8896QeBroUk2DWCmSezwhiD2nSEjogUzrhvCKUcfmsMNaM4G0zyPGDeKEgJb7Ld/3tARCm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG37U+bm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG37U+bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761028990; x=1792564990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/snG5jF2hyBMP65mgO+xtwyquJr0IrbFkcJVIDXZmQY=;
  b=DG37U+bm5QDJGrzYagAiR0038Cf0SS0pZoNYGMEqIi7AUqlqJCwwelhj
   IeOOpMLNRwqhCC//oalj7z4x1tZmF9iEATO4Ij3amhPilT74vn71pTp1+
   Q+AZuE3DS+0BFbuqgvjfiPZOKbe98s2j5aKwpaR50Gpv8NiZOWsqwZf1S
   QfeqO49/TIGLwxeLJPLZ0215ncwJ9Y34rZVTgZb28p11TijoZQ6RXbjSc
   01I7XUvPNSxaY8beU+fRa+LQ0NSfLBvuGfT36TflnQqZ693Tb5OXSL8P+
   /nLY+Ct585oa754swlhoqRzJ2TKUles+XtboZoEhIpT6hIxnARx9i4zR6
   Q==;
X-CSE-ConnectionGUID: ftFQIOXUS5+hx/PZcNOELQ==
X-CSE-MsgGUID: IHYmWJhjQueHmeSW7nsQRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63053505"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63053505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:43:09 -0700
X-CSE-ConnectionGUID: 0U5G+dSCSdSV8LqwCRK/DA==
X-CSE-MsgGUID: rxHkJACeQa22eCe8sl/l9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="220682773"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 23:43:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB65J-000AZp-2B;
	Tue, 21 Oct 2025 06:43:05 +0000
Date: Tue, 21 Oct 2025 14:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:unwind/cleanup 12/12] kernel/unwind/deferred.c:257:13:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202510211405.ZyFyzDaJ-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git unwind/cleanup
head:   bc2b0f6338a5709be96c467b95bf4a0511858ef3
commit: bc2b0f6338a5709be96c467b95bf4a0511858ef3 [12/12] unwind_user/x86: Enable frame pointer unwinding on x86
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-r111-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211405.ZyFyzDaJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211405.ZyFyzDaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510211405.ZyFyzDaJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/deferred.c:257:13: sparse: sparse: unsigned value that used to be signed checked against zero?
>> kernel/unwind/deferred.c:256:15: sparse: signed value source

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
4313d26c94afe0 Peter Zijlstra 2025-09-22  233  	int twa_mode = TWA_RESUME;
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
4313d26c94afe0 Peter Zijlstra 2025-09-22  249  	if (in_nmi()) {
4313d26c94afe0 Peter Zijlstra 2025-09-22  250  		if (WARN_ON_ONCE(!CAN_USE_IN_NMI))
055c7060e7ca71 Steven Rostedt 2025-07-29  251  			return -EINVAL;
4313d26c94afe0 Peter Zijlstra 2025-09-22  252  		twa_mode = TWA_NMI_CURRENT;
4313d26c94afe0 Peter Zijlstra 2025-09-22  253  	}
055c7060e7ca71 Steven Rostedt 2025-07-29  254  
357eda2d745054 Steven Rostedt 2025-07-29  255  	/* Do not allow cancelled works to request again */
357eda2d745054 Steven Rostedt 2025-07-29 @256  	bit = READ_ONCE(work->bit);
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
0d81ec152dfda2 Peter Zijlstra 2025-09-22  267  	old = atomic_long_read(&info->unwind_mask);
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
0d81ec152dfda2 Peter Zijlstra 2025-09-22  280  	old = atomic_long_fetch_or(bits, &info->unwind_mask);
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
4313d26c94afe0 Peter Zijlstra 2025-09-22  291  	ret = task_work_add(current, &info->work, twa_mode);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  292  
be3d526a5b3410 Steven Rostedt 2025-07-29  293  	if (WARN_ON_ONCE(ret))
0d81ec152dfda2 Peter Zijlstra 2025-09-22  294  		atomic_long_set(&info->unwind_mask, 0);
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
