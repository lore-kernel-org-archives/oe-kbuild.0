Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84F364EBB
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829206; cv=none; b=mS7BXtVHm9eYVtg92Y80EHjOlLjSYn5sqUbFlsMI6cXW//mmyULsUklvPu0IArHGaddbCNrX5EHR36S1+GONKs7kgW/eHsVx/ZPWBrcpYycjmsvOSjzwod+nLVYA8CjSTsrt5GhxhFP2McoJkmhKF1OPAA0E2IREVPnebK3iVpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829206; c=relaxed/simple;
	bh=JzwNOMtnV5T0aANnuNixUinfl0Wo9Wytr+sSnd8ZzGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pDR4BZphbfDwmu7MuZUdz3V4KDspAWSPWJrIUNNwLVCcsEWkVxhKqnLd1CpyQWEOqbkxtskJf/Y7guf03s8iyC+N0Qc0eIPCL5b2rUdSzRvG4y2nqU0pEAvgB3CNkB5wBlMFO62ZEuqkchR0HRZPoUivicnw+eNaZrM0N6h+Psk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjVpU04W; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjVpU04W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768829203; x=1800365203;
  h=date:from:to:cc:subject:message-id;
  bh=JzwNOMtnV5T0aANnuNixUinfl0Wo9Wytr+sSnd8ZzGM=;
  b=JjVpU04Wp/gocGVfJJoD5tQ9EWndRbkXghpwb8e/zRsGr+d6ac7ZGe7p
   YHzy1+vRdDxHE003YkJC3Za5t44R4l4x/IIyQy8Uvz/kin0eN1GBPGJhp
   Ljt8xFOGsQUPiG2jvvMsODFMe3iID6LE1PQVAHeNygC1vTGL+l2zgTPN+
   2VWbaWGJSwM3yekyINw1YlSLIkXkThLW4Zdd4DJ+16sylOATV//wLCQ1D
   xFEWBCc7XcooSgNnlNNQbsYbNOSo5il3NjqtYLzxr8MMKqKWqWpLhNoFt
   EUdt63HvvE7BR5O6OByrFr2RuoFg/5Wei3zUt7bS96TGvjU8Pa9uw2rwi
   Q==;
X-CSE-ConnectionGUID: kBySrgLrTF2k3yKbihsVtQ==
X-CSE-MsgGUID: ibcsoSy/ShmVJBBpEk/Wzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73668557"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73668557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:26:43 -0800
X-CSE-ConnectionGUID: O6MRiifrR/m2KZ+DIOQhuA==
X-CSE-MsgGUID: BM05/5/ZRD6VdrAOyE5ztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205770562"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2026 05:26:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpHD-00000000NpZ-1WQC;
	Mon, 19 Jan 2026 13:26:39 +0000
Date: Mon, 19 Jan 2026 21:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-buf-hash 4/4] include/linux/lockdep.h:413:52:
 error: unknown type name 'lock_cmp_fn'
Message-ID: <202601192151.5A30xg27-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   9f73447f84e126bcdeaff55933254bf36fc33136
commit: 9f73447f84e126bcdeaff55933254bf36fc33136 [4/4] disable lockdep
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260119/202601192151.5A30xg27-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192151.5A30xg27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192151.5A30xg27-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/csky/kernel/asm-offsets.c:5:
>> include/linux/lockdep.h:413:52: error: unknown type name 'lock_cmp_fn'
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                    ^~~~~~~~~~~
>> include/linux/lockdep.h:413:65: error: unknown type name 'lock_print_fn'
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                                 ^~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12:
   include/linux/sched.h: In function 'set_need_resched_current':
>> include/linux/lockdep.h:573:34: error: 'debug_locks' undeclared (first use in this function)
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:582:9: note: in expansion of macro 'WARN_ON_ONCE'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2042:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:34: note: each undeclared identifier is reported only once for each function it appears in
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:582:9: note: in expansion of macro 'WARN_ON_ONCE'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2042:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:17,
                    from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/csky/kernel/asm-offsets.c:6:
   include/linux/seqlock.h: In function 'seqcount_lockdep_reader_access':
>> include/linux/seqlock.h:68:21: warning: unused variable 'l' [-Wunused-variable]
      68 |         seqcount_t *l = (seqcount_t *)s;
         |                     ^
   include/linux/srcu.h: In function 'srcu_lock_sync':
>> include/linux/lockdep.h:546:49: error: implicit declaration of function 'lock_sync'; did you mean 'lock_map_sync'? [-Wimplicit-function-declaration]
     546 | #define lock_map_sync(l)                        lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
         |                                                 ^~~~~~~~~
   include/linux/srcu.h:197:9: note: in expansion of macro 'lock_map_sync'
     197 |         lock_map_sync(map);
         |         ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/csky/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for DEBUG_LOCK_ALLOC
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_WW_MUTEX_SLOWPATH [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +/lock_cmp_fn +413 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar             2006-07-03  411  
eb1cfd09f788e3 Kent Overstreet         2023-05-09  412  #ifdef CONFIG_PROVE_LOCKING
eb1cfd09f788e3 Kent Overstreet         2023-05-09 @413  void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
eb1cfd09f788e3 Kent Overstreet         2023-05-09  414  
eb1cfd09f788e3 Kent Overstreet         2023-05-09  415  #define lock_set_cmp_fn(lock, ...)	lockdep_set_lock_cmp_fn(&(lock)->dep_map, __VA_ARGS__)
eb1cfd09f788e3 Kent Overstreet         2023-05-09  416  #else
eb1cfd09f788e3 Kent Overstreet         2023-05-09  417  #define lock_set_cmp_fn(lock, ...)	do { } while (0)
eb1cfd09f788e3 Kent Overstreet         2023-05-09  418  #endif
eb1cfd09f788e3 Kent Overstreet         2023-05-09  419  
b09be676e0ff25 Byungchul Park          2017-08-07  420  enum xhlock_context_t {
b09be676e0ff25 Byungchul Park          2017-08-07  421  	XHLOCK_HARD,
b09be676e0ff25 Byungchul Park          2017-08-07  422  	XHLOCK_SOFT,
b09be676e0ff25 Byungchul Park          2017-08-07  423  	XHLOCK_CTX_NR,
b09be676e0ff25 Byungchul Park          2017-08-07  424  };
b09be676e0ff25 Byungchul Park          2017-08-07  425  
b09be676e0ff25 Byungchul Park          2017-08-07  426  /*
b09be676e0ff25 Byungchul Park          2017-08-07  427   * To initialize a lockdep_map statically use this macro.
b09be676e0ff25 Byungchul Park          2017-08-07  428   * Note that _name must not be NULL.
b09be676e0ff25 Byungchul Park          2017-08-07  429   */
b09be676e0ff25 Byungchul Park          2017-08-07  430  #define STATIC_LOCKDEP_MAP_INIT(_name, _key) \
b09be676e0ff25 Byungchul Park          2017-08-07  431  	{ .name = (_name), .key = (void *)(_key), }
b09be676e0ff25 Byungchul Park          2017-08-07  432  
f52be5708076b7 Peter Zijlstra          2017-08-29  433  static inline void lockdep_invariant_state(bool force) {}
b09be676e0ff25 Byungchul Park          2017-08-07  434  static inline void lockdep_free_task(struct task_struct *task) {}
b09be676e0ff25 Byungchul Park          2017-08-07  435  
f20786ff4da51e Peter Zijlstra          2007-07-19  436  #ifdef CONFIG_LOCK_STAT
f20786ff4da51e Peter Zijlstra          2007-07-19  437  
f20786ff4da51e Peter Zijlstra          2007-07-19  438  extern void lock_contended(struct lockdep_map *lock, unsigned long ip);
c7e78cff6b7518 Peter Zijlstra          2008-10-16  439  extern void lock_acquired(struct lockdep_map *lock, unsigned long ip);
f20786ff4da51e Peter Zijlstra          2007-07-19  440  
f20786ff4da51e Peter Zijlstra          2007-07-19  441  #define LOCK_CONTENDED(_lock, try, lock)			\
f20786ff4da51e Peter Zijlstra          2007-07-19  442  do {								\
f20786ff4da51e Peter Zijlstra          2007-07-19  443  	if (!try(_lock)) {					\
f20786ff4da51e Peter Zijlstra          2007-07-19  444  		lock_contended(&(_lock)->dep_map, _RET_IP_);	\
f20786ff4da51e Peter Zijlstra          2007-07-19  445  		lock(_lock);					\
f20786ff4da51e Peter Zijlstra          2007-07-19  446  	}							\
c7e78cff6b7518 Peter Zijlstra          2008-10-16  447  	lock_acquired(&(_lock)->dep_map, _RET_IP_);			\
f20786ff4da51e Peter Zijlstra          2007-07-19  448  } while (0)
f20786ff4da51e Peter Zijlstra          2007-07-19  449  
916633a4037025 Michal Hocko            2016-04-07  450  #define LOCK_CONTENDED_RETURN(_lock, try, lock)			\
916633a4037025 Michal Hocko            2016-04-07  451  ({								\
916633a4037025 Michal Hocko            2016-04-07  452  	int ____err = 0;					\
916633a4037025 Michal Hocko            2016-04-07  453  	if (!try(_lock)) {					\
916633a4037025 Michal Hocko            2016-04-07  454  		lock_contended(&(_lock)->dep_map, _RET_IP_);	\
916633a4037025 Michal Hocko            2016-04-07  455  		____err = lock(_lock);				\
916633a4037025 Michal Hocko            2016-04-07  456  	}							\
916633a4037025 Michal Hocko            2016-04-07  457  	if (!____err)						\
916633a4037025 Michal Hocko            2016-04-07  458  		lock_acquired(&(_lock)->dep_map, _RET_IP_);	\
916633a4037025 Michal Hocko            2016-04-07  459  	____err;						\
916633a4037025 Michal Hocko            2016-04-07  460  })
916633a4037025 Michal Hocko            2016-04-07  461  
f20786ff4da51e Peter Zijlstra          2007-07-19  462  #else /* CONFIG_LOCK_STAT */
f20786ff4da51e Peter Zijlstra          2007-07-19  463  
f20786ff4da51e Peter Zijlstra          2007-07-19  464  #define lock_contended(lockdep_map, ip) do {} while (0)
c7e78cff6b7518 Peter Zijlstra          2008-10-16  465  #define lock_acquired(lockdep_map, ip) do {} while (0)
f20786ff4da51e Peter Zijlstra          2007-07-19  466  
f20786ff4da51e Peter Zijlstra          2007-07-19  467  #define LOCK_CONTENDED(_lock, try, lock) \
f20786ff4da51e Peter Zijlstra          2007-07-19  468  	lock(_lock)
f20786ff4da51e Peter Zijlstra          2007-07-19  469  
916633a4037025 Michal Hocko            2016-04-07  470  #define LOCK_CONTENDED_RETURN(_lock, try, lock) \
916633a4037025 Michal Hocko            2016-04-07  471  	lock(_lock)
916633a4037025 Michal Hocko            2016-04-07  472  
f20786ff4da51e Peter Zijlstra          2007-07-19  473  #endif /* CONFIG_LOCK_STAT */
f20786ff4da51e Peter Zijlstra          2007-07-19  474  
c3bc8fd637a962 Joel Fernandes (Google  2018-07-30  475) #ifdef CONFIG_PROVE_LOCKING
3117df0453828b Ingo Molnar             2006-12-13  476  extern void print_irqtrace_events(struct task_struct *curr);
fbb9ce9530fd9b Ingo Molnar             2006-07-03  477  #else
3117df0453828b Ingo Molnar             2006-12-13  478  static inline void print_irqtrace_events(struct task_struct *curr)
3117df0453828b Ingo Molnar             2006-12-13  479  {
3117df0453828b Ingo Molnar             2006-12-13  480  }
fbb9ce9530fd9b Ingo Molnar             2006-07-03  481  #endif
fbb9ce9530fd9b Ingo Molnar             2006-07-03  482  
e918188611f073 Boqun Feng              2020-08-07  483  /* Variable used to make lockdep treat read_lock() as recursive in selftests */
e918188611f073 Boqun Feng              2020-08-07  484  #ifdef CONFIG_DEBUG_LOCKING_API_SELFTESTS
e918188611f073 Boqun Feng              2020-08-07  485  extern unsigned int force_read_lock_recursive;
e918188611f073 Boqun Feng              2020-08-07  486  #else /* CONFIG_DEBUG_LOCKING_API_SELFTESTS */
e918188611f073 Boqun Feng              2020-08-07  487  #define force_read_lock_recursive 0
e918188611f073 Boqun Feng              2020-08-07  488  #endif /* CONFIG_DEBUG_LOCKING_API_SELFTESTS */
e918188611f073 Boqun Feng              2020-08-07  489  
e918188611f073 Boqun Feng              2020-08-07  490  #ifdef CONFIG_LOCKDEP
e918188611f073 Boqun Feng              2020-08-07  491  extern bool read_lock_is_recursive(void);
e918188611f073 Boqun Feng              2020-08-07  492  #else /* CONFIG_LOCKDEP */
e918188611f073 Boqun Feng              2020-08-07  493  /* If !LOCKDEP, the value is meaningless */
e918188611f073 Boqun Feng              2020-08-07  494  #define read_lock_is_recursive() 0
e918188611f073 Boqun Feng              2020-08-07  495  #endif
e918188611f073 Boqun Feng              2020-08-07  496  
fbb9ce9530fd9b Ingo Molnar             2006-07-03  497  /*
fbb9ce9530fd9b Ingo Molnar             2006-07-03  498   * For trivial one-depth nesting of a lock-class, the following
fbb9ce9530fd9b Ingo Molnar             2006-07-03  499   * global define can be used. (Subsystems with multiple levels
fbb9ce9530fd9b Ingo Molnar             2006-07-03  500   * of nesting should define their own lock-nesting subclasses.)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  501   */
fbb9ce9530fd9b Ingo Molnar             2006-07-03  502  #define SINGLE_DEPTH_NESTING			1
fbb9ce9530fd9b Ingo Molnar             2006-07-03  503  
fbb9ce9530fd9b Ingo Molnar             2006-07-03  504  /*
fbb9ce9530fd9b Ingo Molnar             2006-07-03  505   * Map the dependency ops to NOP or to real lockdep ops, depending
fbb9ce9530fd9b Ingo Molnar             2006-07-03  506   * on the per lock-class debug mode:
fbb9ce9530fd9b Ingo Molnar             2006-07-03  507   */
fbb9ce9530fd9b Ingo Molnar             2006-07-03  508  
a51805efae5dda Michel Lespinasse       2013-07-08  509  #define lock_acquire_exclusive(l, s, t, n, i)		lock_acquire(l, s, t, 0, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  510  #define lock_acquire_shared(l, s, t, n, i)		lock_acquire(l, s, t, 1, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  511  #define lock_acquire_shared_recursive(l, s, t, n, i)	lock_acquire(l, s, t, 2, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  512  
a51805efae5dda Michel Lespinasse       2013-07-08  513  #define spin_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  514  #define spin_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
5facae4f3549b5 Qian Cai                2019-09-19  515  #define spin_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  516  
a51805efae5dda Michel Lespinasse       2013-07-08  517  #define rwlock_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
e918188611f073 Boqun Feng              2020-08-07  518  #define rwlock_acquire_read(l, s, t, i)					\
e918188611f073 Boqun Feng              2020-08-07  519  do {									\
e918188611f073 Boqun Feng              2020-08-07  520  	if (read_lock_is_recursive())					\
e918188611f073 Boqun Feng              2020-08-07  521  		lock_acquire_shared_recursive(l, s, t, NULL, i);	\
e918188611f073 Boqun Feng              2020-08-07  522  	else								\
e918188611f073 Boqun Feng              2020-08-07  523  		lock_acquire_shared(l, s, t, NULL, i);			\
e918188611f073 Boqun Feng              2020-08-07  524  } while (0)
e918188611f073 Boqun Feng              2020-08-07  525  
5facae4f3549b5 Qian Cai                2019-09-19  526  #define rwlock_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  527  
1ca7d67cf5d5a2 John Stultz             2013-10-07  528  #define seqcount_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
1ca7d67cf5d5a2 John Stultz             2013-10-07  529  #define seqcount_acquire_read(l, s, t, i)	lock_acquire_shared_recursive(l, s, t, NULL, i)
5facae4f3549b5 Qian Cai                2019-09-19  530  #define seqcount_release(l, i)			lock_release(l, i)
1ca7d67cf5d5a2 John Stultz             2013-10-07  531  
a51805efae5dda Michel Lespinasse       2013-07-08  532  #define mutex_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  533  #define mutex_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
5facae4f3549b5 Qian Cai                2019-09-19  534  #define mutex_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  535  
a51805efae5dda Michel Lespinasse       2013-07-08  536  #define rwsem_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  537  #define rwsem_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  538  #define rwsem_acquire_read(l, s, t, i)		lock_acquire_shared(l, s, t, NULL, i)
5facae4f3549b5 Qian Cai                2019-09-19  539  #define rwsem_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  540  
a51805efae5dda Michel Lespinasse       2013-07-08  541  #define lock_map_acquire(l)			lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
0cce06ba859a51 Peter Zijlstra          2023-04-25  542  #define lock_map_acquire_try(l)			lock_acquire_exclusive(l, 0, 1, NULL, _THIS_IP_)
a51805efae5dda Michel Lespinasse       2013-07-08  543  #define lock_map_acquire_read(l)		lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
dd56af42bd829c Paul E. McKenney        2014-08-25  544  #define lock_map_acquire_tryread(l)		lock_acquire_shared_recursive(l, 0, 1, NULL, _THIS_IP_)
5facae4f3549b5 Qian Cai                2019-09-19  545  #define lock_map_release(l)			lock_release(l, _THIS_IP_)
2f1f043e7bea3f Boqun Feng              2023-01-12 @546  #define lock_map_sync(l)			lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
4f3e7524b2e703 Peter Zijlstra          2008-08-11  547  
76b189e91845ea Peter Zijlstra          2008-09-10  548  #ifdef CONFIG_PROVE_LOCKING
76b189e91845ea Peter Zijlstra          2008-09-10  549  # define might_lock(lock)						\
76b189e91845ea Peter Zijlstra          2008-09-10  550  do {									\
76b189e91845ea Peter Zijlstra          2008-09-10  551  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
fb9edbe98493fc Oleg Nesterov           2014-01-20  552  	lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);	\
5facae4f3549b5 Qian Cai                2019-09-19  553  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
76b189e91845ea Peter Zijlstra          2008-09-10  554  } while (0)
76b189e91845ea Peter Zijlstra          2008-09-10  555  # define might_lock_read(lock)						\
76b189e91845ea Peter Zijlstra          2008-09-10  556  do {									\
76b189e91845ea Peter Zijlstra          2008-09-10  557  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
fb9edbe98493fc Oleg Nesterov           2014-01-20  558  	lock_acquire(&(lock)->dep_map, 0, 0, 1, 1, NULL, _THIS_IP_);	\
5facae4f3549b5 Qian Cai                2019-09-19  559  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
76b189e91845ea Peter Zijlstra          2008-09-10  560  } while (0)
e692b4021a2e48 Simona Vetter           2019-11-04  561  # define might_lock_nested(lock, subclass)				\
e692b4021a2e48 Simona Vetter           2019-11-04  562  do {									\
e692b4021a2e48 Simona Vetter           2019-11-04  563  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
e692b4021a2e48 Simona Vetter           2019-11-04  564  	lock_acquire(&(lock)->dep_map, subclass, 0, 1, 1, NULL,		\
e692b4021a2e48 Simona Vetter           2019-11-04  565  		     _THIS_IP_);					\
023265ed75d879 Jani Nikula             2019-12-11  566  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
e692b4021a2e48 Simona Vetter           2019-11-04  567  } while (0)
f54bb2ec02c839 Frederic Weisbecker     2017-11-06  568  
a21ee6055c30ce Peter Zijlstra          2020-05-25  569  DECLARE_PER_CPU(int, hardirqs_enabled);
a21ee6055c30ce Peter Zijlstra          2020-05-25  570  DECLARE_PER_CPU(int, hardirq_context);
4d004099a668c4 Peter Zijlstra          2020-10-02  571  DECLARE_PER_CPU(unsigned int, lockdep_recursion);
a21ee6055c30ce Peter Zijlstra          2020-05-25  572  
baffd723e44dc3 Peter Zijlstra          2020-10-05 @573  #define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion))
fddf9055a60dfc Peter Zijlstra          2020-08-20  574  

:::::: The code at line 413 was first introduced by commit
:::::: eb1cfd09f788e39948a82be8063e54e40dd018d9 lockdep: Add lock_set_cmp_fn() annotation

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
