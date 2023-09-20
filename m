Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858151172F
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695204114; x=1726740114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3m19fGILefQHXLTR5SG8c+zqXVMD6hYp3lGogp3W5M=;
  b=DmrVWn7a2bF7ioB+wK+fI/roUSWephw8/EgECYsZ5wzuflTFot6od6V3
   dczF7LowwYSkVwnyQTBQM28sG61LYr6BVC2YAywKk8Ri5fI1yNot23tx4
   GOPE2N4PrYmv9jOM+YcpK7z7qRh+Lq6hgsswLR8xNf24/rA0dhjAdmwYf
   haf5UK3eHIx1Gshol0tDE+q09ZByfo5+wxoAMvJJIpdxksLg2DJrr1NWc
   cf+YFn8S/WUwRNp7YFajRRXZbLJAg03v2VYciP2StWFW1/rLH/NqQrMzA
   8GXuTYYrI3HcVtfvAeIw7OT7BONdCcM3mdd0TM+n3KVW3YLM33aKLeKWQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379065606"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="379065606"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 03:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920224202"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="920224202"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Sep 2023 03:01:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiu1m-0008ce-0m;
	Wed, 20 Sep 2023 10:01:50 +0000
Date: Wed, 20 Sep 2023 18:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5908/6619] kernel/cgroup/cpuset.c:705
 cpu_exclusive_check() warn: signedness bug returning '(-22)'
Message-ID: <202309201706.2LhKdM6o-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Waiman Long <longman@redhat.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   926f75c8a5ab70567eb4c2d82fbc96963313e564
commit: 0c7f293efc87a06b51db9aa65256f8cb0a5a0a21 [5908/6619] cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201706.2LhKdM6o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309201706.2LhKdM6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309201706.2LhKdM6o-lkp@intel.com/

smatch warnings:
kernel/cgroup/cpuset.c:705 cpu_exclusive_check() warn: signedness bug returning '(-22)'

vim +705 kernel/cgroup/cpuset.c

645fcc9d2f6946 kernel/cpuset.c        Li Zefan    2009-01-07  689  
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  690  /*
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  691   * cpu_exclusive_check() - check if two cpusets are exclusive
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  692   *
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  693   * Return 0 if exclusive, -EINVAL if not
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  694   */
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  695  static inline bool cpu_exclusive_check(struct cpuset *cs1, struct cpuset *cs2)
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  696  {
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  697  	struct cpumask *cpus1, *cpus2;
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  698  
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  699  	cpus1 = cpumask_empty(cs1->effective_xcpus)
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  700  		? cs1->cpus_allowed : cs1->effective_xcpus;
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  701  	cpus2 = cpumask_empty(cs2->effective_xcpus)
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  702  		? cs2->cpus_allowed : cs2->effective_xcpus;
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  703  
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  704  	if (cpumask_intersects(cpus1, cpus2))
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05 @705  		return -EINVAL;
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  706  	return 0;
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  707  }
0c7f293efc87a0 kernel/cgroup/cpuset.c Waiman Long 2023-09-05  708  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
