Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F723B615
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765658306; cv=none; b=I9WTW3zv/JWtoxa+klyPOF5WZbUcpdrIaP+lh5LEt+ULkBZT26uTa9dYCJmrxQn6AZyKQDH2ljI1MxHchwwUSHlVrBFMzdiT6MOR9/JlKjVXKpetAQbzTh9XIENXJce9uj8OKbtyGDnvwZONW1M7LHFwHGbHVZqhCZitw0mINgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765658306; c=relaxed/simple;
	bh=IyvgmwxnSvGuCTJaDRbzaqcA3KCbFmE5c8SOWC5KQV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8biaDpOBu/kJ3R9jen7EfR/HjDodG2N8YulayMbUkjJQ6l6C0nhYIzYioxP8USJQVFmWX6qw5ZMGpfaZkQSNpP+yR8ETH+xNW482XJX5WAp+8NpnB1S2Q5gcXMU0YzB1AvNi8uUX7+h4brbrRgkbJ2KZHshN5xXQHxW4pfQoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aP/8XnuP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aP/8XnuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765658304; x=1797194304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyvgmwxnSvGuCTJaDRbzaqcA3KCbFmE5c8SOWC5KQV0=;
  b=aP/8XnuPpLO5KKxAtNiUfVYF7xEWXvdKts1JxPN1z8JilSAMgSlZ0R6Y
   gzC73cVMqevVx0QRG/xLXT/jqQuOmab1Vu4Kqv/Lfs/ZdX/G5alciOZOX
   RnoY+qOnmk6zqK7C57nqJ32EqVd3dE7Z9kBFw1XDzIMdg2Z8x8BIBi1xv
   1ZGQYAerFGtBtzozP64H0b5UBVaryImr3SX1Lw/ZskZ6M3iHFKu+3u6Xs
   6feNOY8zDavefCJ8C9yjpMUYOCLkcFenpnd+ZV3nexCfqvY5WUaFWZjl3
   uTkX3T2EN94kOo/gF6ee874QlLL33DqskXxEuOPdSdCQNPtwQfUT7zbFz
   Q==;
X-CSE-ConnectionGUID: 4KsYFt+vTIaLv2fT219yuQ==
X-CSE-MsgGUID: qWTvn+2WStqVziaU5qTeyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67778431"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67778431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:38:22 -0800
X-CSE-ConnectionGUID: r88vciyWSLSnIRIxTXMWvg==
X-CSE-MsgGUID: 9M+MNa1pR1O6fIRMxeJ6Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228025528"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 12:38:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWNd-000000008B9-3Ooz;
	Sat, 13 Dec 2025 20:38:17 +0000
Date: Sun, 14 Dec 2025 04:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/fair.c:12210 find_new_ilb() warn: missing error code?
 'ilb_cpu'
Message-ID: <202512140419.VBzuUUWL-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140419.VBzuUUWL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140419.VBzuUUWL-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:12210 find_new_ilb() warn: missing error code? 'ilb_cpu'

vim +/ilb_cpu +12210 kernel/sched/fair.c

d987fc7f3228bf9 kernel/sched/fair.c Mike Galbraith      2011-12-05  12188  
3451d0243c3cdfd kernel/sched/fair.c Frederic Weisbecker 2011-08-10  12189  #ifdef CONFIG_NO_HZ_COMMON
83cd4fe27ad8446 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12190  /*
7ef7145a2b26b17 kernel/sched/fair.c Ingo Molnar         2023-10-06  12191   * NOHZ idle load balancing (ILB) details:
7ef7145a2b26b17 kernel/sched/fair.c Ingo Molnar         2023-10-06  12192   *
7ef7145a2b26b17 kernel/sched/fair.c Ingo Molnar         2023-10-06  12193   * - When one of the busy CPUs notices that there may be an idle rebalancing
83cd4fe27ad8446 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12194   *   needed, they will kick the idle load balancer, which then does idle
83cd4fe27ad8446 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12195   *   load balancing for all the idle CPUs.
83cd4fe27ad8446 kernel/sched_fair.c Venkatesh Pallipadi 2010-05-21  12196   */
3dd0337d6df7d54 kernel/sched/fair.c Daniel Lezcano      2014-01-06  12197  static inline int find_new_ilb(void)
1e3c88bdeb1260e kernel/sched_fair.c Peter Zijlstra      2009-12-17  12198  {
031e3bd8986fffe kernel/sched/fair.c Yuan ZhaoXiong      2021-06-06  12199  	const struct cpumask *hk_mask;
b6dd6984832a286 kernel/sched/fair.c Ingo Molnar         2023-10-06  12200  	int ilb_cpu;
1e3c88bdeb1260e kernel/sched_fair.c Peter Zijlstra      2009-12-17  12201  
c907cd44a108eff kernel/sched/fair.c Waiman Long         2024-10-30  12202  	hk_mask = housekeeping_cpumask(HK_TYPE_KERNEL_NOISE);
1e3c88bdeb1260e kernel/sched_fair.c Peter Zijlstra      2009-12-17  12203  
b6dd6984832a286 kernel/sched/fair.c Ingo Molnar         2023-10-06  12204  	for_each_cpu_and(ilb_cpu, nohz.idle_cpus_mask, hk_mask) {
45da7a2b0af8fa2 kernel/sched/fair.c Peter Zijlstra      2020-08-18  12205  
b6dd6984832a286 kernel/sched/fair.c Ingo Molnar         2023-10-06  12206  		if (ilb_cpu == smp_processor_id())
45da7a2b0af8fa2 kernel/sched/fair.c Peter Zijlstra      2020-08-18  12207  			continue;
45da7a2b0af8fa2 kernel/sched/fair.c Peter Zijlstra      2020-08-18  12208  
b6dd6984832a286 kernel/sched/fair.c Ingo Molnar         2023-10-06  12209  		if (idle_cpu(ilb_cpu))
b6dd6984832a286 kernel/sched/fair.c Ingo Molnar         2023-10-06 @12210  			return ilb_cpu;
9b019acb72e4b57 kernel/sched/fair.c Nicholas Piggin     2019-04-12  12211  	}
786d6dc7aeb2bfb kernel/sched/fair.c Suresh Siddha       2011-12-01  12212  
f4bb5705114530c kernel/sched/fair.c Ingo Molnar         2023-10-06  12213  	return -1;
1e3c88bdeb1260e kernel/sched_fair.c Peter Zijlstra      2009-12-17  12214  }
1e3c88bdeb1260e kernel/sched_fair.c Peter Zijlstra      2009-12-17  12215  

:::::: The code at line 12210 was first introduced by commit
:::::: b6dd6984832a2868f78879fce30d6965ae899d02 sched/nohz: Use consistent variable names in find_new_ilb() and kick_ilb()

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
