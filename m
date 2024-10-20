Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B5192B71
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457809; cv=none; b=Tpx3WQ1VUSePomA0biYHE7Sou+W7ZflpT3kQkyCnVWxjOS5q/EfhUeBEblyFTwyt0pb1woUc+/M1m/rPNkj9CYiPjezw2oVzm/+/E9EgqgNvonfXM2HWGdyHoY8yZn3+C972zKpabFfAREQjyzAEqZexUNg6O3UQGZ2Bdpo6ZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457809; c=relaxed/simple;
	bh=imBxggr5CMqgk7E0CBPqygHqZ5O1mIWAgM3lQb0FO6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3pVfM/s1ulS+rEPrM8OJaMehd9rK6ANydvxFHKfq8YAeP4hIJ56+wei3a9QFNCJiFAuHSPO55EZIoZuHRwwd0UcxH61Se9+cJfKQzpcUSg1xvzYeQyxcfsoIh6uAdrzBnPkdyT2qZKtSdRMae4YeN/Zj+vUCtE/B10W1Mg5LPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdtevSIx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdtevSIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729457807; x=1760993807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imBxggr5CMqgk7E0CBPqygHqZ5O1mIWAgM3lQb0FO6A=;
  b=JdtevSIx3Ahsi0NHGQCnqO+P6IcDjaK0GXR8pTsELXO9ZG1EB7SPob9E
   PeW5zFJUKLBT9Zz+zf9CwTiE1X0KoRNVbLa19rOIYN1Hi/36scahGZp7r
   4VGfsOLlbSzqNrdHlGbcwetIk1gt/gaodg0B15IztE0RATYk67WR6Kip4
   a3i7BoR82l5+whXbveQkPSNvhpcNO9mhFgpo07iJZfnfzb0bvvCKkBLdS
   dBaHjl0S4HY4khxzkO8kEcTQQmGtLLL2Zevsb5hP4NNyRyHwtRxCg8kMc
   C6j7GnlDYfDYR/QC9zJXG8obLP2Nozzm7fJzv0FcI6D/K/DtTiBbDrxky
   w==;
X-CSE-ConnectionGUID: V98cRcwFTNmgM/U6jj9k7A==
X-CSE-MsgGUID: WndszZSNRxidiTzK8tGcdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28714630"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28714630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 13:56:47 -0700
X-CSE-ConnectionGUID: 1suxazbwQSK1i9lcqng4NA==
X-CSE-MsgGUID: 136MfBPFRQKXf9jDsP39mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="116803995"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 13:56:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2cyh-000Qnf-1P;
	Sun, 20 Oct 2024 20:56:43 +0000
Date: Mon, 21 Oct 2024 04:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/cgroup/cgroup.c:3687 cgroup_stat_show() warn: we never enter
 this loop
Message-ID: <202410210449.FbUEPoGq-lkp@intel.com>
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
TO: Waiman Long <longman@redhat.com>
CC: Tejun Heo <tj@kernel.org>
CC: Kamalesh Babulal <kamalesh.babulal@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   db87114dcf138b5b1290ba9aa9e29c21297a0b48
commit: ab03125268679e058e1e7b6612f6d12610761769 cgroup: Show # of subsystem CSSes in cgroup.stat
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20241015 (https://download.01.org/0day-ci/archive/20241021/202410210449.FbUEPoGq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210449.FbUEPoGq-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:3687 cgroup_stat_show() warn: we never enter this loop

vim +3687 kernel/cgroup/cgroup.c

842b597ee0a7e1 kernel/cgroup.c        Tejun Heo      2014-04-25  3668  
3e48930cc74f0c kernel/cgroup/cgroup.c Tejun Heo      2017-08-11  3669  static int cgroup_stat_show(struct seq_file *seq, void *v)
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3670  {
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3671  	struct cgroup *cgroup = seq_css(seq)->cgroup;
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3672  	struct cgroup_subsys_state *css;
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3673  	int dying_cnt[CGROUP_SUBSYS_COUNT];
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3674  	int ssid;
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3675  
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3676  	seq_printf(seq, "nr_descendants %d\n",
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3677  		   cgroup->nr_descendants);
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3678  
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3679  	/*
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3680  	 * Show the number of live and dying csses associated with each of
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3681  	 * non-inhibited cgroup subsystems that is bound to cgroup v2.
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3682  	 *
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3683  	 * Without proper lock protection, racing is possible. So the
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3684  	 * numbers may not be consistent when that happens.
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3685  	 */
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3686  	rcu_read_lock();
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15 @3687  	for (ssid = 0; ssid < CGROUP_SUBSYS_COUNT; ssid++) {
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3688  		dying_cnt[ssid] = -1;
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3689  		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3690  		    (cgroup_subsys[ssid]->root !=  &cgrp_dfl_root))
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3691  			continue;
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3692  		css = rcu_dereference_raw(cgroup->subsys[ssid]);
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3693  		dying_cnt[ssid] = cgroup->nr_dying_subsys[ssid];
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3694  		seq_printf(seq, "nr_subsys_%s %d\n", cgroup_subsys[ssid]->name,
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3695  			   css ? (css->nr_descendants + 1) : 0);
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3696  	}
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3697  
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3698  	seq_printf(seq, "nr_dying_descendants %d\n",
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3699  		   cgroup->nr_dying_descendants);
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3700  	for (ssid = 0; ssid < CGROUP_SUBSYS_COUNT; ssid++) {
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3701  		if (dying_cnt[ssid] >= 0)
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3702  			seq_printf(seq, "nr_dying_subsys_%s %d\n",
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3703  				   cgroup_subsys[ssid]->name, dying_cnt[ssid]);
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3704  	}
ab03125268679e kernel/cgroup/cgroup.c Waiman Long    2024-07-15  3705  	rcu_read_unlock();
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3706  	return 0;
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3707  }
ec39225cca42c0 kernel/cgroup/cgroup.c Roman Gushchin 2017-08-02  3708  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
