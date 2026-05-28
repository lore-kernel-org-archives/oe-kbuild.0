Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C918CA4E
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 04:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941815; cv=none; b=jXmjRB7dvaePZuyaY9HVZxY2gbN3AGHIwgsIxRFoOAfFk78abwIy4oF9Oo269o5xVhiTP30mzIXwIKH6uQFw4LQke5dBeQacHtkedS6SALNS0BZtRCZj6X/UL6+B/m4rIGi7Z4BjIgifpi0Lh6NiSmDzVoGs+Hwh54sTggEXtrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941815; c=relaxed/simple;
	bh=ETwlYZ6bWBObzkBHW2/nLvCpQlLRrsGdD8DuI30ZbSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p7oaBXZoImUtkn4riAQYcwOrh9EtcASLaMvK3euwh4B1uhj7VA5uAgBmv2gxnB8ISMHUeHwl1kH56xuWbQsG0dG38WNfNt6pc93X5QKg18BcX/fSYnyJYav64qsqKMQvarTZPsndmC57OQxv0ijTrpFtuGFrAINSmxypw0nPsNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lcz7SYWi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lcz7SYWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779941813; x=1811477813;
  h=date:from:to:cc:subject:message-id;
  bh=ETwlYZ6bWBObzkBHW2/nLvCpQlLRrsGdD8DuI30ZbSQ=;
  b=Lcz7SYWilIVULa6Y61guyZ5rj+FfXKbWhXBj39YM3d4SKvRs0u0gfDhD
   FK0jhH+kr/TbaTh5EgN7RaQEkElK5Ykwx+Rk/OCUOFNm8drU5K3yw3MaJ
   DS+V3lu4VOlN7kJ2icQf2iYsFSHBBYH3N/spYoK1gqXsuxFzuQlnPEkfd
   e+81oYIkYgBNkD8FCxTRT9AUbGEnspEq6EB4u9ObCMoNjyr52A35SbCiC
   ew4Qj0wUpGpXiK1d30UINMo4j+0ZejyoKpiiy7rJB9LvkPd5FZDtiS+SB
   dsnZymESAdBlfUd98S7id59SSiVPyW+qImI7lbUCSDCLUb/zS0Fes9E9l
   Q==;
X-CSE-ConnectionGUID: 7yfPGj3yRJGv2D2cjMwhzA==
X-CSE-MsgGUID: t6gqXlZsS4Wj3LvHzkbwpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84669523"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="84669523"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 21:16:53 -0700
X-CSE-ConnectionGUID: nUTRZcAoTgiYh5SoTlseHw==
X-CSE-MsgGUID: 5K7q3qhpTJyUzmpb9dyi2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="247513644"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 May 2026 21:16:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSSAr-000000005Wu-1c8O;
	Thu, 28 May 2026 04:16:49 +0000
Date: Thu, 28 May 2026 12:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-lts 2/2]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness
 bug returning '(-61)'
Message-ID: <202605281200.z115VoHV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [2/2] misc: pci_endpoint_test: Give disabled BARs a distinct error code
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260528/202605281200.z115VoHV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281200.z115VoHV-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2a35703a6a00e8 Niklas Cassel          2024-03-22  281  
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e8 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e8 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e8 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec674 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec674 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec674 Niklas Cassel          2025-01-23 @292  		return -ENODATA;
f615e8d2dec674 Niklas Cassel          2025-01-23  293  
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580 Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e8 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580 Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e8 Niklas Cassel          2024-03-22  300  	/*
2a35703a6a00e8 Niklas Cassel          2024-03-22  301  	 * Allocate a buffer of max size 1MB, and reuse that buffer while
2a35703a6a00e8 Niklas Cassel          2024-03-22  302  	 * iterating over the whole BAR size (which might be much larger).
2a35703a6a00e8 Niklas Cassel          2024-03-22  303  	 */
2a35703a6a00e8 Niklas Cassel          2024-03-22  304  	buf_size = min(SZ_1M, bar_size);
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  305  
2a35703a6a00e8 Niklas Cassel          2024-03-22  306  	write_buf = kmalloc(buf_size, GFP_KERNEL);
2a35703a6a00e8 Niklas Cassel          2024-03-22  307  	if (!write_buf)
2a35703a6a00e8 Niklas Cassel          2024-03-22  308  		return false;
2a35703a6a00e8 Niklas Cassel          2024-03-22  309  
2a35703a6a00e8 Niklas Cassel          2024-03-22  310  	read_buf = kmalloc(buf_size, GFP_KERNEL);
2a35703a6a00e8 Niklas Cassel          2024-03-22  311  	if (!read_buf)
2a35703a6a00e8 Niklas Cassel          2024-03-22  312  		return false;
2a35703a6a00e8 Niklas Cassel          2024-03-22  313  
2a35703a6a00e8 Niklas Cassel          2024-03-22  314  	iters = bar_size / buf_size;
2a35703a6a00e8 Niklas Cassel          2024-03-22  315  	for (j = 0; j < iters; j++)
2a35703a6a00e8 Niklas Cassel          2024-03-22  316  		if (pci_endpoint_test_bar_memcmp(test, barno, buf_size * j,
2a35703a6a00e8 Niklas Cassel          2024-03-22  317  						 write_buf, read_buf, buf_size))
2a35703a6a00e8 Niklas Cassel          2024-03-22  318  			return false;
2a35703a6a00e8 Niklas Cassel          2024-03-22  319  
2a35703a6a00e8 Niklas Cassel          2024-03-22  320  	remain = bar_size % buf_size;
2a35703a6a00e8 Niklas Cassel          2024-03-22  321  	if (remain)
2a35703a6a00e8 Niklas Cassel          2024-03-22  322  		if (pci_endpoint_test_bar_memcmp(test, barno, buf_size * iters,
2a35703a6a00e8 Niklas Cassel          2024-03-22  323  						 write_buf, read_buf, remain))
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  324  			return false;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  325  
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  326  	return true;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  327  }
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  328  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
