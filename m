Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E903B9D95
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002727; cv=none; b=HRqOoNqwey4Re5Cs71V4iEuFGRkQdSrUJfnC2zcOQsMxt3cZcpjyHRfnSwmR2HIkoOD2+RHIG27TfEszYgnAnRozOadCWAFzC7oMpDmYdNDtLBeqFaqTfE6QohHFZwPmBgo0kwMxT+HLpOONzFlIh3caB817EawUyAh9RE8i5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002727; c=relaxed/simple;
	bh=8cNN6FOqtuBhDA3FKnnmysBrk3bPoJz5+1EPHZXOkfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sXWurRLfovSb/NHyGRjCl+7Whj9nSCf2AbKSEK82DdvuB3cgOEAmuCPno9IDtnfHvO1B7ZOV/+Ibv5fOosWU50CdAs85fRz3t4jt2gCLL754q0j1DNAwAjCrLoeyPJsPb/W0wOJO/RiuUvojYZRU8Xj6gXRsPz5J8SGyoIIE9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEvjYHS0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEvjYHS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002725; x=1817538725;
  h=date:from:to:cc:subject:message-id;
  bh=8cNN6FOqtuBhDA3FKnnmysBrk3bPoJz5+1EPHZXOkfk=;
  b=LEvjYHS0lBDG33sHuFb3FgOw42My+ms7CDvG6IhDjk9Ca1cQR9M84dBO
   DIF1ljWLDEg/YVOLiluAkfjQrpxrulqs423nf62f9ITScdhlEKB64KwFf
   UOS5GJvjx1BIFYBvAyPHUktzC9wD1ux70mraaDzfOUAC3mjH7nGcRGLLq
   HSo9GRCv18seGU0dwAd/H/kCt9NtyepEwZBGCScZR4CfQGy0L4aVq0rln
   h6XGNpIxNmeAzi7NQUvj4JUrF85RrOO+YtMwLQMvmoq+bqciZP2GUi5/j
   6K5yzuogfPFeYbHAH5Y2HodNwGyhFLIpQAehtSNyjK7AmuG13q0e8GS+K
   Q==;
X-CSE-ConnectionGUID: x9L2VgIPSJCqRg6XJPp9Dw==
X-CSE-MsgGUID: 2dQaNAkkSeKeCcmVeZ+w8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97234619"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97234619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:52:04 -0700
X-CSE-ConnectionGUID: aquXdtHbRXKQvlOCMFcnDw==
X-CSE-MsgGUID: NzQIghrdTDuriK+G/C3nnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="266253620"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2026 00:52:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrstU-00000000EZB-3FwW;
	Thu, 06 Aug 2026 07:52:00 +0000
Date: Thu, 06 Aug 2026 15:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test()
 warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202608061505.Gpk9eHKb-lkp@intel.com>
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
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061505.Gpk9eHKb-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contracts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608061505.Gpk9eHKb-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aaa Brian Norris 2025-09-25  12  
7f7acd193ba8aaa Brian Norris 2025-09-25  13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25  14  {
7f7acd193ba8aaa Brian Norris 2025-09-25  15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25  16  
7f7acd193ba8aaa Brian Norris 2025-09-25  17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  18  
7f7acd193ba8aaa Brian Norris 2025-09-25  19  	pm_runtime_enable(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  20  
7f7acd193ba8aaa Brian Norris 2025-09-25  21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25 @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aaa Brian Norris 2025-09-25  25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  28  }
7f7acd193ba8aaa Brian Norris 2025-09-25  29  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
