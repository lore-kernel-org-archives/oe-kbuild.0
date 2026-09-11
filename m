Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB042F70E
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122418; cv=none; b=g2jY3zaE/9nmGL/8GE5wc+HukpSRx5PWrqAPx/orUeyeY+S9hYTW77cut5y+G9pN+LAo1viwzaE2St/+KcYCXtks7Qm1jC7fQDiLh9AU+JYK/McYduoDL4fCFMuONeLsTALQIyTLTP8ZMsJPTD0xkrhQJ9NFceqBcjh4oDbL+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122418; c=relaxed/simple;
	bh=tJa01iFEuEv8VMXJwHLfLwjptG9gW8Lxj39Mlq06rsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNRQ96hnbJcNhPrF3IpXGOeJQV2g49rCyOIi5hlaZME+XkGvv4qQzRpK7Pte7ntsy1PoqgOaYDfbV43L3hiaNWg16i3X/6/6ykOB8pZOhbdbJ/TVuS6uzQs+zw0g9OQ1GRIJOR4iWpftxsqMAbRkqrYTZh/qKdaDq7pzGv3Jz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcQrL/nc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcQrL/nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789122411; x=1820658411;
  h=date:from:to:cc:subject:message-id;
  bh=tJa01iFEuEv8VMXJwHLfLwjptG9gW8Lxj39Mlq06rsE=;
  b=fcQrL/nccAK0rZ69u3SKeXyIK9yUDsR8XcTuzomoG4KvkPx6OAHdIvDf
   I0azWS1WmdeQGMCjvVDAtntRlKkyBAz4g0Lgb0xJ+c9Rd65Adg9R09sF5
   k3/M8OLn5HRhIHkymuZqW6tShs3t/vuIy6QWno301yNvkI/QAtZgEhmj2
   EnmafvAR55zoWqgBWkV0LKMBcJZEcnKK+b9287J2UP0Ieowi+3KF7zNU4
   +facHG9fQR2VpXzE6N93FaoRiMVzNCAAxkh2zIH1zyeHp5A/Ws6lpIfKB
   JLjOs/0oWP5WG/xH1E4w1EiE8PTZb7/nOGzigPviSczeAn6zdZXGR/OgZ
   Q==;
X-CSE-ConnectionGUID: F9nE3HwdQiumzxORs1I9WQ==
X-CSE-MsgGUID: x+AFMmXLRS2W/XIeUHk9yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89455965"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89455965"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:26:49 -0700
X-CSE-ConnectionGUID: e1n8see2RNu5zmIQka8f9A==
X-CSE-MsgGUID: aSDL51p+Tluj/wuHTHvCTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="273819632"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2026 03:26:48 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ySV-000000001Q6-2hZN;
	Fri, 11 Sep 2026 10:26:27 +0000
Date: Fri, 11 Sep 2026 18:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer
 operation overflow
Message-ID: <202609111829.XdAVYnfs-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260911/202609111829.XdAVYnfs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111829.XdAVYnfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111829.XdAVYnfs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1633:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex.c:1660:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
--
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
