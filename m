Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F130100D
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777610728; cv=none; b=aK6xiGr6MyJaBrMwm1yyeJY2WOicIlLlwyUU2+OCB2bHmGYSixY8UsS3C2CtJiTHhpNIgAgTM+AvPgm05xoPcFtj493ryN9sv2/upauabXY2AA63l3JbfNJfvvrhPldr3bi/0gZy/g36RPAkB+EOXcT5uddr7zud/VCvykrWte0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777610728; c=relaxed/simple;
	bh=UbcUP1KsyeF/k8qHE2KlRKNg7ZE+joHTvF7ojXwrNOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJ75uE3fa0E85y0WzCPMQWRFr49mrmpdHrpenShJmNA0grNHw8aGDICGv/WyjMt3/UthegxFwOlUAbu6UqJO0wTPjw2GSlSmodNTusPjQiWfhSwEwbcvajUJVuIk+dkVy6bDITPqWF9cbCVZ0E9vIDeRL80pGtCplRa8oal8ykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euV1a6Pf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euV1a6Pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777610726; x=1809146726;
  h=date:from:to:cc:subject:message-id;
  bh=UbcUP1KsyeF/k8qHE2KlRKNg7ZE+joHTvF7ojXwrNOY=;
  b=euV1a6PfxAjjUaog/9IGWAqVgXPjWcI5pVev+hbC3nVtlzSrafAW+D7L
   KQID3MeT7R4iLT6czXXTV0ErabuyAlU9uV4OCcc2bpnj5nITtLq9kEOxV
   cmsuCvM8Qf9JKJEG08FHVshPv89qT2k8ANwaeVeJcUxHMQhavrlonhplh
   +RetX5s04ZVoP1u6DTD/I7tovjWpkA1YVxsH/CZhfBuOsqZf6lCr8T3tf
   mG4RbhUqdSA6j7CLaenMiW92lkhW5/iBZ2ASZ22FKzRhtA5m38zmRP5nu
   2MMDQYeZCRmJ+6JVQZEABGdxJu8WAvpaNbO8SLDVhDzP9NDKQQY6Mg500
   g==;
X-CSE-ConnectionGUID: o6i48kP+QG2egd3ftIH9SQ==
X-CSE-MsgGUID: GvKH1xoFQB2qetlpHjD3+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66109165"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="66109165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:45:26 -0700
X-CSE-ConnectionGUID: MyoKhhGwTOmoYs1hKWio1Q==
X-CSE-MsgGUID: aArLdIugRruZzq6q4gQ8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233737809"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2026 21:45:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfkg-000000000BU-2mor;
	Fri, 01 May 2026 04:45:22 +0000
Date: Fri, 01 May 2026 12:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mm_init.c:2691:9: error: implicit declaration of function
 'kho_extend_scratch'
Message-ID: <202605011207.YnV4BQHo-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: "Pratyush Yadav (Google)" <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a29db33861c799b78a6469b22301aace345ad455 kho: extended scratch
date:   27 hours ago
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011207.YnV4BQHo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011207.YnV4BQHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011207.YnV4BQHo-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'mm_core_init_early':
>> mm/mm_init.c:2691:9: error: implicit declaration of function 'kho_extend_scratch' [-Wimplicit-function-declaration]
    2691 |         kho_extend_scratch();
         |         ^~~~~~~~~~~~~~~~~~


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
