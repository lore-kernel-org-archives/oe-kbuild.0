Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93B17D0
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 04:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694493802; x=1726029802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77lrZHdRQG16Qq52s+Jqw3VlwsNW+oArbentdfyG/10=;
  b=j176z6wjllvZc2XeExNahPPSmVJc71dDRFKrAQOOlAHjJF9dVGGoLCfx
   pIUaXKlJdyK2BWv4FtkC3y3FgEnjvJ04OC/2MElMGXtsehm7VGmV7/7JL
   +X6vA05MJff49AzYbpl9AbUxpQosQrui7+YbI/EJAYNCOhqTaw81/xgGJ
   iEzYrS5PaSfRHE2H9Q18kToM/vEkVzWUEqyWXcqeeII777AdGQXS55lhe
   IgU43RS5nsHG4EsnyQI2nnajfN6gT5lfZ+qHmYe630KNkBKaYs00JTiph
   dno/5Bf3xk5QiO96P8qKOwZGnRW8IdGbSm2RuxHi1Bw4OeazHfk7DK0Zc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464642921"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="464642921"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 21:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746716506"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="746716506"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2023 21:43:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfvF7-0007Ka-1p;
	Tue, 12 Sep 2023 04:43:17 +0000
Date: Tue, 12 Sep 2023 12:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/scftorture.c:437 scftorture_invoke_one() warn: possible
 memory leak of 'scfcp'
Message-ID: <202309121220.4Ve6PtQ9-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 013608cd0812bdb21fc26d39ed8fdd2fc76e8b9b scftorture: Forgive memory-allocation failure if KASAN
date:   8 weeks ago
:::::: branch date: 29 hours ago
:::::: commit date: 8 weeks ago
config: openrisc-randconfig-r071-20230906 (https://download.01.org/0day-ci/archive/20230912/202309121220.4Ve6PtQ9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309121220.4Ve6PtQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309121220.4Ve6PtQ9-lkp@intel.com/

smatch warnings:
kernel/scftorture.c:437 scftorture_invoke_one() warn: possible memory leak of 'scfcp'

vim +/scfcp +437 kernel/scftorture.c

5022b8ac608f8b8 Paul E. McKenney 2020-06-25  312  
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  313  // Randomly do an smp_call_function*() invocation.
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  314  static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_random_state *trsp)
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  315  {
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  316  	uintptr_t cpu;
676e5469643e716 Paul E. McKenney 2020-07-01  317  	int ret = 0;
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  318  	struct scf_check *scfcp = NULL;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  319  	struct scf_selector *scfsp = scf_sel_rand(trsp);
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  320  
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  321  	if (use_cpus_read_lock)
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  322  		cpus_read_lock();
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  323  	else
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  324  		preempt_disable();
34e8c4837adb579 Paul E. McKenney 2020-07-01  325  	if (scfsp->scfs_prim == SCF_PRIM_SINGLE || scfsp->scfs_wait) {
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  326  		scfcp = kmalloc(sizeof(*scfcp), GFP_ATOMIC);
013608cd0812bdb Paul E. McKenney 2023-05-15  327  		if (!scfcp) {
013608cd0812bdb Paul E. McKenney 2023-05-15  328  			WARN_ON_ONCE(!IS_ENABLED(CONFIG_KASAN));
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  329  			atomic_inc(&n_alloc_errs);
4df55bddc1a360e Paul E. McKenney 2020-07-09  330  		} else {
4df55bddc1a360e Paul E. McKenney 2020-07-09  331  			scfcp->scfc_cpu = -1;
4df55bddc1a360e Paul E. McKenney 2020-07-09  332  			scfcp->scfc_wait = scfsp->scfs_wait;
4df55bddc1a360e Paul E. McKenney 2020-07-09  333  			scfcp->scfc_out = false;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  334  			scfcp->scfc_rpc = false;
4df55bddc1a360e Paul E. McKenney 2020-07-09  335  		}
34e8c4837adb579 Paul E. McKenney 2020-07-01  336  	}
34e8c4837adb579 Paul E. McKenney 2020-07-01  337  	switch (scfsp->scfs_prim) {
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  338  	case SCF_PRIM_RESCHED:
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  339  		if (IS_BUILTIN(CONFIG_SCF_TORTURE_TEST)) {
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  340  			cpu = torture_random(trsp) % nr_cpu_ids;
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  341  			scfp->n_resched++;
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  342  			resched_cpu(cpu);
c3d0258d5af2a50 Paul E. McKenney 2021-07-14  343  			this_cpu_inc(scf_invoked_count);
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  344  		}
1ac78b49d61d4a0 Paul E. McKenney 2020-09-03  345  		break;
34e8c4837adb579 Paul E. McKenney 2020-07-01  346  	case SCF_PRIM_SINGLE:
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  347  		cpu = torture_random(trsp) % nr_cpu_ids;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  348  		if (scfsp->scfs_wait)
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  349  			scfp->n_single_wait++;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  350  		else
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  351  			scfp->n_single++;
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  352  		if (scfcp) {
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  353  			scfcp->scfc_cpu = cpu;
ee7035d29576dcb Paul E. McKenney 2020-07-01  354  			barrier(); // Prevent race-reduction compiler optimizations.
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  355  			scfcp->scfc_in = true;
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  356  		}
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  357  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, scfsp->scfs_wait);
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  358  		if (ret) {
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  359  			if (scfsp->scfs_wait)
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  360  				scfp->n_single_wait_ofl++;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  361  			else
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  362  				scfp->n_single_ofl++;
b93e21a51e1c8ed Paul E. McKenney 2020-06-30  363  			kfree(scfcp);
676e5469643e716 Paul E. McKenney 2020-07-01  364  			scfcp = NULL;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  365  		}
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  366  		break;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  367  	case SCF_PRIM_SINGLE_RPC:
9b9a80677fd80bd Paul E. McKenney 2021-06-24  368  		if (!scfcp)
9b9a80677fd80bd Paul E. McKenney 2021-06-24  369  			break;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  370  		cpu = torture_random(trsp) % nr_cpu_ids;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  371  		scfp->n_single_rpc++;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  372  		scfcp->scfc_cpu = cpu;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  373  		scfcp->scfc_wait = true;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  374  		init_completion(&scfcp->scfc_completion);
9b9a80677fd80bd Paul E. McKenney 2021-06-24  375  		scfcp->scfc_rpc = true;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  376  		barrier(); // Prevent race-reduction compiler optimizations.
9b9a80677fd80bd Paul E. McKenney 2021-06-24  377  		scfcp->scfc_in = true;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  378  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, 0);
9b9a80677fd80bd Paul E. McKenney 2021-06-24  379  		if (!ret) {
9b9a80677fd80bd Paul E. McKenney 2021-06-24  380  			if (use_cpus_read_lock)
9b9a80677fd80bd Paul E. McKenney 2021-06-24  381  				cpus_read_unlock();
9b9a80677fd80bd Paul E. McKenney 2021-06-24  382  			else
9b9a80677fd80bd Paul E. McKenney 2021-06-24  383  				preempt_enable();
9b9a80677fd80bd Paul E. McKenney 2021-06-24  384  			wait_for_completion(&scfcp->scfc_completion);
9b9a80677fd80bd Paul E. McKenney 2021-06-24  385  			if (use_cpus_read_lock)
9b9a80677fd80bd Paul E. McKenney 2021-06-24  386  				cpus_read_lock();
9b9a80677fd80bd Paul E. McKenney 2021-06-24  387  			else
9b9a80677fd80bd Paul E. McKenney 2021-06-24  388  				preempt_disable();
9b9a80677fd80bd Paul E. McKenney 2021-06-24  389  		} else {
9b9a80677fd80bd Paul E. McKenney 2021-06-24  390  			scfp->n_single_rpc_ofl++;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  391  			kfree(scfcp);
9b9a80677fd80bd Paul E. McKenney 2021-06-24  392  			scfcp = NULL;
9b9a80677fd80bd Paul E. McKenney 2021-06-24  393  		}
9b9a80677fd80bd Paul E. McKenney 2021-06-24  394  		break;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  395  	case SCF_PRIM_MANY:
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  396  		if (scfsp->scfs_wait)
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  397  			scfp->n_many_wait++;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  398  		else
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  399  			scfp->n_many++;
ee7035d29576dcb Paul E. McKenney 2020-07-01  400  		if (scfcp) {
ee7035d29576dcb Paul E. McKenney 2020-07-01  401  			barrier(); // Prevent race-reduction compiler optimizations.
980205ee8489d53 Paul E. McKenney 2020-07-01  402  			scfcp->scfc_in = true;
ee7035d29576dcb Paul E. McKenney 2020-07-01  403  		}
980205ee8489d53 Paul E. McKenney 2020-07-01  404  		smp_call_function_many(cpu_online_mask, scf_handler, scfcp, scfsp->scfs_wait);
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  405  		break;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  406  	case SCF_PRIM_ALL:
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  407  		if (scfsp->scfs_wait)
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  408  			scfp->n_all_wait++;
5022b8ac608f8b8 Paul E. McKenney 2020-06-25  409  		else
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  410  			scfp->n_all++;
ee7035d29576dcb Paul E. McKenney 2020-07-01  411  		if (scfcp) {
ee7035d29576dcb Paul E. McKenney 2020-07-01  412  			barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb579 Paul E. McKenney 2020-07-01  413  			scfcp->scfc_in = true;
ee7035d29576dcb Paul E. McKenney 2020-07-01  414  		}
34e8c4837adb579 Paul E. McKenney 2020-07-01  415  		smp_call_function(scf_handler, scfcp, scfsp->scfs_wait);
676e5469643e716 Paul E. McKenney 2020-07-01  416  		break;
de77d4da54d10df Paul E. McKenney 2020-07-02  417  	default:
de77d4da54d10df Paul E. McKenney 2020-07-02  418  		WARN_ON_ONCE(1);
de77d4da54d10df Paul E. McKenney 2020-07-02  419  		if (scfcp)
de77d4da54d10df Paul E. McKenney 2020-07-02  420  			scfcp->scfc_out = true;
676e5469643e716 Paul E. McKenney 2020-07-01  421  	}
676e5469643e716 Paul E. McKenney 2020-07-01  422  	if (scfcp && scfsp->scfs_wait) {
9e66bf03f9c5388 Paul E. McKenney 2020-07-03  423  		if (WARN_ON_ONCE((num_online_cpus() > 1 || scfsp->scfs_prim == SCF_PRIM_SINGLE) &&
9b9a80677fd80bd Paul E. McKenney 2021-06-24  424  				 !scfcp->scfc_out)) {
9b9a80677fd80bd Paul E. McKenney 2021-06-24  425  			pr_warn("%s: Memory-ordering failure, scfs_prim: %d.\n", __func__, scfsp->scfs_prim);
34e8c4837adb579 Paul E. McKenney 2020-07-01  426  			atomic_inc(&n_mb_out_errs); // Leak rather than trash!
9b9a80677fd80bd Paul E. McKenney 2021-06-24  427  		} else {
34e8c4837adb579 Paul E. McKenney 2020-07-01  428  			kfree(scfcp);
9b9a80677fd80bd Paul E. McKenney 2021-06-24  429  		}
ee7035d29576dcb Paul E. McKenney 2020-07-01  430  		barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb579 Paul E. McKenney 2020-07-01  431  	}
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  432  	if (use_cpus_read_lock)
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  433  		cpus_read_unlock();
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  434  	else
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  435  		preempt_enable();
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  436  	if (!(torture_random(trsp) & 0xfff))
e9d338a0b1799c9 Paul E. McKenney 2020-06-24 @437  		schedule_timeout_uninterruptible(1);
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  438  }
e9d338a0b1799c9 Paul E. McKenney 2020-06-24  439  

:::::: The code at line 437 was first introduced by commit
:::::: e9d338a0b1799c988b678e8ccb66a442272e6aa3 scftorture: Add smp_call_function() torture test

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
