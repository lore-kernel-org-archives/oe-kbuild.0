Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7BD34752E
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205354; cv=none; b=YD0+gCnZysTpO69G4ZtVaOYJDDy5Hn13taawi689OlEoLQ8C6LVvSw/DBTuPox76Ycc3f3dVqyD8hry3Xma9Dn5VLEZduhvGUpZgEPqzONm4BYgMrUg6rsrgRbY6aXQ6c0PokBi1fGG59E2JJJYNIMGhBuRaqfe2BIs17BRAtu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205354; c=relaxed/simple;
	bh=3uJacYMFNiEVNa5+4BrKjE86Ng2HjMP54/UM6y12Jwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/9mefN5PQ8TPrEbKSN1WdZfRe3J0xRX2IIpjbItkRZSRBSpywT8lgF1qjQVfLyeJh0yIvPRKuSGdyw5FLsdzezScMkfoTcFMJsZ5VBh4GSGmcYawyGMhOr+JPZDl1qifk1N2HcttdElcFGsu4lqCH5wUbHzhEZf8j21ofTB6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6kX7iRH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6kX7iRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789205352; x=1820741352;
  h=date:from:to:cc:subject:message-id;
  bh=3uJacYMFNiEVNa5+4BrKjE86Ng2HjMP54/UM6y12Jwc=;
  b=n6kX7iRHEnORWZY5jo+4iGlmkbTucC2kZAAYItn9Bm4DhAuTHYrUbBp/
   ASbkU8sB6BUK4zAsPCZfeWf2315tdws2NF0NP5k0fZFRCMxJnKFmsPuCf
   e4ExWW41zYsJ1O2tC4fRanP4jErbEYwpmNmVr6iGfQ6nB+jYSzPnFhMxV
   sw1pnRjGMHJAC/YLOReVqkHkB28GB13/gyM5A8sD33kw5zT9p+/0trBks
   5vTzUka9RllmO70PSLFa6lhK1qfKUy2k+8uj8wI14puVfxMyTbdAqALhe
   FOEQsKEWZ7iTuLrLmqBI1wWe9RoVemt18pWB3BOF5vyV4IoEgrP6zS0iF
   A==;
X-CSE-ConnectionGUID: aawj5BniThW/Hn0CuOb9Uw==
X-CSE-MsgGUID: 5Yi0RrjbTpqWtTKowyvsKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="88594813"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="88594813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 02:29:11 -0700
X-CSE-ConnectionGUID: kkvfWyk4TQyMUiCj7wz7ww==
X-CSE-MsgGUID: 6v+0LA4SRminEHq5aqyeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="267859502"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2026 02:29:10 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5K2m-000000002ol-0sXT;
	Sat, 12 Sep 2026 09:29:08 +0000
Date: Sat, 12 Sep 2026 17:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer
 operation overflow
Message-ID: <202609121755.OxG6ug0n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7542d32487b53ed1a59d02f013a6e6b66804c874
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [1/1] arm64: Allow to enable PREEMPT_RT.
:::::: branch date: 3 days ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260912/202609121755.OxG6ug0n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121755.OxG6ug0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609121755.OxG6ug0n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/spinlock_rt.c: note: in included file:
   kernel/locking/rtmutex.c:1835:17: sparse: sparse: context imbalance in 'rtlock_slowlock_locked' - unexpected unlock
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:78:14: sparse: sparse: context imbalance in 'rt_spin_unlock' - unexpected unlock
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:210:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:224:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file:
   kernel/locking/rwbase_rt.c:133:28: sparse: sparse: context imbalance in 'rt_read_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:238:14: sparse: sparse: context imbalance in 'rt_write_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:249:14: sparse: sparse: context imbalance in 'rt_write_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:260:14: sparse: sparse: context imbalance in 'rt_read_unlock' - unexpected unlock
   kernel/locking/spinlock_rt.c:269:14: sparse: sparse: context imbalance in 'rt_write_unlock' - unexpected unlock
--
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1633:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex.c:1660:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow

vim +31 arch/arm64/include/asm/atomic_lse.h

c09d6a04d17d73 Will Deacon  2015-02-03  28  
78f6f5c994ed22 Mark Rutland 2022-08-17  29  static __always_inline void __lse_atomic_sub(int i, atomic_t *v)
ef53245060989d Mark Rutland 2021-12-10  30  {
ef53245060989d Mark Rutland 2021-12-10 @31  	__lse_atomic_add(-i, v);
ef53245060989d Mark Rutland 2021-12-10  32  }
ef53245060989d Mark Rutland 2021-12-10  33  

:::::: The code at line 31 was first introduced by commit
:::::: ef53245060989d1cbe4b72ba56e94f217f4fd1ee arm64: atomics lse: define SUBs in terms of ADDs

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
