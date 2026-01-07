Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82032C0F81
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773798; cv=none; b=SVaSQRbKg823hvaX8X4CLV+nFPAojPah/X15+lYLaCxouE6gVIftScpOoPc2d/gHpj+xL48JHU99mtPu/dReZitecjd6FhVkxBIqIa1Qt/u//EDqm34sdFlZLJljST9++CwvUiR6Tvc8hhFd0VZ/HrKv3UMn6u0dS6tedvZiKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773798; c=relaxed/simple;
	bh=olLYfM38XMn6Ijx+uVLlJzXcjYOcIOn6BxuwLBCFb0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MtQOMREZjAOGXvxwz7RnFkelipZ7RL5k6/iNgMPZ5+QY0Ie3e6W2pIcASDlAKv7cuTnH2IT+6Nws+tjjH3/8iM54D8dTsHEz6oxXoUubfXHDu5AMl4ACiYxB0yZlJIW2EVpddtVFZ89yzZCz28USZqH3ZSLTV8ITQAu1i06Fizs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB3F0p+R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB3F0p+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767773794; x=1799309794;
  h=date:from:to:cc:subject:message-id;
  bh=olLYfM38XMn6Ijx+uVLlJzXcjYOcIOn6BxuwLBCFb0c=;
  b=iB3F0p+Ru6pnuu557GZcn2vKN/TVk5+wBOVV7ifCFIBYtItQ1xc9PZv6
   M1Biccc4jDcmmygWCRwkzI2jZgbNS6DnqszRvm6ftBfZBM5PpysPGHkjU
   O/afnCpLY0kqq+jKgIjkEILIzP4lJIdYjuCezWNF/w7DFOTAtaDPUA901
   CbLotWmqWJFSWEr5xxZNLmIs++u6twm8UV/wdaGrhPPVgRbmZkeKpyy88
   nTmtH1TQ6liSkQBV7Unq+CNFlmM0i03vK4kyFcjhyX0+W36b4FtgWUu7E
   16Xe687MQQ1um3UuoTKL6oiov8IWpXVq9Dhi+B0Vpe+R3ilSBQsboJ1hj
   w==;
X-CSE-ConnectionGUID: Gd1Tcf8SQYq3PbtU/LMvtQ==
X-CSE-MsgGUID: xFaHyNHhQhqq3sExfv/Cgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69073294"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="69073294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 00:16:31 -0800
X-CSE-ConnectionGUID: WN73DE+tR1mTJTOoOMUE2w==
X-CSE-MsgGUID: HmCgbQXsTOakqOku0x6SFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202624569"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2026 00:16:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdOiQ-000000003aH-1V1c;
	Wed, 07 Jan 2026 08:16:26 +0000
Date: Wed, 07 Jan 2026 16:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 11/40] lib/test_context-analysis.c:90
 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
Message-ID: <202601071614.Z07lwkJA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 [11/40] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r073-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071614.Z07lwkJA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601071614.Z07lwkJA-lkp@intel.com/

smatch warnings:
lib/test_context-analysis.c:90 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:114 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'

vim +90 lib/test_context-analysis.c

f16a802d402d73 Marco Elver 2025-12-19   74  
f16a802d402d73 Marco Elver 2025-12-19   75  TEST_SPINLOCK_COMMON(raw_spinlock,
f16a802d402d73 Marco Elver 2025-12-19   76  		     raw_spinlock_t,
f16a802d402d73 Marco Elver 2025-12-19   77  		     raw_spin_lock_init,
f16a802d402d73 Marco Elver 2025-12-19   78  		     raw_spin_lock,
f16a802d402d73 Marco Elver 2025-12-19   79  		     raw_spin_unlock,
f16a802d402d73 Marco Elver 2025-12-19   80  		     raw_spin_trylock,
f16a802d402d73 Marco Elver 2025-12-19   81  		     TEST_OP_RW);
f16a802d402d73 Marco Elver 2025-12-19   82  static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data *d)
f16a802d402d73 Marco Elver 2025-12-19   83  {
f16a802d402d73 Marco Elver 2025-12-19   84  	unsigned long flags;
f16a802d402d73 Marco Elver 2025-12-19   85  
f16a802d402d73 Marco Elver 2025-12-19   86  	if (raw_spin_trylock_irq(&d->lock)) {
f16a802d402d73 Marco Elver 2025-12-19   87  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19   88  		raw_spin_unlock_irq(&d->lock);
f16a802d402d73 Marco Elver 2025-12-19   89  	}
f16a802d402d73 Marco Elver 2025-12-19  @90  	if (raw_spin_trylock_irqsave(&d->lock, flags)) {
f16a802d402d73 Marco Elver 2025-12-19   91  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19   92  		raw_spin_unlock_irqrestore(&d->lock, flags);
f16a802d402d73 Marco Elver 2025-12-19   93  	}
f16a802d402d73 Marco Elver 2025-12-19   94  	scoped_cond_guard(raw_spinlock_try, return, &d->lock) {
f16a802d402d73 Marco Elver 2025-12-19   95  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19   96  	}
f16a802d402d73 Marco Elver 2025-12-19   97  }
f16a802d402d73 Marco Elver 2025-12-19   98  
f16a802d402d73 Marco Elver 2025-12-19   99  TEST_SPINLOCK_COMMON(spinlock,
f16a802d402d73 Marco Elver 2025-12-19  100  		     spinlock_t,
f16a802d402d73 Marco Elver 2025-12-19  101  		     spin_lock_init,
f16a802d402d73 Marco Elver 2025-12-19  102  		     spin_lock,
f16a802d402d73 Marco Elver 2025-12-19  103  		     spin_unlock,
f16a802d402d73 Marco Elver 2025-12-19  104  		     spin_trylock,
f16a802d402d73 Marco Elver 2025-12-19  105  		     TEST_OP_RW);
f16a802d402d73 Marco Elver 2025-12-19  106  static void __used test_spinlock_trylock_extra(struct test_spinlock_data *d)
f16a802d402d73 Marco Elver 2025-12-19  107  {
f16a802d402d73 Marco Elver 2025-12-19  108  	unsigned long flags;
f16a802d402d73 Marco Elver 2025-12-19  109  
f16a802d402d73 Marco Elver 2025-12-19  110  	if (spin_trylock_irq(&d->lock)) {
f16a802d402d73 Marco Elver 2025-12-19  111  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  112  		spin_unlock_irq(&d->lock);
f16a802d402d73 Marco Elver 2025-12-19  113  	}
f16a802d402d73 Marco Elver 2025-12-19 @114  	if (spin_trylock_irqsave(&d->lock, flags)) {
f16a802d402d73 Marco Elver 2025-12-19  115  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  116  		spin_unlock_irqrestore(&d->lock, flags);
f16a802d402d73 Marco Elver 2025-12-19  117  	}
f16a802d402d73 Marco Elver 2025-12-19  118  	scoped_cond_guard(spinlock_try, return, &d->lock) {
f16a802d402d73 Marco Elver 2025-12-19  119  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  120  	}
f16a802d402d73 Marco Elver 2025-12-19  121  }
f16a802d402d73 Marco Elver 2025-12-19  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
