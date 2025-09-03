Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982E75809
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Sep 2025 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756867799; cv=none; b=Sjc4I6uPL3+FOQecZnpajmvxnu5vkSNu0Jy0mPsyxJFdC7hlnc91CWdiCT3tr4XmhbBMO8omMKQ1+pMVREkTNLq4/WYLkFZz4MNWQrceZrAfCmo4vsgtqz0azZ+d+51zL+FlTPrDVItz1VEiw8H86aOMYUZhB5fczJgUjw3Xf3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756867799; c=relaxed/simple;
	bh=025Qq38TIVmNtUCF6lI6rrOjRgGJl75QLzna3BamjNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q76G8aQb58clXWJsOX/oZvdQiCwlb/Xt41NN2iRyUoAeF7sutq3XuNx2emU99lM76OrphuPT0KgUTCuEM0kEhoBAOnH6mkXKoUQLZ9NfleSTKeyS0AYpikwkD99iVD8m+yV6jMvNnDAGzmvV5eUU+jKeFQSpD26RYUyvxEUZQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qlrxu3qW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qlrxu3qW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756867797; x=1788403797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=025Qq38TIVmNtUCF6lI6rrOjRgGJl75QLzna3BamjNU=;
  b=Qlrxu3qWs/1qW+vUTriBnZVFn9VD6udikcel6de3sDgnwg/JLfaaSfFN
   jA2/P3MMv3j9XdcZrewczD6kkx0idzlF9zcXAOy6Zrrwt63qUe3LgV/YW
   d7ZzmNFNuyvN2i1LSiOIPHmJolaQK4PERRoVz2F3AV046Mb4BR9fkDz5v
   Ic0HQ4n7kVDA14kieuJSLDRFq258CTtuuz4Tk6VezRFaupXkQzCC+EswF
   Mjts0cHBB3LIFpIJWkOU0LwagQIhW63aaIBRJ/SgGN+ZBQHf2L8Uma4YW
   bQ5aZWfH11etyoZYCmvH2EHHENVbAOrekZjIYXHtu1ZjMz3B0QnsRRdmk
   Q==;
X-CSE-ConnectionGUID: 8JrZJM5TTOGwqhiLZuq3PA==
X-CSE-MsgGUID: 6E4toZMwSBOI4LlwXV6IWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69433290"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="69433290"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 19:49:57 -0700
X-CSE-ConnectionGUID: mzfrFNGQQQKGFLXczzbU7Q==
X-CSE-MsgGUID: R3sXS2yvSQaxuJCH7D4W2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171615193"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2025 19:49:55 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utdZF-0003HT-33;
	Wed, 03 Sep 2025 02:49:50 +0000
Date: Wed, 3 Sep 2025 10:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:health-monitoring 28/28] ERROR: modpost:
 __ex_table+0x2404 references non-executable section '.initcall4.init'
Message-ID: <202509031047.IqurGtL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   e268fde01f2634c18d583b982f04ae18bb8a9597
commit: e268fde01f2634c18d583b982f04ae18bb8a9597 [28/28] xfs: send uevents when major filesystem events happen
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509031047.IqurGtL3-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031047.IqurGtL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509031047.IqurGtL3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x225c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> .LLST98 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> .LASF4147 (section: .debug_str)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> .LLST82 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> .LASF4148 (section: .debug_str)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> .LLST85 (section: .debug_loc)
ERROR: modpost: __ex_table+0x228c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2298 (section: __ex_table) -> .LASF707 (section: .debug_str)
ERROR: modpost: __ex_table+0x2298 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x229c (section: __ex_table) -> .LASF709 (section: .debug_str)
ERROR: modpost: __ex_table+0x229c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a4 (section: __ex_table) -> .LASF711 (section: .debug_str)
ERROR: modpost: __ex_table+0x22a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a8 (section: __ex_table) -> .LASF713 (section: .debug_str)
ERROR: modpost: __ex_table+0x22a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b0 (section: __ex_table) -> .LASF715 (section: .debug_str)
ERROR: modpost: __ex_table+0x22b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b4 (section: __ex_table) -> .LASF717 (section: .debug_str)
ERROR: modpost: __ex_table+0x22b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22bc (section: __ex_table) -> .LASF719 (section: .debug_str)
ERROR: modpost: __ex_table+0x22bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c0 (section: __ex_table) -> .LASF721 (section: .debug_str)
ERROR: modpost: __ex_table+0x22c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c8 (section: __ex_table) -> .LASF760 (section: .debug_str)
ERROR: modpost: __ex_table+0x22c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22cc (section: __ex_table) -> .LASF761 (section: .debug_str)
ERROR: modpost: __ex_table+0x22cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e0 (section: __ex_table) -> .LASF1158 (section: .debug_str)
ERROR: modpost: __ex_table+0x22e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e4 (section: __ex_table) -> .LASF1160 (section: .debug_str)
ERROR: modpost: __ex_table+0x22e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22ec (section: __ex_table) -> .LASF1162 (section: .debug_str)
ERROR: modpost: __ex_table+0x22ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f0 (section: __ex_table) -> .LASF1164 (section: .debug_str)
ERROR: modpost: __ex_table+0x22f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: __ex_table) -> .LASF6833 (section: .debug_str)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: __ex_table) -> .LASF6835 (section: .debug_str)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: __ex_table) -> .LASF6837 (section: .debug_str)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: __ex_table) -> .LASF6839 (section: .debug_str)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: __ex_table) -> .LASF1880 (section: .debug_str)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2314 (section: __ex_table) -> .LASF1882 (section: .debug_str)
ERROR: modpost: __ex_table+0x2314 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x231c (section: __ex_table) -> .LASF1884 (section: .debug_str)
ERROR: modpost: __ex_table+0x231c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2320 (section: __ex_table) -> .LASF1886 (section: .debug_str)
ERROR: modpost: __ex_table+0x2320 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2328 (section: __ex_table) -> .LASF1888 (section: .debug_str)
ERROR: modpost: __ex_table+0x2328 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x232c (section: __ex_table) -> .LASF1890 (section: .debug_str)
ERROR: modpost: __ex_table+0x232c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2334 (section: __ex_table) -> .LASF1892 (section: .debug_str)
ERROR: modpost: __ex_table+0x2334 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2338 (section: __ex_table) -> .LASF1894 (section: .debug_str)
ERROR: modpost: __ex_table+0x2338 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2340 (section: __ex_table) -> .LASF2057 (section: .debug_str)
ERROR: modpost: __ex_table+0x2340 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2344 (section: __ex_table) -> .LASF2059 (section: .debug_str)
ERROR: modpost: __ex_table+0x2344 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x234c (section: __ex_table) -> .LASF2061 (section: .debug_str)
ERROR: modpost: __ex_table+0x234c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2350 (section: __ex_table) -> .LASF2063 (section: .debug_str)
ERROR: modpost: __ex_table+0x2350 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2358 (section: __ex_table) -> .LASF2065 (section: .debug_str)
ERROR: modpost: __ex_table+0x2358 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x235c (section: __ex_table) -> .LASF2067 (section: .debug_str)
ERROR: modpost: __ex_table+0x235c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2364 (section: __ex_table) -> .LASF2069 (section: .debug_str)
ERROR: modpost: __ex_table+0x2364 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2368 (section: __ex_table) -> .LASF2063 (section: .debug_str)
ERROR: modpost: __ex_table+0x2368 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2370 (section: __ex_table) -> .LLST3941 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2370 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x237c (section: __ex_table) -> .LASF587 (section: .debug_str)
ERROR: modpost: __ex_table+0x237c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> .LASF589 (section: .debug_str)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .LASF591 (section: .debug_str)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .LASF589 (section: .debug_str)
ERROR: modpost: __ex_table+0x238c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> .LASF594 (section: .debug_str)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2398 (section: __ex_table) -> .LASF596 (section: .debug_str)
ERROR: modpost: __ex_table+0x2398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a0 (section: __ex_table) -> .LASF598 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a4 (section: __ex_table) -> .LASF600 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2400 (section: __ex_table) -> __TRACE_SYSTEM____GFP_HIGHMEM_BIT (section: .init.data)
ERROR: modpost: __ex_table+0x2400 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2404 (section: __ex_table) -> __initcall__kmod_percpu__669_3371_percpu_enable_async4 (section: .initcall4.init)
>> ERROR: modpost: __ex_table+0x2404 references non-executable section '.initcall4.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .LASF521 (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .LASF523 (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .LASF525 (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .LASF527 (section: .debug_str)
ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .LASF529 (section: .debug_str)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2428 (section: __ex_table) -> .LASF531 (section: .debug_str)
ERROR: modpost: __ex_table+0x2428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> .LASF750 (section: .debug_str)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> .LASF752 (section: .debug_str)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .LASF754 (section: .debug_str)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .LASF756 (section: .debug_str)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2448 (section: __ex_table) -> .LASF758 (section: .debug_str)
ERROR: modpost: __ex_table+0x2448 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x244c (section: __ex_table) -> .LASF760 (section: .debug_str)
ERROR: modpost: __ex_table+0x244c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2454 (section: __ex_table) -> .LASF762 (section: .debug_str)
ERROR: modpost: __ex_table+0x2454 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2458 (section: __ex_table) -> .LASF756 (section: .debug_str)
ERROR: modpost: __ex_table+0x2458 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2460 (section: __ex_table) -> .LASF765 (section: .debug_str)
ERROR: modpost: __ex_table+0x2460 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2464 (section: __ex_table) -> .LASF756 (section: .debug_str)
ERROR: modpost: __ex_table+0x2464 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x246c (section: __ex_table) -> .LASF768 (section: .debug_str)
ERROR: modpost: __ex_table+0x246c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2470 (section: __ex_table) -> .LASF756 (section: .debug_str)
ERROR: modpost: __ex_table+0x2470 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2478 (section: __ex_table) -> .LASF771 (section: .debug_str)
ERROR: modpost: __ex_table+0x2478 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x247c (section: __ex_table) -> .LASF756 (section: .debug_str)
ERROR: modpost: __ex_table+0x247c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2484 (section: __ex_table) -> .LASF2598 (section: .debug_str)
ERROR: modpost: __ex_table+0x2484 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2488 (section: __ex_table) -> .LASF2600 (section: .debug_str)
ERROR: modpost: __ex_table+0x2488 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2490 (section: __ex_table) -> .LASF2602 (section: .debug_str)
ERROR: modpost: __ex_table+0x2490 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2494 (section: __ex_table) -> .LASF2604 (section: .debug_str)
ERROR: modpost: __ex_table+0x2494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x249c (section: __ex_table) -> .LASF2606 (section: .debug_str)
ERROR: modpost: __ex_table+0x249c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a0 (section: __ex_table) -> .LASF2604 (section: .debug_str)
ERROR: modpost: __ex_table+0x24a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a8 (section: __ex_table) -> .LASF471 (section: .debug_str)
ERROR: modpost: __ex_table+0x24a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24ac (section: __ex_table) -> .LASF473 (section: .debug_str)
ERROR: modpost: __ex_table+0x24ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b4 (section: __ex_table) -> .LASF475 (section: .debug_str)
ERROR: modpost: __ex_table+0x24b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> .LASF477 (section: .debug_str)
ERROR: modpost: __ex_table+0x24b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c0 (section: __ex_table) -> .LASF479 (section: .debug_str)
ERROR: modpost: __ex_table+0x24c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> .LASF477 (section: .debug_str)
ERROR: modpost: __ex_table+0x24c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24cc (section: __ex_table) -> .LASF3392 (section: .debug_str)
ERROR: modpost: __ex_table+0x24cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d0 (section: __ex_table) -> .LASF3394 (section: .debug_str)
ERROR: modpost: __ex_table+0x24d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> .LASF3396 (section: .debug_str)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> .LASF3398 (section: .debug_str)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> .LASF2890 (section: .debug_str)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> .LASF2892 (section: .debug_str)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> .LASF2109 (section: .debug_str)
ERROR: modpost: __ex_table+0x2538 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> .LASF2111 (section: .debug_str)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> .LASF2113 (section: .debug_str)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> .LASF2115 (section: .debug_str)
ERROR: modpost: __ex_table+0x2548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> .LASF1102 (section: .debug_str)
ERROR: modpost: __ex_table+0x2550 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> .LASF1104 (section: .debug_str)
ERROR: modpost: __ex_table+0x2554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> .LASF1106 (section: .debug_str)
ERROR: modpost: __ex_table+0x255c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> .LASF1108 (section: .debug_str)
ERROR: modpost: __ex_table+0x2560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> .LASF1110 (section: .debug_str)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> .LASF1112 (section: .debug_str)
ERROR: modpost: __ex_table+0x256c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2574 (section: __ex_table) -> .LASF1114 (section: .debug_str)
ERROR: modpost: __ex_table+0x2574 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2578 (section: __ex_table) -> .LASF1116 (section: .debug_str)
ERROR: modpost: __ex_table+0x2578 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
