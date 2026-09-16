Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FFE4EBAC5
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558182; cv=none; b=hydk14TjNRWuCLt90tR1Yu9KPrxpFn1me8cSpeDFiTBUJhKlKneb9PHxFx0LxWMofQTWvKQ2sNIynpiX+owAynwxUezo2MxTSAZPYs5vRoruFPdM0KDTMG6O7aQmFWlqcF4O1D5XqV382tf1SIiuQiM7nMk2YoN25WBcv/MfO3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558182; c=relaxed/simple;
	bh=fSGIJ/ZXLJ90N3giqPF3wgr8wU+sRaDXK2kVUd/8ntM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOGI8q74CcQxwXVitVWmw6ZnwBvR0GEKmLO460MRjRTJjBlxb8MWmR7OJf6rtNXs7xG+8jlKhNy68cMRNauqYuyytsLtoVPn/q9RQFlFSGy0+blSf5iLwa4R5EPEvL6g2UE8+ZEy6hDnNuNa7zks0SDXM0LkeXSA3gRFVwCivOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HREXsNla; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HREXsNla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789558169; x=1821094169;
  h=date:from:to:cc:subject:message-id;
  bh=fSGIJ/ZXLJ90N3giqPF3wgr8wU+sRaDXK2kVUd/8ntM=;
  b=HREXsNlazblj0WaI1UTnlpPQF1d9DkuzV7UsEZ28cnAsF/ykk0boTAKJ
   kWBO/sFi/txrVfbL2x+9xfhnBtqd9uH3UAUXNSog2klKGdlihFvBES6Fb
   3Cedm6Hma9mIK9ohzmFilI0FzPEDDrzvE8cT6ykHjqBmWQYNevbZ1xr41
   er/kJIwC4kxitkyRp3sjUSZbowVxVM1AQ3ly68faYsIsJYXC/w7QdU5QM
   9eDr/SvwZVgMe/9tvwjabhp3Ir+EV4kMgT3egmanAVF4AZdwB+dkawMX5
   kzeHFJIV2SN6GOVEttDL/03uSeRLcnaBPTflmAmgsX913oPZbNHO4TZEH
   Q==;
X-CSE-ConnectionGUID: xfoPMzNLQXK7lzV2D0Wtwg==
X-CSE-MsgGUID: DadcXx4wRf2L6A4h8QGgBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92438728"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92438728"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:29:23 -0700
X-CSE-ConnectionGUID: xTM2PgTATb2BCxo9+QnJYA==
X-CSE-MsgGUID: aaR7iidjTj2MYylth/+FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1536539"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 16 Sep 2026 04:29:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6npH-000000005w9-47hz;
	Wed, 16 Sep 2026 11:29:19 +0000
Date: Wed, 16 Sep 2026 19:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer
 operation overflow
Message-ID: <202609161959.xHz0vMaL-lkp@intel.com>
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
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [1/1] arm64: Allow to enable PREEMPT_RT.
:::::: branch date: 5 days ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260916/202609161959.xHz0vMaL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161959.xHz0vMaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609161959.xHz0vMaL-lkp@intel.com/

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

c09d6a04d17d730 Will Deacon  2015-02-03  28  
78f6f5c994ed22a Mark Rutland 2022-08-17  29  static __always_inline void __lse_atomic_sub(int i, atomic_t *v)
ef53245060989d1 Mark Rutland 2021-12-10  30  {
ef53245060989d1 Mark Rutland 2021-12-10 @31  	__lse_atomic_add(-i, v);
ef53245060989d1 Mark Rutland 2021-12-10  32  }
ef53245060989d1 Mark Rutland 2021-12-10  33  

:::::: The code at line 31 was first introduced by commit
:::::: ef53245060989d1cbe4b72ba56e94f217f4fd1ee arm64: atomics lse: define SUBs in terms of ADDs

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
