Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE119E7FB
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752306; cv=none; b=eW74raVyz5Ax9SBJCyo/Sro6iyzgJGoZn6aKMProMywMTNWRidQDNfo+hoIqoOauMmIiqVXi0HsS8jFiE+q4gsl7EZTS0XsV3dqL0KTPhVGkV/SXAc0mP5xtF6LzvqIpik/+CFQkSGc7KChKIt38rPAyot1LKFnU/dNoP+xb0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752306; c=relaxed/simple;
	bh=qR43rhPFYYo+6aHUCDTfoWzi0UFTFDvE5B22zRr/1r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCzVb5kH0jrRxHxem7XaBMkavvashV//E+RuUJ5FsjTmGjXTEPE/UxS/N6tBsDJHdbKmYbgIoF0k+HWHSS9oul+NBC30uepkUlsrLbQrAF0t6qNOMud/U+ZkglPz5nqlCEtyaIKPEpSWoZi2fplpKb7dPXPVfXdsbg+EOT2fUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fM6cF5wv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fM6cF5wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726752303; x=1758288303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qR43rhPFYYo+6aHUCDTfoWzi0UFTFDvE5B22zRr/1r0=;
  b=fM6cF5wvsa75fK4cdJnFAVApbIJIzcnbNCcKGE3qv8s/z5qq/pewsNvl
   FOVYoWy3EaRRfG6H010s873OKjDBgvy5uKDZPcgYqwUK1ffgejqUffCda
   6X2ogeT8Dh4n2jtvo3Gn+xh6q8K2jrB97NTijp3PaDQ8og0sHeGXLuO6/
   s1bZXvZ/T3mIxt7PGTqLQbPzUc/1ruiReB0e1EYh4FMX/j3nc9ogtK/qt
   IV8LFT6XA8kA4i8RvKHH5mHjAkwDPGSyW5mUN7Oh9i61wA93ge+seoJeo
   org3Gn22jrnnXt6+HqeuKfATqDW/6HC9nCLoEgdFrHSFaOm3Y7XdVYa12
   w==;
X-CSE-ConnectionGUID: o7e1ryLgRFm1jQEeWynokA==
X-CSE-MsgGUID: 9k5NOl6mTb+NEcEhA6jsVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25806979"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="25806979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 06:24:59 -0700
X-CSE-ConnectionGUID: dnO215qSSKC2p006UVgyoA==
X-CSE-MsgGUID: DbBRC0rCTO2cLKC367PbeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="69523890"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2024 06:24:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srH9T-000DJg-1O;
	Thu, 19 Sep 2024 13:24:55 +0000
Date: Thu, 19 Sep 2024 21:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x6fc): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 remove_wait_queue
Message-ID: <202409192125.xEBRNBfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Elliot Berman <quic_eberman@quicinc.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   839c4f596f898edc424070dc8b517381572f8502
commit: fbaa6a181a4b1886cbf4214abdf9a2df68471510 sched/core: Remove ifdeffery for saved_state
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-r005-20220823 (https://download.01.org/0day-ci/archive/20240919/202409192125.xEBRNBfR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409192125.xEBRNBfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409192125.xEBRNBfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.c:2376:(.text+0x6783): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write':
   include/linux/mtd/map.h:360:(.text+0x6898): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0xa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:1997:(.xiptext+0x44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1997:(.xiptext+0x5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xa0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xc5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:2010:(.xiptext+0xf2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x107): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x110): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x11f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x136): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2014:(.xiptext+0x157): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x177): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1032:(.xiptext+0x18a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x197): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x1a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x1b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x1be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x2bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x2c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x2d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x2e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x31a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x32e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x340): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x353): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x376): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x397): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x3bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x3cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x3fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x40a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x417): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x422): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x42f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x43e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x457): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1059:(.xiptext+0x47a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x487): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x493): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x503): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x51a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x52b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x53e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x54d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1082:(.xiptext+0x55f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x56e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x574): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x586): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x5aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x5b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1091:(.xiptext+0x5c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x5d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x603): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x61b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x626): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x632): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x647): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x650): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x676): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x67f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x68f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1100:(.xiptext+0x6a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x6ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x6ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x6ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x6d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x6e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x6eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x6f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
>> arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x6fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1108:(.xiptext+0x70e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x72f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x73e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x74a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x75b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x76a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x78e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde0)
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x796): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x7ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x7c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x7cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x7e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x7f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x804): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x82b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x857): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x864): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x86e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x87f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x8c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x8de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x8f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x900): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x90e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x91b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x92e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x938): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1132:(.xiptext+0x946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1133:(.xiptext+0x95b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1134:(.xiptext+0x964): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x96e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x97a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x98e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x996): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x9a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1143:(.xiptext+0x9ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x9c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x9ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x9d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x9de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x9f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x9fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0xa0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xa9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xab7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xac4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2800)
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xadb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0xae1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1293:(.xiptext+0xb53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:1293:(.xiptext+0xb5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0xb68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0xb76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0xb8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xb9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xbab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xbbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xbca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xbd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xbdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xbf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xbff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0xc22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0xc2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xc3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xc6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xc7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xc8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xc9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xcab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xcbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xccb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xcde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xceb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xcfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0xd0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0xd17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xd9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xda4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdcf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xde2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0xe06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0xe8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xeae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xeba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0xec3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0xed0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0xee7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0xefa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:851:(.xiptext+0xf04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:852:(.xiptext+0xf13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0xf2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0xf3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0xf46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0xf5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0xf6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0xf7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0xf93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0xf9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0xfae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0xfc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0xfcf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0xfde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0xfee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0xff8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x100b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1016): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x101c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x1027): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x102f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x103e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x104b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x1056): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x1067): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:865:(.xiptext+0x108a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:865:(.xiptext+0x1094): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:869:(.xiptext+0x10a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x10b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x10be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x10db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:871:(.xiptext+0x10e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x10f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x178c)
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1109): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x111a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x113a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x115f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x116c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1176): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1186): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x122a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x1232): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x123e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x124c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1951:(.xiptext+0x1263): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   include/linux/jiffies.h:571:(.xiptext+0x126c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/jiffies.h:571:(.xiptext+0x1278): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1952:(.xiptext+0x1284): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x1298): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x12a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x12aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x12b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
>> arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x12ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x12d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x12f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x12ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x1316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x132a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x133f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x134b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x135b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x137b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x1387): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x1393): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x13ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x13b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x13c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1964:(.xiptext+0x13df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1965:(.xiptext+0x13eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x13fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x1413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x141b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x142a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x143a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x1444): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1975:(.xiptext+0x1457): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x1462): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x1468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x1473): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x147b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x148a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x1497): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x14a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x14b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1988:(.xiptext+0x14d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1988:(.xiptext+0x14de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1982:(.xiptext+0x14f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1977:(.xiptext+0x1502): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2754)
   drivers/mtd/chips/cfi_cmdset_0002.c:1982:(.xiptext+0x150f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1982:(.xiptext+0x151a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1537): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1544): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1554): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x178c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1567): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1577): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x159a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x15a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x15bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x15cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x15d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x15e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1676): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x1692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x169b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x16aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0x16c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0x16d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0x16e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x16ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x16fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x1712): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x171f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x172e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x173b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x174a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x1762): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x176f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x177c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1665:(.xiptext+0x178e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1666:(.xiptext+0x179e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1666:(.xiptext+0x17ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0x17be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1673:(.xiptext+0x17cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1673:(.xiptext+0x17d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x17f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x17ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x180c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x181b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x1828): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x1843): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x1850): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x185e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2754)
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1886): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1894): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x189f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x18ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x18ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x18da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x18e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x18f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0x1902): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x1916): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x1923): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4


vim +61 arch/xtensa/include/asm/irqflags.h

df9ee29270c11d David Howells 2010-10-07  57  
df9ee29270c11d David Howells 2010-10-07  58  static inline void arch_local_irq_enable(void)
df9ee29270c11d David Howells 2010-10-07  59  {
df9ee29270c11d David Howells 2010-10-07  60  	unsigned long flags;
df9ee29270c11d David Howells 2010-10-07 @61  	asm volatile("rsil %0, 0" : "=a" (flags) :: "memory");
df9ee29270c11d David Howells 2010-10-07  62  }
df9ee29270c11d David Howells 2010-10-07  63  

:::::: The code at line 61 was first introduced by commit
:::::: df9ee29270c11dba7d0fe0b83ce47a4d8e8d2101 Fix IRQ flag handling naming

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
