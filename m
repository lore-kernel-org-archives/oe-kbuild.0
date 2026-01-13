Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E21632E7
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345974; cv=none; b=uUR8nGaNl5dok9aabKB+BZZ2HFdUyjBMM+c9/YheCUpBB6/4ZODJeRzG8chYMRZxajUcv4NVCN0R013Vrcta9CYfiimarmRGEkJ1llQrWmpHZFRn/TEcecJoWBouY9JGMtluBp0nhxk27Id+ZWgDfrSyR0QOnOGzx2k7IjxvwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345974; c=relaxed/simple;
	bh=j15pc1RTqWaGx5oHoE7/Cz+IyX+9BnM2llqtdOzFbaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bPq7hLmtdw5iLbJekNmz8XNSKew9DYXRHNWJgT2ZMIuCqO8xjS2CcnqCIknnysIeYdPa5e0/md3cy4CDM7yb4GNH3nL8KEbEUDbmQm5TAn3gYfl0niYqwgLA6C2jgo92xKeUfjice9BrJIG34HaZ05C1dIsMNAlPz7VILsnF/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGEUlMLt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGEUlMLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768345973; x=1799881973;
  h=date:from:to:cc:subject:message-id;
  bh=j15pc1RTqWaGx5oHoE7/Cz+IyX+9BnM2llqtdOzFbaM=;
  b=AGEUlMLt9J0EpFInWwXR8118hoFZinstSagD86blWmzBMblmH7H/snvs
   EDXKZdnXX9XQcsPD7rBlNsSjGS0V3jvygzPpH6xwZpMfYSdWGCXqgC1R6
   /eknQJbKXjg3msuPlFynTIEu1FNpQcM95SXOcp845aaUt191jWX+QTzBy
   nVX0LMuIkeCziiMvF3mdFeoyN7oVjidITdG1hV1713Mr7jUzKSS1h5r97
   t3SJxLF+UrWmoEOAXgcpa2FV6zoESr0rhVqTALdAR3DzS6C6y5bCOLF+U
   onUPXKaIfR2BwiCRqAvuM+KCD8sVlp0X1pzCiYTtv5OzjppfBBSl4P0gw
   g==;
X-CSE-ConnectionGUID: pEOpoIytSyKXySx1Ndw/Yw==
X-CSE-MsgGUID: N7m1Dj4lRQWstt5GxAL8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73483310"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73483310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:12:52 -0800
X-CSE-ConnectionGUID: ATWx7suAQA29ZReDj/8vkw==
X-CSE-MsgGUID: G7DdpzSARUSq/gAi6ph3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="235766212"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 15:12:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfnZB-00000000FTs-0NUd;
	Tue, 13 Jan 2026 23:12:49 +0000
Date: Wed, 14 Jan 2026 07:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 17/17]
 kernel/sched/sched.h:3810 switch_mm_cid() error: we previously assumed
 'next->mm' could be null (see line 3772)
Message-ID: <202601140719.3EqjBiuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   af6a4c656d183ce8a6c2d5cb0d068beb5e791621
commit: 53abe3e1c154628cc74e33a1bfcd865656e433a5 [17/17] sched: Remove never used code in mm_cid_get()
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140719.3EqjBiuO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601140719.3EqjBiuO-lkp@intel.com/

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

:::::: The code at line 3810 was first introduced by commit
:::::: 7e019dcc470f27066c98697e43d930df8d54bd9c sched: Improve cache locality of RSEQ concurrency IDs for intermittent workloads

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
