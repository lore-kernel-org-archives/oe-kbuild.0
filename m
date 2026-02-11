Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA1359F9B
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843872; cv=none; b=kBtQ11fMMbgvmDZ4QZz3u+WFZBGZP//8yWy5ptXwCrK69NcQIlfET/XAFFAdJS+ivFoXJkMhF68zccJRfAcqTOkBVeIVxC41n9Gm4BggYRFxHKlQ80R/NDvGfL2VhrIMeG1OV8C/vd0w2RylKANamWwCwA10/LsE2O6lJpT2IPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843872; c=relaxed/simple;
	bh=rck24uFrQer06n8DLs0/1pIJO4wSfcPBTyyC8WEwRGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SpFN8eQN7AFeyZP+lBxwxuvR7BcqYGacwlIQe9QCJbFXlGi1oQFqLQYXYermyvriutIWXFnY9GNFpufUGas0kirZARUD6e8AXS3y/ANoPvD/+Z5MZvOz6ZfOVwsOMGTDezyth6bBErlVDpz3yOrfErhBQb8jLTeBYJ7VNhs6s0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3DcqKnS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3DcqKnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770843871; x=1802379871;
  h=date:from:to:cc:subject:message-id;
  bh=rck24uFrQer06n8DLs0/1pIJO4wSfcPBTyyC8WEwRGk=;
  b=P3DcqKnSfjWwQxs/SZVPQq50lbINk6BTZkym1fMNKzVFdikGLtI2OAnG
   OukMxutIVrdk/CIfJiNt9qBFLgoScTARgE77mplFgynJbH6ChTzfeDFYA
   YcXGcszOiP3ZePX+VOm/WkTcSY0SZo6L0nGbYz86gw2L6Jewcmi0HOibI
   6xPGgp2u1ScnrJYfJme3dzAFZdBRWYis0IsHh2hwrnPPp4usw+zCiRS3l
   +Fj+aUXFfyh7ek/0vI9X+vxs7Zvi+hGKfKm36N8HOZKOucDmmiJsm8Zx8
   A3gt3agjWthcVyOoRmQh51KRS9kmoP6t5fKd343fQghjWp+jfNifKPBU8
   A==;
X-CSE-ConnectionGUID: DVWyhkOPSYiyG5b/+cbhdw==
X-CSE-MsgGUID: CTJ2K3doRr25iQkIp/MyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83103761"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="83103761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:04:31 -0800
X-CSE-ConnectionGUID: 4IDUWEwXTu2OuUAVpWZSiQ==
X-CSE-MsgGUID: r3aw/ngoTJWfrne3ibsJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216618798"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 13:04:29 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqHNr-000000001A9-1Dq3;
	Wed, 11 Feb 2026 21:04:27 +0000
Date: Wed, 11 Feb 2026 22:04:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:sched/flat 7/11] kernel/sched/fair.c:231:13:
 warning: '__update_inv_weight' defined but not used
Message-ID: <202602112233.PL8ehyjC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "extra build warning to Peter Zijlstra"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   0900b7ccd9fd82ebb9af824a43994c4d20c7cca8
commit: 5f7dcdadf71c0b5c475bc3ffe4d4f69be7bb87b5 [7/11] sched/fair: Use full weight to __calc_delta()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260211/202602112233.PL8ehyjC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112233.PL8ehyjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602112233.PL8ehyjC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:231:13: warning: '__update_inv_weight' defined but not used [-Wunused-function]
     231 | static void __update_inv_weight(struct load_weight *lw)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/__update_inv_weight +231 kernel/sched/fair.c

029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  230  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18 @231  static void __update_inv_weight(struct load_weight *lw)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  232  {
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  233  	unsigned long w;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  234  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  235  	if (likely(lw->inv_weight))
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  236  		return;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  237  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  238  	w = scale_load_down(lw->weight);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  239  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  240  	if (BITS_PER_LONG > 32 && unlikely(w >= WMULT_CONST))
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  241  		lw->inv_weight = 1;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  242  	else if (unlikely(!w))
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  243  		lw->inv_weight = WMULT_CONST;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  244  	else
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  245  		lw->inv_weight = WMULT_CONST / w;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  246  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  247  

:::::: The code at line 231 was first introduced by commit
:::::: 9dbdb155532395ba000c5d5d187658b0e17e529f sched/fair: Rework sched_fair time accounting

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
