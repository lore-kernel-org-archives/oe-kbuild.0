Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FC24DD09
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750989; cv=none; b=r8Fuab5nLCG7rAi1dXtixZjpP/6tRbDWV8cGmCBEnNbRSAS6S8zHd0gmggRFTMMCrDZpz9+EjVRiHLw2NeB/LnWyF4MLoY5l5JsbNmtVD3bGtDh7yQNPA5uLcUbhbJvSliGIzS1TLm57cN2QrFclXeGCFOIPF1DIR7vKzlhrkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750989; c=relaxed/simple;
	bh=kNBxwckzo9ALPo/Jt88UwUNHp/Lmp5jNY+3F+OYW2FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAy2rmngq0XNH7KpST44Hm9Mj9bDABtonOxOSy1aWW4m+PmEDyogl/oo2bQv+0YAQhHQRcRijIpepfQra6/0AyKvzIQ1TJdCEQfeuKtI4lOfpxVnYu3usValY5mTtfzfuYyPcWD3Qe5SAuzOLwYsmYuSTpJj/PSoB8wlPhZuC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1vMGxyb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1vMGxyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764750987; x=1796286987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNBxwckzo9ALPo/Jt88UwUNHp/Lmp5jNY+3F+OYW2FM=;
  b=n1vMGxybiFrwSHEZy4XDJtYXCaVB7ZzZLut6Hnh9eCuiBxmoD7g8yl9j
   3CpM/6o/PWKBrXzI7FPEXlWdA5Sfq+Zag9GGIEZVK6p52v/t3+pG3Bzc/
   NKabGIDtqVbgaJOOknLrtAdMF+XoKgLWhTgznuAvrGiy91DPCF6vweYqB
   f+Vamp3G/dyVPwwzFwoXyGXVPXtGi5X4Aj+wSJzhGtmh2FO0BNlGLq6/2
   djynQoR5Ci0mB/xIUkMX0rkZ7AUKVN1j6WwsossBf1KRL+rhIFyr+LBrH
   JklhpQnIDnGsgF6yTcVHvifxLWXFd3O7AVKc47bar3jZuWugI4uNZz2Xu
   w==;
X-CSE-ConnectionGUID: tZVPNP+cRdG5qy+QaZ3opQ==
X-CSE-MsgGUID: Wr3vOArkTo6QDH6I83XgXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77056830"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77056830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:36:27 -0800
X-CSE-ConnectionGUID: peoR46WNRC2wUFtNymsQ5g==
X-CSE-MsgGUID: CgrwNY1lRTGa+KKDPoCACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194842263"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 00:36:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQiLW-00000000AlT-3ufF;
	Wed, 03 Dec 2025 08:36:22 +0000
Date: Wed, 3 Dec 2025 16:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tj-sched-ext:scx-sub-sched-prototype 49/99]
 kernel/bpf/bpf_struct_ops.c:1477:65: error: implicit declaration of function
 'bpf_rcu_lock_held'; did you mean 'rcu_read_lock_held'?
Message-ID: <202512031625.HjO9aNHu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amery Hung <ameryhung@gmail.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-prototype
head:   93d5a72c3150d61036a2bbc86f63bdf9c17726f5
commit: 1bbeaff20b6bb44d9abc8d0a10b354f7bb7f8ec6 [49/99] bpf: Support associating BPF program with struct_ops
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512031625.HjO9aNHu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031625.HjO9aNHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031625.HjO9aNHu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/workqueue.h:17,
                    from ./include/linux/bpf.h:11,
                    from kernel/bpf/bpf_struct_ops.c:4:
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_prog_get_assoc_struct_ops':
>> kernel/bpf/bpf_struct_ops.c:1477:65: error: implicit declaration of function 'bpf_rcu_lock_held'; did you mean 'rcu_read_lock_held'? [-Wimplicit-function-declaration]
    1477 |         st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
         |                                                                 ^~~~~~~~~~~~~~~~~
   ./include/linux/rcupdate.h:399:53: note: in definition of macro 'RCU_LOCKDEP_WARN'
     399 |                 if (debug_lockdep_rcu_enabled() && (c) &&               \
         |                                                     ^
   ./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c:1477:24: note: in expansion of macro 'rcu_dereference_check'
    1477 |         st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
         |                        ^~~~~~~~~~~~~~~~~~~~~


vim +1477 kernel/bpf/bpf_struct_ops.c

1bbeaff20b6bb4 Amery Hung 2025-11-14  1462  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1463  /*
1bbeaff20b6bb4 Amery Hung 2025-11-14  1464   * Get a reference to the struct_ops struct (i.e., kdata) associated with a
1bbeaff20b6bb4 Amery Hung 2025-11-14  1465   * program. Should only be called in BPF program context (e.g., in a kfunc).
1bbeaff20b6bb4 Amery Hung 2025-11-14  1466   *
1bbeaff20b6bb4 Amery Hung 2025-11-14  1467   * If the returned pointer is not NULL, it must points to a valid and
1bbeaff20b6bb4 Amery Hung 2025-11-14  1468   * initialized struct_ops. The struct_ops may or may not be attached.
1bbeaff20b6bb4 Amery Hung 2025-11-14  1469   * Kernel struct_ops implementers are responsible for tracking and checking
1bbeaff20b6bb4 Amery Hung 2025-11-14  1470   * the state of the struct_ops if the use case requires an attached struct_ops.
1bbeaff20b6bb4 Amery Hung 2025-11-14  1471   */
1bbeaff20b6bb4 Amery Hung 2025-11-14  1472  void *bpf_prog_get_assoc_struct_ops(const struct bpf_prog_aux *aux)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1473  {
1bbeaff20b6bb4 Amery Hung 2025-11-14  1474  	struct bpf_struct_ops_map *st_map;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1475  	struct bpf_map *st_ops_assoc;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1476  
1bbeaff20b6bb4 Amery Hung 2025-11-14 @1477  	st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
1bbeaff20b6bb4 Amery Hung 2025-11-14  1478  	if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1479  		return NULL;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1480  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1481  	st_map = (struct bpf_struct_ops_map *)st_ops_assoc;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1482  	if (smp_load_acquire(&st_map->kvalue.common.state) == BPF_STRUCT_OPS_STATE_INIT)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1483  		return NULL;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1484  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1485  	return &st_map->kvalue.data;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1486  }
1bbeaff20b6bb4 Amery Hung 2025-11-14  1487  EXPORT_SYMBOL_GPL(bpf_prog_get_assoc_struct_ops);
1bbeaff20b6bb4 Amery Hung 2025-11-14  1488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
