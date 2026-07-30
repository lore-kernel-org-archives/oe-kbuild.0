Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E493ACA5E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437308; cv=none; b=aJmX69XLq0yM5CQ3bjQmXvkV7R2Ng9dsj9wnddl0Yj6ZmEnXnsnYp2lmTtW3+NJgnmRT39JbasV/cAVE+mb/kyAMlauxeaUML9hSLl+OX9FX5/C3TJEJiMtILtEvrFRXnJAgW4gOA2yr0fnnq8qVp7DIEu4KoOQZwT8ddSZq99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437308; c=relaxed/simple;
	bh=mEShd/ebsXwmJQFGHdL4uojNE/BiGpCTGCkbzB2rCr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JBB5biluRNAyoOO+BYJ+QhKmj9t2decilleXoDDXsv3STHxMG3ULqKmOBtRtWtYRaVUammOkEkGnrbLCoo0aJEuhM1r/XPvjFol1TwSM15sUmndhVfkDm/Fl0VnbOvZwsGReQ+KdQQ4I8a9ZUipCDi6BEL1GstD5HKQP0KokjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azw/uyME; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azw/uyME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785437306; x=1816973306;
  h=date:from:to:cc:subject:message-id;
  bh=mEShd/ebsXwmJQFGHdL4uojNE/BiGpCTGCkbzB2rCr4=;
  b=azw/uyMEzKVRckAGAr3JUllzy+mvEDs1Jvl3zc26Qk+rSPwluTOiL4J+
   iFDnVb51rDbLwrhp4C7F5zwO3aJpe3QRhYh+IaUV1W8ER2U6q9Uz6/SXH
   S7OvUgEj999mEPX1wol+oHWElX8cjU+O8HA+y0J1gkB7bw3IcZLyVTFKm
   r+qVLPU4/E+DZQ7POJP4VaY+B0aIAC5WxRXGCtxaEqRH+TeB/hEjHiNsg
   e+P3Bk7TKcGZoPitlXZ8du/VilhvLhKBRtfRib7IUWyeyZP+PmnOxPvE5
   TvhZcC68N9gwRXVmviUyw5KOIkiqTpoH91fEi8qduAkaTJ1NMf8dghAOa
   Q==;
X-CSE-ConnectionGUID: FYTGHfP5SEaQWQHnZNNl6w==
X-CSE-MsgGUID: KyD6R99ESn6FovuocMAEKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85041191"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="85041191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 11:48:24 -0700
X-CSE-ConnectionGUID: 4OHysgOKQIyPi03p98wUEA==
X-CSE-MsgGUID: 7iU5h0K3Qn+WPl25u55tSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256458561"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2026 11:48:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpVno-00000000hSf-2gnD;
	Thu, 30 Jul 2026 18:48:20 +0000
Date: Fri, 31 Jul 2026 02:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/array_size.h:11:38: warning: division by zero
Message-ID: <202607310202.ODMVPM8t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Koichiro-Den/dmaengine-dw-edma-Add-dw_edma_core_ll_cur_idx-to-get-current-LL-entry-index/20260730-102226, commit: 03f5304bf0171912c566bfcc1a639cbb665c9a4c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/dmaengine-dw-edma-Add-dw_edma_core_ll_cur_idx-to-get-current-LL-entry-index/20260730-102226
head:   ae65ed7a2832f6e535080ff77119c27abc812175
commit: 03f5304bf0171912c566bfcc1a639cbb665c9a4c dmaengine: dw-edma: Serialize LL event capture with channel kicks
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: alpha-randconfig-r063-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310202.ODMVPM8t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310202.ODMVPM8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607310202.ODMVPM8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:6,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/dma/dw-edma/dw-edma-core.c:9:
   drivers/dma/dw-edma/dw-edma-core.c: In function 'dw_edma_probe':
>> include/linux/array_size.h:11:38: warning: division by zero [-Wdiv-by-zero]
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                      ^
   drivers/dma/dw-edma/dw-edma-core.c:1401:18: note: in expansion of macro 'ARRAY_SIZE'
    1401 |  for (i = 0; i < ARRAY_SIZE(dw->event_lock_per_dir); i++)
         |                  ^~~~~~~~~~


vim +11 include/linux/array_size.h

3cd39bc3b11b8d Alejandro Colomar 2023-10-03   6  
3cd39bc3b11b8d Alejandro Colomar 2023-10-03   7  /**
3cd39bc3b11b8d Alejandro Colomar 2023-10-03   8   * ARRAY_SIZE - get the number of elements in array @arr
3cd39bc3b11b8d Alejandro Colomar 2023-10-03   9   * @arr: array to be sized
3cd39bc3b11b8d Alejandro Colomar 2023-10-03  10   */
3cd39bc3b11b8d Alejandro Colomar 2023-10-03 @11  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
3cd39bc3b11b8d Alejandro Colomar 2023-10-03  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
