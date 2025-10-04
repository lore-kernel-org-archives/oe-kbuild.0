Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C4219313
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Oct 2025 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759562932; cv=none; b=HKcjWyYdkOKekWjM/3q2oigSmYB2QA8hujJzzHWbMqpwiPWazE5xqPwSPPjh6KdBLj2WNJBDG/AgStCZPPM/Tl2wTSav3dndIbud5pzoW4WdfQIL9wCoVQlnKKQcAVVx7thYaxzRutg5x0Lp/7VtxcYARBOps1/n1uyz37QFJ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759562932; c=relaxed/simple;
	bh=k984CeepmbJNa1B6CR6L64QOQYp17DNL3ajpFI1ZcTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QY78d2pT/wWkTGHvc1ItMonLyYmKsc/PIQnvKGf8RAgiZOVBtw/iOougDEj9o/fAmFG1w4fopUQmYa1dFG7eH4knipwj4Kw74cTdbL5mkTbh9glQNa0oiJBRdXwum+hLfN7p9BzWcf18ci3drCPG8QtjRr1lofWBQkvdAhoY3GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlDrXcrC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlDrXcrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759562931; x=1791098931;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k984CeepmbJNa1B6CR6L64QOQYp17DNL3ajpFI1ZcTQ=;
  b=MlDrXcrC7fUp6uPf+CusxgQYEJdjngOd82+wRRt/4yrXBgclS18fN0e+
   xOQOLZHv+cy6sE631J7dgUmii3kmQaSHopf1t1iTX5hoLl3LCmg4Pqige
   C4An32AfT7lOJbiZZ5GblIL+IVrwpekrRIjaJ8G/be3bxuKvfwGvejkfo
   8VR1Y9wS/hKKxSoI/t3Bc6p22DGmw9cL4tBeXdPkfxYebMrX/SX19Jc7T
   Z6keTFqGP/rpsOitpfhs2zogWQeJOzpEB+RJzYJE6yEN5NAdW9yVdTUwZ
   iNwiV3ptyGCK4hbYjQ+MER2sqm/bdEu0DeZVfasa7blFlaTEDQPhKsSXr
   w==;
X-CSE-ConnectionGUID: 3dxILudZTsGgpsYMu+3brw==
X-CSE-MsgGUID: WSKo6dIqTZyqf6qP3B9KRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61538892"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="61538892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 00:28:51 -0700
X-CSE-ConnectionGUID: VVBnCfPFTlqWNxwf2g/X0Q==
X-CSE-MsgGUID: FP2zJS9iS5eeRPf6emFCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="210438411"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2025 00:28:48 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4whB-00058n-34;
	Sat, 04 Oct 2025 07:28:45 +0000
Date: Sat, 4 Oct 2025 15:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched: drop unused variable cpumask in mm_cid_get()
Message-ID: <202510041546.DvhFLp2x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251002-sched-w1-v1-1-a6fdf549d179@linaro.org>
References: <20251002-sched-w1-v1-1-a6fdf549d179@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Juri Lelli <juri.lelli@redhat.com>
TO: Vincent Guittot <vincent.guittot@linaro.org>
TO: Dietmar Eggemann <dietmar.eggemann@arm.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Ben Segall <bsegall@google.com>
TO: Mel Gorman <mgorman@suse.de>
TO: Valentin Schneider <vschneid@redhat.com>
CC: Peter Griffin <peter.griffin@linaro.org>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Will McVicker <willmcvicker@google.com>
CC: kernel-team@android.com
CC: linux-kernel@vger.kernel.org
CC: "André Draszik" <andre.draszik@linaro.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3b9b1f8df454caa453c7fb07689064edb2eda90a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/sched-drop-unused-variable-cpumask-in-mm_cid_get/20251002-192448
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251002-sched-w1-v1-1-a6fdf549d179%40linaro.org
patch subject: [PATCH] sched: drop unused variable cpumask in mm_cid_get()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041546.DvhFLp2x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510041546.DvhFLp2x-lkp@intel.com/

smatch warnings:
kernel/sched/sched.h:3810 switch_mm_cid() error: we previously assumed 'next->mm' could be null (see line 3772)

vim +3810 kernel/sched/sched.h

223baf9d17f25e Mathieu Desnoyers 2023-04-20  3761  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3762  static inline void switch_mm_cid(struct rq *rq,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3763  				 struct task_struct *prev,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3764  				 struct task_struct *next)
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3765  {
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3766  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3767  	 * Provide a memory barrier between rq->curr store and load of
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3768  	 * {prev,next}->mm->pcpu_cid[cpu] on rq->curr->mm transition.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3769  	 *
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3770  	 * Should be adapted if context_switch() is modified.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3771  	 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @3772  	if (!next->mm) {                                // to kernel
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3773  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3774  		 * user -> kernel transition does not guarantee a barrier, but
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3775  		 * we can use the fact that it performs an atomic operation in
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3776  		 * mmgrab().
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3777  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3778  		if (prev->mm)                           // from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3779  			smp_mb__after_mmgrab();
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3780  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3781  		 * kernel -> kernel transition does not change rq->curr->mm
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3782  		 * state. It stays NULL.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3783  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3784  	} else {                                        // to user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3785  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3786  		 * kernel -> user transition does not provide a barrier
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3787  		 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3788  		 * Provide it here.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3789  		 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3790  		if (!prev->mm) {                        // from kernel
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3791  			smp_mb();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3792  		} else {				// from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3793  			/*
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3794  			 * user->user transition relies on an implicit
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3795  			 * memory barrier in switch_mm() when
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3796  			 * current->mm changes. If the architecture
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3797  			 * switch_mm() does not have an implicit memory
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3798  			 * barrier, it is emitted here.  If current->mm
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3799  			 * is unchanged, no barrier is needed.
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3800  			 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3801  			smp_mb__after_switch_mm();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3802  		}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3803  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3804  	if (prev->mm_cid_active) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3805  		mm_cid_snapshot_time(rq, prev->mm);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3806  		mm_cid_put_lazy(prev);
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3807  		prev->mm_cid = -1;
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3808  	}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3809  	if (next->mm_cid_active)
7e019dcc470f27 Mathieu Desnoyers 2024-10-09 @3810  		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next, next->mm);
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3811  }
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3812  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
