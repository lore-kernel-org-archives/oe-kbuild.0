Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84F1D86FF
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766174537; cv=none; b=FFksIpx1y0MJrIhZHlfytDuCdcOhBjuyBrLUxWSwblnkYsJ/2d7ppy0Kf8nuHXn+MUPYKLgD+nwdOLnTRB1hMDa8gnwFXf1iGuxenIpmGemxYvp1/iERwe+Lw2uHYPcBcdyAsQKhe7hP/pyze9srs6AcwGn7DCVTv9fmT2p3EZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766174537; c=relaxed/simple;
	bh=5qdbDTzCReaOgnPL090XqbtkHc+GcIHGKC1aqqpAO+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYDokADeeORackhfmExBaJTYJOM5gRI6E5clRPIvZciDreuOX9CYNfWzvKSs10vZiVZPHzDmSkAgx2m9M+oYMpXvxIStxGIxuYVeVORiM5Hf850zmut0iyjhWJ+e/ftjZpTFUjfrv4wrmZvvOz1RRdfFfPC9RczNrVqWiRKHOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWcUI/uI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWcUI/uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766174535; x=1797710535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qdbDTzCReaOgnPL090XqbtkHc+GcIHGKC1aqqpAO+w=;
  b=RWcUI/uIE/1zGbSmQzh5bt8neDKVe2m1n5ewXbWOGT4qPKoZnXolx4Tl
   ZfKjax0f4FR4a36hgEkL1tP597E8Z2R3ftzIczCTZOlAOicVBybssnNDo
   FNEufPCMeSMhjRMuUwAXkRHCtPVd9DzQcxK4O+HfkoJRth0LiqOUEm/jm
   KeJDirivTnkEj7z0HnmbGjxpTYWdzQyUhFEd5Pq7lbvxglL1MOSW7I4Iv
   jlN7ERBVAUU46GclFNdtcjuOKXp7kzIfJLUsjCVIs8tgIdi9fj4/qS/j6
   kyNui6dX0uQVcf6kksMzXsbDQ7E/O+3iPkAe2L8RX8B4wyEaiUxDVi7IN
   A==;
X-CSE-ConnectionGUID: EW8IgPQrQ7iyTHruPU8fVA==
X-CSE-MsgGUID: IdZ7stpRR4ST8MSGz+Kprg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78853207"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="78853207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 12:02:14 -0800
X-CSE-ConnectionGUID: CUTJ6qlKRXaV0U0nhxKleg==
X-CSE-MsgGUID: CTP8t1xpRjaqoH4mILVktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198939475"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Dec 2025 12:02:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWgfy-000000003x5-2K3f;
	Fri, 19 Dec 2025 20:02:10 +0000
Date: Sat, 20 Dec 2025 04:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 44/44] lib/radix-tree.c:1596:2:
 error: call to '__compiletime_assert_251' declared with 'error' attribute:
 BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <202512200351.nB62856w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Vaibhav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [44/44] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
:::::: branch date: 34 hours ago
:::::: commit date: 1 year, 3 months ago
config: arm-exynos_defconfig (https://download.01.org/0day-ci/archive/20251220/202512200351.nB62856w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200351.nB62856w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512200351.nB62856w-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for function 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^
   lib/radix-tree.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         | ^
         | static 
>> lib/radix-tree.c:1596:2: error: call to '__compiletime_assert_251' declared with 'error' attribute: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:375:2: note: expanded from macro 'compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:363:2: note: expanded from macro '_compiletime_assert'
     363 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:356:4: note: expanded from macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:74:1: note: expanded from here
      74 | __compiletime_assert_251
         | ^
   1 warning and 1 error generated.


vim +1596 lib/radix-tree.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  1591  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1592  void __init radix_tree_init(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1593  {
d544abd5ff7d8b Sebastian Andrzej Siewior 2016-11-03  1594  	int ret;
7e7844226f1053 Michal Hocko              2017-05-03  1595  
7e7844226f1053 Michal Hocko              2017-05-03 @1596  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);

:::::: The code at line 1596 was first introduced by commit
:::::: 7e7844226f1053236b6f6d5d122a06509fb14fd9 lockdep: allow to disable reclaim lockup detection

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
