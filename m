Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0613AF7
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF2BI0Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702218574; x=1733754574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kX9LrMA5Pp95zSeQKPyfmmoJK9vQxtrCc8Q3apNnjAU=;
  b=KF2BI0MuMYHGpcoXQBR0ADOFZ7n+dRk78a1d/CcioPFmLIndsR1QiEc7
   E0ybOfY9w+6XvyyQz88XiRFzDe+GI2Mk1TgnUf1RK0A5zwD3qLg/8Yvhn
   mKdb5b1k+4LGiFylD5Y+YDaV/anR2fciptwHSduaH5uaQd8gOxzkHKVC2
   eY05JKD/rtE2G8XVqcBNLzNBM6jmGHEsy3+0MN5a1HHApmLB4A9i0c1hJ
   YS+io4+n8uK+e2pLtF9xiUF1gw5ypSpFa/ihprSamT8KH6ey9D4vmdrEL
   l4V+BaG/5kUsHkLY6aTBBP3/Hv5geeRrFvP+821wQ+K8YxSMCTxCDDXo8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379556736"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="379556736"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 06:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="838691581"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="838691581"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2023 06:29:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCKoE-000GvN-0S;
	Sun, 10 Dec 2023 14:29:30 +0000
Date: Sun, 10 Dec 2023 22:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tglx-devel:timers/pushpull 30/32]
 kernel/time/timer_migration.c:1529:6-9: WARNING: Unsigned expression
 compared with zero: ret     <     0
Message-ID: <202312102211.FOZEOMnd-lkp@intel.com>
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
TO: "Anna-Maria Behnsen" <anna-maria@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/pushpull
head:   c5f729902c462bd2f9153641aebe042bbb5f9ede
commit: f7012466efc3b7e5a3220e702ada7e51245caf20 [30/32] timers: Implement the hierarchical pull model
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102211.FOZEOMnd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102211.FOZEOMnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312102211.FOZEOMnd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/time/timer_migration.c:1529:6-9: WARNING: Unsigned expression compared with zero: ret     <     0

vim +1529 kernel/time/timer_migration.c

f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1518  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1519  static int tmigr_cpu_online(unsigned int cpu)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1520  {
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1521  	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1522  	unsigned int ret;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1523  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1524  	/* First online attempt? Initialize CPU data */
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1525  	if (!tmc->tmgroup) {
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1526  		raw_spin_lock_init(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1527  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1528  		ret = tmigr_add_cpu(cpu);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21 @1529  		if (ret < 0)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1530  			return ret;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1531  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1532  		if (tmc->childmask == 0)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1533  			return -EINVAL;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1534  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1535  		timerqueue_init(&tmc->cpuevt.nextevt);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1536  		tmc->cpuevt.nextevt.expires = KTIME_MAX;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1537  		tmc->cpuevt.ignore = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1538  		tmc->cpuevt.cpu = cpu;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1539  
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1540  		tmc->remote = false;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1541  		WRITE_ONCE(tmc->wakeup, KTIME_MAX);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1542  	}
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1543  	raw_spin_lock_irq(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1544  	if (timer_base_is_idle())
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1545  		tmc->idle = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1546  	else
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1547  		__tmigr_cpu_activate(tmc);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1548  	tmc->online = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1549  	raw_spin_unlock_irq(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1550  	return 0;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1551  }
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
