Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123214;
	b=sGe4zHjpgKTPnXaiSuro2TfcT0rX9a9sPWzj8Ux9uq952+CMsKH4BRtDuiLFIWIXJx9e
	 GOCjBCG16hIYpNbDmhGF/EXTC/echwyWiblD5nepeu+fcm0CIE4ks787Z6uXU5VPdHQ1i
	 QhTxHaZPle2xH3EIbrQ7Epwzic3CWzevC6Zb4EoKOFYucQCf5OY9QpWQjiWnc8h1o/0yo
	 AbEfS8BPJt+4TmZYaLYw7FK0vaWA5H6ljWybOtlnfrA1vf+NSj+Bw9Wx62k0Hd3inJtAl
	 ZhtR6UqdbtQ5TjOqCGOB6OzgXPNvibME6mwe8HqOIbR7RINBJV07T7FD/vfUlzmHM4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=g3Ew1j/tj/A16NwXOKKL9xk41Jgq2Rq3xqj1mIvo61c=;
	b=jnF3A/1AEbNHciPsX7VI7EW6iNJGZthHr48sNL1uUrhr/omb5QsyvtbPqm8fEgteh6Mb
	 izVvFEdouMJbNvhH2ELkbeZLZ6fbM3O2jodF+oUQFKBVK9P5TC8aGc7xkiwgSLZVLLKqO
	 18T98lsp3Kg1GWFu6I4PvG7xQ8uGeUPU0Hg8Kd7RtOAk00DzMCtnnXghnKx9tGRYQ+59i
	 mV6GFx9IObA4nKciU9fuVzqBAuXH8z5zC9Avp+4ehnhYx8aMXvZmMVVSB6fNUDTqcp8Ct
	 E+TrMng8+q8e3Y+mXCS7vdVUI149mBeWG7h8EFTlcqn21PaiQAAFZMagJpWyjwLP/LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W/wW4/nd";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5C606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 07:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W/wW4/nd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794123212; x=1825659212;
  h=date:from:to:cc:subject:message-id;
  bh=ADXk9MmwEsHU282TPJBGLLhhn/WIXNwCO8jpDx1PJM8=;
  b=W/wW4/ndiHq7zP/VrZBX2m4W9chN11hklJEn38J9M8dygsyto5hWqbVK
   1kHQKLaSNTR4H+Nl22rFRdMNFd2DSbTbVseOIjvjP0daqOm7h2On5XRnL
   JkRtrHgKtfyUjM8AmVeCeVehR63Arir1TbiWBvpZxecm1DGrSZiu30c8E
   I0A3RKQmEyuNMMwCwBOTOS59CnsGR9DitRyA5Var1HD851UEb5j3SFwK5
   G0vgMYxUXtnzi2UFH5O5nXirGVeSLiVQtKDHpTvH6RF6WQDK/QzQ411mV
   RCnmBIZZNU72WdRNOE7u1vKncN+RoYWDMAavZ+E/H4HrjHrjelNJ+cQWq
   Q==;
X-CSE-ConnectionGUID: ahKTn4bQSqakup9m7YnGMg==
X-CSE-MsgGUID: xQU5sLoJTVqxhXWhi+oGmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2773342"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2773342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 23:33:31 -0800
X-CSE-ConnectionGUID: PVCR16niR0K1nQ55DPMRUA==
X-CSE-MsgGUID: Ro12Mf68SIqywyHixQGUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7619280"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2026 23:33:30 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPxP5-00000000B8b-0IjE;
	Sun, 08 Nov 2026 07:33:27 +0000
Date: Sun, 08 Nov 2026 08:33:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 54/54]
 kernel/scftorture.c:440 scftorture_invoke_one() warn: possible memory leak of
 'scfcp'
Message-ID: <202611080842.qPBW23KP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: f685311dbe05a8e817cc432c61895b791bf76682 [54/54] scftorture: Forgive memory-allocation failure if KASAN
:::::: branch date: 31 hours ago
:::::: commit date: 3 years, 2 months ago
config: arm-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080842.qPBW23KP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611080842.qPBW23KP-lkp@intel.com/

smatch warnings:
kernel/scftorture.c:440 scftorture_invoke_one() warn: possible memory leak of 'scfcp'

vim +/scfcp +440 kernel/scftorture.c

5022b8ac608f8b Paul E. McKenney 2020-06-25  316  
e9d338a0b1799c Paul E. McKenney 2020-06-24  317  // Randomly do an smp_call_function*() invocation.
e9d338a0b1799c Paul E. McKenney 2020-06-24  318  static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_random_state *trsp)
e9d338a0b1799c Paul E. McKenney 2020-06-24  319  {
5022b8ac608f8b Paul E. McKenney 2020-06-25  320  	uintptr_t cpu;
676e5469643e71 Paul E. McKenney 2020-07-01  321  	int ret = 0;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  322  	struct scf_check *scfcp = NULL;
5022b8ac608f8b Paul E. McKenney 2020-06-25  323  	struct scf_selector *scfsp = scf_sel_rand(trsp);
5022b8ac608f8b Paul E. McKenney 2020-06-25  324  
e9d338a0b1799c Paul E. McKenney 2020-06-24  325  	if (use_cpus_read_lock)
e9d338a0b1799c Paul E. McKenney 2020-06-24  326  		cpus_read_lock();
e9d338a0b1799c Paul E. McKenney 2020-06-24  327  	else
e9d338a0b1799c Paul E. McKenney 2020-06-24  328  		preempt_disable();
34e8c4837adb57 Paul E. McKenney 2020-07-01  329  	if (scfsp->scfs_prim == SCF_PRIM_SINGLE || scfsp->scfs_wait) {
b93e21a51e1c8e Paul E. McKenney 2020-06-30  330  		scfcp = kmalloc(sizeof(*scfcp), GFP_ATOMIC);
f685311dbe05a8 Paul E. McKenney 2023-05-15  331  		if (!scfcp) {
f685311dbe05a8 Paul E. McKenney 2023-05-15  332  			WARN_ON_ONCE(!IS_ENABLED(CONFIG_KASAN));
b93e21a51e1c8e Paul E. McKenney 2020-06-30  333  			atomic_inc(&n_alloc_errs);
4df55bddc1a360 Paul E. McKenney 2020-07-09  334  		} else {
4df55bddc1a360 Paul E. McKenney 2020-07-09  335  			scfcp->scfc_cpu = -1;
4df55bddc1a360 Paul E. McKenney 2020-07-09  336  			scfcp->scfc_wait = scfsp->scfs_wait;
4df55bddc1a360 Paul E. McKenney 2020-07-09  337  			scfcp->scfc_out = false;
9b9a80677fd80b Paul E. McKenney 2021-06-24  338  			scfcp->scfc_rpc = false;
4df55bddc1a360 Paul E. McKenney 2020-07-09  339  		}
34e8c4837adb57 Paul E. McKenney 2020-07-01  340  	}
34e8c4837adb57 Paul E. McKenney 2020-07-01  341  	switch (scfsp->scfs_prim) {
1ac78b49d61d4a Paul E. McKenney 2020-09-03  342  	case SCF_PRIM_RESCHED:
1ac78b49d61d4a Paul E. McKenney 2020-09-03  343  		if (IS_BUILTIN(CONFIG_SCF_TORTURE_TEST)) {
1ac78b49d61d4a Paul E. McKenney 2020-09-03  344  			cpu = torture_random(trsp) % nr_cpu_ids;
1ac78b49d61d4a Paul E. McKenney 2020-09-03  345  			scfp->n_resched++;
1ac78b49d61d4a Paul E. McKenney 2020-09-03  346  			resched_cpu(cpu);
1ac78b49d61d4a Paul E. McKenney 2020-09-03  347  		}
1ac78b49d61d4a Paul E. McKenney 2020-09-03  348  		break;
34e8c4837adb57 Paul E. McKenney 2020-07-01  349  	case SCF_PRIM_SINGLE:
5022b8ac608f8b Paul E. McKenney 2020-06-25  350  		cpu = torture_random(trsp) % nr_cpu_ids;
5022b8ac608f8b Paul E. McKenney 2020-06-25  351  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  352  			scfp->n_single_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  353  		else
5022b8ac608f8b Paul E. McKenney 2020-06-25  354  			scfp->n_single++;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  355  		if (scfcp) {
b93e21a51e1c8e Paul E. McKenney 2020-06-30  356  			scfcp->scfc_cpu = cpu;
ee7035d29576dc Paul E. McKenney 2020-07-01  357  			barrier(); // Prevent race-reduction compiler optimizations.
b93e21a51e1c8e Paul E. McKenney 2020-06-30  358  			scfcp->scfc_in = true;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  359  		}
b93e21a51e1c8e Paul E. McKenney 2020-06-30  360  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, scfsp->scfs_wait);
5022b8ac608f8b Paul E. McKenney 2020-06-25  361  		if (ret) {
5022b8ac608f8b Paul E. McKenney 2020-06-25  362  			if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  363  				scfp->n_single_wait_ofl++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  364  			else
5022b8ac608f8b Paul E. McKenney 2020-06-25  365  				scfp->n_single_ofl++;
b93e21a51e1c8e Paul E. McKenney 2020-06-30  366  			kfree(scfcp);
676e5469643e71 Paul E. McKenney 2020-07-01  367  			scfcp = NULL;
5022b8ac608f8b Paul E. McKenney 2020-06-25  368  		}
5022b8ac608f8b Paul E. McKenney 2020-06-25  369  		break;
9b9a80677fd80b Paul E. McKenney 2021-06-24  370  	case SCF_PRIM_SINGLE_RPC:
9b9a80677fd80b Paul E. McKenney 2021-06-24  371  		if (!scfcp)
9b9a80677fd80b Paul E. McKenney 2021-06-24  372  			break;
9b9a80677fd80b Paul E. McKenney 2021-06-24  373  		cpu = torture_random(trsp) % nr_cpu_ids;
9b9a80677fd80b Paul E. McKenney 2021-06-24  374  		scfp->n_single_rpc++;
9b9a80677fd80b Paul E. McKenney 2021-06-24  375  		scfcp->scfc_cpu = cpu;
9b9a80677fd80b Paul E. McKenney 2021-06-24  376  		scfcp->scfc_wait = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  377  		init_completion(&scfcp->scfc_completion);
9b9a80677fd80b Paul E. McKenney 2021-06-24  378  		scfcp->scfc_rpc = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  379  		barrier(); // Prevent race-reduction compiler optimizations.
9b9a80677fd80b Paul E. McKenney 2021-06-24  380  		scfcp->scfc_in = true;
9b9a80677fd80b Paul E. McKenney 2021-06-24  381  		ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, 0);
9b9a80677fd80b Paul E. McKenney 2021-06-24  382  		if (!ret) {
9b9a80677fd80b Paul E. McKenney 2021-06-24  383  			if (use_cpus_read_lock)
9b9a80677fd80b Paul E. McKenney 2021-06-24  384  				cpus_read_unlock();
9b9a80677fd80b Paul E. McKenney 2021-06-24  385  			else
9b9a80677fd80b Paul E. McKenney 2021-06-24  386  				preempt_enable();
9b9a80677fd80b Paul E. McKenney 2021-06-24  387  			wait_for_completion(&scfcp->scfc_completion);
9b9a80677fd80b Paul E. McKenney 2021-06-24  388  			if (use_cpus_read_lock)
9b9a80677fd80b Paul E. McKenney 2021-06-24  389  				cpus_read_lock();
9b9a80677fd80b Paul E. McKenney 2021-06-24  390  			else
9b9a80677fd80b Paul E. McKenney 2021-06-24  391  				preempt_disable();
9b9a80677fd80b Paul E. McKenney 2021-06-24  392  		} else {
9b9a80677fd80b Paul E. McKenney 2021-06-24  393  			scfp->n_single_rpc_ofl++;
9b9a80677fd80b Paul E. McKenney 2021-06-24  394  			kfree(scfcp);
9b9a80677fd80b Paul E. McKenney 2021-06-24  395  			scfcp = NULL;
9b9a80677fd80b Paul E. McKenney 2021-06-24  396  		}
9b9a80677fd80b Paul E. McKenney 2021-06-24  397  		break;
5022b8ac608f8b Paul E. McKenney 2020-06-25  398  	case SCF_PRIM_MANY:
5022b8ac608f8b Paul E. McKenney 2020-06-25  399  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  400  			scfp->n_many_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  401  		else
5022b8ac608f8b Paul E. McKenney 2020-06-25  402  			scfp->n_many++;
ee7035d29576dc Paul E. McKenney 2020-07-01  403  		if (scfcp) {
ee7035d29576dc Paul E. McKenney 2020-07-01  404  			barrier(); // Prevent race-reduction compiler optimizations.
980205ee8489d5 Paul E. McKenney 2020-07-01  405  			scfcp->scfc_in = true;
ee7035d29576dc Paul E. McKenney 2020-07-01  406  		}
980205ee8489d5 Paul E. McKenney 2020-07-01  407  		smp_call_function_many(cpu_online_mask, scf_handler, scfcp, scfsp->scfs_wait);
5022b8ac608f8b Paul E. McKenney 2020-06-25  408  		break;
5022b8ac608f8b Paul E. McKenney 2020-06-25  409  	case SCF_PRIM_ALL:
5022b8ac608f8b Paul E. McKenney 2020-06-25  410  		if (scfsp->scfs_wait)
5022b8ac608f8b Paul E. McKenney 2020-06-25  411  			scfp->n_all_wait++;
5022b8ac608f8b Paul E. McKenney 2020-06-25  412  		else
e9d338a0b1799c Paul E. McKenney 2020-06-24  413  			scfp->n_all++;
ee7035d29576dc Paul E. McKenney 2020-07-01  414  		if (scfcp) {
ee7035d29576dc Paul E. McKenney 2020-07-01  415  			barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb57 Paul E. McKenney 2020-07-01  416  			scfcp->scfc_in = true;
ee7035d29576dc Paul E. McKenney 2020-07-01  417  		}
34e8c4837adb57 Paul E. McKenney 2020-07-01  418  		smp_call_function(scf_handler, scfcp, scfsp->scfs_wait);
676e5469643e71 Paul E. McKenney 2020-07-01  419  		break;
de77d4da54d10d Paul E. McKenney 2020-07-02  420  	default:
de77d4da54d10d Paul E. McKenney 2020-07-02  421  		WARN_ON_ONCE(1);
de77d4da54d10d Paul E. McKenney 2020-07-02  422  		if (scfcp)
de77d4da54d10d Paul E. McKenney 2020-07-02  423  			scfcp->scfc_out = true;
676e5469643e71 Paul E. McKenney 2020-07-01  424  	}
676e5469643e71 Paul E. McKenney 2020-07-01  425  	if (scfcp && scfsp->scfs_wait) {
9e66bf03f9c538 Paul E. McKenney 2020-07-03  426  		if (WARN_ON_ONCE((num_online_cpus() > 1 || scfsp->scfs_prim == SCF_PRIM_SINGLE) &&
9b9a80677fd80b Paul E. McKenney 2021-06-24  427  				 !scfcp->scfc_out)) {
9b9a80677fd80b Paul E. McKenney 2021-06-24  428  			pr_warn("%s: Memory-ordering failure, scfs_prim: %d.\n", __func__, scfsp->scfs_prim);
34e8c4837adb57 Paul E. McKenney 2020-07-01  429  			atomic_inc(&n_mb_out_errs); // Leak rather than trash!
9b9a80677fd80b Paul E. McKenney 2021-06-24  430  		} else {
34e8c4837adb57 Paul E. McKenney 2020-07-01  431  			kfree(scfcp);
9b9a80677fd80b Paul E. McKenney 2021-06-24  432  		}
ee7035d29576dc Paul E. McKenney 2020-07-01  433  		barrier(); // Prevent race-reduction compiler optimizations.
34e8c4837adb57 Paul E. McKenney 2020-07-01  434  	}
e9d338a0b1799c Paul E. McKenney 2020-06-24  435  	if (use_cpus_read_lock)
e9d338a0b1799c Paul E. McKenney 2020-06-24  436  		cpus_read_unlock();
e9d338a0b1799c Paul E. McKenney 2020-06-24  437  	else
e9d338a0b1799c Paul E. McKenney 2020-06-24  438  		preempt_enable();
e9d338a0b1799c Paul E. McKenney 2020-06-24  439  	if (!(torture_random(trsp) & 0xfff))
e9d338a0b1799c Paul E. McKenney 2020-06-24 @440  		schedule_timeout_uninterruptible(1);
e9d338a0b1799c Paul E. McKenney 2020-06-24  441  }
e9d338a0b1799c Paul E. McKenney 2020-06-24  442  

:::::: The code at line 440 was first introduced by commit
:::::: e9d338a0b1799c988b678e8ccb66a442272e6aa3 scftorture: Add smp_call_function() torture test

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
