Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BFD2BE647
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766266130; cv=none; b=HRef4hHwayHL2ED//ZWF7GpYmSqLlrwRc1W0fJ4kyFzkB7QhsctO7j+aFYu0C3YwhLW0qNgLOpOr3VMkKH5Uyr1yKx5AdzoPN9nb5EzUlHWJ3sre5yOw0VkPHE+Mzi4tr6CHmIPZX6zecgua5BY9JhqDLpkdt/J6uU8n9l5G+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766266130; c=relaxed/simple;
	bh=CQRLtWIeP7gfGUJQA3G1fL9MvvpPFqffewqjpWodVvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0Ph11fID2skvy+1m6wcS20NdPrS0WUsOO+a1WX5EMmvWYdIk8XaeHI7eLaMtnCwbf0nw+MpNIOu/Xh1SNu3+jwbq/cZqIOru0A9wkFDehilee9CX54/hKgibhS08DhoiemAuxcOvrqpYRFh/dwo7LViEDAmFf5sv9yG4Ri4mXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB4j23Mt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB4j23Mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766266129; x=1797802129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQRLtWIeP7gfGUJQA3G1fL9MvvpPFqffewqjpWodVvM=;
  b=gB4j23MtFU+CZl+u/L9hcKhbmuIKmN8jQrCKwe3mVc2ZhAAfQzxezuki
   +XLGzY5dOZjtDNrmiGnuL2wT7l55CJF7y2sw7RPl7ByKSwZ/lMded0S4J
   0fkH2aojIElR88fd1gYu0WvIWXSUmAcU/2T0Iyl00QmczYjMzvrpZho06
   wx1RPyo+8ii9WHfYiK6e7DMtQeSUal5ANR6TvVefi2i7PgGCRthe4I/l3
   0n30paAdYFtBK8YM23hEcx9HfURIB6jq4pfzkpQ+EGzE89Ki6AJTwc5Fg
   RlOsi0CjgZFyulrOxgd1zGYydLe0jBQUjxrcCRChUJSy1db9so9cSfZoY
   w==;
X-CSE-ConnectionGUID: ZPrxcdJiTViLkbFqPhmRtw==
X-CSE-MsgGUID: weBGv9WoTZuvtg6Oh/e9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90847618"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="90847618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:28:46 -0800
X-CSE-ConnectionGUID: StvoVHUmRlmEbD+8Vl9UzA==
X-CSE-MsgGUID: 8PCo7E8hToW14rgvSglH8g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 13:28:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4VG-0000000058f-1xso;
	Sat, 20 Dec 2025 21:28:42 +0000
Date: Sun, 21 Dec 2025 05:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [i915-rt v4 11/20] PREEMPT_RT injection
Message-ID: <202512210516.ytx5i986-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251218163408.97508-12-dev@lankhorst.se>
References: <20251218163408.97508-12-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes drm-xe/drm-xe-next drm-tip/drm-tip linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20251219-044020
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20251218163408.97508-12-dev%40lankhorst.se
patch subject: [i915-rt v4 11/20] PREEMPT_RT injection
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210516.ytx5i986-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210516.ytx5i986-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210516.ytx5i986-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:7678:2: error: call to '__compiletime_assert_677' declared with 'error' attribute: BUILD_BUG_ON failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)
    7678 |         BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:630:2: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:97:1: note: expanded from here
      97 | __compiletime_assert_677
         | ^
   1 error generated.


vim +7678 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  7675  
55136592fedf5c Christoph Lameter 2010-08-20  7676  static inline int alloc_kmem_cache_cpus(struct kmem_cache *s)
4c93c355d5d563 Christoph Lameter 2007-10-16  7677  {
6c182dc0de26ef Christoph Lameter 2010-08-20 @7678  	BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
a0dc161ae77377 Baoquan He        2022-10-24  7679  			NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
a0dc161ae77377 Baoquan He        2022-10-24  7680  			sizeof(struct kmem_cache_cpu));
4c93c355d5d563 Christoph Lameter 2007-10-16  7681  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7682  	/*
d4d84fef6d0366 Chris Metcalf     2011-06-02  7683  	 * Must align to double word boundary for the double cmpxchg
d4d84fef6d0366 Chris Metcalf     2011-06-02  7684  	 * instructions to work; see __pcpu_double_call_return_bool().
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7685  	 */
d4d84fef6d0366 Chris Metcalf     2011-06-02  7686  	s->cpu_slab = __alloc_percpu(sizeof(struct kmem_cache_cpu),
d4d84fef6d0366 Chris Metcalf     2011-06-02  7687  				     2 * sizeof(void *));
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7688  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7689  	if (!s->cpu_slab)
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7690  		return 0;
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7691  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7692  	init_kmem_cache_cpus(s);
4c93c355d5d563 Christoph Lameter 2007-10-16  7693  
8a5ec0ba42c491 Christoph Lameter 2011-02-25  7694  	return 1;
4c93c355d5d563 Christoph Lameter 2007-10-16  7695  }
4c93c355d5d563 Christoph Lameter 2007-10-16  7696  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
