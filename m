Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67ED2F0C66
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299078; cv=none; b=VqWl1bGymT8+6TIF3M+JUDc5iGLoUwbJPbunogjVfOr2gmatM6YsuvgSKWninQ3ERz+d0Cq1ydIa3VS+fDAjFhV3/BtrTM0NAnMiU9ZCAYJReg+u3Ty0yDT+xs+R0uE+TRA5XMEmw37fievbkANgi2oYkblUychldKLfoFHDp5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299078; c=relaxed/simple;
	bh=haKAvlj85ajjvaQ7DmDW99w4KCFM2CVdGP38iyD49D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBXki+QVKf/TrDPubTxxMIwUPnNQkK1veDZhSzeLrQtsJFnd971S8UqOnjRymeCA1j6pS5WSjCQ/G6yrXwUg1MyVkvA5Mbidf1QKAMJAh+uyo4zxzXoliY0qJklgxpqFHXaF/Zawg1JllYKzc2inT2jQviSbXYjhXYVt25B1uHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPImHjNc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPImHjNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756299077; x=1787835077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haKAvlj85ajjvaQ7DmDW99w4KCFM2CVdGP38iyD49D0=;
  b=XPImHjNcaVAnJa++LrJVHHei5lVy7bnw4pb1Jw1lS8XEnfqi9verJayz
   nXPmR31FLJERwKz6/VmS7eQ3txWIFscA8FjGBZRyi5MgtCx8kB5Ygh3pK
   dxhXpAmBAKLinuXhDGyaPJxm+qVCC6pwIvRcGbDZl08b6ZjvMWkjC8+4p
   SH0nMPk3pXGZhV75iM2A/fKNnNSxZxUjGykgRvUQdD+qsjyPnA1mrJMvY
   7hopQgvFwPmo/yoCFfywPSf3NqjNRQS2Xk7HTeGZ3IdowH7jDyltmBpLJ
   Elv7CtCXf/L9z46XicXDqPP2lHb+KkYBliyX+rqAIrNtlrc4OmA+BAJJE
   A==;
X-CSE-ConnectionGUID: +ltWEvF5RNiD92RZ+QwcKQ==
X-CSE-MsgGUID: V5znbPTuTNKaMhGl1UiHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58258550"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58258550"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 05:51:16 -0700
X-CSE-ConnectionGUID: 7IWstBrNR7WutC94PqDIeg==
X-CSE-MsgGUID: Z+Pru3V+Q0mc0DaHKgk75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200784173"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 05:51:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urFcB-000Swh-1k;
	Wed, 27 Aug 2025 12:51:04 +0000
Date: Wed, 27 Aug 2025 20:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frederic-dynticks:kthread/core-v2 33/35] kernel/kthread.c:938
 kthread_affine_preferred_update() warn: inconsistent returns 'global
 &kthread_affinity_lock'.
Message-ID: <202508272011.bvP4u7Dx-lkp@intel.com>
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
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   6bcb15d1aebd50828a313a2ec927dea9d0ab9b8f
commit: 6365e0ca8b5387309efcfedabeeec97e064e2034 [33/35] kthread: Add API to update preferred affinity on kthread runtime
:::::: branch date: 20 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20250827 (https://download.01.org/0day-ci/archive/20250827/202508272011.bvP4u7Dx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508272011.bvP4u7Dx-lkp@intel.com/

smatch warnings:
kernel/kthread.c:938 kthread_affine_preferred_update() warn: inconsistent returns 'global &kthread_affinity_lock'.

vim +938 kernel/kthread.c

4d13f4304fa434 Frederic Weisbecker 2024-09-27  901  
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  902  /**
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  903   * kthread_affine_preferred_update - update a kthread's preferred affinity
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  904   * @p: thread created by kthread_create().
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  905   * @cpumask: new mask of CPUs (might not be online, must be possible) for @k
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  906   *           to run on.
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  907   *
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  908   * Update the cpumask of the desired kthread's affinity that was passed by
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  909   * a previous call to kthread_affine_preferred(). This can be called either
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  910   * before or after the first wakeup of the kthread.
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  911   *
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  912   * Returns 0 if the affinity has been applied.
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  913   */
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  914  int kthread_affine_preferred_update(struct task_struct *p,
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  915  				    const struct cpumask *mask)
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  916  {
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  917  	struct kthread *kthread = to_kthread(p);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  918  	cpumask_var_t affinity;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  919  	int ret = 0;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  920  
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  921  	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  922  		return -ENOMEM;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  923  
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  924  	scoped_guard(mutex, &kthread_affinity_lock) {
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  925  		if (WARN_ON_ONCE(!kthread->preferred_affinity ||
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  926  				 list_empty(&kthread->affinity_node))) {
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  927  			ret = -EINVAL;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  928  			goto out;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  929  		}
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  930  
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  931  		cpumask_copy(kthread->preferred_affinity, mask);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  932  		kthread_fetch_affinity(kthread, affinity);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  933  		set_cpus_allowed_ptr(p, affinity);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  934  	}
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  935  out:
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  936  	free_cpumask_var(affinity);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  937  
6365e0ca8b5387 Frederic Weisbecker 2025-08-26 @938  	return ret;
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  939  }
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  940  EXPORT_SYMBOL_GPL(kthread_affine_preferred_update);
6365e0ca8b5387 Frederic Weisbecker 2025-08-26  941  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
