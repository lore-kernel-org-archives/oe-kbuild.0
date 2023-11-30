Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467EB3B7BA
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+Oz/GCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701339531; x=1732875531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gCD/2CXW0kRmcCFgu18kQz/SNtnsoIlQnMjQCvZSSWs=;
  b=Z+Oz/GCBSPsrVpMGp/L1zx6Odpjbgaz247yiFJARxsjhf1P3ma8MeSsp
   o41ZrnrI4bddqRefIBOnfKWPR5YCTgmdrlmrn/xVaEGnFY4HckOTXKFSX
   QES9s/5tidyocCYVYM8maYbJusN/IiYIxbcUJl5OovmBwg3qyLz/CPctR
   8ZoIfAANhRC5DGr53V8WV903ugOTuuzft1IL5D/YnGQ9mbvlLmJgj0RDX
   SNZ/Gy37FqyKy+OWPaie8Fdx9Mi/S4QSN2sQCgtta9KqJMWo3GL8WSLK5
   BwKyHo3DecE+gAfU7UU6oMwNn3YbbqKk9sLBgLC8NJzv5DKExDXOqGZmz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="202196"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="202196"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 02:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839754284"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="839754284"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2023 02:18:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8e87-0001gs-0Y;
	Thu, 30 Nov 2023 10:18:47 +0000
Date: Thu, 30 Nov 2023 18:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 1/2] kernel/sched/pelt.c:
 trace/hooks/sched.h is included more than once.
Message-ID: <202311301857.a3jbEKwI-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   ceb6ff1a6954c58f61354fcef58fd17af3ec5dad
commit: 0d97bca80a8f680f1fbf4b2a441c6ac581b8956a [1/2] ANDROID: sched: Add vendor hook for update_load_sum
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311301857.a3jbEKwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311301857.a3jbEKwI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/sched/pelt.c: trace/hooks/sched.h is included more than once.

vim +27 kernel/sched/pelt.c

  > 27	#include <trace/hooks/sched.h>
    28	
    29	/*
    30	 * Approximate:
    31	 *   val * y^n,    where y^32 ~= 0.5 (~1 scheduling period)
    32	 */
    33	static u64 decay_load(u64 val, u64 n)
    34	{
    35		unsigned int local_n;
    36	
    37		if (unlikely(n > LOAD_AVG_PERIOD * 63))
    38			return 0;
    39	
    40		/* after bounds checking we can collapse to 32-bit */
    41		local_n = n;
    42	
    43		/*
    44		 * As y^PERIOD = 1/2, we can combine
    45		 *    y^n = 1/2^(n/PERIOD) * y^(n%PERIOD)
    46		 * With a look-up table which covers y^n (n<PERIOD)
    47		 *
    48		 * To achieve constant time decay_load.
    49		 */
    50		if (unlikely(local_n >= LOAD_AVG_PERIOD)) {
    51			val >>= local_n / LOAD_AVG_PERIOD;
    52			local_n %= LOAD_AVG_PERIOD;
    53		}
    54	
    55		val = mul_u64_u32_shr(val, runnable_avg_yN_inv[local_n], 32);
    56		return val;
    57	}
    58	
    59	static u32 __accumulate_pelt_segments(u64 periods, u32 d1, u32 d3)
    60	{
    61		u32 c1, c2, c3 = d3; /* y^0 == 1 */
    62	
    63		/*
    64		 * c1 = d1 y^p
    65		 */
    66		c1 = decay_load((u64)d1, periods);
    67	
    68		/*
    69		 *            p-1
    70		 * c2 = 1024 \Sum y^n
    71		 *            n=1
    72		 *
    73		 *              inf        inf
    74		 *    = 1024 ( \Sum y^n - \Sum y^n - y^0 )
    75		 *              n=0        n=p
    76		 */
    77		c2 = LOAD_AVG_MAX - decay_load(LOAD_AVG_MAX, periods) - 1024;
    78	
    79		return c1 + c2 + c3;
    80	}
    81	
    82	/*
    83	 * Accumulate the three separate parts of the sum; d1 the remainder
    84	 * of the last (incomplete) period, d2 the span of full periods and d3
    85	 * the remainder of the (incomplete) current period.
    86	 *
    87	 *           d1          d2           d3
    88	 *           ^           ^            ^
    89	 *           |           |            |
    90	 *         |<->|<----------------->|<--->|
    91	 * ... |---x---|------| ... |------|-----x (now)
    92	 *
    93	 *                           p-1
    94	 * u' = (u + d1) y^p + 1024 \Sum y^n + d3 y^0
    95	 *                           n=1
    96	 *
    97	 *    = u y^p +					(Step 1)
    98	 *
    99	 *                     p-1
   100	 *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
   101	 *                     n=1
   102	 */
   103	static __always_inline u32
   104	accumulate_sum(u64 delta, struct sched_avg *sa,
   105		       unsigned long load, unsigned long runnable, int running)
   106	{
   107		u32 contrib = (u32)delta; /* p == 0 -> delta < 1024 */
   108		u64 periods;
   109	
   110		delta += sa->period_contrib;
   111		periods = delta / 1024; /* A period is 1024us (~1ms) */
   112	
   113		/*
   114		 * Step 1: decay old *_sum if we crossed period boundaries.
   115		 */
   116		if (periods) {
   117			sa->load_sum = decay_load(sa->load_sum, periods);
   118			sa->runnable_sum =
   119				decay_load(sa->runnable_sum, periods);
   120			sa->util_sum = decay_load((u64)(sa->util_sum), periods);
   121	
   122			/*
   123			 * Step 2
   124			 */
   125			delta %= 1024;
   126			if (load) {
   127				/*
   128				 * This relies on the:
   129				 *
   130				 * if (!load)
   131				 *	runnable = running = 0;
   132				 *
   133				 * clause from ___update_load_sum(); this results in
   134				 * the below usage of @contrib to disappear entirely,
   135				 * so no point in calculating it.
   136				 */
   137				contrib = __accumulate_pelt_segments(periods,
   138						1024 - sa->period_contrib, delta);
   139			}
   140		}
   141		sa->period_contrib = delta;
   142	
   143		if (load)
   144			sa->load_sum += load * contrib;
   145		if (runnable)
   146			sa->runnable_sum += runnable * contrib << SCHED_CAPACITY_SHIFT;
   147		if (running)
   148			sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
   149	
   150		return periods;
   151	}
   152	
   153	/*
   154	 * We can represent the historical contribution to runnable average as the
   155	 * coefficients of a geometric series.  To do this we sub-divide our runnable
   156	 * history into segments of approximately 1ms (1024us); label the segment that
   157	 * occurred N-ms ago p_N, with p_0 corresponding to the current period, e.g.
   158	 *
   159	 * [<- 1024us ->|<- 1024us ->|<- 1024us ->| ...
   160	 *      p0            p1           p2
   161	 *     (now)       (~1ms ago)  (~2ms ago)
   162	 *
   163	 * Let u_i denote the fraction of p_i that the entity was runnable.
   164	 *
   165	 * We then designate the fractions u_i as our co-efficients, yielding the
   166	 * following representation of historical load:
   167	 *   u_0 + u_1*y + u_2*y^2 + u_3*y^3 + ...
   168	 *
   169	 * We choose y based on the with of a reasonably scheduling period, fixing:
   170	 *   y^32 = 0.5
   171	 *
   172	 * This means that the contribution to load ~32ms ago (u_32) will be weighted
   173	 * approximately half as much as the contribution to load within the last ms
   174	 * (u_0).
   175	 *
   176	 * When a period "rolls over" and we have new u_0`, multiplying the previous
   177	 * sum again by y is sufficient to update:
   178	 *   load_avg = u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
   179	 *            = u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u_{i+1}]
   180	 */
   181	int
   182	___update_load_sum(u64 now, struct sched_avg *sa,
   183			  unsigned long load, unsigned long runnable, int running)
   184	{
   185		u64 delta;
   186	
   187		delta = now - sa->last_update_time;
   188		/*
   189		 * This should only happen when time goes backwards, which it
   190		 * unfortunately does during sched clock init when we swap over to TSC.
   191		 */
   192		if ((s64)delta < 0) {
   193			sa->last_update_time = now;
   194			return 0;
   195		}
   196	
   197		/*
   198		 * Use 1024ns as the unit of measurement since it's a reasonable
   199		 * approximation of 1us and fast to compute.
   200		 */
   201		delta >>= 10;
   202		if (!delta)
   203			return 0;
   204	
   205		sa->last_update_time += delta << 10;
   206	
   207		trace_android_rvh_update_load_sum(sa, &delta, &sched_pelt_lshift);
   208	
   209		/*
   210		 * running is a subset of runnable (weight) so running can't be set if
   211		 * runnable is clear. But there are some corner cases where the current
   212		 * se has been already dequeued but cfs_rq->curr still points to it.
   213		 * This means that weight will be 0 but not running for a sched_entity
   214		 * but also for a cfs_rq if the latter becomes idle. As an example,
   215		 * this happens during idle_balance() which calls
   216		 * update_blocked_averages().
   217		 *
   218		 * Also see the comment in accumulate_sum().
   219		 */
   220		if (!load)
   221			runnable = running = 0;
   222	
   223		/*
   224		 * Now we know we crossed measurement unit boundaries. The *_avg
   225		 * accrues by two steps:
   226		 *
   227		 * Step 1: accumulate *_sum since last_update_time. If we haven't
   228		 * crossed period boundaries, finish.
   229		 */
   230		if (!accumulate_sum(delta, sa, load, runnable, running))
   231			return 0;
   232	
   233		return 1;
   234	}
   235	EXPORT_SYMBOL_GPL(___update_load_sum);
   236	
   237	/*
   238	 * When syncing *_avg with *_sum, we must take into account the current
   239	 * position in the PELT segment otherwise the remaining part of the segment
   240	 * will be considered as idle time whereas it's not yet elapsed and this will
   241	 * generate unwanted oscillation in the range [1002..1024[.
   242	 *
   243	 * The max value of *_sum varies with the position in the time segment and is
   244	 * equals to :
   245	 *
   246	 *   LOAD_AVG_MAX*y + sa->period_contrib
   247	 *
   248	 * which can be simplified into:
   249	 *
   250	 *   LOAD_AVG_MAX - 1024 + sa->period_contrib
   251	 *
   252	 * because LOAD_AVG_MAX*y == LOAD_AVG_MAX-1024
   253	 *
   254	 * The same care must be taken when a sched entity is added, updated or
   255	 * removed from a cfs_rq and we need to update sched_avg. Scheduler entities
   256	 * and the cfs rq, to which they are attached, have the same position in the
   257	 * time segment because they use the same clock. This means that we can use
   258	 * the period_contrib of cfs_rq when updating the sched_avg of a sched_entity
   259	 * if it's more convenient.
   260	 */
   261	void
   262	___update_load_avg(struct sched_avg *sa, unsigned long load)
   263	{
   264		u32 divider = get_pelt_divider(sa);
   265	
   266		/*
   267		 * Step 2: update *_avg.
   268		 */
   269		sa->load_avg = div_u64(load * sa->load_sum, divider);
   270		sa->runnable_avg = div_u64(sa->runnable_sum, divider);
   271		WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
   272	}
   273	EXPORT_SYMBOL_GPL(___update_load_avg);
   274	
   275	/*
   276	 * sched_entity:
   277	 *
   278	 *   task:
   279	 *     se_weight()   = se->load.weight
   280	 *     se_runnable() = !!on_rq
   281	 *
   282	 *   group: [ see update_cfs_group() ]
   283	 *     se_weight()   = tg->weight * grq->load_avg / tg->load_avg
   284	 *     se_runnable() = grq->h_nr_running
   285	 *
   286	 *   runnable_sum = se_runnable() * runnable = grq->runnable_sum
   287	 *   runnable_avg = runnable_sum
   288	 *
   289	 *   load_sum := runnable
   290	 *   load_avg = se_weight(se) * load_sum
   291	 *
   292	 * cfq_rq:
   293	 *
   294	 *   runnable_sum = \Sum se->avg.runnable_sum
   295	 *   runnable_avg = \Sum se->avg.runnable_avg
   296	 *
   297	 *   load_sum = \Sum se_weight(se) * se->avg.load_sum
   298	 *   load_avg = \Sum se->avg.load_avg
   299	 */
   300	
   301	int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
   302	{
   303		if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
   304			___update_load_avg(&se->avg, se_weight(se));
   305			trace_pelt_se_tp(se);
   306			return 1;
   307		}
   308	
   309		return 0;
   310	}
   311	EXPORT_SYMBOL_GPL(__update_load_avg_blocked_se);
   312	
   313	int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se)
   314	{
   315		if (___update_load_sum(now, &se->avg, !!se->on_rq, se_runnable(se),
   316					cfs_rq->curr == se)) {
   317	
   318			___update_load_avg(&se->avg, se_weight(se));
   319			cfs_se_util_change(&se->avg);
   320			trace_pelt_se_tp(se);
   321			return 1;
   322		}
   323	
   324		return 0;
   325	}
   326	
   327	int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
   328	{
   329		if (___update_load_sum(now, &cfs_rq->avg,
   330					scale_load_down(cfs_rq->load.weight),
   331					cfs_rq->h_nr_running,
   332					cfs_rq->curr != NULL)) {
   333	
   334			___update_load_avg(&cfs_rq->avg, 1);
   335			trace_pelt_cfs_tp(cfs_rq);
   336			return 1;
   337		}
   338	
   339		return 0;
   340	}
   341	
   342	/*
   343	 * rt_rq:
   344	 *
   345	 *   util_sum = \Sum se->avg.util_sum but se->avg.util_sum is not tracked
   346	 *   util_sum = cpu_scale * load_sum
   347	 *   runnable_sum = util_sum
   348	 *
   349	 *   load_avg and runnable_avg are not supported and meaningless.
   350	 *
   351	 */
   352	
   353	int update_rt_rq_load_avg(u64 now, struct rq *rq, int running)
   354	{
   355		if (___update_load_sum(now, &rq->avg_rt,
   356					running,
   357					running,
   358					running)) {
   359	
   360			___update_load_avg(&rq->avg_rt, 1);
   361			trace_pelt_rt_tp(rq);
   362			return 1;
   363		}
   364	
   365		return 0;
   366	}
   367	
   368	/*
   369	 * dl_rq:
   370	 *
   371	 *   util_sum = \Sum se->avg.util_sum but se->avg.util_sum is not tracked
   372	 *   util_sum = cpu_scale * load_sum
   373	 *   runnable_sum = util_sum
   374	 *
   375	 *   load_avg and runnable_avg are not supported and meaningless.
   376	 *
   377	 */
   378	
   379	int update_dl_rq_load_avg(u64 now, struct rq *rq, int running)
   380	{
   381		if (___update_load_sum(now, &rq->avg_dl,
   382					running,
   383					running,
   384					running)) {
   385	
   386			___update_load_avg(&rq->avg_dl, 1);
   387			trace_pelt_dl_tp(rq);
   388			return 1;
   389		}
   390	
   391		return 0;
   392	}
   393	
   394	#ifdef CONFIG_SCHED_THERMAL_PRESSURE
   395	/*
   396	 * thermal:
   397	 *
   398	 *   load_sum = \Sum se->avg.load_sum but se->avg.load_sum is not tracked
   399	 *
   400	 *   util_avg and runnable_load_avg are not supported and meaningless.
   401	 *
   402	 * Unlike rt/dl utilization tracking that track time spent by a cpu
   403	 * running a rt/dl task through util_avg, the average thermal pressure is
   404	 * tracked through load_avg. This is because thermal pressure signal is
   405	 * time weighted "delta" capacity unlike util_avg which is binary.
   406	 * "delta capacity" =  actual capacity  -
   407	 *			capped capacity a cpu due to a thermal event.
   408	 */
   409	
   410	int update_thermal_load_avg(u64 now, struct rq *rq, u64 capacity)
   411	{
   412		if (___update_load_sum(now, &rq->avg_thermal,
   413				       capacity,
   414				       capacity,
   415				       capacity)) {
   416			___update_load_avg(&rq->avg_thermal, 1);
   417			trace_pelt_thermal_tp(rq);
   418			return 1;
   419		}
   420	
   421		return 0;
   422	}
   423	#endif
   424	
   425	#ifdef CONFIG_HAVE_SCHED_AVG_IRQ
   426	/*
   427	 * irq:
   428	 *
   429	 *   util_sum = \Sum se->avg.util_sum but se->avg.util_sum is not tracked
   430	 *   util_sum = cpu_scale * load_sum
   431	 *   runnable_sum = util_sum
   432	 *
   433	 *   load_avg and runnable_avg are not supported and meaningless.
   434	 *
   435	 */
   436	
   437	int update_irq_load_avg(struct rq *rq, u64 running)
   438	{
   439		int ret = 0;
   440	
   441		/*
   442		 * We can't use clock_pelt because irq time is not accounted in
   443		 * clock_task. Instead we directly scale the running time to
   444		 * reflect the real amount of computation
   445		 */
   446		running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
   447		running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
   448	
   449		/*
   450		 * We know the time that has been used by interrupt since last update
   451		 * but we don't when. Let be pessimistic and assume that interrupt has
   452		 * happened just before the update. This is not so far from reality
   453		 * because interrupt will most probably wake up task and trig an update
   454		 * of rq clock during which the metric is updated.
   455		 * We start to decay with normal context time and then we add the
   456		 * interrupt context time.
   457		 * We can safely remove running from rq->clock because
   458		 * rq->clock += delta with delta >= running
   459		 */
   460		ret = ___update_load_sum(rq->clock - running, &rq->avg_irq,
   461					0,
   462					0,
   463					0);
   464		ret += ___update_load_sum(rq->clock, &rq->avg_irq,
   465					1,
   466					1,
   467					1);
   468	
   469		if (ret) {
   470			___update_load_avg(&rq->avg_irq, 1);
   471			trace_pelt_irq_tp(rq);
   472		}
   473	
   474		return ret;
   475	}
   476	#endif
   477	
   478	__read_mostly unsigned int sched_pelt_lshift;
   479	
   480	#ifdef CONFIG_SYSCTL
 > 481	#include <trace/hooks/sched.h>
   482	static unsigned int sysctl_sched_pelt_multiplier = 1;
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
