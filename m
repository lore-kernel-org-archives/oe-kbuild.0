Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668752;
	b=D+LIsj7eWhQ0moPwJZq98DvMuIKtQD1YAOwr8+icVOKuQBjKE7aBoTGX13UQoLzveYly
	 ahbYPrzb66ZWcuyuaQ98vZwZjVWQ/iU4wutm1Wi2ZoB1okpl1EIVw7VOWzHZpdtgUYdPc
	 iqKkSyJnCB+o2D5wH/3Eo1mliLlZVBwUAUUv2de9omMMJKOabc38g6spD53mlVqHAQie6
	 Tx8YQllLNEaoWpPtt20fekKdCfx4LyXP0lxuq6d9kLcNY4mMCI/UcoTdNd4tBT224YI9a
	 Hg92rP05tzPq1WNOci+e/c8wBlb40xXyZFWmPKnwVEwg6paF4VxGJITBfoCPZ37OFdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668752;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=031/xos8oEHqGWWro3bOt4Siv52vwrKEeHk5PDe+Aio=;
	b=O3ry3KC8heUKGXRaChBi7ruz9UhSXmsUWuRXetjg8GbXVo9R4qSv1kaJOGIx7PNEvkdw
	 qkGJuBJEX9sHFWVL7IhwmHLAVTw55+eGL3Bsy3L5pd1qyIxaGZoRHMVY0nlVMWiTbzUCm
	 tKcYYs/eEQYuhAyl2N0k+TBQkFJpZK3x9sXxOtcuU3vtoAfNzyZH14oGPh9/GhPZBffIi
	 HnB4gWF00RsoeoGndqz3qLi5xOAg3xhBGrNNFS3pzU5wBHVbh8dsDT8MFCIcs5lS4Qclm
	 +/UCThglRese4MUZZE0A4BVrEhv1tRvi30DT3A+akLYIbBqn6G885huS0kS0rAd9rNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XN+OtSAE;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB0B606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB0B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XN+OtSAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794668753; x=1826204753;
  h=date:from:to:cc:subject:message-id;
  bh=r3G4w43v0BJ7ZxPY+62MRdbCPQG24WCZszwYpaY7Qsc=;
  b=XN+OtSAELBvgEojTVejguxxwEuoiLRKz93wmo9v4ypgyUOy6uEccrBaG
   jL30Tm4bT34LsiM7+qMHoxWgvtRGD2cClo0vQLES1TUpJkGMUwe9JpYQ8
   Fc2aF91JW8h+hBSJWXLwIIwZ9SNkBgzTol9NzhlFAKH0orzoBrCcrwtIv
   6ORg06Y412ErzNmXxZf0PcibDytmvMmSRcrVby77pulDNAqGmKz7E31L/
   VG1PySNKq50y/2CVUj7jgaRKsDTBMFMOt4RutUmYTRQT+DxRpld82LXSJ
   jaXHWgXUS2ByBLVBRJ5jNzsWwtCz5gWET1TwLgSzM0XOEYb1FhVvTNO6H
   g==;
X-CSE-ConnectionGUID: ejkqCu6VSyKk4+bhfOcz4g==
X-CSE-MsgGUID: pFuWyBGYTVmfTTjPkeXleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3563167"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3563167"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 07:05:52 -0800
X-CSE-ConnectionGUID: VU1P+jv1QNO44AqQffukuQ==
X-CSE-MsgGUID: uP0CnXRKRVuXNGyeO0yupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9086468"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Nov 2026 07:05:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSFK7-000000001kx-3fxi;
	Sat, 14 Nov 2026 15:05:47 +0000
Date: Sat, 14 Nov 2026 16:05:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 1/1]
 mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error:
 dereferencing freed memory 'sysfs_target' (line 79)
Message-ID: <202611141540.dikinyHI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   793c58ba801e0ec6ed0c3b71d1a1f091a42d299c
commit: 8a2944f5a54f0b3cece27a265e319c499ca40cb2 [1/1] mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261114/202611141540.dikinyHI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141540.dikinyHI-lkp@intel.com/

smatch warnings:
mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error: dereferencing freed memory 'sysfs_target' (line 79)

vim +/sysfs_target +80 mm/damon/tests/sysfs-kunit.h

b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  40  
2caef83db9f8e08 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  41  static void damon_sysfs_test_add_targets(struct kunit *test)
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  42  {
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  43  	struct damon_sysfs_targets *sysfs_targets;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  44  	struct damon_sysfs_target *sysfs_target;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  45  	struct damon_ctx *ctx;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  46  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  47  	sysfs_targets = damon_sysfs_targets_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  48  	if (!sysfs_targets)
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  49  		kunit_skip(test, "sysfs_targets alloc fail");
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  50  	sysfs_targets->nr = 1;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  51  	sysfs_targets->targets_arr = kmalloc_array(1,
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  52  			sizeof(*sysfs_targets->targets_arr), GFP_KERNEL);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  53  	if (!sysfs_targets->targets_arr) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  54  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  55  		kunit_skip(test, "targets_arr alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  56  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  57  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  58  	sysfs_target = damon_sysfs_target_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  59  	if (!sysfs_target) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  60  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  61  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  62  		kunit_skip(test, "sysfs_target alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  63  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  64  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(12, 100);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  65  	sysfs_target->regions = damon_sysfs_regions_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  66  	if (!sysfs_target->regions) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  67  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  68  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  69  		kfree(sysfs_target);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  70  		kunit_skip(test, "sysfs_regions alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  71  	}
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  72  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  73  	sysfs_targets->targets_arr[0] = sysfs_target;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  74  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  75  	ctx = damon_new_ctx();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  76  	if (!ctx) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  77  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  78  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @79  		kfree(sysfs_target);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @80  		kfree(sysfs_target->regions);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  81  		kunit_skip(test, "ctx alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  82  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  83  
2caef83db9f8e08 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  84  	damon_sysfs_add_targets(ctx, sysfs_targets);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  85  	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  86  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  87  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  88  			sysfs_target->pid + 1, 200);
2caef83db9f8e08 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  89  	damon_sysfs_add_targets(ctx, sysfs_targets);
d96727a251fd2b9 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  90  	KUNIT_EXPECT_EQ(test, 2u, nr_damon_targets(ctx));
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  91  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  92  	damon_destroy_ctx(ctx);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  93  	kfree(sysfs_targets->targets_arr);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  94  	kfree(sysfs_targets);
2d6a1c835685de3 mm/damon/tests/sysfs-kunit.h Jinjie Ruan   2024-10-10  95  	kfree(sysfs_target->regions);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  96  	kfree(sysfs_target);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  97  }
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
