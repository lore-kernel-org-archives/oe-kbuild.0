Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6AFEADC
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Sep 2025 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889157; cv=none; b=JqgbtVH1f/R2hEuGWE4BJob9BBjxS194BNvxH89yBSauzNEAGCgAxl0kJvv752ffSOHNbd1y3nqP8c0EpYax3RZmofiqPXTIdghtdEGSl9rbZwKP69G+I3tR2crMqDme57vCMRWzbgKWG8XNPPPzdGFFcnF8wVFxKR+x3rGFG5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889157; c=relaxed/simple;
	bh=9LsWiVwjW0RXS5VqoEb0STRkgLLGUgwEzc04oBrMGzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeV121LTtCnRQjwE0FYhrh1wtotbXpl5p/w20s8bkHNLKrapYIhp3rdSw0gAzqCIXtOM8a2cAG4gn1v5Y3XMx0CJUDNWtbcB3CZWcEmiPMAfXIznM8QUGD67tpUNnCMx9m0HWoc3ceN5ddVnOAKDjOaAX6n3xH+c2hyf2RidJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxH2HNN4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxH2HNN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756889155; x=1788425155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9LsWiVwjW0RXS5VqoEb0STRkgLLGUgwEzc04oBrMGzs=;
  b=BxH2HNN4mC+znRScW3Q0lJvwRB0TsRpgyqZ4XIXhOe6GOv0o1ZmTUv9/
   noL6PtR9NIt53bBLCf0GsEzubwSq6s6ddpWH6BWZyN8MvVlZ7Faov8YLc
   53tu9a8aQB7iU7sUoNssg6ZgPvNje2Gy6Dg3AeghIq4itCCs4pFUg/mA0
   2HQdjRj8e3CxQyKWSxQsK0eZjt2DcGm+pf/YrMjVjUTSAWY4wpavik6tM
   Ac6peSSKQC+HolSxcdqRvu5lU/5IlxMRrz0jmw+WdSsQ11rvArdAR2gww
   Dxlh6VgBTN1lPkp0brwEqU8RYh24ktJkeCwZv/HVbzMArrjfLlu/jsOxQ
   Q==;
X-CSE-ConnectionGUID: YujeJYvORrSWGl8tnV9uYw==
X-CSE-MsgGUID: lXysuve0QfapEeTMFwq/1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76795538"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76795538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 01:45:53 -0700
X-CSE-ConnectionGUID: uMppFshDT4GfA8y7Kq/Krg==
X-CSE-MsgGUID: 5DzBwTM1TAOjFJAeFBzWoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171497472"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 01:45:52 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utj78-0003aZ-0B;
	Wed, 03 Sep 2025 08:45:23 +0000
Date: Wed, 3 Sep 2025 16:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5666/5946] ERROR: modpost: __ex_table+0x228c
 references non-executable section '__param'
Message-ID: <202509031602.jawiRIO5-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>
[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/31/319aaaacd7b9e7deba92a8a9006935e457cd32ac-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
commit: 319aaaacd7b9e7deba92a8a9006935e457cd32ac [5666/5946] pinctrl: allow to mark pin functions as requestable GPIOs
:::::: branch date: 3 hours ago
:::::: commit date: 10 hours ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509031602.jawiRIO5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031602.jawiRIO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509031602.jawiRIO5-lkp@intel.com/

Note: the linux-next/master HEAD 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> .LASF1069 (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> .LASF1071 (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> .LASF1073 (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .LASF1075 (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .LASF789 (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> .LASF1078 (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> .LASF789 (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> .LASF1081 (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> .LASF1083 (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .LASF1085 (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> .LASF1087 (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .LASF1089 (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> .LASF1091 (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .LASF1093 (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> .LASF1091 (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: __ex_table) -> .LASF1096 (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: __ex_table) -> .LASF1098 (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21cc (section: __ex_table) -> .LASF1100 (section: .debug_str)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d0 (section: __ex_table) -> .LASF1102 (section: .debug_str)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d8 (section: __ex_table) -> .LASF49 (section: .debug_str)
ERROR: modpost: __ex_table+0x21d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21dc (section: __ex_table) -> .LASF51 (section: .debug_str)
ERROR: modpost: __ex_table+0x21dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e4 (section: __ex_table) -> .LASF54 (section: .debug_str)
ERROR: modpost: __ex_table+0x21e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e8 (section: __ex_table) -> .LASF55 (section: .debug_str)
ERROR: modpost: __ex_table+0x21e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f0 (section: __ex_table) -> .LASF1484 (section: .debug_str)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f4 (section: __ex_table) -> .LASF1405 (section: .debug_str)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21fc (section: __ex_table) -> .LASF1487 (section: .debug_str)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: __ex_table) -> .LASF1405 (section: .debug_str)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2208 (section: __ex_table) -> .LASF1490 (section: .debug_str)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x220c (section: __ex_table) -> .LASF1405 (section: .debug_str)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2214 (section: __ex_table) -> .LASF1493 (section: .debug_str)
ERROR: modpost: __ex_table+0x2214 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2218 (section: __ex_table) -> .LASF1495 (section: .debug_str)
ERROR: modpost: __ex_table+0x2218 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: __ex_table) -> .LASF1497 (section: .debug_str)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: __ex_table) -> .LASF1495 (section: .debug_str)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: __ex_table) -> .LASF1500 (section: .debug_str)
ERROR: modpost: __ex_table+0x222c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: __ex_table) -> .LASF1495 (section: .debug_str)
ERROR: modpost: __ex_table+0x2230 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: __ex_table) -> .LASF41 (section: .debug_str)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: __ex_table) -> .LASF43 (section: .debug_str)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2244 (section: __ex_table) -> ssd1307fb_of_match (section: .rodata)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2248 (section: __ex_table) -> ssd1307fb_ssd1306_deviceinfo (section: .data)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> ssd1307fb_ssd1309_deviceinfo (section: .data)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: __ex_table) -> ssd1307fb_driver (section: .data)
ERROR: modpost: __ex_table+0x2254 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: __ex_table) -> __initcall__kmod_ssd1307fb__599_803_ssd1307fb_driver_init6 (section: .initcall6.init)
ERROR: modpost: __ex_table+0x225c references non-executable section '.initcall6.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> __UNIQUE_ID_modinfo602 (section: .modinfo)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: __ex_table) -> __UNIQUE_ID_modinfo600 (section: .modinfo)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: __ex_table) -> __UNIQUE_ID_modinfo597 (section: .modinfo)
ERROR: modpost: __ex_table+0x226c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> __param_refreshrate (section: __param)
>> ERROR: modpost: __ex_table+0x228c references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: __ex_table) -> .LC1 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d4 (section: __ex_table) -> .LASF493 (section: .debug_str)
ERROR: modpost: __ex_table+0x22d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d8 (section: __ex_table) -> .LASF495 (section: .debug_str)
ERROR: modpost: __ex_table+0x22d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22ec (section: __ex_table) -> .LLST70 (section: .debug_loc)
ERROR: modpost: __ex_table+0x22ec references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: __ex_table) -> .LASF2912 (section: .debug_str)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: __ex_table) -> .LASF2914 (section: .debug_str)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: __ex_table) -> .LASF2916 (section: .debug_str)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: __ex_table) -> .LASF2918 (section: .debug_str)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: __ex_table) -> .LASF548 (section: .debug_str)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2314 (section: __ex_table) -> .LASF550 (section: .debug_str)
ERROR: modpost: __ex_table+0x2314 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x231c (section: __ex_table) -> .LASF552 (section: .debug_str)
ERROR: modpost: __ex_table+0x231c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2320 (section: __ex_table) -> .LASF554 (section: .debug_str)
ERROR: modpost: __ex_table+0x2320 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2328 (section: __ex_table) -> .LASF556 (section: .debug_str)
ERROR: modpost: __ex_table+0x2328 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x232c (section: __ex_table) -> .LASF558 (section: .debug_str)
ERROR: modpost: __ex_table+0x232c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2334 (section: __ex_table) -> .LASF560 (section: .debug_str)
ERROR: modpost: __ex_table+0x2334 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2338 (section: __ex_table) -> .LASF562 (section: .debug_str)
ERROR: modpost: __ex_table+0x2338 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2370 (section: __ex_table) -> .LASF3804 (section: .debug_str)
ERROR: modpost: __ex_table+0x2370 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2374 (section: __ex_table) -> .LASF3806 (section: .debug_str)
ERROR: modpost: __ex_table+0x2374 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x237c (section: __ex_table) -> .LASF1106 (section: .debug_str)
ERROR: modpost: __ex_table+0x237c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> .LASF1108 (section: .debug_str)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .LASF1110 (section: .debug_str)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .LASF1108 (section: .debug_str)
ERROR: modpost: __ex_table+0x238c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> .LASF1113 (section: .debug_str)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2398 (section: __ex_table) -> .LASF1115 (section: .debug_str)
ERROR: modpost: __ex_table+0x2398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a0 (section: __ex_table) -> .LASF1117 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a4 (section: __ex_table) -> .LASF1119 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c4 (section: __ex_table) -> .LASF321 (section: .debug_str)
ERROR: modpost: __ex_table+0x23c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c8 (section: __ex_table) -> .LASF323 (section: .debug_str)
ERROR: modpost: __ex_table+0x23c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d0 (section: __ex_table) -> .LASF325 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d4 (section: __ex_table) -> .LASF327 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23dc (section: __ex_table) -> .LASF329 (section: .debug_str)
ERROR: modpost: __ex_table+0x23dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .LASF331 (section: .debug_str)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e8 (section: __ex_table) -> .LASF333 (section: .debug_str)
ERROR: modpost: __ex_table+0x23e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ec (section: __ex_table) -> .LASF331 (section: .debug_str)
ERROR: modpost: __ex_table+0x23ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f4 (section: __ex_table) -> .LASF2857 (section: .debug_str)
ERROR: modpost: __ex_table+0x23f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f8 (section: __ex_table) -> .LASF2859 (section: .debug_str)
ERROR: modpost: __ex_table+0x23f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .LASF761 (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .LASF763 (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .LASF765 (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .LASF767 (section: .debug_str)
ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .LASF769 (section: .debug_str)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2428 (section: __ex_table) -> .LASF771 (section: .debug_str)
ERROR: modpost: __ex_table+0x2428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> .LASF4425 (section: .debug_str)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> .LASF4427 (section: .debug_str)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .LASF4429 (section: .debug_str)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .LASF4431 (section: .debug_str)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2448 (section: __ex_table) -> .LASF4433 (section: .debug_str)
ERROR: modpost: __ex_table+0x2448 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x244c (section: __ex_table) -> .LASF4435 (section: .debug_str)
ERROR: modpost: __ex_table+0x244c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2454 (section: __ex_table) -> .LASF4437 (section: .debug_str)
ERROR: modpost: __ex_table+0x2454 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2458 (section: __ex_table) -> .LASF4431 (section: .debug_str)
ERROR: modpost: __ex_table+0x2458 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
