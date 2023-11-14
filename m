Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977026AD1
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF1Wq9VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700002612; x=1731538612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jlR+/ykX1NVlX9ZApyfskXLbK4Isam/ye1vdZDHRYNY=;
  b=dF1Wq9VWeHmE18Fv/NSp67qLU7tJCra0zpnf5VSNH+51szm0ifNJGQdn
   /HSKOwUvzUQdEgyh84Lhwr5r8U0sQqCsIi6zljU3ykgso2T5gLADsYLWK
   2GPJPaLVghcljW8NPX7OW3AEa3ARkjj6XCao9wliXaUsUEStw50s9TcIV
   z8LEb+rOc4CMvp7QA0QnmDDuSClKDwYR04c8HjyzDevA1VuRS3Uwksos0
   CLfEGcLAR4IvJ40tuAtbBzkZQpUFemW1LP36p4b7ohWlXqt/E4T8uHEpH
   0Jp0rIFLub0MbYn9QseftFjQUg/tl14UC00yXvuWxdaArsqV7jPpt5PLO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421862520"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="421862520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 14:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096254868"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="1096254868"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2023 14:56:50 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r32Ku-0000lA-2h;
	Tue, 14 Nov 2023 22:56:48 +0000
Date: Wed, 15 Nov 2023 06:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311150658.bxA1xL20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Hi Robin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: f9bd34e3753ea8f1433a3ba70f03a165a1416f98 perf/arm_cspmu: Clean up ACPI dependency
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci/archive/20231115/202311150658.bxA1xL20-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311150658.bxA1xL20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150658.bxA1xL20-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] __percpu *

vim +627 drivers/perf/arm_cspmu/arm_cspmu.c

e37dfd65731dc4 Besar Wicaksono 2022-11-11  609  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  610  /*
e37dfd65731dc4 Besar Wicaksono 2022-11-11  611   * Make sure the group of events can be scheduled at once
e37dfd65731dc4 Besar Wicaksono 2022-11-11  612   * on the PMU.
e37dfd65731dc4 Besar Wicaksono 2022-11-11  613   */
e37dfd65731dc4 Besar Wicaksono 2022-11-11  614  static bool arm_cspmu_validate_group(struct perf_event *event)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  615  {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  616  	struct perf_event *sibling, *leader = event->group_leader;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  617  	struct arm_cspmu_hw_events fake_hw_events;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  618  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  619  	if (event->group_leader == event)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  620  		return true;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  621  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  622  	memset(&fake_hw_events, 0, sizeof(fake_hw_events));
e37dfd65731dc4 Besar Wicaksono 2022-11-11  623  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  624  	if (!arm_cspmu_validate_event(event->pmu, &fake_hw_events, leader))
e37dfd65731dc4 Besar Wicaksono 2022-11-11  625  		return false;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  626  
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @627  	for_each_sibling_event(sibling, leader) {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  628  		if (!arm_cspmu_validate_event(event->pmu, &fake_hw_events,
e37dfd65731dc4 Besar Wicaksono 2022-11-11  629  						  sibling))
e37dfd65731dc4 Besar Wicaksono 2022-11-11  630  			return false;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  631  	}
e37dfd65731dc4 Besar Wicaksono 2022-11-11  632  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  633  	return arm_cspmu_validate_event(event->pmu, &fake_hw_events, event);
e37dfd65731dc4 Besar Wicaksono 2022-11-11  634  }
e37dfd65731dc4 Besar Wicaksono 2022-11-11  635  

:::::: The code at line 627 was first introduced by commit
:::::: e37dfd65731dc4f001fa7dfa7f705e6840017d5a perf: arm_cspmu: Add support for ARM CoreSight PMU driver

:::::: TO: Besar Wicaksono <bwicaksono@nvidia.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
