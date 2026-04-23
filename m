Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894B3DDDBD
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928201; cv=none; b=u/KUthbOgLlxAY1O5DmWcPypIMcPz6QKzU/Uq+mSNf8lYwPQeavNaeKVbb50oMrggY1YIoLqP6kCJIeSs0PZBuqAqJZsaW2amWbgdWIW0raGWkH9BVKykjJFFgsz6l+tob/3Jk/B7KryMS/BiHs0uzKcUJwy5uo3RY/kNWgmkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928201; c=relaxed/simple;
	bh=Zn6Lyz8E5GjtCV56c7EjmLNShIFeMXQpFJHJOG1AtUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MwerEpbVIqDTW/QtLfF0jHOQqxrDyOTHE1PbmSxINU8mNXQnjPgfvAnXOOuyH2PPrzqH3G1HCY0WDPOM5FsHuPqJpBvfji2Fb3oCYtR3biG+EdNnzjVB1wB1ilsgZ34jw0LX1P66IpMM1UZfiIiUo4t79Jp0Dh1IwpNcQ/8J89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NeIPcRls; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeIPcRls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776928198; x=1808464198;
  h=date:from:to:cc:subject:message-id;
  bh=Zn6Lyz8E5GjtCV56c7EjmLNShIFeMXQpFJHJOG1AtUg=;
  b=NeIPcRlsl3gtFHEXj4cS/pGXuPClaMocCN/yYRkQcodZruYfCt+7chc9
   pZwALhakEG+LcbIgqyMLoMNUtHYNcQaVvejP3S6+IsTxkzT5Dt672xOcC
   9O8uvW+8CPvwpeamgJrXSE60DX+syaiqGH2ofahjPrlpZ4F+y4iaLVY0l
   /UICMibWspFqU/U/Wgeizk2PyNXzoVXNeGC+5YsKTemsFfmMFj/xyaeUg
   ZP1XAhLAaizKwVnKkRXeztNVl8yWbhn/z8D7JQSpmxSK7QTfvzMVZ8PYm
   M45FnAY2v+hPQ4qLxAHB8XcQP+nfpmrbFNIsoggQQXOWRSt5U2cMm6QLA
   Q==;
X-CSE-ConnectionGUID: wRMcI1kqQl+haJq7hhFa+Q==
X-CSE-MsgGUID: NRhMhoOOTmKhNCVUF+EKmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77951499"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77951499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 00:09:57 -0700
X-CSE-ConnectionGUID: u/uRoyegSYuh8AvamXrRVg==
X-CSE-MsgGUID: D8C/URVkShSbwZfjOionLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236571742"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2026 00:09:56 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFoC9-000000001zX-2qEH;
	Thu, 23 Apr 2026 07:09:53 +0000
Date: Thu, 23 Apr 2026 15:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test()
 warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202604231405.qMiX1YBJ-lkp@intel.com>
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
head:   2e68039281932e6dc37718a1ea7cbb8e2cda42e6
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260423 (https://download.01.org/0day-ci/archive/20260423/202604231405.qMiX1YBJ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contracts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604231405.qMiX1YBJ-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aaa Brian Norris 2025-09-25   12  
7f7acd193ba8aaa Brian Norris 2025-09-25   13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25   14  {
7f7acd193ba8aaa Brian Norris 2025-09-25   15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25   16  
7f7acd193ba8aaa Brian Norris 2025-09-25   17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   18  
7f7acd193ba8aaa Brian Norris 2025-09-25   19  	pm_runtime_enable(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   20  
7f7acd193ba8aaa Brian Norris 2025-09-25   21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aaa Brian Norris 2025-09-25   25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   28  }
7f7acd193ba8aaa Brian Norris 2025-09-25   29  
7f7acd193ba8aaa Brian Norris 2025-09-25   30  /* Test pm_runtime_put() and friends when already suspended. */
7f7acd193ba8aaa Brian Norris 2025-09-25   31  static void pm_runtime_already_suspended_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25   32  {
7f7acd193ba8aaa Brian Norris 2025-09-25   33  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25   34  
7f7acd193ba8aaa Brian Norris 2025-09-25   35  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   36  
7f7acd193ba8aaa Brian Norris 2025-09-25   37  	pm_runtime_enable(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   38  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   39  
7f7acd193ba8aaa Brian Norris 2025-09-25   40  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   41  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_barrier(dev)); /* no wakeup needed */
7f7acd193ba8aaa Brian Norris 2025-09-25   42  	pm_runtime_put(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   43  
7f7acd193ba8aaa Brian Norris 2025-09-25   44  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   45  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   46  
7f7acd193ba8aaa Brian Norris 2025-09-25   47  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_suspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   48  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   49  	KUNIT_EXPECT_EQ(test, 1, pm_request_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   50  
7f7acd193ba8aaa Brian Norris 2025-09-25   51  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   52  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   53  
7f7acd193ba8aaa Brian Norris 2025-09-25   54  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   55  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   56  
7f7acd193ba8aaa Brian Norris 2025-09-25   57  	/* Grab 2 refcounts */
7f7acd193ba8aaa Brian Norris 2025-09-25   58  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   59  	pm_runtime_get_noresume(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   60  	/* The first put() sees usage_count 1 */
7f7acd193ba8aaa Brian Norris 2025-09-25   61  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   62  	/* The second put() sees usage_count 0 but tells us "already suspended". */
7f7acd193ba8aaa Brian Norris 2025-09-25   63  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   64  
7f7acd193ba8aaa Brian Norris 2025-09-25   65  	/* Should have remained suspended the whole time. */
7f7acd193ba8aaa Brian Norris 2025-09-25   66  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   67  }
7f7acd193ba8aaa Brian Norris 2025-09-25   68  
7f7acd193ba8aaa Brian Norris 2025-09-25   69  static void pm_runtime_idle_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25   70  {
7f7acd193ba8aaa Brian Norris 2025-09-25   71  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25   72  
7f7acd193ba8aaa Brian Norris 2025-09-25   73  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   74  
7f7acd193ba8aaa Brian Norris 2025-09-25   75  	pm_runtime_enable(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   76  
7f7acd193ba8aaa Brian Norris 2025-09-25   77  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  @78  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   79  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   80  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   81  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   82  	pm_runtime_put_noidle(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   83  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   84  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   85  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   86  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   87  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   88  }
7f7acd193ba8aaa Brian Norris 2025-09-25   89  
7f7acd193ba8aaa Brian Norris 2025-09-25   90  static void pm_runtime_disabled_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25   91  {
7f7acd193ba8aaa Brian Norris 2025-09-25   92  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25   93  
7f7acd193ba8aaa Brian Norris 2025-09-25   94  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25   95  
7f7acd193ba8aaa Brian Norris 2025-09-25   96  	/* Never called pm_runtime_enable() */
7f7acd193ba8aaa Brian Norris 2025-09-25   97  	KUNIT_EXPECT_FALSE(test, pm_runtime_enabled(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25   98  
7f7acd193ba8aaa Brian Norris 2025-09-25   99  	/* "disabled" is treated as "active" */
7f7acd193ba8aaa Brian Norris 2025-09-25  100  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  101  	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  102  
7f7acd193ba8aaa Brian Norris 2025-09-25  103  	/*
7f7acd193ba8aaa Brian Norris 2025-09-25  104  	 * Note: these "fail", but they still acquire/release refcounts, so
7f7acd193ba8aaa Brian Norris 2025-09-25  105  	 * keep them balanced.
7f7acd193ba8aaa Brian Norris 2025-09-25  106  	 */
7f7acd193ba8aaa Brian Norris 2025-09-25  107  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  108  	pm_runtime_put(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  109  
7f7acd193ba8aaa Brian Norris 2025-09-25  110  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  111  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  112  
7f7acd193ba8aaa Brian Norris 2025-09-25  113  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  114  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  115  
7f7acd193ba8aaa Brian Norris 2025-09-25  116  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume_and_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  117  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  118  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  119  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  120  	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  121  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_suspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  122  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  123  	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  124  
7f7acd193ba8aaa Brian Norris 2025-09-25  125  	/* Still disabled */
7f7acd193ba8aaa Brian Norris 2025-09-25  126  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  127  	KUNIT_EXPECT_FALSE(test, pm_runtime_enabled(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  128  }
7f7acd193ba8aaa Brian Norris 2025-09-25  129  
7f7acd193ba8aaa Brian Norris 2025-09-25  130  static void pm_runtime_error_test(struct kunit *test)
7f7acd193ba8aaa Brian Norris 2025-09-25  131  {
7f7acd193ba8aaa Brian Norris 2025-09-25  132  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aaa Brian Norris 2025-09-25  133  
7f7acd193ba8aaa Brian Norris 2025-09-25  134  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  135  
7f7acd193ba8aaa Brian Norris 2025-09-25  136  	pm_runtime_enable(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  137  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  138  
7f7acd193ba8aaa Brian Norris 2025-09-25  139  	/* Fake a .runtime_resume() error */
7f7acd193ba8aaa Brian Norris 2025-09-25  140  	dev->power.runtime_error = -EIO;
7f7acd193ba8aaa Brian Norris 2025-09-25  141  
7f7acd193ba8aaa Brian Norris 2025-09-25  142  	/*
7f7acd193ba8aaa Brian Norris 2025-09-25  143  	 * Note: these "fail", but they still acquire/release refcounts, so
7f7acd193ba8aaa Brian Norris 2025-09-25  144  	 * keep them balanced.
7f7acd193ba8aaa Brian Norris 2025-09-25  145  	 */
7f7acd193ba8aaa Brian Norris 2025-09-25  146  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  147  	pm_runtime_put(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  148  
7f7acd193ba8aaa Brian Norris 2025-09-25  149  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  150  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  151  
7f7acd193ba8aaa Brian Norris 2025-09-25  152  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  153  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  154  
7f7acd193ba8aaa Brian Norris 2025-09-25  155  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  156  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_put_sync_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  157  
7f7acd193ba8aaa Brian Norris 2025-09-25  158  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume_and_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  159  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  160  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  161  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  162  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  163  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_suspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  164  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  165  	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  166  
7f7acd193ba8aaa Brian Norris 2025-09-25  167  	/* Error is still pending */
7f7acd193ba8aaa Brian Norris 2025-09-25  168  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  169  	KUNIT_EXPECT_EQ(test, -EIO, dev->power.runtime_error);
7f7acd193ba8aaa Brian Norris 2025-09-25  170  	/* Clear error */
7f7acd193ba8aaa Brian Norris 2025-09-25  171  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_set_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  172  	KUNIT_EXPECT_EQ(test, 0, dev->power.runtime_error);
7f7acd193ba8aaa Brian Norris 2025-09-25  173  	/* Still suspended */
7f7acd193ba8aaa Brian Norris 2025-09-25  174  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  175  
7f7acd193ba8aaa Brian Norris 2025-09-25  176  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  177  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_barrier(dev)); /* resume was pending */
7f7acd193ba8aaa Brian Norris 2025-09-25  178  	pm_runtime_put(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  179  	pm_runtime_suspend(dev); /* flush the put(), to suspend */
7f7acd193ba8aaa Brian Norris 2025-09-25  180  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  181  
7f7acd193ba8aaa Brian Norris 2025-09-25 @182  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  183  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  184  
7f7acd193ba8aaa Brian Norris 2025-09-25  185  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  186  	pm_runtime_put_autosuspend(dev);
7f7acd193ba8aaa Brian Norris 2025-09-25  187  
7f7acd193ba8aaa Brian Norris 2025-09-25  188  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_resume_and_get(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  189  
7f7acd193ba8aaa Brian Norris 2025-09-25  190  	/*
7f7acd193ba8aaa Brian Norris 2025-09-25  191  	 * The following should all return -EAGAIN (usage is non-zero) or 1
7f7acd193ba8aaa Brian Norris 2025-09-25  192  	 * (already resumed).
7f7acd193ba8aaa Brian Norris 2025-09-25  193  	 */
7f7acd193ba8aaa Brian Norris 2025-09-25  194  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  195  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  196  	KUNIT_EXPECT_EQ(test, 1, pm_request_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  197  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  198  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_suspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  199  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_resume(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  200  	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_autosuspend(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  201  
7f7acd193ba8aaa Brian Norris 2025-09-25  202  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  203  
7f7acd193ba8aaa Brian Norris 2025-09-25  204  	/* Suspended again */
7f7acd193ba8aaa Brian Norris 2025-09-25  205  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aaa Brian Norris 2025-09-25  206  }
7f7acd193ba8aaa Brian Norris 2025-09-25  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
