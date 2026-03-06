Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E93E0C51
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811055; cv=none; b=oLFFnn2fbKRCcsEOtKL3k1LCVn2j48XHuIgztK7NBB5T7iw3oiAewdNuOxFXzmXZkbDtY/SJ4gPt6oPV+pSGghab1eLScMXTNjiPnVU7116Vu2h7z66fELlIFj3e3CqQR53NIq9IZmXQG7HMQHV1xYHesjDzR8excbjVZ+jhYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811055; c=relaxed/simple;
	bh=okpLv1gfUdglCCeqk+NyXRPHgkMDAVgZd+clmeSCET8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UI1Gim0sn3ZzYIgPkz4S3jwOfkB/Pk5ijSbBPNXOxRxqLLOo0UxKNjagTjtRXSX26B0gJGRPutuvKlHaKP/9cA5e6wa+xcjB8uyLOCMA7ZyqaXDp8iA+lPKtj64RzXd1lH6B3qNedpnvg+HnGslY3QJmLbN3WOOE1z132dh61fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fim/b2Hj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fim/b2Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772811054; x=1804347054;
  h=date:from:to:cc:subject:message-id;
  bh=okpLv1gfUdglCCeqk+NyXRPHgkMDAVgZd+clmeSCET8=;
  b=fim/b2HjDx1939NCv92dq8V8tO67XtG2TU1DdJJLqotXO5gW98oW9X5g
   p/IuQKJEN1Esmm+MZxNccsHCzgpO+nu2xap3iIA2ZgKp3xRXGpPA1sGuq
   T3IPGBvr/9Zvm0Qbh//zCG7rGLtOPMYNiJ2oHUSFRlMOm4ad09gPdqP1v
   Xix9/lwaaWkn95OS6nXaix+69pTuXQtRJG+TbqIMT8+05ULKfsZARtpXo
   whWeXwGQFkQSbnX3hHEksBz38TaqY8yzPeJUJynTDijlRd6tkBAQe0iny
   NJ2NA6K0rcrIY5j7bHn9mVdt8Cn9/hnqtKBydQjCZ+1gUpZ2VqtqpgJzs
   Q==;
X-CSE-ConnectionGUID: vtMRSCCQQVeVWpxyUtYh0A==
X-CSE-MsgGUID: AkHR6bLmQCe3db9EdVvISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73796366"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73796366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:30:53 -0800
X-CSE-ConnectionGUID: 2DmM9qKpQcmmpE1VzjatSQ==
X-CSE-MsgGUID: fmtHInxbTSSPCKwDevFJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="242053795"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 07:30:50 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyX8a-000000000zP-2oYd;
	Fri, 06 Mar 2026 15:30:48 +0000
Date: Fri, 06 Mar 2026 23:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-6.6.y 685/685]
 kernel/sched/fair.c:3478 task_numa_work() warn: possible memory leak of 'ptr'
Message-ID: <202603062304.J43kdsUU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47
commit: 8f149bcc4d91ac92b32ff4949b291e6ed883dc42 [685/685] sched/numa: fix memory leak due to the overwritten vma->numab_state
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-161-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062304.J43kdsUU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603062304.J43kdsUU-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:3478 task_numa_work() warn: possible memory leak of 'ptr'

vim +/ptr +3478 kernel/sched/fair.c

20f586486b87dcf Raghavendra K T         2023-03-01  3229  
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3230  /*
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3231   * The expensive part of numa migration is done from task_work context.
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3232   * Triggered from task_tick_numa().
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3233   */
9434f9f5d117302 Valentin Schneider      2019-07-15  3234  static void task_numa_work(struct callback_head *work)
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3235  {
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3236  	unsigned long migrate, next_scan, now = jiffies;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3237  	struct task_struct *p = current;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3238  	struct mm_struct *mm = p->mm;
51170840fe91dfc Rik van Riel            2015-11-05  3239  	u64 runtime = p->se.sum_exec_runtime;
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3240  	struct vm_area_struct *vma;
9f40604cdab935e Mel Gorman              2012-11-14  3241  	unsigned long start, end;
598f0ec0bc996e9 Mel Gorman              2013-10-07  3242  	unsigned long nr_pte_updates = 0;
4620f8c1fda2af4 Rik van Riel            2015-09-11  3243  	long pages, virtpages;
214dbc4281374cb Liam R. Howlett         2023-01-20  3244  	struct vma_iterator vmi;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3245  	bool vma_pids_skipped;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3246  	bool vma_pids_forced = false;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3247  
9148a3a10e0b74c Peter Zijlstra          2016-09-20  3248  	SCHED_WARN_ON(p != container_of(work, struct task_struct, numa_work));
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3249  
b34920d4ce6e6fc Valentin Schneider      2019-07-15  3250  	work->next = work;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3251  	/*
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3252  	 * Who cares about NUMA placement when they're dying.
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3253  	 *
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3254  	 * NOTE: make sure not to dereference p->mm before this check,
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3255  	 * exit_task_work() happens _after_ exit_mm() so we could be called
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3256  	 * without p->mm even though we still had it when we enqueued this
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3257  	 * work.
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3258  	 */
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3259  	if (p->flags & PF_EXITING)
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3260  		return;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3261  
930aa174fcc8b0e Mel Gorman              2013-10-07  3262  	if (!mm->numa_next_scan) {
7e8d16b6cbccb2f Mel Gorman              2013-10-07  3263  		mm->numa_next_scan = now +
7e8d16b6cbccb2f Mel Gorman              2013-10-07  3264  			msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
b8593bfda165275 Mel Gorman              2012-11-21  3265  	}
b8593bfda165275 Mel Gorman              2012-11-21  3266  
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3267  	/*
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3268  	 * Enforce maximal scan/migration frequency..
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3269  	 */
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3270  	migrate = mm->numa_next_scan;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3271  	if (time_before(now, migrate))
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3272  		return;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3273  
598f0ec0bc996e9 Mel Gorman              2013-10-07  3274  	if (p->numa_scan_period == 0) {
598f0ec0bc996e9 Mel Gorman              2013-10-07  3275  		p->numa_scan_period_max = task_scan_max(p);
b5dd77c8bdada7b Rik van Riel            2017-07-31  3276  		p->numa_scan_period = task_scan_start(p);
598f0ec0bc996e9 Mel Gorman              2013-10-07  3277  	}
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3278  
fb003b80daa0dea Mel Gorman              2012-11-15  3279  	next_scan = now + msecs_to_jiffies(p->numa_scan_period);
8baceabca656d5e Uros Bizjak             2022-08-22  3280  	if (!try_cmpxchg(&mm->numa_next_scan, &migrate, next_scan))
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3281  		return;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3282  
19a78d110d7a804 Peter Zijlstra          2013-10-07  3283  	/*
19a78d110d7a804 Peter Zijlstra          2013-10-07  3284  	 * Delay this task enough that another task of this mm will likely win
19a78d110d7a804 Peter Zijlstra          2013-10-07  3285  	 * the next time around.
19a78d110d7a804 Peter Zijlstra          2013-10-07  3286  	 */
19a78d110d7a804 Peter Zijlstra          2013-10-07  3287  	p->node_stamp += 2 * TICK_NSEC;
19a78d110d7a804 Peter Zijlstra          2013-10-07  3288  
9f40604cdab935e Mel Gorman              2012-11-14  3289  	pages = sysctl_numa_balancing_scan_size;
9f40604cdab935e Mel Gorman              2012-11-14  3290  	pages <<= 20 - PAGE_SHIFT; /* MB in pages */
4620f8c1fda2af4 Rik van Riel            2015-09-11  3291  	virtpages = pages * 8;	   /* Scan up to this much virtual space */
9f40604cdab935e Mel Gorman              2012-11-14  3292  	if (!pages)
9f40604cdab935e Mel Gorman              2012-11-14  3293  		return;
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3294  
4620f8c1fda2af4 Rik van Riel            2015-09-11  3295  
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  3296  	if (!mmap_read_trylock(mm))
8655d5497735b28 Vlastimil Babka         2017-05-15  3297  		return;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3298  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3299  	/*
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3300  	 * VMAs are skipped if the current PID has not trapped a fault within
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3301  	 * the VMA recently. Allow scanning to be forced if there is no
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3302  	 * suitable VMA remaining.
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3303  	 */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3304  	vma_pids_skipped = false;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3305  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3306  retry_pids:
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3307  	start = mm->numa_scan_offset;
214dbc4281374cb Liam R. Howlett         2023-01-20  3308  	vma_iter_init(&vmi, mm, start);
214dbc4281374cb Liam R. Howlett         2023-01-20  3309  	vma = vma_next(&vmi);
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3310  	if (!vma) {
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3311  		reset_ptenuma_scan(p);
9f40604cdab935e Mel Gorman              2012-11-14  3312  		start = 0;
214dbc4281374cb Liam R. Howlett         2023-01-20  3313  		vma_iter_set(&vmi, start);
214dbc4281374cb Liam R. Howlett         2023-01-20  3314  		vma = vma_next(&vmi);
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3315  	}
0cd4d02c32123af Matthew Wilcox (Oracle  2022-09-06  3316) 
ade91f6e9848b37 Shawn Wang              2024-10-25  3317  	for (; vma; vma = vma_next(&vmi)) {
6b79c57b92cdd90 Naoya Horiguchi         2015-04-07  3318  		if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
8e76d4eecf7afee Mel Gorman              2015-06-10  3319  			is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3320  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_UNSUITABLE);
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3321  			continue;
6b79c57b92cdd90 Naoya Horiguchi         2015-04-07  3322  		}
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3323  
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3324  		/*
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3325  		 * Shared library pages mapped by multiple processes are not
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3326  		 * migrated as it is expected they are cache replicated. Avoid
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3327  		 * hinting faults in read-only file-backed mappings or the vdso
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3328  		 * as migrating the pages will be of marginal benefit.
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3329  		 */
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3330  		if (!vma->vm_mm ||
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3331  		    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ))) {
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3332  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3333  			continue;
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3334  		}
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3335  
3c67f474558748b Mel Gorman              2013-12-18  3336  		/*
3c67f474558748b Mel Gorman              2013-12-18  3337  		 * Skip inaccessible VMAs to avoid any confusion between
3c67f474558748b Mel Gorman              2013-12-18  3338  		 * PROT_NONE and NUMA hinting ptes
3c67f474558748b Mel Gorman              2013-12-18  3339  		 */
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3340  		if (!vma_is_accessible(vma)) {
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3341  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_INACCESSIBLE);
3c67f474558748b Mel Gorman              2013-12-18  3342  			continue;
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3343  		}
4591ce4f2d22dc9 Mel Gorman              2013-10-07  3344  
ef6a22b70f6d904 Mel Gorman              2023-03-01  3345  		/* Initialise new per-VMA NUMAB state. */
ef6a22b70f6d904 Mel Gorman              2023-03-01  3346  		if (!vma->numab_state) {
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3347  			struct vma_numab_state *ptr;
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3348  
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3349  			ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3350  			if (!ptr)
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3351  				continue;
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3352  
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3353  			if (cmpxchg(&vma->numab_state, NULL, ptr)) {
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3354  				kfree(ptr);
ef6a22b70f6d904 Mel Gorman              2023-03-01  3355  				continue;
8f149bcc4d91ac9 Adrian Huang            2024-11-13  3356  			}
ef6a22b70f6d904 Mel Gorman              2023-03-01  3357  
41f65469c33f09b Raghavendra K T         2023-10-20  3358  			vma->numab_state->start_scan_seq = mm->numa_scan_seq;
41f65469c33f09b Raghavendra K T         2023-10-20  3359  
ef6a22b70f6d904 Mel Gorman              2023-03-01  3360  			vma->numab_state->next_scan = now +
ef6a22b70f6d904 Mel Gorman              2023-03-01  3361  				msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
20f586486b87dcf Raghavendra K T         2023-03-01  3362  
20f586486b87dcf Raghavendra K T         2023-03-01  3363  			/* Reset happens after 4 times scan delay of scan start */
707e9a6c880f82d Mel Gorman              2023-10-10  3364  			vma->numab_state->pids_active_reset =  vma->numab_state->next_scan +
20f586486b87dcf Raghavendra K T         2023-03-01  3365  				msecs_to_jiffies(VMA_PID_RESET_PERIOD);
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3366  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3367  			/*
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3368  			 * Ensure prev_scan_seq does not match numa_scan_seq,
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3369  			 * to prevent VMAs being skipped prematurely on the
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3370  			 * first scan:
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3371  			 */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3372  			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
ef6a22b70f6d904 Mel Gorman              2023-03-01  3373  		}
ef6a22b70f6d904 Mel Gorman              2023-03-01  3374  
ef6a22b70f6d904 Mel Gorman              2023-03-01  3375  		/*
ef6a22b70f6d904 Mel Gorman              2023-03-01  3376  		 * Scanning the VMA's of short lived tasks add more overhead. So
ef6a22b70f6d904 Mel Gorman              2023-03-01  3377  		 * delay the scan for new VMAs.
ef6a22b70f6d904 Mel Gorman              2023-03-01  3378  		 */
ef6a22b70f6d904 Mel Gorman              2023-03-01  3379  		if (mm->numa_scan_seq && time_before(jiffies,
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3380  						vma->numab_state->next_scan)) {
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3381  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SCAN_DELAY);
ef6a22b70f6d904 Mel Gorman              2023-03-01  3382  			continue;
6654e54ae7e7cb2 Mel Gorman              2023-10-10  3383  		}
ef6a22b70f6d904 Mel Gorman              2023-03-01  3384  
7f01977665d7009 Raghavendra K T         2023-10-10  3385  		/* RESET access PIDs regularly for old VMAs. */
20f586486b87dcf Raghavendra K T         2023-03-01  3386  		if (mm->numa_scan_seq &&
707e9a6c880f82d Mel Gorman              2023-10-10  3387  				time_after(jiffies, vma->numab_state->pids_active_reset)) {
707e9a6c880f82d Mel Gorman              2023-10-10  3388  			vma->numab_state->pids_active_reset = vma->numab_state->pids_active_reset +
20f586486b87dcf Raghavendra K T         2023-03-01  3389  				msecs_to_jiffies(VMA_PID_RESET_PERIOD);
707e9a6c880f82d Mel Gorman              2023-10-10  3390  			vma->numab_state->pids_active[0] = READ_ONCE(vma->numab_state->pids_active[1]);
707e9a6c880f82d Mel Gorman              2023-10-10  3391  			vma->numab_state->pids_active[1] = 0;
20f586486b87dcf Raghavendra K T         2023-03-01  3392  		}
20f586486b87dcf Raghavendra K T         2023-03-01  3393  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3394  		/* Do not rescan VMAs twice within the same sequence. */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3395  		if (vma->numab_state->prev_scan_seq == mm->numa_scan_seq) {
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3396  			mm->numa_scan_offset = vma->vm_end;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3397  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SEQ_COMPLETED);
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3398  			continue;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3399  		}
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3400  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3401  		/*
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3402  		 * Do not scan the VMA if task has not accessed it, unless no other
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3403  		 * VMA candidate exists.
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3404  		 */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3405  		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3406  			vma_pids_skipped = true;
7f01977665d7009 Raghavendra K T         2023-10-10  3407  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
7f01977665d7009 Raghavendra K T         2023-10-10  3408  			continue;
7f01977665d7009 Raghavendra K T         2023-10-10  3409  		}
7f01977665d7009 Raghavendra K T         2023-10-10  3410  
9f40604cdab935e Mel Gorman              2012-11-14  3411  		do {
9f40604cdab935e Mel Gorman              2012-11-14  3412  			start = max(start, vma->vm_start);
9f40604cdab935e Mel Gorman              2012-11-14  3413  			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
9f40604cdab935e Mel Gorman              2012-11-14  3414  			end = min(end, vma->vm_end);
4620f8c1fda2af4 Rik van Riel            2015-09-11  3415  			nr_pte_updates = change_prot_numa(vma, start, end);
598f0ec0bc996e9 Mel Gorman              2013-10-07  3416  
598f0ec0bc996e9 Mel Gorman              2013-10-07  3417  			/*
4620f8c1fda2af4 Rik van Riel            2015-09-11  3418  			 * Try to scan sysctl_numa_balancing_size worth of
4620f8c1fda2af4 Rik van Riel            2015-09-11  3419  			 * hpages that have at least one present PTE that
4620f8c1fda2af4 Rik van Riel            2015-09-11  3420  			 * is not already pte-numa. If the VMA contains
4620f8c1fda2af4 Rik van Riel            2015-09-11  3421  			 * areas that are unused or already full of prot_numa
4620f8c1fda2af4 Rik van Riel            2015-09-11  3422  			 * PTEs, scan up to virtpages, to skip through those
4620f8c1fda2af4 Rik van Riel            2015-09-11  3423  			 * areas faster.
598f0ec0bc996e9 Mel Gorman              2013-10-07  3424  			 */
598f0ec0bc996e9 Mel Gorman              2013-10-07  3425  			if (nr_pte_updates)
598f0ec0bc996e9 Mel Gorman              2013-10-07  3426  				pages -= (end - start) >> PAGE_SHIFT;
4620f8c1fda2af4 Rik van Riel            2015-09-11  3427  			virtpages -= (end - start) >> PAGE_SHIFT;
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3428  
9f40604cdab935e Mel Gorman              2012-11-14  3429  			start = end;
4620f8c1fda2af4 Rik van Riel            2015-09-11  3430  			if (pages <= 0 || virtpages <= 0)
9f40604cdab935e Mel Gorman              2012-11-14  3431  				goto out;
3cf1962cdbf6b3a Rik van Riel            2014-02-18  3432  
3cf1962cdbf6b3a Rik van Riel            2014-02-18  3433  			cond_resched();
9f40604cdab935e Mel Gorman              2012-11-14  3434  		} while (end != vma->vm_end);
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3435  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3436  		/* VMA scan is complete, do not scan until next sequence. */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3437  		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3438  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3439  		/*
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3440  		 * Only force scan within one VMA at a time, to limit the
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3441  		 * cost of scanning a potentially uninteresting VMA.
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3442  		 */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3443  		if (vma_pids_forced)
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3444  			break;
ade91f6e9848b37 Shawn Wang              2024-10-25  3445  	}
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3446  
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3447  	/*
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3448  	 * If no VMAs are remaining and VMAs were skipped due to the PID
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3449  	 * not accessing the VMA previously, then force a scan to ensure
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3450  	 * forward progress:
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3451  	 */
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3452  	if (!vma && !vma_pids_forced && vma_pids_skipped) {
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3453  		vma_pids_forced = true;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3454  		goto retry_pids;
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3455  	}
e3a2d3f6c40e749 Mel Gorman              2023-10-10  3456  
9f40604cdab935e Mel Gorman              2012-11-14  3457  out:
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3458  	/*
c69307d533d7aa7 Peter Zijlstra          2013-10-07  3459  	 * It is possible to reach the end of the VMA list but the last few
c69307d533d7aa7 Peter Zijlstra          2013-10-07  3460  	 * VMAs are not guaranteed to the vma_migratable. If they are not, we
c69307d533d7aa7 Peter Zijlstra          2013-10-07  3461  	 * would find the !migratable VMA on the next scan but not reset the
c69307d533d7aa7 Peter Zijlstra          2013-10-07  3462  	 * scanner to the start so check it now.
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3463  	 */
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3464  	if (vma)
9f40604cdab935e Mel Gorman              2012-11-14  3465  		mm->numa_scan_offset = start;
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3466  	else
6e5fb223e89dbe5 Peter Zijlstra          2012-10-25  3467  		reset_ptenuma_scan(p);
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  3468  	mmap_read_unlock(mm);
51170840fe91dfc Rik van Riel            2015-11-05  3469  
51170840fe91dfc Rik van Riel            2015-11-05  3470  	/*
51170840fe91dfc Rik van Riel            2015-11-05  3471  	 * Make sure tasks use at least 32x as much time to run other code
51170840fe91dfc Rik van Riel            2015-11-05  3472  	 * than they used here, to limit NUMA PTE scanning overhead to 3% max.
51170840fe91dfc Rik van Riel            2015-11-05  3473  	 * Usually update_task_scan_period slows down scanning enough; on an
51170840fe91dfc Rik van Riel            2015-11-05  3474  	 * overloaded system we need to limit overhead on a per task basis.
51170840fe91dfc Rik van Riel            2015-11-05  3475  	 */
51170840fe91dfc Rik van Riel            2015-11-05  3476  	if (unlikely(p->se.sum_exec_runtime != runtime)) {
51170840fe91dfc Rik van Riel            2015-11-05  3477  		u64 diff = p->se.sum_exec_runtime - runtime;
51170840fe91dfc Rik van Riel            2015-11-05 @3478  		p->node_stamp += 32 * diff;
51170840fe91dfc Rik van Riel            2015-11-05  3479  	}
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3480  }
cbee9f88ec1b8dd Peter Zijlstra          2012-10-25  3481  

:::::: The code at line 3478 was first introduced by commit
:::::: 51170840fe91dfca10fd533b303ea39b2524782a sched/numa: Cap PTE scanning overhead to 3% of run time

:::::: TO: Rik van Riel <riel@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
