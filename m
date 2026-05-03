Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919FF2D839C
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823039; cv=none; b=TWDqF1H/ynD6WXdfl0Oa4kCvy1pK/Rju/VbT+ErlF1Jw/v8TxegCggInzxgDUOlp2wnR91VqWm3qRic+4qXdxWQivQW1lmn2FgmcxG+V8sBUaK5zHpAOPJY0tXHukF9d1BW8qvq/+CKWat0Hc6YKvlaiI/oYk/fFTozsaD16Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823039; c=relaxed/simple;
	bh=NAKVj98Ti6GwH9ihZ2UMra0L/Phqf2KDeWKBE26Vsjo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NXu/nxodrS82ABvZqbaHYcRMg6f8ijSO0ahsTCT/vH9sxHcz5vphvQ1o1sh7xGseDTIWQzi58dFqByI/Mg+r57nVQIYxvG8D1/vtuhFPlCcmIdij19g1sHCdOM4o9r/Z7cMU6ioeDLqzX89QDAxeQ4ANrIHqFUIkeMH7ztTN/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mV5aI6y+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mV5aI6y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777823037; x=1809359037;
  h=date:from:to:cc:subject:message-id;
  bh=NAKVj98Ti6GwH9ihZ2UMra0L/Phqf2KDeWKBE26Vsjo=;
  b=mV5aI6y+NhKIE3tQyftBnZ8DYehB1BJQl44K1gqQF3X89DuyuFEpgYRT
   ToIJbxZT3yk9wsUSEa/wXZhEw6nWElt+ab8I2ZqgzrM986ziw96mgNDhH
   CeJoQb5sJ0I7o8YC0Vd8kHNPO+8yF5kVHYITohcrwHDP0VxW3s4cdp2BU
   zn+a3B2RxQkuIyynyGdp9doX9Qow3Pt3BYNKHzvCaUniQm3H64uMi0Zra
   x1leIATw8d+AylGq4jC/uGqsceT02IGQE1soIQZR0p7MUnec35ZEnjliP
   d9h6eX5ymBjUWnSu1kBchEHN4E5c0hOp+ES2nhkv13W6VhFDiLHqHOG1H
   A==;
X-CSE-ConnectionGUID: DQ2xtcvaTf2MesHLSEATVg==
X-CSE-MsgGUID: b44p1P8hQpCkc+FgjCes6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77724890"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77724890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:43:57 -0700
X-CSE-ConnectionGUID: 6rJBSW9nSzCfFDt0yGzkog==
X-CSE-MsgGUID: j9OOcBvoRWivjHUMvzH+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="228807535"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2026 08:43:56 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJYz3-000000002hF-35O2;
	Sun, 03 May 2026 15:43:53 +0000
Date: Sun, 03 May 2026 23:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slub.c:7666:2: error: call to '__compiletime_assert_769'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <202605032323.gvOzuLBA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602, commit: e2522acda312ed7741b57eb92c4ed009b3358328"
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Byungchul Park <byungchul@sk.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602
head:   46b72c93953595c42867a65ad4829f753ef95b8e
commit: e2522acda312ed7741b57eb92c4ed009b3358328 dept: make dept aware of lockdep_set_lock_cmp_fn() annotation
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032323.gvOzuLBA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032323.gvOzuLBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605032323.gvOzuLBA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:7666:2: error: call to '__compiletime_assert_769' declared with 'error' attribute: BUILD_BUG_ON failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)
    7666 |         BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:617:2: note: expanded from macro 'compiletime_assert'
     617 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:605:2: note: expanded from macro '_compiletime_assert'
     605 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:598:4: note: expanded from macro '__compiletime_assert'
     598 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:101:1: note: expanded from here
     101 | __compiletime_assert_769
         | ^
   1 error generated.


vim +7666 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  7663  
55136592fedf5c Christoph Lameter 2010-08-20  7664  static inline int alloc_kmem_cache_cpus(struct kmem_cache *s)
4c93c355d5d563 Christoph Lameter 2007-10-16  7665  {
6c182dc0de26ef Christoph Lameter 2010-08-20 @7666  	BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
a0dc161ae77377 Baoquan He        2022-10-24  7667  			NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
a0dc161ae77377 Baoquan He        2022-10-24  7668  			sizeof(struct kmem_cache_cpu));
4c93c355d5d563 Christoph Lameter 2007-10-16  7669  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7670  	/*
d4d84fef6d0366 Chris Metcalf     2011-06-02  7671  	 * Must align to double word boundary for the double cmpxchg
d4d84fef6d0366 Chris Metcalf     2011-06-02  7672  	 * instructions to work; see __pcpu_double_call_return_bool().
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7673  	 */
d4d84fef6d0366 Chris Metcalf     2011-06-02  7674  	s->cpu_slab = __alloc_percpu(sizeof(struct kmem_cache_cpu),
d4d84fef6d0366 Chris Metcalf     2011-06-02  7675  				     2 * sizeof(void *));
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7676  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7677  	if (!s->cpu_slab)
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7678  		return 0;
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7679  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7680  	init_kmem_cache_cpus(s);
4c93c355d5d563 Christoph Lameter 2007-10-16  7681  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7682  	return 1;
4c93c355d5d563 Christoph Lameter 2007-10-16  7683  }
4c93c355d5d563 Christoph Lameter 2007-10-16  7684  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
