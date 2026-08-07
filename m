Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFD3812F0
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139955; cv=none; b=XyeH6YQLYXfRzouvoHrc8eBoncevapwQ4tJ8/vaTIjSSNyqYBr9Ca7R+8nrA5abKQdx0wLNd1E7zCWa/BUZKCTb0Ao4YUYRJFPIvPw/0yEpwxHhK5BdEZ5eUkN7jcvTeso8GVmG+EonV/F2JifK7cBkOHR4NJ7meGSxTPp2Nw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139955; c=relaxed/simple;
	bh=SM3FStNFi/EmgtLM9jiEjO6ee4i8H8WDSJPVXBakHGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eKFKsm+fN+jKEsldYgiykzKB+Q1ol1HPFjT4PQgCVhDHD0fiE2h/CECBAIQUZS6wSABkrrPix4tNXhDt53swIOtmlCgdPk3yqwiPyr6KAdEEq7hC3QlSJLWjXg4p4DjtHg/zi0CwmTBlQgACOKHHtcte6dThffWGd10+HYC0gyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBBv63nZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBBv63nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786139954; x=1817675954;
  h=date:from:to:cc:subject:message-id;
  bh=SM3FStNFi/EmgtLM9jiEjO6ee4i8H8WDSJPVXBakHGQ=;
  b=KBBv63nZjaZmSESuAcnY1kJpqWTkUvyJtC7TL/nS4/diCYTxEqJnoBCc
   piYxopoEZ2xj8viYXx/9jhUugkid7QXDuqk34/8GO0A9G1VuLoqBJoKTU
   5MP0FnIRBJQzjOPT6O0lVldyW5XpsLYVTwMG0nyZj0UoJ21CQr0HMyw5A
   A4CfbVv3GJiic/E1I39nXBzX6qRF5P9bXk9aToEuYB7hCUXNTNCpDAeQH
   EJLNdaiLrK8EKBESjVDIDgC2V3+33dWCS55pogoflORdR/LUIINfDD5sN
   En8s/JGNie0kedWEdFybAuJ6X2H94AHryHiXcfyekMIQMeV5+8heI6o9H
   g==;
X-CSE-ConnectionGUID: 883kyijYSuW0vA3xSsERRg==
X-CSE-MsgGUID: YeDdoXaYTfW2X1dPkiO4pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86832727"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86832727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 14:59:14 -0700
X-CSE-ConnectionGUID: uHGcHmLHR1CAusjxQCUvzw==
X-CSE-MsgGUID: Xjg9EfWjRKS37+7IA3FrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259887441"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 14:59:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsSar-00000000JMM-3CIx;
	Fri, 07 Aug 2026 21:59:09 +0000
Date: Sat, 08 Aug 2026 05:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/test_context-analysis.c:114
 test_spinlock_trylock_extra() warn: mixing irq and irqsave
Message-ID: <202608080540.g9LgU6ec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f008280327ba5ad132965abab0c7846283cef0c
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 locking/rwlock, spinlock: Support Clang's context analysis
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-r073-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080540.g9LgU6ec-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f16a802d402d ("locking/rwlock, spinlock: Support Clang's context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080540.g9LgU6ec-lkp@intel.com/

New smatch warnings:
lib/test_context-analysis.c:114 test_spinlock_trylock_extra() warn: mixing irq and irqsave

Old smatch warnings:
lib/test_context-analysis.c:90 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'

vim +114 lib/test_context-analysis.c

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
