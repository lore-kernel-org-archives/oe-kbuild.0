Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3EE31A7E2
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jul 2026 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784590956; cv=none; b=uzrXPLNm1d1wcfwe8fqMLlh1q3bAxFPCk8r7D+6ifbIqgddzBIzSZ6vqWZ0otCY4z5HTR8lzUZfm6zG++pkSImsFYag8EfbcoyGPT4M4nECudZbsrfTlvp0aRAcBDNvVdFPcveIRf3EJw/Ow+SCb0LsUMoApgr1jUTiTrXuGuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784590956; c=relaxed/simple;
	bh=Qro7g5cuMyXGpq3odEmL19+qdnzdBnhOcYyIwniA51k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yo/Ibto6ZboljPDZhdOuYQyj2VLq1UrvD+SZOkfREkIOsqbyjQtF51UTSxqPCzsP0UqyTEoid9K9T4PfxXxKyFVVn9pzhTBPdosukAKsFppkYWV8uq+AJVoMiNsehQyNbdEMiBKxtECSQRV+1Lr09GpgoSlvGTac0P572hwiWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klF6DpM5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klF6DpM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784590954; x=1816126954;
  h=date:from:to:cc:subject:message-id;
  bh=Qro7g5cuMyXGpq3odEmL19+qdnzdBnhOcYyIwniA51k=;
  b=klF6DpM5YglfEfEDvqFM1PHj+8g7WnF4AXYwTaFpCn2KNBpOPlVWEjeQ
   bnQnDVeLKbpeEdjFcTt2zEI4b9iuTvJKDj7xfq9wUG9CCTv4LnEn8rmq4
   trZTt3OpVmE5HrTY+eA2g59njGMwN9qc0aERavjrDSTFKbutBK5j3CHbE
   mCrCN2nRvc702sfeSYfxBRGfljq6JOZSKhCY5aMUsVg8PbdLuA2tP6DG8
   Lgh2uqgXBgSCRqN9cb3y3cFotXZjY0Z4CfipMdimGdh7hpMQ70te6Ms/F
   3bs9TjwUU1CTycok9D3vO9pbqkj18kzBasv+1/daWZe0cUdJw7zANtIRD
   w==;
X-CSE-ConnectionGUID: w6+pX1omRqqboyFJx69nTQ==
X-CSE-MsgGUID: N3FfNT7AS26JyzSVn7pgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89077892"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="89077892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 16:42:33 -0700
X-CSE-ConnectionGUID: u6W9oYNKSWeMqLuIM9m0ow==
X-CSE-MsgGUID: eYUWINfATz65LEdxVzt5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="253670362"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2026 16:42:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlxct-00000000Wxp-31N1;
	Mon, 20 Jul 2026 23:42:25 +0000
Date: Tue, 21 Jul 2026 07:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 192/192]
 kernel/scftorture.c:437 scftorture_invoke_one() warn: possible memory leak of
 'scfcp'
Message-ID: <202607210711.dzhQmxhg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b3c531e1677cf574dd7ffc9bfce3a298c74ef2f8
commit: 9f10b4eb1b218223e0e7c8b013ac7d9f621e890c [192/192] scftorture: Forgive memory-allocation failure if KASAN
:::::: branch date: 6 hours ago
:::::: commit date: 2 years, 10 months ago
config: arm-randconfig-r071-20260716 (https://download.01.org/0day-ci/archive/20260721/202607210711.dzhQmxhg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607210711.dzhQmxhg-lkp@intel.com/

smatch warnings:
kernel/scftorture.c:437 scftorture_invoke_one() warn: possible memory leak of 'scfcp'

vim +/scfcp +437 kernel/scftorture.c

5022b8ac608f8b Paul E. McKenney 2020-06-25  312  
e9d338a0b1799c Paul E. McKenney 2020-06-24  313  // Randomly do an smp_call_function*() invocation.
e9d338a0b1799c Paul E. McKenney 2020-06-24  314  static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_random_state *trsp)
e9d338a0b1799c Paul E. McKenney 2020-06-24  315  {
5022b8ac608f8b Paul E. McKenney 2020-06-25  316  	uintptr_t cpu;
676e5469643e71 Paul E. McKenney 2020-07-01  317  	int ret = 0;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  318  	struct scf_check *scfcp = NULL;
5022b8ac608f8b Paul E. McKenney 2020-06-25  319  	struct scf_selector *scfsp = scf_sel_rand(trsp);
5022b8ac608f8b Paul E. McKenney 2020-06-25  320  
e9d338a0b1799c Paul E. McKenney 2020-06-24  321  	if (use_cpus_read_lock)
e9d338a0b1799c Paul E. McKenney 2020-06-24  322  		cpus_read_lock();
e9d338a0b1799c Paul E. McKenney 2020-06-24  323  	else
e9d338a0b1799c Paul E. McKenney 2020-06-24  324  		preempt_disable();
34e8c4837adb57 Paul E. McKenney 2020-07-01  325  	if (scfsp->scfs_prim == SCF_PRIM_SINGLE || scfsp->scfs_wait) {
b93e21a51e1c8e Paul E. McKenney 2020-06-30  326  		scfcp = kmalloc(sizeof(*scfcp), GFP_ATOMIC);
9f10b4eb1b2182 Paul E. McKenney 2023-05-15  327  		if (!scfcp) {
9f10b4eb1b2182 Paul E. McKenney 2023-05-15  328  			WARN_ON_ONCE(!IS_ENABLED(CONFIG_KASAN));
b93e21a51e1c8e Paul E. McKenney 2020-06-30  329  			atomic_inc(&n_alloc_errs);
4df55bddc1a360 Paul E. McKenney 2020-07-09  330  		} else {
4df55bddc1a360 Paul E. McKenney 2020-07-09  331  			scfcp->scfc_cpu = -1;
4df55bddc1a360 Paul E. McKenney 2020-07-09  332  			scfcp->scfc_wait = scfsp->scfs_wait;
4df55bddc1a360 Paul E. McKenney 2020-07-09  333  			scfcp->scfc_out = false;
9b9a80677fd80b Paul E. McKenney 2021-06-24  334  			scfcp->scfc_rpc = false;
4df55bddc1a360 Paul E. McKenney 2020-07-09  335  		}
34e8c4837adb57 Paul E. McKenney 2020-07-01  336  	}
34e8c4837adb57 Paul E. McKenney 2020-07-01  337  	switch (scfsp->scfs_prim) {
1ac78b49d61d4a Paul E. McKenney 2020-09-03  338  	case SCF_PRIM_RESCHED:
1ac78b49d61d4a Paul E. McKenney 2020-09-03  339  		if (IS_BUILTIN(CONFIG_SCF_TORTURE_TEST)) {
1ac78b49d61d4a Paul E. McKenney 2020-09-03  340  			cpu = torture_random(trsp) % nr_cpu_ids;
1ac78b49d61d4a Paul E. McKenney 2020-09-03  341  			scfp->n_resched++;
1ac78b49d61d4a Paul E. McKenney 2020-09-03  342  			resched_cpu(cpu);
c3d0258d5af2a5 Paul E. McKenney 2021-07-14  343  			this_cpu_inc(scf_invoked_count);
1ac78b49d61d4a Paul E. McKenney 2020-09-03  344  		}
1ac78b49d61d4a Paul E. McKenney 2020-09-03  345  		break;
34e8c4837adb57 Paul E. McKenney 2020-07-01  346  	case SCF_PRIM_SINGLE:
5022b8ac608f8b Paul E. McKenney 2020-06-25  347  		cpu = torture_random(trsp) % nr_cpu_ids;
5022b8ac608f8b Paul E. McKenney 2020-06-25  348  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  349  			scfp->n_single_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  350  		else
5022b8ac608f8b Paul E. McKenney 2020-06-25  351  			scfp->n_single++;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  352  		if (scfcp) {
b93e21a51e1c8e Paul E. McKenney 2020-06-30  353  			scfcp->scfc_cpu = cpu;
ee7035d29576dc Paul E. McKenney 2020-07-01  354  			barrier(); // Prevent race-reduction compiler optimizations.
b93e21a51e1c8e Paul E. McKenney 2020-06-30  355  			scfcp->scfc_in = true;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  356  		}
b93e21a51e1c8e Paul E. McKenney 2020-06-30  357  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, scfsp->scfs_wait);
5022b8ac608f8b Paul E. McKenney 2020-06-25  358  		if (ret) {
5022b8ac608f8b Paul E. McKenney 2020-06-25  359  			if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  360  				scfp->n_single_wait_ofl++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  361  			else
5022b8ac608f8b Paul E. McKenney 2020-06-25  362  				scfp->n_single_ofl++;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  363  			kfree(scfcp);
676e5469643e71 Paul E. McKenney 2020-07-01  364  			scfcp = NULL;
5022b8ac608f8b Paul E. McKenney 2020-06-25  365  		}
5022b8ac608f8b Paul E. McKenney 2020-06-25  366  		break;
9b9a80677fd80b Paul E. McKenney 2021-06-24  367  	case SCF_PRIM_SINGLE_RPC:
9b9a80677fd80b Paul E. McKenney 2021-06-24  368  		if (!scfcp)
9b9a80677fd80b Paul E. McKenney 2021-06-24  369  			break;
9b9a80677fd80b Paul E. McKenney 2021-06-24  370  		cpu = torture_random(trsp) % nr_cpu_ids;
9b9a80677fd80b Paul E. McKenney 2021-06-24  371  		scfp->n_single_rpc++;
9b9a80677fd80b Paul E. McKenney 2021-06-24  372  		scfcp->scfc_cpu = cpu;
9b9a80677fd80b Paul E. McKenney 2021-06-24  373  		scfcp->scfc_wait = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  374  		init_completion(&scfcp->scfc_completion);
9b9a80677fd80b Paul E. McKenney 2021-06-24  375  		scfcp->scfc_rpc = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  376  		barrier(); // Prevent race-reduction compiler optimizations.
9b9a80677fd80b Paul E. McKenney 2021-06-24  377  		scfcp->scfc_in = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  378  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, 0);
9b9a80677fd80b Paul E. McKenney 2021-06-24  379  		if (!ret) {
9b9a80677fd80b Paul E. McKenney 2021-06-24  380  			if (use_cpus_read_lock)
9b9a80677fd80b Paul E. McKenney 2021-06-24  381  				cpus_read_unlock();
9b9a80677fd80b Paul E. McKenney 2021-06-24  382  			else
9b9a80677fd80b Paul E. McKenney 2021-06-24  383  				preempt_enable();
9b9a80677fd80b Paul E. McKenney 2021-06-24  384  			wait_for_completion(&scfcp->scfc_completion);
9b9a80677fd80b Paul E. McKenney 2021-06-24  385  			if (use_cpus_read_lock)
9b9a80677fd80b Paul E. McKenney 2021-06-24  386  				cpus_read_lock();
9b9a80677fd80b Paul E. McKenney 2021-06-24  387  			else
9b9a80677fd80b Paul E. McKenney 2021-06-24  388  				preempt_disable();
9b9a80677fd80b Paul E. McKenney 2021-06-24  389  		} else {
9b9a80677fd80b Paul E. McKenney 2021-06-24  390  			scfp->n_single_rpc_ofl++;
9b9a80677fd80b Paul E. McKenney 2021-06-24  391  			kfree(scfcp);
9b9a80677fd80b Paul E. McKenney 2021-06-24  392  			scfcp = NULL;
9b9a80677fd80b Paul E. McKenney 2021-06-24  393  		}
9b9a80677fd80b Paul E. McKenney 2021-06-24  394  		break;
5022b8ac608f8b Paul E. McKenney 2020-06-25  395  	case SCF_PRIM_MANY:
5022b8ac608f8b Paul E. McKenney 2020-06-25  396  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  397  			scfp->n_many_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  398  		else
5022b8ac608f8b Paul E. McKenney 2020-06-25  399  			scfp->n_many++;
ee7035d29576dc Paul E. McKenney 2020-07-01  400  		if (scfcp) {
ee7035d29576dc Paul E. McKenney 2020-07-01  401  			barrier(); // Prevent race-reduction compiler optimizations.
980205ee8489d5 Paul E. McKenney 2020-07-01  402  			scfcp->scfc_in = true;
ee7035d29576dc Paul E. McKenney 2020-07-01  403  		}
980205ee8489d5 Paul E. McKenney 2020-07-01  404  		smp_call_function_many(cpu_online_mask, scf_handler, scfcp, scfsp->scfs_wait);
5022b8ac608f8b Paul E. McKenney 2020-06-25  405  		break;
5022b8ac608f8b Paul E. McKenney 2020-06-25  406  	case SCF_PRIM_ALL:
5022b8ac608f8b Paul E. McKenney 2020-06-25  407  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  408  			scfp->n_all_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  409  		else
e9d338a0b1799c Paul E. McKenney 2020-06-24  410  			scfp->n_all++;
ee7035d29576dc Paul E. McKenney 2020-07-01  411  		if (scfcp) {
ee7035d29576dc Paul E. McKenney 2020-07-01  412  			barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb57 Paul E. McKenney 2020-07-01  413  			scfcp->scfc_in = true;
ee7035d29576dc Paul E. McKenney 2020-07-01  414  		}
34e8c4837adb57 Paul E. McKenney 2020-07-01  415  		smp_call_function(scf_handler, scfcp, scfsp->scfs_wait);
676e5469643e71 Paul E. McKenney 2020-07-01  416  		break;
de77d4da54d10d Paul E. McKenney 2020-07-02  417  	default:
de77d4da54d10d Paul E. McKenney 2020-07-02  418  		WARN_ON_ONCE(1);
de77d4da54d10d Paul E. McKenney 2020-07-02  419  		if (scfcp)
de77d4da54d10d Paul E. McKenney 2020-07-02  420  			scfcp->scfc_out = true;
676e5469643e71 Paul E. McKenney 2020-07-01  421  	}
676e5469643e71 Paul E. McKenney 2020-07-01  422  	if (scfcp && scfsp->scfs_wait) {
9e66bf03f9c538 Paul E. McKenney 2020-07-03  423  		if (WARN_ON_ONCE((num_online_cpus() > 1 || scfsp->scfs_prim == SCF_PRIM_SINGLE) &&
9b9a80677fd80b Paul E. McKenney 2021-06-24  424  				 !scfcp->scfc_out)) {
9b9a80677fd80b Paul E. McKenney 2021-06-24  425  			pr_warn("%s: Memory-ordering failure, scfs_prim: %d.\n", __func__, scfsp->scfs_prim);
34e8c4837adb57 Paul E. McKenney 2020-07-01  426  			atomic_inc(&n_mb_out_errs); // Leak rather than trash!
9b9a80677fd80b Paul E. McKenney 2021-06-24  427  		} else {
34e8c4837adb57 Paul E. McKenney 2020-07-01  428  			kfree(scfcp);
9b9a80677fd80b Paul E. McKenney 2021-06-24  429  		}
ee7035d29576dc Paul E. McKenney 2020-07-01  430  		barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb57 Paul E. McKenney 2020-07-01  431  	}
e9d338a0b1799c Paul E. McKenney 2020-06-24  432  	if (use_cpus_read_lock)
e9d338a0b1799c Paul E. McKenney 2020-06-24  433  		cpus_read_unlock();
e9d338a0b1799c Paul E. McKenney 2020-06-24  434  	else
e9d338a0b1799c Paul E. McKenney 2020-06-24  435  		preempt_enable();
e9d338a0b1799c Paul E. McKenney 2020-06-24  436  	if (!(torture_random(trsp) & 0xfff))
e9d338a0b1799c Paul E. McKenney 2020-06-24 @437  		schedule_timeout_uninterruptible(1);
e9d338a0b1799c Paul E. McKenney 2020-06-24  438  }
e9d338a0b1799c Paul E. McKenney 2020-06-24  439  

:::::: The code at line 437 was first introduced by commit
:::::: e9d338a0b1799c988b678e8ccb66a442272e6aa3 scftorture: Add smp_call_function() torture test

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
