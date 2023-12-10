Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2387C2C1
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLSVv0J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702215940; x=1733751940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLhcQCuQBOq8tLLBRPgDCMCwAnHaXfwGvnbHUL0ncac=;
  b=bLSVv0J09kiWUoLZAiwvfbRvi8yMJEgARiHabJOXkHW9yIG5qcdWjNsO
   SwZoon/jRCl7YWPwWLV2lE5DRsNq1V3Y2sjQuvpSOhxg588A8RXvq6/Am
   YtbEjG1oRhFr01kStabEvFJEWOd86kvAV8Awr+1vZQ+hp9N8tl1H9VR9T
   YDHap2zuzzdBclVWv0wnJzMWADwSfZocn74uTXyhqxq17zKCGCtClJ8W5
   BiRux8Jh5PyIj764Djcvr/orjkyDCiO+uqUPbmnjbWawScgm3ZrmzpZc3
   kSeKsdQRZwhl5zXkQfXpHi/x0grLpuqemZTE4OkgqMVhnuoyITxqRB3bm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="394290872"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="394290872"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 05:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890766880"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="890766880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 05:45:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCK7k-000GtW-1S;
	Sun, 10 Dec 2023 13:45:36 +0000
Date: Sun, 10 Dec 2023 21:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/perf_cpum_cf.c:306 cpum_cf_alloc() error:
 uninitialized symbol 'rc'.
Message-ID: <202312102155.RbBlpK49-lkp@intel.com>
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
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 9b9cf3c77e7e090b30657b3d2c288deb58dfb4f2 s390/cpum_cf: rework PER_CPU_DEFINE of struct cpu_cf_events
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r071-20231115 (https://download.01.org/0day-ci/archive/20231210/202312102155.RbBlpK49-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102155.RbBlpK49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312102155.RbBlpK49-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/perf_cpum_cf.c:306 cpum_cf_alloc() error: uninitialized symbol 'rc'.

Old smatch warnings:
arch/s390/kernel/perf_cpum_cf.c:1505 cfset_all_copy() warn: ignoring unreachable code.

vim +/rc +306 arch/s390/kernel/perf_cpum_cf.c

9b9cf3c77e7e09 Thomas Richter 2023-06-15  275  
9b9cf3c77e7e09 Thomas Richter 2023-06-15  276  /*
9b9cf3c77e7e09 Thomas Richter 2023-06-15  277   * Create/delete per CPU data structures for /dev/hwctr interface and events
9b9cf3c77e7e09 Thomas Richter 2023-06-15  278   * created by perf_event_open().
9b9cf3c77e7e09 Thomas Richter 2023-06-15  279   * If cpu is -1, track task on all available CPUs. This requires
9b9cf3c77e7e09 Thomas Richter 2023-06-15  280   * allocation of hardware data structures for all CPUs. This setup handles
9b9cf3c77e7e09 Thomas Richter 2023-06-15  281   * perf_event_open() with task context and /dev/hwctr interface.
9b9cf3c77e7e09 Thomas Richter 2023-06-15  282   * If cpu is non-zero install event on this CPU only. This setup handles
9b9cf3c77e7e09 Thomas Richter 2023-06-15  283   * perf_event_open() with CPU context.
9b9cf3c77e7e09 Thomas Richter 2023-06-15  284   */
9b9cf3c77e7e09 Thomas Richter 2023-06-15  285  static int cpum_cf_alloc(int cpu)
9b9cf3c77e7e09 Thomas Richter 2023-06-15  286  {
9b9cf3c77e7e09 Thomas Richter 2023-06-15  287  	cpumask_var_t mask;
9b9cf3c77e7e09 Thomas Richter 2023-06-15  288  	int rc;
9b9cf3c77e7e09 Thomas Richter 2023-06-15  289  
9b9cf3c77e7e09 Thomas Richter 2023-06-15  290  	if (cpu == -1) {
9b9cf3c77e7e09 Thomas Richter 2023-06-15  291  		if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
9b9cf3c77e7e09 Thomas Richter 2023-06-15  292  			return -ENOMEM;
9b9cf3c77e7e09 Thomas Richter 2023-06-15  293  		for_each_online_cpu(cpu) {
9b9cf3c77e7e09 Thomas Richter 2023-06-15  294  			rc = cpum_cf_alloc_cpu(cpu);
9b9cf3c77e7e09 Thomas Richter 2023-06-15  295  			if (rc) {
9b9cf3c77e7e09 Thomas Richter 2023-06-15  296  				for_each_cpu(cpu, mask)
9b9cf3c77e7e09 Thomas Richter 2023-06-15  297  					cpum_cf_free_cpu(cpu);
9b9cf3c77e7e09 Thomas Richter 2023-06-15  298  				break;
9b9cf3c77e7e09 Thomas Richter 2023-06-15  299  			}
9b9cf3c77e7e09 Thomas Richter 2023-06-15  300  			cpumask_set_cpu(cpu, mask);
9b9cf3c77e7e09 Thomas Richter 2023-06-15  301  		}
9b9cf3c77e7e09 Thomas Richter 2023-06-15  302  		free_cpumask_var(mask);
9b9cf3c77e7e09 Thomas Richter 2023-06-15  303  	} else {
9b9cf3c77e7e09 Thomas Richter 2023-06-15  304  		rc = cpum_cf_alloc_cpu(cpu);
9b9cf3c77e7e09 Thomas Richter 2023-06-15  305  	}
9b9cf3c77e7e09 Thomas Richter 2023-06-15 @306  	return rc;
9b9cf3c77e7e09 Thomas Richter 2023-06-15  307  }
9b9cf3c77e7e09 Thomas Richter 2023-06-15  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
