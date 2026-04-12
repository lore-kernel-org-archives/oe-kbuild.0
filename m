Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F040DFD9
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997344; cv=none; b=fYaxj2J5iJQwreuhtUGpDHgy9OMxkd2zAgUopT9zEKDI7qnOZE3yMbyeGVVITz6kbs9V6gcaWpUb3Qsdg4G298Sjm9tlwr9+l4gtYA09CVhaYncnzgDdq3iJq2zkMt4S1O0wRqck4h7k/s8KaLKEAYEFukDWVmTIobe6iZJ71pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997344; c=relaxed/simple;
	bh=fWixOtdfWpC7iPLDRhDa11V58i1CsVnDttSnkT0Jj1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WMBf4eCgk3FzZZKcMGaSyzfx7inUqNJilZqSRSwBun9uL8j5DjnQ7oT9OkUkJgyAqlC+PQ96xDX9sNKLUDJJ+cVfU/jFoQWG8rEF4JKtwV/gIkO6RbFJBFSycy+csoDyg12ZmVvjT5jwIEUci6sEvfpTTojkuoEc06wqlbpgt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFJIIsDO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFJIIsDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775997343; x=1807533343;
  h=date:from:to:cc:subject:message-id;
  bh=fWixOtdfWpC7iPLDRhDa11V58i1CsVnDttSnkT0Jj1c=;
  b=LFJIIsDOJUYHhzlShd3iArWw7x+996Mkx5P8BuS2iE95OJPc42LrKYQR
   QxrhBfnvQ7PRMfauOyvbKuuwvw+DFBYBzJ3cisJkKGkteh9QrZ1C30z7w
   96KJnN+5bMTcDP4sJx19yqugxE00L48ps9Hx/1nG+GxOKkMCf68xtdujS
   +6OxLm9zoCkRSEvv2nrSJtjOlw0tjU0acQexxoF1P6sEh1kdwFdLZQTnp
   Kc41orLYUcByyYCR0UwjhK8eO49wIaWN0Vn/WTBXtZXRtxHilfHoPoW1Z
   S7rzQWMMLQkHtyDjWiZvrqs+fuaWpvE1zLl6SK+998h509ZD+D0GDul5Y
   Q==;
X-CSE-ConnectionGUID: bRiMrPb7R/iqz60d323TXw==
X-CSE-MsgGUID: a2eA3ZJFSHe+QlsU1neMyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64482152"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="64482152"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 05:35:42 -0700
X-CSE-ConnectionGUID: codZT3NTQviH7V/RRjRE1A==
X-CSE-MsgGUID: PslJAG0oRU+ExjnW5UgAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="234526031"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2026 05:35:42 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBu2N-000000002Bp-0s11;
	Sun, 12 Apr 2026 12:35:39 +0000
Date: Sun, 12 Apr 2026 20:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/iio/frequency/ad9832.c:115:53: error:
 expected ';' at end of declaration
Message-ID: <202604122044.v8Ob5K4e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Joshua-Crofts/iio-frequency-ad9832-remove-kernel-h-proxy-header/20260412-132456, commit: 1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Joshua Crofts <joshua.crofts1@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joshua-Crofts/iio-frequency-ad9832-remove-kernel-h-proxy-header/20260412-132456
head:   1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1
commit: 1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1 iio: frequency: ad9832: simplify bitwise math
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc64-randconfig-002-20260412 (https://download.01.org/0day-ci/archive/20260412/202604122044.v8Ob5K4e-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122044.v8Ob5K4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604122044.v8Ob5K4e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/iio/frequency/ad9832.c:115:53: error: expected ';' at end of declaration
     115 |         u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
         |                                                            ^
         |                                                            ;
   1 error generated.


vim +115 drivers/staging/iio/frequency/ad9832.c

d89aa24585a5e35 drivers/staging/iio/frequency/ad9832.c Narcisa Ana Maria Vasile 2017-02-27  112  
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  113  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  114  {
1d815eeb63e9efc drivers/staging/iio/frequency/ad9832.c Joshua Crofts            2026-04-11 @115  	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
1d815eeb63e9efc drivers/staging/iio/frequency/ad9832.c Joshua Crofts            2026-04-11  116  
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  117  	do_div(freqreg, mclk);
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  118  	return freqreg;
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  119  }
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
