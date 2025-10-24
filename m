Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB2302CD1
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341160; cv=none; b=j6e34ezfEHikYBR+Y7JWf+SyyzN/QvaGjCNePXa2PfL0hbahGp7yV/GoUIFYbJQ73P/mhZ6n2UOHhi0vr/YU+rliDyh/KfFa3KqrBER0QFjNcS3gyCugzteJQ8UWjia2+FgZPinqiGAj3q+gt2+dtvIrhw6W/SFuNLna+erFE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341160; c=relaxed/simple;
	bh=xcq/5r3j7IsgDOLgA97AlGgQ8pKKeUS0GLAI+y+bZ6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4luR3ViTBalsFexdiFw4e9OdPYmOSxhyA3LK8mBKNLqRsXavZPIq6ZbRCYxBFmEdDUs3Xij4uEI38e8wOGeuMclRvoEK0pyjXfRr0zk/o4PVB0CuUcajN+7oka7T3qmbtfar3i40xcL0T3rBZnQgiC+hi2JAD3oSU/r5v4aUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Is9c3Ma/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Is9c3Ma/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761341158; x=1792877158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcq/5r3j7IsgDOLgA97AlGgQ8pKKeUS0GLAI+y+bZ6s=;
  b=Is9c3Ma/UxPEe8WWzs6/9uCUYqeEVUDL6L8Z2Mz9Z38wXBX0u4DbMcnE
   u+HpfxzZB2KlkDn8ed9rNHH1+aRapuiW4kQKGV3qsJj8NGew+tuq49yV9
   8Vh1l5CeektzUEfEWxDfmB/4Kfg3T/8eRbyXM9z0RHSJSc0IqxphgJAeS
   1TWvIEuJ/Qem9oriM4Gs1hCU4X7vw53oLRV52zqiGCY6OfJy6Jt+veltN
   1fGdaF8Is770QNy2tP8XE5Kfq/ASpnDDwtEJN9xa0fIaIAlwtfVB090EP
   /HJri/uvcAd9w3YOk39o0d2F3M16eDiNGn1rg9SwMdUCCURgbtGy2CKYa
   w==;
X-CSE-ConnectionGUID: fq9scdl8QDCU47NgChz/og==
X-CSE-MsgGUID: 4B6b2Vd3TQCbPkxKweOe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81153025"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="81153025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:25:58 -0700
X-CSE-ConnectionGUID: AwvQ4aKkSBKUvlWSQrWdHA==
X-CSE-MsgGUID: 1UBYiv/TTXu9tTrC3CDo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="185290182"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 14:25:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCPII-000Etr-1b;
	Fri, 24 Oct 2025 21:25:54 +0000
Date: Sat, 25 Oct 2025 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [peterz-queue:unwind/cleanup 12/18]
 kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression compared
 with zero: bit < 0
Message-ID: <202510250538.kFzewmPW-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git unwind/cleanup
head:   5a1e27bf9e59bb6b8219d32b2185991bee9545d2
commit: acf668647a06903c5e2b0013422062691dd3c6fe [12/18] unwind_user/x86: Enable frame pointer unwinding on x86
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-101-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250538.kFzewmPW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510250538.kFzewmPW-lkp@intel.com/

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
1d49742d3279de Peter Zijlstra 2025-09-22  233  	int twa_mode = TWA_RESUME;
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
1d49742d3279de Peter Zijlstra 2025-09-22  249  	if (in_nmi()) {
1d49742d3279de Peter Zijlstra 2025-09-22  250  		if (WARN_ON_ONCE(!CAN_USE_IN_NMI))
055c7060e7ca71 Steven Rostedt 2025-07-29  251  			return -EINVAL;
1d49742d3279de Peter Zijlstra 2025-09-22  252  		twa_mode = TWA_NMI_CURRENT;
1d49742d3279de Peter Zijlstra 2025-09-22  253  	}
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
d9d41f5e52d208 Peter Zijlstra 2025-09-22  267  	old = atomic_long_read(&info->unwind_mask);
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
d9d41f5e52d208 Peter Zijlstra 2025-09-22  280  	old = atomic_long_fetch_or(bits, &info->unwind_mask);
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
1d49742d3279de Peter Zijlstra 2025-09-22  291  	ret = task_work_add(current, &info->work, twa_mode);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  292  
be3d526a5b3410 Steven Rostedt 2025-07-29  293  	if (WARN_ON_ONCE(ret))
d9d41f5e52d208 Peter Zijlstra 2025-09-22  294  		atomic_long_set(&info->unwind_mask, 0);
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
