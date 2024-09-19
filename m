Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9AD1DFF0
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726754180; cv=none; b=cgPVExsrPWxG6s7ymTE6IvnPh2nmLjMC2wS5psgm91UBDVp4W4fv/1T43Fd+xxiKiSqG9szFXFdGTyvuAihoR37BHAVOqjcDunsc5Ss3QLZL31iE9WYL+lBIXkXub885YP5Ee4jZbw1h9Tm8p8j26pXn9xgMwW66zCSzN7n9gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726754180; c=relaxed/simple;
	bh=78pATX1GgnCrZsHk6QDtVLwme9CMY9AsA/WM0R8aiy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNbpqeNV8f3uNud13Dt2rtsAmX/8+5iDScecYa8nn9w8OrGaXYfA79/ej6ONEdXd64d9mYAM3X2LXJupQMRXKqN/gK0yYBoPxdX1dvYcTafVzurCTTqyA/S1gIEtz1AwKL7kit+g50YRAfMuy4vPmOx+upbjC3VXGHAUgcM0J4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gObdSwh0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gObdSwh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726754179; x=1758290179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78pATX1GgnCrZsHk6QDtVLwme9CMY9AsA/WM0R8aiy4=;
  b=gObdSwh04dbnoEPhQdaiBl01jtVLd4DBQU1aqUtCqr/159TvjkW2FmqK
   1dPhCeUHg7R6DpSyQTIIGMOdNWzY8cgs7ux4VeQQkhn2euAnfnh8hBlc2
   4FHbJUoQ/r08W0wK4OoGlyicgoNGwUJX9CAGY/GVmmolNPE1YuNaiX5jb
   nUcI73WbiEPVscVTHA8TZwHbsALo1t7hYvLyGdD0HXBw1vv9JG7MZ4/OO
   xRv3pZLXOUhkE37hJXJIyYq0amwK/BEBC+0ONZd0bH65R6h/ZjkQSPivk
   SafwWFC5T9qFAR50NR7vCqKZxRz9yRXtDehJkY0uX94P1bZiKm8dwIsYs
   g==;
X-CSE-ConnectionGUID: NyR/PYbvTfyBMUPplngPgQ==
X-CSE-MsgGUID: ONd9RL8nTQCJDfjRIk4X5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="51127404"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="51127404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 06:56:01 -0700
X-CSE-ConnectionGUID: OIHuY/cpRF64DCqXKp43Rg==
X-CSE-MsgGUID: iaP8RTVDRa26HT1teho9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="100763399"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2024 06:55:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srHdU-000DL0-37;
	Thu, 19 Sep 2024 13:55:56 +0000
Date: Thu, 19 Sep 2024 21:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched/headers: remove useless code in mm_cid_get()
Message-ID: <202409192109.2yLN6zMI-lkp@intel.com>
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
In-Reply-To: <20240905091223.2350061-1-suhui@nfschina.com>
References: <20240905091223.2350061-1-suhui@nfschina.com>
TO: Su Hui <suhui@nfschina.com>
TO: mingo@redhat.com
TO: peterz@infradead.org
TO: juri.lelli@redhat.com
TO: vincent.guittot@linaro.org
TO: dietmar.eggemann@arm.com
TO: rostedt@goodmis.org
TO: bsegall@google.com
TO: mgorman@suse.de
TO: vschneid@redhat.com
TO: nathan@kernel.org
TO: ndesaulniers@google.com
TO: morbo@google.com
TO: justinstitt@google.com
CC: Su Hui <suhui@nfschina.com>
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: kernel-janitors@vger.kernel.org

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v6.11 next-20240919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/sched-headers-remove-useless-code-in-mm_cid_get/20240905-171441
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240905091223.2350061-1-suhui%40nfschina.com
patch subject: [PATCH] sched/headers: remove useless code in mm_cid_get()
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-r071-20240919 (https://download.01.org/0day-ci/archive/20240919/202409192109.2yLN6zMI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409192109.2yLN6zMI-lkp@intel.com/

smatch warnings:
kernel/sched/sched.h:3618 switch_mm_cid() error: we previously assumed 'next->mm' could be null (see line 3580)

vim +3618 kernel/sched/sched.h

223baf9d17f25e Mathieu Desnoyers 2023-04-20  3569  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3570  static inline void switch_mm_cid(struct rq *rq,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3571  				 struct task_struct *prev,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3572  				 struct task_struct *next)
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3573  {
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3574  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3575  	 * Provide a memory barrier between rq->curr store and load of
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3576  	 * {prev,next}->mm->pcpu_cid[cpu] on rq->curr->mm transition.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3577  	 *
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3578  	 * Should be adapted if context_switch() is modified.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3579  	 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @3580  	if (!next->mm) {                                // to kernel
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3581  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3582  		 * user -> kernel transition does not guarantee a barrier, but
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3583  		 * we can use the fact that it performs an atomic operation in
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3584  		 * mmgrab().
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3585  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3586  		if (prev->mm)                           // from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3587  			smp_mb__after_mmgrab();
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3588  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3589  		 * kernel -> kernel transition does not change rq->curr->mm
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3590  		 * state. It stays NULL.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3591  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3592  	} else {                                        // to user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3593  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3594  		 * kernel -> user transition does not provide a barrier
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3595  		 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3596  		 * Provide it here.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3597  		 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3598  		if (!prev->mm) {                        // from kernel
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3599  			smp_mb();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3600  		} else {				// from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3601  			/*
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3602  			 * user->user transition relies on an implicit
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3603  			 * memory barrier in switch_mm() when
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3604  			 * current->mm changes. If the architecture
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3605  			 * switch_mm() does not have an implicit memory
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3606  			 * barrier, it is emitted here.  If current->mm
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3607  			 * is unchanged, no barrier is needed.
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3608  			 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3609  			smp_mb__after_switch_mm();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3610  		}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3611  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3612  	if (prev->mm_cid_active) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3613  		mm_cid_snapshot_time(rq, prev->mm);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3614  		mm_cid_put_lazy(prev);
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3615  		prev->mm_cid = -1;
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3616  	}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3617  	if (next->mm_cid_active)
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @3618  		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next->mm);
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3619  }
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3620  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
