Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985B5576D
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDGmauca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362390; x=1732898390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUx9535UKarWQDKez8mGUVs+lU/V4y4luCd0eWc3LLA=;
  b=ZDGmaucalHH8RT2taSdxselz6l1C0uaEz+iJerANsTD3uGqIRFcgmJ2U
   fYuYZ9n3wZuRZifxTJQMaYh7SjCDTlV5WRg5idY5Qz45VceV6L0KS/hn1
   vuMmQva/MsEgrJ8t3B3U5/9DSVedT3kWsrBbcK78Jo3Gu852cHWBCmQ0d
   1Jf1TFlotwyqoV53M4XMYPkYHPfF2WLZqobChynCdjPNa1Rz0Sofjcej/
   KF0SetrBNRfplwMO6CkVPauh7k6UdBQqvpv54xevgBcXaz6u7sycmFoQC
   NYJFTdubGxyLwmnDRG7CZtInetETzhL0JViRshJ83R0/B0lIsOGDwNXq5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="392217525"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="392217525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="10814049"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2023 08:39:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8k4n-0002OS-1W;
	Thu, 30 Nov 2023 16:39:45 +0000
Date: Fri, 1 Dec 2023 00:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202312010059.MQ446XMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: effae0e3d9e1139d583e9b5d050f4f948825b8a3 riscv: Kconfig: Enable cpufreq kconfig menu
date:   1 year ago
:::::: branch date: 26 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-r031-20230608 (https://download.01.org/0day-ci/archive/20231201/202312010059.MQ446XMR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010059.MQ446XMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010059.MQ446XMR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zicbom_zihintpause'
>> drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct notifier_block *nb @@     got struct notifier_block [noderef] __rcu *static [addressable] [toplevel] head @@
   drivers/cpufreq/cpufreq.c:475:17: sparse:     expected struct notifier_block *nb
   drivers/cpufreq/cpufreq.c:475:17: sparse:     got struct notifier_block [noderef] __rcu *static [addressable] [toplevel] head
>> drivers/cpufreq/cpufreq.c:475:65: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct notifier_block *nb @@     got struct notifier_block [noderef] __rcu *next @@
   drivers/cpufreq/cpufreq.c:475:65: sparse:     expected struct notifier_block *nb
   drivers/cpufreq/cpufreq.c:475:65: sparse:     got struct notifier_block [noderef] __rcu *next

vim +475 drivers/cpufreq/cpufreq.c

b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  466  
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  467  static void cpufreq_list_transition_notifiers(void)
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  468  {
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  469  	struct notifier_block *nb;
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  470  
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  471  	pr_info("Registered transition notifiers:\n");
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  472  
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  473  	mutex_lock(&cpufreq_transition_notifier_list.mutex);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  474  
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30 @475  	for (nb = cpufreq_transition_notifier_list.head; nb; nb = nb->next)
d75f773c86a2b8 Sakari Ailus      2019-03-25  476  		pr_info("%pS\n", nb->notifier_call);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  477  
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  478  	mutex_unlock(&cpufreq_transition_notifier_list.mutex);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  479  }
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  480  

:::::: The code at line 475 was first introduced by commit
:::::: b7898fda5bc7e786e76ce24fbd2ec993b08ec518 cpufreq: Support for fast frequency switching

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
