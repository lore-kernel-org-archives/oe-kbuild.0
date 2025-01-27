Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87316157465
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737995668; cv=none; b=kuYDwRsAdZlebQctDEzJy5UFQvY3XxyGa0trzWeEPT/6kyLsPflwD6q5iVzUBe7x2h1AAWsMBB03yLjhzIIKWQy3VYV9hjFVNZMqcm8m5xQBM/lYb6UAdzpQ3MwyLEWUKma31eufZTR3CesORvpanMIfi2fHGtIQBl22HE5rA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737995668; c=relaxed/simple;
	bh=xBs0zKHnTswvFLxhzkeONLbRwUGUHZE33ONYLB1PsMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsdGwGigMyZnu66gK1/BP5G13ZeZnjCJ5GWGwTSwHKspZSuHJxw2/oRfLJJl9mQnDn95dNn36vsgFUmpaz5qZtmzb3Pnj0vxM5S2p9kEJ7dIAyV1ck+timmVLzahz3oAanouvzEbJ6UjZTYAl/AibO+LdskcdwpmFxmpCnnmSDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuGdimWu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuGdimWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737995666; x=1769531666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xBs0zKHnTswvFLxhzkeONLbRwUGUHZE33ONYLB1PsMQ=;
  b=VuGdimWuj0/ERAx8RkOkxuftLMrUhyyG9f3hCAb/oXojw4fWhnnDnqKw
   lYnd8KV7r5aH8xaqYPNwetgClC2pBrZBpgzWC6dcwXac818f5qgqvYHdq
   y5RN5B2LvIM68Dz3PR/Qwr3J9Md8bp6wMamvlX4IZOevEEa7eCPryxnoq
   WqYXJ1SAzs8eceisdx//BVu51f9PBUAQR5gKi6y5VaKOM8TZa1nSGO7T+
   q1ut3f17BjzKXiaWIn2/+zPp5y2zcK78cxDWbgXTCcRboML7O/bP02Xq0
   cAeARbIzDYCkMpuXHcXPVi9nrYAruMGP0aG4euNgbZuJW/+XwfBbOfNf4
   g==;
X-CSE-ConnectionGUID: rAlvLLZMTJ+6CwHw2Mnvfg==
X-CSE-MsgGUID: Eo6mrm7dRPeeYqwocNQeOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37665893"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="37665893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:34:24 -0800
X-CSE-ConnectionGUID: 7ylF3kixRZqHDpctyWZtgA==
X-CSE-MsgGUID: XK6xxpCYRtOgTBx088wsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109390640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jan 2025 08:34:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcS44-000gyH-1H;
	Mon, 27 Jan 2025 16:34:20 +0000
Date: Tue, 28 Jan 2025 00:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/fair.c:951
 pick_eevdf() warn: if statement not indented
Message-ID: <202501280039.OizxOeSq-lkp@intel.com>
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
TO: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250127 (https://download.01.org/0day-ci/archive/20250128/202501280039.OizxOeSq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501280039.OizxOeSq-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:951 pick_eevdf() warn: if statement not indented

vim +951 kernel/sched/fair.c

bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  908  
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  909  /*
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  910   * Earliest Eligible Virtual Deadline First
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  911   *
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  912   * In order to provide latency guarantees for different request sizes
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  913   * EEVDF selects the best runnable task from two criteria:
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  914   *
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  915   *  1) the task must be eligible (must be owed service)
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  916   *
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  917   *  2) from those tasks that meet 1), we select the one
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  918   *     with the earliest virtual deadline.
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  919   *
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  920   * We can do this in O(log n) time due to an augmented RB-tree. The
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  921   * tree keeps the entries sorted on deadline, but also functions as a
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  922   * heap based on the vruntime by keeping:
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  923   *
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  924   *  se->min_vruntime = min(se->vruntime, se->{left,right}->min_vruntime)
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  925   *
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  926   * Which allows tree pruning through eligibility.
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  927   */
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  928  static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
ac53db596cc08e kernel/sched_fair.c Rik van Riel   2011-02-01  929  {
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  930  	struct rb_node *node = cfs_rq->tasks_timeline.rb_root.rb_node;
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  931  	struct sched_entity *se = __pick_first_entity(cfs_rq);
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  932  	struct sched_entity *curr = cfs_rq->curr;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  933  	struct sched_entity *best = NULL;
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  934  
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  935  	/*
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  936  	 * We can safely skip eligibility check if there is only one entity
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  937  	 * in this cfs_rq, saving some cycles.
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  938  	 */
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  939  	if (cfs_rq->nr_running == 1)
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  940  		return curr && curr->on_rq ? curr : se;
ac53db596cc08e kernel/sched_fair.c Rik van Riel   2011-02-01  941  
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  942  	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  943  		curr = NULL;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  944  
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  945  	/*
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  946  	 * Once selected, run a task until it either becomes non-eligible or
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  947  	 * until it gets a new slice. See the HACK in set_next_entity().
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  948  	 */
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  949  	if (sched_feat(RUN_TO_PARITY) && curr && curr->vlag == curr->deadline)
c358c65925524f kernel/sched/fair.c Masahito S     2025-01-20  950  #ifdef CONFIG_SCHED_BORE
c358c65925524f kernel/sched/fair.c Masahito S     2025-01-20 @951  		if (!(likely(sched_bore) && likely(sched_burst_parity_threshold) &&
c358c65925524f kernel/sched/fair.c Masahito S     2025-01-20  952  			sched_burst_parity_threshold < cfs_rq->nr_running))
c358c65925524f kernel/sched/fair.c Masahito S     2025-01-20  953  #endif // CONFIG_SCHED_BORE
63304558ba5dca kernel/sched/fair.c Peter Zijlstra 2023-08-16  954  		return curr;
ac53db596cc08e kernel/sched_fair.c Rik van Riel   2011-02-01  955  
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  956  	/* Pick the leftmost entity if it's eligible */
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  957  	if (se && entity_eligible(cfs_rq, se)) {
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  958  		best = se;
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  959  		goto found;
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  960  	}
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  961  
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  962  	/* Heap search for the EEVD entity */
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  963  	while (node) {
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  964  		struct rb_node *left = node->rb_left;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  965  
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  966  		/*
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  967  		 * Eligible entities in left subtree are always better
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  968  		 * choices, since they have earlier deadlines.
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  969  		 */
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  970  		if (left && vruntime_eligible(cfs_rq,
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  971  					__node_2_se(left)->min_vruntime)) {
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  972  			node = left;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  973  			continue;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  974  		}
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  975  
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  976  		se = __node_2_se(node);
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  977  
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  978  		/*
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  979  		 * The left subtree either is empty or has no eligible
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  980  		 * entity, so check the current node since it is the one
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  981  		 * with earliest deadline that might be eligible.
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  982  		 */
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  983  		if (entity_eligible(cfs_rq, se)) {
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  984  			best = se;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  985  			break;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  986  		}
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  987  
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  988  		node = node->rb_right;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  989  	}
ee4373dc902c0a kernel/sched/fair.c Abel Wu        2023-11-15  990  found:
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  991  	if (!best || (curr && entity_before(curr, best)))
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  992  		best = curr;
147f3efaa24182 kernel/sched/fair.c Peter Zijlstra 2023-05-31  993  
2227a957e1d5b1 kernel/sched/fair.c Abel Wu        2023-11-15  994  	return best;
ac53db596cc08e kernel/sched_fair.c Rik van Riel   2011-02-01  995  }
ac53db596cc08e kernel/sched_fair.c Rik van Riel   2011-02-01  996  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
