Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24291C1F22
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216793; cv=none; b=u8DfDau+Do9Nbug44EscEFcMknYdjYyeOhiEJNKLpWsvdtUB9MxZJCTCpOJ24wwCO57QioQ6iZAczB1WAM4GSlrmw7BEabsfWX/gVQFagQlNR/RSjuxFz+ca9xqkhzXVbJWmfxh3DsW81JvN7c50nuXO+d+qq9D4+1Ec1XPshL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216793; c=relaxed/simple;
	bh=7rzv3hdk9AcsjU+nboH5XyUD0NG4fupZ3Z61JKsseEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBmiNYFXx17KPftNggCcaGYty6GBj1RIS2lXlwKJEXGeh8NIc/iQD2wudESnyNNROTv5cLj78Z2M3l8tHZAGqCwLOhjyW82IK2hs9DRoVFB081YBaZwaL0z5Slp6qjnLWniVR+zh9FjiLcfkbmsq9FpjjsJhrSdmH0AFAsupvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNr8DCmj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNr8DCmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750216792; x=1781752792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rzv3hdk9AcsjU+nboH5XyUD0NG4fupZ3Z61JKsseEc=;
  b=dNr8DCmjy/qDJPIVs5drO+KyMHW4aavT9QRqRdB/OK4yoVk8bDo2/TAN
   1xna54RN3uWko5jxaY+wTD0cq9S1y+8Mq6uQr0/vrQpd2yferlCLyxuA9
   ioLIcDGj0PVLPT9EPDMXuQwV642N/kHk9wgCoNtoCxjDGT8Erhp5cyBRw
   Cl38mtu4Igf6p+EAt524d6+sf3+EhERMHbzswCfLWkJPRdTx6CDJgg3gL
   QdZAKv6jQS2tO5yhvc+8IDVL+iugAKj4Yw+V066aj4lYb/qHZ0TcYQZuw
   7ggRPLB/Gq9Wrw14iKJpML0ytlcmxEnu6fS7BwQH4qmySYV8WxjxdbhfK
   w==;
X-CSE-ConnectionGUID: 1Yhf1MGtTzKO5wMGCUfccQ==
X-CSE-MsgGUID: wn1016WSTlSuND0b+2z7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56220860"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56220860"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:19:52 -0700
X-CSE-ConnectionGUID: ksMUtSUqRCKUoYIDVsTgow==
X-CSE-MsgGUID: rpoGFTxdRNKHPVJnX5WBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154622004"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2025 20:19:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRjL0-000JLe-2y;
	Wed, 18 Jun 2025 03:19:46 +0000
Date: Wed, 18 Jun 2025 11:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:sched/core 20/43] kernel/sched/fair.c:12210 find_new_ilb()
 warn: missing error code? 'ilb_cpu'
Message-ID: <202506181112.A9JJV7Vc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   dabe1be4e84c05db9341eb8c6c410e18a5ffeaa5
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 [20/43] sched/smp: Make SMP unconditional
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181112.A9JJV7Vc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506181112.A9JJV7Vc-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:12210 find_new_ilb() warn: missing error code? 'ilb_cpu'

vim +/ilb_cpu +12210 kernel/sched/fair.c

d987fc7f3228bf kernel/sched/fair.c Mike Galbraith      2011-12-05  12188  
3451d0243c3cdf kernel/sched/fair.c Frederic Weisbecker 2011-08-10  12189  #ifdef CONFIG_NO_HZ_COMMON
83cd4fe27ad844 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12190  /*
7ef7145a2b26b1 kernel/sched/fair.c Ingo Molnar         2023-10-06  12191   * NOHZ idle load balancing (ILB) details:
7ef7145a2b26b1 kernel/sched/fair.c Ingo Molnar         2023-10-06  12192   *
7ef7145a2b26b1 kernel/sched/fair.c Ingo Molnar         2023-10-06  12193   * - When one of the busy CPUs notices that there may be an idle rebalancing
83cd4fe27ad844 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12194   *   needed, they will kick the idle load balancer, which then does idle
83cd4fe27ad844 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12195   *   load balancing for all the idle CPUs.
83cd4fe27ad844 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12196   */
3dd0337d6df7d5 kernel/sched/fair.c Daniel Lezcano      2014-01-06  12197  static inline int find_new_ilb(void)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra      2009-12-17  12198  {
031e3bd8986fff kernel/sched/fair.c Yuan ZhaoXiong      2021-06-06  12199  	const struct cpumask *hk_mask;
b6dd6984832a28 kernel/sched/fair.c Ingo Molnar         2023-10-06  12200  	int ilb_cpu;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra      2009-12-17  12201  
c907cd44a108ef kernel/sched/fair.c Waiman Long         2024-10-30  12202  	hk_mask = housekeeping_cpumask(HK_TYPE_KERNEL_NOISE);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra      2009-12-17  12203  
b6dd6984832a28 kernel/sched/fair.c Ingo Molnar         2023-10-06  12204  	for_each_cpu_and(ilb_cpu, nohz.idle_cpus_mask, hk_mask) {
45da7a2b0af8fa kernel/sched/fair.c Peter Zijlstra      2020-08-18  12205  
b6dd6984832a28 kernel/sched/fair.c Ingo Molnar         2023-10-06  12206  		if (ilb_cpu == smp_processor_id())
45da7a2b0af8fa kernel/sched/fair.c Peter Zijlstra      2020-08-18  12207  			continue;
45da7a2b0af8fa kernel/sched/fair.c Peter Zijlstra      2020-08-18  12208  
b6dd6984832a28 kernel/sched/fair.c Ingo Molnar         2023-10-06  12209  		if (idle_cpu(ilb_cpu))
b6dd6984832a28 kernel/sched/fair.c Ingo Molnar         2023-10-06 @12210  			return ilb_cpu;
9b019acb72e4b5 kernel/sched/fair.c Nicholas Piggin     2019-04-12  12211  	}
786d6dc7aeb2bf kernel/sched/fair.c Suresh Siddha       2011-12-01  12212  
f4bb5705114530 kernel/sched/fair.c Ingo Molnar         2023-10-06  12213  	return -1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra      2009-12-17  12214  }
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra      2009-12-17  12215  

:::::: The code at line 12210 was first introduced by commit
:::::: b6dd6984832a2868f78879fce30d6965ae899d02 sched/nohz: Use consistent variable names in find_new_ilb() and kick_ilb()

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
