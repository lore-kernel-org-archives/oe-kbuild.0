Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F72E764B
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033132; cv=none; b=TpJWihW9UtIaHDKjrfd1J4AoTE9aMcVly6kt/OzQGXJVyhKI+EwedpgAlMnPgJS0hzsFhvSE6FDfsITz+uahOtm1TVTViES371R1C4NVZwjwJcgc/EzrB3s7/duZadLrJ37nZjmtnzEJTbYGPdbB8Fj9MnwM5QneW0I1wQrfHLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033132; c=relaxed/simple;
	bh=PU1D0A5D3Q4t408QD+cfhQE7tJ8xdTbWhsX9vjjiig4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=iaIT7uGpCcgS0WAywSOrO41s38gcwajwi6sRyXro4U6ha+d+9JHwS7GOw64ybtY6dIqKWelONWjSdBZtBYjEEx++tIYqJ12H5i0t23XTb4UqEKjOkW3Qltbc16zHjgQfGcwcYiOwrGB3E2GLBNhQqcRHPx8zRBP7E7nZ6jsuoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=MOQnakNi; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="MOQnakNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvlDMIo88j28ra6wZaDYPg8w1AKZhrc0BeaSGE3BhqU=;
  b=MOQnakNiyA98KAZvJKWZpXP0t8jp48CyF5VWOK3k9u0R+UNv3I9OriFB
   ofGPxitl6EovBCnYtDXD0ehNtoUq7TNVxs4pZXHkv72AdKa5dW06EFypN
   6rjqh7LsOUwNz6FLkTLFLU/7IEXW4QdzHV0D38Kf8xE24XG8+5o+0MZOJ
   8=;
X-CSE-ConnectionGUID: 40oiM+L2S+6fVHOD97rC4w==
X-CSE-MsgGUID: a3X2DuSzQAKeznZW8I1lHg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,268,1763420400"; 
   d="scan'208";a="137663532"
Received: from unknown (HELO hadrien) ([130.226.132.96])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 12:51:00 +0100
Date: Mon, 2 Feb 2026 12:50:48 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Josh Poimboeuf <jpoimboe@kernel.org>
cc: Peter Zijlstra <peterz@infradead.org>, 
    "Steven Rostedt (Google)" <rostedt@goodmis.org>, oe-kbuild@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression
 compared with zero: bit < 0 (fwd)
Message-ID: <beb6a395-d920-6c9a-7915-ea5c5f92954@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

bit is unsigned, so it should not be less than 0.

julia

---------- Forwarded message ----------
Date: Mon, 02 Feb 2026 19:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression
    compared with zero: bit < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 unwind_user/x86: Enable frame pointer unwinding on x86
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r061-20260201 (https://download.01.org/0day-ci/archive/20260202/202602021905.rcDCOYtq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602021905.rcDCOYtq-lkp@intel.com/

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
