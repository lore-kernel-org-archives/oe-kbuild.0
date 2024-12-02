Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F11F940D
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733124124; cv=none; b=kkmKxjGNlGxtdh03JheUkw8dcCXxN3N3l+rdYyN5aUernXUM1TG6Gpi4OlabRB+yjIqMvqRUQO1+QBqZp/LoqSKIkhKf4722PbBQuGGBYIZEbdF4GEtwuz5HL6LDeUD77fbzzjljF+g4uA2FGxLtfwS/Klv7zyhK8LtZHDH69Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733124124; c=relaxed/simple;
	bh=tWP+koni+qofXH+LUA88yCi96uwr7ku3PQe8AJPugtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3h411MgFgAptS4V1OJK0SI0YsEM7NRzQXRG5p4+xlFgfWciZobOnxaN7iVB7ydx4nzZWJeooy2aOG1n2Z0LDChPxyhw3Dalc9PXCFF992/h4sjBsqYWM/QnwA2T2/EFedTXsiHfivw+cvbDA36VdH1cJJeXSqGn4vbdA/R1Fuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ss2TM7YG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ss2TM7YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733124120; x=1764660120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tWP+koni+qofXH+LUA88yCi96uwr7ku3PQe8AJPugtw=;
  b=Ss2TM7YG3dOEFb10OEDb6msiiEpuZYxax3l9YWcDknok2+xYZGHVtCcO
   MNR00tx5zHDmuKSfmR/Uu4b/QA2eJob/5RDJUhcnyHD0CTZaeu1XlNf4I
   C4kQLdM0VMtajTjYTMADzKTYEulT4aB7u/3Wn/KjFDwgRv6TbhbBKu0Yu
   VRBApz8VhedrwuSmaXHuM8KkyP0M7s4rbWphPEfwwXFjaS3sNPGf4OBO4
   V0yiqFpU/FU2AgZTVgtFkJ1yeoLdPrPXQRhTZys0QSD1GN72zfUWVXkN+
   OIDTI0nClK7OBKrq+9Z9ETljO1ntz5FBlYdjz5IOKmYKETiYCrktifA8e
   A==;
X-CSE-ConnectionGUID: z2m38uq9TKuJmfGVfNITaA==
X-CSE-MsgGUID: pDD/9A/jSfCgesWG5zz67w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33408529"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33408529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 23:21:58 -0800
X-CSE-ConnectionGUID: u3HrQpw2SP2HBegvTgkMjg==
X-CSE-MsgGUID: +im85R7HRwGX8WPhwvEa7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97789316"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 23:21:56 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI0kk-0002AT-1F;
	Mon, 02 Dec 2024 07:21:54 +0000
Date: Mon, 2 Dec 2024 15:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 32/94] kernel/sched/fair.c:3413
 task_numa_work() error: we previously assumed 'vma->numab_state' could be
 null (see line 3401)
Message-ID: <202412021547.ublDYeiP-lkp@intel.com>
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
TO: Adrian Huang <ahuang12@lenovo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Raghavendra K T <raghavendra.kt@amd.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   33b4a29038b3551e1044430b0d810f69bf1858ee
commit: 7869f9b6648b13dbf3a438115debe57845067479 [32/94] sched/numa: fix memory leak due to the overwritten vma->numab_state
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021547.ublDYeiP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412021547.ublDYeiP-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:3413 task_numa_work() error: we previously assumed 'vma->numab_state' could be null (see line 3401)

vim +3413 kernel/sched/fair.c

20f586486b87dc Raghavendra K T         2023-03-01  3284  
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3285  /*
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3286   * The expensive part of numa migration is done from task_work context.
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3287   * Triggered from task_tick_numa().
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3288   */
9434f9f5d11730 Valentin Schneider      2019-07-15  3289  static void task_numa_work(struct callback_head *work)
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3290  {
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3291  	unsigned long migrate, next_scan, now = jiffies;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3292  	struct task_struct *p = current;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3293  	struct mm_struct *mm = p->mm;
51170840fe91df Rik van Riel            2015-11-05  3294  	u64 runtime = p->se.sum_exec_runtime;
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3295  	struct vm_area_struct *vma;
9f40604cdab935 Mel Gorman              2012-11-14  3296  	unsigned long start, end;
598f0ec0bc996e Mel Gorman              2013-10-07  3297  	unsigned long nr_pte_updates = 0;
4620f8c1fda2af Rik van Riel            2015-09-11  3298  	long pages, virtpages;
214dbc4281374c Liam R. Howlett         2023-01-20  3299  	struct vma_iterator vmi;
f169c62ff7cd1a Mel Gorman              2023-10-10  3300  	bool vma_pids_skipped;
f169c62ff7cd1a Mel Gorman              2023-10-10  3301  	bool vma_pids_forced = false;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3302  
9148a3a10e0b74 Peter Zijlstra          2016-09-20  3303  	SCHED_WARN_ON(p != container_of(work, struct task_struct, numa_work));
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3304  
b34920d4ce6e6f Valentin Schneider      2019-07-15  3305  	work->next = work;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3306  	/*
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3307  	 * Who cares about NUMA placement when they're dying.
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3308  	 *
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3309  	 * NOTE: make sure not to dereference p->mm before this check,
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3310  	 * exit_task_work() happens _after_ exit_mm() so we could be called
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3311  	 * without p->mm even though we still had it when we enqueued this
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3312  	 * work.
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3313  	 */
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3314  	if (p->flags & PF_EXITING)
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3315  		return;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3316  
930aa174fcc8b0 Mel Gorman              2013-10-07  3317  	if (!mm->numa_next_scan) {
7e8d16b6cbccb2 Mel Gorman              2013-10-07  3318  		mm->numa_next_scan = now +
7e8d16b6cbccb2 Mel Gorman              2013-10-07  3319  			msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
b8593bfda16527 Mel Gorman              2012-11-21  3320  	}
b8593bfda16527 Mel Gorman              2012-11-21  3321  
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3322  	/*
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3323  	 * Enforce maximal scan/migration frequency..
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3324  	 */
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3325  	migrate = mm->numa_next_scan;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3326  	if (time_before(now, migrate))
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3327  		return;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3328  
598f0ec0bc996e Mel Gorman              2013-10-07  3329  	if (p->numa_scan_period == 0) {
598f0ec0bc996e Mel Gorman              2013-10-07  3330  		p->numa_scan_period_max = task_scan_max(p);
b5dd77c8bdada7 Rik van Riel            2017-07-31  3331  		p->numa_scan_period = task_scan_start(p);
598f0ec0bc996e Mel Gorman              2013-10-07  3332  	}
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3333  
fb003b80daa0de Mel Gorman              2012-11-15  3334  	next_scan = now + msecs_to_jiffies(p->numa_scan_period);
8baceabca656d5 Uros Bizjak             2022-08-22  3335  	if (!try_cmpxchg(&mm->numa_next_scan, &migrate, next_scan))
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3336  		return;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3337  
19a78d110d7a80 Peter Zijlstra          2013-10-07  3338  	/*
19a78d110d7a80 Peter Zijlstra          2013-10-07  3339  	 * Delay this task enough that another task of this mm will likely win
19a78d110d7a80 Peter Zijlstra          2013-10-07  3340  	 * the next time around.
19a78d110d7a80 Peter Zijlstra          2013-10-07  3341  	 */
19a78d110d7a80 Peter Zijlstra          2013-10-07  3342  	p->node_stamp += 2 * TICK_NSEC;
19a78d110d7a80 Peter Zijlstra          2013-10-07  3343  
9f40604cdab935 Mel Gorman              2012-11-14  3344  	pages = sysctl_numa_balancing_scan_size;
9f40604cdab935 Mel Gorman              2012-11-14  3345  	pages <<= 20 - PAGE_SHIFT; /* MB in pages */
4620f8c1fda2af Rik van Riel            2015-09-11  3346  	virtpages = pages * 8;	   /* Scan up to this much virtual space */
9f40604cdab935 Mel Gorman              2012-11-14  3347  	if (!pages)
9f40604cdab935 Mel Gorman              2012-11-14  3348  		return;
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3349  
4620f8c1fda2af Rik van Riel            2015-09-11  3350  
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  3351  	if (!mmap_read_trylock(mm))
8655d5497735b2 Vlastimil Babka         2017-05-15  3352  		return;
f169c62ff7cd1a Mel Gorman              2023-10-10  3353  
f169c62ff7cd1a Mel Gorman              2023-10-10  3354  	/*
f169c62ff7cd1a Mel Gorman              2023-10-10  3355  	 * VMAs are skipped if the current PID has not trapped a fault within
f169c62ff7cd1a Mel Gorman              2023-10-10  3356  	 * the VMA recently. Allow scanning to be forced if there is no
f169c62ff7cd1a Mel Gorman              2023-10-10  3357  	 * suitable VMA remaining.
f169c62ff7cd1a Mel Gorman              2023-10-10  3358  	 */
f169c62ff7cd1a Mel Gorman              2023-10-10  3359  	vma_pids_skipped = false;
f169c62ff7cd1a Mel Gorman              2023-10-10  3360  
f169c62ff7cd1a Mel Gorman              2023-10-10  3361  retry_pids:
f169c62ff7cd1a Mel Gorman              2023-10-10  3362  	start = mm->numa_scan_offset;
214dbc4281374c Liam R. Howlett         2023-01-20  3363  	vma_iter_init(&vmi, mm, start);
214dbc4281374c Liam R. Howlett         2023-01-20  3364  	vma = vma_next(&vmi);
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3365  	if (!vma) {
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3366  		reset_ptenuma_scan(p);
9f40604cdab935 Mel Gorman              2012-11-14  3367  		start = 0;
214dbc4281374c Liam R. Howlett         2023-01-20  3368  		vma_iter_set(&vmi, start);
214dbc4281374c Liam R. Howlett         2023-01-20  3369  		vma = vma_next(&vmi);
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3370  	}
0cd4d02c32123a Matthew Wilcox (Oracle  2022-09-06  3371) 
9c70b2a33cd2aa Shawn Wang              2024-10-25  3372  	for (; vma; vma = vma_next(&vmi)) {
6b79c57b92cdd9 Naoya Horiguchi         2015-04-07  3373  		if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
8e76d4eecf7afe Mel Gorman              2015-06-10  3374  			is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
ed2da8b725b932 Mel Gorman              2023-10-10  3375  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_UNSUITABLE);
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3376  			continue;
6b79c57b92cdd9 Naoya Horiguchi         2015-04-07  3377  		}
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3378  
4591ce4f2d22dc Mel Gorman              2013-10-07  3379  		/*
4591ce4f2d22dc Mel Gorman              2013-10-07  3380  		 * Shared library pages mapped by multiple processes are not
4591ce4f2d22dc Mel Gorman              2013-10-07  3381  		 * migrated as it is expected they are cache replicated. Avoid
b9e6e28663928c Ingo Molnar             2024-03-14  3382  		 * hinting faults in read-only file-backed mappings or the vDSO
4591ce4f2d22dc Mel Gorman              2013-10-07  3383  		 * as migrating the pages will be of marginal benefit.
4591ce4f2d22dc Mel Gorman              2013-10-07  3384  		 */
4591ce4f2d22dc Mel Gorman              2013-10-07  3385  		if (!vma->vm_mm ||
ed2da8b725b932 Mel Gorman              2023-10-10  3386  		    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ))) {
ed2da8b725b932 Mel Gorman              2023-10-10  3387  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
4591ce4f2d22dc Mel Gorman              2013-10-07  3388  			continue;
ed2da8b725b932 Mel Gorman              2023-10-10  3389  		}
4591ce4f2d22dc Mel Gorman              2013-10-07  3390  
3c67f474558748 Mel Gorman              2013-12-18  3391  		/*
3c67f474558748 Mel Gorman              2013-12-18  3392  		 * Skip inaccessible VMAs to avoid any confusion between
b9e6e28663928c Ingo Molnar             2024-03-14  3393  		 * PROT_NONE and NUMA hinting PTEs
3c67f474558748 Mel Gorman              2013-12-18  3394  		 */
ed2da8b725b932 Mel Gorman              2023-10-10  3395  		if (!vma_is_accessible(vma)) {
ed2da8b725b932 Mel Gorman              2023-10-10  3396  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_INACCESSIBLE);
3c67f474558748 Mel Gorman              2013-12-18  3397  			continue;
ed2da8b725b932 Mel Gorman              2023-10-10  3398  		}
4591ce4f2d22dc Mel Gorman              2013-10-07  3399  
ef6a22b70f6d90 Mel Gorman              2023-03-01  3400  		/* Initialise new per-VMA NUMAB state. */
ef6a22b70f6d90 Mel Gorman              2023-03-01 @3401  		if (!vma->numab_state) {
7869f9b6648b13 Adrian Huang            2024-11-13  3402  			struct vma_numab_state *ptr;
7869f9b6648b13 Adrian Huang            2024-11-13  3403  
7869f9b6648b13 Adrian Huang            2024-11-13  3404  			ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
7869f9b6648b13 Adrian Huang            2024-11-13  3405  			if (!ptr)
7869f9b6648b13 Adrian Huang            2024-11-13  3406  				continue;
7869f9b6648b13 Adrian Huang            2024-11-13  3407  
7869f9b6648b13 Adrian Huang            2024-11-13  3408  			if (cmpxchg(&vma->numab_state, NULL, ptr)) {
7869f9b6648b13 Adrian Huang            2024-11-13  3409  				kfree(ptr);
ef6a22b70f6d90 Mel Gorman              2023-03-01  3410  				continue;
7869f9b6648b13 Adrian Huang            2024-11-13  3411  			}
ef6a22b70f6d90 Mel Gorman              2023-03-01  3412  
84db47ca7146d7 Raghavendra K T         2023-10-20 @3413  			vma->numab_state->start_scan_seq = mm->numa_scan_seq;
84db47ca7146d7 Raghavendra K T         2023-10-20  3414  
ef6a22b70f6d90 Mel Gorman              2023-03-01  3415  			vma->numab_state->next_scan = now +
ef6a22b70f6d90 Mel Gorman              2023-03-01  3416  				msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
20f586486b87dc Raghavendra K T         2023-03-01  3417  
20f586486b87dc Raghavendra K T         2023-03-01  3418  			/* Reset happens after 4 times scan delay of scan start */
f3a6c97940fbd2 Mel Gorman              2023-10-10  3419  			vma->numab_state->pids_active_reset =  vma->numab_state->next_scan +
20f586486b87dc Raghavendra K T         2023-03-01  3420  				msecs_to_jiffies(VMA_PID_RESET_PERIOD);
f169c62ff7cd1a Mel Gorman              2023-10-10  3421  
f169c62ff7cd1a Mel Gorman              2023-10-10  3422  			/*
f169c62ff7cd1a Mel Gorman              2023-10-10  3423  			 * Ensure prev_scan_seq does not match numa_scan_seq,
f169c62ff7cd1a Mel Gorman              2023-10-10  3424  			 * to prevent VMAs being skipped prematurely on the
f169c62ff7cd1a Mel Gorman              2023-10-10  3425  			 * first scan:
f169c62ff7cd1a Mel Gorman              2023-10-10  3426  			 */
f169c62ff7cd1a Mel Gorman              2023-10-10  3427  			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
ef6a22b70f6d90 Mel Gorman              2023-03-01  3428  		}
ef6a22b70f6d90 Mel Gorman              2023-03-01  3429  
ef6a22b70f6d90 Mel Gorman              2023-03-01  3430  		/*
b9e6e28663928c Ingo Molnar             2024-03-14  3431  		 * Scanning the VMAs of short lived tasks add more overhead. So
ef6a22b70f6d90 Mel Gorman              2023-03-01  3432  		 * delay the scan for new VMAs.
ef6a22b70f6d90 Mel Gorman              2023-03-01  3433  		 */
ef6a22b70f6d90 Mel Gorman              2023-03-01  3434  		if (mm->numa_scan_seq && time_before(jiffies,
ed2da8b725b932 Mel Gorman              2023-10-10  3435  						vma->numab_state->next_scan)) {
ed2da8b725b932 Mel Gorman              2023-10-10  3436  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SCAN_DELAY);
ef6a22b70f6d90 Mel Gorman              2023-03-01  3437  			continue;
ed2da8b725b932 Mel Gorman              2023-10-10  3438  		}
ef6a22b70f6d90 Mel Gorman              2023-03-01  3439  
2e2675db1906ac Raghavendra K T         2023-10-10  3440  		/* RESET access PIDs regularly for old VMAs. */
20f586486b87dc Raghavendra K T         2023-03-01  3441  		if (mm->numa_scan_seq &&
f3a6c97940fbd2 Mel Gorman              2023-10-10  3442  				time_after(jiffies, vma->numab_state->pids_active_reset)) {
f3a6c97940fbd2 Mel Gorman              2023-10-10  3443  			vma->numab_state->pids_active_reset = vma->numab_state->pids_active_reset +
20f586486b87dc Raghavendra K T         2023-03-01  3444  				msecs_to_jiffies(VMA_PID_RESET_PERIOD);
f3a6c97940fbd2 Mel Gorman              2023-10-10  3445  			vma->numab_state->pids_active[0] = READ_ONCE(vma->numab_state->pids_active[1]);
f3a6c97940fbd2 Mel Gorman              2023-10-10  3446  			vma->numab_state->pids_active[1] = 0;
20f586486b87dc Raghavendra K T         2023-03-01  3447  		}
20f586486b87dc Raghavendra K T         2023-03-01  3448  
f169c62ff7cd1a Mel Gorman              2023-10-10  3449  		/* Do not rescan VMAs twice within the same sequence. */
f169c62ff7cd1a Mel Gorman              2023-10-10  3450  		if (vma->numab_state->prev_scan_seq == mm->numa_scan_seq) {
f169c62ff7cd1a Mel Gorman              2023-10-10  3451  			mm->numa_scan_offset = vma->vm_end;
f169c62ff7cd1a Mel Gorman              2023-10-10  3452  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SEQ_COMPLETED);
f169c62ff7cd1a Mel Gorman              2023-10-10  3453  			continue;
f169c62ff7cd1a Mel Gorman              2023-10-10  3454  		}
f169c62ff7cd1a Mel Gorman              2023-10-10  3455  
f169c62ff7cd1a Mel Gorman              2023-10-10  3456  		/*
f169c62ff7cd1a Mel Gorman              2023-10-10  3457  		 * Do not scan the VMA if task has not accessed it, unless no other
f169c62ff7cd1a Mel Gorman              2023-10-10  3458  		 * VMA candidate exists.
f169c62ff7cd1a Mel Gorman              2023-10-10  3459  		 */
f169c62ff7cd1a Mel Gorman              2023-10-10  3460  		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
f169c62ff7cd1a Mel Gorman              2023-10-10  3461  			vma_pids_skipped = true;
2e2675db1906ac Raghavendra K T         2023-10-10  3462  			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
2e2675db1906ac Raghavendra K T         2023-10-10  3463  			continue;
2e2675db1906ac Raghavendra K T         2023-10-10  3464  		}
2e2675db1906ac Raghavendra K T         2023-10-10  3465  
9f40604cdab935 Mel Gorman              2012-11-14  3466  		do {
9f40604cdab935 Mel Gorman              2012-11-14  3467  			start = max(start, vma->vm_start);
9f40604cdab935 Mel Gorman              2012-11-14  3468  			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
9f40604cdab935 Mel Gorman              2012-11-14  3469  			end = min(end, vma->vm_end);
4620f8c1fda2af Rik van Riel            2015-09-11  3470  			nr_pte_updates = change_prot_numa(vma, start, end);
598f0ec0bc996e Mel Gorman              2013-10-07  3471  
598f0ec0bc996e Mel Gorman              2013-10-07  3472  			/*
4620f8c1fda2af Rik van Riel            2015-09-11  3473  			 * Try to scan sysctl_numa_balancing_size worth of
4620f8c1fda2af Rik van Riel            2015-09-11  3474  			 * hpages that have at least one present PTE that
b9e6e28663928c Ingo Molnar             2024-03-14  3475  			 * is not already PTE-numa. If the VMA contains
4620f8c1fda2af Rik van Riel            2015-09-11  3476  			 * areas that are unused or already full of prot_numa
4620f8c1fda2af Rik van Riel            2015-09-11  3477  			 * PTEs, scan up to virtpages, to skip through those
4620f8c1fda2af Rik van Riel            2015-09-11  3478  			 * areas faster.
598f0ec0bc996e Mel Gorman              2013-10-07  3479  			 */
598f0ec0bc996e Mel Gorman              2013-10-07  3480  			if (nr_pte_updates)
598f0ec0bc996e Mel Gorman              2013-10-07  3481  				pages -= (end - start) >> PAGE_SHIFT;
4620f8c1fda2af Rik van Riel            2015-09-11  3482  			virtpages -= (end - start) >> PAGE_SHIFT;
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3483  
9f40604cdab935 Mel Gorman              2012-11-14  3484  			start = end;
4620f8c1fda2af Rik van Riel            2015-09-11  3485  			if (pages <= 0 || virtpages <= 0)
9f40604cdab935 Mel Gorman              2012-11-14  3486  				goto out;
3cf1962cdbf6b3 Rik van Riel            2014-02-18  3487  
3cf1962cdbf6b3 Rik van Riel            2014-02-18  3488  			cond_resched();
9f40604cdab935 Mel Gorman              2012-11-14  3489  		} while (end != vma->vm_end);
f169c62ff7cd1a Mel Gorman              2023-10-10  3490  
f169c62ff7cd1a Mel Gorman              2023-10-10  3491  		/* VMA scan is complete, do not scan until next sequence. */
f169c62ff7cd1a Mel Gorman              2023-10-10  3492  		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
f169c62ff7cd1a Mel Gorman              2023-10-10  3493  
f169c62ff7cd1a Mel Gorman              2023-10-10  3494  		/*
f169c62ff7cd1a Mel Gorman              2023-10-10  3495  		 * Only force scan within one VMA at a time, to limit the
f169c62ff7cd1a Mel Gorman              2023-10-10  3496  		 * cost of scanning a potentially uninteresting VMA.
f169c62ff7cd1a Mel Gorman              2023-10-10  3497  		 */
f169c62ff7cd1a Mel Gorman              2023-10-10  3498  		if (vma_pids_forced)
f169c62ff7cd1a Mel Gorman              2023-10-10  3499  			break;
9c70b2a33cd2aa Shawn Wang              2024-10-25  3500  	}
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3501  
f169c62ff7cd1a Mel Gorman              2023-10-10  3502  	/*
f169c62ff7cd1a Mel Gorman              2023-10-10  3503  	 * If no VMAs are remaining and VMAs were skipped due to the PID
f169c62ff7cd1a Mel Gorman              2023-10-10  3504  	 * not accessing the VMA previously, then force a scan to ensure
f169c62ff7cd1a Mel Gorman              2023-10-10  3505  	 * forward progress:
f169c62ff7cd1a Mel Gorman              2023-10-10  3506  	 */
f169c62ff7cd1a Mel Gorman              2023-10-10  3507  	if (!vma && !vma_pids_forced && vma_pids_skipped) {
f169c62ff7cd1a Mel Gorman              2023-10-10  3508  		vma_pids_forced = true;
f169c62ff7cd1a Mel Gorman              2023-10-10  3509  		goto retry_pids;
f169c62ff7cd1a Mel Gorman              2023-10-10  3510  	}
f169c62ff7cd1a Mel Gorman              2023-10-10  3511  
9f40604cdab935 Mel Gorman              2012-11-14  3512  out:
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3513  	/*
c69307d533d7aa Peter Zijlstra          2013-10-07  3514  	 * It is possible to reach the end of the VMA list but the last few
c69307d533d7aa Peter Zijlstra          2013-10-07  3515  	 * VMAs are not guaranteed to the vma_migratable. If they are not, we
c69307d533d7aa Peter Zijlstra          2013-10-07  3516  	 * would find the !migratable VMA on the next scan but not reset the
c69307d533d7aa Peter Zijlstra          2013-10-07  3517  	 * scanner to the start so check it now.
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3518  	 */
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3519  	if (vma)
9f40604cdab935 Mel Gorman              2012-11-14  3520  		mm->numa_scan_offset = start;
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3521  	else
6e5fb223e89dbe Peter Zijlstra          2012-10-25  3522  		reset_ptenuma_scan(p);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  3523  	mmap_read_unlock(mm);
51170840fe91df Rik van Riel            2015-11-05  3524  
51170840fe91df Rik van Riel            2015-11-05  3525  	/*
51170840fe91df Rik van Riel            2015-11-05  3526  	 * Make sure tasks use at least 32x as much time to run other code
51170840fe91df Rik van Riel            2015-11-05  3527  	 * than they used here, to limit NUMA PTE scanning overhead to 3% max.
51170840fe91df Rik van Riel            2015-11-05  3528  	 * Usually update_task_scan_period slows down scanning enough; on an
51170840fe91df Rik van Riel            2015-11-05  3529  	 * overloaded system we need to limit overhead on a per task basis.
51170840fe91df Rik van Riel            2015-11-05  3530  	 */
51170840fe91df Rik van Riel            2015-11-05  3531  	if (unlikely(p->se.sum_exec_runtime != runtime)) {
51170840fe91df Rik van Riel            2015-11-05  3532  		u64 diff = p->se.sum_exec_runtime - runtime;
51170840fe91df Rik van Riel            2015-11-05  3533  		p->node_stamp += 32 * diff;
51170840fe91df Rik van Riel            2015-11-05  3534  	}
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3535  }
cbee9f88ec1b8d Peter Zijlstra          2012-10-25  3536  

:::::: The code at line 3413 was first introduced by commit
:::::: 84db47ca7146d7bd00eb5cf2b93989a971c84650 sched/numa: Fix mm numa_scan_seq based unconditional scan

:::::: TO: Raghavendra K T <raghavendra.kt@amd.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
