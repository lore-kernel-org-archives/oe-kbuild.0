Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64211622
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679884923; x=1711420923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eG1nOUx0sjI4lM/TIerJwUtW98kphlTYu9p03Iaq4tM=;
  b=LIJWjquTu0faiBPR6znGmZ/QNOK9J1Gwm7TbzQaDMWunB59cM+hLhlq7
   CmlwZr+8pQtBkK3pSE/O3sIBxjzm+5Exv2CkShOLuB0OV6X3zXTRLpbrN
   p+IFsTA00PdG8xre5GYkT2fYv6ZeyV1RPFKX9QW+SU/OJEDutxV4p4NIv
   YmVXdUxbYPECVbl8oGFx+f7cI/IoeeaS4i23tagIvni+8HR7RKl3KM+hb
   ETdfPx+5OTw67KUOhsBrSTuq/wrUGU6wTmPjZoTJ8fmcZkdQI0KF5uSYD
   kI612YzECt6Xlwg6KbiP/9ENOj9N8AVPP3H0c5G/RmtlJgkDYx159ZD0K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="324048591"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="324048591"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 19:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="772527652"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="772527652"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 19:42:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgco4-000HUd-2P;
	Mon, 27 Mar 2023 02:42:00 +0000
Date: Mon, 27 Mar 2023 10:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:sched/eevdf 16/18] kernel/sched/fair.c:4897
 place_entity() warn: bitwise AND condition is false here
Message-ID: <202303271029.8tDHBTWw-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   757a8ca40738a90f69ec65470ddae5f4d5e5256c
commit: 64bf62583563ac096b7b30e522d31b23bd97f0c1 [16/18] sched/eevdf: Sleeper bonus
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230327/202303271029.8tDHBTWw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303271029.8tDHBTWw-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:4897 place_entity() warn: bitwise AND condition is false here

vim +4897 kernel/sched/fair.c

9d85f21c94f7f7 kernel/sched/fair.c Paul Turner    2012-10-04  4820  
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  4821  static void
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4822  place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  4823  {
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4824  	u64 vslice = calc_delta_fair(se->slice, se);
6066a176fcb88e kernel/sched/fair.c Peter Zijlstra 2023-03-03  4825  	u64 vruntime = avg_vruntime(cfs_rq);
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4826  	s64 lag = 0;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4827  
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4828  	/*
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4829  	 * Due to how V is constructed as the weighted average of entities,
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4830  	 * adding tasks with positive lag, or removing tasks with negative lag
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4831  	 * will move 'time' backwards, this can screw around with the lag of
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4832  	 * other tasks.
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4833  	 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4834  	 * EEVDF: placement strategy #1 / #2
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4835  	 */
cae7d041cc3a40 kernel/sched/fair.c Peter Zijlstra 2023-03-11  4836  	if (sched_feat(PLACE_LAG) && cfs_rq->nr_running) {
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4837  		struct sched_entity *curr = cfs_rq->curr;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4838  		unsigned long load;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4839  
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4840  		lag = se->vlag;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4841  
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4842  		/*
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4843  		 * For latency sensitive tasks; those that have a shorter than
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4844  		 * average slice and do not fully consume the slice, transition
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4845  		 * to EEVDF placement strategy #2.
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4846  		 */
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4847  		if (sched_feat(PLACE_FUDGE) &&
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4848  		    cfs_rq->avg_slice > se->slice * cfs_rq->avg_load) {
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4849  			lag += vslice;
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4850  			if (lag > 0)
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4851  				lag = 0;
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4852  		}
8b18bbc0e32ead kernel/sched/fair.c Peter Zijlstra 2023-03-25  4853  
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4854  		/*
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4855  		 * If we want to place a task and preserve lag, we have to
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4856  		 * consider the effect of the new entity on the weighted
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4857  		 * average and compensate for this, otherwise lag can quickly
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4858  		 * evaporate:
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4859  		 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4860  		 * l_i = V - v_i <=> v_i = V - l_i
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4861  		 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4862  		 * V = v_avg = W*v_avg / W
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4863  		 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4864  		 * V' = (W*v_avg + w_i*v_i) / (W + w_i)
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4865  		 *    = (W*v_avg + w_i(v_avg - l_i)) / (W + w_i)
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4866  		 *    = v_avg + w_i*l_i/(W + w_i)
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4867  		 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4868  		 * l_i' = V' - v_i = v_avg + w_i*l_i/(W + w_i) - (v_avg - l)
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4869  		 *      = l_i - w_i*l_i/(W + w_i)
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4870  		 *
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4871  		 * l_i = (W + w_i) * l_i' / W
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4872  		 */
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4873  		load = cfs_rq->avg_load;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4874  		if (curr && curr->on_rq)
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4875  			load += scale_load_down(curr->load.weight);
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4876  
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4877  		lag *= load + scale_load_down(se->load.weight);
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4878  		if (WARN_ON_ONCE(!load))
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4879  			load = 1;
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4880  		lag = div_s64(lag, load);
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4881  
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4882  		vruntime -= lag;
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4883  	}
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4884  
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4885  	/*
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4886  	 * The whole 'sleeper' bonus hack... :-/ This is strictly unfair.
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4887  	 *
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4888  	 * By giving a sleeping task a little boost, it becomes possible for a
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4889  	 * 50% task to compete equally with a 100% task. That is, strictly fair
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4890  	 * that setup would result in a 67% / 33% split. Sleeper bonus will
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4891  	 * change that to 50% / 50%.
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4892  	 *
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4893  	 * This thing hurts my brain, because tasks leaving with negative lag
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4894  	 * will move 'time' backward, so comparing against a historical
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4895  	 * se->vruntime is dodgy as heck.
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4896  	 */
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26 @4897  	if (sched_feat(PLACE_BONUS) && !(flags & ENQUEUE_MIGRATED) &&
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4898  	    (flags & ENQUEUE_WAKEUP)) {
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4899  		/*
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4900  		 * If se->vruntime is ahead of vruntime, something dodgy
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4901  		 * happened and we cannot give bonus due to not having valid
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4902  		 * history.
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4903  		 */
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4904  		if ((s64)(se->vruntime - vruntime) < 0) {
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4905  			vruntime -= vslice/2;
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4906  			vruntime = max_vruntime(se->vruntime, vruntime);
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4907  		}
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4908  	}
d5c885ce53e17d kernel/sched/fair.c Peter Zijlstra 2023-03-03  4909  
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4910  	se->vruntime = vruntime;
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4911  
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4912  	/*
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4913  	 * When joining the competition; the exisiting tasks will be,
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4914  	 * on average, halfway through their slice, as such start tasks
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4915  	 * off with half a slice to ease into the competition.
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4916  	 */
64bf62583563ac kernel/sched/fair.c Peter Zijlstra 2023-03-26  4917  	if (sched_feat(PLACE_DEADLINE_INITIAL) && (flags & ENQUEUE_INITIAL))
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4918  		vslice /= 2;
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4919  
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4920  	/*
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4921  	 * EEVDF: vd_i = ve_i + r_i/w_i
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4922  	 */
7710de55e94355 kernel/sched/fair.c Peter Zijlstra 2010-04-20  4923  	se->deadline = se->vruntime + vslice;
aeb73b040399f9 kernel/sched_fair.c Peter Zijlstra 2007-10-15  4924  }
aeb73b040399f9 kernel/sched_fair.c Peter Zijlstra 2007-10-15  4925  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
