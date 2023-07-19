Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A517C8
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 01:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689731565; x=1721267565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hcVwnUN/pLfSZ582QoZ+fL8Mmp0e7oWFZ7deZluwsJk=;
  b=MTcK3bksL7rwjoF+EouROaviCwX/YHbcRaTBP+WGSbcusPLeE2R4IB0X
   5rIx7I27S1MCHhvDc9MTQyu1FZWLL2P3nXKu0sMiHjWRPTH0pX0bRlY98
   O0eAU2qRcOS5fjnNAJn56RJpVbEvk2CbOOK+u1/ZQjNK6PkjvtW/bQcck
   yFCZdv8VOX0UwBQ4W8e+VvWhX36QqiQnDb6MnOKSeneiz1oLk+841t7w6
   mGyK4HKUyiGzshUQP5/mIBhbbH210b8l2iPgmgCYegwKcGdvmGRqzvQGb
   CpZd6OMi8OPHgJ2R6CpI26aUEnjnrsfUG7u4D227PhHoxNBdzUqdt+E1R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366394915"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="366394915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 18:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701117766"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="701117766"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 18:52:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLwMh-000429-39;
	Wed, 19 Jul 2023 01:52:33 +0000
Date: Wed, 19 Jul 2023 09:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [qais-yousef:rt-thermal-pressure 1/1] kernel/sched/rt.c:2565
 init_sched_rt_fitness_mask() warn: we never enter this loop
Message-ID: <202307190927.CGsCvAYE-lkp@intel.com>
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
TO: Qais Yousef <qais.yousef@arm.com>

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   37d8a2c4783760dc318664665d94fc9482ec10a2
commit: 37d8a2c4783760dc318664665d94fc9482ec10a2 [1/1] sched/rt: Support multi-criterion fitness search for lowest_rq
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230719/202307190927.CGsCvAYE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190927.CGsCvAYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307190927.CGsCvAYE-lkp@intel.com/

smatch warnings:
kernel/sched/rt.c:2565 init_sched_rt_fitness_mask() warn: we never enter this loop
kernel/sched/rt.c:2565 init_sched_rt_fitness_mask() warn: unsigned 'i' is never less than zero.
kernel/sched/rt.c:2565 init_sched_rt_fitness_mask() warn: unsigned 'i' is never less than zero.
kernel/sched/cpupri.c:184 cpupri_find_fitness() warn: we never enter this loop

vim +2565 kernel/sched/rt.c

3d8cbdf8650f44 kernel/sched_rt.c Rusty Russell 2008-11-25  2551  
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2552  void __init init_sched_rt_fitness_mask(int cpu)
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2553  {
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2554  	cpumask_var_t *fitness_mask_array;
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2555  	unsigned int i;
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2556  
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2557  	if (!NUM_FITNESS_FN)
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2558  		return;
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2559  
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2560  	fitness_mask_array = kcalloc_node(NUM_FITNESS_FN, sizeof(cpumask_var_t),
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2561  					  GFP_KERNEL, cpu_to_node(cpu));
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2562  
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2563  	per_cpu(local_cpu_fitness_mask, cpu) = fitness_mask_array;
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2564  
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13 @2565  	for (i = 0; i < NUM_FITNESS_FN; i++) {
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2566  		zalloc_cpumask_var_node(&fitness_mask_array[i], GFP_KERNEL,
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2567  					cpu_to_node(cpu));
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2568  	}
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2569  }
37d8a2c4783760 kernel/sched/rt.c Qais Yousef   2022-05-13  2570  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
