Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36F395AD5
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652774; cv=none; b=FeNN9N90vy6QOP0HM6am+cQ+yHi2P5wrgkCWuI9yD+cL0wHKvczPfvyAOIY9G1g14OL+HSBwHO58b+0eaa7R06pCXkoVxhK46c5IxRTLffGN56ONFeSQAbmN4GKw8bJIt+W4quaKkl5NpIezLNKKn7hztpFXQ4MHhUBcgXr5wUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652774; c=relaxed/simple;
	bh=yZ/Gm029HszPuK2/xCY8NJQnyc1ng2aeZipBUa3Kdqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uD9V23+8M0Hysa7PHSXoB2c8VwKEXNbef/M3TCGGaR22+Zemc40Ktm8SXKsk0b/+K0QveqTPtxFnMH5lL62jTQG2LQQF0KMTeWhW4HDi/6atvloF+M8GtitYeNG2h0QKlSpAWCiPQzZzuD/doFnYkofojbStMobsbhQsWEaArrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIo4enWl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIo4enWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778652773; x=1810188773;
  h=date:from:to:cc:subject:message-id;
  bh=yZ/Gm029HszPuK2/xCY8NJQnyc1ng2aeZipBUa3Kdqc=;
  b=JIo4enWleSvNlQoOVxtyRbFa0+5Cqn07eQInj6OykfxzvNK47pIWCUlw
   +n+MMEKz5M2MOwGOzUWUoXsEELBPPuCsEabSOwyuSiYl6UlZQNhv0qR2o
   yo/k1pZ8oGVBHRCVzAZF1PdnhMTkB3EM0ncQJxiLmcLV12SDYXtpTq9Pr
   HNIXfBAG4u/dPKwuqKZIQxlllpTjNzaszKzFsZ0J9ymDVfA4cczgKTrhq
   CUZ2pGRh2DQQG3+i+3oSYH43GloZXREjoYSPgXIO6AOMxGU3IEtfzbmi6
   Aa5Y4yEn7mnHYv3VnjJth5wte076ue/LNcfqUXeG9aSUf4iJmF+Fpa6Ft
   A==;
X-CSE-ConnectionGUID: bUZMw+xaR+WtDG9rPfAQUQ==
X-CSE-MsgGUID: sPfSiTkISzG0IAcRLegD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90152013"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90152013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:12:52 -0700
X-CSE-ConnectionGUID: Uo1Kix0dQHqZCNqZOgVCng==
X-CSE-MsgGUID: jEjvL2JQQjqw3St+0dGTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="234928668"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 23:12:51 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN2ps-000000003Yf-2aHR;
	Wed, 13 May 2026 06:12:48 +0000
Date: Wed, 13 May 2026 14:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mempolicy.c:3382:9: error: implicit declaration of
 function 'hq_configure_spin_lock_slowpath'; did you mean
 'queued_spin_lock_slowpath'?
Message-ID: <202605131447.Gwz3K6X1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260513-062924/Fedorov-Nikita/hq-spinlock-implement-inner-logic/20260418-141252, commit: d534acd6cbebb27ee2ce661910ba0bd1e38e50a9"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fedorov Nikita <fedorov.nikita@h-partners.com>
CC: 0day robot <lkp@intel.com>
CC: Anatoly Stepanov <stepanov.anatoly@huawei.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260513-062924/Fedorov-Nikita/hq-spinlock-implement-inner-logic/20260418-141252
head:   b49343668dcd262fe41660ec9a9c47917d81fea4
commit: d534acd6cbebb27ee2ce661910ba0bd1e38e50a9 kernel: introduce general hq-spinlock support
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: loongarch-randconfig-r073-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131447.Gwz3K6X1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131447.Gwz3K6X1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605131447.Gwz3K6X1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'numa_policy_init':
>> mm/mempolicy.c:3382:9: error: implicit declaration of function 'hq_configure_spin_lock_slowpath'; did you mean 'queued_spin_lock_slowpath'? [-Wimplicit-function-declaration]
    3382 |         hq_configure_spin_lock_slowpath();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         queued_spin_lock_slowpath
--
>> kernel/locking/qspinlock.c:104:41: warning: no previous prototype for 'native_queued_spin_lock_slowpath' [-Wmissing-prototypes]
     104 | #define queued_spin_lock_slowpath       native_queued_spin_lock_slowpath
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/qspinlock.c:130:17: note: in expansion of macro 'queued_spin_lock_slowpath'
     130 | void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/qspinlock.c:423:
   kernel/locking/hqlock_core.h: In function 'handoff_remote':
   kernel/locking/hqlock_core.h:658:24: warning: variable 'node_tail' set but not used [-Wunused-but-set-variable]
     658 |         u16 node_head, node_tail;
         |                        ^~~~~~~~~
   kernel/locking/hqlock_core.h: At top level:
>> kernel/locking/hqlock_core.h:835:13: warning: no previous prototype for 'hq_configure_spin_lock_slowpath' [-Wmissing-prototypes]
     835 | void __init hq_configure_spin_lock_slowpath(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3382 mm/mempolicy.c

1a687c2e9a9933 Mel Gorman        2012-11-22  3328  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3329  void __init numa_policy_init(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3330  {
b71636e29823c0 Paul Mundt        2007-07-15  3331  	nodemask_t interleave_nodes;
b71636e29823c0 Paul Mundt        2007-07-15  3332  	unsigned long largest = 0;
b71636e29823c0 Paul Mundt        2007-07-15  3333  	int nid, prefer = 0;
b71636e29823c0 Paul Mundt        2007-07-15  3334  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3335  	policy_cache = kmem_cache_create("numa_policy",
^1da177e4c3f41 Linus Torvalds    2005-04-16  3336  					 sizeof(struct mempolicy),
20c2df83d25c6a Paul Mundt        2007-07-20  3337  					 0, SLAB_PANIC, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3338  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3339  	sn_cache = kmem_cache_create("shared_policy_node",
^1da177e4c3f41 Linus Torvalds    2005-04-16  3340  				     sizeof(struct sp_node),
20c2df83d25c6a Paul Mundt        2007-07-20  3341  				     0, SLAB_PANIC, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3342  
5606e3877ad8ba Mel Gorman        2012-11-02  3343  	for_each_node(nid) {
5606e3877ad8ba Mel Gorman        2012-11-02  3344  		preferred_node_policy[nid] = (struct mempolicy) {
5606e3877ad8ba Mel Gorman        2012-11-02  3345  			.refcnt = ATOMIC_INIT(1),
5606e3877ad8ba Mel Gorman        2012-11-02  3346  			.mode = MPOL_PREFERRED,
5606e3877ad8ba Mel Gorman        2012-11-02  3347  			.flags = MPOL_F_MOF | MPOL_F_MORON,
269fbe72cded0a Ben Widawsky      2021-06-30  3348  			.nodes = nodemask_of_node(nid),
5606e3877ad8ba Mel Gorman        2012-11-02  3349  		};
5606e3877ad8ba Mel Gorman        2012-11-02  3350  	}
5606e3877ad8ba Mel Gorman        2012-11-02  3351  
b71636e29823c0 Paul Mundt        2007-07-15  3352  	/*
b71636e29823c0 Paul Mundt        2007-07-15  3353  	 * Set interleaving policy for system init. Interleaving is only
b71636e29823c0 Paul Mundt        2007-07-15  3354  	 * enabled across suitably sized nodes (default is >= 16MB), or
b71636e29823c0 Paul Mundt        2007-07-15  3355  	 * fall back to the largest node if they're all smaller.
b71636e29823c0 Paul Mundt        2007-07-15  3356  	 */
b71636e29823c0 Paul Mundt        2007-07-15  3357  	nodes_clear(interleave_nodes);
01f13bd607346a Lai Jiangshan     2012-12-12  3358  	for_each_node_state(nid, N_MEMORY) {
b71636e29823c0 Paul Mundt        2007-07-15  3359  		unsigned long total_pages = node_present_pages(nid);
b71636e29823c0 Paul Mundt        2007-07-15  3360  
b71636e29823c0 Paul Mundt        2007-07-15  3361  		/* Preserve the largest node */
b71636e29823c0 Paul Mundt        2007-07-15  3362  		if (largest < total_pages) {
b71636e29823c0 Paul Mundt        2007-07-15  3363  			largest = total_pages;
b71636e29823c0 Paul Mundt        2007-07-15  3364  			prefer = nid;
b71636e29823c0 Paul Mundt        2007-07-15  3365  		}
b71636e29823c0 Paul Mundt        2007-07-15  3366  
b71636e29823c0 Paul Mundt        2007-07-15  3367  		/* Interleave this node? */
b71636e29823c0 Paul Mundt        2007-07-15  3368  		if ((total_pages << PAGE_SHIFT) >= (16 << 20))
b71636e29823c0 Paul Mundt        2007-07-15  3369  			node_set(nid, interleave_nodes);
b71636e29823c0 Paul Mundt        2007-07-15  3370  	}
b71636e29823c0 Paul Mundt        2007-07-15  3371  
b71636e29823c0 Paul Mundt        2007-07-15  3372  	/* All too small, use the largest */
b71636e29823c0 Paul Mundt        2007-07-15  3373  	if (unlikely(nodes_empty(interleave_nodes)))
b71636e29823c0 Paul Mundt        2007-07-15  3374  		node_set(prefer, interleave_nodes);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3375  
028fec414d8031 David Rientjes    2008-04-28  3376  	if (do_set_mempolicy(MPOL_INTERLEAVE, 0, &interleave_nodes))
b1de0d139c97a6 Mitchel Humpherys 2014-06-06  3377  		pr_err("%s: interleaving failed\n", __func__);
1a687c2e9a9933 Mel Gorman        2012-11-22  3378  
1a687c2e9a9933 Mel Gorman        2012-11-22  3379  	check_numabalancing_enable();
d534acd6cbebb2 Fedorov Nikita    2026-04-16  3380  
d534acd6cbebb2 Fedorov Nikita    2026-04-16  3381  #ifdef CONFIG_HQSPINLOCKS
d534acd6cbebb2 Fedorov Nikita    2026-04-16 @3382  	hq_configure_spin_lock_slowpath();
d534acd6cbebb2 Fedorov Nikita    2026-04-16  3383  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  3384  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3385  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
