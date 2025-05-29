Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303521D3F3
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 02:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485641; cv=none; b=Py/aMh/gzVBWgDcznj+MDswKDX4/Y2eoqKH1RYkWUb6D1XcsPRwRyzOsChO0ohPwaf/YhttmspSBRx5j9IbymFfZIuB9JT3xA40GEJ1OpDfA/hVTgC12+tueJMcPSqYAUu564B6cTlB9rwX0qWC50rkuN2VdumFwbSXSrvWrgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485641; c=relaxed/simple;
	bh=GglWTeb9NxCeDFiDy3ZLZgd9skrNwHzqZv70ApK0G9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0Ij9z5Ld5Su4RUTEdPl17HKARjMPeVhmL631c7gu2bzvKFU7s3gs8OZRtCgIJAYPX90vKep25Cn4T0hV1NRvSMeO0E+6y2RT9n6cVNo6qpPkPx3vm22C1Dyd2sYcG0EgiXcmfRh7x6X3aB9Bv1+4BxdnKkX4WjBW5xYiAKgHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpVzXTvU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpVzXTvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748485639; x=1780021639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GglWTeb9NxCeDFiDy3ZLZgd9skrNwHzqZv70ApK0G9s=;
  b=GpVzXTvUlL1qg+6MfldyRD2AM91Bf1V6AEZ5XsF1CHpKoSx725He1/Ch
   A9XgsX1FX7BCamh49n8DDEo9mE3HY9/xy8++d4gIQsZaQu8/75hTveBf/
   KdvZh1zbNVIzdSEaDf82B/U9/Dj5h2Ca7cKrb4beKoSlBU+MJ/f6T4f5U
   M7ioVwDXyDzSQ/qREgr48WugWEhjPbb+kI6xvMAei7JojHgCsGFoTIhRv
   76prZVNhSzxYsQlr2r6Y2z82ZTnDfXmQbfgr0uw9dnuwwuxTimgbPAhX+
   yvJhrMgMDVq7p7PVJhPGxtXZhahCmXlPU9WtBm9H2Aekp9rqNl4TWFKK2
   w==;
X-CSE-ConnectionGUID: RE9yQPNeSY+Aqcgl2MerBA==
X-CSE-MsgGUID: 8TDXYOEqSPOUxqgsgUWfbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50231254"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50231254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 19:27:18 -0700
X-CSE-ConnectionGUID: eYd51P67RdqHs6N1wHqVIA==
X-CSE-MsgGUID: GT4zH06yTHay5t6lmOGFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143888365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2025 19:27:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKSzC-000WEy-1E;
	Thu, 29 May 2025 02:27:14 +0000
Date: Thu, 29 May 2025 10:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 49/49] kernel/dma/phytium/pswiotlb.c:
 linux/ctype.h is included more than once.
Message-ID: <202505291009.s6LU2LD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   62cee0c43e18567eba021417ea42175a25b1132a
commit: 985517480ea330869ed27510db7af06a07cc8846 [49/49] anolis: phytium: pswiotlb: Add PSWIOTLB mechanism to improve DMA performance
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291009.s6LU2LD4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/dma/phytium/pswiotlb.c: linux/ctype.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/io.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/set_memory.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/scatterlist.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/gfp.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/highmem.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/debugfs.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/pfn.h is included more than once.
--
>> kernel/dma/phytium/pswiotlb-iommu.c: linux/crash_dump.h is included more than once.

vim +11 kernel/dma/phytium/pswiotlb.c

     9	
    10	#include <linux/cache.h>
  > 11	#include <linux/ctype.h>
    12	#include <linux/debugfs.h>
    13	#include <linux/dma-direct.h>
    14	#include <linux/dma-map-ops.h>
    15	#include <linux/mm.h>
    16	#include <linux/export.h>
    17	#include <linux/gfp.h>
    18	#include <linux/highmem.h>
    19	#include <linux/io.h>
    20	#include <linux/iommu-helper.h>
    21	#include <linux/init.h>
    22	#include <linux/memblock.h>
    23	#include <linux/pfn.h>
    24	#include <linux/rculist.h>
    25	#include <linux/scatterlist.h>
    26	#include <linux/set_memory.h>
    27	#include <linux/spinlock.h>
    28	#include <linux/string.h>
    29	#include <linux/pswiotlb.h>
    30	#include <linux/pfn.h>
    31	#include <linux/types.h>
  > 32	#include <linux/ctype.h>
    33	#include <linux/highmem.h>
    34	#include <linux/gfp.h>
    35	#include <linux/scatterlist.h>
    36	#include <linux/mem_encrypt.h>
    37	#include <linux/set_memory.h>
    38	#ifdef CONFIG_DEBUG_FS
    39	#include <linux/debugfs.h>
    40	#endif
    41	#ifdef CONFIG_DMA_RESTRICTED_POOL
    42	#include <linux/io.h>
    43	#include <linux/of.h>
    44	#include <linux/of_fdt.h>
    45	#include <linux/of_reserved_mem.h>
    46	#include <linux/slab.h>
    47	#endif
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
