Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3F371056
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452323; cv=none; b=iJ8xFa64f202Zi8b8HDDNcxg7vUtuEyMtr0a9LiPEV77TAMPsIrDph9BFoKO/IE7/7lN2zGzoCCzg7f64c63ddso6r3UZC45WWWrJZ54nQR5oR4OnyuCil++71tnbc16oHuHj8PQZ9A/paIQ8qJgtVpiNlrnN54i+wZuG8/QtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452323; c=relaxed/simple;
	bh=iWx2PYYGDnpNyAYmqEGRswNtSw2bQmyaSLxTuj1SfTU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gNZL35rpY00zlli7LONWyHmoVZQW/IKkptXwSBC7Fhp3o99W3pofyqOt05Tfcb87NrkPibU3Aap/pKlZhKrD5qwhDhiDvj1TFExzFC37zTXPlzYi39USFvL3T30ENlVwDahWC6SNdNmt+G3LHDP66hZ81uEgHbug/WPo8adhHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ0Lp27f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ0Lp27f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790452319; x=1821988319;
  h=date:from:to:cc:subject:message-id;
  bh=iWx2PYYGDnpNyAYmqEGRswNtSw2bQmyaSLxTuj1SfTU=;
  b=eZ0Lp27f2wf7z7fnYh0ltZLmxLvGB04YyvwFwWAT1x8eMjEiKsq9qAqw
   IkkMPw80EGoheitGlZnBGna8+SOBO2qs2jbv5PkPZfEJpNfh6QNfO6PX7
   7kw3VZWTjoruVg14ACwTOIh8nzmUAcuRiHI9fa8wHu6k9G9MTVj/2pbT9
   YVM5FCLFdROZj1C2Yq46QEzlb2W77mD3oHihpuX9dOlN3CS8z5plHqn/z
   RkXJ3eYFnToY6MgnkTjLUR0FNwb6Mq0/kcNKEahog6brvSBx0bjrGTOAv
   zC9Dj8aNFOGCxxNFmKmpNVPiXHeXH6lOONLOUKIqCi5k/xULZXE6JpJvB
   A==;
X-CSE-ConnectionGUID: w3wlKo2bTuWga8HM/KGb2Q==
X-CSE-MsgGUID: mlrCJkxnSwyww8UGSqzthg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="108695989"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="108695989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 12:51:59 -0700
X-CSE-ConnectionGUID: zJ5Un1TFRpWG17PwWo2jzg==
X-CSE-MsgGUID: tiHNn4tZTcCmJ0Qzbs80GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274785142"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2026 12:51:57 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAYR6-000000000Ap-1d82;
	Sat, 26 Sep 2026 19:51:54 +0000
Date: Sat, 26 Sep 2026 21:50:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:sched/task_h_load 14/14]
 kernel/sched/fair.c:8250 enqueue_hierarchy() warn: was '== 0' instead of '='
Message-ID: <202609262153.wm0oQxjZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load
head:   ef80f56c1c38450739648c841c00fbd2f6f6d860
commit: ef80f56c1c38450739648c841c00fbd2f6f6d860 [14/14] sched/fair: Rework/fix task_h_load()
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: sh-randconfig-r2202-20260926 (https://download.01.org/0day-ci/archive/20260926/202609262153.wm0oQxjZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609262153.wm0oQxjZ-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:8250 enqueue_hierarchy() warn: was '== 0' instead of '='
kernel/sched/fair.c:8250 enqueue_hierarchy() warn: was '== 0' instead of '='
kernel/sched/fair.c:8385 dequeue_hierarchy() warn: was '== 0' instead of '='
kernel/sched/fair.c:8385 dequeue_hierarchy() warn: was '== 0' instead of '='
kernel/sched/fair.c:15362 task_tick_fair() warn: was '== 0' instead of '='
kernel/sched/fair.c:15362 task_tick_fair() warn: was '== 0' instead of '='
kernel/sched/fair.c:15582 set_next_task_fair() warn: was '== 0' instead of '='
kernel/sched/fair.c:15582 set_next_task_fair() warn: was '== 0' instead of '='

vim +8250 kernel/sched/fair.c

781773e3b68031 kernel/sched/fair.c Peter Zijlstra         2024-05-23  8214  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8215) static unsigned long enqueue_hierarchy(struct task_struct *p, int flags)
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8216) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8217) 	unsigned long weight = NICE_0_LOAD;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8218) 	int task_new = !(flags & ENQUEUE_WAKEUP);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8219) 	struct sched_entity *se = &p->se;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8220) 	int h_nr_idle = task_has_idle_policy(p);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8221) 	int h_nr_runnable = 1;
d1373fcff1552e kernel/sched/fair.c Peter Zijlstra         2026-08-27  8222  	struct cfs_rq *cfs_rq;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8223) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8224) 	if (task_new && se->sched_delayed)
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8225) 		h_nr_runnable = 0;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8226) 
d1373fcff1552e kernel/sched/fair.c Peter Zijlstra         2026-08-27  8227  	for_each_sched_entity(se, cfs_rq) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8228) 		update_curr(cfs_rq);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8229) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8230) 		if (!se->on_rq) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8231) 			enqueue_entity(cfs_rq, se, flags);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8232) 		} else {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8233) 			update_load_avg(cfs_rq, se, UPDATE_TG);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8234) 			se_update_runnable(se);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8235) 			update_cfs_group(se);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8236) 		}
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8237) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8238) 		cfs_rq->h_nr_runnable += h_nr_runnable;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8239) 		cfs_rq->h_nr_queued++;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8240) 		cfs_rq->h_nr_idle += h_nr_idle;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8241) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8242) 		if (cfs_rq_is_idle(cfs_rq))
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8243) 			h_nr_idle = 1;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8244) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8245) 		weight = __calc_prop_weight(cfs_rq, se, weight);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8246) 
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8247) 		flags = ENQUEUE_WAKEUP;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8248) 	}
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8249) 
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27 @8250  	for_each_sched_entity_bl(se, cfs_rq)
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27  8251  		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27  8252  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8253) 	return weight;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8254) }
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8255) 
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8256  /* Update curr's vruntime before placing entity or updating lag */
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8257  static inline void update_curr_eevdf(struct cfs_rq *cfs_rq)
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8258  {
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8259  	if (!cfs_rq->curr)
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8260  		return;
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8261  
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8262  	update_curr(cfs_rq_of(cfs_rq->curr));
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8263  }
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8264  
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8265  /*
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8266   * The enqueue_task method is called before nr_running is
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8267   * increased. Here we update the fair scheduling stats and
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8268   * then put the task into the rbtree:
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8269   */
ea87bb78531684 kernel/sched_fair.c Thomas Gleixner        2010-01-20  8270  static void
371fd7e7a56a5c kernel/sched_fair.c Peter Zijlstra         2010-03-24  8271  enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8272  {
7b8a702d943827 kernel/sched/fair.c Vincent Guittot        2024-12-02  8273  	int rq_h_nr_queued = rq->cfs.h_nr_queued;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8274) 	int task_new = !(flags & ENQUEUE_WAKEUP);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8275) 	struct sched_entity *se = &p->se;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8276) 	struct cfs_rq *cfs_rq = &rq->cfs;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8277) 	unsigned long weight;
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8278  
e1fad12dcb66b7 kernel/sched/fair.c Valentin Schneider     2025-08-29  8279  	if (task_is_throttled(p) && enqueue_throttled_task(p))
e1fad12dcb66b7 kernel/sched/fair.c Valentin Schneider     2025-08-29  8280  		return;
e1fad12dcb66b7 kernel/sched/fair.c Valentin Schneider     2025-08-29  8281  
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8282  	/*
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8283  	 * The code below (indirectly) updates schedutil which looks at
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8284  	 * the cfs_rq utilization to select a frequency.
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8285  	 * Let's add the task's estimated utilization to the cfs_rq's
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8286  	 * estimated utilization, before we update schedutil.
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8287  	 */
0212696a844631 kernel/sched/fair.c Xuewen Yan             2025-04-17  8288  	if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8289) 		util_est_enqueue(cfs_rq, p);
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8290  
68e37487810a3d kernel/sched/fair.c Vincent Guittot        2026-08-12  8291  	update_curr_eevdf(cfs_rq);
2539fc82aa9b07 kernel/sched/fair.c Patrick Bellasi        2018-05-24  8292  
729288bc68560b kernel/sched/fair.c Dietmar Eggemann       2024-09-05  8293  	if (flags & ENQUEUE_DELAYED) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8294) 		requeue_delayed_entity(cfs_rq, se);
729288bc68560b kernel/sched/fair.c Dietmar Eggemann       2024-09-05  8295  		return;
729288bc68560b kernel/sched/fair.c Dietmar Eggemann       2024-09-05  8296  	}
729288bc68560b kernel/sched/fair.c Dietmar Eggemann       2024-09-05  8297  
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8298  	/*
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8299  	 * If in_iowait is set, the code below may not trigger any cpufreq
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8300  	 * utilization updates, so do it here explicitly with the IOWAIT flag
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8301  	 * passed.
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8302  	 */
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8303  	if (p->in_iowait)
674e75411fc260 kernel/sched/fair.c Viresh Kumar           2017-07-28  8304  		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
8c34ab1910a793 kernel/sched/fair.c Rafael J. Wysocki      2016-09-09  8305  
6d4d22468dae3d kernel/sched/fair.c Vincent Guittot        2020-02-24  8306  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8307) 	if (se->on_rq && se->sched_delayed)
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8308) 		requeue_delayed_entity(cfs_rq, se);
aef6987d89544d kernel/sched/fair.c Peter Zijlstra         2024-06-20  8309  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8310) 	weight = enqueue_hierarchy(p, flags);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8311) 	reweight_eevdf(cfs_rq, se, weight, false);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8312) 	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8313) 	__enqueue_entity(cfs_rq, se);
2069dd75c7d0f4 kernel/sched_fair.c Peter Zijlstra         2010-11-15  8314  
e636ffb9e31b4f kernel/sched/fair.c Peter Zijlstra         2025-10-20  8315  	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
cea5a3472ac43f kernel/sched/fair.c Peter Zijlstra         2024-07-26  8316  		dl_server_start(&rq->fair_server);
cea5a3472ac43f kernel/sched/fair.c Peter Zijlstra         2024-07-26  8317  
7d148be69e3a0e kernel/sched/fair.c Vincent Guittot        2020-05-13  8318  	/* At this point se is NULL and we are at root level*/
72465447867b9d kernel/sched/fair.c Kirill Tkhai           2014-05-09  8319  	add_nr_running(rq, 1);
7d148be69e3a0e kernel/sched/fair.c Vincent Guittot        2020-05-13  8320  
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8321  	/*
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8322  	 * Since new tasks are assigned an initial util_avg equal to
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8323  	 * half of the spare capacity of their CPU, tiny tasks have the
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8324  	 * ability to cross the overutilized threshold, which will
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8325  	 * result in the load balancer ruining all the task placement
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8326  	 * done by EAS. As a way to mitigate that effect, do not account
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8327  	 * for the first enqueue operation of new tasks during the
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8328  	 * overutilized flag detection.
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8329  	 *
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8330  	 * A better way of solving this problem would be to wait for
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8331  	 * the PELT signals of tasks to converge before taking them
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8332  	 * into account, but that is not straightforward to implement,
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8333  	 * and the following generally works well enough in practice.
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8334  	 */
8e1ac4299a6e87 kernel/sched/fair.c Quentin Perret         2020-11-12  8335  	if (!task_new)
be3a51e68f2f1b kernel/sched/fair.c Shrikanth Hegde        2024-03-07  8336  		check_update_overutilized_status(rq);
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen       2018-12-03  8337  
5d299eabea5a25 kernel/sched/fair.c Peter Zijlstra         2019-01-30  8338  	assert_list_leaf_cfs_rq(rq);
5d299eabea5a25 kernel/sched/fair.c Peter Zijlstra         2019-01-30  8339  
a4c2f00f5cb848 kernel/sched_fair.c Peter Zijlstra         2008-10-17  8340  	hrtick_update(rq);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8341  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8342  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8343) static void dequeue_hierarchy(struct task_struct *p, int flags)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8344  {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8345) 	struct sched_entity *se = &p->se;
fab4a808ba9fb5 kernel/sched/fair.c Peter Zijlstra         2024-04-03  8346  	bool task_sleep = flags & DEQUEUE_SLEEP;
152e11f6df293e kernel/sched/fair.c Peter Zijlstra         2024-05-23  8347  	bool task_delayed = flags & DEQUEUE_DELAYED;
eb962f251fbba2 kernel/sched/fair.c Aaron Lu               2025-08-29  8348  	bool task_throttled = flags & DEQUEUE_THROTTLE;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8349) 	int h_nr_idle = task_has_idle_policy(p);
d1373fcff1552e kernel/sched/fair.c Peter Zijlstra         2026-08-27  8350  	int h_nr_runnable = 0;
d1373fcff1552e kernel/sched/fair.c Peter Zijlstra         2026-08-27  8351  	struct cfs_rq *cfs_rq;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8352) 	bool dequeue = true;
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8353  
9216582b0bfb17 kernel/sched/fair.c Vincent Guittot        2024-12-02  8354  	if (task_sleep || task_delayed || !se->sched_delayed)
9216582b0bfb17 kernel/sched/fair.c Vincent Guittot        2024-12-02  8355  		h_nr_runnable = 1;
8c1f560c1ea3f1 kernel/sched/fair.c Xuewen Yan             2020-12-18  8356  
d1373fcff1552e kernel/sched/fair.c Peter Zijlstra         2026-08-27  8357  	for_each_sched_entity(se, cfs_rq) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8358) 		update_curr(cfs_rq);
152e11f6df293e kernel/sched/fair.c Peter Zijlstra         2024-05-23  8359  
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8360) 		if (dequeue) {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8361) 			dequeue_entity(cfs_rq, se, flags);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8362) 			/* Don't dequeue parent if it has other entities besides us */
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8363) 			if (cfs_rq->load.weight)
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8364) 				dequeue = false;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8365) 		} else {
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8366) 			update_load_avg(cfs_rq, se, UPDATE_TG);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8367) 			se_update_runnable(se);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8368) 			update_cfs_group(se);
152e11f6df293e kernel/sched/fair.c Peter Zijlstra         2024-05-23  8369  		}
85dac906bec3bb kernel/sched_fair.c Paul Turner            2011-07-21  8370  
9216582b0bfb17 kernel/sched/fair.c Vincent Guittot        2024-12-02  8371  		cfs_rq->h_nr_runnable -= h_nr_runnable;
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8372) 		cfs_rq->h_nr_queued--;
31898e7b87dd28 kernel/sched/fair.c Vincent Guittot        2024-12-02  8373  		cfs_rq->h_nr_idle -= h_nr_idle;
2069dd75c7d0f4 kernel/sched_fair.c Peter Zijlstra         2010-11-15  8374  
304000390f88d0 kernel/sched/fair.c Josh Don               2021-07-29  8375  		if (cfs_rq_is_idle(cfs_rq))
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8376) 			h_nr_idle = 1;
304000390f88d0 kernel/sched/fair.c Josh Don               2021-07-29  8377  
eb962f251fbba2 kernel/sched/fair.c Aaron Lu               2025-08-29  8378  		if (throttled_hierarchy(cfs_rq) && task_throttled)
eb962f251fbba2 kernel/sched/fair.c Aaron Lu               2025-08-29  8379  			record_throttle_clock(cfs_rq);
6d4d22468dae3d kernel/sched/fair.c Vincent Guittot        2020-02-24  8380  
371fd7e7a56a5c kernel/sched_fair.c Peter Zijlstra         2010-03-24  8381  		flags |= DEQUEUE_SLEEP;
152e11f6df293e kernel/sched/fair.c Peter Zijlstra         2024-05-23  8382  		flags &= ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar            2007-07-09  8383  	}
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27  8384  
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27 @8385  	for_each_sched_entity_bl(se, cfs_rq)
ef80f56c1c3845 kernel/sched/fair.c Peter Zijlstra         2026-08-27  8386  		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
85570f10a4c613 kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-06  8387) }
8f4d37ec073c17 kernel/sched_fair.c Peter Zijlstra         2008-01-25  8388  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
