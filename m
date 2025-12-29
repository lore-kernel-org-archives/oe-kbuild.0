Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191E21FF33
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013977; cv=none; b=egMzrVjBtmkhvxcPFHYLqQ1MC6dhTarts9Gagx5uCNQv+IUyDsRSH+nYHk7mrfdic+4CJaIrl0sC3PZyJjZtHsSazhXj++FoLBZsX9w9x+wzYf8FCwCO6a8oeBelO0/Xf6xlLMsJppB1P3DE85RSTRkZvcNsAYscwEA/gGvoelw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013977; c=relaxed/simple;
	bh=+5MlPNVKQ6gbulFAqCIuCZC5X4g9JOhexUoIg7A/df8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G+gwML/ITXajwwlOYBSLQHPhxPcC2j9a0n6A293yXYRnWOAoODT1NkcssxQm3h0jDFHlP/cIlaNwYdc82+CbTdsLJqJMMFkVTX8g7TUjrSchZlEr0A7xJKYOrYAGkbTRX7HhdtxwzbolGJ4BBsFAxXeyiPD+n4Beq915uutkkuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4ro7+ln; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4ro7+ln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767013976; x=1798549976;
  h=date:from:to:cc:subject:message-id;
  bh=+5MlPNVKQ6gbulFAqCIuCZC5X4g9JOhexUoIg7A/df8=;
  b=S4ro7+lnSowiWEp2e/X2jSoP7U8Xv3y+4KnN/Ym9ocGNupLJMZkzSuRT
   S0HM9ETnLnXYIH8G1LbHHfo7v/NI3+Jb2lw5qerKKauJGW1qczE69cRic
   cOPo6o5nUMkLmLOlNmJxBndzDztW47bXZ1LpAzqb2HHqh7ElTbQSu3q1w
   Cj5M3aOhfBLxJBig55ThvCjMZwhtqoGj7Pk5mzTPL+qpBPulV5sve8tL3
   BuiGMSy4PXN/h0NnlDWGNMCgknuu0esBRM0uCEsideSkxicC5g5QC1Abe
   7Z3H/S+OI2F2r5zU7uxx/qVwZpOyRiUC0PH88tpLO7L+fqbzBDbwda11X
   w==;
X-CSE-ConnectionGUID: cwVjR6ZMSV63JdE5LCW2nw==
X-CSE-MsgGUID: dZ6WPMU7Q9e4q8CrUK/o0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="56193292"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="56193292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:12:55 -0800
X-CSE-ConnectionGUID: vFZYrvFqRjaP8UHrdpUuZg==
X-CSE-MsgGUID: pQcOx1aeRyOmw3sQehmJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205818785"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 05:12:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaD3L-000000007Ez-3fGm;
	Mon, 29 Dec 2025 13:12:51 +0000
Date: Mon, 29 Dec 2025 21:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chao:feature/lock_trace 1/12] fs/f2fs/checkpoint.c:80
 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.
Message-ID: <202512292145.pYzliixm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Chao Yu <chao@kernel.org>
TO: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   38316221f39afd9be305c1a9d7de368ac7d10a74
commit: c40d7d27f9806cf8ede8c91311f9431fa7df791b [1/12] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
:::::: branch date: 6 hours ago
:::::: commit date: 24 hours ago
config: microblaze-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251229/202512292145.pYzliixm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512292145.pYzliixm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512292145.pYzliixm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [fs/f2fs/f2fs.ko] undefined!

New smatch warnings:
fs/f2fs/checkpoint.c:80 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/running_time +80 fs/f2fs/checkpoint.c

c40d7d27f9806c Chao Yu 2025-12-16  50  
c40d7d27f9806c Chao Yu 2025-12-16  51  static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
c40d7d27f9806c Chao Yu 2025-12-16  52  				struct f2fs_lock_context *lc, bool is_write)
c40d7d27f9806c Chao Yu 2025-12-16  53  {
c40d7d27f9806c Chao Yu 2025-12-16  54  	struct f2fs_time_stat tts;
c40d7d27f9806c Chao Yu 2025-12-16  55  	unsigned long long total_time, running_time;
c40d7d27f9806c Chao Yu 2025-12-16  56  	unsigned long long runnable_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  57  	unsigned long long io_sleep_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  58  	unsigned long long other_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  59  
c40d7d27f9806c Chao Yu 2025-12-16  60  	if (!lc->lock_trace)
c40d7d27f9806c Chao Yu 2025-12-16  61  		return;
c40d7d27f9806c Chao Yu 2025-12-16  62  
c40d7d27f9806c Chao Yu 2025-12-16  63  	get_lock_elapsed_time(&tts);
c40d7d27f9806c Chao Yu 2025-12-16  64  
c40d7d27f9806c Chao Yu 2025-12-16  65  	total_time = (tts.total_time - lc->ts.total_time) / NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  66  	if (total_time <= MAX_LOCK_ELAPSED_TIME)
c40d7d27f9806c Chao Yu 2025-12-16  67  		return;
c40d7d27f9806c Chao Yu 2025-12-16  68  
c40d7d27f9806c Chao Yu 2025-12-16  69  #ifdef CONFIG_64BIT
c40d7d27f9806c Chao Yu 2025-12-16  70  	running_time = (tts.running_time - lc->ts.running_time) / NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  71  #endif
c40d7d27f9806c Chao Yu 2025-12-16  72  #if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
c40d7d27f9806c Chao Yu 2025-12-16  73  	runnable_time = (tts.runnable_time - lc->ts.runnable_time) /
c40d7d27f9806c Chao Yu 2025-12-16  74  							NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  75  #endif
c40d7d27f9806c Chao Yu 2025-12-16  76  #ifdef CONFIG_TASK_DELAY_ACCT
c40d7d27f9806c Chao Yu 2025-12-16  77  	io_sleep_time = (tts.io_sleep_time - lc->ts.io_sleep_time) /
c40d7d27f9806c Chao Yu 2025-12-16  78  							NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  79  #endif
c40d7d27f9806c Chao Yu 2025-12-16 @80  	if (total_time > running_time + io_sleep_time + runnable_time)
c40d7d27f9806c Chao Yu 2025-12-16  81  		other_time = total_time - running_time -
c40d7d27f9806c Chao Yu 2025-12-16  82  				io_sleep_time - runnable_time;
c40d7d27f9806c Chao Yu 2025-12-16  83  
c40d7d27f9806c Chao Yu 2025-12-16  84  	trace_f2fs_lock_elapsed_time(sem->sbi, sem->name, is_write, current,
c40d7d27f9806c Chao Yu 2025-12-16  85  			get_current_ioprio(), total_time, running_time,
c40d7d27f9806c Chao Yu 2025-12-16  86  			runnable_time, io_sleep_time, other_time);
c40d7d27f9806c Chao Yu 2025-12-16  87  }
c40d7d27f9806c Chao Yu 2025-12-16  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
