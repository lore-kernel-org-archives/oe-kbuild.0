Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B1320B
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717116; cv=none; b=YMhDpnG4KAYc0Jf4onzy2OMLbdoXq7rvzw0QEckIAQMKtMuOlevvOL+u3Jc0cypo8LPUsO4GzNlpXHRvrigYF+KpvMzpx4DJm/EKZ/yBG6sEcQ+jpjl8WIEqZLjN438pPiGJRZ5izWWIy+/jahTE29zGSedIesKJ+GVEMrmDhKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717116; c=relaxed/simple;
	bh=oEaYyugPl5FTINvKT3zKi/RZ6neqDmhSWuOziDGUzFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/LKfA5XIdVD2/OHgrp2YKIq+TyxiBiynMnsOCNU7WXRRtAg1thd3yxdEh3TFnG/r6MWlNLN2P6Yz3shYqRT8nzHG7g4G4DG+IukVHdifEfpPeKgz4dSHz8xyy3pPgxjHjVgIG44hXxd1aHiKy93oNpTHq2K893qF94T2gg/WzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5c059mC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5c059mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717108; x=1765253108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEaYyugPl5FTINvKT3zKi/RZ6neqDmhSWuOziDGUzFI=;
  b=P5c059mC58MKAaIs7EZF6NQR1lwnlwg1m0NQJgYycQ+IukXKEBDANAWE
   +BMqXoQtRwLGIqWAlzECKf47V1yxuhtWuFc1J4730ISFWfuKvyxdJhTKq
   O+NU1Ib7RDKfWxhoJRh+EZJVteu5o9ms34nkGHb01Gikg5HabbN425BRI
   LPKzaYxxkFZej6kRvY+lFDAQSvYZ3SogvoeYRG+91aYc+ZFODE0KVSv6g
   VhpCxko0FNGaxMxPK03wGGFMa+XHIxwFg3EGxN17k73aO+rpUtE7il5d7
   C3K1q+fsPXNh4NyW/8+Yrcobj5y5rgimmXkTAtgDtxhV+ZyX/rzhdmF5s
   Q==;
X-CSE-ConnectionGUID: EyefgObSSxeKX5ZqCehfqA==
X-CSE-MsgGUID: DGOaHy9lT/icpPsXlv+fRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923806"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:05:07 -0800
X-CSE-ConnectionGUID: dKkCKgzKQOK0KkIjoK42uA==
X-CSE-MsgGUID: UMX1D7hgQGaCJX+nwXek2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793232"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:05:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV14-0003mf-0U;
	Mon, 09 Dec 2024 04:05:02 +0000
Date: Mon, 9 Dec 2024 12:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH -next v5 09/22] entry: Split generic entry into irq and
 syscall
Message-ID: <202412071107.6IQ3yz7r-lkp@intel.com>
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
In-Reply-To: <20241206101744.4161990-10-ruanjinjie@huawei.com>
References: <20241206101744.4161990-10-ruanjinjie@huawei.com>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: oleg@redhat.com
TO: sstabellini@kernel.org
TO: tglx@linutronix.de
TO: peterz@infradead.org
TO: luto@kernel.org
TO: mingo@redhat.com
TO: juri.lelli@redhat.com
TO: vincent.guittot@linaro.org
TO: dietmar.eggemann@arm.com
TO: rostedt@goodmis.org
TO: bsegall@google.com
TO: mgorman@suse.de
TO: vschneid@redhat.com
TO: kees@kernel.org
TO: wad@chromium.org
TO: akpm@linux-foundation.org
TO: samitolvanen@google.com
TO: masahiroy@kernel.org
TO: hca@linux.ibm.com
TO: aliceryhl@google.com
TO: rppt@kernel.org
TO: xur@google.com
TO: paulmck@kernel.org
TO: arnd@arndb.de
TO: mbenes@suse.cz
TO: puranjay@kernel.org
TO: mark.rutland@arm.com
TO: ruanjinjie@huawei.com

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241205]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/arm64-ptrace-Replace-interrupts_enabled-with-regs_irqs_disabled/20241206-183134
base:   next-20241205
patch link:    https://lore.kernel.org/r/20241206101744.4161990-10-ruanjinjie%40huawei.com
patch subject: [PATCH -next v5 09/22] entry: Split generic entry into irq and syscall
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412071107.6IQ3yz7r-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   kernel/sched/core.c: linux/sched/rseq_api.h is included more than once.
   kernel/sched/core.c: stats.h is included more than once.
>> kernel/sched/core.c: linux/irq-entry-common.h is included more than once.

vim +72 kernel/sched/core.c

    69	
    70	#ifdef CONFIG_PREEMPT_DYNAMIC
    71	# ifdef CONFIG_GENERIC_IRQ_ENTRY
  > 72	#  include <linux/irq-entry-common.h>
    73	# endif
    74	#endif
    75	
    76	#include <uapi/linux/sched/types.h>
    77	
    78	#include <asm/irq_regs.h>
    79	#include <asm/switch_to.h>
    80	#include <asm/tlb.h>
    81	
    82	#define CREATE_TRACE_POINTS
    83	#include <linux/sched/rseq_api.h>
    84	#include <trace/events/sched.h>
    85	#include <trace/events/ipi.h>
    86	#undef CREATE_TRACE_POINTS
    87	
    88	#include "sched.h"
    89	#include "stats.h"
    90	
    91	#include "autogroup.h"
    92	#include "pelt.h"
    93	#include "smp.h"
    94	#include "stats.h"
    95	
    96	#include "../workqueue_internal.h"
    97	#include "../../io_uring/io-wq.h"
    98	#include "../smpboot.h"
    99	
   100	EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
   101	EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
   102	
   103	/*
   104	 * Export tracepoints that act as a bare tracehook (ie: have no trace event
   105	 * associated with them) to allow external modules to probe them.
   106	 */
   107	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_cfs_tp);
   108	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_rt_tp);
   109	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_dl_tp);
   110	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_irq_tp);
   111	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_se_tp);
   112	EXPORT_TRACEPOINT_SYMBOL_GPL(pelt_hw_tp);
   113	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_cpu_capacity_tp);
   114	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_overutilized_tp);
   115	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_util_est_cfs_tp);
   116	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_util_est_se_tp);
   117	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
   118	EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
   119	
   120	DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
   121	
   122	#ifdef CONFIG_SCHED_DEBUG
   123	/*
   124	 * Debugging: various feature bits
   125	 *
   126	 * If SCHED_DEBUG is disabled, each compilation unit has its own copy of
   127	 * sysctl_sched_features, defined in sched.h, to allow constants propagation
   128	 * at compile time and compiler optimization based on features default.
   129	 */
   130	#define SCHED_FEAT(name, enabled)	\
   131		(1UL << __SCHED_FEAT_##name) * enabled |
   132	const_debug unsigned int sysctl_sched_features =
   133	#include "features.h"
   134		0;
   135	#undef SCHED_FEAT
   136	
   137	/*
   138	 * Print a warning if need_resched is set for the given duration (if
   139	 * LATENCY_WARN is enabled).
   140	 *
   141	 * If sysctl_resched_latency_warn_once is set, only one warning will be shown
   142	 * per boot.
   143	 */
   144	__read_mostly int sysctl_resched_latency_warn_ms = 100;
   145	__read_mostly int sysctl_resched_latency_warn_once = 1;
   146	#endif /* CONFIG_SCHED_DEBUG */
   147	
   148	/*
   149	 * Number of tasks to iterate in a single balance run.
   150	 * Limited because this is done with IRQs disabled.
   151	 */
   152	const_debug unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
   153	
   154	__read_mostly int scheduler_running;
   155	
   156	#ifdef CONFIG_SCHED_CORE
   157	
   158	DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
   159	
   160	/* kernel prio, less is more */
   161	static inline int __task_prio(const struct task_struct *p)
   162	{
   163		if (p->sched_class == &stop_sched_class) /* trumps deadline */
   164			return -2;
   165	
   166		if (p->dl_server)
   167			return -1; /* deadline */
   168	
   169		if (rt_or_dl_prio(p->prio))
   170			return p->prio; /* [-1, 99] */
   171	
   172		if (p->sched_class == &idle_sched_class)
   173			return MAX_RT_PRIO + NICE_WIDTH; /* 140 */
   174	
   175		if (task_on_scx(p))
   176			return MAX_RT_PRIO + MAX_NICE + 1; /* 120, squash ext */
   177	
   178		return MAX_RT_PRIO + MAX_NICE; /* 119, squash fair */
   179	}
   180	
   181	/*
   182	 * l(a,b)
   183	 * le(a,b) := !l(b,a)
   184	 * g(a,b)  := l(b,a)
   185	 * ge(a,b) := !l(a,b)
   186	 */
   187	
   188	/* real prio, less is less */
   189	static inline bool prio_less(const struct task_struct *a,
   190				     const struct task_struct *b, bool in_fi)
   191	{
   192	
   193		int pa = __task_prio(a), pb = __task_prio(b);
   194	
   195		if (-pa < -pb)
   196			return true;
   197	
   198		if (-pb < -pa)
   199			return false;
   200	
   201		if (pa == -1) { /* dl_prio() doesn't work because of stop_class above */
   202			const struct sched_dl_entity *a_dl, *b_dl;
   203	
   204			a_dl = &a->dl;
   205			/*
   206			 * Since,'a' and 'b' can be CFS tasks served by DL server,
   207			 * __task_prio() can return -1 (for DL) even for those. In that
   208			 * case, get to the dl_server's DL entity.
   209			 */
   210			if (a->dl_server)
   211				a_dl = a->dl_server;
   212	
   213			b_dl = &b->dl;
   214			if (b->dl_server)
   215				b_dl = b->dl_server;
   216	
   217			return !dl_time_before(a_dl->deadline, b_dl->deadline);
   218		}
   219	
   220		if (pa == MAX_RT_PRIO + MAX_NICE)	/* fair */
   221			return cfs_prio_less(a, b, in_fi);
   222	
   223	#ifdef CONFIG_SCHED_CLASS_EXT
   224		if (pa == MAX_RT_PRIO + MAX_NICE + 1)	/* ext */
   225			return scx_prio_less(a, b, in_fi);
   226	#endif
   227	
   228		return false;
   229	}
   230	
   231	static inline bool __sched_core_less(const struct task_struct *a,
   232					     const struct task_struct *b)
   233	{
   234		if (a->core_cookie < b->core_cookie)
   235			return true;
   236	
   237		if (a->core_cookie > b->core_cookie)
   238			return false;
   239	
   240		/* flip prio, so high prio is leftmost */
   241		if (prio_less(b, a, !!task_rq(a)->core->core_forceidle_count))
   242			return true;
   243	
   244		return false;
   245	}
   246	
   247	#define __node_2_sc(node) rb_entry((node), struct task_struct, core_node)
   248	
   249	static inline bool rb_sched_core_less(struct rb_node *a, const struct rb_node *b)
   250	{
   251		return __sched_core_less(__node_2_sc(a), __node_2_sc(b));
   252	}
   253	
   254	static inline int rb_sched_core_cmp(const void *key, const struct rb_node *node)
   255	{
   256		const struct task_struct *p = __node_2_sc(node);
   257		unsigned long cookie = (unsigned long)key;
   258	
   259		if (cookie < p->core_cookie)
   260			return -1;
   261	
   262		if (cookie > p->core_cookie)
   263			return 1;
   264	
   265		return 0;
   266	}
   267	
   268	void sched_core_enqueue(struct rq *rq, struct task_struct *p)
   269	{
   270		if (p->se.sched_delayed)
   271			return;
   272	
   273		rq->core->core_task_seq++;
   274	
   275		if (!p->core_cookie)
   276			return;
   277	
   278		rb_add(&p->core_node, &rq->core_tree, rb_sched_core_less);
   279	}
   280	
   281	void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
   282	{
   283		if (p->se.sched_delayed)
   284			return;
   285	
   286		rq->core->core_task_seq++;
   287	
   288		if (sched_core_enqueued(p)) {
   289			rb_erase(&p->core_node, &rq->core_tree);
   290			RB_CLEAR_NODE(&p->core_node);
   291		}
   292	
   293		/*
   294		 * Migrating the last task off the cpu, with the cpu in forced idle
   295		 * state. Reschedule to create an accounting edge for forced idle,
   296		 * and re-examine whether the core is still in forced idle state.
   297		 */
   298		if (!(flags & DEQUEUE_SAVE) && rq->nr_running == 1 &&
   299		    rq->core->core_forceidle_count && rq->curr == rq->idle)
   300			resched_curr(rq);
   301	}
   302	
   303	static int sched_task_is_throttled(struct task_struct *p, int cpu)
   304	{
   305		if (p->sched_class->task_is_throttled)
   306			return p->sched_class->task_is_throttled(p, cpu);
   307	
   308		return 0;
   309	}
   310	
   311	static struct task_struct *sched_core_next(struct task_struct *p, unsigned long cookie)
   312	{
   313		struct rb_node *node = &p->core_node;
   314		int cpu = task_cpu(p);
   315	
   316		do {
   317			node = rb_next(node);
   318			if (!node)
   319				return NULL;
   320	
   321			p = __node_2_sc(node);
   322			if (p->core_cookie != cookie)
   323				return NULL;
   324	
   325		} while (sched_task_is_throttled(p, cpu));
   326	
   327		return p;
   328	}
   329	
   330	/*
   331	 * Find left-most (aka, highest priority) and unthrottled task matching @cookie.
   332	 * If no suitable task is found, NULL will be returned.
   333	 */
   334	static struct task_struct *sched_core_find(struct rq *rq, unsigned long cookie)
   335	{
   336		struct task_struct *p;
   337		struct rb_node *node;
   338	
   339		node = rb_find_first((void *)cookie, &rq->core_tree, rb_sched_core_cmp);
   340		if (!node)
   341			return NULL;
   342	
   343		p = __node_2_sc(node);
   344		if (!sched_task_is_throttled(p, rq->cpu))
   345			return p;
   346	
   347		return sched_core_next(p, cookie);
   348	}
   349	
   350	/*
   351	 * Magic required such that:
   352	 *
   353	 *	raw_spin_rq_lock(rq);
   354	 *	...
   355	 *	raw_spin_rq_unlock(rq);
   356	 *
   357	 * ends up locking and unlocking the _same_ lock, and all CPUs
   358	 * always agree on what rq has what lock.
   359	 *
   360	 * XXX entirely possible to selectively enable cores, don't bother for now.
   361	 */
   362	
   363	static DEFINE_MUTEX(sched_core_mutex);
   364	static atomic_t sched_core_count;
   365	static struct cpumask sched_core_mask;
   366	
   367	static void sched_core_lock(int cpu, unsigned long *flags)
   368	{
   369		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
   370		int t, i = 0;
   371	
   372		local_irq_save(*flags);
   373		for_each_cpu(t, smt_mask)
   374			raw_spin_lock_nested(&cpu_rq(t)->__lock, i++);
   375	}
   376	
   377	static void sched_core_unlock(int cpu, unsigned long *flags)
   378	{
   379		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
   380		int t;
   381	
   382		for_each_cpu(t, smt_mask)
   383			raw_spin_unlock(&cpu_rq(t)->__lock);
   384		local_irq_restore(*flags);
   385	}
   386	
   387	static void __sched_core_flip(bool enabled)
   388	{
   389		unsigned long flags;
   390		int cpu, t;
   391	
   392		cpus_read_lock();
   393	
   394		/*
   395		 * Toggle the online cores, one by one.
   396		 */
   397		cpumask_copy(&sched_core_mask, cpu_online_mask);
   398		for_each_cpu(cpu, &sched_core_mask) {
   399			const struct cpumask *smt_mask = cpu_smt_mask(cpu);
   400	
   401			sched_core_lock(cpu, &flags);
   402	
   403			for_each_cpu(t, smt_mask)
   404				cpu_rq(t)->core_enabled = enabled;
   405	
   406			cpu_rq(cpu)->core->core_forceidle_start = 0;
   407	
   408			sched_core_unlock(cpu, &flags);
   409	
   410			cpumask_andnot(&sched_core_mask, &sched_core_mask, smt_mask);
   411		}
   412	
   413		/*
   414		 * Toggle the offline CPUs.
   415		 */
   416		for_each_cpu_andnot(cpu, cpu_possible_mask, cpu_online_mask)
   417			cpu_rq(cpu)->core_enabled = enabled;
   418	
   419		cpus_read_unlock();
   420	}
   421	
   422	static void sched_core_assert_empty(void)
   423	{
   424		int cpu;
   425	
   426		for_each_possible_cpu(cpu)
   427			WARN_ON_ONCE(!RB_EMPTY_ROOT(&cpu_rq(cpu)->core_tree));
   428	}
   429	
   430	static void __sched_core_enable(void)
   431	{
   432		static_branch_enable(&__sched_core_enabled);
   433		/*
   434		 * Ensure all previous instances of raw_spin_rq_*lock() have finished
   435		 * and future ones will observe !sched_core_disabled().
   436		 */
   437		synchronize_rcu();
   438		__sched_core_flip(true);
   439		sched_core_assert_empty();
   440	}
   441	
   442	static void __sched_core_disable(void)
   443	{
   444		sched_core_assert_empty();
   445		__sched_core_flip(false);
   446		static_branch_disable(&__sched_core_enabled);
   447	}
   448	
   449	void sched_core_get(void)
   450	{
   451		if (atomic_inc_not_zero(&sched_core_count))
   452			return;
   453	
   454		mutex_lock(&sched_core_mutex);
   455		if (!atomic_read(&sched_core_count))
   456			__sched_core_enable();
   457	
   458		smp_mb__before_atomic();
   459		atomic_inc(&sched_core_count);
   460		mutex_unlock(&sched_core_mutex);
   461	}
   462	
   463	static void __sched_core_put(struct work_struct *work)
   464	{
   465		if (atomic_dec_and_mutex_lock(&sched_core_count, &sched_core_mutex)) {
   466			__sched_core_disable();
   467			mutex_unlock(&sched_core_mutex);
   468		}
   469	}
   470	
   471	void sched_core_put(void)
   472	{
   473		static DECLARE_WORK(_work, __sched_core_put);
   474	
   475		/*
   476		 * "There can be only one"
   477		 *
   478		 * Either this is the last one, or we don't actually need to do any
   479		 * 'work'. If it is the last *again*, we rely on
   480		 * WORK_STRUCT_PENDING_BIT.
   481		 */
   482		if (!atomic_add_unless(&sched_core_count, -1, 1))
   483			schedule_work(&_work);
   484	}
   485	
   486	#else /* !CONFIG_SCHED_CORE */
   487	
   488	static inline void sched_core_enqueue(struct rq *rq, struct task_struct *p) { }
   489	static inline void
   490	sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags) { }
   491	
   492	#endif /* CONFIG_SCHED_CORE */
   493	
   494	/*
   495	 * Serialization rules:
   496	 *
   497	 * Lock order:
   498	 *
   499	 *   p->pi_lock
   500	 *     rq->lock
   501	 *       hrtimer_cpu_base->lock (hrtimer_start() for bandwidth controls)
   502	 *
   503	 *  rq1->lock
   504	 *    rq2->lock  where: rq1 < rq2
   505	 *
   506	 * Regular state:
   507	 *
   508	 * Normal scheduling state is serialized by rq->lock. __schedule() takes the
   509	 * local CPU's rq->lock, it optionally removes the task from the runqueue and
   510	 * always looks at the local rq data structures to find the most eligible task
   511	 * to run next.
   512	 *
   513	 * Task enqueue is also under rq->lock, possibly taken from another CPU.
   514	 * Wakeups from another LLC domain might use an IPI to transfer the enqueue to
   515	 * the local CPU to avoid bouncing the runqueue state around [ see
   516	 * ttwu_queue_wakelist() ]
   517	 *
   518	 * Task wakeup, specifically wakeups that involve migration, are horribly
   519	 * complicated to avoid having to take two rq->locks.
   520	 *
   521	 * Special state:
   522	 *
   523	 * System-calls and anything external will use task_rq_lock() which acquires
   524	 * both p->pi_lock and rq->lock. As a consequence the state they change is
   525	 * stable while holding either lock:
   526	 *
   527	 *  - sched_setaffinity()/
   528	 *    set_cpus_allowed_ptr():	p->cpus_ptr, p->nr_cpus_allowed
   529	 *  - set_user_nice():		p->se.load, p->*prio
   530	 *  - __sched_setscheduler():	p->sched_class, p->policy, p->*prio,
   531	 *				p->se.load, p->rt_priority,
   532	 *				p->dl.dl_{runtime, deadline, period, flags, bw, density}
   533	 *  - sched_setnuma():		p->numa_preferred_nid
   534	 *  - sched_move_task():	p->sched_task_group
   535	 *  - uclamp_update_active()	p->uclamp*
   536	 *
   537	 * p->state <- TASK_*:
   538	 *
   539	 *   is changed locklessly using set_current_state(), __set_current_state() or
   540	 *   set_special_state(), see their respective comments, or by
   541	 *   try_to_wake_up(). This latter uses p->pi_lock to serialize against
   542	 *   concurrent self.
   543	 *
   544	 * p->on_rq <- { 0, 1 = TASK_ON_RQ_QUEUED, 2 = TASK_ON_RQ_MIGRATING }:
   545	 *
   546	 *   is set by activate_task() and cleared by deactivate_task(), under
   547	 *   rq->lock. Non-zero indicates the task is runnable, the special
   548	 *   ON_RQ_MIGRATING state is used for migration without holding both
   549	 *   rq->locks. It indicates task_cpu() is not stable, see task_rq_lock().
   550	 *
   551	 *   Additionally it is possible to be ->on_rq but still be considered not
   552	 *   runnable when p->se.sched_delayed is true. These tasks are on the runqueue
   553	 *   but will be dequeued as soon as they get picked again. See the
   554	 *   task_is_runnable() helper.
   555	 *
   556	 * p->on_cpu <- { 0, 1 }:
   557	 *
   558	 *   is set by prepare_task() and cleared by finish_task() such that it will be
   559	 *   set before p is scheduled-in and cleared after p is scheduled-out, both
   560	 *   under rq->lock. Non-zero indicates the task is running on its CPU.
   561	 *
   562	 *   [ The astute reader will observe that it is possible for two tasks on one
   563	 *     CPU to have ->on_cpu = 1 at the same time. ]
   564	 *
   565	 * task_cpu(p): is changed by set_task_cpu(), the rules are:
   566	 *
   567	 *  - Don't call set_task_cpu() on a blocked task:
   568	 *
   569	 *    We don't care what CPU we're not running on, this simplifies hotplug,
   570	 *    the CPU assignment of blocked tasks isn't required to be valid.
   571	 *
   572	 *  - for try_to_wake_up(), called under p->pi_lock:
   573	 *
   574	 *    This allows try_to_wake_up() to only take one rq->lock, see its comment.
   575	 *
   576	 *  - for migration called under rq->lock:
   577	 *    [ see task_on_rq_migrating() in task_rq_lock() ]
   578	 *
   579	 *    o move_queued_task()
   580	 *    o detach_task()
   581	 *
   582	 *  - for migration called under double_rq_lock():
   583	 *
   584	 *    o __migrate_swap_task()
   585	 *    o push_rt_task() / pull_rt_task()
   586	 *    o push_dl_task() / pull_dl_task()
   587	 *    o dl_task_offline_migration()
   588	 *
   589	 */
   590	
   591	void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
   592	{
   593		raw_spinlock_t *lock;
   594	
   595		/* Matches synchronize_rcu() in __sched_core_enable() */
   596		preempt_disable();
   597		if (sched_core_disabled()) {
   598			raw_spin_lock_nested(&rq->__lock, subclass);
   599			/* preempt_count *MUST* be > 1 */
   600			preempt_enable_no_resched();
   601			return;
   602		}
   603	
   604		for (;;) {
   605			lock = __rq_lockp(rq);
   606			raw_spin_lock_nested(lock, subclass);
   607			if (likely(lock == __rq_lockp(rq))) {
   608				/* preempt_count *MUST* be > 1 */
   609				preempt_enable_no_resched();
   610				return;
   611			}
   612			raw_spin_unlock(lock);
   613		}
   614	}
   615	
   616	bool raw_spin_rq_trylock(struct rq *rq)
   617	{
   618		raw_spinlock_t *lock;
   619		bool ret;
   620	
   621		/* Matches synchronize_rcu() in __sched_core_enable() */
   622		preempt_disable();
   623		if (sched_core_disabled()) {
   624			ret = raw_spin_trylock(&rq->__lock);
   625			preempt_enable();
   626			return ret;
   627		}
   628	
   629		for (;;) {
   630			lock = __rq_lockp(rq);
   631			ret = raw_spin_trylock(lock);
   632			if (!ret || (likely(lock == __rq_lockp(rq)))) {
   633				preempt_enable();
   634				return ret;
   635			}
   636			raw_spin_unlock(lock);
   637		}
   638	}
   639	
   640	void raw_spin_rq_unlock(struct rq *rq)
   641	{
   642		raw_spin_unlock(rq_lockp(rq));
   643	}
   644	
   645	#ifdef CONFIG_SMP
   646	/*
   647	 * double_rq_lock - safely lock two runqueues
   648	 */
   649	void double_rq_lock(struct rq *rq1, struct rq *rq2)
   650	{
   651		lockdep_assert_irqs_disabled();
   652	
   653		if (rq_order_less(rq2, rq1))
   654			swap(rq1, rq2);
   655	
   656		raw_spin_rq_lock(rq1);
   657		if (__rq_lockp(rq1) != __rq_lockp(rq2))
   658			raw_spin_rq_lock_nested(rq2, SINGLE_DEPTH_NESTING);
   659	
   660		double_rq_clock_clear_update(rq1, rq2);
   661	}
   662	#endif
   663	
   664	/*
   665	 * __task_rq_lock - lock the rq @p resides on.
   666	 */
   667	struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
   668		__acquires(rq->lock)
   669	{
   670		struct rq *rq;
   671	
   672		lockdep_assert_held(&p->pi_lock);
   673	
   674		for (;;) {
   675			rq = task_rq(p);
   676			raw_spin_rq_lock(rq);
   677			if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
   678				rq_pin_lock(rq, rf);
   679				return rq;
   680			}
   681			raw_spin_rq_unlock(rq);
   682	
   683			while (unlikely(task_on_rq_migrating(p)))
   684				cpu_relax();
   685		}
   686	}
   687	
   688	/*
   689	 * task_rq_lock - lock p->pi_lock and lock the rq @p resides on.
   690	 */
   691	struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
   692		__acquires(p->pi_lock)
   693		__acquires(rq->lock)
   694	{
   695		struct rq *rq;
   696	
   697		for (;;) {
   698			raw_spin_lock_irqsave(&p->pi_lock, rf->flags);
   699			rq = task_rq(p);
   700			raw_spin_rq_lock(rq);
   701			/*
   702			 *	move_queued_task()		task_rq_lock()
   703			 *
   704			 *	ACQUIRE (rq->lock)
   705			 *	[S] ->on_rq = MIGRATING		[L] rq = task_rq()
   706			 *	WMB (__set_task_cpu())		ACQUIRE (rq->lock);
   707			 *	[S] ->cpu = new_cpu		[L] task_rq()
   708			 *					[L] ->on_rq
   709			 *	RELEASE (rq->lock)
   710			 *
   711			 * If we observe the old CPU in task_rq_lock(), the acquire of
   712			 * the old rq->lock will fully serialize against the stores.
   713			 *
   714			 * If we observe the new CPU in task_rq_lock(), the address
   715			 * dependency headed by '[L] rq = task_rq()' and the acquire
   716			 * will pair with the WMB to ensure we then also see migrating.
   717			 */
   718			if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
   719				rq_pin_lock(rq, rf);
   720				return rq;
   721			}
   722			raw_spin_rq_unlock(rq);
   723			raw_spin_unlock_irqrestore(&p->pi_lock, rf->flags);
   724	
   725			while (unlikely(task_on_rq_migrating(p)))
   726				cpu_relax();
   727		}
   728	}
   729	
   730	/*
   731	 * RQ-clock updating methods:
   732	 */
   733	
   734	static void update_rq_clock_task(struct rq *rq, s64 delta)
   735	{
   736	/*
   737	 * In theory, the compile should just see 0 here, and optimize out the call
   738	 * to sched_rt_avg_update. But I don't trust it...
   739	 */
   740		s64 __maybe_unused steal = 0, irq_delta = 0;
   741	
   742	#ifdef CONFIG_IRQ_TIME_ACCOUNTING
   743		irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
   744	
   745		/*
   746		 * Since irq_time is only updated on {soft,}irq_exit, we might run into
   747		 * this case when a previous update_rq_clock() happened inside a
   748		 * {soft,}IRQ region.
   749		 *
   750		 * When this happens, we stop ->clock_task and only update the
   751		 * prev_irq_time stamp to account for the part that fit, so that a next
   752		 * update will consume the rest. This ensures ->clock_task is
   753		 * monotonic.
   754		 *
   755		 * It does however cause some slight miss-attribution of {soft,}IRQ
   756		 * time, a more accurate solution would be to update the irq_time using
   757		 * the current rq->clock timestamp, except that would require using
   758		 * atomic ops.
   759		 */
   760		if (irq_delta > delta)
   761			irq_delta = delta;
   762	
   763		rq->prev_irq_time += irq_delta;
   764		delta -= irq_delta;
   765		delayacct_irq(rq->curr, irq_delta);
   766	#endif
   767	#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
   768		if (static_key_false((&paravirt_steal_rq_enabled))) {
   769			u64 prev_steal;
   770	
   771			steal = prev_steal = paravirt_steal_clock(cpu_of(rq));
   772			steal -= rq->prev_steal_time_rq;
   773	
   774			if (unlikely(steal > delta))
   775				steal = delta;
   776	
   777			rq->prev_steal_time_rq = prev_steal;
   778			delta -= steal;
   779		}
   780	#endif
   781	
   782		rq->clock_task += delta;
   783	
   784	#ifdef CONFIG_HAVE_SCHED_AVG_IRQ
   785		if ((irq_delta + steal) && sched_feat(NONTASK_CAPACITY))
   786			update_irq_load_avg(rq, irq_delta + steal);
   787	#endif
   788		update_rq_clock_pelt(rq, delta);
   789	}
   790	
   791	void update_rq_clock(struct rq *rq)
   792	{
   793		s64 delta;
   794	
   795		lockdep_assert_rq_held(rq);
   796	
   797		if (rq->clock_update_flags & RQCF_ACT_SKIP)
   798			return;
   799	
   800	#ifdef CONFIG_SCHED_DEBUG
   801		if (sched_feat(WARN_DOUBLE_CLOCK))
   802			SCHED_WARN_ON(rq->clock_update_flags & RQCF_UPDATED);
   803		rq->clock_update_flags |= RQCF_UPDATED;
   804	#endif
   805	
   806		delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
   807		if (delta < 0)
   808			return;
   809		rq->clock += delta;
   810		update_rq_clock_task(rq, delta);
   811	}
   812	
   813	#ifdef CONFIG_SCHED_HRTICK
   814	/*
   815	 * Use HR-timers to deliver accurate preemption points.
   816	 */
   817	
   818	static void hrtick_clear(struct rq *rq)
   819	{
   820		if (hrtimer_active(&rq->hrtick_timer))
   821			hrtimer_cancel(&rq->hrtick_timer);
   822	}
   823	
   824	/*
   825	 * High-resolution timer tick.
   826	 * Runs from hardirq context with interrupts disabled.
   827	 */
   828	static enum hrtimer_restart hrtick(struct hrtimer *timer)
   829	{
   830		struct rq *rq = container_of(timer, struct rq, hrtick_timer);
   831		struct rq_flags rf;
   832	
   833		WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
   834	
   835		rq_lock(rq, &rf);
   836		update_rq_clock(rq);
   837		rq->donor->sched_class->task_tick(rq, rq->curr, 1);
   838		rq_unlock(rq, &rf);
   839	
   840		return HRTIMER_NORESTART;
   841	}
   842	
   843	#ifdef CONFIG_SMP
   844	
   845	static void __hrtick_restart(struct rq *rq)
   846	{
   847		struct hrtimer *timer = &rq->hrtick_timer;
   848		ktime_t time = rq->hrtick_time;
   849	
   850		hrtimer_start(timer, time, HRTIMER_MODE_ABS_PINNED_HARD);
   851	}
   852	
   853	/*
   854	 * called from hardirq (IPI) context
   855	 */
   856	static void __hrtick_start(void *arg)
   857	{
   858		struct rq *rq = arg;
   859		struct rq_flags rf;
   860	
   861		rq_lock(rq, &rf);
   862		__hrtick_restart(rq);
   863		rq_unlock(rq, &rf);
   864	}
   865	
   866	/*
   867	 * Called to set the hrtick timer state.
   868	 *
   869	 * called with rq->lock held and IRQs disabled
   870	 */
   871	void hrtick_start(struct rq *rq, u64 delay)
   872	{
   873		struct hrtimer *timer = &rq->hrtick_timer;
   874		s64 delta;
   875	
   876		/*
   877		 * Don't schedule slices shorter than 10000ns, that just
   878		 * doesn't make sense and can cause timer DoS.
   879		 */
   880		delta = max_t(s64, delay, 10000LL);
   881		rq->hrtick_time = ktime_add_ns(timer->base->get_time(), delta);
   882	
   883		if (rq == this_rq())
   884			__hrtick_restart(rq);
   885		else
   886			smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
   887	}
   888	
   889	#else
   890	/*
   891	 * Called to set the hrtick timer state.
   892	 *
   893	 * called with rq->lock held and IRQs disabled
   894	 */
   895	void hrtick_start(struct rq *rq, u64 delay)
   896	{
   897		/*
   898		 * Don't schedule slices shorter than 10000ns, that just
   899		 * doesn't make sense. Rely on vruntime for fairness.
   900		 */
   901		delay = max_t(u64, delay, 10000LL);
   902		hrtimer_start(&rq->hrtick_timer, ns_to_ktime(delay),
   903			      HRTIMER_MODE_REL_PINNED_HARD);
   904	}
   905	
   906	#endif /* CONFIG_SMP */
   907	
   908	static void hrtick_rq_init(struct rq *rq)
   909	{
   910	#ifdef CONFIG_SMP
   911		INIT_CSD(&rq->hrtick_csd, __hrtick_start, rq);
   912	#endif
   913		hrtimer_init(&rq->hrtick_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
   914		rq->hrtick_timer.function = hrtick;
   915	}
   916	#else	/* CONFIG_SCHED_HRTICK */
   917	static inline void hrtick_clear(struct rq *rq)
   918	{
   919	}
   920	
   921	static inline void hrtick_rq_init(struct rq *rq)
   922	{
   923	}
   924	#endif	/* CONFIG_SCHED_HRTICK */
   925	
   926	/*
   927	 * try_cmpxchg based fetch_or() macro so it works for different integer types:
   928	 */
   929	#define fetch_or(ptr, mask)						\
   930		({								\
   931			typeof(ptr) _ptr = (ptr);				\
   932			typeof(mask) _mask = (mask);				\
   933			typeof(*_ptr) _val = *_ptr;				\
   934										\
   935			do {							\
   936			} while (!try_cmpxchg(_ptr, &_val, _val | _mask));	\
   937		_val;								\
   938	})
   939	
   940	#if defined(CONFIG_SMP) && defined(TIF_POLLING_NRFLAG)
   941	/*
   942	 * Atomically set TIF_NEED_RESCHED and test for TIF_POLLING_NRFLAG,
   943	 * this avoids any races wrt polling state changes and thereby avoids
   944	 * spurious IPIs.
   945	 */
   946	static inline bool set_nr_and_not_polling(struct thread_info *ti, int tif)
   947	{
   948		return !(fetch_or(&ti->flags, 1 << tif) & _TIF_POLLING_NRFLAG);
   949	}
   950	
   951	/*
   952	 * Atomically set TIF_NEED_RESCHED if TIF_POLLING_NRFLAG is set.
   953	 *
   954	 * If this returns true, then the idle task promises to call
   955	 * sched_ttwu_pending() and reschedule soon.
   956	 */
   957	static bool set_nr_if_polling(struct task_struct *p)
   958	{
   959		struct thread_info *ti = task_thread_info(p);
   960		typeof(ti->flags) val = READ_ONCE(ti->flags);
   961	
   962		do {
   963			if (!(val & _TIF_POLLING_NRFLAG))
   964				return false;
   965			if (val & _TIF_NEED_RESCHED)
   966				return true;
   967		} while (!try_cmpxchg(&ti->flags, &val, val | _TIF_NEED_RESCHED));
   968	
   969		return true;
   970	}
   971	
   972	#else
   973	static inline bool set_nr_and_not_polling(struct thread_info *ti, int tif)
   974	{
   975		set_ti_thread_flag(ti, tif);
   976		return true;
   977	}
   978	
   979	#ifdef CONFIG_SMP
   980	static inline bool set_nr_if_polling(struct task_struct *p)
   981	{
   982		return false;
   983	}
   984	#endif
   985	#endif
   986	
   987	static bool __wake_q_add(struct wake_q_head *head, struct task_struct *task)
   988	{
   989		struct wake_q_node *node = &task->wake_q;
   990	
   991		/*
   992		 * Atomically grab the task, if ->wake_q is !nil already it means
   993		 * it's already queued (either by us or someone else) and will get the
   994		 * wakeup due to that.
   995		 *
   996		 * In order to ensure that a pending wakeup will observe our pending
   997		 * state, even in the failed case, an explicit smp_mb() must be used.
   998		 */
   999		smp_mb__before_atomic();
  1000		if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
  1001			return false;
  1002	
  1003		/*
  1004		 * The head is context local, there can be no concurrency.
  1005		 */
  1006		*head->lastp = node;
  1007		head->lastp = &node->next;
  1008		return true;
  1009	}
  1010	
  1011	/**
  1012	 * wake_q_add() - queue a wakeup for 'later' waking.
  1013	 * @head: the wake_q_head to add @task to
  1014	 * @task: the task to queue for 'later' wakeup
  1015	 *
  1016	 * Queue a task for later wakeup, most likely by the wake_up_q() call in the
  1017	 * same context, _HOWEVER_ this is not guaranteed, the wakeup can come
  1018	 * instantly.
  1019	 *
  1020	 * This function must be used as-if it were wake_up_process(); IOW the task
  1021	 * must be ready to be woken at this location.
  1022	 */
  1023	void wake_q_add(struct wake_q_head *head, struct task_struct *task)
  1024	{
  1025		if (__wake_q_add(head, task))
  1026			get_task_struct(task);
  1027	}
  1028	
  1029	/**
  1030	 * wake_q_add_safe() - safely queue a wakeup for 'later' waking.
  1031	 * @head: the wake_q_head to add @task to
  1032	 * @task: the task to queue for 'later' wakeup
  1033	 *
  1034	 * Queue a task for later wakeup, most likely by the wake_up_q() call in the
  1035	 * same context, _HOWEVER_ this is not guaranteed, the wakeup can come
  1036	 * instantly.
  1037	 *
  1038	 * This function must be used as-if it were wake_up_process(); IOW the task
  1039	 * must be ready to be woken at this location.
  1040	 *
  1041	 * This function is essentially a task-safe equivalent to wake_q_add(). Callers
  1042	 * that already hold reference to @task can call the 'safe' version and trust
  1043	 * wake_q to do the right thing depending whether or not the @task is already
  1044	 * queued for wakeup.
  1045	 */
  1046	void wake_q_add_safe(struct wake_q_head *head, struct task_struct *task)
  1047	{
  1048		if (!__wake_q_add(head, task))
  1049			put_task_struct(task);
  1050	}
  1051	
  1052	void wake_up_q(struct wake_q_head *head)
  1053	{
  1054		struct wake_q_node *node = head->first;
  1055	
  1056		while (node != WAKE_Q_TAIL) {
  1057			struct task_struct *task;
  1058	
  1059			task = container_of(node, struct task_struct, wake_q);
  1060			/* Task can safely be re-inserted now: */
  1061			node = node->next;
  1062			task->wake_q.next = NULL;
  1063	
  1064			/*
  1065			 * wake_up_process() executes a full barrier, which pairs with
  1066			 * the queueing in wake_q_add() so as not to miss wakeups.
  1067			 */
  1068			wake_up_process(task);
  1069			put_task_struct(task);
  1070		}
  1071	}
  1072	
  1073	/*
  1074	 * resched_curr - mark rq's current task 'to be rescheduled now'.
  1075	 *
  1076	 * On UP this means the setting of the need_resched flag, on SMP it
  1077	 * might also involve a cross-CPU call to trigger the scheduler on
  1078	 * the target CPU.
  1079	 */
  1080	static void __resched_curr(struct rq *rq, int tif)
  1081	{
  1082		struct task_struct *curr = rq->curr;
  1083		struct thread_info *cti = task_thread_info(curr);
  1084		int cpu;
  1085	
  1086		lockdep_assert_rq_held(rq);
  1087	
  1088		/*
  1089		 * Always immediately preempt the idle task; no point in delaying doing
  1090		 * actual work.
  1091		 */
  1092		if (is_idle_task(curr) && tif == TIF_NEED_RESCHED_LAZY)
  1093			tif = TIF_NEED_RESCHED;
  1094	
  1095		if (cti->flags & ((1 << tif) | _TIF_NEED_RESCHED))
  1096			return;
  1097	
  1098		cpu = cpu_of(rq);
  1099	
  1100		if (cpu == smp_processor_id()) {
  1101			set_ti_thread_flag(cti, tif);
  1102			if (tif == TIF_NEED_RESCHED)
  1103				set_preempt_need_resched();
  1104			return;
  1105		}
  1106	
  1107		if (set_nr_and_not_polling(cti, tif)) {
  1108			if (tif == TIF_NEED_RESCHED)
  1109				smp_send_reschedule(cpu);
  1110		} else {
  1111			trace_sched_wake_idle_without_ipi(cpu);
  1112		}
  1113	}
  1114	
  1115	void resched_curr(struct rq *rq)
  1116	{
  1117		__resched_curr(rq, TIF_NEED_RESCHED);
  1118	}
  1119	
  1120	#ifdef CONFIG_PREEMPT_DYNAMIC
  1121	static DEFINE_STATIC_KEY_FALSE(sk_dynamic_preempt_lazy);
  1122	static __always_inline bool dynamic_preempt_lazy(void)
  1123	{
  1124		return static_branch_unlikely(&sk_dynamic_preempt_lazy);
  1125	}
  1126	#else
  1127	static __always_inline bool dynamic_preempt_lazy(void)
  1128	{
  1129		return IS_ENABLED(CONFIG_PREEMPT_LAZY);
  1130	}
  1131	#endif
  1132	
  1133	static __always_inline int get_lazy_tif_bit(void)
  1134	{
  1135		if (dynamic_preempt_lazy())
  1136			return TIF_NEED_RESCHED_LAZY;
  1137	
  1138		return TIF_NEED_RESCHED;
  1139	}
  1140	
  1141	void resched_curr_lazy(struct rq *rq)
  1142	{
  1143		__resched_curr(rq, get_lazy_tif_bit());
  1144	}
  1145	
  1146	void resched_cpu(int cpu)
  1147	{
  1148		struct rq *rq = cpu_rq(cpu);
  1149		unsigned long flags;
  1150	
  1151		raw_spin_rq_lock_irqsave(rq, flags);
  1152		if (cpu_online(cpu) || cpu == smp_processor_id())
  1153			resched_curr(rq);
  1154		raw_spin_rq_unlock_irqrestore(rq, flags);
  1155	}
  1156	
  1157	#ifdef CONFIG_SMP
  1158	#ifdef CONFIG_NO_HZ_COMMON
  1159	/*
  1160	 * In the semi idle case, use the nearest busy CPU for migrating timers
  1161	 * from an idle CPU.  This is good for power-savings.
  1162	 *
  1163	 * We don't do similar optimization for completely idle system, as
  1164	 * selecting an idle CPU will add more delays to the timers than intended
  1165	 * (as that CPU's timer base may not be up to date wrt jiffies etc).
  1166	 */
  1167	int get_nohz_timer_target(void)
  1168	{
  1169		int i, cpu = smp_processor_id(), default_cpu = -1;
  1170		struct sched_domain *sd;
  1171		const struct cpumask *hk_mask;
  1172	
  1173		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
  1174			if (!idle_cpu(cpu))
  1175				return cpu;
  1176			default_cpu = cpu;
  1177		}
  1178	
  1179		hk_mask = housekeeping_cpumask(HK_TYPE_KERNEL_NOISE);
  1180	
  1181		guard(rcu)();
  1182	
  1183		for_each_domain(cpu, sd) {
  1184			for_each_cpu_and(i, sched_domain_span(sd), hk_mask) {
  1185				if (cpu == i)
  1186					continue;
  1187	
  1188				if (!idle_cpu(i))
  1189					return i;
  1190			}
  1191		}
  1192	
  1193		if (default_cpu == -1)
  1194			default_cpu = housekeeping_any_cpu(HK_TYPE_KERNEL_NOISE);
  1195	
  1196		return default_cpu;
  1197	}
  1198	
  1199	/*
  1200	 * When add_timer_on() enqueues a timer into the timer wheel of an
  1201	 * idle CPU then this timer might expire before the next timer event
  1202	 * which is scheduled to wake up that CPU. In case of a completely
  1203	 * idle system the next event might even be infinite time into the
  1204	 * future. wake_up_idle_cpu() ensures that the CPU is woken up and
  1205	 * leaves the inner idle loop so the newly added timer is taken into
  1206	 * account when the CPU goes back to idle and evaluates the timer
  1207	 * wheel for the next timer event.
  1208	 */
  1209	static void wake_up_idle_cpu(int cpu)
  1210	{
  1211		struct rq *rq = cpu_rq(cpu);
  1212	
  1213		if (cpu == smp_processor_id())
  1214			return;
  1215	
  1216		/*
  1217		 * Set TIF_NEED_RESCHED and send an IPI if in the non-polling
  1218		 * part of the idle loop. This forces an exit from the idle loop
  1219		 * and a round trip to schedule(). Now this could be optimized
  1220		 * because a simple new idle loop iteration is enough to
  1221		 * re-evaluate the next tick. Provided some re-ordering of tick
  1222		 * nohz functions that would need to follow TIF_NR_POLLING
  1223		 * clearing:
  1224		 *
  1225		 * - On most architectures, a simple fetch_or on ti::flags with a
  1226		 *   "0" value would be enough to know if an IPI needs to be sent.
  1227		 *
  1228		 * - x86 needs to perform a last need_resched() check between
  1229		 *   monitor and mwait which doesn't take timers into account.
  1230		 *   There a dedicated TIF_TIMER flag would be required to
  1231		 *   fetch_or here and be checked along with TIF_NEED_RESCHED
  1232		 *   before mwait().
  1233		 *
  1234		 * However, remote timer enqueue is not such a frequent event
  1235		 * and testing of the above solutions didn't appear to report
  1236		 * much benefits.
  1237		 */
  1238		if (set_nr_and_not_polling(task_thread_info(rq->idle), TIF_NEED_RESCHED))
  1239			smp_send_reschedule(cpu);
  1240		else
  1241			trace_sched_wake_idle_without_ipi(cpu);
  1242	}
  1243	
  1244	static bool wake_up_full_nohz_cpu(int cpu)
  1245	{
  1246		/*
  1247		 * We just need the target to call irq_exit() and re-evaluate
  1248		 * the next tick. The nohz full kick at least implies that.
  1249		 * If needed we can still optimize that later with an
  1250		 * empty IRQ.
  1251		 */
  1252		if (cpu_is_offline(cpu))
  1253			return true;  /* Don't try to wake offline CPUs. */
  1254		if (tick_nohz_full_cpu(cpu)) {
  1255			if (cpu != smp_processor_id() ||
  1256			    tick_nohz_tick_stopped())
  1257				tick_nohz_full_kick_cpu(cpu);
  1258			return true;
  1259		}
  1260	
  1261		return false;
  1262	}
  1263	
  1264	/*
  1265	 * Wake up the specified CPU.  If the CPU is going offline, it is the
  1266	 * caller's responsibility to deal with the lost wakeup, for example,
  1267	 * by hooking into the CPU_DEAD notifier like timers and hrtimers do.
  1268	 */
  1269	void wake_up_nohz_cpu(int cpu)
  1270	{
  1271		if (!wake_up_full_nohz_cpu(cpu))
  1272			wake_up_idle_cpu(cpu);
  1273	}
  1274	
  1275	static void nohz_csd_func(void *info)
  1276	{
  1277		struct rq *rq = info;
  1278		int cpu = cpu_of(rq);
  1279		unsigned int flags;
  1280	
  1281		/*
  1282		 * Release the rq::nohz_csd.
  1283		 */
  1284		flags = atomic_fetch_andnot(NOHZ_KICK_MASK | NOHZ_NEWILB_KICK, nohz_flags(cpu));
  1285		WARN_ON(!(flags & NOHZ_KICK_MASK));
  1286	
  1287		rq->idle_balance = idle_cpu(cpu);
  1288		if (rq->idle_balance) {
  1289			rq->nohz_idle_balance = flags;
  1290			__raise_softirq_irqoff(SCHED_SOFTIRQ);
  1291		}
  1292	}
  1293	
  1294	#endif /* CONFIG_NO_HZ_COMMON */
  1295	
  1296	#ifdef CONFIG_NO_HZ_FULL
  1297	static inline bool __need_bw_check(struct rq *rq, struct task_struct *p)
  1298	{
  1299		if (rq->nr_running != 1)
  1300			return false;
  1301	
  1302		if (p->sched_class != &fair_sched_class)
  1303			return false;
  1304	
  1305		if (!task_on_rq_queued(p))
  1306			return false;
  1307	
  1308		return true;
  1309	}
  1310	
  1311	bool sched_can_stop_tick(struct rq *rq)
  1312	{
  1313		int fifo_nr_running;
  1314	
  1315		/* Deadline tasks, even if single, need the tick */
  1316		if (rq->dl.dl_nr_running)
  1317			return false;
  1318	
  1319		/*
  1320		 * If there are more than one RR tasks, we need the tick to affect the
  1321		 * actual RR behaviour.
  1322		 */
  1323		if (rq->rt.rr_nr_running) {
  1324			if (rq->rt.rr_nr_running == 1)
  1325				return true;
  1326			else
  1327				return false;
  1328		}
  1329	
  1330		/*
  1331		 * If there's no RR tasks, but FIFO tasks, we can skip the tick, no
  1332		 * forced preemption between FIFO tasks.
  1333		 */
  1334		fifo_nr_running = rq->rt.rt_nr_running - rq->rt.rr_nr_running;
  1335		if (fifo_nr_running)
  1336			return true;
  1337	
  1338		/*
  1339		 * If there are no DL,RR/FIFO tasks, there must only be CFS or SCX tasks
  1340		 * left. For CFS, if there's more than one we need the tick for
  1341		 * involuntary preemption. For SCX, ask.
  1342		 */
  1343		if (scx_enabled() && !scx_can_stop_tick(rq))
  1344			return false;
  1345	
  1346		if (rq->cfs.nr_running > 1)
  1347			return false;
  1348	
  1349		/*
  1350		 * If there is one task and it has CFS runtime bandwidth constraints
  1351		 * and it's on the cpu now we don't want to stop the tick.
  1352		 * This check prevents clearing the bit if a newly enqueued task here is
  1353		 * dequeued by migrating while the constrained task continues to run.
  1354		 * E.g. going from 2->1 without going through pick_next_task().
  1355		 */
  1356		if (__need_bw_check(rq, rq->curr)) {
  1357			if (cfs_task_bw_constrained(rq->curr))
  1358				return false;
  1359		}
  1360	
  1361		return true;
  1362	}
  1363	#endif /* CONFIG_NO_HZ_FULL */
  1364	#endif /* CONFIG_SMP */
  1365	
  1366	#if defined(CONFIG_RT_GROUP_SCHED) || (defined(CONFIG_FAIR_GROUP_SCHED) && \
  1367				(defined(CONFIG_SMP) || defined(CONFIG_CFS_BANDWIDTH)))
  1368	/*
  1369	 * Iterate task_group tree rooted at *from, calling @down when first entering a
  1370	 * node and @up when leaving it for the final time.
  1371	 *
  1372	 * Caller must hold rcu_lock or sufficient equivalent.
  1373	 */
  1374	int walk_tg_tree_from(struct task_group *from,
  1375				     tg_visitor down, tg_visitor up, void *data)
  1376	{
  1377		struct task_group *parent, *child;
  1378		int ret;
  1379	
  1380		parent = from;
  1381	
  1382	down:
  1383		ret = (*down)(parent, data);
  1384		if (ret)
  1385			goto out;
  1386		list_for_each_entry_rcu(child, &parent->children, siblings) {
  1387			parent = child;
  1388			goto down;
  1389	
  1390	up:
  1391			continue;
  1392		}
  1393		ret = (*up)(parent, data);
  1394		if (ret || parent == from)
  1395			goto out;
  1396	
  1397		child = parent;
  1398		parent = parent->parent;
  1399		if (parent)
  1400			goto up;
  1401	out:
  1402		return ret;
  1403	}
  1404	
  1405	int tg_nop(struct task_group *tg, void *data)
  1406	{
  1407		return 0;
  1408	}
  1409	#endif
  1410	
  1411	void set_load_weight(struct task_struct *p, bool update_load)
  1412	{
  1413		int prio = p->static_prio - MAX_RT_PRIO;
  1414		struct load_weight lw;
  1415	
  1416		if (task_has_idle_policy(p)) {
  1417			lw.weight = scale_load(WEIGHT_IDLEPRIO);
  1418			lw.inv_weight = WMULT_IDLEPRIO;
  1419		} else {
  1420			lw.weight = scale_load(sched_prio_to_weight[prio]);
  1421			lw.inv_weight = sched_prio_to_wmult[prio];
  1422		}
  1423	
  1424		/*
  1425		 * SCHED_OTHER tasks have to update their load when changing their
  1426		 * weight
  1427		 */
  1428		if (update_load && p->sched_class->reweight_task)
  1429			p->sched_class->reweight_task(task_rq(p), p, &lw);
  1430		else
  1431			p->se.load = lw;
  1432	}
  1433	
  1434	#ifdef CONFIG_UCLAMP_TASK
  1435	/*
  1436	 * Serializes updates of utilization clamp values
  1437	 *
  1438	 * The (slow-path) user-space triggers utilization clamp value updates which
  1439	 * can require updates on (fast-path) scheduler's data structures used to
  1440	 * support enqueue/dequeue operations.
  1441	 * While the per-CPU rq lock protects fast-path update operations, user-space
  1442	 * requests are serialized using a mutex to reduce the risk of conflicting
  1443	 * updates or API abuses.
  1444	 */
  1445	static __maybe_unused DEFINE_MUTEX(uclamp_mutex);
  1446	
  1447	/* Max allowed minimum utilization */
  1448	static unsigned int __maybe_unused sysctl_sched_uclamp_util_min = SCHED_CAPACITY_SCALE;
  1449	
  1450	/* Max allowed maximum utilization */
  1451	static unsigned int __maybe_unused sysctl_sched_uclamp_util_max = SCHED_CAPACITY_SCALE;
  1452	
  1453	/*
  1454	 * By default RT tasks run at the maximum performance point/capacity of the
  1455	 * system. Uclamp enforces this by always setting UCLAMP_MIN of RT tasks to
  1456	 * SCHED_CAPACITY_SCALE.
  1457	 *
  1458	 * This knob allows admins to change the default behavior when uclamp is being
  1459	 * used. In battery powered devices, particularly, running at the maximum
  1460	 * capacity and frequency will increase energy consumption and shorten the
  1461	 * battery life.
  1462	 *
  1463	 * This knob only affects RT tasks that their uclamp_se->user_defined == false.
  1464	 *
  1465	 * This knob will not override the system default sched_util_clamp_min defined
  1466	 * above.
  1467	 */
  1468	unsigned int sysctl_sched_uclamp_util_min_rt_default = SCHED_CAPACITY_SCALE;
  1469	
  1470	/* All clamps are required to be less or equal than these values */
  1471	static struct uclamp_se uclamp_default[UCLAMP_CNT];
  1472	
  1473	/*
  1474	 * This static key is used to reduce the uclamp overhead in the fast path. It
  1475	 * primarily disables the call to uclamp_rq_{inc, dec}() in
  1476	 * enqueue/dequeue_task().
  1477	 *
  1478	 * This allows users to continue to enable uclamp in their kernel config with
  1479	 * minimum uclamp overhead in the fast path.
  1480	 *
  1481	 * As soon as userspace modifies any of the uclamp knobs, the static key is
  1482	 * enabled, since we have an actual users that make use of uclamp
  1483	 * functionality.
  1484	 *
  1485	 * The knobs that would enable this static key are:
  1486	 *
  1487	 *   * A task modifying its uclamp value with sched_setattr().
  1488	 *   * An admin modifying the sysctl_sched_uclamp_{min, max} via procfs.
  1489	 *   * An admin modifying the cgroup cpu.uclamp.{min, max}
  1490	 */
  1491	DEFINE_STATIC_KEY_FALSE(sched_uclamp_used);
  1492	
  1493	static inline unsigned int
  1494	uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
  1495			  unsigned int clamp_value)
  1496	{
  1497		/*
  1498		 * Avoid blocked utilization pushing up the frequency when we go
  1499		 * idle (which drops the max-clamp) by retaining the last known
  1500		 * max-clamp.
  1501		 */
  1502		if (clamp_id == UCLAMP_MAX) {
  1503			rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
  1504			return clamp_value;
  1505		}
  1506	
  1507		return uclamp_none(UCLAMP_MIN);
  1508	}
  1509	
  1510	static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
  1511					     unsigned int clamp_value)
  1512	{
  1513		/* Reset max-clamp retention only on idle exit */
  1514		if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
  1515			return;
  1516	
  1517		uclamp_rq_set(rq, clamp_id, clamp_value);
  1518	}
  1519	
  1520	static inline
  1521	unsigned int uclamp_rq_max_value(struct rq *rq, enum uclamp_id clamp_id,
  1522					   unsigned int clamp_value)
  1523	{
  1524		struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
  1525		int bucket_id = UCLAMP_BUCKETS - 1;
  1526	
  1527		/*
  1528		 * Since both min and max clamps are max aggregated, find the
  1529		 * top most bucket with tasks in.
  1530		 */
  1531		for ( ; bucket_id >= 0; bucket_id--) {
  1532			if (!bucket[bucket_id].tasks)
  1533				continue;
  1534			return bucket[bucket_id].value;
  1535		}
  1536	
  1537		/* No tasks -- default clamp values */
  1538		return uclamp_idle_value(rq, clamp_id, clamp_value);
  1539	}
  1540	
  1541	static void __uclamp_update_util_min_rt_default(struct task_struct *p)
  1542	{
  1543		unsigned int default_util_min;
  1544		struct uclamp_se *uc_se;
  1545	
  1546		lockdep_assert_held(&p->pi_lock);
  1547	
  1548		uc_se = &p->uclamp_req[UCLAMP_MIN];
  1549	
  1550		/* Only sync if user didn't override the default */
  1551		if (uc_se->user_defined)
  1552			return;
  1553	
  1554		default_util_min = sysctl_sched_uclamp_util_min_rt_default;
  1555		uclamp_se_set(uc_se, default_util_min, false);
  1556	}
  1557	
  1558	static void uclamp_update_util_min_rt_default(struct task_struct *p)
  1559	{
  1560		if (!rt_task(p))
  1561			return;
  1562	
  1563		/* Protect updates to p->uclamp_* */
  1564		guard(task_rq_lock)(p);
  1565		__uclamp_update_util_min_rt_default(p);
  1566	}
  1567	
  1568	static inline struct uclamp_se
  1569	uclamp_tg_restrict(struct task_struct *p, enum uclamp_id clamp_id)
  1570	{
  1571		/* Copy by value as we could modify it */
  1572		struct uclamp_se uc_req = p->uclamp_req[clamp_id];
  1573	#ifdef CONFIG_UCLAMP_TASK_GROUP
  1574		unsigned int tg_min, tg_max, value;
  1575	
  1576		/*
  1577		 * Tasks in autogroups or root task group will be
  1578		 * restricted by system defaults.
  1579		 */
  1580		if (task_group_is_autogroup(task_group(p)))
  1581			return uc_req;
  1582		if (task_group(p) == &root_task_group)
  1583			return uc_req;
  1584	
  1585		tg_min = task_group(p)->uclamp[UCLAMP_MIN].value;
  1586		tg_max = task_group(p)->uclamp[UCLAMP_MAX].value;
  1587		value = uc_req.value;
  1588		value = clamp(value, tg_min, tg_max);
  1589		uclamp_se_set(&uc_req, value, false);
  1590	#endif
  1591	
  1592		return uc_req;
  1593	}
  1594	
  1595	/*
  1596	 * The effective clamp bucket index of a task depends on, by increasing
  1597	 * priority:
  1598	 * - the task specific clamp value, when explicitly requested from userspace
  1599	 * - the task group effective clamp value, for tasks not either in the root
  1600	 *   group or in an autogroup
  1601	 * - the system default clamp value, defined by the sysadmin
  1602	 */
  1603	static inline struct uclamp_se
  1604	uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
  1605	{
  1606		struct uclamp_se uc_req = uclamp_tg_restrict(p, clamp_id);
  1607		struct uclamp_se uc_max = uclamp_default[clamp_id];
  1608	
  1609		/* System default restrictions always apply */
  1610		if (unlikely(uc_req.value > uc_max.value))
  1611			return uc_max;
  1612	
  1613		return uc_req;
  1614	}
  1615	
  1616	unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
  1617	{
  1618		struct uclamp_se uc_eff;
  1619	
  1620		/* Task currently refcounted: use back-annotated (effective) value */
  1621		if (p->uclamp[clamp_id].active)
  1622			return (unsigned long)p->uclamp[clamp_id].value;
  1623	
  1624		uc_eff = uclamp_eff_get(p, clamp_id);
  1625	
  1626		return (unsigned long)uc_eff.value;
  1627	}
  1628	
  1629	/*
  1630	 * When a task is enqueued on a rq, the clamp bucket currently defined by the
  1631	 * task's uclamp::bucket_id is refcounted on that rq. This also immediately
  1632	 * updates the rq's clamp value if required.
  1633	 *
  1634	 * Tasks can have a task-specific value requested from user-space, track
  1635	 * within each bucket the maximum value for tasks refcounted in it.
  1636	 * This "local max aggregation" allows to track the exact "requested" value
  1637	 * for each bucket when all its RUNNABLE tasks require the same clamp.
  1638	 */
  1639	static inline void uclamp_rq_inc_id(struct rq *rq, struct task_struct *p,
  1640					    enum uclamp_id clamp_id)
  1641	{
  1642		struct uclamp_rq *uc_rq = &rq->uclamp[clamp_id];
  1643		struct uclamp_se *uc_se = &p->uclamp[clamp_id];
  1644		struct uclamp_bucket *bucket;
  1645	
  1646		lockdep_assert_rq_held(rq);
  1647	
  1648		/* Update task effective clamp */
  1649		p->uclamp[clamp_id] = uclamp_eff_get(p, clamp_id);
  1650	
  1651		bucket = &uc_rq->bucket[uc_se->bucket_id];
  1652		bucket->tasks++;
  1653		uc_se->active = true;
  1654	
  1655		uclamp_idle_reset(rq, clamp_id, uc_se->value);
  1656	
  1657		/*
  1658		 * Local max aggregation: rq buckets always track the max
  1659		 * "requested" clamp value of its RUNNABLE tasks.
  1660		 */
  1661		if (bucket->tasks == 1 || uc_se->value > bucket->value)
  1662			bucket->value = uc_se->value;
  1663	
  1664		if (uc_se->value > uclamp_rq_get(rq, clamp_id))
  1665			uclamp_rq_set(rq, clamp_id, uc_se->value);
  1666	}
  1667	
  1668	/*
  1669	 * When a task is dequeued from a rq, the clamp bucket refcounted by the task
  1670	 * is released. If this is the last task reference counting the rq's max
  1671	 * active clamp value, then the rq's clamp value is updated.
  1672	 *
  1673	 * Both refcounted tasks and rq's cached clamp values are expected to be
  1674	 * always valid. If it's detected they are not, as defensive programming,
  1675	 * enforce the expected state and warn.
  1676	 */
  1677	static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
  1678					    enum uclamp_id clamp_id)
  1679	{
  1680		struct uclamp_rq *uc_rq = &rq->uclamp[clamp_id];
  1681		struct uclamp_se *uc_se = &p->uclamp[clamp_id];
  1682		struct uclamp_bucket *bucket;
  1683		unsigned int bkt_clamp;
  1684		unsigned int rq_clamp;
  1685	
  1686		lockdep_assert_rq_held(rq);
  1687	
  1688		/*
  1689		 * If sched_uclamp_used was enabled after task @p was enqueued,
  1690		 * we could end up with unbalanced call to uclamp_rq_dec_id().
  1691		 *
  1692		 * In this case the uc_se->active flag should be false since no uclamp
  1693		 * accounting was performed at enqueue time and we can just return
  1694		 * here.
  1695		 *
  1696		 * Need to be careful of the following enqueue/dequeue ordering
  1697		 * problem too
  1698		 *
  1699		 *	enqueue(taskA)
  1700		 *	// sched_uclamp_used gets enabled
  1701		 *	enqueue(taskB)
  1702		 *	dequeue(taskA)
  1703		 *	// Must not decrement bucket->tasks here
  1704		 *	dequeue(taskB)
  1705		 *
  1706		 * where we could end up with stale data in uc_se and
  1707		 * bucket[uc_se->bucket_id].
  1708		 *
  1709		 * The following check here eliminates the possibility of such race.
  1710		 */
  1711		if (unlikely(!uc_se->active))
  1712			return;
  1713	
  1714		bucket = &uc_rq->bucket[uc_se->bucket_id];
  1715	
  1716		SCHED_WARN_ON(!bucket->tasks);
  1717		if (likely(bucket->tasks))
  1718			bucket->tasks--;
  1719	
  1720		uc_se->active = false;
  1721	
  1722		/*
  1723		 * Keep "local max aggregation" simple and accept to (possibly)
  1724		 * overboost some RUNNABLE tasks in the same bucket.
  1725		 * The rq clamp bucket value is reset to its base value whenever
  1726		 * there are no more RUNNABLE tasks refcounting it.
  1727		 */
  1728		if (likely(bucket->tasks))
  1729			return;
  1730	
  1731		rq_clamp = uclamp_rq_get(rq, clamp_id);
  1732		/*
  1733		 * Defensive programming: this should never happen. If it happens,
  1734		 * e.g. due to future modification, warn and fix up the expected value.
  1735		 */
  1736		SCHED_WARN_ON(bucket->value > rq_clamp);
  1737		if (bucket->value >= rq_clamp) {
  1738			bkt_clamp = uclamp_rq_max_value(rq, clamp_id, uc_se->value);
  1739			uclamp_rq_set(rq, clamp_id, bkt_clamp);
  1740		}
  1741	}
  1742	
  1743	static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
  1744	{
  1745		enum uclamp_id clamp_id;
  1746	
  1747		/*
  1748		 * Avoid any overhead until uclamp is actually used by the userspace.
  1749		 *
  1750		 * The condition is constructed such that a NOP is generated when
  1751		 * sched_uclamp_used is disabled.
  1752		 */
  1753		if (!static_branch_unlikely(&sched_uclamp_used))
  1754			return;
  1755	
  1756		if (unlikely(!p->sched_class->uclamp_enabled))
  1757			return;
  1758	
  1759		if (p->se.sched_delayed)
  1760			return;
  1761	
  1762		for_each_clamp_id(clamp_id)
  1763			uclamp_rq_inc_id(rq, p, clamp_id);
  1764	
  1765		/* Reset clamp idle holding when there is one RUNNABLE task */
  1766		if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
  1767			rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
  1768	}
  1769	
  1770	static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
  1771	{
  1772		enum uclamp_id clamp_id;
  1773	
  1774		/*
  1775		 * Avoid any overhead until uclamp is actually used by the userspace.
  1776		 *
  1777		 * The condition is constructed such that a NOP is generated when
  1778		 * sched_uclamp_used is disabled.
  1779		 */
  1780		if (!static_branch_unlikely(&sched_uclamp_used))
  1781			return;
  1782	
  1783		if (unlikely(!p->sched_class->uclamp_enabled))
  1784			return;
  1785	
  1786		if (p->se.sched_delayed)
  1787			return;
  1788	
  1789		for_each_clamp_id(clamp_id)
  1790			uclamp_rq_dec_id(rq, p, clamp_id);
  1791	}
  1792	
  1793	static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
  1794					      enum uclamp_id clamp_id)
  1795	{
  1796		if (!p->uclamp[clamp_id].active)
  1797			return;
  1798	
  1799		uclamp_rq_dec_id(rq, p, clamp_id);
  1800		uclamp_rq_inc_id(rq, p, clamp_id);
  1801	
  1802		/*
  1803		 * Make sure to clear the idle flag if we've transiently reached 0
  1804		 * active tasks on rq.
  1805		 */
  1806		if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
  1807			rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
  1808	}
  1809	
  1810	static inline void
  1811	uclamp_update_active(struct task_struct *p)
  1812	{
  1813		enum uclamp_id clamp_id;
  1814		struct rq_flags rf;
  1815		struct rq *rq;
  1816	
  1817		/*
  1818		 * Lock the task and the rq where the task is (or was) queued.
  1819		 *
  1820		 * We might lock the (previous) rq of a !RUNNABLE task, but that's the
  1821		 * price to pay to safely serialize util_{min,max} updates with
  1822		 * enqueues, dequeues and migration operations.
  1823		 * This is the same locking schema used by __set_cpus_allowed_ptr().
  1824		 */
  1825		rq = task_rq_lock(p, &rf);
  1826	
  1827		/*
  1828		 * Setting the clamp bucket is serialized by task_rq_lock().
  1829		 * If the task is not yet RUNNABLE and its task_struct is not
  1830		 * affecting a valid clamp bucket, the next time it's enqueued,
  1831		 * it will already see the updated clamp bucket value.
  1832		 */
  1833		for_each_clamp_id(clamp_id)
  1834			uclamp_rq_reinc_id(rq, p, clamp_id);
  1835	
  1836		task_rq_unlock(rq, p, &rf);
  1837	}
  1838	
  1839	#ifdef CONFIG_UCLAMP_TASK_GROUP
  1840	static inline void
  1841	uclamp_update_active_tasks(struct cgroup_subsys_state *css)
  1842	{
  1843		struct css_task_iter it;
  1844		struct task_struct *p;
  1845	
  1846		css_task_iter_start(css, 0, &it);
  1847		while ((p = css_task_iter_next(&it)))
  1848			uclamp_update_active(p);
  1849		css_task_iter_end(&it);
  1850	}
  1851	
  1852	static void cpu_util_update_eff(struct cgroup_subsys_state *css);
  1853	#endif
  1854	
  1855	#ifdef CONFIG_SYSCTL
  1856	#ifdef CONFIG_UCLAMP_TASK_GROUP
  1857	static void uclamp_update_root_tg(void)
  1858	{
  1859		struct task_group *tg = &root_task_group;
  1860	
  1861		uclamp_se_set(&tg->uclamp_req[UCLAMP_MIN],
  1862			      sysctl_sched_uclamp_util_min, false);
  1863		uclamp_se_set(&tg->uclamp_req[UCLAMP_MAX],
  1864			      sysctl_sched_uclamp_util_max, false);
  1865	
  1866		guard(rcu)();
  1867		cpu_util_update_eff(&root_task_group.css);
  1868	}
  1869	#else
  1870	static void uclamp_update_root_tg(void) { }
  1871	#endif
  1872	
  1873	static void uclamp_sync_util_min_rt_default(void)
  1874	{
  1875		struct task_struct *g, *p;
  1876	
  1877		/*
  1878		 * copy_process()			sysctl_uclamp
  1879		 *					  uclamp_min_rt = X;
  1880		 *   write_lock(&tasklist_lock)		  read_lock(&tasklist_lock)
  1881		 *   // link thread			  smp_mb__after_spinlock()
  1882		 *   write_unlock(&tasklist_lock)	  read_unlock(&tasklist_lock);
  1883		 *   sched_post_fork()			  for_each_process_thread()
  1884		 *     __uclamp_sync_rt()		    __uclamp_sync_rt()
  1885		 *
  1886		 * Ensures that either sched_post_fork() will observe the new
  1887		 * uclamp_min_rt or for_each_process_thread() will observe the new
  1888		 * task.
  1889		 */
  1890		read_lock(&tasklist_lock);
  1891		smp_mb__after_spinlock();
  1892		read_unlock(&tasklist_lock);
  1893	
  1894		guard(rcu)();
  1895		for_each_process_thread(g, p)
  1896			uclamp_update_util_min_rt_default(p);
  1897	}
  1898	
  1899	static int sysctl_sched_uclamp_handler(const struct ctl_table *table, int write,
  1900					void *buffer, size_t *lenp, loff_t *ppos)
  1901	{
  1902		bool update_root_tg = false;
  1903		int old_min, old_max, old_min_rt;
  1904		int result;
  1905	
  1906		guard(mutex)(&uclamp_mutex);
  1907	
  1908		old_min = sysctl_sched_uclamp_util_min;
  1909		old_max = sysctl_sched_uclamp_util_max;
  1910		old_min_rt = sysctl_sched_uclamp_util_min_rt_default;
  1911	
  1912		result = proc_dointvec(table, write, buffer, lenp, ppos);
  1913		if (result)
  1914			goto undo;
  1915		if (!write)
  1916			return 0;
  1917	
  1918		if (sysctl_sched_uclamp_util_min > sysctl_sched_uclamp_util_max ||
  1919		    sysctl_sched_uclamp_util_max > SCHED_CAPACITY_SCALE	||
  1920		    sysctl_sched_uclamp_util_min_rt_default > SCHED_CAPACITY_SCALE) {
  1921	
  1922			result = -EINVAL;
  1923			goto undo;
  1924		}
  1925	
  1926		if (old_min != sysctl_sched_uclamp_util_min) {
  1927			uclamp_se_set(&uclamp_default[UCLAMP_MIN],
  1928				      sysctl_sched_uclamp_util_min, false);
  1929			update_root_tg = true;
  1930		}
  1931		if (old_max != sysctl_sched_uclamp_util_max) {
  1932			uclamp_se_set(&uclamp_default[UCLAMP_MAX],
  1933				      sysctl_sched_uclamp_util_max, false);
  1934			update_root_tg = true;
  1935		}
  1936	
  1937		if (update_root_tg) {
  1938			static_branch_enable(&sched_uclamp_used);
  1939			uclamp_update_root_tg();
  1940		}
  1941	
  1942		if (old_min_rt != sysctl_sched_uclamp_util_min_rt_default) {
  1943			static_branch_enable(&sched_uclamp_used);
  1944			uclamp_sync_util_min_rt_default();
  1945		}
  1946	
  1947		/*
  1948		 * We update all RUNNABLE tasks only when task groups are in use.
  1949		 * Otherwise, keep it simple and do just a lazy update at each next
  1950		 * task enqueue time.
  1951		 */
  1952		return 0;
  1953	
  1954	undo:
  1955		sysctl_sched_uclamp_util_min = old_min;
  1956		sysctl_sched_uclamp_util_max = old_max;
  1957		sysctl_sched_uclamp_util_min_rt_default = old_min_rt;
  1958		return result;
  1959	}
  1960	#endif
  1961	
  1962	static void uclamp_fork(struct task_struct *p)
  1963	{
  1964		enum uclamp_id clamp_id;
  1965	
  1966		/*
  1967		 * We don't need to hold task_rq_lock() when updating p->uclamp_* here
  1968		 * as the task is still at its early fork stages.
  1969		 */
  1970		for_each_clamp_id(clamp_id)
  1971			p->uclamp[clamp_id].active = false;
  1972	
  1973		if (likely(!p->sched_reset_on_fork))
  1974			return;
  1975	
  1976		for_each_clamp_id(clamp_id) {
  1977			uclamp_se_set(&p->uclamp_req[clamp_id],
  1978				      uclamp_none(clamp_id), false);
  1979		}
  1980	}
  1981	
  1982	static void uclamp_post_fork(struct task_struct *p)
  1983	{
  1984		uclamp_update_util_min_rt_default(p);
  1985	}
  1986	
  1987	static void __init init_uclamp_rq(struct rq *rq)
  1988	{
  1989		enum uclamp_id clamp_id;
  1990		struct uclamp_rq *uc_rq = rq->uclamp;
  1991	
  1992		for_each_clamp_id(clamp_id) {
  1993			uc_rq[clamp_id] = (struct uclamp_rq) {
  1994				.value = uclamp_none(clamp_id)
  1995			};
  1996		}
  1997	
  1998		rq->uclamp_flags = UCLAMP_FLAG_IDLE;
  1999	}
  2000	
  2001	static void __init init_uclamp(void)
  2002	{
  2003		struct uclamp_se uc_max = {};
  2004		enum uclamp_id clamp_id;
  2005		int cpu;
  2006	
  2007		for_each_possible_cpu(cpu)
  2008			init_uclamp_rq(cpu_rq(cpu));
  2009	
  2010		for_each_clamp_id(clamp_id) {
  2011			uclamp_se_set(&init_task.uclamp_req[clamp_id],
  2012				      uclamp_none(clamp_id), false);
  2013		}
  2014	
  2015		/* System defaults allow max clamp values for both indexes */
  2016		uclamp_se_set(&uc_max, uclamp_none(UCLAMP_MAX), false);
  2017		for_each_clamp_id(clamp_id) {
  2018			uclamp_default[clamp_id] = uc_max;
  2019	#ifdef CONFIG_UCLAMP_TASK_GROUP
  2020			root_task_group.uclamp_req[clamp_id] = uc_max;
  2021			root_task_group.uclamp[clamp_id] = uc_max;
  2022	#endif
  2023		}
  2024	}
  2025	
  2026	#else /* !CONFIG_UCLAMP_TASK */
  2027	static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) { }
  2028	static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
  2029	static inline void uclamp_fork(struct task_struct *p) { }
  2030	static inline void uclamp_post_fork(struct task_struct *p) { }
  2031	static inline void init_uclamp(void) { }
  2032	#endif /* CONFIG_UCLAMP_TASK */
  2033	
  2034	bool sched_task_on_rq(struct task_struct *p)
  2035	{
  2036		return task_on_rq_queued(p);
  2037	}
  2038	
  2039	unsigned long get_wchan(struct task_struct *p)
  2040	{
  2041		unsigned long ip = 0;
  2042		unsigned int state;
  2043	
  2044		if (!p || p == current)
  2045			return 0;
  2046	
  2047		/* Only get wchan if task is blocked and we can keep it that way. */
  2048		raw_spin_lock_irq(&p->pi_lock);
  2049		state = READ_ONCE(p->__state);
  2050		smp_rmb(); /* see try_to_wake_up() */
  2051		if (state != TASK_RUNNING && state != TASK_WAKING && !p->on_rq)
  2052			ip = __get_wchan(p);
  2053		raw_spin_unlock_irq(&p->pi_lock);
  2054	
  2055		return ip;
  2056	}
  2057	
  2058	void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
  2059	{
  2060		if (!(flags & ENQUEUE_NOCLOCK))
  2061			update_rq_clock(rq);
  2062	
  2063		p->sched_class->enqueue_task(rq, p, flags);
  2064		/*
  2065		 * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
  2066		 * ->sched_delayed.
  2067		 */
  2068		uclamp_rq_inc(rq, p);
  2069	
  2070		psi_enqueue(p, flags);
  2071	
  2072		if (!(flags & ENQUEUE_RESTORE))
  2073			sched_info_enqueue(rq, p);
  2074	
  2075		if (sched_core_enabled(rq))
  2076			sched_core_enqueue(rq, p);
  2077	}
  2078	
  2079	/*
  2080	 * Must only return false when DEQUEUE_SLEEP.
  2081	 */
  2082	inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
  2083	{
  2084		if (sched_core_enabled(rq))
  2085			sched_core_dequeue(rq, p, flags);
  2086	
  2087		if (!(flags & DEQUEUE_NOCLOCK))
  2088			update_rq_clock(rq);
  2089	
  2090		if (!(flags & DEQUEUE_SAVE))
  2091			sched_info_dequeue(rq, p);
  2092	
  2093		psi_dequeue(p, flags);
  2094	
  2095		/*
  2096		 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
  2097		 * and mark the task ->sched_delayed.
  2098		 */
  2099		uclamp_rq_dec(rq, p);
  2100		return p->sched_class->dequeue_task(rq, p, flags);
  2101	}
  2102	
  2103	void activate_task(struct rq *rq, struct task_struct *p, int flags)
  2104	{
  2105		if (task_on_rq_migrating(p))
  2106			flags |= ENQUEUE_MIGRATED;
  2107		if (flags & ENQUEUE_MIGRATED)
  2108			sched_mm_cid_migrate_to(rq, p);
  2109	
  2110		enqueue_task(rq, p, flags);
  2111	
  2112		WRITE_ONCE(p->on_rq, TASK_ON_RQ_QUEUED);
  2113		ASSERT_EXCLUSIVE_WRITER(p->on_rq);
  2114	}
  2115	
  2116	void deactivate_task(struct rq *rq, struct task_struct *p, int flags)
  2117	{
  2118		SCHED_WARN_ON(flags & DEQUEUE_SLEEP);
  2119	
  2120		WRITE_ONCE(p->on_rq, TASK_ON_RQ_MIGRATING);
  2121		ASSERT_EXCLUSIVE_WRITER(p->on_rq);
  2122	
  2123		/*
  2124		 * Code explicitly relies on TASK_ON_RQ_MIGRATING begin set *before*
  2125		 * dequeue_task() and cleared *after* enqueue_task().
  2126		 */
  2127	
  2128		dequeue_task(rq, p, flags);
  2129	}
  2130	
  2131	static void block_task(struct rq *rq, struct task_struct *p, int flags)
  2132	{
  2133		if (dequeue_task(rq, p, DEQUEUE_SLEEP | flags))
  2134			__block_task(rq, p);
  2135	}
  2136	
  2137	/**
  2138	 * task_curr - is this task currently executing on a CPU?
  2139	 * @p: the task in question.
  2140	 *
  2141	 * Return: 1 if the task is currently executing. 0 otherwise.
  2142	 */
  2143	inline int task_curr(const struct task_struct *p)
  2144	{
  2145		return cpu_curr(task_cpu(p)) == p;
  2146	}
  2147	
  2148	/*
  2149	 * ->switching_to() is called with the pi_lock and rq_lock held and must not
  2150	 * mess with locking.
  2151	 */
  2152	void check_class_changing(struct rq *rq, struct task_struct *p,
  2153				  const struct sched_class *prev_class)
  2154	{
  2155		if (prev_class != p->sched_class && p->sched_class->switching_to)
  2156			p->sched_class->switching_to(rq, p);
  2157	}
  2158	
  2159	/*
  2160	 * switched_from, switched_to and prio_changed must _NOT_ drop rq->lock,
  2161	 * use the balance_callback list if you want balancing.
  2162	 *
  2163	 * this means any call to check_class_changed() must be followed by a call to
  2164	 * balance_callback().
  2165	 */
  2166	void check_class_changed(struct rq *rq, struct task_struct *p,
  2167				 const struct sched_class *prev_class,
  2168				 int oldprio)
  2169	{
  2170		if (prev_class != p->sched_class) {
  2171			if (prev_class->switched_from)
  2172				prev_class->switched_from(rq, p);
  2173	
  2174			p->sched_class->switched_to(rq, p);
  2175		} else if (oldprio != p->prio || dl_task(p))
  2176			p->sched_class->prio_changed(rq, p, oldprio);
  2177	}
  2178	
  2179	void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
  2180	{
  2181		struct task_struct *donor = rq->donor;
  2182	
  2183		if (p->sched_class == donor->sched_class)
  2184			donor->sched_class->wakeup_preempt(rq, p, flags);
  2185		else if (sched_class_above(p->sched_class, donor->sched_class))
  2186			resched_curr(rq);
  2187	
  2188		/*
  2189		 * A queue event has occurred, and we're going to schedule.  In
  2190		 * this case, we can save a useless back to back clock update.
  2191		 */
  2192		if (task_on_rq_queued(donor) && test_tsk_need_resched(rq->curr))
  2193			rq_clock_skip_update(rq);
  2194	}
  2195	
  2196	static __always_inline
  2197	int __task_state_match(struct task_struct *p, unsigned int state)
  2198	{
  2199		if (READ_ONCE(p->__state) & state)
  2200			return 1;
  2201	
  2202		if (READ_ONCE(p->saved_state) & state)
  2203			return -1;
  2204	
  2205		return 0;
  2206	}
  2207	
  2208	static __always_inline
  2209	int task_state_match(struct task_struct *p, unsigned int state)
  2210	{
  2211		/*
  2212		 * Serialize against current_save_and_set_rtlock_wait_state(),
  2213		 * current_restore_rtlock_saved_state(), and __refrigerator().
  2214		 */
  2215		guard(raw_spinlock_irq)(&p->pi_lock);
  2216		return __task_state_match(p, state);
  2217	}
  2218	
  2219	/*
  2220	 * wait_task_inactive - wait for a thread to unschedule.
  2221	 *
  2222	 * Wait for the thread to block in any of the states set in @match_state.
  2223	 * If it changes, i.e. @p might have woken up, then return zero.  When we
  2224	 * succeed in waiting for @p to be off its CPU, we return a positive number
  2225	 * (its total switch count).  If a second call a short while later returns the
  2226	 * same number, the caller can be sure that @p has remained unscheduled the
  2227	 * whole time.
  2228	 *
  2229	 * The caller must ensure that the task *will* unschedule sometime soon,
  2230	 * else this function might spin for a *long* time. This function can't
  2231	 * be called with interrupts off, or it may introduce deadlock with
  2232	 * smp_call_function() if an IPI is sent by the same process we are
  2233	 * waiting to become inactive.
  2234	 */
  2235	unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state)
  2236	{
  2237		int running, queued, match;
  2238		struct rq_flags rf;
  2239		unsigned long ncsw;
  2240		struct rq *rq;
  2241	
  2242		for (;;) {
  2243			/*
  2244			 * We do the initial early heuristics without holding
  2245			 * any task-queue locks at all. We'll only try to get
  2246			 * the runqueue lock when things look like they will
  2247			 * work out!
  2248			 */
  2249			rq = task_rq(p);
  2250	
  2251			/*
  2252			 * If the task is actively running on another CPU
  2253			 * still, just relax and busy-wait without holding
  2254			 * any locks.
  2255			 *
  2256			 * NOTE! Since we don't hold any locks, it's not
  2257			 * even sure that "rq" stays as the right runqueue!
  2258			 * But we don't care, since "task_on_cpu()" will
  2259			 * return false if the runqueue has changed and p
  2260			 * is actually now running somewhere else!
  2261			 */
  2262			while (task_on_cpu(rq, p)) {
  2263				if (!task_state_match(p, match_state))
  2264					return 0;
  2265				cpu_relax();
  2266			}
  2267	
  2268			/*
  2269			 * Ok, time to look more closely! We need the rq
  2270			 * lock now, to be *sure*. If we're wrong, we'll
  2271			 * just go back and repeat.
  2272			 */
  2273			rq = task_rq_lock(p, &rf);
  2274			trace_sched_wait_task(p);
  2275			running = task_on_cpu(rq, p);
  2276			queued = task_on_rq_queued(p);
  2277			ncsw = 0;
  2278			if ((match = __task_state_match(p, match_state))) {
  2279				/*
  2280				 * When matching on p->saved_state, consider this task
  2281				 * still queued so it will wait.
  2282				 */
  2283				if (match < 0)
  2284					queued = 1;
  2285				ncsw = p->nvcsw | LONG_MIN; /* sets MSB */
  2286			}
  2287			task_rq_unlock(rq, p, &rf);
  2288	
  2289			/*
  2290			 * If it changed from the expected state, bail out now.
  2291			 */
  2292			if (unlikely(!ncsw))
  2293				break;
  2294	
  2295			/*
  2296			 * Was it really running after all now that we
  2297			 * checked with the proper locks actually held?
  2298			 *
  2299			 * Oops. Go back and try again..
  2300			 */
  2301			if (unlikely(running)) {
  2302				cpu_relax();
  2303				continue;
  2304			}
  2305	
  2306			/*
  2307			 * It's not enough that it's not actively running,
  2308			 * it must be off the runqueue _entirely_, and not
  2309			 * preempted!
  2310			 *
  2311			 * So if it was still runnable (but just not actively
  2312			 * running right now), it's preempted, and we should
  2313			 * yield - it could be a while.
  2314			 */
  2315			if (unlikely(queued)) {
  2316				ktime_t to = NSEC_PER_SEC / HZ;
  2317	
  2318				set_current_state(TASK_UNINTERRUPTIBLE);
  2319				schedule_hrtimeout(&to, HRTIMER_MODE_REL_HARD);
  2320				continue;
  2321			}
  2322	
  2323			/*
  2324			 * Ahh, all good. It wasn't running, and it wasn't
  2325			 * runnable, which means that it will never become
  2326			 * running in the future either. We're all done!
  2327			 */
  2328			break;
  2329		}
  2330	
  2331		return ncsw;
  2332	}
  2333	
  2334	#ifdef CONFIG_SMP
  2335	
  2336	static void
  2337	__do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx);
  2338	
  2339	static void migrate_disable_switch(struct rq *rq, struct task_struct *p)
  2340	{
  2341		struct affinity_context ac = {
  2342			.new_mask  = cpumask_of(rq->cpu),
  2343			.flags     = SCA_MIGRATE_DISABLE,
  2344		};
  2345	
  2346		if (likely(!p->migration_disabled))
  2347			return;
  2348	
  2349		if (p->cpus_ptr != &p->cpus_mask)
  2350			return;
  2351	
  2352		/*
  2353		 * Violates locking rules! See comment in __do_set_cpus_allowed().
  2354		 */
  2355		__do_set_cpus_allowed(p, &ac);
  2356	}
  2357	
  2358	void migrate_disable(void)
  2359	{
  2360		struct task_struct *p = current;
  2361	
  2362		if (p->migration_disabled) {
  2363	#ifdef CONFIG_DEBUG_PREEMPT
  2364			/*
  2365			 *Warn about overflow half-way through the range.
  2366			 */
  2367			WARN_ON_ONCE((s16)p->migration_disabled < 0);
  2368	#endif
  2369			p->migration_disabled++;
  2370			return;
  2371		}
  2372	
  2373		guard(preempt)();
  2374		this_rq()->nr_pinned++;
  2375		p->migration_disabled = 1;
  2376	}
  2377	EXPORT_SYMBOL_GPL(migrate_disable);
  2378	
  2379	void migrate_enable(void)
  2380	{
  2381		struct task_struct *p = current;
  2382		struct affinity_context ac = {
  2383			.new_mask  = &p->cpus_mask,
  2384			.flags     = SCA_MIGRATE_ENABLE,
  2385		};
  2386	
  2387	#ifdef CONFIG_DEBUG_PREEMPT
  2388		/*
  2389		 * Check both overflow from migrate_disable() and superfluous
  2390		 * migrate_enable().
  2391		 */
  2392		if (WARN_ON_ONCE((s16)p->migration_disabled <= 0))
  2393			return;
  2394	#endif
  2395	
  2396		if (p->migration_disabled > 1) {
  2397			p->migration_disabled--;
  2398			return;
  2399		}
  2400	
  2401		/*
  2402		 * Ensure stop_task runs either before or after this, and that
  2403		 * __set_cpus_allowed_ptr(SCA_MIGRATE_ENABLE) doesn't schedule().
  2404		 */
  2405		guard(preempt)();
  2406		if (p->cpus_ptr != &p->cpus_mask)
  2407			__set_cpus_allowed_ptr(p, &ac);
  2408		/*
  2409		 * Mustn't clear migration_disabled() until cpus_ptr points back at the
  2410		 * regular cpus_mask, otherwise things that race (eg.
  2411		 * select_fallback_rq) get confused.
  2412		 */
  2413		barrier();
  2414		p->migration_disabled = 0;
  2415		this_rq()->nr_pinned--;
  2416	}
  2417	EXPORT_SYMBOL_GPL(migrate_enable);
  2418	
  2419	static inline bool rq_has_pinned_tasks(struct rq *rq)
  2420	{
  2421		return rq->nr_pinned;
  2422	}
  2423	
  2424	/*
  2425	 * Per-CPU kthreads are allowed to run on !active && online CPUs, see
  2426	 * __set_cpus_allowed_ptr() and select_fallback_rq().
  2427	 */
  2428	static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  2429	{
  2430		/* When not in the task's cpumask, no point in looking further. */
  2431		if (!task_allowed_on_cpu(p, cpu))
  2432			return false;
  2433	
  2434		/* migrate_disabled() must be allowed to finish. */
  2435		if (is_migration_disabled(p))
  2436			return cpu_online(cpu);
  2437	
  2438		/* Non kernel threads are not allowed during either online or offline. */
  2439		if (!(p->flags & PF_KTHREAD))
  2440			return cpu_active(cpu);
  2441	
  2442		/* KTHREAD_IS_PER_CPU is always allowed. */
  2443		if (kthread_is_per_cpu(p))
  2444			return cpu_online(cpu);
  2445	
  2446		/* Regular kernel threads don't get to stay during offline. */
  2447		if (cpu_dying(cpu))
  2448			return false;
  2449	
  2450		/* But are allowed during online. */
  2451		return cpu_online(cpu);
  2452	}
  2453	
  2454	/*
  2455	 * This is how migration works:
  2456	 *
  2457	 * 1) we invoke migration_cpu_stop() on the target CPU using
  2458	 *    stop_one_cpu().
  2459	 * 2) stopper starts to run (implicitly forcing the migrated thread
  2460	 *    off the CPU)
  2461	 * 3) it checks whether the migrated task is still in the wrong runqueue.
  2462	 * 4) if it's in the wrong runqueue then the migration thread removes
  2463	 *    it and puts it into the right queue.
  2464	 * 5) stopper completes and stop_one_cpu() returns and the migration
  2465	 *    is done.
  2466	 */
  2467	
  2468	/*
  2469	 * move_queued_task - move a queued task to new rq.
  2470	 *
  2471	 * Returns (locked) new rq. Old rq's lock is released.
  2472	 */
  2473	static struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
  2474					   struct task_struct *p, int new_cpu)
  2475	{
  2476		lockdep_assert_rq_held(rq);
  2477	
  2478		deactivate_task(rq, p, DEQUEUE_NOCLOCK);
  2479		set_task_cpu(p, new_cpu);
  2480		rq_unlock(rq, rf);
  2481	
  2482		rq = cpu_rq(new_cpu);
  2483	
  2484		rq_lock(rq, rf);
  2485		WARN_ON_ONCE(task_cpu(p) != new_cpu);
  2486		activate_task(rq, p, 0);
  2487		wakeup_preempt(rq, p, 0);
  2488	
  2489		return rq;
  2490	}
  2491	
  2492	struct migration_arg {
  2493		struct task_struct		*task;
  2494		int				dest_cpu;
  2495		struct set_affinity_pending	*pending;
  2496	};
  2497	
  2498	/*
  2499	 * @refs: number of wait_for_completion()
  2500	 * @stop_pending: is @stop_work in use
  2501	 */
  2502	struct set_affinity_pending {
  2503		refcount_t		refs;
  2504		unsigned int		stop_pending;
  2505		struct completion	done;
  2506		struct cpu_stop_work	stop_work;
  2507		struct migration_arg	arg;
  2508	};
  2509	
  2510	/*
  2511	 * Move (not current) task off this CPU, onto the destination CPU. We're doing
  2512	 * this because either it can't run here any more (set_cpus_allowed()
  2513	 * away from this CPU, or CPU going down), or because we're
  2514	 * attempting to rebalance this task on exec (sched_exec).
  2515	 *
  2516	 * So we race with normal scheduler movements, but that's OK, as long
  2517	 * as the task is no longer on this CPU.
  2518	 */
  2519	static struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
  2520					 struct task_struct *p, int dest_cpu)
  2521	{
  2522		/* Affinity changed (again). */
  2523		if (!is_cpu_allowed(p, dest_cpu))
  2524			return rq;
  2525	
  2526		rq = move_queued_task(rq, rf, p, dest_cpu);
  2527	
  2528		return rq;
  2529	}
  2530	
  2531	/*
  2532	 * migration_cpu_stop - this will be executed by a high-prio stopper thread
  2533	 * and performs thread migration by bumping thread off CPU then
  2534	 * 'pushing' onto another runqueue.
  2535	 */
  2536	static int migration_cpu_stop(void *data)
  2537	{
  2538		struct migration_arg *arg = data;
  2539		struct set_affinity_pending *pending = arg->pending;
  2540		struct task_struct *p = arg->task;
  2541		struct rq *rq = this_rq();
  2542		bool complete = false;
  2543		struct rq_flags rf;
  2544	
  2545		/*
  2546		 * The original target CPU might have gone down and we might
  2547		 * be on another CPU but it doesn't matter.
  2548		 */
  2549		local_irq_save(rf.flags);
  2550		/*
  2551		 * We need to explicitly wake pending tasks before running
  2552		 * __migrate_task() such that we will not miss enforcing cpus_ptr
  2553		 * during wakeups, see set_cpus_allowed_ptr()'s TASK_WAKING test.
  2554		 */
  2555		flush_smp_call_function_queue();
  2556	
  2557		raw_spin_lock(&p->pi_lock);
  2558		rq_lock(rq, &rf);
  2559	
  2560		/*
  2561		 * If we were passed a pending, then ->stop_pending was set, thus
  2562		 * p->migration_pending must have remained stable.
  2563		 */
  2564		WARN_ON_ONCE(pending && pending != p->migration_pending);
  2565	
  2566		/*
  2567		 * If task_rq(p) != rq, it cannot be migrated here, because we're
  2568		 * holding rq->lock, if p->on_rq == 0 it cannot get enqueued because
  2569		 * we're holding p->pi_lock.
  2570		 */
  2571		if (task_rq(p) == rq) {
  2572			if (is_migration_disabled(p))
  2573				goto out;
  2574	
  2575			if (pending) {
  2576				p->migration_pending = NULL;
  2577				complete = true;
  2578	
  2579				if (cpumask_test_cpu(task_cpu(p), &p->cpus_mask))
  2580					goto out;
  2581			}
  2582	
  2583			if (task_on_rq_queued(p)) {
  2584				update_rq_clock(rq);
  2585				rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
  2586			} else {
  2587				p->wake_cpu = arg->dest_cpu;
  2588			}
  2589	
  2590			/*
  2591			 * XXX __migrate_task() can fail, at which point we might end
  2592			 * up running on a dodgy CPU, AFAICT this can only happen
  2593			 * during CPU hotplug, at which point we'll get pushed out
  2594			 * anyway, so it's probably not a big deal.
  2595			 */
  2596	
  2597		} else if (pending) {
  2598			/*
  2599			 * This happens when we get migrated between migrate_enable()'s
  2600			 * preempt_enable() and scheduling the stopper task. At that
  2601			 * point we're a regular task again and not current anymore.
  2602			 *
  2603			 * A !PREEMPT kernel has a giant hole here, which makes it far
  2604			 * more likely.
  2605			 */
  2606	
  2607			/*
  2608			 * The task moved before the stopper got to run. We're holding
  2609			 * ->pi_lock, so the allowed mask is stable - if it got
  2610			 * somewhere allowed, we're done.
  2611			 */
  2612			if (cpumask_test_cpu(task_cpu(p), p->cpus_ptr)) {
  2613				p->migration_pending = NULL;
  2614				complete = true;
  2615				goto out;
  2616			}
  2617	
  2618			/*
  2619			 * When migrate_enable() hits a rq mis-match we can't reliably
  2620			 * determine is_migration_disabled() and so have to chase after
  2621			 * it.
  2622			 */
  2623			WARN_ON_ONCE(!pending->stop_pending);
  2624			preempt_disable();
  2625			task_rq_unlock(rq, p, &rf);
  2626			stop_one_cpu_nowait(task_cpu(p), migration_cpu_stop,
  2627					    &pending->arg, &pending->stop_work);
  2628			preempt_enable();
  2629			return 0;
  2630		}
  2631	out:
  2632		if (pending)
  2633			pending->stop_pending = false;
  2634		task_rq_unlock(rq, p, &rf);
  2635	
  2636		if (complete)
  2637			complete_all(&pending->done);
  2638	
  2639		return 0;
  2640	}
  2641	
  2642	int push_cpu_stop(void *arg)
  2643	{
  2644		struct rq *lowest_rq = NULL, *rq = this_rq();
  2645		struct task_struct *p = arg;
  2646	
  2647		raw_spin_lock_irq(&p->pi_lock);
  2648		raw_spin_rq_lock(rq);
  2649	
  2650		if (task_rq(p) != rq)
  2651			goto out_unlock;
  2652	
  2653		if (is_migration_disabled(p)) {
  2654			p->migration_flags |= MDF_PUSH;
  2655			goto out_unlock;
  2656		}
  2657	
  2658		p->migration_flags &= ~MDF_PUSH;
  2659	
  2660		if (p->sched_class->find_lock_rq)
  2661			lowest_rq = p->sched_class->find_lock_rq(p, rq);
  2662	
  2663		if (!lowest_rq)
  2664			goto out_unlock;
  2665	
  2666		// XXX validate p is still the highest prio task
  2667		if (task_rq(p) == rq) {
  2668			move_queued_task_locked(rq, lowest_rq, p);
  2669			resched_curr(lowest_rq);
  2670		}
  2671	
  2672		double_unlock_balance(rq, lowest_rq);
  2673	
  2674	out_unlock:
  2675		rq->push_busy = false;
  2676		raw_spin_rq_unlock(rq);
  2677		raw_spin_unlock_irq(&p->pi_lock);
  2678	
  2679		put_task_struct(p);
  2680		return 0;
  2681	}
  2682	
  2683	/*
  2684	 * sched_class::set_cpus_allowed must do the below, but is not required to
  2685	 * actually call this function.
  2686	 */
  2687	void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
  2688	{
  2689		if (ctx->flags & (SCA_MIGRATE_ENABLE | SCA_MIGRATE_DISABLE)) {
  2690			p->cpus_ptr = ctx->new_mask;
  2691			return;
  2692		}
  2693	
  2694		cpumask_copy(&p->cpus_mask, ctx->new_mask);
  2695		p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
  2696	
  2697		/*
  2698		 * Swap in a new user_cpus_ptr if SCA_USER flag set
  2699		 */
  2700		if (ctx->flags & SCA_USER)
  2701			swap(p->user_cpus_ptr, ctx->user_mask);
  2702	}
  2703	
  2704	static void
  2705	__do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
  2706	{
  2707		struct rq *rq = task_rq(p);
  2708		bool queued, running;
  2709	
  2710		/*
  2711		 * This here violates the locking rules for affinity, since we're only
  2712		 * supposed to change these variables while holding both rq->lock and
  2713		 * p->pi_lock.
  2714		 *
  2715		 * HOWEVER, it magically works, because ttwu() is the only code that
  2716		 * accesses these variables under p->pi_lock and only does so after
  2717		 * smp_cond_load_acquire(&p->on_cpu, !VAL), and we're in __schedule()
  2718		 * before finish_task().
  2719		 *
  2720		 * XXX do further audits, this smells like something putrid.
  2721		 */
  2722		if (ctx->flags & SCA_MIGRATE_DISABLE)
  2723			SCHED_WARN_ON(!p->on_cpu);
  2724		else
  2725			lockdep_assert_held(&p->pi_lock);
  2726	
  2727		queued = task_on_rq_queued(p);
  2728		running = task_current_donor(rq, p);
  2729	
  2730		if (queued) {
  2731			/*
  2732			 * Because __kthread_bind() calls this on blocked tasks without
  2733			 * holding rq->lock.
  2734			 */
  2735			lockdep_assert_rq_held(rq);
  2736			dequeue_task(rq, p, DEQUEUE_SAVE | DEQUEUE_NOCLOCK);
  2737		}
  2738		if (running)
  2739			put_prev_task(rq, p);
  2740	
  2741		p->sched_class->set_cpus_allowed(p, ctx);
  2742		mm_set_cpus_allowed(p->mm, ctx->new_mask);
  2743	
  2744		if (queued)
  2745			enqueue_task(rq, p, ENQUEUE_RESTORE | ENQUEUE_NOCLOCK);
  2746		if (running)
  2747			set_next_task(rq, p);
  2748	}
  2749	
  2750	/*
  2751	 * Used for kthread_bind() and select_fallback_rq(), in both cases the user
  2752	 * affinity (if any) should be destroyed too.
  2753	 */
  2754	void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
  2755	{
  2756		struct affinity_context ac = {
  2757			.new_mask  = new_mask,
  2758			.user_mask = NULL,
  2759			.flags     = SCA_USER,	/* clear the user requested mask */
  2760		};
  2761		union cpumask_rcuhead {
  2762			cpumask_t cpumask;
  2763			struct rcu_head rcu;
  2764		};
  2765	
  2766		__do_set_cpus_allowed(p, &ac);
  2767	
  2768		/*
  2769		 * Because this is called with p->pi_lock held, it is not possible
  2770		 * to use kfree() here (when PREEMPT_RT=y), therefore punt to using
  2771		 * kfree_rcu().
  2772		 */
  2773		kfree_rcu((union cpumask_rcuhead *)ac.user_mask, rcu);
  2774	}
  2775	
  2776	int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src,
  2777			      int node)
  2778	{
  2779		cpumask_t *user_mask;
  2780		unsigned long flags;
  2781	
  2782		/*
  2783		 * Always clear dst->user_cpus_ptr first as their user_cpus_ptr's
  2784		 * may differ by now due to racing.
  2785		 */
  2786		dst->user_cpus_ptr = NULL;
  2787	
  2788		/*
  2789		 * This check is racy and losing the race is a valid situation.
  2790		 * It is not worth the extra overhead of taking the pi_lock on
  2791		 * every fork/clone.
  2792		 */
  2793		if (data_race(!src->user_cpus_ptr))
  2794			return 0;
  2795	
  2796		user_mask = alloc_user_cpus_ptr(node);
  2797		if (!user_mask)
  2798			return -ENOMEM;
  2799	
  2800		/*
  2801		 * Use pi_lock to protect content of user_cpus_ptr
  2802		 *
  2803		 * Though unlikely, user_cpus_ptr can be reset to NULL by a concurrent
  2804		 * do_set_cpus_allowed().
  2805		 */
  2806		raw_spin_lock_irqsave(&src->pi_lock, flags);
  2807		if (src->user_cpus_ptr) {
  2808			swap(dst->user_cpus_ptr, user_mask);
  2809			cpumask_copy(dst->user_cpus_ptr, src->user_cpus_ptr);
  2810		}
  2811		raw_spin_unlock_irqrestore(&src->pi_lock, flags);
  2812	
  2813		if (unlikely(user_mask))
  2814			kfree(user_mask);
  2815	
  2816		return 0;
  2817	}
  2818	
  2819	static inline struct cpumask *clear_user_cpus_ptr(struct task_struct *p)
  2820	{
  2821		struct cpumask *user_mask = NULL;
  2822	
  2823		swap(p->user_cpus_ptr, user_mask);
  2824	
  2825		return user_mask;
  2826	}
  2827	
  2828	void release_user_cpus_ptr(struct task_struct *p)
  2829	{
  2830		kfree(clear_user_cpus_ptr(p));
  2831	}
  2832	
  2833	/*
  2834	 * This function is wildly self concurrent; here be dragons.
  2835	 *
  2836	 *
  2837	 * When given a valid mask, __set_cpus_allowed_ptr() must block until the
  2838	 * designated task is enqueued on an allowed CPU. If that task is currently
  2839	 * running, we have to kick it out using the CPU stopper.
  2840	 *
  2841	 * Migrate-Disable comes along and tramples all over our nice sandcastle.
  2842	 * Consider:
  2843	 *
  2844	 *     Initial conditions: P0->cpus_mask = [0, 1]
  2845	 *
  2846	 *     P0@CPU0                  P1
  2847	 *
  2848	 *     migrate_disable();
  2849	 *     <preempted>
  2850	 *                              set_cpus_allowed_ptr(P0, [1]);
  2851	 *
  2852	 * P1 *cannot* return from this set_cpus_allowed_ptr() call until P0 executes
  2853	 * its outermost migrate_enable() (i.e. it exits its Migrate-Disable region).
  2854	 * This means we need the following scheme:
  2855	 *
  2856	 *     P0@CPU0                  P1
  2857	 *
  2858	 *     migrate_disable();
  2859	 *     <preempted>
  2860	 *                              set_cpus_allowed_ptr(P0, [1]);
  2861	 *                                <blocks>
  2862	 *     <resumes>
  2863	 *     migrate_enable();
  2864	 *       __set_cpus_allowed_ptr();
  2865	 *       <wakes local stopper>
  2866	 *                         `--> <woken on migration completion>
  2867	 *
  2868	 * Now the fun stuff: there may be several P1-like tasks, i.e. multiple
  2869	 * concurrent set_cpus_allowed_ptr(P0, [*]) calls. CPU affinity changes of any
  2870	 * task p are serialized by p->pi_lock, which we can leverage: the one that
  2871	 * should come into effect at the end of the Migrate-Disable region is the last
  2872	 * one. This means we only need to track a single cpumask (i.e. p->cpus_mask),
  2873	 * but we still need to properly signal those waiting tasks at the appropriate
  2874	 * moment.
  2875	 *
  2876	 * This is implemented using struct set_affinity_pending. The first
  2877	 * __set_cpus_allowed_ptr() caller within a given Migrate-Disable region will
  2878	 * setup an instance of that struct and install it on the targeted task_struct.
  2879	 * Any and all further callers will reuse that instance. Those then wait for
  2880	 * a completion signaled at the tail of the CPU stopper callback (1), triggered
  2881	 * on the end of the Migrate-Disable region (i.e. outermost migrate_enable()).
  2882	 *
  2883	 *
  2884	 * (1) In the cases covered above. There is one more where the completion is
  2885	 * signaled within affine_move_task() itself: when a subsequent affinity request
  2886	 * occurs after the stopper bailed out due to the targeted task still being
  2887	 * Migrate-Disable. Consider:
  2888	 *
  2889	 *     Initial conditions: P0->cpus_mask = [0, 1]
  2890	 *
  2891	 *     CPU0		  P1				P2
  2892	 *     <P0>
  2893	 *       migrate_disable();
  2894	 *       <preempted>
  2895	 *                        set_cpus_allowed_ptr(P0, [1]);
  2896	 *                          <blocks>
  2897	 *     <migration/0>
  2898	 *       migration_cpu_stop()
  2899	 *         is_migration_disabled()
  2900	 *           <bails>
  2901	 *                                                       set_cpus_allowed_ptr(P0, [0, 1]);
  2902	 *                                                         <signal completion>
  2903	 *                          <awakes>
  2904	 *
  2905	 * Note that the above is safe vs a concurrent migrate_enable(), as any
  2906	 * pending affinity completion is preceded by an uninstallation of
  2907	 * p->migration_pending done with p->pi_lock held.
  2908	 */
  2909	static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flags *rf,
  2910				    int dest_cpu, unsigned int flags)
  2911		__releases(rq->lock)
  2912		__releases(p->pi_lock)
  2913	{
  2914		struct set_affinity_pending my_pending = { }, *pending = NULL;
  2915		bool stop_pending, complete = false;
  2916	
  2917		/* Can the task run on the task's current CPU? If so, we're done */
  2918		if (cpumask_test_cpu(task_cpu(p), &p->cpus_mask)) {
  2919			struct task_struct *push_task = NULL;
  2920	
  2921			if ((flags & SCA_MIGRATE_ENABLE) &&
  2922			    (p->migration_flags & MDF_PUSH) && !rq->push_busy) {
  2923				rq->push_busy = true;
  2924				push_task = get_task_struct(p);
  2925			}
  2926	
  2927			/*
  2928			 * If there are pending waiters, but no pending stop_work,
  2929			 * then complete now.
  2930			 */
  2931			pending = p->migration_pending;
  2932			if (pending && !pending->stop_pending) {
  2933				p->migration_pending = NULL;
  2934				complete = true;
  2935			}
  2936	
  2937			preempt_disable();
  2938			task_rq_unlock(rq, p, rf);
  2939			if (push_task) {
  2940				stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
  2941						    p, &rq->push_work);
  2942			}
  2943			preempt_enable();
  2944	
  2945			if (complete)
  2946				complete_all(&pending->done);
  2947	
  2948			return 0;
  2949		}
  2950	
  2951		if (!(flags & SCA_MIGRATE_ENABLE)) {
  2952			/* serialized by p->pi_lock */
  2953			if (!p->migration_pending) {
  2954				/* Install the request */
  2955				refcount_set(&my_pending.refs, 1);
  2956				init_completion(&my_pending.done);
  2957				my_pending.arg = (struct migration_arg) {
  2958					.task = p,
  2959					.dest_cpu = dest_cpu,
  2960					.pending = &my_pending,
  2961				};
  2962	
  2963				p->migration_pending = &my_pending;
  2964			} else {
  2965				pending = p->migration_pending;
  2966				refcount_inc(&pending->refs);
  2967				/*
  2968				 * Affinity has changed, but we've already installed a
  2969				 * pending. migration_cpu_stop() *must* see this, else
  2970				 * we risk a completion of the pending despite having a
  2971				 * task on a disallowed CPU.
  2972				 *
  2973				 * Serialized by p->pi_lock, so this is safe.
  2974				 */
  2975				pending->arg.dest_cpu = dest_cpu;
  2976			}
  2977		}
  2978		pending = p->migration_pending;
  2979		/*
  2980		 * - !MIGRATE_ENABLE:
  2981		 *   we'll have installed a pending if there wasn't one already.
  2982		 *
  2983		 * - MIGRATE_ENABLE:
  2984		 *   we're here because the current CPU isn't matching anymore,
  2985		 *   the only way that can happen is because of a concurrent
  2986		 *   set_cpus_allowed_ptr() call, which should then still be
  2987		 *   pending completion.
  2988		 *
  2989		 * Either way, we really should have a @pending here.
  2990		 */
  2991		if (WARN_ON_ONCE(!pending)) {
  2992			task_rq_unlock(rq, p, rf);
  2993			return -EINVAL;
  2994		}
  2995	
  2996		if (task_on_cpu(rq, p) || READ_ONCE(p->__state) == TASK_WAKING) {
  2997			/*
  2998			 * MIGRATE_ENABLE gets here because 'p == current', but for
  2999			 * anything else we cannot do is_migration_disabled(), punt
  3000			 * and have the stopper function handle it all race-free.
  3001			 */
  3002			stop_pending = pending->stop_pending;
  3003			if (!stop_pending)
  3004				pending->stop_pending = true;
  3005	
  3006			if (flags & SCA_MIGRATE_ENABLE)
  3007				p->migration_flags &= ~MDF_PUSH;
  3008	
  3009			preempt_disable();
  3010			task_rq_unlock(rq, p, rf);
  3011			if (!stop_pending) {
  3012				stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
  3013						    &pending->arg, &pending->stop_work);
  3014			}
  3015			preempt_enable();
  3016	
  3017			if (flags & SCA_MIGRATE_ENABLE)
  3018				return 0;
  3019		} else {
  3020	
  3021			if (!is_migration_disabled(p)) {
  3022				if (task_on_rq_queued(p))
  3023					rq = move_queued_task(rq, rf, p, dest_cpu);
  3024	
  3025				if (!pending->stop_pending) {
  3026					p->migration_pending = NULL;
  3027					complete = true;
  3028				}
  3029			}
  3030			task_rq_unlock(rq, p, rf);
  3031	
  3032			if (complete)
  3033				complete_all(&pending->done);
  3034		}
  3035	
  3036		wait_for_completion(&pending->done);
  3037	
  3038		if (refcount_dec_and_test(&pending->refs))
  3039			wake_up_var(&pending->refs); /* No UaF, just an address */
  3040	
  3041		/*
  3042		 * Block the original owner of &pending until all subsequent callers
  3043		 * have seen the completion and decremented the refcount
  3044		 */
  3045		wait_var_event(&my_pending.refs, !refcount_read(&my_pending.refs));
  3046	
  3047		/* ARGH */
  3048		WARN_ON_ONCE(my_pending.stop_pending);
  3049	
  3050		return 0;
  3051	}
  3052	
  3053	/*
  3054	 * Called with both p->pi_lock and rq->lock held; drops both before returning.
  3055	 */
  3056	static int __set_cpus_allowed_ptr_locked(struct task_struct *p,
  3057						 struct affinity_context *ctx,
  3058						 struct rq *rq,
  3059						 struct rq_flags *rf)
  3060		__releases(rq->lock)
  3061		__releases(p->pi_lock)
  3062	{
  3063		const struct cpumask *cpu_allowed_mask = task_cpu_possible_mask(p);
  3064		const struct cpumask *cpu_valid_mask = cpu_active_mask;
  3065		bool kthread = p->flags & PF_KTHREAD;
  3066		unsigned int dest_cpu;
  3067		int ret = 0;
  3068	
  3069		update_rq_clock(rq);
  3070	
  3071		if (kthread || is_migration_disabled(p)) {
  3072			/*
  3073			 * Kernel threads are allowed on online && !active CPUs,
  3074			 * however, during cpu-hot-unplug, even these might get pushed
  3075			 * away if not KTHREAD_IS_PER_CPU.
  3076			 *
  3077			 * Specifically, migration_disabled() tasks must not fail the
  3078			 * cpumask_any_and_distribute() pick below, esp. so on
  3079			 * SCA_MIGRATE_ENABLE, otherwise we'll not call
  3080			 * set_cpus_allowed_common() and actually reset p->cpus_ptr.
  3081			 */
  3082			cpu_valid_mask = cpu_online_mask;
  3083		}
  3084	
  3085		if (!kthread && !cpumask_subset(ctx->new_mask, cpu_allowed_mask)) {
  3086			ret = -EINVAL;
  3087			goto out;
  3088		}
  3089	
  3090		/*
  3091		 * Must re-check here, to close a race against __kthread_bind(),
  3092		 * sched_setaffinity() is not guaranteed to observe the flag.
  3093		 */
  3094		if ((ctx->flags & SCA_CHECK) && (p->flags & PF_NO_SETAFFINITY)) {
  3095			ret = -EINVAL;
  3096			goto out;
  3097		}
  3098	
  3099		if (!(ctx->flags & SCA_MIGRATE_ENABLE)) {
  3100			if (cpumask_equal(&p->cpus_mask, ctx->new_mask)) {
  3101				if (ctx->flags & SCA_USER)
  3102					swap(p->user_cpus_ptr, ctx->user_mask);
  3103				goto out;
  3104			}
  3105	
  3106			if (WARN_ON_ONCE(p == current &&
  3107					 is_migration_disabled(p) &&
  3108					 !cpumask_test_cpu(task_cpu(p), ctx->new_mask))) {
  3109				ret = -EBUSY;
  3110				goto out;
  3111			}
  3112		}
  3113	
  3114		/*
  3115		 * Picking a ~random cpu helps in cases where we are changing affinity
  3116		 * for groups of tasks (ie. cpuset), so that load balancing is not
  3117		 * immediately required to distribute the tasks within their new mask.
  3118		 */
  3119		dest_cpu = cpumask_any_and_distribute(cpu_valid_mask, ctx->new_mask);
  3120		if (dest_cpu >= nr_cpu_ids) {
  3121			ret = -EINVAL;
  3122			goto out;
  3123		}
  3124	
  3125		__do_set_cpus_allowed(p, ctx);
  3126	
  3127		return affine_move_task(rq, p, rf, dest_cpu, ctx->flags);
  3128	
  3129	out:
  3130		task_rq_unlock(rq, p, rf);
  3131	
  3132		return ret;
  3133	}
  3134	
  3135	/*
  3136	 * Change a given task's CPU affinity. Migrate the thread to a
  3137	 * proper CPU and schedule it away if the CPU it's executing on
  3138	 * is removed from the allowed bitmask.
  3139	 *
  3140	 * NOTE: the caller must have a valid reference to the task, the
  3141	 * task must not exit() & deallocate itself prematurely. The
  3142	 * call is not atomic; no spinlocks may be held.
  3143	 */
  3144	int __set_cpus_allowed_ptr(struct task_struct *p, struct affinity_context *ctx)
  3145	{
  3146		struct rq_flags rf;
  3147		struct rq *rq;
  3148	
  3149		rq = task_rq_lock(p, &rf);
  3150		/*
  3151		 * Masking should be skipped if SCA_USER or any of the SCA_MIGRATE_*
  3152		 * flags are set.
  3153		 */
  3154		if (p->user_cpus_ptr &&
  3155		    !(ctx->flags & (SCA_USER | SCA_MIGRATE_ENABLE | SCA_MIGRATE_DISABLE)) &&
  3156		    cpumask_and(rq->scratch_mask, ctx->new_mask, p->user_cpus_ptr))
  3157			ctx->new_mask = rq->scratch_mask;
  3158	
  3159		return __set_cpus_allowed_ptr_locked(p, ctx, rq, &rf);
  3160	}
  3161	
  3162	int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask)
  3163	{
  3164		struct affinity_context ac = {
  3165			.new_mask  = new_mask,
  3166			.flags     = 0,
  3167		};
  3168	
  3169		return __set_cpus_allowed_ptr(p, &ac);
  3170	}
  3171	EXPORT_SYMBOL_GPL(set_cpus_allowed_ptr);
  3172	
  3173	/*
  3174	 * Change a given task's CPU affinity to the intersection of its current
  3175	 * affinity mask and @subset_mask, writing the resulting mask to @new_mask.
  3176	 * If user_cpus_ptr is defined, use it as the basis for restricting CPU
  3177	 * affinity or use cpu_online_mask instead.
  3178	 *
  3179	 * If the resulting mask is empty, leave the affinity unchanged and return
  3180	 * -EINVAL.
  3181	 */
  3182	static int restrict_cpus_allowed_ptr(struct task_struct *p,
  3183					     struct cpumask *new_mask,
  3184					     const struct cpumask *subset_mask)
  3185	{
  3186		struct affinity_context ac = {
  3187			.new_mask  = new_mask,
  3188			.flags     = 0,
  3189		};
  3190		struct rq_flags rf;
  3191		struct rq *rq;
  3192		int err;
  3193	
  3194		rq = task_rq_lock(p, &rf);
  3195	
  3196		/*
  3197		 * Forcefully restricting the affinity of a deadline task is
  3198		 * likely to cause problems, so fail and noisily override the
  3199		 * mask entirely.
  3200		 */
  3201		if (task_has_dl_policy(p) && dl_bandwidth_enabled()) {
  3202			err = -EPERM;
  3203			goto err_unlock;
  3204		}
  3205	
  3206		if (!cpumask_and(new_mask, task_user_cpus(p), subset_mask)) {
  3207			err = -EINVAL;
  3208			goto err_unlock;
  3209		}
  3210	
  3211		return __set_cpus_allowed_ptr_locked(p, &ac, rq, &rf);
  3212	
  3213	err_unlock:
  3214		task_rq_unlock(rq, p, &rf);
  3215		return err;
  3216	}
  3217	
  3218	/*
  3219	 * Restrict the CPU affinity of task @p so that it is a subset of
  3220	 * task_cpu_possible_mask() and point @p->user_cpus_ptr to a copy of the
  3221	 * old affinity mask. If the resulting mask is empty, we warn and walk
  3222	 * up the cpuset hierarchy until we find a suitable mask.
  3223	 */
  3224	void force_compatible_cpus_allowed_ptr(struct task_struct *p)
  3225	{
  3226		cpumask_var_t new_mask;
  3227		const struct cpumask *override_mask = task_cpu_possible_mask(p);
  3228	
  3229		alloc_cpumask_var(&new_mask, GFP_KERNEL);
  3230	
  3231		/*
  3232		 * __migrate_task() can fail silently in the face of concurrent
  3233		 * offlining of the chosen destination CPU, so take the hotplug
  3234		 * lock to ensure that the migration succeeds.
  3235		 */
  3236		cpus_read_lock();
  3237		if (!cpumask_available(new_mask))
  3238			goto out_set_mask;
  3239	
  3240		if (!restrict_cpus_allowed_ptr(p, new_mask, override_mask))
  3241			goto out_free_mask;
  3242	
  3243		/*
  3244		 * We failed to find a valid subset of the affinity mask for the
  3245		 * task, so override it based on its cpuset hierarchy.
  3246		 */
  3247		cpuset_cpus_allowed(p, new_mask);
  3248		override_mask = new_mask;
  3249	
  3250	out_set_mask:
  3251		if (printk_ratelimit()) {
  3252			printk_deferred("Overriding affinity for process %d (%s) to CPUs %*pbl\n",
  3253					task_pid_nr(p), p->comm,
  3254					cpumask_pr_args(override_mask));
  3255		}
  3256	
  3257		WARN_ON(set_cpus_allowed_ptr(p, override_mask));
  3258	out_free_mask:
  3259		cpus_read_unlock();
  3260		free_cpumask_var(new_mask);
  3261	}
  3262	
  3263	/*
  3264	 * Restore the affinity of a task @p which was previously restricted by a
  3265	 * call to force_compatible_cpus_allowed_ptr().
  3266	 *
  3267	 * It is the caller's responsibility to serialise this with any calls to
  3268	 * force_compatible_cpus_allowed_ptr(@p).
  3269	 */
  3270	void relax_compatible_cpus_allowed_ptr(struct task_struct *p)
  3271	{
  3272		struct affinity_context ac = {
  3273			.new_mask  = task_user_cpus(p),
  3274			.flags     = 0,
  3275		};
  3276		int ret;
  3277	
  3278		/*
  3279		 * Try to restore the old affinity mask with __sched_setaffinity().
  3280		 * Cpuset masking will be done there too.
  3281		 */
  3282		ret = __sched_setaffinity(p, &ac);
  3283		WARN_ON_ONCE(ret);
  3284	}
  3285	
  3286	void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
  3287	{
  3288	#ifdef CONFIG_SCHED_DEBUG
  3289		unsigned int state = READ_ONCE(p->__state);
  3290	
  3291		/*
  3292		 * We should never call set_task_cpu() on a blocked task,
  3293		 * ttwu() will sort out the placement.
  3294		 */
  3295		WARN_ON_ONCE(state != TASK_RUNNING && state != TASK_WAKING && !p->on_rq);
  3296	
  3297		/*
  3298		 * Migrating fair class task must have p->on_rq = TASK_ON_RQ_MIGRATING,
  3299		 * because schedstat_wait_{start,end} rebase migrating task's wait_start
  3300		 * time relying on p->on_rq.
  3301		 */
  3302		WARN_ON_ONCE(state == TASK_RUNNING &&
  3303			     p->sched_class == &fair_sched_class &&
  3304			     (p->on_rq && !task_on_rq_migrating(p)));
  3305	
  3306	#ifdef CONFIG_LOCKDEP
  3307		/*
  3308		 * The caller should hold either p->pi_lock or rq->lock, when changing
  3309		 * a task's CPU. ->pi_lock for waking tasks, rq->lock for runnable tasks.
  3310		 *
  3311		 * sched_move_task() holds both and thus holding either pins the cgroup,
  3312		 * see task_group().
  3313		 *
  3314		 * Furthermore, all task_rq users should acquire both locks, see
  3315		 * task_rq_lock().
  3316		 */
  3317		WARN_ON_ONCE(debug_locks && !(lockdep_is_held(&p->pi_lock) ||
  3318					      lockdep_is_held(__rq_lockp(task_rq(p)))));
  3319	#endif
  3320		/*
  3321		 * Clearly, migrating tasks to offline CPUs is a fairly daft thing.
  3322		 */
  3323		WARN_ON_ONCE(!cpu_online(new_cpu));
  3324	
  3325		WARN_ON_ONCE(is_migration_disabled(p));
  3326	#endif
  3327	
  3328		trace_sched_migrate_task(p, new_cpu);
  3329	
  3330		if (task_cpu(p) != new_cpu) {
  3331			if (p->sched_class->migrate_task_rq)
  3332				p->sched_class->migrate_task_rq(p, new_cpu);
  3333			p->se.nr_migrations++;
  3334			rseq_migrate(p);
  3335			sched_mm_cid_migrate_from(p);
  3336			perf_event_task_migrate(p);
  3337		}
  3338	
  3339		__set_task_cpu(p, new_cpu);
  3340	}
  3341	
  3342	#ifdef CONFIG_NUMA_BALANCING
  3343	static void __migrate_swap_task(struct task_struct *p, int cpu)
  3344	{
  3345		if (task_on_rq_queued(p)) {
  3346			struct rq *src_rq, *dst_rq;
  3347			struct rq_flags srf, drf;
  3348	
  3349			src_rq = task_rq(p);
  3350			dst_rq = cpu_rq(cpu);
  3351	
  3352			rq_pin_lock(src_rq, &srf);
  3353			rq_pin_lock(dst_rq, &drf);
  3354	
  3355			move_queued_task_locked(src_rq, dst_rq, p);
  3356			wakeup_preempt(dst_rq, p, 0);
  3357	
  3358			rq_unpin_lock(dst_rq, &drf);
  3359			rq_unpin_lock(src_rq, &srf);
  3360	
  3361		} else {
  3362			/*
  3363			 * Task isn't running anymore; make it appear like we migrated
  3364			 * it before it went to sleep. This means on wakeup we make the
  3365			 * previous CPU our target instead of where it really is.
  3366			 */
  3367			p->wake_cpu = cpu;
  3368		}
  3369	}
  3370	
  3371	struct migration_swap_arg {
  3372		struct task_struct *src_task, *dst_task;
  3373		int src_cpu, dst_cpu;
  3374	};
  3375	
  3376	static int migrate_swap_stop(void *data)
  3377	{
  3378		struct migration_swap_arg *arg = data;
  3379		struct rq *src_rq, *dst_rq;
  3380	
  3381		if (!cpu_active(arg->src_cpu) || !cpu_active(arg->dst_cpu))
  3382			return -EAGAIN;
  3383	
  3384		src_rq = cpu_rq(arg->src_cpu);
  3385		dst_rq = cpu_rq(arg->dst_cpu);
  3386	
  3387		guard(double_raw_spinlock)(&arg->src_task->pi_lock, &arg->dst_task->pi_lock);
  3388		guard(double_rq_lock)(src_rq, dst_rq);
  3389	
  3390		if (task_cpu(arg->dst_task) != arg->dst_cpu)
  3391			return -EAGAIN;
  3392	
  3393		if (task_cpu(arg->src_task) != arg->src_cpu)
  3394			return -EAGAIN;
  3395	
  3396		if (!cpumask_test_cpu(arg->dst_cpu, arg->src_task->cpus_ptr))
  3397			return -EAGAIN;
  3398	
  3399		if (!cpumask_test_cpu(arg->src_cpu, arg->dst_task->cpus_ptr))
  3400			return -EAGAIN;
  3401	
  3402		__migrate_swap_task(arg->src_task, arg->dst_cpu);
  3403		__migrate_swap_task(arg->dst_task, arg->src_cpu);
  3404	
  3405		return 0;
  3406	}
  3407	
  3408	/*
  3409	 * Cross migrate two tasks
  3410	 */
  3411	int migrate_swap(struct task_struct *cur, struct task_struct *p,
  3412			int target_cpu, int curr_cpu)
  3413	{
  3414		struct migration_swap_arg arg;
  3415		int ret = -EINVAL;
  3416	
  3417		arg = (struct migration_swap_arg){
  3418			.src_task = cur,
  3419			.src_cpu = curr_cpu,
  3420			.dst_task = p,
  3421			.dst_cpu = target_cpu,
  3422		};
  3423	
  3424		if (arg.src_cpu == arg.dst_cpu)
  3425			goto out;
  3426	
  3427		/*
  3428		 * These three tests are all lockless; this is OK since all of them
  3429		 * will be re-checked with proper locks held further down the line.
  3430		 */
  3431		if (!cpu_active(arg.src_cpu) || !cpu_active(arg.dst_cpu))
  3432			goto out;
  3433	
  3434		if (!cpumask_test_cpu(arg.dst_cpu, arg.src_task->cpus_ptr))
  3435			goto out;
  3436	
  3437		if (!cpumask_test_cpu(arg.src_cpu, arg.dst_task->cpus_ptr))
  3438			goto out;
  3439	
  3440		trace_sched_swap_numa(cur, arg.src_cpu, p, arg.dst_cpu);
  3441		ret = stop_two_cpus(arg.dst_cpu, arg.src_cpu, migrate_swap_stop, &arg);
  3442	
  3443	out:
  3444		return ret;
  3445	}
  3446	#endif /* CONFIG_NUMA_BALANCING */
  3447	
  3448	/***
  3449	 * kick_process - kick a running thread to enter/exit the kernel
  3450	 * @p: the to-be-kicked thread
  3451	 *
  3452	 * Cause a process which is running on another CPU to enter
  3453	 * kernel-mode, without any delay. (to get signals handled.)
  3454	 *
  3455	 * NOTE: this function doesn't have to take the runqueue lock,
  3456	 * because all it wants to ensure is that the remote task enters
  3457	 * the kernel. If the IPI races and the task has been migrated
  3458	 * to another CPU then no harm is done and the purpose has been
  3459	 * achieved as well.
  3460	 */
  3461	void kick_process(struct task_struct *p)
  3462	{
  3463		guard(preempt)();
  3464		int cpu = task_cpu(p);
  3465	
  3466		if ((cpu != smp_processor_id()) && task_curr(p))
  3467			smp_send_reschedule(cpu);
  3468	}
  3469	EXPORT_SYMBOL_GPL(kick_process);
  3470	
  3471	/*
  3472	 * ->cpus_ptr is protected by both rq->lock and p->pi_lock
  3473	 *
  3474	 * A few notes on cpu_active vs cpu_online:
  3475	 *
  3476	 *  - cpu_active must be a subset of cpu_online
  3477	 *
  3478	 *  - on CPU-up we allow per-CPU kthreads on the online && !active CPU,
  3479	 *    see __set_cpus_allowed_ptr(). At this point the newly online
  3480	 *    CPU isn't yet part of the sched domains, and balancing will not
  3481	 *    see it.
  3482	 *
  3483	 *  - on CPU-down we clear cpu_active() to mask the sched domains and
  3484	 *    avoid the load balancer to place new tasks on the to be removed
  3485	 *    CPU. Existing tasks will remain running there and will be taken
  3486	 *    off.
  3487	 *
  3488	 * This means that fallback selection must not select !active CPUs.
  3489	 * And can assume that any active CPU must be online. Conversely
  3490	 * select_task_rq() below may allow selection of !active CPUs in order
  3491	 * to satisfy the above rules.
  3492	 */
  3493	static int select_fallback_rq(int cpu, struct task_struct *p)
  3494	{
  3495		int nid = cpu_to_node(cpu);
  3496		const struct cpumask *nodemask = NULL;
  3497		enum { cpuset, possible, fail } state = cpuset;
  3498		int dest_cpu;
  3499	
  3500		/*
  3501		 * If the node that the CPU is on has been offlined, cpu_to_node()
  3502		 * will return -1. There is no CPU on the node, and we should
  3503		 * select the CPU on the other node.
  3504		 */
  3505		if (nid != -1) {
  3506			nodemask = cpumask_of_node(nid);
  3507	
  3508			/* Look for allowed, online CPU in same node. */
  3509			for_each_cpu(dest_cpu, nodemask) {
  3510				if (is_cpu_allowed(p, dest_cpu))
  3511					return dest_cpu;
  3512			}
  3513		}
  3514	
  3515		for (;;) {
  3516			/* Any allowed, online CPU? */
  3517			for_each_cpu(dest_cpu, p->cpus_ptr) {
  3518				if (!is_cpu_allowed(p, dest_cpu))
  3519					continue;
  3520	
  3521				goto out;
  3522			}
  3523	
  3524			/* No more Mr. Nice Guy. */
  3525			switch (state) {
  3526			case cpuset:
  3527				if (cpuset_cpus_allowed_fallback(p)) {
  3528					state = possible;
  3529					break;
  3530				}
  3531				fallthrough;
  3532			case possible:
  3533				/*
  3534				 * XXX When called from select_task_rq() we only
  3535				 * hold p->pi_lock and again violate locking order.
  3536				 *
  3537				 * More yuck to audit.
  3538				 */
  3539				do_set_cpus_allowed(p, task_cpu_possible_mask(p));
  3540				state = fail;
  3541				break;
  3542			case fail:
  3543				BUG();
  3544				break;
  3545			}
  3546		}
  3547	
  3548	out:
  3549		if (state != cpuset) {
  3550			/*
  3551			 * Don't tell them about moving exiting tasks or
  3552			 * kernel threads (both mm NULL), since they never
  3553			 * leave kernel.
  3554			 */
  3555			if (p->mm && printk_ratelimit()) {
  3556				printk_deferred("process %d (%s) no longer affine to cpu%d\n",
  3557						task_pid_nr(p), p->comm, cpu);
  3558			}
  3559		}
  3560	
  3561		return dest_cpu;
  3562	}
  3563	
  3564	/*
  3565	 * The caller (fork, wakeup) owns p->pi_lock, ->cpus_ptr is stable.
  3566	 */
  3567	static inline
  3568	int select_task_rq(struct task_struct *p, int cpu, int *wake_flags)
  3569	{
  3570		lockdep_assert_held(&p->pi_lock);
  3571	
  3572		if (p->nr_cpus_allowed > 1 && !is_migration_disabled(p)) {
  3573			cpu = p->sched_class->select_task_rq(p, cpu, *wake_flags);
  3574			*wake_flags |= WF_RQ_SELECTED;
  3575		} else {
  3576			cpu = cpumask_any(p->cpus_ptr);
  3577		}
  3578	
  3579		/*
  3580		 * In order not to call set_task_cpu() on a blocking task we need
  3581		 * to rely on ttwu() to place the task on a valid ->cpus_ptr
  3582		 * CPU.
  3583		 *
  3584		 * Since this is common to all placement strategies, this lives here.
  3585		 *
  3586		 * [ this allows ->select_task() to simply return task_cpu(p) and
  3587		 *   not worry about this generic constraint ]
  3588		 */
  3589		if (unlikely(!is_cpu_allowed(p, cpu)))
  3590			cpu = select_fallback_rq(task_cpu(p), p);
  3591	
  3592		return cpu;
  3593	}
  3594	
  3595	void sched_set_stop_task(int cpu, struct task_struct *stop)
  3596	{
  3597		static struct lock_class_key stop_pi_lock;
  3598		struct sched_param param = { .sched_priority = MAX_RT_PRIO - 1 };
  3599		struct task_struct *old_stop = cpu_rq(cpu)->stop;
  3600	
  3601		if (stop) {
  3602			/*
  3603			 * Make it appear like a SCHED_FIFO task, its something
  3604			 * userspace knows about and won't get confused about.
  3605			 *
  3606			 * Also, it will make PI more or less work without too
  3607			 * much confusion -- but then, stop work should not
  3608			 * rely on PI working anyway.
  3609			 */
  3610			sched_setscheduler_nocheck(stop, SCHED_FIFO, &param);
  3611	
  3612			stop->sched_class = &stop_sched_class;
  3613	
  3614			/*
  3615			 * The PI code calls rt_mutex_setprio() with ->pi_lock held to
  3616			 * adjust the effective priority of a task. As a result,
  3617			 * rt_mutex_setprio() can trigger (RT) balancing operations,
  3618			 * which can then trigger wakeups of the stop thread to push
  3619			 * around the current task.
  3620			 *
  3621			 * The stop task itself will never be part of the PI-chain, it
  3622			 * never blocks, therefore that ->pi_lock recursion is safe.
  3623			 * Tell lockdep about this by placing the stop->pi_lock in its
  3624			 * own class.
  3625			 */
  3626			lockdep_set_class(&stop->pi_lock, &stop_pi_lock);
  3627		}
  3628	
  3629		cpu_rq(cpu)->stop = stop;
  3630	
  3631		if (old_stop) {
  3632			/*
  3633			 * Reset it back to a normal scheduling class so that
  3634			 * it can die in pieces.
  3635			 */
  3636			old_stop->sched_class = &rt_sched_class;
  3637		}
  3638	}
  3639	
  3640	#else /* CONFIG_SMP */
  3641	
  3642	static inline void migrate_disable_switch(struct rq *rq, struct task_struct *p) { }
  3643	
  3644	static inline bool rq_has_pinned_tasks(struct rq *rq)
  3645	{
  3646		return false;
  3647	}
  3648	
  3649	#endif /* !CONFIG_SMP */
  3650	
  3651	static void
  3652	ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
  3653	{
  3654		struct rq *rq;
  3655	
  3656		if (!schedstat_enabled())
  3657			return;
  3658	
  3659		rq = this_rq();
  3660	
  3661	#ifdef CONFIG_SMP
  3662		if (cpu == rq->cpu) {
  3663			__schedstat_inc(rq->ttwu_local);
  3664			__schedstat_inc(p->stats.nr_wakeups_local);
  3665		} else {
  3666			struct sched_domain *sd;
  3667	
  3668			__schedstat_inc(p->stats.nr_wakeups_remote);
  3669	
  3670			guard(rcu)();
  3671			for_each_domain(rq->cpu, sd) {
  3672				if (cpumask_test_cpu(cpu, sched_domain_span(sd))) {
  3673					__schedstat_inc(sd->ttwu_wake_remote);
  3674					break;
  3675				}
  3676			}
  3677		}
  3678	
  3679		if (wake_flags & WF_MIGRATED)
  3680			__schedstat_inc(p->stats.nr_wakeups_migrate);
  3681	#endif /* CONFIG_SMP */
  3682	
  3683		__schedstat_inc(rq->ttwu_count);
  3684		__schedstat_inc(p->stats.nr_wakeups);
  3685	
  3686		if (wake_flags & WF_SYNC)
  3687			__schedstat_inc(p->stats.nr_wakeups_sync);
  3688	}
  3689	
  3690	/*
  3691	 * Mark the task runnable.
  3692	 */
  3693	static inline void ttwu_do_wakeup(struct task_struct *p)
  3694	{
  3695		WRITE_ONCE(p->__state, TASK_RUNNING);
  3696		trace_sched_wakeup(p);
  3697	}
  3698	
  3699	static void
  3700	ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
  3701			 struct rq_flags *rf)
  3702	{
  3703		int en_flags = ENQUEUE_WAKEUP | ENQUEUE_NOCLOCK;
  3704	
  3705		lockdep_assert_rq_held(rq);
  3706	
  3707		if (p->sched_contributes_to_load)
  3708			rq->nr_uninterruptible--;
  3709	
  3710	#ifdef CONFIG_SMP
  3711		if (wake_flags & WF_RQ_SELECTED)
  3712			en_flags |= ENQUEUE_RQ_SELECTED;
  3713		if (wake_flags & WF_MIGRATED)
  3714			en_flags |= ENQUEUE_MIGRATED;
  3715		else
  3716	#endif
  3717		if (p->in_iowait) {
  3718			delayacct_blkio_end(p);
  3719			atomic_dec(&task_rq(p)->nr_iowait);
  3720		}
  3721	
  3722		activate_task(rq, p, en_flags);
  3723		wakeup_preempt(rq, p, wake_flags);
  3724	
  3725		ttwu_do_wakeup(p);
  3726	
  3727	#ifdef CONFIG_SMP
  3728		if (p->sched_class->task_woken) {
  3729			/*
  3730			 * Our task @p is fully woken up and running; so it's safe to
  3731			 * drop the rq->lock, hereafter rq is only used for statistics.
  3732			 */
  3733			rq_unpin_lock(rq, rf);
  3734			p->sched_class->task_woken(rq, p);
  3735			rq_repin_lock(rq, rf);
  3736		}
  3737	
  3738		if (rq->idle_stamp) {
  3739			u64 delta = rq_clock(rq) - rq->idle_stamp;
  3740			u64 max = 2*rq->max_idle_balance_cost;
  3741	
  3742			update_avg(&rq->avg_idle, delta);
  3743	
  3744			if (rq->avg_idle > max)
  3745				rq->avg_idle = max;
  3746	
  3747			rq->idle_stamp = 0;
  3748		}
  3749	#endif
  3750	}
  3751	
  3752	/*
  3753	 * Consider @p being inside a wait loop:
  3754	 *
  3755	 *   for (;;) {
  3756	 *      set_current_state(TASK_UNINTERRUPTIBLE);
  3757	 *
  3758	 *      if (CONDITION)
  3759	 *         break;
  3760	 *
  3761	 *      schedule();
  3762	 *   }
  3763	 *   __set_current_state(TASK_RUNNING);
  3764	 *
  3765	 * between set_current_state() and schedule(). In this case @p is still
  3766	 * runnable, so all that needs doing is change p->state back to TASK_RUNNING in
  3767	 * an atomic manner.
  3768	 *
  3769	 * By taking task_rq(p)->lock we serialize against schedule(), if @p->on_rq
  3770	 * then schedule() must still happen and p->state can be changed to
  3771	 * TASK_RUNNING. Otherwise we lost the race, schedule() has happened, and we
  3772	 * need to do a full wakeup with enqueue.
  3773	 *
  3774	 * Returns: %true when the wakeup is done,
  3775	 *          %false otherwise.
  3776	 */
  3777	static int ttwu_runnable(struct task_struct *p, int wake_flags)
  3778	{
  3779		struct rq_flags rf;
  3780		struct rq *rq;
  3781		int ret = 0;
  3782	
  3783		rq = __task_rq_lock(p, &rf);
  3784		if (task_on_rq_queued(p)) {
  3785			update_rq_clock(rq);
  3786			if (p->se.sched_delayed)
  3787				enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
  3788			if (!task_on_cpu(rq, p)) {
  3789				/*
  3790				 * When on_rq && !on_cpu the task is preempted, see if
  3791				 * it should preempt the task that is current now.
  3792				 */
  3793				wakeup_preempt(rq, p, wake_flags);
  3794			}
  3795			ttwu_do_wakeup(p);
  3796			ret = 1;
  3797		}
  3798		__task_rq_unlock(rq, &rf);
  3799	
  3800		return ret;
  3801	}
  3802	
  3803	#ifdef CONFIG_SMP
  3804	void sched_ttwu_pending(void *arg)
  3805	{
  3806		struct llist_node *llist = arg;
  3807		struct rq *rq = this_rq();
  3808		struct task_struct *p, *t;
  3809		struct rq_flags rf;
  3810	
  3811		if (!llist)
  3812			return;
  3813	
  3814		rq_lock_irqsave(rq, &rf);
  3815		update_rq_clock(rq);
  3816	
  3817		llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
  3818			if (WARN_ON_ONCE(p->on_cpu))
  3819				smp_cond_load_acquire(&p->on_cpu, !VAL);
  3820	
  3821			if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
  3822				set_task_cpu(p, cpu_of(rq));
  3823	
  3824			ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
  3825		}
  3826	
  3827		/*
  3828		 * Must be after enqueueing at least once task such that
  3829		 * idle_cpu() does not observe a false-negative -- if it does,
  3830		 * it is possible for select_idle_siblings() to stack a number
  3831		 * of tasks on this CPU during that window.
  3832		 *
  3833		 * It is OK to clear ttwu_pending when another task pending.
  3834		 * We will receive IPI after local IRQ enabled and then enqueue it.
  3835		 * Since now nr_running > 0, idle_cpu() will always get correct result.
  3836		 */
  3837		WRITE_ONCE(rq->ttwu_pending, 0);
  3838		rq_unlock_irqrestore(rq, &rf);
  3839	}
  3840	
  3841	/*
  3842	 * Prepare the scene for sending an IPI for a remote smp_call
  3843	 *
  3844	 * Returns true if the caller can proceed with sending the IPI.
  3845	 * Returns false otherwise.
  3846	 */
  3847	bool call_function_single_prep_ipi(int cpu)
  3848	{
  3849		if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
  3850			trace_sched_wake_idle_without_ipi(cpu);
  3851			return false;
  3852		}
  3853	
  3854		return true;
  3855	}
  3856	
  3857	/*
  3858	 * Queue a task on the target CPUs wake_list and wake the CPU via IPI if
  3859	 * necessary. The wakee CPU on receipt of the IPI will queue the task
  3860	 * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
  3861	 * of the wakeup instead of the waker.
  3862	 */
  3863	static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
  3864	{
  3865		struct rq *rq = cpu_rq(cpu);
  3866	
  3867		p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
  3868	
  3869		WRITE_ONCE(rq->ttwu_pending, 1);
  3870		__smp_call_single_queue(cpu, &p->wake_entry.llist);
  3871	}
  3872	
  3873	void wake_up_if_idle(int cpu)
  3874	{
  3875		struct rq *rq = cpu_rq(cpu);
  3876	
  3877		guard(rcu)();
  3878		if (is_idle_task(rcu_dereference(rq->curr))) {
  3879			guard(rq_lock_irqsave)(rq);
  3880			if (is_idle_task(rq->curr))
  3881				resched_curr(rq);
  3882		}
  3883	}
  3884	
  3885	bool cpus_equal_capacity(int this_cpu, int that_cpu)
  3886	{
  3887		if (!sched_asym_cpucap_active())
  3888			return true;
  3889	
  3890		if (this_cpu == that_cpu)
  3891			return true;
  3892	
  3893		return arch_scale_cpu_capacity(this_cpu) == arch_scale_cpu_capacity(that_cpu);
  3894	}
  3895	
  3896	bool cpus_share_cache(int this_cpu, int that_cpu)
  3897	{
  3898		if (this_cpu == that_cpu)
  3899			return true;
  3900	
  3901		return per_cpu(sd_llc_id, this_cpu) == per_cpu(sd_llc_id, that_cpu);
  3902	}
  3903	
  3904	/*
  3905	 * Whether CPUs are share cache resources, which means LLC on non-cluster
  3906	 * machines and LLC tag or L2 on machines with clusters.
  3907	 */
  3908	bool cpus_share_resources(int this_cpu, int that_cpu)
  3909	{
  3910		if (this_cpu == that_cpu)
  3911			return true;
  3912	
  3913		return per_cpu(sd_share_id, this_cpu) == per_cpu(sd_share_id, that_cpu);
  3914	}
  3915	
  3916	static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
  3917	{
  3918		/*
  3919		 * The BPF scheduler may depend on select_task_rq() being invoked during
  3920		 * wakeups. In addition, @p may end up executing on a different CPU
  3921		 * regardless of what happens in the wakeup path making the ttwu_queue
  3922		 * optimization less meaningful. Skip if on SCX.
  3923		 */
  3924		if (task_on_scx(p))
  3925			return false;
  3926	
  3927		/*
  3928		 * Do not complicate things with the async wake_list while the CPU is
  3929		 * in hotplug state.
  3930		 */
  3931		if (!cpu_active(cpu))
  3932			return false;
  3933	
  3934		/* Ensure the task will still be allowed to run on the CPU. */
  3935		if (!cpumask_test_cpu(cpu, p->cpus_ptr))
  3936			return false;
  3937	
  3938		/*
  3939		 * If the CPU does not share cache, then queue the task on the
  3940		 * remote rqs wakelist to avoid accessing remote data.
  3941		 */
  3942		if (!cpus_share_cache(smp_processor_id(), cpu))
  3943			return true;
  3944	
  3945		if (cpu == smp_processor_id())
  3946			return false;
  3947	
  3948		/*
  3949		 * If the wakee cpu is idle, or the task is descheduling and the
  3950		 * only running task on the CPU, then use the wakelist to offload
  3951		 * the task activation to the idle (or soon-to-be-idle) CPU as
  3952		 * the current CPU is likely busy. nr_running is checked to
  3953		 * avoid unnecessary task stacking.
  3954		 *
  3955		 * Note that we can only get here with (wakee) p->on_rq=0,
  3956		 * p->on_cpu can be whatever, we've done the dequeue, so
  3957		 * the wakee has been accounted out of ->nr_running.
  3958		 */
  3959		if (!cpu_rq(cpu)->nr_running)
  3960			return true;
  3961	
  3962		return false;
  3963	}
  3964	
  3965	static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
  3966	{
  3967		if (sched_feat(TTWU_QUEUE) && ttwu_queue_cond(p, cpu)) {
  3968			sched_clock_cpu(cpu); /* Sync clocks across CPUs */
  3969			__ttwu_queue_wakelist(p, cpu, wake_flags);
  3970			return true;
  3971		}
  3972	
  3973		return false;
  3974	}
  3975	
  3976	#else /* !CONFIG_SMP */
  3977	
  3978	static inline bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
  3979	{
  3980		return false;
  3981	}
  3982	
  3983	#endif /* CONFIG_SMP */
  3984	
  3985	static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
  3986	{
  3987		struct rq *rq = cpu_rq(cpu);
  3988		struct rq_flags rf;
  3989	
  3990		if (ttwu_queue_wakelist(p, cpu, wake_flags))
  3991			return;
  3992	
  3993		rq_lock(rq, &rf);
  3994		update_rq_clock(rq);
  3995		ttwu_do_activate(rq, p, wake_flags, &rf);
  3996		rq_unlock(rq, &rf);
  3997	}
  3998	
  3999	/*
  4000	 * Invoked from try_to_wake_up() to check whether the task can be woken up.
  4001	 *
  4002	 * The caller holds p::pi_lock if p != current or has preemption
  4003	 * disabled when p == current.
  4004	 *
  4005	 * The rules of saved_state:
  4006	 *
  4007	 *   The related locking code always holds p::pi_lock when updating
  4008	 *   p::saved_state, which means the code is fully serialized in both cases.
  4009	 *
  4010	 *   For PREEMPT_RT, the lock wait and lock wakeups happen via TASK_RTLOCK_WAIT.
  4011	 *   No other bits set. This allows to distinguish all wakeup scenarios.
  4012	 *
  4013	 *   For FREEZER, the wakeup happens via TASK_FROZEN. No other bits set. This
  4014	 *   allows us to prevent early wakeup of tasks before they can be run on
  4015	 *   asymmetric ISA architectures (eg ARMv9).
  4016	 */
  4017	static __always_inline
  4018	bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  4019	{
  4020		int match;
  4021	
  4022		if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)) {
  4023			WARN_ON_ONCE((state & TASK_RTLOCK_WAIT) &&
  4024				     state != TASK_RTLOCK_WAIT);
  4025		}
  4026	
  4027		*success = !!(match = __task_state_match(p, state));
  4028	
  4029		/*
  4030		 * Saved state preserves the task state across blocking on
  4031		 * an RT lock or TASK_FREEZABLE tasks.  If the state matches,
  4032		 * set p::saved_state to TASK_RUNNING, but do not wake the task
  4033		 * because it waits for a lock wakeup or __thaw_task(). Also
  4034		 * indicate success because from the regular waker's point of
  4035		 * view this has succeeded.
  4036		 *
  4037		 * After acquiring the lock the task will restore p::__state
  4038		 * from p::saved_state which ensures that the regular
  4039		 * wakeup is not lost. The restore will also set
  4040		 * p::saved_state to TASK_RUNNING so any further tests will
  4041		 * not result in false positives vs. @success
  4042		 */
  4043		if (match < 0)
  4044			p->saved_state = TASK_RUNNING;
  4045	
  4046		return match > 0;
  4047	}
  4048	
  4049	/*
  4050	 * Notes on Program-Order guarantees on SMP systems.
  4051	 *
  4052	 *  MIGRATION
  4053	 *
  4054	 * The basic program-order guarantee on SMP systems is that when a task [t]
  4055	 * migrates, all its activity on its old CPU [c0] happens-before any subsequent
  4056	 * execution on its new CPU [c1].
  4057	 *
  4058	 * For migration (of runnable tasks) this is provided by the following means:
  4059	 *
  4060	 *  A) UNLOCK of the rq(c0)->lock scheduling out task t
  4061	 *  B) migration for t is required to synchronize *both* rq(c0)->lock and
  4062	 *     rq(c1)->lock (if not at the same time, then in that order).
  4063	 *  C) LOCK of the rq(c1)->lock scheduling in task
  4064	 *
  4065	 * Release/acquire chaining guarantees that B happens after A and C after B.
  4066	 * Note: the CPU doing B need not be c0 or c1
  4067	 *
  4068	 * Example:
  4069	 *
  4070	 *   CPU0            CPU1            CPU2
  4071	 *
  4072	 *   LOCK rq(0)->lock
  4073	 *   sched-out X
  4074	 *   sched-in Y
  4075	 *   UNLOCK rq(0)->lock
  4076	 *
  4077	 *                                   LOCK rq(0)->lock // orders against CPU0
  4078	 *                                   dequeue X
  4079	 *                                   UNLOCK rq(0)->lock
  4080	 *
  4081	 *                                   LOCK rq(1)->lock
  4082	 *                                   enqueue X
  4083	 *                                   UNLOCK rq(1)->lock
  4084	 *
  4085	 *                   LOCK rq(1)->lock // orders against CPU2
  4086	 *                   sched-out Z
  4087	 *                   sched-in X
  4088	 *                   UNLOCK rq(1)->lock
  4089	 *
  4090	 *
  4091	 *  BLOCKING -- aka. SLEEP + WAKEUP
  4092	 *
  4093	 * For blocking we (obviously) need to provide the same guarantee as for
  4094	 * migration. However the means are completely different as there is no lock
  4095	 * chain to provide order. Instead we do:
  4096	 *
  4097	 *   1) smp_store_release(X->on_cpu, 0)   -- finish_task()
  4098	 *   2) smp_cond_load_acquire(!X->on_cpu) -- try_to_wake_up()
  4099	 *
  4100	 * Example:
  4101	 *
  4102	 *   CPU0 (schedule)  CPU1 (try_to_wake_up) CPU2 (schedule)
  4103	 *
  4104	 *   LOCK rq(0)->lock LOCK X->pi_lock
  4105	 *   dequeue X
  4106	 *   sched-out X
  4107	 *   smp_store_release(X->on_cpu, 0);
  4108	 *
  4109	 *                    smp_cond_load_acquire(&X->on_cpu, !VAL);
  4110	 *                    X->state = WAKING
  4111	 *                    set_task_cpu(X,2)
  4112	 *
  4113	 *                    LOCK rq(2)->lock
  4114	 *                    enqueue X
  4115	 *                    X->state = RUNNING
  4116	 *                    UNLOCK rq(2)->lock
  4117	 *
  4118	 *                                          LOCK rq(2)->lock // orders against CPU1
  4119	 *                                          sched-out Z
  4120	 *                                          sched-in X
  4121	 *                                          UNLOCK rq(2)->lock
  4122	 *
  4123	 *                    UNLOCK X->pi_lock
  4124	 *   UNLOCK rq(0)->lock
  4125	 *
  4126	 *
  4127	 * However, for wakeups there is a second guarantee we must provide, namely we
  4128	 * must ensure that CONDITION=1 done by the caller can not be reordered with
  4129	 * accesses to the task state; see try_to_wake_up() and set_current_state().
  4130	 */
  4131	
  4132	/**
  4133	 * try_to_wake_up - wake up a thread
  4134	 * @p: the thread to be awakened
  4135	 * @state: the mask of task states that can be woken
  4136	 * @wake_flags: wake modifier flags (WF_*)
  4137	 *
  4138	 * Conceptually does:
  4139	 *
  4140	 *   If (@state & @p->state) @p->state = TASK_RUNNING.
  4141	 *
  4142	 * If the task was not queued/runnable, also place it back on a runqueue.
  4143	 *
  4144	 * This function is atomic against schedule() which would dequeue the task.
  4145	 *
  4146	 * It issues a full memory barrier before accessing @p->state, see the comment
  4147	 * with set_current_state().
  4148	 *
  4149	 * Uses p->pi_lock to serialize against concurrent wake-ups.
  4150	 *
  4151	 * Relies on p->pi_lock stabilizing:
  4152	 *  - p->sched_class
  4153	 *  - p->cpus_ptr
  4154	 *  - p->sched_task_group
  4155	 * in order to do migration, see its use of select_task_rq()/set_task_cpu().
  4156	 *
  4157	 * Tries really hard to only take one task_rq(p)->lock for performance.
  4158	 * Takes rq->lock in:
  4159	 *  - ttwu_runnable()    -- old rq, unavoidable, see comment there;
  4160	 *  - ttwu_queue()       -- new rq, for enqueue of the task;
  4161	 *  - psi_ttwu_dequeue() -- much sadness :-( accounting will kill us.
  4162	 *
  4163	 * As a consequence we race really badly with just about everything. See the
  4164	 * many memory barriers and their comments for details.
  4165	 *
  4166	 * Return: %true if @p->state changes (an actual wakeup was done),
  4167	 *	   %false otherwise.
  4168	 */
  4169	int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
  4170	{
  4171		guard(preempt)();
  4172		int cpu, success = 0;
  4173	
  4174		wake_flags |= WF_TTWU;
  4175	
  4176		if (p == current) {
  4177			/*
  4178			 * We're waking current, this means 'p->on_rq' and 'task_cpu(p)
  4179			 * == smp_processor_id()'. Together this means we can special
  4180			 * case the whole 'p->on_rq && ttwu_runnable()' case below
  4181			 * without taking any locks.
  4182			 *
  4183			 * Specifically, given current runs ttwu() we must be before
  4184			 * schedule()'s block_task(), as such this must not observe
  4185			 * sched_delayed.
  4186			 *
  4187			 * In particular:
  4188			 *  - we rely on Program-Order guarantees for all the ordering,
  4189			 *  - we're serialized against set_special_state() by virtue of
  4190			 *    it disabling IRQs (this allows not taking ->pi_lock).
  4191			 */
  4192			SCHED_WARN_ON(p->se.sched_delayed);
  4193			if (!ttwu_state_match(p, state, &success))
  4194				goto out;
  4195	
  4196			trace_sched_waking(p);
  4197			ttwu_do_wakeup(p);
  4198			goto out;
  4199		}
  4200	
  4201		/*
  4202		 * If we are going to wake up a thread waiting for CONDITION we
  4203		 * need to ensure that CONDITION=1 done by the caller can not be
  4204		 * reordered with p->state check below. This pairs with smp_store_mb()
  4205		 * in set_current_state() that the waiting thread does.
  4206		 */
  4207		scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
  4208			smp_mb__after_spinlock();
  4209			if (!ttwu_state_match(p, state, &success))
  4210				break;
  4211	
  4212			trace_sched_waking(p);
  4213	
  4214			/*
  4215			 * Ensure we load p->on_rq _after_ p->state, otherwise it would
  4216			 * be possible to, falsely, observe p->on_rq == 0 and get stuck
  4217			 * in smp_cond_load_acquire() below.
  4218			 *
  4219			 * sched_ttwu_pending()			try_to_wake_up()
  4220			 *   STORE p->on_rq = 1			  LOAD p->state
  4221			 *   UNLOCK rq->lock
  4222			 *
  4223			 * __schedule() (switch to task 'p')
  4224			 *   LOCK rq->lock			  smp_rmb();
  4225			 *   smp_mb__after_spinlock();
  4226			 *   UNLOCK rq->lock
  4227			 *
  4228			 * [task p]
  4229			 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
  4230			 *
  4231			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4232			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4233			 *
  4234			 * A similar smp_rmb() lives in __task_needs_rq_lock().
  4235			 */
  4236			smp_rmb();
  4237			if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
  4238				break;
  4239	
  4240	#ifdef CONFIG_SMP
  4241			/*
  4242			 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be
  4243			 * possible to, falsely, observe p->on_cpu == 0.
  4244			 *
  4245			 * One must be running (->on_cpu == 1) in order to remove oneself
  4246			 * from the runqueue.
  4247			 *
  4248			 * __schedule() (switch to task 'p')	try_to_wake_up()
  4249			 *   STORE p->on_cpu = 1		  LOAD p->on_rq
  4250			 *   UNLOCK rq->lock
  4251			 *
  4252			 * __schedule() (put 'p' to sleep)
  4253			 *   LOCK rq->lock			  smp_rmb();
  4254			 *   smp_mb__after_spinlock();
  4255			 *   STORE p->on_rq = 0			  LOAD p->on_cpu
  4256			 *
  4257			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4258			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4259			 *
  4260			 * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
  4261			 * schedule()'s deactivate_task() has 'happened' and p will no longer
  4262			 * care about it's own p->state. See the comment in __schedule().
  4263			 */
  4264			smp_acquire__after_ctrl_dep();
  4265	
  4266			/*
  4267			 * We're doing the wakeup (@success == 1), they did a dequeue (p->on_rq
  4268			 * == 0), which means we need to do an enqueue, change p->state to
  4269			 * TASK_WAKING such that we can unlock p->pi_lock before doing the
  4270			 * enqueue, such as ttwu_queue_wakelist().
  4271			 */
  4272			WRITE_ONCE(p->__state, TASK_WAKING);
  4273	
  4274			/*
  4275			 * If the owning (remote) CPU is still in the middle of schedule() with
  4276			 * this task as prev, considering queueing p on the remote CPUs wake_list
  4277			 * which potentially sends an IPI instead of spinning on p->on_cpu to
  4278			 * let the waker make forward progress. This is safe because IRQs are
  4279			 * disabled and the IPI will deliver after on_cpu is cleared.
  4280			 *
  4281			 * Ensure we load task_cpu(p) after p->on_cpu:
  4282			 *
  4283			 * set_task_cpu(p, cpu);
  4284			 *   STORE p->cpu = @cpu
  4285			 * __schedule() (switch to task 'p')
  4286			 *   LOCK rq->lock
  4287			 *   smp_mb__after_spin_lock()		smp_cond_load_acquire(&p->on_cpu)
  4288			 *   STORE p->on_cpu = 1		LOAD p->cpu
  4289			 *
  4290			 * to ensure we observe the correct CPU on which the task is currently
  4291			 * scheduling.
  4292			 */
  4293			if (smp_load_acquire(&p->on_cpu) &&
  4294			    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
  4295				break;
  4296	
  4297			/*
  4298			 * If the owning (remote) CPU is still in the middle of schedule() with
  4299			 * this task as prev, wait until it's done referencing the task.
  4300			 *
  4301			 * Pairs with the smp_store_release() in finish_task().
  4302			 *
  4303			 * This ensures that tasks getting woken will be fully ordered against
  4304			 * their previous state and preserve Program Order.
  4305			 */
  4306			smp_cond_load_acquire(&p->on_cpu, !VAL);
  4307	
  4308			cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
  4309			if (task_cpu(p) != cpu) {
  4310				if (p->in_iowait) {
  4311					delayacct_blkio_end(p);
  4312					atomic_dec(&task_rq(p)->nr_iowait);
  4313				}
  4314	
  4315				wake_flags |= WF_MIGRATED;
  4316				psi_ttwu_dequeue(p);
  4317				set_task_cpu(p, cpu);
  4318			}
  4319	#else
  4320			cpu = task_cpu(p);
  4321	#endif /* CONFIG_SMP */
  4322	
  4323			ttwu_queue(p, cpu, wake_flags);
  4324		}
  4325	out:
  4326		if (success)
  4327			ttwu_stat(p, task_cpu(p), wake_flags);
  4328	
  4329		return success;
  4330	}
  4331	
  4332	static bool __task_needs_rq_lock(struct task_struct *p)
  4333	{
  4334		unsigned int state = READ_ONCE(p->__state);
  4335	
  4336		/*
  4337		 * Since pi->lock blocks try_to_wake_up(), we don't need rq->lock when
  4338		 * the task is blocked. Make sure to check @state since ttwu() can drop
  4339		 * locks at the end, see ttwu_queue_wakelist().
  4340		 */
  4341		if (state == TASK_RUNNING || state == TASK_WAKING)
  4342			return true;
  4343	
  4344		/*
  4345		 * Ensure we load p->on_rq after p->__state, otherwise it would be
  4346		 * possible to, falsely, observe p->on_rq == 0.
  4347		 *
  4348		 * See try_to_wake_up() for a longer comment.
  4349		 */
  4350		smp_rmb();
  4351		if (p->on_rq)
  4352			return true;
  4353	
  4354	#ifdef CONFIG_SMP
  4355		/*
  4356		 * Ensure the task has finished __schedule() and will not be referenced
  4357		 * anymore. Again, see try_to_wake_up() for a longer comment.
  4358		 */
  4359		smp_rmb();
  4360		smp_cond_load_acquire(&p->on_cpu, !VAL);
  4361	#endif
  4362	
  4363		return false;
  4364	}
  4365	
  4366	/**
  4367	 * task_call_func - Invoke a function on task in fixed state
  4368	 * @p: Process for which the function is to be invoked, can be @current.
  4369	 * @func: Function to invoke.
  4370	 * @arg: Argument to function.
  4371	 *
  4372	 * Fix the task in it's current state by avoiding wakeups and or rq operations
  4373	 * and call @func(@arg) on it.  This function can use task_is_runnable() and
  4374	 * task_curr() to work out what the state is, if required.  Given that @func
  4375	 * can be invoked with a runqueue lock held, it had better be quite
  4376	 * lightweight.
  4377	 *
  4378	 * Returns:
  4379	 *   Whatever @func returns
  4380	 */
  4381	int task_call_func(struct task_struct *p, task_call_f func, void *arg)
  4382	{
  4383		struct rq *rq = NULL;
  4384		struct rq_flags rf;
  4385		int ret;
  4386	
  4387		raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
  4388	
  4389		if (__task_needs_rq_lock(p))
  4390			rq = __task_rq_lock(p, &rf);
  4391	
  4392		/*
  4393		 * At this point the task is pinned; either:
  4394		 *  - blocked and we're holding off wakeups	 (pi->lock)
  4395		 *  - woken, and we're holding off enqueue	 (rq->lock)
  4396		 *  - queued, and we're holding off schedule	 (rq->lock)
  4397		 *  - running, and we're holding off de-schedule (rq->lock)
  4398		 *
  4399		 * The called function (@func) can use: task_curr(), p->on_rq and
  4400		 * p->__state to differentiate between these states.
  4401		 */
  4402		ret = func(p, arg);
  4403	
  4404		if (rq)
  4405			rq_unlock(rq, &rf);
  4406	
  4407		raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
  4408		return ret;
  4409	}
  4410	
  4411	/**
  4412	 * cpu_curr_snapshot - Return a snapshot of the currently running task
  4413	 * @cpu: The CPU on which to snapshot the task.
  4414	 *
  4415	 * Returns the task_struct pointer of the task "currently" running on
  4416	 * the specified CPU.
  4417	 *
  4418	 * If the specified CPU was offline, the return value is whatever it
  4419	 * is, perhaps a pointer to the task_struct structure of that CPU's idle
  4420	 * task, but there is no guarantee.  Callers wishing a useful return
  4421	 * value must take some action to ensure that the specified CPU remains
  4422	 * online throughout.
  4423	 *
  4424	 * This function executes full memory barriers before and after fetching
  4425	 * the pointer, which permits the caller to confine this function's fetch
  4426	 * with respect to the caller's accesses to other shared variables.
  4427	 */
  4428	struct task_struct *cpu_curr_snapshot(int cpu)
  4429	{
  4430		struct rq *rq = cpu_rq(cpu);
  4431		struct task_struct *t;
  4432		struct rq_flags rf;
  4433	
  4434		rq_lock_irqsave(rq, &rf);
  4435		smp_mb__after_spinlock(); /* Pairing determined by caller's synchronization design. */
  4436		t = rcu_dereference(cpu_curr(cpu));
  4437		rq_unlock_irqrestore(rq, &rf);
  4438		smp_mb(); /* Pairing determined by caller's synchronization design. */
  4439	
  4440		return t;
  4441	}
  4442	
  4443	/**
  4444	 * wake_up_process - Wake up a specific process
  4445	 * @p: The process to be woken up.
  4446	 *
  4447	 * Attempt to wake up the nominated process and move it to the set of runnable
  4448	 * processes.
  4449	 *
  4450	 * Return: 1 if the process was woken up, 0 if it was already running.
  4451	 *
  4452	 * This function executes a full memory barrier before accessing the task state.
  4453	 */
  4454	int wake_up_process(struct task_struct *p)
  4455	{
  4456		return try_to_wake_up(p, TASK_NORMAL, 0);
  4457	}
  4458	EXPORT_SYMBOL(wake_up_process);
  4459	
  4460	int wake_up_state(struct task_struct *p, unsigned int state)
  4461	{
  4462		return try_to_wake_up(p, state, 0);
  4463	}
  4464	
  4465	/*
  4466	 * Perform scheduler related setup for a newly forked process p.
  4467	 * p is forked by current.
  4468	 *
  4469	 * __sched_fork() is basic setup which is also used by sched_init() to
  4470	 * initialize the boot CPU's idle task.
  4471	 */
  4472	static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
  4473	{
  4474		p->on_rq			= 0;
  4475	
  4476		p->se.on_rq			= 0;
  4477		p->se.exec_start		= 0;
  4478		p->se.sum_exec_runtime		= 0;
  4479		p->se.prev_sum_exec_runtime	= 0;
  4480		p->se.nr_migrations		= 0;
  4481		p->se.vruntime			= 0;
  4482		p->se.vlag			= 0;
  4483		INIT_LIST_HEAD(&p->se.group_node);
  4484	
  4485		/* A delayed task cannot be in clone(). */
  4486		SCHED_WARN_ON(p->se.sched_delayed);
  4487	
  4488	#ifdef CONFIG_FAIR_GROUP_SCHED
  4489		p->se.cfs_rq			= NULL;
  4490	#endif
  4491	
  4492	#ifdef CONFIG_SCHEDSTATS
  4493		/* Even if schedstat is disabled, there should not be garbage */
  4494		memset(&p->stats, 0, sizeof(p->stats));
  4495	#endif
  4496	
  4497		init_dl_entity(&p->dl);
  4498	
  4499		INIT_LIST_HEAD(&p->rt.run_list);
  4500		p->rt.timeout		= 0;
  4501		p->rt.time_slice	= sched_rr_timeslice;
  4502		p->rt.on_rq		= 0;
  4503		p->rt.on_list		= 0;
  4504	
  4505	#ifdef CONFIG_SCHED_CLASS_EXT
  4506		init_scx_entity(&p->scx);
  4507	#endif
  4508	
  4509	#ifdef CONFIG_PREEMPT_NOTIFIERS
  4510		INIT_HLIST_HEAD(&p->preempt_notifiers);
  4511	#endif
  4512	
  4513	#ifdef CONFIG_COMPACTION
  4514		p->capture_control = NULL;
  4515	#endif
  4516		init_numa_balancing(clone_flags, p);
  4517	#ifdef CONFIG_SMP
  4518		p->wake_entry.u_flags = CSD_TYPE_TTWU;
  4519		p->migration_pending = NULL;
  4520	#endif
  4521		init_sched_mm_cid(p);
  4522	}
  4523	
  4524	DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
  4525	
  4526	#ifdef CONFIG_NUMA_BALANCING
  4527	
  4528	int sysctl_numa_balancing_mode;
  4529	
  4530	static void __set_numabalancing_state(bool enabled)
  4531	{
  4532		if (enabled)
  4533			static_branch_enable(&sched_numa_balancing);
  4534		else
  4535			static_branch_disable(&sched_numa_balancing);
  4536	}
  4537	
  4538	void set_numabalancing_state(bool enabled)
  4539	{
  4540		if (enabled)
  4541			sysctl_numa_balancing_mode = NUMA_BALANCING_NORMAL;
  4542		else
  4543			sysctl_numa_balancing_mode = NUMA_BALANCING_DISABLED;
  4544		__set_numabalancing_state(enabled);
  4545	}
  4546	
  4547	#ifdef CONFIG_PROC_SYSCTL
  4548	static void reset_memory_tiering(void)
  4549	{
  4550		struct pglist_data *pgdat;
  4551	
  4552		for_each_online_pgdat(pgdat) {
  4553			pgdat->nbp_threshold = 0;
  4554			pgdat->nbp_th_nr_cand = node_page_state(pgdat, PGPROMOTE_CANDIDATE);
  4555			pgdat->nbp_th_start = jiffies_to_msecs(jiffies);
  4556		}
  4557	}
  4558	
  4559	static int sysctl_numa_balancing(const struct ctl_table *table, int write,
  4560				  void *buffer, size_t *lenp, loff_t *ppos)
  4561	{
  4562		struct ctl_table t;
  4563		int err;
  4564		int state = sysctl_numa_balancing_mode;
  4565	
  4566		if (write && !capable(CAP_SYS_ADMIN))
  4567			return -EPERM;
  4568	
  4569		t = *table;
  4570		t.data = &state;
  4571		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
  4572		if (err < 0)
  4573			return err;
  4574		if (write) {
  4575			if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
  4576			    (state & NUMA_BALANCING_MEMORY_TIERING))
  4577				reset_memory_tiering();
  4578			sysctl_numa_balancing_mode = state;
  4579			__set_numabalancing_state(state);
  4580		}
  4581		return err;
  4582	}
  4583	#endif
  4584	#endif
  4585	
  4586	#ifdef CONFIG_SCHEDSTATS
  4587	
  4588	DEFINE_STATIC_KEY_FALSE(sched_schedstats);
  4589	
  4590	static void set_schedstats(bool enabled)
  4591	{
  4592		if (enabled)
  4593			static_branch_enable(&sched_schedstats);
  4594		else
  4595			static_branch_disable(&sched_schedstats);
  4596	}
  4597	
  4598	void force_schedstat_enabled(void)
  4599	{
  4600		if (!schedstat_enabled()) {
  4601			pr_info("kernel profiling enabled schedstats, disable via kernel.sched_schedstats.\n");
  4602			static_branch_enable(&sched_schedstats);
  4603		}
  4604	}
  4605	
  4606	static int __init setup_schedstats(char *str)
  4607	{
  4608		int ret = 0;
  4609		if (!str)
  4610			goto out;
  4611	
  4612		if (!strcmp(str, "enable")) {
  4613			set_schedstats(true);
  4614			ret = 1;
  4615		} else if (!strcmp(str, "disable")) {
  4616			set_schedstats(false);
  4617			ret = 1;
  4618		}
  4619	out:
  4620		if (!ret)
  4621			pr_warn("Unable to parse schedstats=\n");
  4622	
  4623		return ret;
  4624	}
  4625	__setup("schedstats=", setup_schedstats);
  4626	
  4627	#ifdef CONFIG_PROC_SYSCTL
  4628	static int sysctl_schedstats(const struct ctl_table *table, int write, void *buffer,
  4629			size_t *lenp, loff_t *ppos)
  4630	{
  4631		struct ctl_table t;
  4632		int err;
  4633		int state = static_branch_likely(&sched_schedstats);
  4634	
  4635		if (write && !capable(CAP_SYS_ADMIN))
  4636			return -EPERM;
  4637	
  4638		t = *table;
  4639		t.data = &state;
  4640		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
  4641		if (err < 0)
  4642			return err;
  4643		if (write)
  4644			set_schedstats(state);
  4645		return err;
  4646	}
  4647	#endif /* CONFIG_PROC_SYSCTL */
  4648	#endif /* CONFIG_SCHEDSTATS */
  4649	
  4650	#ifdef CONFIG_SYSCTL
  4651	static struct ctl_table sched_core_sysctls[] = {
  4652	#ifdef CONFIG_SCHEDSTATS
  4653		{
  4654			.procname       = "sched_schedstats",
  4655			.data           = NULL,
  4656			.maxlen         = sizeof(unsigned int),
  4657			.mode           = 0644,
  4658			.proc_handler   = sysctl_schedstats,
  4659			.extra1         = SYSCTL_ZERO,
  4660			.extra2         = SYSCTL_ONE,
  4661		},
  4662	#endif /* CONFIG_SCHEDSTATS */
  4663	#ifdef CONFIG_UCLAMP_TASK
  4664		{
  4665			.procname       = "sched_util_clamp_min",
  4666			.data           = &sysctl_sched_uclamp_util_min,
  4667			.maxlen         = sizeof(unsigned int),
  4668			.mode           = 0644,
  4669			.proc_handler   = sysctl_sched_uclamp_handler,
  4670		},
  4671		{
  4672			.procname       = "sched_util_clamp_max",
  4673			.data           = &sysctl_sched_uclamp_util_max,
  4674			.maxlen         = sizeof(unsigned int),
  4675			.mode           = 0644,
  4676			.proc_handler   = sysctl_sched_uclamp_handler,
  4677		},
  4678		{
  4679			.procname       = "sched_util_clamp_min_rt_default",
  4680			.data           = &sysctl_sched_uclamp_util_min_rt_default,
  4681			.maxlen         = sizeof(unsigned int),
  4682			.mode           = 0644,
  4683			.proc_handler   = sysctl_sched_uclamp_handler,
  4684		},
  4685	#endif /* CONFIG_UCLAMP_TASK */
  4686	#ifdef CONFIG_NUMA_BALANCING
  4687		{
  4688			.procname	= "numa_balancing",
  4689			.data		= NULL, /* filled in by handler */
  4690			.maxlen		= sizeof(unsigned int),
  4691			.mode		= 0644,
  4692			.proc_handler	= sysctl_numa_balancing,
  4693			.extra1		= SYSCTL_ZERO,
  4694			.extra2		= SYSCTL_FOUR,
  4695		},
  4696	#endif /* CONFIG_NUMA_BALANCING */
  4697	};
  4698	static int __init sched_core_sysctl_init(void)
  4699	{
  4700		register_sysctl_init("kernel", sched_core_sysctls);
  4701		return 0;
  4702	}
  4703	late_initcall(sched_core_sysctl_init);
  4704	#endif /* CONFIG_SYSCTL */
  4705	
  4706	/*
  4707	 * fork()/clone()-time setup:
  4708	 */
  4709	int sched_fork(unsigned long clone_flags, struct task_struct *p)
  4710	{
  4711		__sched_fork(clone_flags, p);
  4712		/*
  4713		 * We mark the process as NEW here. This guarantees that
  4714		 * nobody will actually run it, and a signal or other external
  4715		 * event cannot wake it up and insert it on the runqueue either.
  4716		 */
  4717		p->__state = TASK_NEW;
  4718	
  4719		/*
  4720		 * Make sure we do not leak PI boosting priority to the child.
  4721		 */
  4722		p->prio = current->normal_prio;
  4723	
  4724		uclamp_fork(p);
  4725	
  4726		/*
  4727		 * Revert to default priority/policy on fork if requested.
  4728		 */
  4729		if (unlikely(p->sched_reset_on_fork)) {
  4730			if (task_has_dl_policy(p) || task_has_rt_policy(p)) {
  4731				p->policy = SCHED_NORMAL;
  4732				p->static_prio = NICE_TO_PRIO(0);
  4733				p->rt_priority = 0;
  4734			} else if (PRIO_TO_NICE(p->static_prio) < 0)
  4735				p->static_prio = NICE_TO_PRIO(0);
  4736	
  4737			p->prio = p->normal_prio = p->static_prio;
  4738			set_load_weight(p, false);
  4739			p->se.custom_slice = 0;
  4740			p->se.slice = sysctl_sched_base_slice;
  4741	
  4742			/*
  4743			 * We don't need the reset flag anymore after the fork. It has
  4744			 * fulfilled its duty:
  4745			 */
  4746			p->sched_reset_on_fork = 0;
  4747		}
  4748	
  4749		if (dl_prio(p->prio))
  4750			return -EAGAIN;
  4751	
  4752		scx_pre_fork(p);
  4753	
  4754		if (rt_prio(p->prio)) {
  4755			p->sched_class = &rt_sched_class;
  4756	#ifdef CONFIG_SCHED_CLASS_EXT
  4757		} else if (task_should_scx(p->policy)) {
  4758			p->sched_class = &ext_sched_class;
  4759	#endif
  4760		} else {
  4761			p->sched_class = &fair_sched_class;
  4762		}
  4763	
  4764		init_entity_runnable_average(&p->se);
  4765	
  4766	
  4767	#ifdef CONFIG_SCHED_INFO
  4768		if (likely(sched_info_on()))
  4769			memset(&p->sched_info, 0, sizeof(p->sched_info));
  4770	#endif
  4771	#if defined(CONFIG_SMP)
  4772		p->on_cpu = 0;
  4773	#endif
  4774		init_task_preempt_count(p);
  4775	#ifdef CONFIG_SMP
  4776		plist_node_init(&p->pushable_tasks, MAX_PRIO);
  4777		RB_CLEAR_NODE(&p->pushable_dl_tasks);
  4778	#endif
  4779		return 0;
  4780	}
  4781	
  4782	int sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs)
  4783	{
  4784		unsigned long flags;
  4785	
  4786		/*
  4787		 * Because we're not yet on the pid-hash, p->pi_lock isn't strictly
  4788		 * required yet, but lockdep gets upset if rules are violated.
  4789		 */
  4790		raw_spin_lock_irqsave(&p->pi_lock, flags);
  4791	#ifdef CONFIG_CGROUP_SCHED
  4792		if (1) {
  4793			struct task_group *tg;
  4794			tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
  4795					  struct task_group, css);
  4796			tg = autogroup_task_group(p, tg);
  4797			p->sched_task_group = tg;
  4798		}
  4799	#endif
  4800		rseq_migrate(p);
  4801		/*
  4802		 * We're setting the CPU for the first time, we don't migrate,
  4803		 * so use __set_task_cpu().
  4804		 */
  4805		__set_task_cpu(p, smp_processor_id());
  4806		if (p->sched_class->task_fork)
  4807			p->sched_class->task_fork(p);
  4808		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
  4809	
  4810		return scx_fork(p);
  4811	}
  4812	
  4813	void sched_cancel_fork(struct task_struct *p)
  4814	{
  4815		scx_cancel_fork(p);
  4816	}
  4817	
  4818	void sched_post_fork(struct task_struct *p)
  4819	{
  4820		uclamp_post_fork(p);
  4821		scx_post_fork(p);
  4822	}
  4823	
  4824	unsigned long to_ratio(u64 period, u64 runtime)
  4825	{
  4826		if (runtime == RUNTIME_INF)
  4827			return BW_UNIT;
  4828	
  4829		/*
  4830		 * Doing this here saves a lot of checks in all
  4831		 * the calling paths, and returning zero seems
  4832		 * safe for them anyway.
  4833		 */
  4834		if (period == 0)
  4835			return 0;
  4836	
  4837		return div64_u64(runtime << BW_SHIFT, period);
  4838	}
  4839	
  4840	/*
  4841	 * wake_up_new_task - wake up a newly created task for the first time.
  4842	 *
  4843	 * This function will do some initial scheduler statistics housekeeping
  4844	 * that must be done for every newly created context, then puts the task
  4845	 * on the runqueue and wakes it.
  4846	 */
  4847	void wake_up_new_task(struct task_struct *p)
  4848	{
  4849		struct rq_flags rf;
  4850		struct rq *rq;
  4851		int wake_flags = WF_FORK;
  4852	
  4853		raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
  4854		WRITE_ONCE(p->__state, TASK_RUNNING);
  4855	#ifdef CONFIG_SMP
  4856		/*
  4857		 * Fork balancing, do it here and not earlier because:
  4858		 *  - cpus_ptr can change in the fork path
  4859		 *  - any previously selected CPU might disappear through hotplug
  4860		 *
  4861		 * Use __set_task_cpu() to avoid calling sched_class::migrate_task_rq,
  4862		 * as we're not fully set-up yet.
  4863		 */
  4864		p->recent_used_cpu = task_cpu(p);
  4865		rseq_migrate(p);
  4866		__set_task_cpu(p, select_task_rq(p, task_cpu(p), &wake_flags));
  4867	#endif
  4868		rq = __task_rq_lock(p, &rf);
  4869		update_rq_clock(rq);
  4870		post_init_entity_util_avg(p);
  4871	
  4872		activate_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_INITIAL);
  4873		trace_sched_wakeup_new(p);
  4874		wakeup_preempt(rq, p, wake_flags);
  4875	#ifdef CONFIG_SMP
  4876		if (p->sched_class->task_woken) {
  4877			/*
  4878			 * Nothing relies on rq->lock after this, so it's fine to
  4879			 * drop it.
  4880			 */
  4881			rq_unpin_lock(rq, &rf);
  4882			p->sched_class->task_woken(rq, p);
  4883			rq_repin_lock(rq, &rf);
  4884		}
  4885	#endif
  4886		task_rq_unlock(rq, p, &rf);
  4887	}
  4888	
  4889	#ifdef CONFIG_PREEMPT_NOTIFIERS
  4890	
  4891	static DEFINE_STATIC_KEY_FALSE(preempt_notifier_key);
  4892	
  4893	void preempt_notifier_inc(void)
  4894	{
  4895		static_branch_inc(&preempt_notifier_key);
  4896	}
  4897	EXPORT_SYMBOL_GPL(preempt_notifier_inc);
  4898	
  4899	void preempt_notifier_dec(void)
  4900	{
  4901		static_branch_dec(&preempt_notifier_key);
  4902	}
  4903	EXPORT_SYMBOL_GPL(preempt_notifier_dec);
  4904	
  4905	/**
  4906	 * preempt_notifier_register - tell me when current is being preempted & rescheduled
  4907	 * @notifier: notifier struct to register
  4908	 */
  4909	void preempt_notifier_register(struct preempt_notifier *notifier)
  4910	{
  4911		if (!static_branch_unlikely(&preempt_notifier_key))
  4912			WARN(1, "registering preempt_notifier while notifiers disabled\n");
  4913	
  4914		hlist_add_head(&notifier->link, &current->preempt_notifiers);
  4915	}
  4916	EXPORT_SYMBOL_GPL(preempt_notifier_register);
  4917	
  4918	/**
  4919	 * preempt_notifier_unregister - no longer interested in preemption notifications
  4920	 * @notifier: notifier struct to unregister
  4921	 *
  4922	 * This is *not* safe to call from within a preemption notifier.
  4923	 */
  4924	void preempt_notifier_unregister(struct preempt_notifier *notifier)
  4925	{
  4926		hlist_del(&notifier->link);
  4927	}
  4928	EXPORT_SYMBOL_GPL(preempt_notifier_unregister);
  4929	
  4930	static void __fire_sched_in_preempt_notifiers(struct task_struct *curr)
  4931	{
  4932		struct preempt_notifier *notifier;
  4933	
  4934		hlist_for_each_entry(notifier, &curr->preempt_notifiers, link)
  4935			notifier->ops->sched_in(notifier, raw_smp_processor_id());
  4936	}
  4937	
  4938	static __always_inline void fire_sched_in_preempt_notifiers(struct task_struct *curr)
  4939	{
  4940		if (static_branch_unlikely(&preempt_notifier_key))
  4941			__fire_sched_in_preempt_notifiers(curr);
  4942	}
  4943	
  4944	static void
  4945	__fire_sched_out_preempt_notifiers(struct task_struct *curr,
  4946					   struct task_struct *next)
  4947	{
  4948		struct preempt_notifier *notifier;
  4949	
  4950		hlist_for_each_entry(notifier, &curr->preempt_notifiers, link)
  4951			notifier->ops->sched_out(notifier, next);
  4952	}
  4953	
  4954	static __always_inline void
  4955	fire_sched_out_preempt_notifiers(struct task_struct *curr,
  4956					 struct task_struct *next)
  4957	{
  4958		if (static_branch_unlikely(&preempt_notifier_key))
  4959			__fire_sched_out_preempt_notifiers(curr, next);
  4960	}
  4961	
  4962	#else /* !CONFIG_PREEMPT_NOTIFIERS */
  4963	
  4964	static inline void fire_sched_in_preempt_notifiers(struct task_struct *curr)
  4965	{
  4966	}
  4967	
  4968	static inline void
  4969	fire_sched_out_preempt_notifiers(struct task_struct *curr,
  4970					 struct task_struct *next)
  4971	{
  4972	}
  4973	
  4974	#endif /* CONFIG_PREEMPT_NOTIFIERS */
  4975	
  4976	static inline void prepare_task(struct task_struct *next)
  4977	{
  4978	#ifdef CONFIG_SMP
  4979		/*
  4980		 * Claim the task as running, we do this before switching to it
  4981		 * such that any running task will have this set.
  4982		 *
  4983		 * See the smp_load_acquire(&p->on_cpu) case in ttwu() and
  4984		 * its ordering comment.
  4985		 */
  4986		WRITE_ONCE(next->on_cpu, 1);
  4987	#endif
  4988	}
  4989	
  4990	static inline void finish_task(struct task_struct *prev)
  4991	{
  4992	#ifdef CONFIG_SMP
  4993		/*
  4994		 * This must be the very last reference to @prev from this CPU. After
  4995		 * p->on_cpu is cleared, the task can be moved to a different CPU. We
  4996		 * must ensure this doesn't happen until the switch is completely
  4997		 * finished.
  4998		 *
  4999		 * In particular, the load of prev->state in finish_task_switch() must
  5000		 * happen before this.
  5001		 *
  5002		 * Pairs with the smp_cond_load_acquire() in try_to_wake_up().
  5003		 */
  5004		smp_store_release(&prev->on_cpu, 0);
  5005	#endif
  5006	}
  5007	
  5008	#ifdef CONFIG_SMP
  5009	
  5010	static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
  5011	{
  5012		void (*func)(struct rq *rq);
  5013		struct balance_callback *next;
  5014	
  5015		lockdep_assert_rq_held(rq);
  5016	
  5017		while (head) {
  5018			func = (void (*)(struct rq *))head->func;
  5019			next = head->next;
  5020			head->next = NULL;
  5021			head = next;
  5022	
  5023			func(rq);
  5024		}
  5025	}
  5026	
  5027	static void balance_push(struct rq *rq);
  5028	
  5029	/*
  5030	 * balance_push_callback is a right abuse of the callback interface and plays
  5031	 * by significantly different rules.
  5032	 *
  5033	 * Where the normal balance_callback's purpose is to be ran in the same context
  5034	 * that queued it (only later, when it's safe to drop rq->lock again),
  5035	 * balance_push_callback is specifically targeted at __schedule().
  5036	 *
  5037	 * This abuse is tolerated because it places all the unlikely/odd cases behind
  5038	 * a single test, namely: rq->balance_callback == NULL.
  5039	 */
  5040	struct balance_callback balance_push_callback = {
  5041		.next = NULL,
  5042		.func = balance_push,
  5043	};
  5044	
  5045	static inline struct balance_callback *
  5046	__splice_balance_callbacks(struct rq *rq, bool split)
  5047	{
  5048		struct balance_callback *head = rq->balance_callback;
  5049	
  5050		if (likely(!head))
  5051			return NULL;
  5052	
  5053		lockdep_assert_rq_held(rq);
  5054		/*
  5055		 * Must not take balance_push_callback off the list when
  5056		 * splice_balance_callbacks() and balance_callbacks() are not
  5057		 * in the same rq->lock section.
  5058		 *
  5059		 * In that case it would be possible for __schedule() to interleave
  5060		 * and observe the list empty.
  5061		 */
  5062		if (split && head == &balance_push_callback)
  5063			head = NULL;
  5064		else
  5065			rq->balance_callback = NULL;
  5066	
  5067		return head;
  5068	}
  5069	
  5070	struct balance_callback *splice_balance_callbacks(struct rq *rq)
  5071	{
  5072		return __splice_balance_callbacks(rq, true);
  5073	}
  5074	
  5075	static void __balance_callbacks(struct rq *rq)
  5076	{
  5077		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  5078	}
  5079	
  5080	void balance_callbacks(struct rq *rq, struct balance_callback *head)
  5081	{
  5082		unsigned long flags;
  5083	
  5084		if (unlikely(head)) {
  5085			raw_spin_rq_lock_irqsave(rq, flags);
  5086			do_balance_callbacks(rq, head);
  5087			raw_spin_rq_unlock_irqrestore(rq, flags);
  5088		}
  5089	}
  5090	
  5091	#else
  5092	
  5093	static inline void __balance_callbacks(struct rq *rq)
  5094	{
  5095	}
  5096	
  5097	#endif
  5098	
  5099	static inline void
  5100	prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf)
  5101	{
  5102		/*
  5103		 * Since the runqueue lock will be released by the next
  5104		 * task (which is an invalid locking op but in the case
  5105		 * of the scheduler it's an obvious special-case), so we
  5106		 * do an early lockdep release here:
  5107		 */
  5108		rq_unpin_lock(rq, rf);
  5109		spin_release(&__rq_lockp(rq)->dep_map, _THIS_IP_);
  5110	#ifdef CONFIG_DEBUG_SPINLOCK
  5111		/* this is a valid case when another task releases the spinlock */
  5112		rq_lockp(rq)->owner = next;
  5113	#endif
  5114	}
  5115	
  5116	static inline void finish_lock_switch(struct rq *rq)
  5117	{
  5118		/*
  5119		 * If we are tracking spinlock dependencies then we have to
  5120		 * fix up the runqueue lock - which gets 'carried over' from
  5121		 * prev into current:
  5122		 */
  5123		spin_acquire(&__rq_lockp(rq)->dep_map, 0, 0, _THIS_IP_);
  5124		__balance_callbacks(rq);
  5125		raw_spin_rq_unlock_irq(rq);
  5126	}
  5127	
  5128	/*
  5129	 * NOP if the arch has not defined these:
  5130	 */
  5131	
  5132	#ifndef prepare_arch_switch
  5133	# define prepare_arch_switch(next)	do { } while (0)
  5134	#endif
  5135	
  5136	#ifndef finish_arch_post_lock_switch
  5137	# define finish_arch_post_lock_switch()	do { } while (0)
  5138	#endif
  5139	
  5140	static inline void kmap_local_sched_out(void)
  5141	{
  5142	#ifdef CONFIG_KMAP_LOCAL
  5143		if (unlikely(current->kmap_ctrl.idx))
  5144			__kmap_local_sched_out();
  5145	#endif
  5146	}
  5147	
  5148	static inline void kmap_local_sched_in(void)
  5149	{
  5150	#ifdef CONFIG_KMAP_LOCAL
  5151		if (unlikely(current->kmap_ctrl.idx))
  5152			__kmap_local_sched_in();
  5153	#endif
  5154	}
  5155	
  5156	/**
  5157	 * prepare_task_switch - prepare to switch tasks
  5158	 * @rq: the runqueue preparing to switch
  5159	 * @prev: the current task that is being switched out
  5160	 * @next: the task we are going to switch to.
  5161	 *
  5162	 * This is called with the rq lock held and interrupts off. It must
  5163	 * be paired with a subsequent finish_task_switch after the context
  5164	 * switch.
  5165	 *
  5166	 * prepare_task_switch sets up locking and calls architecture specific
  5167	 * hooks.
  5168	 */
  5169	static inline void
  5170	prepare_task_switch(struct rq *rq, struct task_struct *prev,
  5171			    struct task_struct *next)
  5172	{
  5173		kcov_prepare_switch(prev);
  5174		sched_info_switch(rq, prev, next);
  5175		perf_event_task_sched_out(prev, next);
  5176		rseq_preempt(prev);
  5177		fire_sched_out_preempt_notifiers(prev, next);
  5178		kmap_local_sched_out();
  5179		prepare_task(next);
  5180		prepare_arch_switch(next);
  5181	}
  5182	
  5183	/**
  5184	 * finish_task_switch - clean up after a task-switch
  5185	 * @prev: the thread we just switched away from.
  5186	 *
  5187	 * finish_task_switch must be called after the context switch, paired
  5188	 * with a prepare_task_switch call before the context switch.
  5189	 * finish_task_switch will reconcile locking set up by prepare_task_switch,
  5190	 * and do any other architecture-specific cleanup actions.
  5191	 *
  5192	 * Note that we may have delayed dropping an mm in context_switch(). If
  5193	 * so, we finish that here outside of the runqueue lock. (Doing it
  5194	 * with the lock held can cause deadlocks; see schedule() for
  5195	 * details.)
  5196	 *
  5197	 * The context switch have flipped the stack from under us and restored the
  5198	 * local variables which were saved when this task called schedule() in the
  5199	 * past. 'prev == current' is still correct but we need to recalculate this_rq
  5200	 * because prev may have moved to another CPU.
  5201	 */
  5202	static struct rq *finish_task_switch(struct task_struct *prev)
  5203		__releases(rq->lock)
  5204	{
  5205		struct rq *rq = this_rq();
  5206		struct mm_struct *mm = rq->prev_mm;
  5207		unsigned int prev_state;
  5208	
  5209		/*
  5210		 * The previous task will have left us with a preempt_count of 2
  5211		 * because it left us after:
  5212		 *
  5213		 *	schedule()
  5214		 *	  preempt_disable();			// 1
  5215		 *	  __schedule()
  5216		 *	    raw_spin_lock_irq(&rq->lock)	// 2
  5217		 *
  5218		 * Also, see FORK_PREEMPT_COUNT.
  5219		 */
  5220		if (WARN_ONCE(preempt_count() != 2*PREEMPT_DISABLE_OFFSET,
  5221			      "corrupted preempt_count: %s/%d/0x%x\n",
  5222			      current->comm, current->pid, preempt_count()))
  5223			preempt_count_set(FORK_PREEMPT_COUNT);
  5224	
  5225		rq->prev_mm = NULL;
  5226	
  5227		/*
  5228		 * A task struct has one reference for the use as "current".
  5229		 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
  5230		 * schedule one last time. The schedule call will never return, and
  5231		 * the scheduled task must drop that reference.
  5232		 *
  5233		 * We must observe prev->state before clearing prev->on_cpu (in
  5234		 * finish_task), otherwise a concurrent wakeup can get prev
  5235		 * running on another CPU and we could rave with its RUNNING -> DEAD
  5236		 * transition, resulting in a double drop.
  5237		 */
  5238		prev_state = READ_ONCE(prev->__state);
  5239		vtime_task_switch(prev);
  5240		perf_event_task_sched_in(prev, current);
  5241		finish_task(prev);
  5242		tick_nohz_task_switch();
  5243		finish_lock_switch(rq);
  5244		finish_arch_post_lock_switch();
  5245		kcov_finish_switch(current);
  5246		/*
  5247		 * kmap_local_sched_out() is invoked with rq::lock held and
  5248		 * interrupts disabled. There is no requirement for that, but the
  5249		 * sched out code does not have an interrupt enabled section.
  5250		 * Restoring the maps on sched in does not require interrupts being
  5251		 * disabled either.
  5252		 */
  5253		kmap_local_sched_in();
  5254	
  5255		fire_sched_in_preempt_notifiers(current);
  5256		/*
  5257		 * When switching through a kernel thread, the loop in
  5258		 * membarrier_{private,global}_expedited() may have observed that
  5259		 * kernel thread and not issued an IPI. It is therefore possible to
  5260		 * schedule between user->kernel->user threads without passing though
  5261		 * switch_mm(). Membarrier requires a barrier after storing to
  5262		 * rq->curr, before returning to userspace, so provide them here:
  5263		 *
  5264		 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
  5265		 *   provided by mmdrop_lazy_tlb(),
  5266		 * - a sync_core for SYNC_CORE.
  5267		 */
  5268		if (mm) {
  5269			membarrier_mm_sync_core_before_usermode(mm);
  5270			mmdrop_lazy_tlb_sched(mm);
  5271		}
  5272	
  5273		if (unlikely(prev_state == TASK_DEAD)) {
  5274			if (prev->sched_class->task_dead)
  5275				prev->sched_class->task_dead(prev);
  5276	
  5277			/* Task is done with its stack. */
  5278			put_task_stack(prev);
  5279	
  5280			put_task_struct_rcu_user(prev);
  5281		}
  5282	
  5283		return rq;
  5284	}
  5285	
  5286	/**
  5287	 * schedule_tail - first thing a freshly forked thread must call.
  5288	 * @prev: the thread we just switched away from.
  5289	 */
  5290	asmlinkage __visible void schedule_tail(struct task_struct *prev)
  5291		__releases(rq->lock)
  5292	{
  5293		/*
  5294		 * New tasks start with FORK_PREEMPT_COUNT, see there and
  5295		 * finish_task_switch() for details.
  5296		 *
  5297		 * finish_task_switch() will drop rq->lock() and lower preempt_count
  5298		 * and the preempt_enable() will end up enabling preemption (on
  5299		 * PREEMPT_COUNT kernels).
  5300		 */
  5301	
  5302		finish_task_switch(prev);
  5303		preempt_enable();
  5304	
  5305		if (current->set_child_tid)
  5306			put_user(task_pid_vnr(current), current->set_child_tid);
  5307	
  5308		calculate_sigpending();
  5309	}
  5310	
  5311	/*
  5312	 * context_switch - switch to the new MM and the new thread's register state.
  5313	 */
  5314	static __always_inline struct rq *
  5315	context_switch(struct rq *rq, struct task_struct *prev,
  5316		       struct task_struct *next, struct rq_flags *rf)
  5317	{
  5318		prepare_task_switch(rq, prev, next);
  5319	
  5320		/*
  5321		 * For paravirt, this is coupled with an exit in switch_to to
  5322		 * combine the page table reload and the switch backend into
  5323		 * one hypercall.
  5324		 */
  5325		arch_start_context_switch(prev);
  5326	
  5327		/*
  5328		 * kernel -> kernel   lazy + transfer active
  5329		 *   user -> kernel   lazy + mmgrab_lazy_tlb() active
  5330		 *
  5331		 * kernel ->   user   switch + mmdrop_lazy_tlb() active
  5332		 *   user ->   user   switch
  5333		 *
  5334		 * switch_mm_cid() needs to be updated if the barriers provided
  5335		 * by context_switch() are modified.
  5336		 */
  5337		if (!next->mm) {                                // to kernel
  5338			enter_lazy_tlb(prev->active_mm, next);
  5339	
  5340			next->active_mm = prev->active_mm;
  5341			if (prev->mm)                           // from user
  5342				mmgrab_lazy_tlb(prev->active_mm);
  5343			else
  5344				prev->active_mm = NULL;
  5345		} else {                                        // to user
  5346			membarrier_switch_mm(rq, prev->active_mm, next->mm);
  5347			/*
  5348			 * sys_membarrier() requires an smp_mb() between setting
  5349			 * rq->curr / membarrier_switch_mm() and returning to userspace.
  5350			 *
  5351			 * The below provides this either through switch_mm(), or in
  5352			 * case 'prev->active_mm == next->mm' through
  5353			 * finish_task_switch()'s mmdrop().
  5354			 */
  5355			switch_mm_irqs_off(prev->active_mm, next->mm, next);
  5356			lru_gen_use_mm(next->mm);
  5357	
  5358			if (!prev->mm) {                        // from kernel
  5359				/* will mmdrop_lazy_tlb() in finish_task_switch(). */
  5360				rq->prev_mm = prev->active_mm;
  5361				prev->active_mm = NULL;
  5362			}
  5363		}
  5364	
  5365		/* switch_mm_cid() requires the memory barriers above. */
  5366		switch_mm_cid(rq, prev, next);
  5367	
  5368		prepare_lock_switch(rq, next, rf);
  5369	
  5370		/* Here we just switch the register state and the stack. */
  5371		switch_to(prev, next, prev);
  5372		barrier();
  5373	
  5374		return finish_task_switch(prev);
  5375	}
  5376	
  5377	/*
  5378	 * nr_running and nr_context_switches:
  5379	 *
  5380	 * externally visible scheduler statistics: current number of runnable
  5381	 * threads, total number of context switches performed since bootup.
  5382	 */
  5383	unsigned int nr_running(void)
  5384	{
  5385		unsigned int i, sum = 0;
  5386	
  5387		for_each_online_cpu(i)
  5388			sum += cpu_rq(i)->nr_running;
  5389	
  5390		return sum;
  5391	}
  5392	
  5393	/*
  5394	 * Check if only the current task is running on the CPU.
  5395	 *
  5396	 * Caution: this function does not check that the caller has disabled
  5397	 * preemption, thus the result might have a time-of-check-to-time-of-use
  5398	 * race.  The caller is responsible to use it correctly, for example:
  5399	 *
  5400	 * - from a non-preemptible section (of course)
  5401	 *
  5402	 * - from a thread that is bound to a single CPU
  5403	 *
  5404	 * - in a loop with very short iterations (e.g. a polling loop)
  5405	 */
  5406	bool single_task_running(void)
  5407	{
  5408		return raw_rq()->nr_running == 1;
  5409	}
  5410	EXPORT_SYMBOL(single_task_running);
  5411	
  5412	unsigned long long nr_context_switches_cpu(int cpu)
  5413	{
  5414		return cpu_rq(cpu)->nr_switches;
  5415	}
  5416	
  5417	unsigned long long nr_context_switches(void)
  5418	{
  5419		int i;
  5420		unsigned long long sum = 0;
  5421	
  5422		for_each_possible_cpu(i)
  5423			sum += cpu_rq(i)->nr_switches;
  5424	
  5425		return sum;
  5426	}
  5427	
  5428	/*
  5429	 * Consumers of these two interfaces, like for example the cpuidle menu
  5430	 * governor, are using nonsensical data. Preferring shallow idle state selection
  5431	 * for a CPU that has IO-wait which might not even end up running the task when
  5432	 * it does become runnable.
  5433	 */
  5434	
  5435	unsigned int nr_iowait_cpu(int cpu)
  5436	{
  5437		return atomic_read(&cpu_rq(cpu)->nr_iowait);
  5438	}
  5439	
  5440	/*
  5441	 * IO-wait accounting, and how it's mostly bollocks (on SMP).
  5442	 *
  5443	 * The idea behind IO-wait account is to account the idle time that we could
  5444	 * have spend running if it were not for IO. That is, if we were to improve the
  5445	 * storage performance, we'd have a proportional reduction in IO-wait time.
  5446	 *
  5447	 * This all works nicely on UP, where, when a task blocks on IO, we account
  5448	 * idle time as IO-wait, because if the storage were faster, it could've been
  5449	 * running and we'd not be idle.
  5450	 *
  5451	 * This has been extended to SMP, by doing the same for each CPU. This however
  5452	 * is broken.
  5453	 *
  5454	 * Imagine for instance the case where two tasks block on one CPU, only the one
  5455	 * CPU will have IO-wait accounted, while the other has regular idle. Even
  5456	 * though, if the storage were faster, both could've ran at the same time,
  5457	 * utilising both CPUs.
  5458	 *
  5459	 * This means, that when looking globally, the current IO-wait accounting on
  5460	 * SMP is a lower bound, by reason of under accounting.
  5461	 *
  5462	 * Worse, since the numbers are provided per CPU, they are sometimes
  5463	 * interpreted per CPU, and that is nonsensical. A blocked task isn't strictly
  5464	 * associated with any one particular CPU, it can wake to another CPU than it
  5465	 * blocked on. This means the per CPU IO-wait number is meaningless.
  5466	 *
  5467	 * Task CPU affinities can make all that even more 'interesting'.
  5468	 */
  5469	
  5470	unsigned int nr_iowait(void)
  5471	{
  5472		unsigned int i, sum = 0;
  5473	
  5474		for_each_possible_cpu(i)
  5475			sum += nr_iowait_cpu(i);
  5476	
  5477		return sum;
  5478	}
  5479	
  5480	#ifdef CONFIG_SMP
  5481	
  5482	/*
  5483	 * sched_exec - execve() is a valuable balancing opportunity, because at
  5484	 * this point the task has the smallest effective memory and cache footprint.
  5485	 */
  5486	void sched_exec(void)
  5487	{
  5488		struct task_struct *p = current;
  5489		struct migration_arg arg;
  5490		int dest_cpu;
  5491	
  5492		scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
  5493			dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
  5494			if (dest_cpu == smp_processor_id())
  5495				return;
  5496	
  5497			if (unlikely(!cpu_active(dest_cpu)))
  5498				return;
  5499	
  5500			arg = (struct migration_arg){ p, dest_cpu };
  5501		}
  5502		stop_one_cpu(task_cpu(p), migration_cpu_stop, &arg);
  5503	}
  5504	
  5505	#endif
  5506	
  5507	DEFINE_PER_CPU(struct kernel_stat, kstat);
  5508	DEFINE_PER_CPU(struct kernel_cpustat, kernel_cpustat);
  5509	
  5510	EXPORT_PER_CPU_SYMBOL(kstat);
  5511	EXPORT_PER_CPU_SYMBOL(kernel_cpustat);
  5512	
  5513	/*
  5514	 * The function fair_sched_class.update_curr accesses the struct curr
  5515	 * and its field curr->exec_start; when called from task_sched_runtime(),
  5516	 * we observe a high rate of cache misses in practice.
  5517	 * Prefetching this data results in improved performance.
  5518	 */
  5519	static inline void prefetch_curr_exec_start(struct task_struct *p)
  5520	{
  5521	#ifdef CONFIG_FAIR_GROUP_SCHED
  5522		struct sched_entity *curr = p->se.cfs_rq->curr;
  5523	#else
  5524		struct sched_entity *curr = task_rq(p)->cfs.curr;
  5525	#endif
  5526		prefetch(curr);
  5527		prefetch(&curr->exec_start);
  5528	}
  5529	
  5530	/*
  5531	 * Return accounted runtime for the task.
  5532	 * In case the task is currently running, return the runtime plus current's
  5533	 * pending runtime that have not been accounted yet.
  5534	 */
  5535	unsigned long long task_sched_runtime(struct task_struct *p)
  5536	{
  5537		struct rq_flags rf;
  5538		struct rq *rq;
  5539		u64 ns;
  5540	
  5541	#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
  5542		/*
  5543		 * 64-bit doesn't need locks to atomically read a 64-bit value.
  5544		 * So we have a optimization chance when the task's delta_exec is 0.
  5545		 * Reading ->on_cpu is racy, but this is OK.
  5546		 *
  5547		 * If we race with it leaving CPU, we'll take a lock. So we're correct.
  5548		 * If we race with it entering CPU, unaccounted time is 0. This is
  5549		 * indistinguishable from the read occurring a few cycles earlier.
  5550		 * If we see ->on_cpu without ->on_rq, the task is leaving, and has
  5551		 * been accounted, so we're correct here as well.
  5552		 */
  5553		if (!p->on_cpu || !task_on_rq_queued(p))
  5554			return p->se.sum_exec_runtime;
  5555	#endif
  5556	
  5557		rq = task_rq_lock(p, &rf);
  5558		/*
  5559		 * Must be ->curr _and_ ->on_rq.  If dequeued, we would
  5560		 * project cycles that may never be accounted to this
  5561		 * thread, breaking clock_gettime().
  5562		 */
  5563		if (task_current_donor(rq, p) && task_on_rq_queued(p)) {
  5564			prefetch_curr_exec_start(p);
  5565			update_rq_clock(rq);
  5566			p->sched_class->update_curr(rq);
  5567		}
  5568		ns = p->se.sum_exec_runtime;
  5569		task_rq_unlock(rq, p, &rf);
  5570	
  5571		return ns;
  5572	}
  5573	
  5574	#ifdef CONFIG_SCHED_DEBUG
  5575	static u64 cpu_resched_latency(struct rq *rq)
  5576	{
  5577		int latency_warn_ms = READ_ONCE(sysctl_resched_latency_warn_ms);
  5578		u64 resched_latency, now = rq_clock(rq);
  5579		static bool warned_once;
  5580	
  5581		if (sysctl_resched_latency_warn_once && warned_once)
  5582			return 0;
  5583	
  5584		if (!need_resched() || !latency_warn_ms)
  5585			return 0;
  5586	
  5587		if (system_state == SYSTEM_BOOTING)
  5588			return 0;
  5589	
  5590		if (!rq->last_seen_need_resched_ns) {
  5591			rq->last_seen_need_resched_ns = now;
  5592			rq->ticks_without_resched = 0;
  5593			return 0;
  5594		}
  5595	
  5596		rq->ticks_without_resched++;
  5597		resched_latency = now - rq->last_seen_need_resched_ns;
  5598		if (resched_latency <= latency_warn_ms * NSEC_PER_MSEC)
  5599			return 0;
  5600	
  5601		warned_once = true;
  5602	
  5603		return resched_latency;
  5604	}
  5605	
  5606	static int __init setup_resched_latency_warn_ms(char *str)
  5607	{
  5608		long val;
  5609	
  5610		if ((kstrtol(str, 0, &val))) {
  5611			pr_warn("Unable to set resched_latency_warn_ms\n");
  5612			return 1;
  5613		}
  5614	
  5615		sysctl_resched_latency_warn_ms = val;
  5616		return 1;
  5617	}
  5618	__setup("resched_latency_warn_ms=", setup_resched_latency_warn_ms);
  5619	#else
  5620	static inline u64 cpu_resched_latency(struct rq *rq) { return 0; }
  5621	#endif /* CONFIG_SCHED_DEBUG */
  5622	
  5623	/*
  5624	 * This function gets called by the timer code, with HZ frequency.
  5625	 * We call it with interrupts disabled.
  5626	 */
  5627	void sched_tick(void)
  5628	{
  5629		int cpu = smp_processor_id();
  5630		struct rq *rq = cpu_rq(cpu);
  5631		/* accounting goes to the donor task */
  5632		struct task_struct *donor;
  5633		struct rq_flags rf;
  5634		unsigned long hw_pressure;
  5635		u64 resched_latency;
  5636	
  5637		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  5638			arch_scale_freq_tick();
  5639	
  5640		sched_clock_tick();
  5641	
  5642		rq_lock(rq, &rf);
  5643		donor = rq->donor;
  5644	
  5645		psi_account_irqtime(rq, donor, NULL);
  5646	
  5647		update_rq_clock(rq);
  5648		hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
  5649		update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
  5650	
  5651		if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
  5652			resched_curr(rq);
  5653	
  5654		donor->sched_class->task_tick(rq, donor, 0);
  5655		if (sched_feat(LATENCY_WARN))
  5656			resched_latency = cpu_resched_latency(rq);
  5657		calc_global_load_tick(rq);
  5658		sched_core_tick(rq);
  5659		task_tick_mm_cid(rq, donor);
  5660		scx_tick(rq);
  5661	
  5662		rq_unlock(rq, &rf);
  5663	
  5664		if (sched_feat(LATENCY_WARN) && resched_latency)
  5665			resched_latency_warn(cpu, resched_latency);
  5666	
  5667		perf_event_task_tick();
  5668	
  5669		if (donor->flags & PF_WQ_WORKER)
  5670			wq_worker_tick(donor);
  5671	
  5672	#ifdef CONFIG_SMP
  5673		if (!scx_switched_all()) {
  5674			rq->idle_balance = idle_cpu(cpu);
  5675			sched_balance_trigger(rq);
  5676		}
  5677	#endif
  5678	}
  5679	
  5680	#ifdef CONFIG_NO_HZ_FULL
  5681	
  5682	struct tick_work {
  5683		int			cpu;
  5684		atomic_t		state;
  5685		struct delayed_work	work;
  5686	};
  5687	/* Values for ->state, see diagram below. */
  5688	#define TICK_SCHED_REMOTE_OFFLINE	0
  5689	#define TICK_SCHED_REMOTE_OFFLINING	1
  5690	#define TICK_SCHED_REMOTE_RUNNING	2
  5691	
  5692	/*
  5693	 * State diagram for ->state:
  5694	 *
  5695	 *
  5696	 *          TICK_SCHED_REMOTE_OFFLINE
  5697	 *                    |   ^
  5698	 *                    |   |
  5699	 *                    |   | sched_tick_remote()
  5700	 *                    |   |
  5701	 *                    |   |
  5702	 *                    +--TICK_SCHED_REMOTE_OFFLINING
  5703	 *                    |   ^
  5704	 *                    |   |
  5705	 * sched_tick_start() |   | sched_tick_stop()
  5706	 *                    |   |
  5707	 *                    V   |
  5708	 *          TICK_SCHED_REMOTE_RUNNING
  5709	 *
  5710	 *
  5711	 * Other transitions get WARN_ON_ONCE(), except that sched_tick_remote()
  5712	 * and sched_tick_start() are happy to leave the state in RUNNING.
  5713	 */
  5714	
  5715	static struct tick_work __percpu *tick_work_cpu;
  5716	
  5717	static void sched_tick_remote(struct work_struct *work)
  5718	{
  5719		struct delayed_work *dwork = to_delayed_work(work);
  5720		struct tick_work *twork = container_of(dwork, struct tick_work, work);
  5721		int cpu = twork->cpu;
  5722		struct rq *rq = cpu_rq(cpu);
  5723		int os;
  5724	
  5725		/*
  5726		 * Handle the tick only if it appears the remote CPU is running in full
  5727		 * dynticks mode. The check is racy by nature, but missing a tick or
  5728		 * having one too much is no big deal because the scheduler tick updates
  5729		 * statistics and checks timeslices in a time-independent way, regardless
  5730		 * of when exactly it is running.
  5731		 */
  5732		if (tick_nohz_tick_stopped_cpu(cpu)) {
  5733			guard(rq_lock_irq)(rq);
  5734			struct task_struct *curr = rq->curr;
  5735	
  5736			if (cpu_online(cpu)) {
  5737				/*
  5738				 * Since this is a remote tick for full dynticks mode,
  5739				 * we are always sure that there is no proxy (only a
  5740				 * single task is running).
  5741				 */
  5742				SCHED_WARN_ON(rq->curr != rq->donor);
  5743				update_rq_clock(rq);
  5744	
  5745				if (!is_idle_task(curr)) {
  5746					/*
  5747					 * Make sure the next tick runs within a
  5748					 * reasonable amount of time.
  5749					 */
  5750					u64 delta = rq_clock_task(rq) - curr->se.exec_start;
  5751					WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
  5752				}
  5753				curr->sched_class->task_tick(rq, curr, 0);
  5754	
  5755				calc_load_nohz_remote(rq);
  5756			}
  5757		}
  5758	
  5759		/*
  5760		 * Run the remote tick once per second (1Hz). This arbitrary
  5761		 * frequency is large enough to avoid overload but short enough
  5762		 * to keep scheduler internal stats reasonably up to date.  But
  5763		 * first update state to reflect hotplug activity if required.
  5764		 */
  5765		os = atomic_fetch_add_unless(&twork->state, -1, TICK_SCHED_REMOTE_RUNNING);
  5766		WARN_ON_ONCE(os == TICK_SCHED_REMOTE_OFFLINE);
  5767		if (os == TICK_SCHED_REMOTE_RUNNING)
  5768			queue_delayed_work(system_unbound_wq, dwork, HZ);
  5769	}
  5770	
  5771	static void sched_tick_start(int cpu)
  5772	{
  5773		int os;
  5774		struct tick_work *twork;
  5775	
  5776		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  5777			return;
  5778	
  5779		WARN_ON_ONCE(!tick_work_cpu);
  5780	
  5781		twork = per_cpu_ptr(tick_work_cpu, cpu);
  5782		os = atomic_xchg(&twork->state, TICK_SCHED_REMOTE_RUNNING);
  5783		WARN_ON_ONCE(os == TICK_SCHED_REMOTE_RUNNING);
  5784		if (os == TICK_SCHED_REMOTE_OFFLINE) {
  5785			twork->cpu = cpu;
  5786			INIT_DELAYED_WORK(&twork->work, sched_tick_remote);
  5787			queue_delayed_work(system_unbound_wq, &twork->work, HZ);
  5788		}
  5789	}
  5790	
  5791	#ifdef CONFIG_HOTPLUG_CPU
  5792	static void sched_tick_stop(int cpu)
  5793	{
  5794		struct tick_work *twork;
  5795		int os;
  5796	
  5797		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  5798			return;
  5799	
  5800		WARN_ON_ONCE(!tick_work_cpu);
  5801	
  5802		twork = per_cpu_ptr(tick_work_cpu, cpu);
  5803		/* There cannot be competing actions, but don't rely on stop-machine. */
  5804		os = atomic_xchg(&twork->state, TICK_SCHED_REMOTE_OFFLINING);
  5805		WARN_ON_ONCE(os != TICK_SCHED_REMOTE_RUNNING);
  5806		/* Don't cancel, as this would mess up the state machine. */
  5807	}
  5808	#endif /* CONFIG_HOTPLUG_CPU */
  5809	
  5810	int __init sched_tick_offload_init(void)
  5811	{
  5812		tick_work_cpu = alloc_percpu(struct tick_work);
  5813		BUG_ON(!tick_work_cpu);
  5814		return 0;
  5815	}
  5816	
  5817	#else /* !CONFIG_NO_HZ_FULL */
  5818	static inline void sched_tick_start(int cpu) { }
  5819	static inline void sched_tick_stop(int cpu) { }
  5820	#endif
  5821	
  5822	#if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
  5823					defined(CONFIG_TRACE_PREEMPT_TOGGLE))
  5824	/*
  5825	 * If the value passed in is equal to the current preempt count
  5826	 * then we just disabled preemption. Start timing the latency.
  5827	 */
  5828	static inline void preempt_latency_start(int val)
  5829	{
  5830		if (preempt_count() == val) {
  5831			unsigned long ip = get_lock_parent_ip();
  5832	#ifdef CONFIG_DEBUG_PREEMPT
  5833			current->preempt_disable_ip = ip;
  5834	#endif
  5835			trace_preempt_off(CALLER_ADDR0, ip);
  5836		}
  5837	}
  5838	
  5839	void preempt_count_add(int val)
  5840	{
  5841	#ifdef CONFIG_DEBUG_PREEMPT
  5842		/*
  5843		 * Underflow?
  5844		 */
  5845		if (DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
  5846			return;
  5847	#endif
  5848		__preempt_count_add(val);
  5849	#ifdef CONFIG_DEBUG_PREEMPT
  5850		/*
  5851		 * Spinlock count overflowing soon?
  5852		 */
  5853		DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
  5854					PREEMPT_MASK - 10);
  5855	#endif
  5856		preempt_latency_start(val);
  5857	}
  5858	EXPORT_SYMBOL(preempt_count_add);
  5859	NOKPROBE_SYMBOL(preempt_count_add);
  5860	
  5861	/*
  5862	 * If the value passed in equals to the current preempt count
  5863	 * then we just enabled preemption. Stop timing the latency.
  5864	 */
  5865	static inline void preempt_latency_stop(int val)
  5866	{
  5867		if (preempt_count() == val)
  5868			trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
  5869	}
  5870	
  5871	void preempt_count_sub(int val)
  5872	{
  5873	#ifdef CONFIG_DEBUG_PREEMPT
  5874		/*
  5875		 * Underflow?
  5876		 */
  5877		if (DEBUG_LOCKS_WARN_ON(val > preempt_count()))
  5878			return;
  5879		/*
  5880		 * Is the spinlock portion underflowing?
  5881		 */
  5882		if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
  5883				!(preempt_count() & PREEMPT_MASK)))
  5884			return;
  5885	#endif
  5886	
  5887		preempt_latency_stop(val);
  5888		__preempt_count_sub(val);
  5889	}
  5890	EXPORT_SYMBOL(preempt_count_sub);
  5891	NOKPROBE_SYMBOL(preempt_count_sub);
  5892	
  5893	#else
  5894	static inline void preempt_latency_start(int val) { }
  5895	static inline void preempt_latency_stop(int val) { }
  5896	#endif
  5897	
  5898	static inline unsigned long get_preempt_disable_ip(struct task_struct *p)
  5899	{
  5900	#ifdef CONFIG_DEBUG_PREEMPT
  5901		return p->preempt_disable_ip;
  5902	#else
  5903		return 0;
  5904	#endif
  5905	}
  5906	
  5907	/*
  5908	 * Print scheduling while atomic bug:
  5909	 */
  5910	static noinline void __schedule_bug(struct task_struct *prev)
  5911	{
  5912		/* Save this before calling printk(), since that will clobber it */
  5913		unsigned long preempt_disable_ip = get_preempt_disable_ip(current);
  5914	
  5915		if (oops_in_progress)
  5916			return;
  5917	
  5918		printk(KERN_ERR "BUG: scheduling while atomic: %s/%d/0x%08x\n",
  5919			prev->comm, prev->pid, preempt_count());
  5920	
  5921		debug_show_held_locks(prev);
  5922		print_modules();
  5923		if (irqs_disabled())
  5924			print_irqtrace_events(prev);
  5925		if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)) {
  5926			pr_err("Preemption disabled at:");
  5927			print_ip_sym(KERN_ERR, preempt_disable_ip);
  5928		}
  5929		check_panic_on_warn("scheduling while atomic");
  5930	
  5931		dump_stack();
  5932		add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
  5933	}
  5934	
  5935	/*
  5936	 * Various schedule()-time debugging checks and statistics:
  5937	 */
  5938	static inline void schedule_debug(struct task_struct *prev, bool preempt)
  5939	{
  5940	#ifdef CONFIG_SCHED_STACK_END_CHECK
  5941		if (task_stack_end_corrupted(prev))
  5942			panic("corrupted stack end detected inside scheduler\n");
  5943	
  5944		if (task_scs_end_corrupted(prev))
  5945			panic("corrupted shadow stack detected inside scheduler\n");
  5946	#endif
  5947	
  5948	#ifdef CONFIG_DEBUG_ATOMIC_SLEEP
  5949		if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
  5950			printk(KERN_ERR "BUG: scheduling in a non-blocking section: %s/%d/%i\n",
  5951				prev->comm, prev->pid, prev->non_block_count);
  5952			dump_stack();
  5953			add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
  5954		}
  5955	#endif
  5956	
  5957		if (unlikely(in_atomic_preempt_off())) {
  5958			__schedule_bug(prev);
  5959			preempt_count_set(PREEMPT_DISABLED);
  5960		}
  5961		rcu_sleep_check();
  5962		SCHED_WARN_ON(ct_state() == CT_STATE_USER);
  5963	
  5964		profile_hit(SCHED_PROFILING, __builtin_return_address(0));
  5965	
  5966		schedstat_inc(this_rq()->sched_count);
  5967	}
  5968	
  5969	static void prev_balance(struct rq *rq, struct task_struct *prev,
  5970				 struct rq_flags *rf)
  5971	{
  5972		const struct sched_class *start_class = prev->sched_class;
  5973		const struct sched_class *class;
  5974	
  5975	#ifdef CONFIG_SCHED_CLASS_EXT
  5976		/*
  5977		 * SCX requires a balance() call before every pick_task() including when
  5978		 * waking up from SCHED_IDLE. If @start_class is below SCX, start from
  5979		 * SCX instead. Also, set a flag to detect missing balance() call.
  5980		 */
  5981		if (scx_enabled()) {
  5982			rq->scx.flags |= SCX_RQ_BAL_PENDING;
  5983			if (sched_class_above(&ext_sched_class, start_class))
  5984				start_class = &ext_sched_class;
  5985		}
  5986	#endif
  5987	
  5988		/*
  5989		 * We must do the balancing pass before put_prev_task(), such
  5990		 * that when we release the rq->lock the task is in the same
  5991		 * state as before we took rq->lock.
  5992		 *
  5993		 * We can terminate the balance pass as soon as we know there is
  5994		 * a runnable task of @class priority or higher.
  5995		 */
  5996		for_active_class_range(class, start_class, &idle_sched_class) {
  5997			if (class->balance && class->balance(rq, prev, rf))
  5998				break;
  5999		}
  6000	}
  6001	
  6002	/*
  6003	 * Pick up the highest-prio task:
  6004	 */
  6005	static inline struct task_struct *
  6006	__pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  6007	{
  6008		const struct sched_class *class;
  6009		struct task_struct *p;
  6010	
  6011		rq->dl_server = NULL;
  6012	
  6013		if (scx_enabled())
  6014			goto restart;
  6015	
  6016		/*
  6017		 * Optimization: we know that if all tasks are in the fair class we can
  6018		 * call that function directly, but only if the @prev task wasn't of a
  6019		 * higher scheduling class, because otherwise those lose the
  6020		 * opportunity to pull in more work from other CPUs.
  6021		 */
  6022		if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
  6023			   rq->nr_running == rq->cfs.h_nr_running)) {
  6024	
  6025			p = pick_next_task_fair(rq, prev, rf);
  6026			if (unlikely(p == RETRY_TASK))
  6027				goto restart;
  6028	
  6029			/* Assume the next prioritized class is idle_sched_class */
  6030			if (!p) {
  6031				p = pick_task_idle(rq);
  6032				put_prev_set_next_task(rq, prev, p);
  6033			}
  6034	
  6035			return p;
  6036		}
  6037	
  6038	restart:
  6039		prev_balance(rq, prev, rf);
  6040	
  6041		for_each_active_class(class) {
  6042			if (class->pick_next_task) {
  6043				p = class->pick_next_task(rq, prev);
  6044				if (p)
  6045					return p;
  6046			} else {
  6047				p = class->pick_task(rq);
  6048				if (p) {
  6049					put_prev_set_next_task(rq, prev, p);
  6050					return p;
  6051				}
  6052			}
  6053		}
  6054	
  6055		BUG(); /* The idle class should always have a runnable task. */
  6056	}
  6057	
  6058	#ifdef CONFIG_SCHED_CORE
  6059	static inline bool is_task_rq_idle(struct task_struct *t)
  6060	{
  6061		return (task_rq(t)->idle == t);
  6062	}
  6063	
  6064	static inline bool cookie_equals(struct task_struct *a, unsigned long cookie)
  6065	{
  6066		return is_task_rq_idle(a) || (a->core_cookie == cookie);
  6067	}
  6068	
  6069	static inline bool cookie_match(struct task_struct *a, struct task_struct *b)
  6070	{
  6071		if (is_task_rq_idle(a) || is_task_rq_idle(b))
  6072			return true;
  6073	
  6074		return a->core_cookie == b->core_cookie;
  6075	}
  6076	
  6077	static inline struct task_struct *pick_task(struct rq *rq)
  6078	{
  6079		const struct sched_class *class;
  6080		struct task_struct *p;
  6081	
  6082		rq->dl_server = NULL;
  6083	
  6084		for_each_active_class(class) {
  6085			p = class->pick_task(rq);
  6086			if (p)
  6087				return p;
  6088		}
  6089	
  6090		BUG(); /* The idle class should always have a runnable task. */
  6091	}
  6092	
  6093	extern void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi);
  6094	
  6095	static void queue_core_balance(struct rq *rq);
  6096	
  6097	static struct task_struct *
  6098	pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  6099	{
  6100		struct task_struct *next, *p, *max = NULL;
  6101		const struct cpumask *smt_mask;
  6102		bool fi_before = false;
  6103		bool core_clock_updated = (rq == rq->core);
  6104		unsigned long cookie;
  6105		int i, cpu, occ = 0;
  6106		struct rq *rq_i;
  6107		bool need_sync;
  6108	
  6109		if (!sched_core_enabled(rq))
  6110			return __pick_next_task(rq, prev, rf);
  6111	
  6112		cpu = cpu_of(rq);
  6113	
  6114		/* Stopper task is switching into idle, no need core-wide selection. */
  6115		if (cpu_is_offline(cpu)) {
  6116			/*
  6117			 * Reset core_pick so that we don't enter the fastpath when
  6118			 * coming online. core_pick would already be migrated to
  6119			 * another cpu during offline.
  6120			 */
  6121			rq->core_pick = NULL;
  6122			rq->core_dl_server = NULL;
  6123			return __pick_next_task(rq, prev, rf);
  6124		}
  6125	
  6126		/*
  6127		 * If there were no {en,de}queues since we picked (IOW, the task
  6128		 * pointers are all still valid), and we haven't scheduled the last
  6129		 * pick yet, do so now.
  6130		 *
  6131		 * rq->core_pick can be NULL if no selection was made for a CPU because
  6132		 * it was either offline or went offline during a sibling's core-wide
  6133		 * selection. In this case, do a core-wide selection.
  6134		 */
  6135		if (rq->core->core_pick_seq == rq->core->core_task_seq &&
  6136		    rq->core->core_pick_seq != rq->core_sched_seq &&
  6137		    rq->core_pick) {
  6138			WRITE_ONCE(rq->core_sched_seq, rq->core->core_pick_seq);
  6139	
  6140			next = rq->core_pick;
  6141			rq->dl_server = rq->core_dl_server;
  6142			rq->core_pick = NULL;
  6143			rq->core_dl_server = NULL;
  6144			goto out_set_next;
  6145		}
  6146	
  6147		prev_balance(rq, prev, rf);
  6148	
  6149		smt_mask = cpu_smt_mask(cpu);
  6150		need_sync = !!rq->core->core_cookie;
  6151	
  6152		/* reset state */
  6153		rq->core->core_cookie = 0UL;
  6154		if (rq->core->core_forceidle_count) {
  6155			if (!core_clock_updated) {
  6156				update_rq_clock(rq->core);
  6157				core_clock_updated = true;
  6158			}
  6159			sched_core_account_forceidle(rq);
  6160			/* reset after accounting force idle */
  6161			rq->core->core_forceidle_start = 0;
  6162			rq->core->core_forceidle_count = 0;
  6163			rq->core->core_forceidle_occupation = 0;
  6164			need_sync = true;
  6165			fi_before = true;
  6166		}
  6167	
  6168		/*
  6169		 * core->core_task_seq, core->core_pick_seq, rq->core_sched_seq
  6170		 *
  6171		 * @task_seq guards the task state ({en,de}queues)
  6172		 * @pick_seq is the @task_seq we did a selection on
  6173		 * @sched_seq is the @pick_seq we scheduled
  6174		 *
  6175		 * However, preemptions can cause multiple picks on the same task set.
  6176		 * 'Fix' this by also increasing @task_seq for every pick.
  6177		 */
  6178		rq->core->core_task_seq++;
  6179	
  6180		/*
  6181		 * Optimize for common case where this CPU has no cookies
  6182		 * and there are no cookied tasks running on siblings.
  6183		 */
  6184		if (!need_sync) {
  6185			next = pick_task(rq);
  6186			if (!next->core_cookie) {
  6187				rq->core_pick = NULL;
  6188				rq->core_dl_server = NULL;
  6189				/*
  6190				 * For robustness, update the min_vruntime_fi for
  6191				 * unconstrained picks as well.
  6192				 */
  6193				WARN_ON_ONCE(fi_before);
  6194				task_vruntime_update(rq, next, false);
  6195				goto out_set_next;
  6196			}
  6197		}
  6198	
  6199		/*
  6200		 * For each thread: do the regular task pick and find the max prio task
  6201		 * amongst them.
  6202		 *
  6203		 * Tie-break prio towards the current CPU
  6204		 */
  6205		for_each_cpu_wrap(i, smt_mask, cpu) {
  6206			rq_i = cpu_rq(i);
  6207	
  6208			/*
  6209			 * Current cpu always has its clock updated on entrance to
  6210			 * pick_next_task(). If the current cpu is not the core,
  6211			 * the core may also have been updated above.
  6212			 */
  6213			if (i != cpu && (rq_i != rq->core || !core_clock_updated))
  6214				update_rq_clock(rq_i);
  6215	
  6216			rq_i->core_pick = p = pick_task(rq_i);
  6217			rq_i->core_dl_server = rq_i->dl_server;
  6218	
  6219			if (!max || prio_less(max, p, fi_before))
  6220				max = p;
  6221		}
  6222	
  6223		cookie = rq->core->core_cookie = max->core_cookie;
  6224	
  6225		/*
  6226		 * For each thread: try and find a runnable task that matches @max or
  6227		 * force idle.
  6228		 */
  6229		for_each_cpu(i, smt_mask) {
  6230			rq_i = cpu_rq(i);
  6231			p = rq_i->core_pick;
  6232	
  6233			if (!cookie_equals(p, cookie)) {
  6234				p = NULL;
  6235				if (cookie)
  6236					p = sched_core_find(rq_i, cookie);
  6237				if (!p)
  6238					p = idle_sched_class.pick_task(rq_i);
  6239			}
  6240	
  6241			rq_i->core_pick = p;
  6242			rq_i->core_dl_server = NULL;
  6243	
  6244			if (p == rq_i->idle) {
  6245				if (rq_i->nr_running) {
  6246					rq->core->core_forceidle_count++;
  6247					if (!fi_before)
  6248						rq->core->core_forceidle_seq++;
  6249				}
  6250			} else {
  6251				occ++;
  6252			}
  6253		}
  6254	
  6255		if (schedstat_enabled() && rq->core->core_forceidle_count) {
  6256			rq->core->core_forceidle_start = rq_clock(rq->core);
  6257			rq->core->core_forceidle_occupation = occ;
  6258		}
  6259	
  6260		rq->core->core_pick_seq = rq->core->core_task_seq;
  6261		next = rq->core_pick;
  6262		rq->core_sched_seq = rq->core->core_pick_seq;
  6263	
  6264		/* Something should have been selected for current CPU */
  6265		WARN_ON_ONCE(!next);
  6266	
  6267		/*
  6268		 * Reschedule siblings
  6269		 *
  6270		 * NOTE: L1TF -- at this point we're no longer running the old task and
  6271		 * sending an IPI (below) ensures the sibling will no longer be running
  6272		 * their task. This ensures there is no inter-sibling overlap between
  6273		 * non-matching user state.
  6274		 */
  6275		for_each_cpu(i, smt_mask) {
  6276			rq_i = cpu_rq(i);
  6277	
  6278			/*
  6279			 * An online sibling might have gone offline before a task
  6280			 * could be picked for it, or it might be offline but later
  6281			 * happen to come online, but its too late and nothing was
  6282			 * picked for it.  That's Ok - it will pick tasks for itself,
  6283			 * so ignore it.
  6284			 */
  6285			if (!rq_i->core_pick)
  6286				continue;
  6287	
  6288			/*
  6289			 * Update for new !FI->FI transitions, or if continuing to be in !FI:
  6290			 * fi_before     fi      update?
  6291			 *  0            0       1
  6292			 *  0            1       1
  6293			 *  1            0       1
  6294			 *  1            1       0
  6295			 */
  6296			if (!(fi_before && rq->core->core_forceidle_count))
  6297				task_vruntime_update(rq_i, rq_i->core_pick, !!rq->core->core_forceidle_count);
  6298	
  6299			rq_i->core_pick->core_occupation = occ;
  6300	
  6301			if (i == cpu) {
  6302				rq_i->core_pick = NULL;
  6303				rq_i->core_dl_server = NULL;
  6304				continue;
  6305			}
  6306	
  6307			/* Did we break L1TF mitigation requirements? */
  6308			WARN_ON_ONCE(!cookie_match(next, rq_i->core_pick));
  6309	
  6310			if (rq_i->curr == rq_i->core_pick) {
  6311				rq_i->core_pick = NULL;
  6312				rq_i->core_dl_server = NULL;
  6313				continue;
  6314			}
  6315	
  6316			resched_curr(rq_i);
  6317		}
  6318	
  6319	out_set_next:
  6320		put_prev_set_next_task(rq, prev, next);
  6321		if (rq->core->core_forceidle_count && next == rq->idle)
  6322			queue_core_balance(rq);
  6323	
  6324		return next;
  6325	}
  6326	
  6327	static bool try_steal_cookie(int this, int that)
  6328	{
  6329		struct rq *dst = cpu_rq(this), *src = cpu_rq(that);
  6330		struct task_struct *p;
  6331		unsigned long cookie;
  6332		bool success = false;
  6333	
  6334		guard(irq)();
  6335		guard(double_rq_lock)(dst, src);
  6336	
  6337		cookie = dst->core->core_cookie;
  6338		if (!cookie)
  6339			return false;
  6340	
  6341		if (dst->curr != dst->idle)
  6342			return false;
  6343	
  6344		p = sched_core_find(src, cookie);
  6345		if (!p)
  6346			return false;
  6347	
  6348		do {
  6349			if (p == src->core_pick || p == src->curr)
  6350				goto next;
  6351	
  6352			if (!is_cpu_allowed(p, this))
  6353				goto next;
  6354	
  6355			if (p->core_occupation > dst->idle->core_occupation)
  6356				goto next;
  6357			/*
  6358			 * sched_core_find() and sched_core_next() will ensure
  6359			 * that task @p is not throttled now, we also need to
  6360			 * check whether the runqueue of the destination CPU is
  6361			 * being throttled.
  6362			 */
  6363			if (sched_task_is_throttled(p, this))
  6364				goto next;
  6365	
  6366			move_queued_task_locked(src, dst, p);
  6367			resched_curr(dst);
  6368	
  6369			success = true;
  6370			break;
  6371	
  6372	next:
  6373			p = sched_core_next(p, cookie);
  6374		} while (p);
  6375	
  6376		return success;
  6377	}
  6378	
  6379	static bool steal_cookie_task(int cpu, struct sched_domain *sd)
  6380	{
  6381		int i;
  6382	
  6383		for_each_cpu_wrap(i, sched_domain_span(sd), cpu + 1) {
  6384			if (i == cpu)
  6385				continue;
  6386	
  6387			if (need_resched())
  6388				break;
  6389	
  6390			if (try_steal_cookie(cpu, i))
  6391				return true;
  6392		}
  6393	
  6394		return false;
  6395	}
  6396	
  6397	static void sched_core_balance(struct rq *rq)
  6398	{
  6399		struct sched_domain *sd;
  6400		int cpu = cpu_of(rq);
  6401	
  6402		guard(preempt)();
  6403		guard(rcu)();
  6404	
  6405		raw_spin_rq_unlock_irq(rq);
  6406		for_each_domain(cpu, sd) {
  6407			if (need_resched())
  6408				break;
  6409	
  6410			if (steal_cookie_task(cpu, sd))
  6411				break;
  6412		}
  6413		raw_spin_rq_lock_irq(rq);
  6414	}
  6415	
  6416	static DEFINE_PER_CPU(struct balance_callback, core_balance_head);
  6417	
  6418	static void queue_core_balance(struct rq *rq)
  6419	{
  6420		if (!sched_core_enabled(rq))
  6421			return;
  6422	
  6423		if (!rq->core->core_cookie)
  6424			return;
  6425	
  6426		if (!rq->nr_running) /* not forced idle */
  6427			return;
  6428	
  6429		queue_balance_callback(rq, &per_cpu(core_balance_head, rq->cpu), sched_core_balance);
  6430	}
  6431	
  6432	DEFINE_LOCK_GUARD_1(core_lock, int,
  6433			    sched_core_lock(*_T->lock, &_T->flags),
  6434			    sched_core_unlock(*_T->lock, &_T->flags),
  6435			    unsigned long flags)
  6436	
  6437	static void sched_core_cpu_starting(unsigned int cpu)
  6438	{
  6439		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
  6440		struct rq *rq = cpu_rq(cpu), *core_rq = NULL;
  6441		int t;
  6442	
  6443		guard(core_lock)(&cpu);
  6444	
  6445		WARN_ON_ONCE(rq->core != rq);
  6446	
  6447		/* if we're the first, we'll be our own leader */
  6448		if (cpumask_weight(smt_mask) == 1)
  6449			return;
  6450	
  6451		/* find the leader */
  6452		for_each_cpu(t, smt_mask) {
  6453			if (t == cpu)
  6454				continue;
  6455			rq = cpu_rq(t);
  6456			if (rq->core == rq) {
  6457				core_rq = rq;
  6458				break;
  6459			}
  6460		}
  6461	
  6462		if (WARN_ON_ONCE(!core_rq)) /* whoopsie */
  6463			return;
  6464	
  6465		/* install and validate core_rq */
  6466		for_each_cpu(t, smt_mask) {
  6467			rq = cpu_rq(t);
  6468	
  6469			if (t == cpu)
  6470				rq->core = core_rq;
  6471	
  6472			WARN_ON_ONCE(rq->core != core_rq);
  6473		}
  6474	}
  6475	
  6476	static void sched_core_cpu_deactivate(unsigned int cpu)
  6477	{
  6478		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
  6479		struct rq *rq = cpu_rq(cpu), *core_rq = NULL;
  6480		int t;
  6481	
  6482		guard(core_lock)(&cpu);
  6483	
  6484		/* if we're the last man standing, nothing to do */
  6485		if (cpumask_weight(smt_mask) == 1) {
  6486			WARN_ON_ONCE(rq->core != rq);
  6487			return;
  6488		}
  6489	
  6490		/* if we're not the leader, nothing to do */
  6491		if (rq->core != rq)
  6492			return;
  6493	
  6494		/* find a new leader */
  6495		for_each_cpu(t, smt_mask) {
  6496			if (t == cpu)
  6497				continue;
  6498			core_rq = cpu_rq(t);
  6499			break;
  6500		}
  6501	
  6502		if (WARN_ON_ONCE(!core_rq)) /* impossible */
  6503			return;
  6504	
  6505		/* copy the shared state to the new leader */
  6506		core_rq->core_task_seq             = rq->core_task_seq;
  6507		core_rq->core_pick_seq             = rq->core_pick_seq;
  6508		core_rq->core_cookie               = rq->core_cookie;
  6509		core_rq->core_forceidle_count      = rq->core_forceidle_count;
  6510		core_rq->core_forceidle_seq        = rq->core_forceidle_seq;
  6511		core_rq->core_forceidle_occupation = rq->core_forceidle_occupation;
  6512	
  6513		/*
  6514		 * Accounting edge for forced idle is handled in pick_next_task().
  6515		 * Don't need another one here, since the hotplug thread shouldn't
  6516		 * have a cookie.
  6517		 */
  6518		core_rq->core_forceidle_start = 0;
  6519	
  6520		/* install new leader */
  6521		for_each_cpu(t, smt_mask) {
  6522			rq = cpu_rq(t);
  6523			rq->core = core_rq;
  6524		}
  6525	}
  6526	
  6527	static inline void sched_core_cpu_dying(unsigned int cpu)
  6528	{
  6529		struct rq *rq = cpu_rq(cpu);
  6530	
  6531		if (rq->core != rq)
  6532			rq->core = rq;
  6533	}
  6534	
  6535	#else /* !CONFIG_SCHED_CORE */
  6536	
  6537	static inline void sched_core_cpu_starting(unsigned int cpu) {}
  6538	static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
  6539	static inline void sched_core_cpu_dying(unsigned int cpu) {}
  6540	
  6541	static struct task_struct *
  6542	pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  6543	{
  6544		return __pick_next_task(rq, prev, rf);
  6545	}
  6546	
  6547	#endif /* CONFIG_SCHED_CORE */
  6548	
  6549	/*
  6550	 * Constants for the sched_mode argument of __schedule().
  6551	 *
  6552	 * The mode argument allows RT enabled kernels to differentiate a
  6553	 * preemption from blocking on an 'sleeping' spin/rwlock.
  6554	 */
  6555	#define SM_IDLE			(-1)
  6556	#define SM_NONE			0
  6557	#define SM_PREEMPT		1
  6558	#define SM_RTLOCK_WAIT		2
  6559	
  6560	/*
  6561	 * Helper function for __schedule()
  6562	 *
  6563	 * If a task does not have signals pending, deactivate it
  6564	 * Otherwise marks the task's __state as RUNNING
  6565	 */
  6566	static bool try_to_block_task(struct rq *rq, struct task_struct *p,
  6567				      unsigned long task_state)
  6568	{
  6569		int flags = DEQUEUE_NOCLOCK;
  6570	
  6571		if (signal_pending_state(task_state, p)) {
  6572			WRITE_ONCE(p->__state, TASK_RUNNING);
  6573			return false;
  6574		}
  6575	
  6576		p->sched_contributes_to_load =
  6577			(task_state & TASK_UNINTERRUPTIBLE) &&
  6578			!(task_state & TASK_NOLOAD) &&
  6579			!(task_state & TASK_FROZEN);
  6580	
  6581		if (unlikely(is_special_task_state(task_state)))
  6582			flags |= DEQUEUE_SPECIAL;
  6583	
  6584		/*
  6585		 * __schedule()			ttwu()
  6586		 *   prev_state = prev->state;    if (p->on_rq && ...)
  6587		 *   if (prev_state)		    goto out;
  6588		 *     p->on_rq = 0;		  smp_acquire__after_ctrl_dep();
  6589		 *				  p->state = TASK_WAKING
  6590		 *
  6591		 * Where __schedule() and ttwu() have matching control dependencies.
  6592		 *
  6593		 * After this, schedule() must not care about p->state any more.
  6594		 */
  6595		block_task(rq, p, flags);
  6596		return true;
  6597	}
  6598	
  6599	/*
  6600	 * __schedule() is the main scheduler function.
  6601	 *
  6602	 * The main means of driving the scheduler and thus entering this function are:
  6603	 *
  6604	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  6605	 *
  6606	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  6607	 *      paths. For example, see arch/x86/entry_64.S.
  6608	 *
  6609	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  6610	 *      interrupt handler sched_tick().
  6611	 *
  6612	 *   3. Wakeups don't really cause entry into schedule(). They add a
  6613	 *      task to the run-queue and that's it.
  6614	 *
  6615	 *      Now, if the new task added to the run-queue preempts the current
  6616	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  6617	 *      called on the nearest possible occasion:
  6618	 *
  6619	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  6620	 *
  6621	 *         - in syscall or exception context, at the next outmost
  6622	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  6623	 *           spin_unlock()!)
  6624	 *
  6625	 *         - in IRQ context, return from interrupt-handler to
  6626	 *           preemptible context
  6627	 *
  6628	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  6629	 *         then at the next:
  6630	 *
  6631	 *          - cond_resched() call
  6632	 *          - explicit schedule() call
  6633	 *          - return from syscall or exception to user-space
  6634	 *          - return from interrupt-handler to user-space
  6635	 *
  6636	 * WARNING: must be called with preemption disabled!
  6637	 */
  6638	static void __sched notrace __schedule(int sched_mode)
  6639	{
  6640		struct task_struct *prev, *next;
  6641		/*
  6642		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  6643		 * as a preemption by schedule_debug() and RCU.
  6644		 */
  6645		bool preempt = sched_mode > SM_NONE;
  6646		bool block = false;
  6647		unsigned long *switch_count;
  6648		unsigned long prev_state;
  6649		struct rq_flags rf;
  6650		struct rq *rq;
  6651		int cpu;
  6652	
  6653		cpu = smp_processor_id();
  6654		rq = cpu_rq(cpu);
  6655		prev = rq->curr;
  6656	
  6657		schedule_debug(prev, preempt);
  6658	
  6659		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  6660			hrtick_clear(rq);
  6661	
  6662		local_irq_disable();
  6663		rcu_note_context_switch(preempt);
  6664	
  6665		/*
  6666		 * Make sure that signal_pending_state()->signal_pending() below
  6667		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  6668		 * done by the caller to avoid the race with signal_wake_up():
  6669		 *
  6670		 * __set_current_state(@state)		signal_wake_up()
  6671		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  6672		 *					  wake_up_state(p, state)
  6673		 *   LOCK rq->lock			    LOCK p->pi_state
  6674		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  6675		 *     if (signal_pending_state())	    if (p->state & @state)
  6676		 *
  6677		 * Also, the membarrier system call requires a full memory barrier
  6678		 * after coming from user-space, before storing to rq->curr; this
  6679		 * barrier matches a full barrier in the proximity of the membarrier
  6680		 * system call exit.
  6681		 */
  6682		rq_lock(rq, &rf);
  6683		smp_mb__after_spinlock();
  6684	
  6685		/* Promote REQ to ACT */
  6686		rq->clock_update_flags <<= 1;
  6687		update_rq_clock(rq);
  6688		rq->clock_update_flags = RQCF_UPDATED;
  6689	
  6690		switch_count = &prev->nivcsw;
  6691	
  6692		/* Task state changes only considers SM_PREEMPT as preemption */
  6693		preempt = sched_mode == SM_PREEMPT;
  6694	
  6695		/*
  6696		 * We must load prev->state once (task_struct::state is volatile), such
  6697		 * that we form a control dependency vs deactivate_task() below.
  6698		 */
  6699		prev_state = READ_ONCE(prev->__state);
  6700		if (sched_mode == SM_IDLE) {
  6701			/* SCX must consult the BPF scheduler to tell if rq is empty */
  6702			if (!rq->nr_running && !scx_enabled()) {
  6703				next = prev;
  6704				goto picked;
  6705			}
  6706		} else if (!preempt && prev_state) {
  6707			block = try_to_block_task(rq, prev, prev_state);
  6708			switch_count = &prev->nvcsw;
  6709		}
  6710	
  6711		next = pick_next_task(rq, prev, &rf);
  6712		rq_set_donor(rq, next);
  6713	picked:
  6714		clear_tsk_need_resched(prev);
  6715		clear_preempt_need_resched();
  6716	#ifdef CONFIG_SCHED_DEBUG
  6717		rq->last_seen_need_resched_ns = 0;
  6718	#endif
  6719	
  6720		if (likely(prev != next)) {
  6721			rq->nr_switches++;
  6722			/*
  6723			 * RCU users of rcu_dereference(rq->curr) may not see
  6724			 * changes to task_struct made by pick_next_task().
  6725			 */
  6726			RCU_INIT_POINTER(rq->curr, next);
  6727			/*
  6728			 * The membarrier system call requires each architecture
  6729			 * to have a full memory barrier after updating
  6730			 * rq->curr, before returning to user-space.
  6731			 *
  6732			 * Here are the schemes providing that barrier on the
  6733			 * various architectures:
  6734			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6735			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6736			 *   on PowerPC and on RISC-V.
  6737			 * - finish_lock_switch() for weakly-ordered
  6738			 *   architectures where spin_unlock is a full barrier,
  6739			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6740			 *   is a RELEASE barrier),
  6741			 *
  6742			 * The barrier matches a full barrier in the proximity of
  6743			 * the membarrier system call entry.
  6744			 *
  6745			 * On RISC-V, this barrier pairing is also needed for the
  6746			 * SYNC_CORE command when switching between processes, cf.
  6747			 * the inline comments in membarrier_arch_switch_mm().
  6748			 */
  6749			++*switch_count;
  6750	
  6751			migrate_disable_switch(rq, prev);
  6752			psi_account_irqtime(rq, prev, next);
  6753			psi_sched_switch(prev, next, block);
  6754	
  6755			trace_sched_switch(preempt, prev, next, prev_state);
  6756	
  6757			/* Also unlocks the rq: */
  6758			rq = context_switch(rq, prev, next, &rf);
  6759		} else {
  6760			rq_unpin_lock(rq, &rf);
  6761			__balance_callbacks(rq);
  6762			raw_spin_rq_unlock_irq(rq);
  6763		}
  6764	}
  6765	
  6766	void __noreturn do_task_dead(void)
  6767	{
  6768		/* Causes final put_task_struct in finish_task_switch(): */
  6769		set_special_state(TASK_DEAD);
  6770	
  6771		/* Tell freezer to ignore us: */
  6772		current->flags |= PF_NOFREEZE;
  6773	
  6774		__schedule(SM_NONE);
  6775		BUG();
  6776	
  6777		/* Avoid "noreturn function does return" - but don't continue if BUG() is a NOP: */
  6778		for (;;)
  6779			cpu_relax();
  6780	}
  6781	
  6782	static inline void sched_submit_work(struct task_struct *tsk)
  6783	{
  6784		static DEFINE_WAIT_OVERRIDE_MAP(sched_map, LD_WAIT_CONFIG);
  6785		unsigned int task_flags;
  6786	
  6787		/*
  6788		 * Establish LD_WAIT_CONFIG context to ensure none of the code called
  6789		 * will use a blocking primitive -- which would lead to recursion.
  6790		 */
  6791		lock_map_acquire_try(&sched_map);
  6792	
  6793		task_flags = tsk->flags;
  6794		/*
  6795		 * If a worker goes to sleep, notify and ask workqueue whether it
  6796		 * wants to wake up a task to maintain concurrency.
  6797		 */
  6798		if (task_flags & PF_WQ_WORKER)
  6799			wq_worker_sleeping(tsk);
  6800		else if (task_flags & PF_IO_WORKER)
  6801			io_wq_worker_sleeping(tsk);
  6802	
  6803		/*
  6804		 * spinlock and rwlock must not flush block requests.  This will
  6805		 * deadlock if the callback attempts to acquire a lock which is
  6806		 * already acquired.
  6807		 */
  6808		SCHED_WARN_ON(current->__state & TASK_RTLOCK_WAIT);
  6809	
  6810		/*
  6811		 * If we are going to sleep and we have plugged IO queued,
  6812		 * make sure to submit it to avoid deadlocks.
  6813		 */
  6814		blk_flush_plug(tsk->plug, true);
  6815	
  6816		lock_map_release(&sched_map);
  6817	}
  6818	
  6819	static void sched_update_worker(struct task_struct *tsk)
  6820	{
  6821		if (tsk->flags & (PF_WQ_WORKER | PF_IO_WORKER | PF_BLOCK_TS)) {
  6822			if (tsk->flags & PF_BLOCK_TS)
  6823				blk_plug_invalidate_ts(tsk);
  6824			if (tsk->flags & PF_WQ_WORKER)
  6825				wq_worker_running(tsk);
  6826			else if (tsk->flags & PF_IO_WORKER)
  6827				io_wq_worker_running(tsk);
  6828		}
  6829	}
  6830	
  6831	static __always_inline void __schedule_loop(int sched_mode)
  6832	{
  6833		do {
  6834			preempt_disable();
  6835			__schedule(sched_mode);
  6836			sched_preempt_enable_no_resched();
  6837		} while (need_resched());
  6838	}
  6839	
  6840	asmlinkage __visible void __sched schedule(void)
  6841	{
  6842		struct task_struct *tsk = current;
  6843	
  6844	#ifdef CONFIG_RT_MUTEXES
  6845		lockdep_assert(!tsk->sched_rt_mutex);
  6846	#endif
  6847	
  6848		if (!task_is_running(tsk))
  6849			sched_submit_work(tsk);
  6850		__schedule_loop(SM_NONE);
  6851		sched_update_worker(tsk);
  6852	}
  6853	EXPORT_SYMBOL(schedule);
  6854	
  6855	/*
  6856	 * synchronize_rcu_tasks() makes sure that no task is stuck in preempted
  6857	 * state (have scheduled out non-voluntarily) by making sure that all
  6858	 * tasks have either left the run queue or have gone into user space.
  6859	 * As idle tasks do not do either, they must not ever be preempted
  6860	 * (schedule out non-voluntarily).
  6861	 *
  6862	 * schedule_idle() is similar to schedule_preempt_disable() except that it
  6863	 * never enables preemption because it does not call sched_submit_work().
  6864	 */
  6865	void __sched schedule_idle(void)
  6866	{
  6867		/*
  6868		 * As this skips calling sched_submit_work(), which the idle task does
  6869		 * regardless because that function is a NOP when the task is in a
  6870		 * TASK_RUNNING state, make sure this isn't used someplace that the
  6871		 * current task can be in any other state. Note, idle is always in the
  6872		 * TASK_RUNNING state.
  6873		 */
  6874		WARN_ON_ONCE(current->__state);
  6875		do {
  6876			__schedule(SM_IDLE);
  6877		} while (need_resched());
  6878	}
  6879	
  6880	#if defined(CONFIG_CONTEXT_TRACKING_USER) && !defined(CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK)
  6881	asmlinkage __visible void __sched schedule_user(void)
  6882	{
  6883		/*
  6884		 * If we come here after a random call to set_need_resched(),
  6885		 * or we have been woken up remotely but the IPI has not yet arrived,
  6886		 * we haven't yet exited the RCU idle mode. Do it here manually until
  6887		 * we find a better solution.
  6888		 *
  6889		 * NB: There are buggy callers of this function.  Ideally we
  6890		 * should warn if prev_state != CT_STATE_USER, but that will trigger
  6891		 * too frequently to make sense yet.
  6892		 */
  6893		enum ctx_state prev_state = exception_enter();
  6894		schedule();
  6895		exception_exit(prev_state);
  6896	}
  6897	#endif
  6898	
  6899	/**
  6900	 * schedule_preempt_disabled - called with preemption disabled
  6901	 *
  6902	 * Returns with preemption disabled. Note: preempt_count must be 1
  6903	 */
  6904	void __sched schedule_preempt_disabled(void)
  6905	{
  6906		sched_preempt_enable_no_resched();
  6907		schedule();
  6908		preempt_disable();
  6909	}
  6910	
  6911	#ifdef CONFIG_PREEMPT_RT
  6912	void __sched notrace schedule_rtlock(void)
  6913	{
  6914		__schedule_loop(SM_RTLOCK_WAIT);
  6915	}
  6916	NOKPROBE_SYMBOL(schedule_rtlock);
  6917	#endif
  6918	
  6919	static void __sched notrace preempt_schedule_common(void)
  6920	{
  6921		do {
  6922			/*
  6923			 * Because the function tracer can trace preempt_count_sub()
  6924			 * and it also uses preempt_enable/disable_notrace(), if
  6925			 * NEED_RESCHED is set, the preempt_enable_notrace() called
  6926			 * by the function tracer will call this function again and
  6927			 * cause infinite recursion.
  6928			 *
  6929			 * Preemption must be disabled here before the function
  6930			 * tracer can trace. Break up preempt_disable() into two
  6931			 * calls. One to disable preemption without fear of being
  6932			 * traced. The other to still record the preemption latency,
  6933			 * which can also be traced by the function tracer.
  6934			 */
  6935			preempt_disable_notrace();
  6936			preempt_latency_start(1);
  6937			__schedule(SM_PREEMPT);
  6938			preempt_latency_stop(1);
  6939			preempt_enable_no_resched_notrace();
  6940	
  6941			/*
  6942			 * Check again in case we missed a preemption opportunity
  6943			 * between schedule and now.
  6944			 */
  6945		} while (need_resched());
  6946	}
  6947	
  6948	#ifdef CONFIG_PREEMPTION
  6949	/*
  6950	 * This is the entry point to schedule() from in-kernel preemption
  6951	 * off of preempt_enable.
  6952	 */
  6953	asmlinkage __visible void __sched notrace preempt_schedule(void)
  6954	{
  6955		/*
  6956		 * If there is a non-zero preempt_count or interrupts are disabled,
  6957		 * we do not want to preempt the current task. Just return..
  6958		 */
  6959		if (likely(!preemptible()))
  6960			return;
  6961		preempt_schedule_common();
  6962	}
  6963	NOKPROBE_SYMBOL(preempt_schedule);
  6964	EXPORT_SYMBOL(preempt_schedule);
  6965	
  6966	#ifdef CONFIG_PREEMPT_DYNAMIC
  6967	#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
  6968	#ifndef preempt_schedule_dynamic_enabled
  6969	#define preempt_schedule_dynamic_enabled	preempt_schedule
  6970	#define preempt_schedule_dynamic_disabled	NULL
  6971	#endif
  6972	DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
  6973	EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
  6974	#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
  6975	static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
  6976	void __sched notrace dynamic_preempt_schedule(void)
  6977	{
  6978		if (!static_branch_unlikely(&sk_dynamic_preempt_schedule))
  6979			return;
  6980		preempt_schedule();
  6981	}
  6982	NOKPROBE_SYMBOL(dynamic_preempt_schedule);
  6983	EXPORT_SYMBOL(dynamic_preempt_schedule);
  6984	#endif
  6985	#endif
  6986	
  6987	/**
  6988	 * preempt_schedule_notrace - preempt_schedule called by tracing
  6989	 *
  6990	 * The tracing infrastructure uses preempt_enable_notrace to prevent
  6991	 * recursion and tracing preempt enabling caused by the tracing
  6992	 * infrastructure itself. But as tracing can happen in areas coming
  6993	 * from userspace or just about to enter userspace, a preempt enable
  6994	 * can occur before user_exit() is called. This will cause the scheduler
  6995	 * to be called when the system is still in usermode.
  6996	 *
  6997	 * To prevent this, the preempt_enable_notrace will use this function
  6998	 * instead of preempt_schedule() to exit user context if needed before
  6999	 * calling the scheduler.
  7000	 */
  7001	asmlinkage __visible void __sched notrace preempt_schedule_notrace(void)
  7002	{
  7003		enum ctx_state prev_ctx;
  7004	
  7005		if (likely(!preemptible()))
  7006			return;
  7007	
  7008		do {
  7009			/*
  7010			 * Because the function tracer can trace preempt_count_sub()
  7011			 * and it also uses preempt_enable/disable_notrace(), if
  7012			 * NEED_RESCHED is set, the preempt_enable_notrace() called
  7013			 * by the function tracer will call this function again and
  7014			 * cause infinite recursion.
  7015			 *
  7016			 * Preemption must be disabled here before the function
  7017			 * tracer can trace. Break up preempt_disable() into two
  7018			 * calls. One to disable preemption without fear of being
  7019			 * traced. The other to still record the preemption latency,
  7020			 * which can also be traced by the function tracer.
  7021			 */
  7022			preempt_disable_notrace();
  7023			preempt_latency_start(1);
  7024			/*
  7025			 * Needs preempt disabled in case user_exit() is traced
  7026			 * and the tracer calls preempt_enable_notrace() causing
  7027			 * an infinite recursion.
  7028			 */
  7029			prev_ctx = exception_enter();
  7030			__schedule(SM_PREEMPT);
  7031			exception_exit(prev_ctx);
  7032	
  7033			preempt_latency_stop(1);
  7034			preempt_enable_no_resched_notrace();
  7035		} while (need_resched());
  7036	}
  7037	EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
  7038	
  7039	#ifdef CONFIG_PREEMPT_DYNAMIC
  7040	#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
  7041	#ifndef preempt_schedule_notrace_dynamic_enabled
  7042	#define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace
  7043	#define preempt_schedule_notrace_dynamic_disabled	NULL
  7044	#endif
  7045	DEFINE_STATIC_CALL(preempt_schedule_notrace, preempt_schedule_notrace_dynamic_enabled);
  7046	EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
  7047	#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
  7048	static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule_notrace);
  7049	void __sched notrace dynamic_preempt_schedule_notrace(void)
  7050	{
  7051		if (!static_branch_unlikely(&sk_dynamic_preempt_schedule_notrace))
  7052			return;
  7053		preempt_schedule_notrace();
  7054	}
  7055	NOKPROBE_SYMBOL(dynamic_preempt_schedule_notrace);
  7056	EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
  7057	#endif
  7058	#endif
  7059	
  7060	#endif /* CONFIG_PREEMPTION */
  7061	
  7062	/*
  7063	 * This is the entry point to schedule() from kernel preemption
  7064	 * off of IRQ context.
  7065	 * Note, that this is called and return with IRQs disabled. This will
  7066	 * protect us against recursive calling from IRQ contexts.
  7067	 */
  7068	asmlinkage __visible void __sched preempt_schedule_irq(void)
  7069	{
  7070		enum ctx_state prev_state;
  7071	
  7072		/* Catch callers which need to be fixed */
  7073		BUG_ON(preempt_count() || !irqs_disabled());
  7074	
  7075		prev_state = exception_enter();
  7076	
  7077		do {
  7078			preempt_disable();
  7079			local_irq_enable();
  7080			__schedule(SM_PREEMPT);
  7081			local_irq_disable();
  7082			sched_preempt_enable_no_resched();
  7083		} while (need_resched());
  7084	
  7085		exception_exit(prev_state);
  7086	}
  7087	
  7088	int default_wake_function(wait_queue_entry_t *curr, unsigned mode, int wake_flags,
  7089				  void *key)
  7090	{
  7091		WARN_ON_ONCE(IS_ENABLED(CONFIG_SCHED_DEBUG) && wake_flags & ~(WF_SYNC|WF_CURRENT_CPU));
  7092		return try_to_wake_up(curr->private, mode, wake_flags);
  7093	}
  7094	EXPORT_SYMBOL(default_wake_function);
  7095	
  7096	const struct sched_class *__setscheduler_class(int policy, int prio)
  7097	{
  7098		if (dl_prio(prio))
  7099			return &dl_sched_class;
  7100	
  7101		if (rt_prio(prio))
  7102			return &rt_sched_class;
  7103	
  7104	#ifdef CONFIG_SCHED_CLASS_EXT
  7105		if (task_should_scx(policy))
  7106			return &ext_sched_class;
  7107	#endif
  7108	
  7109		return &fair_sched_class;
  7110	}
  7111	
  7112	#ifdef CONFIG_RT_MUTEXES
  7113	
  7114	/*
  7115	 * Would be more useful with typeof()/auto_type but they don't mix with
  7116	 * bit-fields. Since it's a local thing, use int. Keep the generic sounding
  7117	 * name such that if someone were to implement this function we get to compare
  7118	 * notes.
  7119	 */
  7120	#define fetch_and_set(x, v) ({ int _x = (x); (x) = (v); _x; })
  7121	
  7122	void rt_mutex_pre_schedule(void)
  7123	{
  7124		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  7125		sched_submit_work(current);
  7126	}
  7127	
  7128	void rt_mutex_schedule(void)
  7129	{
  7130		lockdep_assert(current->sched_rt_mutex);
  7131		__schedule_loop(SM_NONE);
  7132	}
  7133	
  7134	void rt_mutex_post_schedule(void)
  7135	{
  7136		sched_update_worker(current);
  7137		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  7138	}
  7139	
  7140	/*
  7141	 * rt_mutex_setprio - set the current priority of a task
  7142	 * @p: task to boost
  7143	 * @pi_task: donor task
  7144	 *
  7145	 * This function changes the 'effective' priority of a task. It does
  7146	 * not touch ->normal_prio like __setscheduler().
  7147	 *
  7148	 * Used by the rt_mutex code to implement priority inheritance
  7149	 * logic. Call site only calls if the priority of the task changed.
  7150	 */
  7151	void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
  7152	{
  7153		int prio, oldprio, queued, running, queue_flag =
  7154			DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
  7155		const struct sched_class *prev_class, *next_class;
  7156		struct rq_flags rf;
  7157		struct rq *rq;
  7158	
  7159		/* XXX used to be waiter->prio, not waiter->task->prio */
  7160		prio = __rt_effective_prio(pi_task, p->normal_prio);
  7161	
  7162		/*
  7163		 * If nothing changed; bail early.
  7164		 */
  7165		if (p->pi_top_task == pi_task && prio == p->prio && !dl_prio(prio))
  7166			return;
  7167	
  7168		rq = __task_rq_lock(p, &rf);
  7169		update_rq_clock(rq);
  7170		/*
  7171		 * Set under pi_lock && rq->lock, such that the value can be used under
  7172		 * either lock.
  7173		 *
  7174		 * Note that there is loads of tricky to make this pointer cache work
  7175		 * right. rt_mutex_slowunlock()+rt_mutex_postunlock() work together to
  7176		 * ensure a task is de-boosted (pi_task is set to NULL) before the
  7177		 * task is allowed to run again (and can exit). This ensures the pointer
  7178		 * points to a blocked task -- which guarantees the task is present.
  7179		 */
  7180		p->pi_top_task = pi_task;
  7181	
  7182		/*
  7183		 * For FIFO/RR we only need to set prio, if that matches we're done.
  7184		 */
  7185		if (prio == p->prio && !dl_prio(prio))
  7186			goto out_unlock;
  7187	
  7188		/*
  7189		 * Idle task boosting is a no-no in general. There is one
  7190		 * exception, when PREEMPT_RT and NOHZ is active:
  7191		 *
  7192		 * The idle task calls get_next_timer_interrupt() and holds
  7193		 * the timer wheel base->lock on the CPU and another CPU wants
  7194		 * to access the timer (probably to cancel it). We can safely
  7195		 * ignore the boosting request, as the idle CPU runs this code
  7196		 * with interrupts disabled and will complete the lock
  7197		 * protected section without being interrupted. So there is no
  7198		 * real need to boost.
  7199		 */
  7200		if (unlikely(p == rq->idle)) {
  7201			WARN_ON(p != rq->curr);
  7202			WARN_ON(p->pi_blocked_on);
  7203			goto out_unlock;
  7204		}
  7205	
  7206		trace_sched_pi_setprio(p, pi_task);
  7207		oldprio = p->prio;
  7208	
  7209		if (oldprio == prio)
  7210			queue_flag &= ~DEQUEUE_MOVE;
  7211	
  7212		prev_class = p->sched_class;
  7213		next_class = __setscheduler_class(p->policy, prio);
  7214	
  7215		if (prev_class != next_class && p->se.sched_delayed)
  7216			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK);
  7217	
  7218		queued = task_on_rq_queued(p);
  7219		running = task_current_donor(rq, p);
  7220		if (queued)
  7221			dequeue_task(rq, p, queue_flag);
  7222		if (running)
  7223			put_prev_task(rq, p);
  7224	
  7225		/*
  7226		 * Boosting condition are:
  7227		 * 1. -rt task is running and holds mutex A
  7228		 *      --> -dl task blocks on mutex A
  7229		 *
  7230		 * 2. -dl task is running and holds mutex A
  7231		 *      --> -dl task blocks on mutex A and could preempt the
  7232		 *          running task
  7233		 */
  7234		if (dl_prio(prio)) {
  7235			if (!dl_prio(p->normal_prio) ||
  7236			    (pi_task && dl_prio(pi_task->prio) &&
  7237			     dl_entity_preempt(&pi_task->dl, &p->dl))) {
  7238				p->dl.pi_se = pi_task->dl.pi_se;
  7239				queue_flag |= ENQUEUE_REPLENISH;
  7240			} else {
  7241				p->dl.pi_se = &p->dl;
  7242			}
  7243		} else if (rt_prio(prio)) {
  7244			if (dl_prio(oldprio))
  7245				p->dl.pi_se = &p->dl;
  7246			if (oldprio < prio)
  7247				queue_flag |= ENQUEUE_HEAD;
  7248		} else {
  7249			if (dl_prio(oldprio))
  7250				p->dl.pi_se = &p->dl;
  7251			if (rt_prio(oldprio))
  7252				p->rt.timeout = 0;
  7253		}
  7254	
  7255		p->sched_class = next_class;
  7256		p->prio = prio;
  7257	
  7258		check_class_changing(rq, p, prev_class);
  7259	
  7260		if (queued)
  7261			enqueue_task(rq, p, queue_flag);
  7262		if (running)
  7263			set_next_task(rq, p);
  7264	
  7265		check_class_changed(rq, p, prev_class, oldprio);
  7266	out_unlock:
  7267		/* Avoid rq from going away on us: */
  7268		preempt_disable();
  7269	
  7270		rq_unpin_lock(rq, &rf);
  7271		__balance_callbacks(rq);
  7272		raw_spin_rq_unlock(rq);
  7273	
  7274		preempt_enable();
  7275	}
  7276	#endif
  7277	
  7278	#if !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
  7279	int __sched __cond_resched(void)
  7280	{
  7281		if (should_resched(0)) {
  7282			preempt_schedule_common();
  7283			return 1;
  7284		}
  7285		/*
  7286		 * In preemptible kernels, ->rcu_read_lock_nesting tells the tick
  7287		 * whether the current CPU is in an RCU read-side critical section,
  7288		 * so the tick can report quiescent states even for CPUs looping
  7289		 * in kernel context.  In contrast, in non-preemptible kernels,
  7290		 * RCU readers leave no in-memory hints, which means that CPU-bound
  7291		 * processes executing in kernel context might never report an
  7292		 * RCU quiescent state.  Therefore, the following code causes
  7293		 * cond_resched() to report a quiescent state, but only when RCU
  7294		 * is in urgent need of one.
  7295		 */
  7296	#ifndef CONFIG_PREEMPT_RCU
  7297		rcu_all_qs();
  7298	#endif
  7299		return 0;
  7300	}
  7301	EXPORT_SYMBOL(__cond_resched);
  7302	#endif
  7303	
  7304	#ifdef CONFIG_PREEMPT_DYNAMIC
  7305	#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
  7306	#define cond_resched_dynamic_enabled	__cond_resched
  7307	#define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
  7308	DEFINE_STATIC_CALL_RET0(cond_resched, __cond_resched);
  7309	EXPORT_STATIC_CALL_TRAMP(cond_resched);
  7310	
  7311	#define might_resched_dynamic_enabled	__cond_resched
  7312	#define might_resched_dynamic_disabled	((void *)&__static_call_return0)
  7313	DEFINE_STATIC_CALL_RET0(might_resched, __cond_resched);
  7314	EXPORT_STATIC_CALL_TRAMP(might_resched);
  7315	#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
  7316	static DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
  7317	int __sched dynamic_cond_resched(void)
  7318	{
  7319		klp_sched_try_switch();
  7320		if (!static_branch_unlikely(&sk_dynamic_cond_resched))
  7321			return 0;
  7322		return __cond_resched();
  7323	}
  7324	EXPORT_SYMBOL(dynamic_cond_resched);
  7325	
  7326	static DEFINE_STATIC_KEY_FALSE(sk_dynamic_might_resched);
  7327	int __sched dynamic_might_resched(void)
  7328	{
  7329		if (!static_branch_unlikely(&sk_dynamic_might_resched))
  7330			return 0;
  7331		return __cond_resched();
  7332	}
  7333	EXPORT_SYMBOL(dynamic_might_resched);
  7334	#endif
  7335	#endif
  7336	
  7337	/*
  7338	 * __cond_resched_lock() - if a reschedule is pending, drop the given lock,
  7339	 * call schedule, and on return reacquire the lock.
  7340	 *
  7341	 * This works OK both with and without CONFIG_PREEMPTION. We do strange low-level
  7342	 * operations here to prevent schedule() from being called twice (once via
  7343	 * spin_unlock(), once by hand).
  7344	 */
  7345	int __cond_resched_lock(spinlock_t *lock)
  7346	{
  7347		int resched = should_resched(PREEMPT_LOCK_OFFSET);
  7348		int ret = 0;
  7349	
  7350		lockdep_assert_held(lock);
  7351	
  7352		if (spin_needbreak(lock) || resched) {
  7353			spin_unlock(lock);
  7354			if (!_cond_resched())
  7355				cpu_relax();
  7356			ret = 1;
  7357			spin_lock(lock);
  7358		}
  7359		return ret;
  7360	}
  7361	EXPORT_SYMBOL(__cond_resched_lock);
  7362	
  7363	int __cond_resched_rwlock_read(rwlock_t *lock)
  7364	{
  7365		int resched = should_resched(PREEMPT_LOCK_OFFSET);
  7366		int ret = 0;
  7367	
  7368		lockdep_assert_held_read(lock);
  7369	
  7370		if (rwlock_needbreak(lock) || resched) {
  7371			read_unlock(lock);
  7372			if (!_cond_resched())
  7373				cpu_relax();
  7374			ret = 1;
  7375			read_lock(lock);
  7376		}
  7377		return ret;
  7378	}
  7379	EXPORT_SYMBOL(__cond_resched_rwlock_read);
  7380	
  7381	int __cond_resched_rwlock_write(rwlock_t *lock)
  7382	{
  7383		int resched = should_resched(PREEMPT_LOCK_OFFSET);
  7384		int ret = 0;
  7385	
  7386		lockdep_assert_held_write(lock);
  7387	
  7388		if (rwlock_needbreak(lock) || resched) {
  7389			write_unlock(lock);
  7390			if (!_cond_resched())
  7391				cpu_relax();
  7392			ret = 1;
  7393			write_lock(lock);
  7394		}
  7395		return ret;
  7396	}
  7397	EXPORT_SYMBOL(__cond_resched_rwlock_write);
  7398	
  7399	#ifdef CONFIG_PREEMPT_DYNAMIC
  7400	
  7401	#ifdef CONFIG_GENERIC_IRQ_ENTRY
> 7402	#include <linux/irq-entry-common.h>
  7403	#endif
  7404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
