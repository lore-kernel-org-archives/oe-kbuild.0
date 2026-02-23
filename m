Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313A13D638
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 02:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771813498; cv=none; b=GNT98eh3IuMlRMTfB4FhHEjaJVHcIJ/gfobpg7ZWUKw4hFmEF89+AX0f9qNT6qbV36jbXfd+1idRvNdx0SxdwW8Ikz/AH6B740T70qJd4ux6GykWOnlvQgRjLwlsTSdAr/zJJBLVA8GC4SEbCUdtUdMGS52a8VUHQXm9KREl2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771813498; c=relaxed/simple;
	bh=DCBhnrZpXaxVeXU+ojNtexIIt1inxqdv79SCUmWTrAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0AY/FgHftUt8ONDL4X8yHQrViAqqFC7cSlVtfkR2JRaZEMndASPRMrg3GK3KTm2R2daO3YPHOnYpltpqVFO5oCvQt/9IdY/cHZcnplPsJMddu9iTB2dg77ErXtbGPA1DXnIyFtYqNTKfIlynpKzGZksHBlHyPK4Gq0M+nBmyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuRJEjJK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuRJEjJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771813495; x=1803349495;
  h=date:from:to:cc:subject:message-id;
  bh=DCBhnrZpXaxVeXU+ojNtexIIt1inxqdv79SCUmWTrAg=;
  b=MuRJEjJKAseN1tdbRB4K00HLo2Q5K6un4I+deW6Z22bzZcjPz/NQAGOz
   juqiW3EaKicnlqpwKtZTW+TELmNOzz4bhO94Cv5br/JqM2eMxAMrlUyuF
   Be4xM5P60QabNSM1Rkz4DbrbcFR52paGkgtVoJrSX+A6/aK4GKJzaJXen
   dijDJ0zRgyVGXJGV/bffIhuf8nvrNyZSrRKrxR+m2EhZJIbQIs7l5eQw3
   VkBSd1a6KoMyiOQxI+qtm6kryIK2aaMVU5PG8EPBgTofhIRvduYQFKTNc
   cKois4fMUg4ulmKLzkR1BZWTbMQBlr0swGHWi1pkMSH3vgW7byqLx/Z0d
   A==;
X-CSE-ConnectionGUID: 0IesE1B6RX+olXgkgyqDDA==
X-CSE-MsgGUID: QDyoEc65Siiaql4xxXd2Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83431643"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="83431643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 18:24:54 -0800
X-CSE-ConnectionGUID: EIMQZMO4QBO0O0666qE6mw==
X-CSE-MsgGUID: AM6qYfUOR/Cb+VygtxLRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="238379578"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2026 18:24:53 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuLcw-000000000G5-3ySt;
	Mon, 23 Feb 2026 02:24:50 +0000
Date: Mon, 23 Feb 2026 10:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/powerpc/perf/vpa-dtl.c:151:40-50: ERROR: function
 vpa_dtl_mem_alloc called on line 208 inside lock on line 190 but uses
 GFP_KERNEL
Message-ID: <202602231055.em7T0D4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kajol Jain <kjain@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r053-20260223 (https://download.01.org/0day-ci/archive/20260223/202602231055.em7T0D4w-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602231055.em7T0D4w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/perf/vpa-dtl.c:151:40-50: ERROR: function vpa_dtl_mem_alloc called on line 208 inside lock on line 190 but uses GFP_KERNEL

vim +151 arch/powerpc/perf/vpa-dtl.c

4708fba19adee9b Kajol Jain 2025-09-15  141  
4708fba19adee9b Kajol Jain 2025-09-15  142  static int vpa_dtl_mem_alloc(int cpu)
4708fba19adee9b Kajol Jain 2025-09-15  143  {
4708fba19adee9b Kajol Jain 2025-09-15  144  	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, cpu);
4708fba19adee9b Kajol Jain 2025-09-15  145  	struct dtl_entry *buf = NULL;
4708fba19adee9b Kajol Jain 2025-09-15  146  
4708fba19adee9b Kajol Jain 2025-09-15  147  	/* Check for dispatch trace log buffer cache */
4708fba19adee9b Kajol Jain 2025-09-15  148  	if (!dtl_cache)
4708fba19adee9b Kajol Jain 2025-09-15  149  		return -ENOMEM;
4708fba19adee9b Kajol Jain 2025-09-15  150  
4708fba19adee9b Kajol Jain 2025-09-15 @151  	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
4708fba19adee9b Kajol Jain 2025-09-15  152  	if (!buf) {
4708fba19adee9b Kajol Jain 2025-09-15  153  		pr_warn("buffer allocation failed for cpu %d\n", cpu);
4708fba19adee9b Kajol Jain 2025-09-15  154  		return -ENOMEM;
4708fba19adee9b Kajol Jain 2025-09-15  155  	}
4708fba19adee9b Kajol Jain 2025-09-15  156  	dtl->buf = buf;
4708fba19adee9b Kajol Jain 2025-09-15  157  	return 0;
4708fba19adee9b Kajol Jain 2025-09-15  158  }
4708fba19adee9b Kajol Jain 2025-09-15  159  
4708fba19adee9b Kajol Jain 2025-09-15  160  static int vpa_dtl_event_init(struct perf_event *event)
4708fba19adee9b Kajol Jain 2025-09-15  161  {
4708fba19adee9b Kajol Jain 2025-09-15  162  	struct hw_perf_event *hwc = &event->hw;
4708fba19adee9b Kajol Jain 2025-09-15  163  
4708fba19adee9b Kajol Jain 2025-09-15  164  	/* test the event attr type for PMU enumeration */
4708fba19adee9b Kajol Jain 2025-09-15  165  	if (event->attr.type != event->pmu->type)
4708fba19adee9b Kajol Jain 2025-09-15  166  		return -ENOENT;
4708fba19adee9b Kajol Jain 2025-09-15  167  
4708fba19adee9b Kajol Jain 2025-09-15  168  	if (!perfmon_capable())
4708fba19adee9b Kajol Jain 2025-09-15  169  		return -EACCES;
4708fba19adee9b Kajol Jain 2025-09-15  170  
4708fba19adee9b Kajol Jain 2025-09-15  171  	/* Return if this is a counting event */
4708fba19adee9b Kajol Jain 2025-09-15  172  	if (!is_sampling_event(event))
4708fba19adee9b Kajol Jain 2025-09-15  173  		return -EOPNOTSUPP;
4708fba19adee9b Kajol Jain 2025-09-15  174  
4708fba19adee9b Kajol Jain 2025-09-15  175  	/* no branch sampling */
4708fba19adee9b Kajol Jain 2025-09-15  176  	if (has_branch_stack(event))
4708fba19adee9b Kajol Jain 2025-09-15  177  		return -EOPNOTSUPP;
4708fba19adee9b Kajol Jain 2025-09-15  178  
4708fba19adee9b Kajol Jain 2025-09-15  179  	/* Invalid eventcode */
4708fba19adee9b Kajol Jain 2025-09-15  180  	switch (event->attr.config) {
4708fba19adee9b Kajol Jain 2025-09-15  181  	case DTL_LOG_CEDE:
4708fba19adee9b Kajol Jain 2025-09-15  182  	case DTL_LOG_PREEMPT:
4708fba19adee9b Kajol Jain 2025-09-15  183  	case DTL_LOG_FAULT:
4708fba19adee9b Kajol Jain 2025-09-15  184  	case DTL_LOG_ALL:
4708fba19adee9b Kajol Jain 2025-09-15  185  		break;
4708fba19adee9b Kajol Jain 2025-09-15  186  	default:
4708fba19adee9b Kajol Jain 2025-09-15  187  		return -EINVAL;
4708fba19adee9b Kajol Jain 2025-09-15  188  	}
4708fba19adee9b Kajol Jain 2025-09-15  189  
4708fba19adee9b Kajol Jain 2025-09-15 @190  	spin_lock(&dtl_global_lock);
4708fba19adee9b Kajol Jain 2025-09-15  191  
4708fba19adee9b Kajol Jain 2025-09-15  192  	/*
4708fba19adee9b Kajol Jain 2025-09-15  193  	 * To ensure there are no other conflicting dtl users
4708fba19adee9b Kajol Jain 2025-09-15  194  	 * (example: /proc/powerpc/vcpudispatch_stats or debugfs dtl),
4708fba19adee9b Kajol Jain 2025-09-15  195  	 * below code try to take the dtl_access_lock.
4708fba19adee9b Kajol Jain 2025-09-15  196  	 * The dtl_access_lock is a rwlock defined in dtl.h, which is used
4708fba19adee9b Kajol Jain 2025-09-15  197  	 * to unsure there is no conflicting dtl users.
4708fba19adee9b Kajol Jain 2025-09-15  198  	 * Based on below code, vpa_dtl pmu tries to take write access lock
4708fba19adee9b Kajol Jain 2025-09-15  199  	 * and also checks for dtl_global_refc, to make sure that the
4708fba19adee9b Kajol Jain 2025-09-15  200  	 * dtl_access_lock is taken by vpa_dtl pmu interface.
4708fba19adee9b Kajol Jain 2025-09-15  201  	 */
4708fba19adee9b Kajol Jain 2025-09-15  202  	if (dtl_global_refc == 0 && !down_write_trylock(&dtl_access_lock)) {
4708fba19adee9b Kajol Jain 2025-09-15  203  		spin_unlock(&dtl_global_lock);
4708fba19adee9b Kajol Jain 2025-09-15  204  		return -EBUSY;
4708fba19adee9b Kajol Jain 2025-09-15  205  	}
4708fba19adee9b Kajol Jain 2025-09-15  206  
4708fba19adee9b Kajol Jain 2025-09-15  207  	/* Allocate dtl buffer memory */
4708fba19adee9b Kajol Jain 2025-09-15 @208  	if (vpa_dtl_mem_alloc(event->cpu)) {
4708fba19adee9b Kajol Jain 2025-09-15  209  		spin_unlock(&dtl_global_lock);
4708fba19adee9b Kajol Jain 2025-09-15  210  		return -ENOMEM;
4708fba19adee9b Kajol Jain 2025-09-15  211  	}
4708fba19adee9b Kajol Jain 2025-09-15  212  
4708fba19adee9b Kajol Jain 2025-09-15  213  	/*
4708fba19adee9b Kajol Jain 2025-09-15  214  	 * Increment the number of active vpa_dtl pmu threads. The
4708fba19adee9b Kajol Jain 2025-09-15  215  	 * dtl_global_refc is used to keep count of cpu threads that
4708fba19adee9b Kajol Jain 2025-09-15  216  	 * currently capturing dtl data using vpa_dtl pmu interface.
4708fba19adee9b Kajol Jain 2025-09-15  217  	 */
4708fba19adee9b Kajol Jain 2025-09-15  218  	dtl_global_refc++;
4708fba19adee9b Kajol Jain 2025-09-15  219  
4708fba19adee9b Kajol Jain 2025-09-15  220  	spin_unlock(&dtl_global_lock);
4708fba19adee9b Kajol Jain 2025-09-15  221  
4708fba19adee9b Kajol Jain 2025-09-15  222  	hrtimer_setup(&hwc->hrtimer, vpa_dtl_hrtimer_handle, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
4708fba19adee9b Kajol Jain 2025-09-15  223  
4708fba19adee9b Kajol Jain 2025-09-15  224  	/*
4708fba19adee9b Kajol Jain 2025-09-15  225  	 * Since hrtimers have a fixed rate, we can do a static freq->period
4708fba19adee9b Kajol Jain 2025-09-15  226  	 * mapping and avoid the whole period adjust feedback stuff.
4708fba19adee9b Kajol Jain 2025-09-15  227  	 */
4708fba19adee9b Kajol Jain 2025-09-15  228  	if (event->attr.freq) {
4708fba19adee9b Kajol Jain 2025-09-15  229  		long freq = event->attr.sample_freq;
4708fba19adee9b Kajol Jain 2025-09-15  230  
4708fba19adee9b Kajol Jain 2025-09-15  231  		event->attr.sample_period = NSEC_PER_SEC / freq;
4708fba19adee9b Kajol Jain 2025-09-15  232  		hwc->sample_period = event->attr.sample_period;
4708fba19adee9b Kajol Jain 2025-09-15  233  		local64_set(&hwc->period_left, hwc->sample_period);
4708fba19adee9b Kajol Jain 2025-09-15  234  		hwc->last_period = hwc->sample_period;
4708fba19adee9b Kajol Jain 2025-09-15  235  		event->attr.freq = 0;
4708fba19adee9b Kajol Jain 2025-09-15  236  	}
4708fba19adee9b Kajol Jain 2025-09-15  237  
4708fba19adee9b Kajol Jain 2025-09-15  238  	event->destroy = vpa_dtl_reset_global_refc;
4708fba19adee9b Kajol Jain 2025-09-15  239  	return 0;
4708fba19adee9b Kajol Jain 2025-09-15  240  }
4708fba19adee9b Kajol Jain 2025-09-15  241  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
