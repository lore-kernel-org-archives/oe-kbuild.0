Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5872C194
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Feb 2024 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707364049; cv=none; b=c7QSiXQScsMAhfoLGcCRtq6Ap3dTyIS38+0cPCd9JH7tNl0qFJeAKGkQHaZKWf76+uCST3Cy8QGPb0/n6Bc4A7tDe3U9YmAnoFNPfkIDQjIoqj5uLWbENjVBkvwTAfyFOk+wa2wWwave0pZiHClMXTl4qqY/3xzxXBzUWcjHIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707364049; c=relaxed/simple;
	bh=cLKN4SxWApcocD+jf9bRqJOpUgSxiVMwenpA30rxTQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U78YaAfjPuY1zPjMLe44njimoqJyq69v4mhjEAqIG3LYw4YMN/GgnDdEc3BrbShOqtuGvnR4GBa8XmZ9paJOlCY9x97sK3dg+ETAJBf0ug5Sz4KroKoK+JKfVaojlRbsnDDNNZHZle9lnSal/nkkc46kEPtHkBr1GjLSi0ICXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOa9Hmfn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOa9Hmfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707364048; x=1738900048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLKN4SxWApcocD+jf9bRqJOpUgSxiVMwenpA30rxTQM=;
  b=nOa9Hmfn15we8xjOzkvkEDWeTD63Y+vW8clmg0JaTYL0bBORR36aqioZ
   qH76mFxEdHFV5v/CCDEaVWDh+uFTL+W1BK8hUtwdBmfdTsPaD4FQXjfx3
   fP8AsYBmNLC0MfFTrJJFwXv+4bjZmH5Q1MqnIWtsCbBFHCyx2KIkUGEwp
   RLSqJGrXOD4PisZNuzJXzZWqDjV9DOZWXqfSax7eW0om8BEs/TbyPSyjC
   nnQVJcEf2pxWhXrWWx1pSOLTyDoLjl9wKY91HHGjjrCrj2qE9NPEYHHw8
   xP1bI4YZNZPDSTMV2kVKFYB1hdpGZ8TRbbp7MEyHEe+r6Vh4WNnxCLZe0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1052358"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1052358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 19:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1561880"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2024 19:47:25 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXvNi-0003Jc-25;
	Thu, 08 Feb 2024 03:47:22 +0000
Date: Thu, 8 Feb 2024 11:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:d1-6.8.y 45/50] include/linux/build_bug.h:78:41: error:
 static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
 IS_ENABLED(CONFIG_IOMMU_DMA))"
Message-ID: <202402081137.dkKEWd5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Samuel Holland <samuel@sholland.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: fc999d268262198273238ee56444d61d1af41dd1 [45/50] iommu/sun50i: Ensure the IOMMU can be used for DMA
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-001-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081137.dkKEWd5B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081137.dkKEWd5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402081137.dkKEWd5B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/clk.h:13,
                    from include/linux/amba/bus.h:14,
                    from drivers/iommu/iommu.c:9:
   drivers/iommu/iommu.c: In function 'iommu_get_default_domain_type':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && IS_ENABLED(CONFIG_IOMMU_DMA))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1926:17: note: in expansion of macro 'static_assert'
    1926 |                 static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
         |                 ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
