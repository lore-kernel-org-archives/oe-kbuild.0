Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4DB3BFE3E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439287; cv=none; b=UaVVtvImo6+Uk+HB/MBuf4zWK4UTRTMA1tbhCrcAIbfx6+q7uHbMJvfbTaLcDHbwfYKPrmpRxhnj8Y6hjIjiaEHaXtDwf6O213vTmpVIWlDzeoLVPNPkR+A6L6zSoqocGcLVpgUQjszi/AuDGlttAfnkUqWcLayu4kpWmK6B7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439287; c=relaxed/simple;
	bh=AxVLSYrwVwq2DY8JxoNJZ9KfHMJ4/M1UpUIPDoZRXQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=licvOWP5p0Tmmf29lGS8OG6RB19hbmjWou9zIp6iSMoaBMYl75oaBWSwt4QjdYm5ty2EPiqsa168x0B2wlxR9llpe83G81ya7gz/kEPIOzLP4iHjDZchNzKZlkAvtlKf7dE2TtzaBY7S3sutnrL4dEISfldHudYdeDA+CmUkZ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeVuqlXo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeVuqlXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791439286; x=1822975286;
  h=date:from:to:cc:subject:message-id;
  bh=AxVLSYrwVwq2DY8JxoNJZ9KfHMJ4/M1UpUIPDoZRXQY=;
  b=aeVuqlXocqz4zzrYdb9CTbm5TeB4l6w+IJXx2CWa6U3uy9U76Z7viWRm
   HJ1Yn2wCtG2cgqOdwIOa5jsUroPhESqppUC103uzvB/nIMx77Y0fCdol7
   TCUnPnb5fq7Tmd4JcqUIURVhWxSHfF66CbYvTJ+wnqZseUUL+g6zmI9Px
   ZRGQW27zswuIwnATA+ITM4H0lLvA8ZyqAPz3lSQqeSHdIkL/UZD6DsEZA
   I2nPXwl+MJZbBbLMM7CjvJfuqV0vHOSaE3hh/kmYuy5JYD4QgdanoXb9d
   n90K2spa8MJNJbOWl/vZVcitA9cqTlQF+zJ0xpVMJIITNAg3gb+q4G2iD
   A==;
X-CSE-ConnectionGUID: v2QBgP1FRFm+2V8fEUC+wg==
X-CSE-MsgGUID: NIDtmAIJQjSRB7qnAhy22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="92295"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="92295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:01:26 -0700
X-CSE-ConnectionGUID: E8S9VRhfQn+aFYkUT6E92Q==
X-CSE-MsgGUID: 9fKxO7myQrml9QyN0xoGVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="271369"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 23:01:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEhBy-000000004u4-1XTA;
	Thu, 08 Oct 2026 06:01:22 +0000
Date: Thu, 08 Oct 2026 08:00:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/power/runtime-test.c:368
 pm_runtime_pending_teardown_test() warn: pm_runtime_get_sync() also returns 1
 on success
Message-ID: <202610080756.OSy2UU1U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Norris <briannorris@chromium.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/PM-runtime-Cancel-pending-only-during-non-transient-suspend-failure/20260929-114711
head:   dfc97fdf56151a722171601bd1b6278d4fb54f0b
commit: dfc97fdf56151a722171601bd1b6278d4fb54f0b PM: runtime: Add test for pending-autosuspend + teardown
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261008/202610080756.OSy2UU1U-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080756.OSy2UU1U-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:368 pm_runtime_pending_teardown_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:23 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:75 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:179 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:258 pm_runtime_supplier_suspend_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:264 pm_runtime_supplier_suspend_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +368 drivers/base/power/runtime-test.c

dd53d089b9af929 Brian Norris 2026-09-29  356  
dfc97fdf56151a7 Brian Norris 2026-09-29  357  static void pm_runtime_pending_teardown_test(struct kunit *test)
dfc97fdf56151a7 Brian Norris 2026-09-29  358  {
dfc97fdf56151a7 Brian Norris 2026-09-29  359  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
dfc97fdf56151a7 Brian Norris 2026-09-29  360  
dfc97fdf56151a7 Brian Norris 2026-09-29  361  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
dfc97fdf56151a7 Brian Norris 2026-09-29  362  
dfc97fdf56151a7 Brian Norris 2026-09-29  363  	pm_runtime_enable(dev);
dfc97fdf56151a7 Brian Norris 2026-09-29  364  	pm_runtime_use_autosuspend(dev);
dfc97fdf56151a7 Brian Norris 2026-09-29  365  
dfc97fdf56151a7 Brian Norris 2026-09-29  366  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
dfc97fdf56151a7 Brian Norris 2026-09-29  367  
dfc97fdf56151a7 Brian Norris 2026-09-29 @368  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
dfc97fdf56151a7 Brian Norris 2026-09-29  369  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
dfc97fdf56151a7 Brian Norris 2026-09-29  370  
dfc97fdf56151a7 Brian Norris 2026-09-29  371  	/* Queue a RPM_REQ_AUTOSUSPEND (immediately, as autosuspend_delay is 0) */
dfc97fdf56151a7 Brian Norris 2026-09-29  372  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_autosuspend(dev));
dfc97fdf56151a7 Brian Norris 2026-09-29  373  
dfc97fdf56151a7 Brian Norris 2026-09-29  374  	/*
dfc97fdf56151a7 Brian Norris 2026-09-29  375  	 * This is expected to quiesce a pending auto-suspend. See especially
dfc97fdf56151a7 Brian Norris 2026-09-29  376  	 * devm_pm_runtime_enable() -> pm_runtime_disable_action().
dfc97fdf56151a7 Brian Norris 2026-09-29  377  	 */
dfc97fdf56151a7 Brian Norris 2026-09-29  378  	pm_runtime_dont_use_autosuspend(dev);
dfc97fdf56151a7 Brian Norris 2026-09-29  379  
dfc97fdf56151a7 Brian Norris 2026-09-29  380  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
dfc97fdf56151a7 Brian Norris 2026-09-29  381  }
dfc97fdf56151a7 Brian Norris 2026-09-29  382  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
