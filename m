Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD971EFF9B
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769058340; cv=none; b=TLweVdkLDbbUvlXYEjyqx0qmr5H/WwVaPJjQpjnSBmnK18bRPovovebbz3CinKxEDM41wVfyC7fHOtvPz2FuFCBbbLc4Aj+gZ5TMr9H5B0Sa231XS7rq56SFWPFBJENjVT7GG4GfWptgT7CgRyb3Bvpe/eZvFwpA6YPsSrRBY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769058340; c=relaxed/simple;
	bh=nl0QnjzqBuBt6jNCwEne0neB0zx0GrmolosXrzZWMCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afOLQiRZUp8kFQGJtwIqKdjWZNAZ6rr97g7sxzSX0FTk/MxBMyjQl1XlrWyId5NJ1915qn9qZEwjg4IKn+ZfzrBvLVzVI6dFJ5y1LGW58wIjtxkL8+u7qcEhhGunPBIxa0y16BieTTv3EHDExwRAxVDfmA5IjOxAKohGwpZZIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkOhrr54; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkOhrr54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769058338; x=1800594338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nl0QnjzqBuBt6jNCwEne0neB0zx0GrmolosXrzZWMCw=;
  b=kkOhrr54yNkhKy+8ovMWQY8BZ9LNQVFlEZIOTnYr307NFQDtfX3PSopP
   dnaGMCKYq3m+e0iuywD/pqwvernwtnv3vYmbjjpr0MvSPxJS4A6L9vHwQ
   4cGWpmCQw4au7UjkBf/IDh8HgaeBhOpFVjL6XldYn9DcwLnLnAEzeGXLJ
   iHwZsh5iRHJX/vRpERGgZLsCm86TlxejaXhB5p9PJeGGLrJqTm0fi2PHo
   AFTfHOPjUT/yrPaCHdAN4jBO0R/FCgwsmjBm9VkSBzWEE3s1/YNLV6/Ng
   9InkUYwbrOw+BGeHYdEAbhParPyDiz2tzrmxIZ4MYP/rOrLZ0tPEv8rbm
   Q==;
X-CSE-ConnectionGUID: kg34iYmBSJ6nwMVBJWYvkw==
X-CSE-MsgGUID: My5/aroGTYmt1cklhgeH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69310678"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69310678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:05:37 -0800
X-CSE-ConnectionGUID: KytppKPATFCgvKPxsQa0+g==
X-CSE-MsgGUID: ttcR9fD9T1OE6vq3q6v9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="207075526"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 21:05:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vimsw-00000000SSb-1txZ;
	Thu, 22 Jan 2026 05:05:34 +0000
Date: Thu, 22 Jan 2026 13:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601221225.df4FJGjX-lkp@intel.com>
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
In-Reply-To: <20260121135318.651622-21-dev@lankhorst.se>
References: <20260121135318.651622-21-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: Maarten Lankhorst <dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260121]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260121135318.651622-21-dev%40lankhorst.se
patch subject: [i915-rt v5 20/21] PREEMPT_RT injection
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-r131-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221225.df4FJGjX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221225.df4FJGjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221225.df4FJGjX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/rwsem.c: note: in included file:
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1672:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
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
--
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/spinlock_rt.c:62:14: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:69:14: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:211:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:225:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit

vim +31 arch/arm64/include/asm/atomic_lse.h

c09d6a04d17d73 Will Deacon  2015-02-03  28  
78f6f5c994ed22 Mark Rutland 2022-08-17  29  static __always_inline void __lse_atomic_sub(int i, atomic_t *v)
ef53245060989d Mark Rutland 2021-12-10  30  {
ef53245060989d Mark Rutland 2021-12-10 @31  	__lse_atomic_add(-i, v);
ef53245060989d Mark Rutland 2021-12-10  32  }
ef53245060989d Mark Rutland 2021-12-10  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
