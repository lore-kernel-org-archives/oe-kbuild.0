Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC6944F
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772069599; cv=none; b=l0RJgKLHN4ePKJS+rXJy8pSt+RShNNHEv5IjFVqSxPyzlGACQkzWQcnzSUgSpSMGlH/tAHmUtg6beEYBAjbbrs0Kc9E0NKaWdKagum5s0r0MZDOFuRHCP2MaNq7GS6xN/14U0KlgpjTbldFlmHjSK2dO/IWnuzAXuml9RCvojQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772069599; c=relaxed/simple;
	bh=FdOQ/yJYFuP8OWtJQ953cJ+R7wGi9LVUWIMNyZgGqhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYsQ4tD/uNVTtYPjKfzdttDddnGbkHu4MsH5UQoXaUJvcSBH0QxcW6CJCEjmsQyErQhnBC81bbFOuwoXmXO+uQHeOSBbJ37KnFZdikStHw/+/FIBjHKSQ4W7rc/UCTPdWT+Ey1C0SFsypCJHP5RrpU1QvAAnko28WaOcSEGZtRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMAa7B2b; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMAa7B2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772069596; x=1803605596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdOQ/yJYFuP8OWtJQ953cJ+R7wGi9LVUWIMNyZgGqhU=;
  b=VMAa7B2bRBaWF4cLupmlj0xo5z3IEgA0UWXCG7zT2mFs9Pfi8CJx+TYO
   XlSeyMZ3i0w6I7oNYNy3Bq7Mf2IvhG+UZ+bfhaxO3tqmIMfEAiwenIM9J
   PAY0VjQzT0frAHtJ2zhe1O4e5Siuk09f9+VQtDT5qyYWi1d8uqv8/1uwj
   FiBJ+MJcZ+Jg7Skw0e7E12RXCDJMdN8ZYk4jJj0Q78Q6BvaSWs1rEyF6V
   5pvlSjJITBfn5SwJlKH8wK0dKIAnwWXLZ80EsTwYHei5cIIvzOI+NMZvc
   Wz3cT42PHXWIA1JWLZVXCmQyLtj2/YfqPupcTTjB/CC+ujel3rzvx/61x
   A==;
X-CSE-ConnectionGUID: HfCZo624Q72nk86J5v0QuA==
X-CSE-MsgGUID: 8HO3ywg9TTeUdlDFJJ5/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84579633"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="84579633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 17:33:16 -0800
X-CSE-ConnectionGUID: 8I91wOsXR6CPTdSDQqxQZw==
X-CSE-MsgGUID: 16Uq/r/OTp+wdOzWxm354g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="244074778"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Feb 2026 17:33:15 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvQFc-000000007mP-43IN;
	Thu, 26 Feb 2026 01:33:12 +0000
Date: Thu, 26 Feb 2026 09:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
Message-ID: <202602260953.fsEEuYsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260225131931.60724-25-dev@lankhorst.se>
References: <20260225131931.60724-25-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-gfx@lists.freedesktop.org

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on next-20260225]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260226-012447
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260225131931.60724-25-dev%40lankhorst.se
patch subject: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-r131-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260953.fsEEuYsa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260953.fsEEuYsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602260953.fsEEuYsa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/rwsem.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
--
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/atomic.h, include/linux/cpumask.h, include/linux/smp.h, ...):
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow

vim +74 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  72  
4650d02ad2d9b2 Palmer Dabbelt 2017-11-14  73  ATOMIC_OPS(add, add,  i)
4650d02ad2d9b2 Palmer Dabbelt 2017-11-14 @74  ATOMIC_OPS(sub, add, -i)
4650d02ad2d9b2 Palmer Dabbelt 2017-11-14  75  ATOMIC_OPS(and, and,  i)
4650d02ad2d9b2 Palmer Dabbelt 2017-11-14  76  ATOMIC_OPS( or,  or,  i)
4650d02ad2d9b2 Palmer Dabbelt 2017-11-14  77  ATOMIC_OPS(xor, xor,  i)
fab957c11efe2f Palmer Dabbelt 2017-07-10  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
