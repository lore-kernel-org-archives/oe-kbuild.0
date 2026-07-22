Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116FD3E5A2B
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741262; cv=none; b=e3Lcp5V0HVQE28dp6LJAobZ6ie+HsmkxxAgIyFy7pjSpwednjVq1yidFRLzm9G7OYJ2vTKoy/isjTEGbrVBlDtUqo0GM1lHee8FZU7ZMGR+0i2GyX9Hm8txx+eBp8AakpR/ql7b17ClZYRRwebRYkCrGjBO+GymDtS7CZQ5QGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741262; c=relaxed/simple;
	bh=bgRnmeqZjqo0BZfYLh/KMYCnmuSKO8a0SupumZhwmIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRFNPCdUkMGoZPqHBtakDDhGX40S9y+DS+tVDBEMXik3JcqIxbKsQzmrqYz5QuvmmfA33JyelHiwSFd74qtoQGWlc3IUZtFq2j/3D1bqaQM4GUgFnxJECJLQ5XOXN+NJGkKeqcncwYjWp6hg8LRsD0y+TFJ8uswi8tWkYIlOQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3BAJU5K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3BAJU5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784741257; x=1816277257;
  h=date:from:to:cc:subject:message-id;
  bh=bgRnmeqZjqo0BZfYLh/KMYCnmuSKO8a0SupumZhwmIw=;
  b=X3BAJU5KX/Erk6uun4kbvwFMgHf/c3NL1YmJBbVVjWTSNctUJ3fRVTgV
   1MQP35yB3xVRl2JAOZEHNaKre8syzl7H5IKlu74WJYRBeY6DBo05GXf8V
   yTEqLukIXbPlTzWyt4nmoAN1OOni1+EnE+zxYXsKO7kiEmfKa/m1zV+cc
   As7ox8mmC6BEJkXZ/S4R9HsxCUtR4cAKXxB2AgCPgXHw1XFUPFdox1FW0
   k64qPN3uFf5PX4CLIuyxHMFHN32eC3TbT7uzEqb1cxyF11MSPVYXyzIBS
   IycQqO0+9uhcgFm4DyklThn7JJR3YM8iwEgZHUaqUBEMFKNorJrb+TbNR
   g==;
X-CSE-ConnectionGUID: L6k2iyOOR2Gyt1P9X9oAhA==
X-CSE-MsgGUID: 1cMctBQtTw2uyEXIRBpHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96900498"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96900498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 10:27:36 -0700
X-CSE-ConnectionGUID: BnB8BqBLTdm5HpckIMGpAg==
X-CSE-MsgGUID: imzZ4AbeR6KHDimoZyetfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="282670157"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2026 10:27:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmajE-00000000Yvd-0p2r;
	Wed, 22 Jul 2026 17:27:32 +0000
Date: Thu, 23 Jul 2026 01:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [driver-core:driver-core-testing 22/28]
 drivers/base/test/platform-device-test.c:395 platform_device_two_swnodes()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202607230111.ZOK7gFtl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   0e6f8ccd4618afdb504d5c56fe2fea1a2cd5d86a
commit: 397f0a3958c97228c3c3f53a603eaaa0e7fb3fda [22/28] driver core: platform: tests: add test cases for correct swnode removal
:::::: branch date: 19 hours ago
:::::: commit date: 3 days ago
config: alpha-randconfig-r071-20260722 (https://download.01.org/0day-ci/archive/20260723/202607230111.ZOK7gFtl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607230111.ZOK7gFtl-lkp@intel.com/

New smatch warnings:
drivers/base/test/platform-device-test.c:395 platform_device_two_swnodes() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/base/test/platform-device-test.c:407 platform_device_two_swnodes() warn: passing zero to 'PTR_ERR'
drivers/base/test/platform-device-test.c:419 platform_device_two_swnodes() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +395 drivers/base/test/platform-device-test.c

397f0a3958c972 Bartosz Golaszewski 2026-07-16  363  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  364  /*
397f0a3958c972 Bartosz Golaszewski 2026-07-16  365   * Check that passing two software nodes to platform_device_register_full()
397f0a3958c972 Bartosz Golaszewski 2026-07-16  366   * fails.
397f0a3958c972 Bartosz Golaszewski 2026-07-16  367   */
397f0a3958c972 Bartosz Golaszewski 2026-07-16  368  static void platform_device_two_swnodes(struct kunit *test)
397f0a3958c972 Bartosz Golaszewski 2026-07-16  369  {
397f0a3958c972 Bartosz Golaszewski 2026-07-16  370  	static const struct property_entry properties[] = {
397f0a3958c972 Bartosz Golaszewski 2026-07-16  371  		PROPERTY_ENTRY_U32("foo", 42),
397f0a3958c972 Bartosz Golaszewski 2026-07-16  372  		{ }
397f0a3958c972 Bartosz Golaszewski 2026-07-16  373  	};
397f0a3958c972 Bartosz Golaszewski 2026-07-16  374  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  375  	struct platform_device_info pdevinfo;
397f0a3958c972 Bartosz Golaszewski 2026-07-16  376  	struct platform_device *pdev;
397f0a3958c972 Bartosz Golaszewski 2026-07-16  377  	struct fwnode_handle *fwnode;
397f0a3958c972 Bartosz Golaszewski 2026-07-16  378  	int ret;
397f0a3958c972 Bartosz Golaszewski 2026-07-16  379  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  380  	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  381  	KUNIT_ASSERT_EQ(test, ret, 0);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  382  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  383  	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  384  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  385  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  386  	pdevinfo = (struct platform_device_info){
397f0a3958c972 Bartosz Golaszewski 2026-07-16  387  		.name = DEVICE_NAME,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  388  		.id = PLATFORM_DEVID_NONE,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  389  		.fwnode = fwnode,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  390  		.swnode = &platform_device_test_swnode,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  391  	};
397f0a3958c972 Bartosz Golaszewski 2026-07-16  392  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  393  	pdev = platform_device_register_full(&pdevinfo);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  394  	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
397f0a3958c972 Bartosz Golaszewski 2026-07-16 @395  	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  396  			    "Expected errno == -EINVAL, got: %pe", pdev);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  397  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  398  	pdevinfo = (struct platform_device_info){
397f0a3958c972 Bartosz Golaszewski 2026-07-16  399  		.name = DEVICE_NAME,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  400  		.id = PLATFORM_DEVID_NONE,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  401  		.swnode = &platform_device_test_swnode,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  402  		.properties = properties,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  403  	};
397f0a3958c972 Bartosz Golaszewski 2026-07-16  404  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  405  	pdev = platform_device_register_full(&pdevinfo);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  406  	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
397f0a3958c972 Bartosz Golaszewski 2026-07-16  407  	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  408  			    "Expected errno == -EINVAL, got: %pe", pdev);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  409  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  410  	pdevinfo = (struct platform_device_info){
397f0a3958c972 Bartosz Golaszewski 2026-07-16  411  		.name = DEVICE_NAME,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  412  		.id = PLATFORM_DEVID_NONE,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  413  		.fwnode = fwnode,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  414  		.properties = properties,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  415  	};
397f0a3958c972 Bartosz Golaszewski 2026-07-16  416  
397f0a3958c972 Bartosz Golaszewski 2026-07-16  417  	pdev = platform_device_register_full(&pdevinfo);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  418  	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
397f0a3958c972 Bartosz Golaszewski 2026-07-16  419  	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
397f0a3958c972 Bartosz Golaszewski 2026-07-16  420  			    "Expected errno == -EINVAL, got: %pe", pdev);
397f0a3958c972 Bartosz Golaszewski 2026-07-16  421  }
397f0a3958c972 Bartosz Golaszewski 2026-07-16  422  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
