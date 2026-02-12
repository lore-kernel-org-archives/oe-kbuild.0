Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030420299B
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770917411; cv=none; b=k9HALw0mpnXC1R/ryNSABg2IFlhZGvcF12xTOBjoqN0vLabMWMYdRlpT4tAEWi6rQyJwHJLUaIlELBjE05/7/NUKUbLQo/L4mWCkI0hgcUAl/ULDPMqNlsz7l0QNdi79o5NZAyM9fGk4d5/g6lbmJvanPcrXoJkYflTzoCijHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770917411; c=relaxed/simple;
	bh=q+UH+930Bltu8Db6ia1MSIQcqsY+FWcwpL2fcMJOVVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FkyKZMyZoTq0S9HlVxXCVIhMZWbUIyxkR7YzPVEptADIhIeB0e5BGVMd9yw5qfz0tzrAUhrlUiEhZut2nnDr9/AsQ8nJrG5Xm6fhD3hPJm4LjIf0g6JD9t9B29o3lfnfpiN1HjkQch4Mi8CtJI1V8wANqw8folU4zb9DBT7M4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQh97RkS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQh97RkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770917408; x=1802453408;
  h=date:from:to:cc:subject:message-id;
  bh=q+UH+930Bltu8Db6ia1MSIQcqsY+FWcwpL2fcMJOVVQ=;
  b=mQh97RkSnryoqDTBB6tykmgDihbi7ZVwYXxs6elCnqGwtRpWBbtOH02I
   uf4ZJ8Mc9NKhT6PcaCFIFOaCu2bKEj8vfoYClO0tLqti0KoHy3fLVBKnI
   LFRir09fHbtGQyqkDVi24b/2aeI0I03Z9yMtEUx3/CMUfloSFUzINfNuQ
   2TMqrJ2k8azn0nU72klk+HGxSz3oYLwEvW0RkIsYq2z7IWuWfwHMuwByb
   uGKtdgXCnm/rjjzYwmlRJDzCp/5d9Lti78Hufr2Nl0a+hRt2kHJV5oot4
   IW1ABftygGB/Wq2sR98YAylOhtiDYKhqI1K29//jM3PGH1MqQZ1G8OF6d
   w==;
X-CSE-ConnectionGUID: G+uXRxrSRXSxgSejc3iaxA==
X-CSE-MsgGUID: K2Wq4ZS3SlqRxQSSh7eaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71124764"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="71124764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 09:30:07 -0800
X-CSE-ConnectionGUID: py7JEw9kR9CvRPrFYA/TcQ==
X-CSE-MsgGUID: KesoraMvSISTCFgnVI+u7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="243258879"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Feb 2026 09:30:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqaVv-00000000rwv-1kQF;
	Thu, 12 Feb 2026 17:30:03 +0000
Date: Fri, 13 Feb 2026 01:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12566/12577]
 kernel/locking/lockdep.c:5260:(.text+0x28be): dangerous relocation: call0:
 call target out of range: dump_stack
Message-ID: <202602130127.GN1oOuBC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Jiang <dave.jiang@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af98e93c5c39e6d0b87b42f0a32dd3066f795718
commit: 62bded8facda26a6e26fbcd4537502ccad2001b1 [12566/12577] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
:::::: branch date: 3 hours ago
:::::: commit date: 28 hours ago
config: xtensa-randconfig-r062-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130127.GN1oOuBC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130127.GN1oOuBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602130127.GN1oOuBC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.o: in function `__lock_acquire':
>> kernel/locking/lockdep.c:5260:(.text+0x28be): dangerous relocation: call0: call target out of range: dump_stack


vim +5260 kernel/locking/lockdep.c

d094595078d00b6 kernel/lockdep.c         Maarten Lankhorst         2012-09-13  5068  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5069  /*
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5070   * This gets called for every mutex_lock*()/spin_lock*() operation.
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5071   * We maintain the dependency maps and validate the locking attempt:
8ee10862476ef8b kernel/locking/lockdep.c Waiman Long               2018-10-02  5072   *
8ee10862476ef8b kernel/locking/lockdep.c Waiman Long               2018-10-02  5073   * The callers must make sure that IRQs are disabled before calling it,
8ee10862476ef8b kernel/locking/lockdep.c Waiman Long               2018-10-02  5074   * otherwise we could get an interrupt which would want to take locks,
8ee10862476ef8b kernel/locking/lockdep.c Waiman Long               2018-10-02  5075   * which would end up in lockdep again.
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5076   */
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5077  static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5078  			  int trylock, int read, int check, int hardirqs_off,
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5079  			  struct lockdep_map *nest_lock, unsigned long ip,
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5080  			  int references, int pin_count, int sync)
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5081  {
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5082  	struct task_struct *curr = current;
d6d897cec29252b kernel/lockdep.c         Ingo Molnar               2006-07-10  5083  	struct lock_class *class = NULL;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5084  	struct held_lock *hlock;
5f18ab5c6bdba73 kernel/locking/lockdep.c Alfredo Alvarez Fernandez 2016-02-11  5085  	unsigned int depth;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5086  	int chain_head = 0;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5087  	int class_idx;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5088  	u64 chain_key;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5089  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5090  	if (unlikely(!debug_locks))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5091  		return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5092  
1a616c2fe96b357 kernel/locking/lockdep.c Kent Overstreet           2023-12-21  5093  	if (unlikely(lock->key == &__lockdep_no_track__))
1a616c2fe96b357 kernel/locking/lockdep.c Kent Overstreet           2023-12-21  5094  		return 0;
1a616c2fe96b357 kernel/locking/lockdep.c Kent Overstreet           2023-12-21  5095  
a94d32446ab5e85 kernel/locking/lockdep.c Waiman Long               2025-03-07  5096  	lockevent_inc(lockdep_acquire);
a94d32446ab5e85 kernel/locking/lockdep.c Waiman Long               2025-03-07  5097  
a94d32446ab5e85 kernel/locking/lockdep.c Waiman Long               2025-03-07  5098  	if (!prove_locking || lock->key == &__lockdep_no_validate__) {
fb9edbe98493fcd kernel/locking/lockdep.c Oleg Nesterov             2014-01-20  5099  		check = 0;
a94d32446ab5e85 kernel/locking/lockdep.c Waiman Long               2025-03-07  5100  		lockevent_inc(lockdep_nocheck);
a94d32446ab5e85 kernel/locking/lockdep.c Waiman Long               2025-03-07  5101  	}
1704f47b50b5d9e kernel/lockdep.c         Peter Zijlstra            2010-03-19  5102  
6a1a219f535a437 kernel/locking/lockdep.c Waiman Long               2025-05-05  5103  	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
6a1a219f535a437 kernel/locking/lockdep.c Waiman Long               2025-05-05  5104  		return 0;
6a1a219f535a437 kernel/locking/lockdep.c Waiman Long               2025-05-05  5105  
620162505e5d46b kernel/lockdep.c         Hitoshi Mitake            2010-10-05  5106  	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
620162505e5d46b kernel/lockdep.c         Hitoshi Mitake            2010-10-05  5107  		class = lock->class_cache[subclass];
d6d897cec29252b kernel/lockdep.c         Ingo Molnar               2006-07-10  5108  	/*
620162505e5d46b kernel/lockdep.c         Hitoshi Mitake            2010-10-05  5109  	 * Not cached?
d6d897cec29252b kernel/lockdep.c         Ingo Molnar               2006-07-10  5110  	 */
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5111  	if (unlikely(!class)) {
4dfbb9d8c6cbfc3 kernel/lockdep.c         Peter Zijlstra            2006-10-11  5112  		class = register_lock_class(lock, subclass, 0);
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5113  		if (!class)
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5114  			return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5115  	}
8ca2b56cd7da98f kernel/locking/lockdep.c Waiman Long               2018-10-03  5116  
8ca2b56cd7da98f kernel/locking/lockdep.c Waiman Long               2018-10-03  5117  	debug_class_ops_inc(class);
8ca2b56cd7da98f kernel/locking/lockdep.c Waiman Long               2018-10-03  5118  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5119  	if (very_verbose(class)) {
59cd94ef8009485 kernel/locking/lockdep.c John Ogness               2024-08-20  5120  		nbcon_cpu_emergency_enter();
04860d48a8aba5b kernel/locking/lockdep.c Borislav Petkov           2018-02-26  5121  		printk("\nacquire class [%px] %s", class->key, class->name);
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5122  		if (class->name_version > 1)
f943fe0faf27991 kernel/locking/lockdep.c Dmitry Vyukov             2016-11-28  5123  			printk(KERN_CONT "#%d", class->name_version);
f943fe0faf27991 kernel/locking/lockdep.c Dmitry Vyukov             2016-11-28  5124  		printk(KERN_CONT "\n");
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5125  		dump_stack();
59cd94ef8009485 kernel/locking/lockdep.c John Ogness               2024-08-20  5126  		nbcon_cpu_emergency_exit();
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5127  	}
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5128  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5129  	/*
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5130  	 * Add the lock to the list of currently held locks.
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5131  	 * (we dont increase the depth just yet, up until the
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5132  	 * dependency checks are done)
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5133  	 */
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5134  	depth = curr->lockdep_depth;
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5135  	/*
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5136  	 * Ran out of static storage for our per-task lock stack again have we?
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5137  	 */
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5138  	if (DEBUG_LOCKS_WARN_ON(depth >= MAX_LOCK_DEPTH))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5139  		return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5140  
01bb6f0af992a1e kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5141  	class_idx = class - lock_classes;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5142  
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5143  	if (depth && !sync) {
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5144  		/* we're holding locks and the new held lock is not a sync */
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5145  		hlock = curr->held_locks + depth - 1;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5146  		if (hlock->class_idx == class_idx && nest_lock) {
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5147  			if (!references)
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5148  				references++;
7fb4a2cea6b18da kernel/locking/lockdep.c Peter Zijlstra            2017-03-01  5149  
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5150  			if (!hlock->references)
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5151  				hlock->references++;
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5152  
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5153  			hlock->references += references;
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5154  
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5155  			/* Overflow */
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5156  			if (DEBUG_LOCKS_WARN_ON(hlock->references < references))
d9349850e188b8b kernel/locking/lockdep.c Imre Deak                 2019-05-24  5157  				return 0;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5158  
8c8889d8eaf4501 kernel/locking/lockdep.c Imre Deak                 2019-05-24  5159  			return 2;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5160  		}
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5161  	}
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5162  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5163  	hlock = curr->held_locks + depth;
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5164  	/*
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5165  	 * Plain impossible, we just registered it and checked it weren't no
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5166  	 * NULL like.. I bet this mushroom I ate was good!
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5167  	 */
f82b217e3513fe3 kernel/lockdep.c         Dave Jones                2008-08-11  5168  	if (DEBUG_LOCKS_WARN_ON(!class))
f82b217e3513fe3 kernel/lockdep.c         Dave Jones                2008-08-11  5169  		return 0;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5170  	hlock->class_idx = class_idx;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5171  	hlock->acquire_ip = ip;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5172  	hlock->instance = lock;
7531e2f34d1d551 kernel/lockdep.c         Peter Zijlstra            2008-08-11  5173  	hlock->nest_lock = nest_lock;
c24697566298df0 kernel/locking/lockdep.c Boqun Feng                2016-02-16  5174  	hlock->irq_context = task_irq_context(curr);
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5175  	hlock->trylock = trylock;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5176  	hlock->read = read;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5177  	hlock->check = check;
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5178  	hlock->sync = !!sync;
6951b12a0fe7fc6 kernel/lockdep.c         Dmitry Baryshkov          2008-08-18  5179  	hlock->hardirqs_off = !!hardirqs_off;
bb97a91e2549a7f kernel/lockdep.c         Peter Zijlstra            2009-07-20  5180  	hlock->references = references;
f20786ff4da51e5 kernel/lockdep.c         Peter Zijlstra            2007-07-19  5181  #ifdef CONFIG_LOCK_STAT
f20786ff4da51e5 kernel/lockdep.c         Peter Zijlstra            2007-07-19  5182  	hlock->waittime_stamp = 0;
3365e7798760dc6 kernel/lockdep.c         Peter Zijlstra            2009-10-09  5183  	hlock->holdtime_stamp = lockstat_clock();
f20786ff4da51e5 kernel/lockdep.c         Peter Zijlstra            2007-07-19  5184  #endif
21199f27b430576 kernel/locking/lockdep.c Peter Zijlstra            2015-09-16  5185  	hlock->pin_count = pin_count;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5186  
de8f5e4f2dc1f03 kernel/locking/lockdep.c Peter Zijlstra            2020-03-21  5187  	if (check_wait_context(curr, hlock))
de8f5e4f2dc1f03 kernel/locking/lockdep.c Peter Zijlstra            2020-03-21  5188  		return 0;
de8f5e4f2dc1f03 kernel/locking/lockdep.c Peter Zijlstra            2020-03-21  5189  
091806515124b20 kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5190  	/* Initialize the lock usage bit */
091806515124b20 kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5191  	if (!mark_usage(curr, hlock, check))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5192  		return 0;
8e18257d2923831 kernel/lockdep.c         Peter Zijlstra            2007-07-19  5193  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5194  	/*
17aacfb9cdf9a83 kernel/lockdep.c         Gautham R Shenoy          2007-10-28  5195  	 * Calculate the chain hash: it's the combined hash of all the
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5196  	 * lock keys along the dependency chain. We save the hash value
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5197  	 * at every step so that we can get the current hash easily
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5198  	 * after unlock. The chain hash is then used to cache dependency
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5199  	 * results.
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5200  	 *
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5201  	 * The 'key ID' is what is the most compact key value to drive
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5202  	 * the hash, not class->key.
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5203  	 */
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5204  	/*
01bb6f0af992a1e kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5205  	 * Whoops, we did it again.. class_idx is invalid.
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5206  	 */
01bb6f0af992a1e kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5207  	if (DEBUG_LOCKS_WARN_ON(!test_bit(class_idx, lock_classes_in_use)))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5208  		return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5209  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5210  	chain_key = curr->curr_chain_key;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5211  	if (!depth) {
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5212  		/*
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5213  		 * How can we have a chain hash when we ain't got no keys?!
0119fee449f501d kernel/lockdep.c         Peter Zijlstra            2011-09-02  5214  		 */
f6ec8829ac9d59b kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5215  		if (DEBUG_LOCKS_WARN_ON(chain_key != INITIAL_CHAIN_KEY))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5216  			return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5217  		chain_head = 1;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5218  	}
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5219  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5220  	hlock->prev_chain_key = chain_key;
8e18257d2923831 kernel/lockdep.c         Peter Zijlstra            2007-07-19  5221  	if (separate_irq_context(curr, hlock)) {
f6ec8829ac9d59b kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5222  		chain_key = INITIAL_CHAIN_KEY;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5223  		chain_head = 1;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5224  	}
f611e8cf98ec908 kernel/locking/lockdep.c Boqun Feng                2020-08-07  5225  	chain_key = iterate_chain_key(chain_key, hlock_id(hlock));
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5226  
f7c1c6b36a3874d kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5227  	if (nest_lock && !__lock_is_held(nest_lock, -1)) {
8b023accc8df70e kernel/locking/lockdep.c Nick Desaulniers          2022-03-14  5228  		print_lock_nested_lock_not_held(curr, hlock);
f7c1c6b36a3874d kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5229  		return 0;
f7c1c6b36a3874d kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5230  	}
d094595078d00b6 kernel/lockdep.c         Maarten Lankhorst         2012-09-13  5231  
a0b0fd53e1e6763 kernel/locking/lockdep.c Bart Van Assche           2019-02-14  5232  	if (!debug_locks_silent) {
a0b0fd53e1e6763 kernel/locking/lockdep.c Bart Van Assche           2019-02-14  5233  		WARN_ON_ONCE(depth && !hlock_class(hlock - 1)->key);
a0b0fd53e1e6763 kernel/locking/lockdep.c Bart Van Assche           2019-02-14  5234  		WARN_ON_ONCE(!hlock_class(hlock)->key);
a0b0fd53e1e6763 kernel/locking/lockdep.c Bart Van Assche           2019-02-14  5235  	}
a0b0fd53e1e6763 kernel/locking/lockdep.c Bart Van Assche           2019-02-14  5236  
0b9fc8ecfa30000 kernel/locking/lockdep.c Yuyang Du                 2019-05-06  5237  	if (!validate_chain(curr, hlock, chain_head, chain_key))
381a229209aa6f7 kernel/lockdep.c         Jarek Poplawski           2007-02-10  5238  		return 0;
381a229209aa6f7 kernel/lockdep.c         Jarek Poplawski           2007-02-10  5239  
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5240  	/* For lock_sync(), we are done here since no actual critical section */
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5241  	if (hlock->sync)
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5242  		return 1;
0471db447cb7de5 kernel/locking/lockdep.c Boqun Feng                2023-01-13  5243  
3aa416b07f0adf0 kernel/lockdep.c         Gregory Haskins           2007-10-11  5244  	curr->curr_chain_key = chain_key;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5245  	curr->lockdep_depth++;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5246  	check_chain_key(curr);
60e114d1134555d kernel/lockdep.c         Jarek Poplawski           2007-02-20  5247  #ifdef CONFIG_DEBUG_LOCKDEP
60e114d1134555d kernel/lockdep.c         Jarek Poplawski           2007-02-20  5248  	if (unlikely(!debug_locks))
60e114d1134555d kernel/lockdep.c         Jarek Poplawski           2007-02-20  5249  		return 0;
60e114d1134555d kernel/lockdep.c         Jarek Poplawski           2007-02-20  5250  #endif
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5251  	if (unlikely(curr->lockdep_depth >= MAX_LOCK_DEPTH)) {
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5252  		debug_locks_off();
59cd94ef8009485 kernel/locking/lockdep.c John Ogness               2024-08-20  5253  		nbcon_cpu_emergency_enter();
2c522836627c6e7 kernel/lockdep.c         Dave Jones                2013-04-25  5254  		print_lockdep_off("BUG: MAX_LOCK_DEPTH too low!");
2c522836627c6e7 kernel/lockdep.c         Dave Jones                2013-04-25  5255  		printk(KERN_DEBUG "depth: %i  max: %lu!\n",
c0540606837af79 kernel/lockdep.c         Ben Greear                2013-02-06  5256  		       curr->lockdep_depth, MAX_LOCK_DEPTH);
c0540606837af79 kernel/lockdep.c         Ben Greear                2013-02-06  5257  
c0540606837af79 kernel/lockdep.c         Ben Greear                2013-02-06  5258  		lockdep_print_held_locks(current);
c0540606837af79 kernel/lockdep.c         Ben Greear                2013-02-06  5259  		debug_show_all_locks();
eedeeabdeeadb01 kernel/lockdep.c         Peter Zijlstra            2009-03-18 @5260  		dump_stack();
59cd94ef8009485 kernel/locking/lockdep.c John Ogness               2024-08-20  5261  		nbcon_cpu_emergency_exit();
c0540606837af79 kernel/lockdep.c         Ben Greear                2013-02-06  5262  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5263  		return 0;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5264  	}
381a229209aa6f7 kernel/lockdep.c         Jarek Poplawski           2007-02-10  5265  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5266  	if (unlikely(curr->lockdep_depth > max_lockdep_depth))
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5267  		max_lockdep_depth = curr->lockdep_depth;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5268  
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5269  	return 1;
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5270  }
fbb9ce9530fd9b6 kernel/lockdep.c         Ingo Molnar               2006-07-03  5271  

:::::: The code at line 5260 was first introduced by commit
:::::: eedeeabdeeadb016b8c783e3620d06b98d0cb4e1 lockdep: add stack dumps to asserts

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
