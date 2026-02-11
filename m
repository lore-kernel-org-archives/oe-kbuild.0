Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619D2EDD62
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770839449; cv=none; b=rJQVqouuwyjc0Ms+IO1kt9npurwul3kWg1eSCLiOhmgkkLEgxlDwctCeaGWjydoJ1OfC64iqkfk3lYlPlpZ1ix8ZeIZXzdwzJjPbED0Gdsl+ziybT+FKeej8sz7qm3soyjyWHgmbHGgxA7LQdyySOp3BSYIg58+W88mF1IiveCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770839449; c=relaxed/simple;
	bh=mGRE0wdFq470/Y45AjFQcgTk1ql/dDW5HV0GE0mCc7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VuG5pwMI+H/BYIW642GLGBoZ3EZMCC4SmS5R9yUaeYBt23qyVTnLQKNOGgELdVVhQDGU4+FOzaMJisUY6DF0/aPugBvuxTXZJG9KzkG8UGXcZoMXkhIdvUU5/2lM/g311F8ISLNOH9T+6/owCT+vmtF0Iz1qXrl+egjQ3kZb140=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9YzV9+y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9YzV9+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770839449; x=1802375449;
  h=date:from:to:cc:subject:message-id;
  bh=mGRE0wdFq470/Y45AjFQcgTk1ql/dDW5HV0GE0mCc7g=;
  b=J9YzV9+y+cUxOnC8QiCIv94rHto+hBoXiGvEhkR+RKZZkfxxUi/faWt6
   uDDH20N47auwmSoCF3te+X0KwjuJYNu7EDdYn3aKQX7/Lve9qV9MSViPC
   9HiGwKwUSqO2uorAOioMDu8UN/N08hU4RyzOFjkYSkD1HJy/SqbE0qpJE
   7o/v2gc6kChv3zK1pyedXAAViUPpusRqNuphrmIGhUsbl9tCiFq68CJSL
   h9Id1yGXbLqwtLcc/pyWG5fN/eEuq73h7xvgBUdZesD+mpS/4F1lD8Yhe
   q+P2GlIaCTLpIy1i9ga5CmJ0+KmDpdtIMCudWLzG86FWLh4p26ZEhQjTu
   A==;
X-CSE-ConnectionGUID: 2qNzyFUCSni+hHM0sWgNgw==
X-CSE-MsgGUID: KQhR8RZ1SVaUpkGk/bNvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75622528"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="75622528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 11:50:48 -0800
X-CSE-ConnectionGUID: l7bnH8LFSgC0MqskYydktA==
X-CSE-MsgGUID: Q+rm37zcSMWSMXOEl2Dr/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216851175"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2026 11:50:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqGEW-00000000qKC-3D9Q;
	Wed, 11 Feb 2026 19:50:44 +0000
Date: Thu, 12 Feb 2026 03:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:sched/flat 7/11] kernel/sched/fair.c:231:13:
 warning: '__update_inv_weight' defined but not used
Message-ID: <202602120333.U9HLGk68-lkp@intel.com>
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
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260212/202602120333.U9HLGk68-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120333.U9HLGk68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602120333.U9HLGk68-lkp@intel.com/

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
