Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E41211C
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061484; cv=none; b=GWEb522OcyMfKvgnAxUXCGiogJwIqYcFGccm542eKnvgwvIzZsQiVuYr7g/onF734tU97k9zymXXwClS5o1zSTekccfh+nz/B51gsi6B0q2r4TntE4ypiGU/kK7+fapz+/IjGABKYW3GaEJ/km5DCHMDlpbcqEw544IwEjF5V5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061484; c=relaxed/simple;
	bh=j1G2ymMaWXm47FVzn8bjKbiMXJ/1uO0ZTiyIakgs9II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUKHTYqqORx0qr3YPZxxEg5GsWeUd2KGP23rT93d2OKnWNuSPicKp4/fg7nmZ7OYljMjfiquQlrNI/LcOQd5hhiSentB9iEeZdA5Yo5yiWnrWzn6fbpH+8sWxIuDlaL3mjTthmu6MkVGBcog4s2V5xpLyfjYFOsmBfgPereqZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fs3BbA6K; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fs3BbA6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746061482; x=1777597482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1G2ymMaWXm47FVzn8bjKbiMXJ/1uO0ZTiyIakgs9II=;
  b=Fs3BbA6K7ZjzGvIrxu16RJBJ/O5aRcFMb365a9MK3CjMf1FzbdYxaHFS
   U59hOVIOh2kcqOBARdhZNe1ApqBt1A88rHeBsoQtbm6Fnt9id1YRR8f46
   UhgzMnaGubySpfPWwqCCzFaODb6J1ydeopG+Qr6ux6Ax0X/PO7V6A6leu
   HWvkkSB+oUCpnP0dUMAbnMsHC1+weuWvFr59tBQL7kMZA0tiZrc4CWiyN
   +DYYYDX1MZePIu6xJjpq/sU0HsU7M5JXpSpWotDBB58Do8UpE9wXvY1Pj
   PliQs7NsgEo7lYCQVToufeQSXJ2jgJnrjFDzZzazJ7QupWzeU9sE17bSb
   Q==;
X-CSE-ConnectionGUID: mFQowUyASfWzqbW0jnBsMQ==
X-CSE-MsgGUID: SwDZSnymQ1CH+C7ieOIXFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47755455"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="47755455"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 18:04:42 -0700
X-CSE-ConnectionGUID: 78pI6JOaSAiN0h+Gulultw==
X-CSE-MsgGUID: me9HocgfSLOqvk4hsrdifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="171507518"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2025 18:04:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAILu-0003sT-0o;
	Thu, 01 May 2025 01:04:38 +0000
Date: Thu, 1 May 2025 09:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [char-misc:char-misc-testing 2/2] /usr/bin/ld:
 drivers/misc/misc_minor_kunit.c:409: undefined reference to
 `__kunit_do_failed_assertion'
Message-ID: <202505010835.hNm1lXeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   20acf4dd46e4c0905676ad2a1d9a32041469893f
commit: 20acf4dd46e4c0905676ad2a1d9a32041469893f [2/2] char: misc: make miscdevice unit test built-in only
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: um-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010835.hNm1lXeW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010835.hNm1lXeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010835.hNm1lXeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_error':
   drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `kunit_binary_assert_format'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name_leak':
   drivers/misc/misc_minor_kunit.c:344: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:344: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name':
   drivers/misc/misc_minor_kunit.c:308: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:308: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
   drivers/misc/misc_minor_kunit.c:281: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:281: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
   drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_misc_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:53: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:53: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_static_minor':
   drivers/misc/misc_minor_kunit.c:43: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:43: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:33: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:33: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
   drivers/misc/misc_minor_kunit.c:99: undefined reference to `kunit_log_append'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
   drivers/misc/misc_minor_kunit.c:192: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:192: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_reverse':
   drivers/misc/misc_minor_kunit.c:588: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:588: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
   drivers/misc/misc_minor_kunit.c:552: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:552: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basic':
   drivers/misc/misc_minor_kunit.c:232: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:232: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic':
   drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_reverse':
   drivers/misc/misc_minor_kunit.c:507: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
   drivers/misc/misc_minor_kunit.c:466: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only_range':
   drivers/misc/misc_minor_kunit.c:423: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `__kunit_do_failed_assertion'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
