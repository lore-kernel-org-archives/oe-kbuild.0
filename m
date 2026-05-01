Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A318FC97
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777612830; cv=none; b=XwkpMzYYEm6wI4syJH6xJlCIrpmNAMcliII4hcULqE+JhzUpi+slzyGdCcuOS+IpoTDHDUez6RyNTPTIRkoHM6ljrnUI+wwecI4eGVTIebCTh5X6p+m+6lZldyzcXDbBWugWPJ7sz9w7+KL9C/RS2fy+nVw6k0aDHw+benelI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777612830; c=relaxed/simple;
	bh=Zg/Am5+U7ehPrChemWYU60vU/3VUIQJ6o/pi1zabUMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I7tF79xQJNj4rAqE7F3Rp9VXO3u0bv0U5YiCgbT0/XXtmrIzRoG1FTBag23FT/Wv4ebF4JkzoAjRqbJ6DKf97yt+EUTz2Y54V4aXIVPEmJ9VaL7RTlFIVfYcSbVATpldyNBjKRfoInfwsr/s/+qLPgUql6uDYVbET4zl18SUM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhIx8CuY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhIx8CuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777612827; x=1809148827;
  h=date:from:to:cc:subject:message-id;
  bh=Zg/Am5+U7ehPrChemWYU60vU/3VUIQJ6o/pi1zabUMQ=;
  b=UhIx8CuYt5BG1+I/FR4lGqyBNBwtLoreM5Ymr1eMXFPZweNUwVHcqYHE
   3fZUKg+mg9yu12BUoI9UYV4cQum/yXCxR9dbYTWE7DzekXClMCcYPh40b
   YZwzIgKwFCNnF8vhwLlXL4JitvhPAEQcv8MiN+P1yFzZ8Z9UmWS2nXF6c
   LZNzhaBg1mShRGH3yYlY10rnQyLn7jhXiDAEuRfGqTlzaw9vg0GF1akZD
   cRyIbqPegS5ec40gzxVUaTZMhuMnmRztC4UuHKRvNcmGgMVaZ3+7UNM09
   IX9lF7ciafXz6dna0Asc1DSrCfUGgvvei+hZfgNgEdzSjTkU8pdMEp7Yt
   A==;
X-CSE-ConnectionGUID: NsOIPgxETry2LeXoy6wTPA==
X-CSE-MsgGUID: E5FQb30sSxS4eqW0eZiKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81149883"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="81149883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 22:20:27 -0700
X-CSE-ConnectionGUID: arkhDdg8SfOSXGkFQOxyjw==
X-CSE-MsgGUID: yilaz+u4QluABqIfpqAtSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239112860"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 22:20:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIgIZ-000000000Cb-2bUl;
	Fri, 01 May 2026 05:20:23 +0000
Date: Fri, 01 May 2026 13:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mm_init.c:2691:2: error: call to undeclared function
 'kho_extend_scratch'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605011301.NUlpGGwU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605, commit: a29db33861c799b78a6469b22301aace345ad455"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Pratyush Yadav (Google)" <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a29db33861c799b78a6469b22301aace345ad455 kho: extended scratch
date:   27 hours ago
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011301.NUlpGGwU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011301.NUlpGGwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011301.NUlpGGwU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:2691:2: error: call to undeclared function 'kho_extend_scratch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2691 |         kho_extend_scratch();
         |         ^
   1 error generated.


vim +/kho_extend_scratch +2691 mm/mm_init.c

8afa901c147a41f Mike Rapoport (Microsoft  2025-03-13  2688) 
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2689) void __init mm_core_init_early(void)
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2690) {
a29db33861c799b Pratyush Yadav (Google    2026-04-29 @2691) 	kho_extend_scratch();
9fac145b6d3fe57 Mike Rapoport (Microsoft  2026-01-11  2692) 	hugetlb_cma_reserve();
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2693) 	hugetlb_bootmem_alloc();
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2694) 
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2695) 	free_area_init();
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2696) }
d49004c5f0c140b Mike Rapoport (Microsoft  2026-01-11  2697) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
