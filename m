Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94091A83FF
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 22:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275249; cv=none; b=aE1Snm4hJWyswaWSNlHat7k/fNBzg/HIMSk3zfXrZixGSCxWzefWp9EOuFAhYwamRNr1YCHFJWo9i3GYPODHCa4lgwsfFzu+KX+ELaM17f+HEeNFZygVqnmgiSgK+Azg5Qhsjap9/HurFMqJbVyntgB4BW8vCp4JwyMdqCJjz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275249; c=relaxed/simple;
	bh=KFMh9D5OrwwwGkvxR4JCgP6SjsR/RtEm6xX5YbmJNEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JADgleIcBwtbIg/OIza1+/9VYEcj3WKOnNJUbmciERoJnyIh3D8osjyV6As2nP1DHsCQKhtZCcB8K4++0e8+dUcSccgNnO1j/zy0xyPq+UvACvqtFQDoLSvFSiAu3qDIwAaZXK3e+vfpaEqCigvUegrfhzAk5QXWiKnDzOi6CRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9Eo1I4M; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9Eo1I4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738275248; x=1769811248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFMh9D5OrwwwGkvxR4JCgP6SjsR/RtEm6xX5YbmJNEA=;
  b=E9Eo1I4MjSPxWYYhVgwdN4ZZuRQ1s+7MdUzTb4vF+RzslmBPp2ButKUk
   6To53yUesU90XjB6IhlI0HkGif3m6YITQ+6DWLlvoaeL0lFJVNfznttI8
   iTg7S7yHXYYJGa1HbuYXQtalEwII+qkrKdFURNFnHtEc7/N6fvOcs89R0
   6i+8vYHhiK2naVkMXhrlUxfwUGOa34WMIiwzjRyZNI8Wkc2Ybugvk7HTT
   4Y/JCRMQmtSNnib7a0f3i0Cp/PUd5uhghVeaKMJXPuTd1ARxNToIjISfd
   yTGV59wo2sZl1DcndDbbjUwIpxQB1kVWC2DRHCB5l/yqdtOO4n+yl6Rce
   g==;
X-CSE-ConnectionGUID: 05YotTZsSLGHwIL3Rlr1PQ==
X-CSE-MsgGUID: +GQqxF3hRH66DcD+FINm6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38947860"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38947860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 14:14:06 -0800
X-CSE-ConnectionGUID: zpyUQ1qsSdmjtcBa13jy6w==
X-CSE-MsgGUID: bI9Ri1VNTKygBRJu+KPwaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114065414"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2025 14:14:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdcnR-000l2p-2R;
	Thu, 30 Jan 2025 22:14:01 +0000
Date: Fri, 31 Jan 2025 06:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk-pm:cpufreq/core-attr 34/47]
 drivers/cpufreq/powernv-cpufreq.c:1130 powernv_cpufreq_init() error: buffer
 overflow 'powernv_cpu_freq_attr' 2 <= 2
Message-ID: <202501310628.pgAZDRtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core-attr
head:   e3129c51f8623ce847b0486105bc00cd45ca0250
commit: 8ff649df04cd3fb05febecb28114cb116f68dcad [34/47] cpufreq: powernv: Stop setting common freq attributes
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc64-randconfig-r073-20250130 (https://download.01.org/0day-ci/archive/20250131/202501310628.pgAZDRtE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501310628.pgAZDRtE-lkp@intel.com/

smatch warnings:
drivers/cpufreq/powernv-cpufreq.c:1130 powernv_cpufreq_init() error: buffer overflow 'powernv_cpu_freq_attr' 2 <= 2

vim +/powernv_cpu_freq_attr +1130 drivers/cpufreq/powernv-cpufreq.c

c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1108  
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1109  static int __init powernv_cpufreq_init(void)
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1110  {
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1111  	int rc = 0;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1112  
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1113  	/* Don't probe on pseries (guest) platforms */
e4d54f71d29997 Stewart Smith           2015-12-09  1114  	if (!firmware_has_feature(FW_FEATURE_OPAL))
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1115  		return -ENODEV;
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1116  
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1117  	/* Discover pstates from device tree and init */
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1118  	rc = init_powernv_pstates();
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1119  	if (rc)
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1120  		goto out;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1121  
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1122  	/* Populate chip info */
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1123  	rc = init_chip_info();
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1124  	if (rc)
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1125  		goto out;
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1126  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1127  	if (powernv_pstate_info.wof_enabled)
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1128  		powernv_cpufreq_driver.boost_enabled = true;
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1129  	else
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03 @1130  		powernv_cpu_freq_attr[SCALING_BOOST_FREQS_ATTR_INDEX] = NULL;
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1131  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1132  	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1133  	if (rc) {
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1134  		pr_info("Failed to register the cpufreq driver (%d)\n", rc);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1135  		goto cleanup;
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1136  	}
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1137  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1138  	if (powernv_pstate_info.wof_enabled)
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1139  		cpufreq_enable_boost_support();
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1140  
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1141  	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1142  	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1143  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1144  	return 0;
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1145  cleanup:
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1146  	clean_chip_info();
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1147  out:
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1148  	pr_info("Platform driver disabled. System does not support PState control\n");
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1149  	return rc;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1150  }
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1151  module_init(powernv_cpufreq_init);
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1152  

:::::: The code at line 1130 was first introduced by commit
:::::: b12f7a2b01f7adebb9982a6547f4e930914829a9 cpufreq: powernv: Add boost files to export ultra-turbo frequencies

:::::: TO: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
