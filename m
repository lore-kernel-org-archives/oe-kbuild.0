Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A414C98
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758686045; cv=none; b=Vg04JFenc/D+d6kG2GJidEzfNuaVBECIuSRkS28wWUUB+xat8M/fZd534ZmJr/w63iF575tWEpOdXDzq1AVbhvMlNgf0Mp9mgreOleBcptR9qw4rtr9Sm0XjCcvRstX7k6hTOT2mQUxKYDEGdpEYfCJbHhrf23+2NgLE/e+YsTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758686045; c=relaxed/simple;
	bh=+ys9I38DOfwoKHfTnPu96ZZgm7PtWsS2Gmx4YH9BhK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8yXnerpAslFLbFt75KQ1hACAnZwCdzhdKXB0b7v60c0cpoWEPLkcJZHx3RuJ0Fu9EQZHL1Q2TR4/M+/k3hgYQz28HLeoppYSdgBfRoPaYEDqDyVNcUE/vgHM4v9Lzn7DfyiuQqRx/A7RShSyzHZ8G9D6WmebC/2AmCzizfylBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDx44o85; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDx44o85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686043; x=1790222043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ys9I38DOfwoKHfTnPu96ZZgm7PtWsS2Gmx4YH9BhK8=;
  b=TDx44o859mYX7RzqCptoTwl3KKsTtyScJXOCPoTG6IPQasHhnQbyBnWY
   kpcf/PkC/ic3KS4clWDjn7SRa5BDwGIKKcM2y5nTCjAEbD6+UmSoxMZGj
   6O6n4mbLVrmAvZ4V77w5OP0j3SjYZPNF0x1dSxzhiP+pvrIlz9ZzvuWyY
   mGxGLP/MwbAJDaLQc3FDC4sjP5e3/9RHsSXhHLVPXfWykVo/0LLFGN2nv
   41ScfEUyr2Ncjc7wYloA3827d5NEEUOtvg/fFlWuKEbc6i2aCfsXSoD/K
   XqC0fG4VNS3Hzm36CUv8ya46b+2jQgnxXyrKqYzpiHQpCFbD+9937+n2K
   A==;
X-CSE-ConnectionGUID: VJS2sbAdSqW5poAjcXBoBQ==
X-CSE-MsgGUID: PSXxfYPjTXK2lsqIyxXHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61032563"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="61032563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:54:02 -0700
X-CSE-ConnectionGUID: LhcPG3EdS6iCZBHy+AdDKw==
X-CSE-MsgGUID: Vc/VQPYBQyWKS8sZ5jBdLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="177322330"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2025 20:54:01 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1GZX-0003mL-0x;
	Wed, 24 Sep 2025 03:53:43 +0000
Date: Wed, 24 Sep 2025 11:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/35] lib/test_capability-analysis.c:125
 test_spinlock_trylock_extra() error: uninitialized symbol 'flags'.
Message-ID: <202509241125.8lkyg6o7-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   b57fd8af63116c56536eb40f04dbe4f2206ec4ed
commit: 32b884d94862a5295719faf9e1c3b5eef162cca4 [23/35] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250924/202509241125.8lkyg6o7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509241125.8lkyg6o7-lkp@intel.com/

New smatch warnings:
lib/test_capability-analysis.c:125 test_spinlock_trylock_extra() error: uninitialized symbol 'flags'.

Old smatch warnings:
lib/test_capability-analysis.c:101 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:542 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_capability-analysis.c:125 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:581 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:230 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:262 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:270 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/flags +125 lib/test_capability-analysis.c

821a2ecb55c76ae Marco Elver 2025-01-23  107  
821a2ecb55c76ae Marco Elver 2025-01-23  108  TEST_SPINLOCK_COMMON(spinlock,
821a2ecb55c76ae Marco Elver 2025-01-23  109  		     spinlock_t,
821a2ecb55c76ae Marco Elver 2025-01-23  110  		     spin_lock_init,
821a2ecb55c76ae Marco Elver 2025-01-23  111  		     spin_lock,
821a2ecb55c76ae Marco Elver 2025-01-23  112  		     spin_unlock,
821a2ecb55c76ae Marco Elver 2025-01-23  113  		     spin_trylock,
821a2ecb55c76ae Marco Elver 2025-01-23  114  		     TEST_OP_RW);
821a2ecb55c76ae Marco Elver 2025-01-23  115  static void __used test_spinlock_trylock_extra(struct test_spinlock_data *d)
821a2ecb55c76ae Marco Elver 2025-01-23  116  {
821a2ecb55c76ae Marco Elver 2025-01-23  117  	unsigned long flags;
821a2ecb55c76ae Marco Elver 2025-01-23  118  
821a2ecb55c76ae Marco Elver 2025-01-23  119  	if (spin_trylock_irq(&d->lock)) {
821a2ecb55c76ae Marco Elver 2025-01-23  120  		d->counter++;
821a2ecb55c76ae Marco Elver 2025-01-23  121  		spin_unlock_irq(&d->lock);
821a2ecb55c76ae Marco Elver 2025-01-23  122  	}
821a2ecb55c76ae Marco Elver 2025-01-23  123  	if (spin_trylock_irqsave(&d->lock, flags)) {
821a2ecb55c76ae Marco Elver 2025-01-23  124  		d->counter++;
821a2ecb55c76ae Marco Elver 2025-01-23 @125  		spin_unlock_irqrestore(&d->lock, flags);
821a2ecb55c76ae Marco Elver 2025-01-23  126  	}
821a2ecb55c76ae Marco Elver 2025-01-23  127  	scoped_cond_guard(spinlock_try, return, &d->lock) {
821a2ecb55c76ae Marco Elver 2025-01-23  128  		d->counter++;
821a2ecb55c76ae Marco Elver 2025-01-23  129  	}
821a2ecb55c76ae Marco Elver 2025-01-23  130  }
821a2ecb55c76ae Marco Elver 2025-01-23  131  

:::::: The code at line 125 was first introduced by commit
:::::: 821a2ecb55c76aebb2a5fc53c7a49c2bc21a59af locking/rwlock, spinlock: Support Clang's capability analysis

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Marco Elver <elver@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
