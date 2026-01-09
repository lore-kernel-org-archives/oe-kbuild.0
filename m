Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44D3385B1
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955062; cv=none; b=I8rYnPqqV2jIBFQFCYQya+TCGrcYG+0Fi5lAMjuW7aqZPnWGrAtdFX3ld/TuaEV+NktE/InK7A8ZpSxEGt2P0LK6CbHGTDB5VqyADk9TbTsn3Su8lPFeC8LVoUkppARpAQ6JmPnJJ8ny3KoK/JC7BkfpA3MCCaMhYCu0BSmWwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955062; c=relaxed/simple;
	bh=phTcBH4pEgLeuAQt3n/ThpCYAcodn2/2Ka5vmCsJ6Vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHXxlQ08/+dl0BkXW5R11WLedTwg0xfAeb+Tmu0Q2YY+XblnTX/2Cni1WN+5bX3fWmS5YobdbOUZ4yRmFpN23BuiXuRZCYGuWLvqnNaVkO6eVKURrG1Wmqpc/9y73ybI/l5Jfk3tvfdAyZKt1uVwt5N7siSdQ2Y5UBRA049NWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixQDj1uw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixQDj1uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767955060; x=1799491060;
  h=date:from:to:cc:subject:message-id;
  bh=phTcBH4pEgLeuAQt3n/ThpCYAcodn2/2Ka5vmCsJ6Vs=;
  b=ixQDj1uwAnXs+gzr2m9o7x3e7Xk8Mj4FY/37fekzJ98AEwSsm8JVHc53
   crsSTeEZgozO7NISlrrPoIJBWy0Pky/rYJEvlQbUIuYWix3NVp98h6UK/
   J2exH6yx+SaHtwAMQhWllAxx1Yf+/cCtAlp91kVF8xEN3bBQenT9iX4Fl
   5ZQZC8QOBxZ8FwULWmzS3+r4PEhEQ4TOwSZZO92M8w09vypiNEfARxUUZ
   cTJ8v5CxywYj45jalFsNj+EdY2gSEWMieMAAOaTN8LkREyZ0B/sn8Fwdm
   HyYTeNsXbSFDkzqfTJ0C6bykRM6UvnzzFqSxFd2LNZRm+808f9hd2HEHA
   w==;
X-CSE-ConnectionGUID: hJ98nDCqQ92rR8diex1uJA==
X-CSE-MsgGUID: w1MArfEgTaWjlfEAQq1vMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80055938"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="80055938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:37:40 -0800
X-CSE-ConnectionGUID: aT4bN5vURpGq31ES/27nLg==
X-CSE-MsgGUID: fjDNA/jHTL+zqP2lq+JdxA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 02:37:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve9s8-000000005ky-2QNC;
	Fri, 09 Jan 2026 10:37:36 +0000
Date: Fri, 09 Jan 2026 18:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test()
 warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202601091832.YueBSiOb-lkp@intel.com>
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
head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091832.YueBSiOb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601091832.YueBSiOb-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aa Brian Norris 2025-09-25   12  
7f7acd193ba8aa Brian Norris 2025-09-25   13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   14  {
7f7acd193ba8aa Brian Norris 2025-09-25   15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   16  
7f7acd193ba8aa Brian Norris 2025-09-25   17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   18  
7f7acd193ba8aa Brian Norris 2025-09-25   19  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   20  
7f7acd193ba8aa Brian Norris 2025-09-25   21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aa Brian Norris 2025-09-25   25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   28  }
7f7acd193ba8aa Brian Norris 2025-09-25   29  
7f7acd193ba8aa Brian Norris 2025-09-25   30  /* Test pm_runtime_put() and friends when already suspended. */
7f7acd193ba8aa Brian Norris 2025-09-25   31  static void pm_runtime_already_suspended_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   32  {
7f7acd193ba8aa Brian Norris 2025-09-25   33  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   34  
7f7acd193ba8aa Brian Norris 2025-09-25   35  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   36  
7f7acd193ba8aa Brian Norris 2025-09-25   37  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   38  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   39  
7f7acd193ba8aa Brian Norris 2025-09-25   40  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   41  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_barrier(dev)); /* no wakeup needed */
7f7acd193ba8aa Brian Norris 2025-09-25   42  	pm_runtime_put(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   43  
7f7acd193ba8aa Brian Norris 2025-09-25   44  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   45  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   46  
7f7acd193ba8aa Brian Norris 2025-09-25   47  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_suspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   48  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   49  	KUNIT_EXPECT_EQ(test, 1, pm_request_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   50  
7f7acd193ba8aa Brian Norris 2025-09-25   51  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   52  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   53  
7f7acd193ba8aa Brian Norris 2025-09-25   54  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   55  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   56  
7f7acd193ba8aa Brian Norris 2025-09-25   57  	/* Grab 2 refcounts */
7f7acd193ba8aa Brian Norris 2025-09-25   58  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   59  	pm_runtime_get_noresume(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   60  	/* The first put() sees usage_count 1 */
7f7acd193ba8aa Brian Norris 2025-09-25   61  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   62  	/* The second put() sees usage_count 0 but tells us "already suspended". */
7f7acd193ba8aa Brian Norris 2025-09-25   63  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   64  
7f7acd193ba8aa Brian Norris 2025-09-25   65  	/* Should have remained suspended the whole time. */
7f7acd193ba8aa Brian Norris 2025-09-25   66  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   67  }
7f7acd193ba8aa Brian Norris 2025-09-25   68  
7f7acd193ba8aa Brian Norris 2025-09-25   69  static void pm_runtime_idle_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   70  {
7f7acd193ba8aa Brian Norris 2025-09-25   71  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   72  
7f7acd193ba8aa Brian Norris 2025-09-25   73  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   74  
7f7acd193ba8aa Brian Norris 2025-09-25   75  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   76  
7f7acd193ba8aa Brian Norris 2025-09-25   77  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  @78  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   79  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   80  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   81  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   82  	pm_runtime_put_noidle(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   83  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   84  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   85  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   86  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   87  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   88  }
7f7acd193ba8aa Brian Norris 2025-09-25   89  
7f7acd193ba8aa Brian Norris 2025-09-25   90  static void pm_runtime_disabled_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   91  {
7f7acd193ba8aa Brian Norris 2025-09-25   92  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   93  
7f7acd193ba8aa Brian Norris 2025-09-25   94  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   95  
7f7acd193ba8aa Brian Norris 2025-09-25   96  	/* Never called pm_runtime_enable() */
7f7acd193ba8aa Brian Norris 2025-09-25   97  	KUNIT_EXPECT_FALSE(test, pm_runtime_enabled(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   98  
7f7acd193ba8aa Brian Norris 2025-09-25   99  	/* "disabled" is treated as "active" */
7f7acd193ba8aa Brian Norris 2025-09-25  100  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  101  	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  102  
7f7acd193ba8aa Brian Norris 2025-09-25  103  	/*
7f7acd193ba8aa Brian Norris 2025-09-25  104  	 * Note: these "fail", but they still acquire/release refcounts, so
7f7acd193ba8aa Brian Norris 2025-09-25  105  	 * keep them balanced.
7f7acd193ba8aa Brian Norris 2025-09-25  106  	 */
7f7acd193ba8aa Brian Norris 2025-09-25  107  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  108  	pm_runtime_put(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  109  
7f7acd193ba8aa Brian Norris 2025-09-25  110  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  111  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  112  
7f7acd193ba8aa Brian Norris 2025-09-25  113  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  114  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  115  
7f7acd193ba8aa Brian Norris 2025-09-25  116  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume_and_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  117  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  118  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  119  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  120  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  121  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_suspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  122  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  123  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  124  
7f7acd193ba8aa Brian Norris 2025-09-25  125  	/* Still disabled */
7f7acd193ba8aa Brian Norris 2025-09-25  126  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  127  	KUNIT_EXPECT_FALSE(test, pm_runtime_enabled(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  128  }
7f7acd193ba8aa Brian Norris 2025-09-25  129  
7f7acd193ba8aa Brian Norris 2025-09-25  130  static void pm_runtime_error_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25  131  {
7f7acd193ba8aa Brian Norris 2025-09-25  132  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25  133  
7f7acd193ba8aa Brian Norris 2025-09-25  134  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25  135  
7f7acd193ba8aa Brian Norris 2025-09-25  136  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  137  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  138  
7f7acd193ba8aa Brian Norris 2025-09-25  139  	/* Fake a .runtime_resume() error */
7f7acd193ba8aa Brian Norris 2025-09-25  140  	dev->power.runtime_error = -EIO;
7f7acd193ba8aa Brian Norris 2025-09-25  141  
7f7acd193ba8aa Brian Norris 2025-09-25  142  	/*
7f7acd193ba8aa Brian Norris 2025-09-25  143  	 * Note: these "fail", but they still acquire/release refcounts, so
7f7acd193ba8aa Brian Norris 2025-09-25  144  	 * keep them balanced.
7f7acd193ba8aa Brian Norris 2025-09-25  145  	 */
7f7acd193ba8aa Brian Norris 2025-09-25  146  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  147  	pm_runtime_put(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  148  
7f7acd193ba8aa Brian Norris 2025-09-25  149  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  150  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  151  
7f7acd193ba8aa Brian Norris 2025-09-25  152  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  153  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  154  
7f7acd193ba8aa Brian Norris 2025-09-25  155  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  156  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  157  
7f7acd193ba8aa Brian Norris 2025-09-25  158  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume_and_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  159  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  160  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  161  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  162  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  163  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_suspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  164  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  165  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  166  
7f7acd193ba8aa Brian Norris 2025-09-25  167  	/* Error is still pending */
7f7acd193ba8aa Brian Norris 2025-09-25  168  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  169  	KUNIT_EXPECT_EQ(test, -EIO, dev->power.runtime_error);
7f7acd193ba8aa Brian Norris 2025-09-25  170  	/* Clear error */
7f7acd193ba8aa Brian Norris 2025-09-25  171  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_set_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  172  	KUNIT_EXPECT_EQ(test, 0, dev->power.runtime_error);
7f7acd193ba8aa Brian Norris 2025-09-25  173  	/* Still suspended */
7f7acd193ba8aa Brian Norris 2025-09-25  174  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  175  
7f7acd193ba8aa Brian Norris 2025-09-25  176  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  177  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_barrier(dev)); /* resume was pending */
7f7acd193ba8aa Brian Norris 2025-09-25  178  	pm_runtime_put(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  179  	pm_runtime_suspend(dev); /* flush the put(), to suspend */
7f7acd193ba8aa Brian Norris 2025-09-25  180  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  181  
7f7acd193ba8aa Brian Norris 2025-09-25 @182  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  183  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  184  
7f7acd193ba8aa Brian Norris 2025-09-25  185  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  186  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aa Brian Norris 2025-09-25  187  
7f7acd193ba8aa Brian Norris 2025-09-25  188  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_resume_and_get(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  189  
7f7acd193ba8aa Brian Norris 2025-09-25  190  	/*
7f7acd193ba8aa Brian Norris 2025-09-25  191  	 * The following should all return -EAGAIN (usage is non-zero) or 1
7f7acd193ba8aa Brian Norris 2025-09-25  192  	 * (already resumed).
7f7acd193ba8aa Brian Norris 2025-09-25  193  	 */
7f7acd193ba8aa Brian Norris 2025-09-25  194  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  195  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  196  	KUNIT_EXPECT_EQ(test, 1, pm_request_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  197  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  198  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_suspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  199  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_resume(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  200  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_autosuspend(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  201  
7f7acd193ba8aa Brian Norris 2025-09-25  202  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  203  
7f7acd193ba8aa Brian Norris 2025-09-25  204  	/* Suspended again */
7f7acd193ba8aa Brian Norris 2025-09-25  205  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  206  }
7f7acd193ba8aa Brian Norris 2025-09-25  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
