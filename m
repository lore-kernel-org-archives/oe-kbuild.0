Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070242949E0
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185101; cv=none; b=LO3l0RcEY9X1i1FAOhPRO7PI79gqdW8BscQ7d9dDNwHl4hY4L563XXa9tHTz4eEnZ3PgndYFfdVVNnpSK7xqwjFgjb/iPuPKVve9tT3zVFlZwVtY25qX1cO+zEG4sqNJjOwvx2n6fbBzhMUd6Lln+kLp61yjRtofORnr9nQuUj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185101; c=relaxed/simple;
	bh=sgw+OpW1DNKsPthSYM4nAQQAcVfziwla9KOspY9/M40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=buBkVM0Q9w4hzlo/3cnOKZ8Vf09WXgVo8EdBh+Az5ediBfQY2LSGenHtY3XQqWU/ECeu9K5js7ZmHD+8oGFbohj2vJTN//1fO2MCbSSxEHh5MeJOp4m4W/DImXCdJ25ngxLzehlUuWc5VMQWZ7gC4d4yZ1Pp9EHSiv2wTTAITKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep6Innat; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep6Innat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776185100; x=1807721100;
  h=date:from:to:cc:subject:message-id;
  bh=sgw+OpW1DNKsPthSYM4nAQQAcVfziwla9KOspY9/M40=;
  b=Ep6InnatfQt/5lCqmokcSBjBSifo7Bq5zA6pff3iGpfBKMeKIFCsR0mk
   xq43YEatWr28fqs60evwcfRnsjFX8ygQLjL039fcRNw3mlKNxnc2RhAuM
   dF3eJL/yVePn1mWpkcZpc8k7tuqBVfrh5ZaJileRrbmKD1Ov2waK6QpPR
   XF+C83AZq0tj12DaQSPvDWy4dOIiVzmzUyEws68vfRi8Mb0e/EbyJiV99
   v7h3yavZkzpNuhHufnWWR21XvmXTvrXHt9Omw8s2cMAGjFzQOYW8heKYy
   78Y7nvaHOaBF+rziTb/+sQuhrwHnqp+03/6WMaR0yX1Yp5CNIt93fZk/T
   w==;
X-CSE-ConnectionGUID: /ynVYXKyQYCYE+tRJqZCLg==
X-CSE-MsgGUID: MeupKERmRPSjphPEdMCL8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99793456"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99793456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:44:59 -0700
X-CSE-ConnectionGUID: qkeY+TozSPG7ZtTqnoZeGA==
X-CSE-MsgGUID: SqpoNzeST8ea7ledbVsKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223639851"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2026 09:44:58 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgsi-000000001fJ-0aoH;
	Tue, 14 Apr 2026 16:44:56 +0000
Date: Wed, 15 Apr 2026 00:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-2026-03 1/1]
 arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer
 operation overflow
Message-ID: <202604150057.DWHQRhx2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   0e1f140adb4c1fd5730779774acc630bea1b303f
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [1/1] arm64: Allow to enable PREEMPT_RT.
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-r112-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150057.DWHQRhx2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150057.DWHQRhx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604150057.DWHQRhx2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1633:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex.c:1660:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
--
   kernel/locking/spinlock_rt.c: note: in included file:
   kernel/locking/rtmutex.c:1835:17: sparse: sparse: context imbalance in 'rtlock_slowlock_locked' - unexpected unlock
   kernel/locking/spinlock_rt.c:50:22: sparse: sparse: context imbalance in 'rt_spin_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:50:22: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:50:22: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'rt_spin_unlock' - unexpected unlock
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:210:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:224:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:233:22: sparse: sparse: context imbalance in 'rt_read_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:243:22: sparse: sparse: context imbalance in 'rt_write_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:254:22: sparse: sparse: context imbalance in 'rt_write_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'rt_read_unlock' - unexpected unlock
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'rt_write_unlock' - unexpected unlock

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
