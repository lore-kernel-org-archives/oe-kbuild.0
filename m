Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657D468C21
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139952; cv=none; b=Kr2T0j18DCk8Kd6Uq5kkPYphA/n8MczyTe1SZN+LRFGrZEQtVNJB8Lp3KLDD4cmpOJtdXBOctqvYfUoAHh8ffPKQ9VvH2P6Yz/vEH8Rpfj8u977jnbuH2D2SBtorxdzjvYp+IgU3VbM2Bv4/xGam2BQj2GyC9hrG6xWt+4pEgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139952; c=relaxed/simple;
	bh=o+sdbBledTLrInWhVkhtI9TQhoobunq7NQFOniIvQM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=foXUh8w3jv5gwlLwUgvVqip8RWIjmqvIpirAI3KD9FsrUvwZpI/A1H+O5dwKxPfBsSMEHWoB8MpZDvlKtc8XVm2XZzh27cUPYfLZ/hGACjKJfdmrW6DlGQGSN/V5ciECEc523J96PBKBCM0ctG/4IvXOczjz7ZLQ8NP6HFooHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aETRfkOA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aETRfkOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786139951; x=1817675951;
  h=date:from:to:cc:subject:message-id;
  bh=o+sdbBledTLrInWhVkhtI9TQhoobunq7NQFOniIvQM8=;
  b=aETRfkOAum3HofMmbRmiEDJwSVnSpRQLeLK5+JdniB8mIileyQFrC3WM
   1gQX33PxHy4trVoNN/stAO+LKpkOcqea9OeJLASSn++kzzWlxzVao30jF
   EH62LcE4hcSEhWa12qvVisbkuN6qv8SUf3EVR1ShX9XP2Hsw8OsYnlsnG
   hghIwlDznk6rMDSIerXYkhzqMXjfJt7zosQ0+daou/OgkP9cqBuaWuJKM
   FuhrGZDqukXB0JZQB0cq7pDRG2Uz/rJnepmxXqVXKkqooQtCS+cu4Ml9Z
   XMQrgY82+XM+muPse59JRMwoEqA8INzSTsJ7FJ042P8mYZ3Iz/AgjAJv+
   A==;
X-CSE-ConnectionGUID: Y8AT7Ju3RdqNNX4/4oB3fQ==
X-CSE-MsgGUID: 3z8U2By5R5Wid74vgB1sqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86832718"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86832718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 14:59:11 -0700
X-CSE-ConnectionGUID: 8X7WIuemQ6iFjG3/jXEjuQ==
X-CSE-MsgGUID: s43zQhzqTMG0hl7dNe9dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259887434"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 14:59:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsSap-00000000JMH-0WI7;
	Fri, 07 Aug 2026 21:59:07 +0000
Date: Sat, 08 Aug 2026 05:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test()
 warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202608080452.WDMKU5p7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Brian Norris <briannorris@chromium.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f008280327ba5ad132965abab0c7846283cef0c
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
date:   10 months ago
:::::: branch date: 89 minutes ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260808/202608080452.WDMKU5p7-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contracts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080452.WDMKU5p7-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aa Brian Norris 2025-09-25  12  
7f7acd193ba8aa Brian Norris 2025-09-25  13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25  14  {
7f7acd193ba8aa Brian Norris 2025-09-25  15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25  16  
7f7acd193ba8aa Brian Norris 2025-09-25  17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25  18  
7f7acd193ba8aa Brian Norris 2025-09-25  19  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  20  
7f7acd193ba8aa Brian Norris 2025-09-25  21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25 @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aa Brian Norris 2025-09-25  25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  28  }
7f7acd193ba8aa Brian Norris 2025-09-25  29  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
