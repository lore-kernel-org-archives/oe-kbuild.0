Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683868;
	b=OvVMnArhPgHGjFzAnrWV+i9cEIbulwPX241IYdXo0nADxdOok+DBcMA44XHDoG+XKw5N
	 rDllYDsmGzupAJ0Rr30ehoICJwv6rH9iBrR+lUYcnQx3jalC7LWBHmlBs04RWUD5yXTmM
	 fDtfJG6Xc/8oW6fm9qPf49V1Tyw+KPMUgHJm9rQtd0HtA22u3kJAkvogeca8hCoDgydtG
	 6NsFj2xK2zvAvfbbY9pDDuzPITgJRG0mNJ+eGRa6K4G7Oai46A/vAkwbDeas81aOY0vYh
	 35goCNMmcdzV9q6ITbaaQrrt5Tnyi6RhxXMYKk+Qlm5nQG8zTe9R2CkBaJw0I3MpTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683868;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LJb3+B4sRzvZKa68430eR+fUrClaTGGO2s79AeeAXo8=;
	b=T7xBH1e12cJbc9e5BMBljod9E2NUyNLZyPYJsaCEpPDwkQ5H4Az5jrQgkPhiFr9dPBSW
	 Xq5D+AyR0hxsH30M9irAGa+T4Swk3CE7I3LzQSCfcbC6uL6WpQ1ImaAmZk6Zyt+D+JR9j
	 8LFVvY8bdObJPdyaIW25XlvxBbCB2PFz/7ZEjrD7ZNRALKNSNZj9AI9lKk0I/h8xBaZeQ
	 mu2szm/yq8whBpSU5+8+fHUdC1VivMFlsr7d2+wN6cmjq3+cT1sA8Vm2Rz3/Hc8jDAlYV
	 K7sCjwJdlShaGPy0hOJjTFEeVUwWza6eT76GNuNPS4BJcp1ELVDn+4Nu6AnFooyhmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHK1rDbI;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED71606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 09:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHK1rDbI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795683867; x=1827219867;
  h=date:from:to:cc:subject:message-id;
  bh=TM8wR4TmEwqEdxEvWEy/Sl2oyujNnKd7oOPb3wWv888=;
  b=hHK1rDbIsVGIzLvhJGOyqkcYRbk7LGKM/hV3F6hW4GJwocl1h9FsdI3T
   kryf9LOQCXt58jm+epZjFJb3tPlrErb+Wuol4/EpQW6k6/5C7Xls3HPl0
   V5J8EMNw72f3CrkP5QFu5cD1bZmlNJfdzAFQp6gI+FqjAn09r9O8kY9aY
   Yx9rokRz6AxbZ3VIvf2ygyBPIdcSMCLItVwDtHBaWsacx5AaOHZUO4Mkw
   0aK3XrncZrPNep9dveu0fc9n77mKAhOExuajbacN/YpHqVOgRISPmMKjE
   WLUhvz/vVq3siFTyFd3Vli2txnaPg49vT3Yfu0KpUzPRuXoz0ouiQ/VWM
   Q==;
X-CSE-ConnectionGUID: l/9Tf9FzSZ+0f7JeL+0+4A==
X-CSE-MsgGUID: x45iSdLlTKOgk+Yo0fH0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4472325"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4472325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 01:00:35 -0800
X-CSE-ConnectionGUID: WgIMh2L6TPuId1dUzIkWgg==
X-CSE-MsgGUID: w6+/KQgAThimX7suS+AXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12610941"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 01:00:34 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWVLD-000000000IJ-1Hbk;
	Thu, 26 Nov 2026 09:00:31 +0000
Date: Thu, 26 Nov 2026 09:59:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [qais-yousef:schedqos 13/13] kernel/sched/fair.c:9528
 cpu_util() error: we previously assumed 'p' could be null (see line 9480)
Message-ID: <20261126095005.yLvASGiX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Qais Yousef <qyousef@layalina.io>

tree:   https://github.com/qais-yousef/linux schedqos
head:   8e826d3d7ebbfa9b3452a017ddcd4b827e318436
commit: 8e826d3d7ebbfa9b3452a017ddcd4b827e318436 [13/13] HACK: Hide runnable avg bug causing schedutil to run at max
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: powerpc64-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126095005.yLvASGiX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126095005.yLvASGiX-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:9528 cpu_util() error: we previously assumed 'p' could be null (see line 9480)

vim +/p +9528 kernel/sched/fair.c

231678b768da07d Dietmar Eggemann 2015-08-14  9434  
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9435  /**
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9436   * cpu_util() - Estimates the amount of CPU capacity used by CFS tasks.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9437   * @cpu: the CPU to get the utilization for
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9438   * @p: task for which the CPU utilization should be predicted or NULL
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9439   * @dst_cpu: CPU @p migrates to, -1 if @p moves from @cpu or @p == NULL
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9440   * @boost: 1 to enable boosting, otherwise 0
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9441   *
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9442   * The unit of the return value must be the same as the one of CPU capacity
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9443   * so that CPU utilization can be compared with CPU capacity.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9444   *
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9445   * CPU utilization is the sum of running time of runnable tasks plus the
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9446   * recent utilization of currently non-runnable tasks on that CPU.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9447   * It represents the amount of CPU capacity currently used by CFS tasks in
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9448   * the range [0..max CPU capacity] with max CPU capacity being the CPU
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9449   * capacity at f_max.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9450   *
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9451   * The estimated CPU utilization is defined as the maximum between CPU
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9452   * utilization and sum of the estimated utilization of the currently
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9453   * runnable tasks on that CPU. It preserves a utilization "snapshot" of
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9454   * previously-executed tasks, which helps better deduce how busy a CPU will
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9455   * be when a long-sleeping task wakes up. The contribution to CPU utilization
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9456   * of such a task would be significantly decayed at this point of time.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9457   *
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9458   * Boosted CPU utilization is defined as max(CPU runnable, CPU utilization).
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9459   * CPU contention for CFS tasks can be detected by CPU runnable > CPU
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9460   * utilization. Boosting is implemented in cpu_util() so that internal
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9461   * users (e.g. EAS) can use it next to external users (e.g. schedutil),
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9462   * latter via cpu_util_cfs_boost().
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9463   *
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9464   * CPU utilization can be higher than the current CPU capacity
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9465   * (f_curr/f_max * max CPU capacity) or even the max CPU capacity because
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9466   * of rounding errors as well as task migrations or wakeups of new tasks.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9467   * CPU utilization has to be capped to fit into the [0..max CPU capacity]
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9468   * range. Otherwise a group of CPUs (CPU0 util = 121% + CPU1 util = 80%)
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9469   * could be seen as over-utilized even though CPU1 has 20% of spare CPU
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9470   * capacity. CPU utilization is allowed to overshoot current CPU capacity
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9471   * though since this is useful for predicting the CPU capacity required
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9472   * after task migrations (scheduler-driven DVFS).
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9473   *
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9474   * Return: (Boosted) (estimated) utilization for the specified CPU.
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9475   */
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9476  static unsigned long
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9477  cpu_util(int cpu, struct task_struct *p, int dst_cpu, int boost)
390031e4c309c94 Quentin Perret   2018-12-03  9478  {
29922fdfc2a4008 Hongyan Xia      2026-06-05  9479  	bool add_task = p && task_cpu(p) != cpu && dst_cpu == cpu;
29922fdfc2a4008 Hongyan Xia      2026-06-05 @9480  	bool sub_task = p && task_cpu(p) == cpu && dst_cpu != cpu;
390031e4c309c94 Quentin Perret   2018-12-03  9481  	struct cfs_rq *cfs_rq = &cpu_rq(cpu)->cfs;
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9482  	unsigned long util = READ_ONCE(cfs_rq->avg.util_avg);
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9483  	unsigned long runnable;
7d0583cf9ec7bf8 Dietmar Eggemann 2023-05-15  9484  
390031e4c309c94 Quentin Perret   2018-12-03  9485  	/*
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9486  	 * If @dst_cpu is -1 or @p migrates from @cpu to @dst_cpu remove its
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9487  	 * contribution. If @p migrates from another CPU to @cpu add its
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9488  	 * contribution. In all the other cases @cpu is not impacted by the
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9489  	 * migration so its util_avg is already correct.
390031e4c309c94 Quentin Perret   2018-12-03  9490  	 */
29922fdfc2a4008 Hongyan Xia      2026-06-05  9491  	if (add_task)
390031e4c309c94 Quentin Perret   2018-12-03  9492  		util += task_util(p);
29922fdfc2a4008 Hongyan Xia      2026-06-05  9493  	else if (sub_task)
29922fdfc2a4008 Hongyan Xia      2026-06-05  9494  		lsub_positive(&util, task_util(p));
29922fdfc2a4008 Hongyan Xia      2026-06-05  9495  
390031e4c309c94 Quentin Perret   2018-12-03  9496  	if (sched_feat(UTIL_EST)) {
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9497  		unsigned long util_est;
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9498  
11137d384996bb0 Vincent Guittot  2023-12-01  9499  		util_est = READ_ONCE(cfs_rq->avg.util_est);
390031e4c309c94 Quentin Perret   2018-12-03  9500  
390031e4c309c94 Quentin Perret   2018-12-03  9501  		/*
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9502  		 * During wake-up @p isn't enqueued yet and doesn't contribute
11137d384996bb0 Vincent Guittot  2023-12-01  9503  		 * to any cpu_rq(cpu)->cfs.avg.util_est.
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9504  		 * If @dst_cpu == @cpu add it to "simulate" cpu_util after @p
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9505  		 * has been enqueued.
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9506  		 *
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9507  		 * During exec (@dst_cpu = -1) @p is enqueued and does
11137d384996bb0 Vincent Guittot  2023-12-01  9508  		 * contribute to cpu_rq(cpu)->cfs.util_est.
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9509  		 * Remove it to "simulate" cpu_util without @p's contribution.
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9510  		 *
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9511  		 * Despite the task_on_rq_queued(@p) check there is still a
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9512  		 * small window for a possible race when an exec
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9513  		 * select_task_rq_fair() races with LB's detach_task().
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9514  		 *
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9515  		 *   detach_task()
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9516  		 *     deactivate_task()
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9517  		 *       p->on_rq = TASK_ON_RQ_MIGRATING;
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9518  		 *       -------------------------------- A
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9519  		 *       dequeue_task()                    \
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9520  		 *         dequeue_task_fair()              + Race Time
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9521  		 *           util_est_dequeue()            /
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9522  		 *       -------------------------------- B
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9523  		 *
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9524  		 * The additional check "current == p" is required to further
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9525  		 * reduce the race window.
390031e4c309c94 Quentin Perret   2018-12-03  9526  		 */
390031e4c309c94 Quentin Perret   2018-12-03  9527  		if (dst_cpu == cpu)
390031e4c309c94 Quentin Perret   2018-12-03 @9528  			util_est += _task_util_est(p);
3eb6d6ececca2fd Dietmar Eggemann 2023-05-15  9529  		else if (p && unlikely(task_on_rq_queued(p) || current == p))
4e3c7d338a22604 Dietmar Eggemann 2022-03-18  9530  			lsub_positive(&util_est, _task_util_est(p));
390031e4c309c94 Quentin Perret   2018-12-03  9531  
390031e4c309c94 Quentin Perret   2018-12-03  9532  		util = max(util, util_est);
390031e4c309c94 Quentin Perret   2018-12-03  9533  	}
390031e4c309c94 Quentin Perret   2018-12-03  9534  
7bc263840bc3377 Vincent Guittot  2023-10-09  9535  	return min(util, arch_scale_cpu_capacity(cpu));
390031e4c309c94 Quentin Perret   2018-12-03  9536  }
390031e4c309c94 Quentin Perret   2018-12-03  9537  

:::::: The code at line 9528 was first introduced by commit
:::::: 390031e4c309c94ecc07a558187eb5185200df83 sched/fair: Introduce an energy estimation helper function

:::::: TO: Quentin Perret <quentin.perret@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
