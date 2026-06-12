Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CB19CD1D
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781232436; cv=none; b=VkuZ9R7CQIklqnmEOoWZ3aznsLRn1B5vRMXjPAyrT6+haMBEb6PnUd6KbRdYbhL8Kh9//avyJcHs3tIWixvprFPk1CfOLf+So0uimn73nPJYMmMFjZ2xkTK8tptTkQw7u0DPcICf4z32WYEk/B2UFLtqdjQPgLnGkEZbpBJah5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781232436; c=relaxed/simple;
	bh=2FdE2T9ooqCEurvHfusljRq498Sp3mKpjB7sHsfDycc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPmKFFWRsHaWDk0WcwWr0Uk4EUo14YUDXdIA+Fd1Mo6WZJ1w5UjHFjcLhyl1kM8u+xqvym+M7TmmDNcjrxYNfqyXwiKy8Insknrdpuuv9KrHqKp9HPNMVlb3JuHUR/ATvwmX08evz02RbBkUn0sOj+USpUAgULRBmQG0VKCwzjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDp0e327; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDp0e327"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781232435; x=1812768435;
  h=date:from:to:cc:subject:message-id;
  bh=2FdE2T9ooqCEurvHfusljRq498Sp3mKpjB7sHsfDycc=;
  b=cDp0e327u7zbL45eB0TDgSd6stDtxkj/h5ymQyTdo4yVcugyNgrjtfp2
   7twu3wAflD47VCAkUkrbXkUdROHpObBDvmFs301+V7EVHiYdy8aiHhbYH
   HH2+KrUZaBGbE5dvJ8MuvbZu53OAH4ykXI8LufCAl96H2JQ/dputJm8mK
   74Wwwldby5YRIq8jBK2ecO7GjtblP+Afj1Sf5kgjwEBFWNqkFUei4q3aH
   pgn1Spy/OGzJijtkc6Ft8MyvFsN62Z4zccFQ7NSAKUvuX+8maPCMQdtvm
   KiZL1AcsIFvNLTVFsqpNeJcpuORR+4G7sRPEj8S7Tv5WvixMX48/4WoUY
   Q==;
X-CSE-ConnectionGUID: OX3Rou78Si2Mm7coiMDpkg==
X-CSE-MsgGUID: MpfDxfjkQv6LpD3w79Y8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93551625"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93551625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:47:14 -0700
X-CSE-ConnectionGUID: iFfeEdELQyqbIdn+e6VwGg==
X-CSE-MsgGUID: HUh6IA5ESwS0XZqmsPxerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="245806850"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2026 19:47:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrvJ-00000000OCb-3ux6;
	Fri, 12 Jun 2026 02:47:09 +0000
Date: Fri, 12 Jun 2026 10:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 11/43] lib/test_context-analysis.c:90
 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
Message-ID: <202606121053.UIaYGcgP-lkp@intel.com>
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
head:   a837dd95e841586c3a6bbe41c41843b392a1b725
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 [11/43] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: csky-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121053.UIaYGcgP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606121053.UIaYGcgP-lkp@intel.com/

New smatch warnings:
lib/test_context-analysis.c:90 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:114 test_spinlock_trylock_extra() warn: mixing irq and irqsave

vim +90 lib/test_context-analysis.c

f16a802d402d73 Marco Elver 2025-12-19  74  
f16a802d402d73 Marco Elver 2025-12-19  75  TEST_SPINLOCK_COMMON(raw_spinlock,
f16a802d402d73 Marco Elver 2025-12-19  76  		     raw_spinlock_t,
f16a802d402d73 Marco Elver 2025-12-19  77  		     raw_spin_lock_init,
f16a802d402d73 Marco Elver 2025-12-19  78  		     raw_spin_lock,
f16a802d402d73 Marco Elver 2025-12-19  79  		     raw_spin_unlock,
f16a802d402d73 Marco Elver 2025-12-19  80  		     raw_spin_trylock,
f16a802d402d73 Marco Elver 2025-12-19  81  		     TEST_OP_RW);
f16a802d402d73 Marco Elver 2025-12-19  82  static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data *d)
f16a802d402d73 Marco Elver 2025-12-19  83  {
f16a802d402d73 Marco Elver 2025-12-19  84  	unsigned long flags;
f16a802d402d73 Marco Elver 2025-12-19  85  
f16a802d402d73 Marco Elver 2025-12-19  86  	if (raw_spin_trylock_irq(&d->lock)) {
f16a802d402d73 Marco Elver 2025-12-19  87  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  88  		raw_spin_unlock_irq(&d->lock);
f16a802d402d73 Marco Elver 2025-12-19  89  	}
f16a802d402d73 Marco Elver 2025-12-19 @90  	if (raw_spin_trylock_irqsave(&d->lock, flags)) {
f16a802d402d73 Marco Elver 2025-12-19  91  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  92  		raw_spin_unlock_irqrestore(&d->lock, flags);
f16a802d402d73 Marco Elver 2025-12-19  93  	}
f16a802d402d73 Marco Elver 2025-12-19  94  	scoped_cond_guard(raw_spinlock_try, return, &d->lock) {
f16a802d402d73 Marco Elver 2025-12-19  95  		d->counter++;
f16a802d402d73 Marco Elver 2025-12-19  96  	}
f16a802d402d73 Marco Elver 2025-12-19  97  }
f16a802d402d73 Marco Elver 2025-12-19  98  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
