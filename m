Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D942F6160
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720191; cv=none; b=i3BHMG/cCCaMkw/76XwBaliyVe04+5+wNjdNVvdmx+RKBTK195cLc64mq+IG8mVCD3nr3JNdgShnvRTl7XoPKQPvs/GZ3FjN5jMp+wE5sSaN3K40vlmKm/W35IYMl3IJkxOdyECKbNHfpisPmgB3mX4tyBaEEJryl/7AYd87F5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720191; c=relaxed/simple;
	bh=qWlWGOGeZliTtqV04EgBK4edUOCXh8hLxgM5XnHK/d0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WJHBAYb+NtU0ovOX46ozvK5y9OZAJoq8XzDcgdm19u0OCG9NmyVXSjrHd6JWxrNpvojc5VE3/ujSNYgJaX1KAKi9vUEb7fzt462djjajUchfveaa2AtEP1QgwiIV/RRrwLB/zrxeSuWWcnBIgQB48P+sBpXRc62jfOeoL+j5F4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEH7puV7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEH7puV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774720189; x=1806256189;
  h=date:from:to:cc:subject:message-id;
  bh=qWlWGOGeZliTtqV04EgBK4edUOCXh8hLxgM5XnHK/d0=;
  b=EEH7puV7kItUIGUmIAwga2TCby0eIsp3a3Nz/tDWL4a37oUUaaE/pBEO
   kDQTIfxUiFcUEv0Dq9Ctw9IlJlYITl8uoV6CBjkt4A1YqjPr0pJvRjsh1
   xifMP6nYcerLpE+RR8Jhemzb5UXxOF+r79ssSTh6fbRiQ3nu0JwCREjba
   J7e0e1tC78egonHi9wDL8CdmWv+oLXZkvjiR8jW7d1nhxMnR/D3boS23m
   aO0vQzBo4BFVFrQqwmi51h5+AU2J8LrVNSUyweIX/0USpYIglU7F2dYuW
   5IG9AS3RxUBaSVSWRdqbxEVIDhlCa6m3LRdJ7pJ5D165yo/inKRLX/UIe
   Q==;
X-CSE-ConnectionGUID: zUVslwMhQLKm/bI8hDCcZQ==
X-CSE-MsgGUID: km3Ko67LScGx6GXiLMbirA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="78365836"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="78365836"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 10:49:46 -0700
X-CSE-ConnectionGUID: IWerv+X/TfuRsQo70aaL8Q==
X-CSE-MsgGUID: ihKOdofpT5KSySgBBr6adQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227224419"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 10:49:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Xn4-00000000Bdb-49Fw;
	Sat, 28 Mar 2026 17:49:42 +0000
Date: Sun, 29 Mar 2026 01:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 7/7]
 mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error:
 dereferencing freed memory 'sysfs_target' (line 79)
Message-ID: <202603290111.IIC2UeIB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 33cf4171196debf6009e33d96dccdd7929071db5 [7/7] mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290111.IIC2UeIB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290111.IIC2UeIB-lkp@intel.com/

smatch warnings:
mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error: dereferencing freed memory 'sysfs_target' (line 79)

vim +/sysfs_target +80 mm/damon/tests/sysfs-kunit.h

b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  40  
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  41  static void damon_sysfs_test_add_targets(struct kunit *test)
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  42  {
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  43  	struct damon_sysfs_targets *sysfs_targets;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  44  	struct damon_sysfs_target *sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  45  	struct damon_ctx *ctx;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  46  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  47  	sysfs_targets = damon_sysfs_targets_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  48  	if (!sysfs_targets)
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  49  		kunit_skip(test, "sysfs_targets alloc fail");
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  50  	sysfs_targets->nr = 1;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  51  	sysfs_targets->targets_arr = kmalloc_array(1,
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  52  			sizeof(*sysfs_targets->targets_arr), GFP_KERNEL);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  53  	if (!sysfs_targets->targets_arr) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  54  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  55  		kunit_skip(test, "targets_arr alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  56  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  57  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  58  	sysfs_target = damon_sysfs_target_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  59  	if (!sysfs_target) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  60  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  61  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  62  		kunit_skip(test, "sysfs_target alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  63  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  64  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(12, 100);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  65  	sysfs_target->regions = damon_sysfs_regions_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  66  	if (!sysfs_target->regions) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  67  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  68  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  69  		kfree(sysfs_target);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  70  		kunit_skip(test, "sysfs_regions alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  71  	}
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  72  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  73  	sysfs_targets->targets_arr[0] = sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  74  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  75  	ctx = damon_new_ctx();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  76  	if (!ctx) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  77  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  78  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @79  		kfree(sysfs_target);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @80  		kfree(sysfs_target->regions);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  81  		kunit_skip(test, "ctx alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  82  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  83  
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  84  	damon_sysfs_add_targets(ctx, sysfs_targets);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  85  	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  86  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  87  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  88  			sysfs_target->pid + 1, 200);
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  89  	damon_sysfs_add_targets(ctx, sysfs_targets);
d96727a251fd2b mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  90  	KUNIT_EXPECT_EQ(test, 2u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  91  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  92  	damon_destroy_ctx(ctx);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  93  	kfree(sysfs_targets->targets_arr);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  94  	kfree(sysfs_targets);
2d6a1c835685de mm/damon/tests/sysfs-kunit.h Jinjie Ruan   2024-10-10  95  	kfree(sysfs_target->regions);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  96  	kfree(sysfs_target);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  97  }
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
