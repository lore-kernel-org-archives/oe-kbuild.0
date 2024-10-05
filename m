Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336C4A1C
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 00:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728086989; cv=none; b=HO3s6SGjJcsVQm22NF8Xrd544PBwSEPBOcj765DVpgAVknN3USI2Bn2cXFoObvv6CN4I9cLmiFziMmePnCYTTiR39RROee3PKH1THJ+FCkaiL3NYzaedL4KH0QMVLLeaAbi/Dzn1JSSb45PoWmHBDoXtBLDyXcH/JubeeLyp+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728086989; c=relaxed/simple;
	bh=3Qohi1UyKvYj2/sEbP89paw1XeAsjp/LpBLzjJXTDWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdLaU+lLqrCpmZXDLmQZP2/SEQjRoSi1s7OMbt9iXsRkjb5m3gxIe8MQ7CSUtDUE32KoZ7BeWadt4lT1fnTlbUAfIYvVeF50bfkVjgs4PN942MzEOe7DIV6y5BZqke26vaahcIpMxXrimTwZZ6obFWcauCXvrTFkjX+PsdRgbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiAjPDhl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiAjPDhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728086988; x=1759622988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Qohi1UyKvYj2/sEbP89paw1XeAsjp/LpBLzjJXTDWM=;
  b=CiAjPDhlg5dreLUqtVL3MAd0eu/JxfyI7/7eoVhXpXTVz93yzuGRuL2/
   P0gvdR+EABNfZG5Zx7GrPyeGoH7DgThks7QjDCfYodQDCHHzPuulqTX8S
   nIAjnXmBIdDQgIYBMdDyJ3vN4zfx91QSIxtaJsHf8iJ2hPURqSiPDELjj
   3XOrKI+dxmSwEPUvT7JRhHJQB+H5RxEoTq3x5Yj30tqKmsQESb/WgzVDy
   jF3MMisLgF+Vj9WNjh8WCh9FtbbV4mjXbwyrHDahwSvQP5Q9+GqPKfR4v
   k+JkxGk8xohfIEST1noimuc8R/o/I9E40H4uEzPYhvOaJs3MRCiXd6D/d
   Q==;
X-CSE-ConnectionGUID: e6w5PoBvSLuyerdgFCnIDQ==
X-CSE-MsgGUID: wD0cLXTMToKIDSaSj9MbYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27266799"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27266799"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:09:48 -0700
X-CSE-ConnectionGUID: 96vbnUpVQieKK8eFAPxwyw==
X-CSE-MsgGUID: DJ/ZEFP3RmO3mgdCv+HrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74860643"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2024 17:09:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swsMi-0002MK-0w;
	Sat, 05 Oct 2024 00:09:44 +0000
Date: Sat, 5 Oct 2024 08:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant
 integer operation overflow
Message-ID: <202410050812.UoJ43qgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac308609567d31fe44be80ab757a5ddf062362ef
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 arm64: Allow to enable PREEMPT_RT.
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r133-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050812.UoJ43qgj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050812.UoJ43qgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410050812.UoJ43qgj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
--
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1633:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex.c:1660:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
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
