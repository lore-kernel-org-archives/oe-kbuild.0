Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0742773DA
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 03:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767841535; cv=none; b=bIMMGcpsGSM+/vo+pDsI2euJqtwraxyvlUaa7Yysv9vkPeLkre18M4iX7m7E6QvpomURkEkZv+hLAlfhZuE0VsDLpuIgQs5uOaAx4GOyCCzCBtz3ufWXvqTUAVmwGzk21b2jX8MNvv5DoWbQUtxkUgXma0jCvxhyC1dDLYc/COI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767841535; c=relaxed/simple;
	bh=v4njOEW6K9QPbo8DWgXOx3leBlLbeA3z0eQPyx1MfiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTqaUwX1lNmFg2+1p0SdC38pq5LmvgwTZLsVB3bSgi0O0nuDcSCM5olEy23YyKMlfh9NAX+MiU/dXD/63Z+JIbG5yzpecpq6epsqmY6OEkIAmP1tQQpop6Uc/UF87FXdtmr35vhALQzmjGYjFlDzDgMZzdYdB6hVBGzkmBfWfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrOn6Eer; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrOn6Eer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767841533; x=1799377533;
  h=date:from:to:cc:subject:message-id;
  bh=v4njOEW6K9QPbo8DWgXOx3leBlLbeA3z0eQPyx1MfiE=;
  b=HrOn6EerR2IcD3F2YokocEg0klwXC0M1tubfp6+E52eoJahgxM4c7sKQ
   Yk8uLJ6gGI/xnxYBSIx4SvYfjq1LoXZmK/ZNT24rdYgL1XnWw/8QUAwRP
   KqfYnuyszrAbddYhV9lbZtM1lRDxfOs65vAn9meV6vgRAyG6B/SL5eT1V
   IrnufGqnLLRDpe3fxKDRdAbUJnkZfeNjOe6fyPIy+LfV3o4k3hsQ/H4ho
   E8pn80Cvg27mb4csOv2qqeM6Orb7/7qNerlLkdQAAW22mcHnMzLqe7pc8
   PhVu2Of/mJdzmNQZwKZealuAjM6lZbqP1sVkjNYCsnb+MEFGJY6fdIEVX
   Q==;
X-CSE-ConnectionGUID: goyTVX1FRseMebanCLhZ3g==
X-CSE-MsgGUID: ESgbO1K4Q7uO/f4mLz3UTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69375925"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="69375925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:05:30 -0800
X-CSE-ConnectionGUID: occqEQ2wSnKNP9q3Io7Gkg==
X-CSE-MsgGUID: Gevmyc/BROix5qAN7XQwkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202988197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 19:05:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdgL0-000000004MG-2aIX;
	Thu, 08 Jan 2026 03:05:26 +0000
Date: Thu, 08 Jan 2026 11:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [glemco:staging_rv_mon_kunit 21/29]
 kernel/trace/rv/monitors/deadline/deadline.h:130 extract_params() warn:
 variable dereferenced before check 'p' (see line 129)
Message-ID: <202601081024.CGC2yhFU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   45a96d573274287926f2fd31092f229238476843
commit: 5c22af5956b42cc02d383e188c13d383d334043a [21/29] rv: Add deadline monitors
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: csky-randconfig-r072-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081024.CGC2yhFU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601081024.CGC2yhFU-lkp@intel.com/

smatch warnings:
kernel/trace/rv/monitors/deadline/deadline.h:130 extract_params() warn: variable dereferenced before check 'p' (see line 129)

vim +/p +130 kernel/trace/rv/monitors/deadline/deadline.h

5c22af5956b42c Gabriele Monaco 2025-07-31   89  
5c22af5956b42c Gabriele Monaco 2025-07-31   90  static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
5c22af5956b42c Gabriele Monaco 2025-07-31   91  {
5c22af5956b42c Gabriele Monaco 2025-07-31   92  	size_t size = offsetof(struct sched_attr, sched_nice);
5c22af5956b42c Gabriele Monaco 2025-07-31   93  	struct sched_attr __user *uattr, attr;
5c22af5956b42c Gabriele Monaco 2025-07-31   94  	int new_policy = -1, ret;
5c22af5956b42c Gabriele Monaco 2025-07-31   95  	unsigned long args[6];
5c22af5956b42c Gabriele Monaco 2025-07-31   96  	pid_t pid;
5c22af5956b42c Gabriele Monaco 2025-07-31   97  
5c22af5956b42c Gabriele Monaco 2025-07-31   98  	switch (id) {
5c22af5956b42c Gabriele Monaco 2025-07-31   99  	case __NR_sched_setscheduler:
5c22af5956b42c Gabriele Monaco 2025-07-31  100  		syscall_get_arguments(current, regs, args);
5c22af5956b42c Gabriele Monaco 2025-07-31  101  		pid = args[0];
5c22af5956b42c Gabriele Monaco 2025-07-31  102  		new_policy = args[1];
5c22af5956b42c Gabriele Monaco 2025-07-31  103  		break;
5c22af5956b42c Gabriele Monaco 2025-07-31  104  	case __NR_sched_setattr:
5c22af5956b42c Gabriele Monaco 2025-07-31  105  		syscall_get_arguments(current, regs, args);
5c22af5956b42c Gabriele Monaco 2025-07-31  106  		pid = args[0];
5c22af5956b42c Gabriele Monaco 2025-07-31  107  		uattr = (void *)args[1];
5c22af5956b42c Gabriele Monaco 2025-07-31  108  		/*
5c22af5956b42c Gabriele Monaco 2025-07-31  109  		 * Just copy up to sched_flags, we are not interested after that
5c22af5956b42c Gabriele Monaco 2025-07-31  110  		 */
5c22af5956b42c Gabriele Monaco 2025-07-31  111  		ret = copy_struct_from_user(&attr, size, uattr, size);
5c22af5956b42c Gabriele Monaco 2025-07-31  112  		if (ret)
5c22af5956b42c Gabriele Monaco 2025-07-31  113  			return ret;
5c22af5956b42c Gabriele Monaco 2025-07-31  114  		if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
5c22af5956b42c Gabriele Monaco 2025-07-31  115  			return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  116  		new_policy = attr.sched_policy;
5c22af5956b42c Gabriele Monaco 2025-07-31  117  		break;
5c22af5956b42c Gabriele Monaco 2025-07-31  118  	default:
5c22af5956b42c Gabriele Monaco 2025-07-31  119  		return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  120  	}
5c22af5956b42c Gabriele Monaco 2025-07-31  121  	if (!pid)
5c22af5956b42c Gabriele Monaco 2025-07-31  122  		*p = current;
5c22af5956b42c Gabriele Monaco 2025-07-31  123  	else {
5c22af5956b42c Gabriele Monaco 2025-07-31  124  		/*
5c22af5956b42c Gabriele Monaco 2025-07-31  125  		 * Required for find_task_by_vpid, make sure the caller doesn't
5c22af5956b42c Gabriele Monaco 2025-07-31  126  		 * need to get_task_struct().
5c22af5956b42c Gabriele Monaco 2025-07-31  127  		 */
5c22af5956b42c Gabriele Monaco 2025-07-31  128  		guard(rcu)();
5c22af5956b42c Gabriele Monaco 2025-07-31 @129  		*p = find_task_by_vpid(pid);
5c22af5956b42c Gabriele Monaco 2025-07-31 @130  		if (unlikely(!p))
5c22af5956b42c Gabriele Monaco 2025-07-31  131  			return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  132  	}
5c22af5956b42c Gabriele Monaco 2025-07-31  133  
5c22af5956b42c Gabriele Monaco 2025-07-31  134  	return new_policy & ~SCHED_RESET_ON_FORK;
5c22af5956b42c Gabriele Monaco 2025-07-31  135  }
5c22af5956b42c Gabriele Monaco 2025-07-31  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
