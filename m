Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C590284883
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 23:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345975; cv=none; b=KMv2aZhCRSyLx3zjshTiIN9GwAn+4RLxzOtntqbRIv54jD1is/Mhd1wnRQJLNfmcSYYCNeGw0ta4UbDmIYCHvS/WVFxiu0tA8g3J/vQwP1kbaYBy/YwMiBllgIK60bkDLEolus4YXtvdSogSQuUEBY0bagwMo568dYiFcLYxtsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345975; c=relaxed/simple;
	bh=HNNnIIcB6bZUeJ0u8kYQbGjLRekk94aXInW3b2SBbuw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okHKHjVclsbaU95lhf4kjRJ56FQD9RRAOxI5X8kcrrDWXadZ5QVGZZpz6n3ijJnw+WsaeynfXeOzEKBuSoNcTy38iQ5h3ykJ81ldwfy2A4BrtiL3+Mj3mXN64J+UmnAnYfjr9Kl6Lz0leIofyuP3Fo+TzhftHsA/uhypeOYPBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LICQQIQL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LICQQIQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768345973; x=1799881973;
  h=date:from:to:cc:subject:message-id;
  bh=HNNnIIcB6bZUeJ0u8kYQbGjLRekk94aXInW3b2SBbuw=;
  b=LICQQIQLGi+KGDV/0GjIsgn/i99Cs3/34VhTkXMP/BOqFC0o+lVKTKtK
   6XtJIl8IVkCc9J8YT50/OA4v9ASZJQ3KGEjbjceNkgJustVdAc4GC4SFL
   1htAq44shxOV0zo/E7S2/CG4jPc5QVWVVYVMU4ZEZRVL96eemLQUzm7YL
   ulXJdSPmE6CH3eXQrv0eibO8fQI/mt1ie8ccBjDeiBrfoMFmpjo07YHHJ
   CQFhETAWkWRlxQLk1SNJh6v5D5AGT+IzsJ0PPZvXr74NRjx+2yOPQdYgO
   oVauLch6SZ4k4a0HJElbP9nu3bLo3SvPG3ERuCKwIapGi5K3Fjv95e8jh
   g==;
X-CSE-ConnectionGUID: 1HotUhbpRBG8nxNL856a7Q==
X-CSE-MsgGUID: KbXhwEJFTdaupSfcA1bpQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69376934"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69376934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:12:52 -0800
X-CSE-ConnectionGUID: ToDSQyBDQymbvpzpFwDVkw==
X-CSE-MsgGUID: MAn5ilFDQ267C42l+2COhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204307737"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 15:12:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfnZB-00000000FTq-0G0S;
	Tue, 13 Jan 2026 23:12:49 +0000
Date: Wed, 14 Jan 2026 07:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 263/273] mm/numa_emulation.c:351:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202601140738.mxg8BEo5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/numa_emulation.c:351:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Akinobu Mita <akinobu.mita@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   abb8eb84b7bb668d982e556b2b19f0e3ac42c591
commit: 972861aef0882af27f0ffb29fbc2825e17849347 [263/273] mm: memory-tiers, numa_emu: enable to create memory tiers using fake numa nodes
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r112-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140738.mxg8BEo5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140738.mxg8BEo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140738.mxg8BEo5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/numa_emulation.c:351:1: sparse: sparse: bad integer constant expression
   mm/numa_emulation.c:351:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   mm/numa_emulation.c:352:1: sparse: sparse: bad integer constant expression
   mm/numa_emulation.c:352:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +351 mm/numa_emulation.c

158f424f427e68 arch/x86/mm/numa_emulation.c Wei Yang     2017-07-08  349  
972861aef0882a mm/numa_emulation.c          Akinobu Mita 2026-01-08  350  static int adistance[MAX_NUMNODES];
972861aef0882a mm/numa_emulation.c          Akinobu Mita 2026-01-08 @351  module_param_array(adistance, int, NULL, 0400);
972861aef0882a mm/numa_emulation.c          Akinobu Mita 2026-01-08  352  MODULE_PARM_DESC(adistance, "Abstract distance values for each NUMA node");
972861aef0882a mm/numa_emulation.c          Akinobu Mita 2026-01-08  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
