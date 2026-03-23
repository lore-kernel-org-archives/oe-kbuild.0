Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D233F58F
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263368; cv=none; b=nQvdxYiFnV4w2AMl2hx5k7UrvZ3HCjZhO8haJ+32OYg7UyZj+ZJb/BmG18AAwCwqsWypgZMjmOGz5y/XSBap8b8J5xbwC9oZjDhhCkW8dbvaTg4v3/6SCSSWVLY7ohTprSRdQH6jmxydoFgkicq/BEC1Xl4uTnVkGXE5GYi7970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263368; c=relaxed/simple;
	bh=GVCIg0JVuUFr0m5bkiUIx1XUePdcGaW2O5SqQJiMHoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YEnJRkfhCo+cztynmHdWkDdC1txHz2mQ9zwPWF3ibVq/RhYpDpzaE3OgyJcIs6sppQtwVnAlmPsYflkMFV7OhvjTfdTNLWgLkht4lDKwvkh4+6zmT1px5TtbHW5zl2vBwQCMIHwOUqfEfYtRmx3Wpz8OadFDUch1DyYLDGCrbiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOaD3agx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOaD3agx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774263366; x=1805799366;
  h=date:from:to:cc:subject:message-id;
  bh=GVCIg0JVuUFr0m5bkiUIx1XUePdcGaW2O5SqQJiMHoU=;
  b=iOaD3agxIEKB0tPTlXo0jwHplj2q7L1iVcrcsulBpJRptDBDF9XnzdsH
   AIEUy/N4lI6g5xqHZFFRiHPxH6N8c1h+MMqXfgP/qnUlSG6CkmGeIM8Ir
   EC8TtgLl1MxvxqCo+YkepLexZn70y/DRvm169K+aWN4UxZfA45+XhIYod
   tYN1HeFN9dT0benx2INzKA6/w63rxS/CZA3P6RB061qSzNnxdKV7JoVBo
   bh3LDjNSy1m7lB26g1+GBB+vlKytXzMobDeAseK1CWFVuyip5OT+tqUpK
   BZaZKbgkEzS2gVXvSANd4VIXlffpq9V8JZ39q5i5HbQ0ezglisZbRkUk+
   g==;
X-CSE-ConnectionGUID: iDOOyQIARTWYJAK/alijUQ==
X-CSE-MsgGUID: WXQNvw9sQH+45ECLrzcXRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85953371"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85953371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:56:05 -0700
X-CSE-ConnectionGUID: j2Wk4KUxRKifdcCu5y+M6w==
X-CSE-MsgGUID: SVJ0op+rTryXo6AGbsrMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224205070"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 03:56:04 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4cwz-000000000Nj-0A97;
	Mon, 23 Mar 2026 10:56:01 +0000
Date: Mon, 23 Mar 2026 18:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:block-for-next 17/31]
 block/blk-throttle.c:1386:2: warning: releasing spinlock
 'bdev_get_queue(ctx.bdev).queue_lock' that was not held
Message-ID: <202603231816.9FqVML61-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux block-for-next
head:   9f0e2d950eb40285341043781f7e9fe8258f9ad6
commit: e9ca43430f52e1ed72d5da4f7b9ef71d85a7fc9d [17/31] block: Enable lock context analysis
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260323/202603231816.9FqVML61-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231816.9FqVML61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603231816.9FqVML61-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-throttle.c:1386:2: warning: releasing spinlock 'bdev_get_queue(ctx.bdev).queue_lock' that was not held [-Wthread-safety-analysis]
    1386 |         blkg_conf_unprep(&ctx);
         |         ^
>> block/blk-throttle.c:1389:2: warning: spinlock 'ctx.bdev->bd_disk->queue->queue_lock' is not held on every path through here [-Wthread-safety-analysis]
    1389 |         blkg_conf_close_bdev(&ctx);
         |         ^
   block/blk-throttle.c:1364:8: note: spinlock acquired here
    1364 |         ret = blkg_conf_prep(blkcg, &blkcg_policy_throtl, &ctx);
         |               ^
   block/blk-throttle.c:1607:2: warning: releasing spinlock 'bdev_get_queue(ctx.bdev).queue_lock' that was not held [-Wthread-safety-analysis]
    1607 |         blkg_conf_unprep(&ctx);
         |         ^
   block/blk-throttle.c:1609:2: warning: spinlock 'ctx.bdev->bd_disk->queue->queue_lock' is not held on every path through here [-Wthread-safety-analysis]
    1609 |         blkg_conf_close_bdev(&ctx);
         |         ^
   block/blk-throttle.c:1552:8: note: spinlock acquired here
    1552 |         ret = blkg_conf_prep(blkcg, &blkcg_policy_throtl, &ctx);
         |               ^
   4 warnings generated.


vim +1386 block/blk-throttle.c

a3166c51702bb0 Yu Kuai         2024-05-09  1341  
a3166c51702bb0 Yu Kuai         2024-05-09  1342  
69948b070ee2bc Tejun Heo       2015-08-18  1343  static ssize_t tg_set_conf(struct kernfs_open_file *of,
69948b070ee2bc Tejun Heo       2015-08-18  1344  			   char *buf, size_t nbytes, loff_t off, bool is_u64)
69948b070ee2bc Tejun Heo       2015-08-18  1345  {
69948b070ee2bc Tejun Heo       2015-08-18  1346  	struct blkcg *blkcg = css_to_blkcg(of_css(of));
69948b070ee2bc Tejun Heo       2015-08-18  1347  	struct blkg_conf_ctx ctx;
69948b070ee2bc Tejun Heo       2015-08-18  1348  	struct throtl_grp *tg;
69948b070ee2bc Tejun Heo       2015-08-18  1349  	int ret;
69948b070ee2bc Tejun Heo       2015-08-18  1350  	u64 v;
69948b070ee2bc Tejun Heo       2015-08-18  1351  
faffaab2895914 Tejun Heo       2023-04-12  1352  	blkg_conf_init(&ctx, buf);
faffaab2895914 Tejun Heo       2023-04-12  1353  
a3166c51702bb0 Yu Kuai         2024-05-09  1354  	ret = blkg_conf_open_bdev(&ctx);
a3166c51702bb0 Yu Kuai         2024-05-09  1355  	if (ret)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1356  		return ret;
a3166c51702bb0 Yu Kuai         2024-05-09  1357  
a3166c51702bb0 Yu Kuai         2024-05-09  1358  	if (!blk_throtl_activated(ctx.bdev->bd_queue)) {
a3166c51702bb0 Yu Kuai         2024-05-09  1359  		ret = blk_throtl_init(ctx.bdev->bd_disk);
a3166c51702bb0 Yu Kuai         2024-05-09  1360  		if (ret)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1361  			goto close_bdev;
a3166c51702bb0 Yu Kuai         2024-05-09  1362  	}
a3166c51702bb0 Yu Kuai         2024-05-09  1363  
faffaab2895914 Tejun Heo       2023-04-12  1364  	ret = blkg_conf_prep(blkcg, &blkcg_policy_throtl, &ctx);
69948b070ee2bc Tejun Heo       2015-08-18  1365  	if (ret)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1366  		goto close_bdev;
69948b070ee2bc Tejun Heo       2015-08-18  1367  
69948b070ee2bc Tejun Heo       2015-08-18  1368  	ret = -EINVAL;
69948b070ee2bc Tejun Heo       2015-08-18  1369  	if (sscanf(ctx.body, "%llu", &v) != 1)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1370  		goto unprep;
69948b070ee2bc Tejun Heo       2015-08-18  1371  	if (!v)
2ab5492de5009a Shaohua Li      2017-03-27  1372  		v = U64_MAX;
69948b070ee2bc Tejun Heo       2015-08-18  1373  
69948b070ee2bc Tejun Heo       2015-08-18  1374  	tg = blkg_to_tg(ctx.blkg);
a880ae93e5b5bb Yu Kuai         2022-08-29  1375  	tg_update_carryover(tg);
69948b070ee2bc Tejun Heo       2015-08-18  1376  
69948b070ee2bc Tejun Heo       2015-08-18  1377  	if (is_u64)
69948b070ee2bc Tejun Heo       2015-08-18  1378  		*(u64 *)((void *)tg + of_cft(of)->private) = v;
69948b070ee2bc Tejun Heo       2015-08-18  1379  	else
69948b070ee2bc Tejun Heo       2015-08-18  1380  		*(unsigned int *)((void *)tg + of_cft(of)->private) = v;
af133ceb261033 Tejun Heo       2012-04-01  1381  
9bb67aeb967845 Shaohua Li      2017-05-17  1382  	tg_conf_updated(tg, false);
36aa9e5f591e84 Tejun Heo       2015-08-18  1383  	ret = 0;
ab9ad25a727a61 Bart Van Assche 2026-03-18  1384  
ab9ad25a727a61 Bart Van Assche 2026-03-18  1385  unprep:
ab9ad25a727a61 Bart Van Assche 2026-03-18 @1386  	blkg_conf_unprep(&ctx);
ab9ad25a727a61 Bart Van Assche 2026-03-18  1387  
ab9ad25a727a61 Bart Van Assche 2026-03-18  1388  close_bdev:
ab9ad25a727a61 Bart Van Assche 2026-03-18 @1389  	blkg_conf_close_bdev(&ctx);
36aa9e5f591e84 Tejun Heo       2015-08-18  1390  	return ret ?: nbytes;
60c2bc2d5a1236 Tejun Heo       2012-04-01  1391  }
60c2bc2d5a1236 Tejun Heo       2012-04-01  1392  

:::::: The code at line 1386 was first introduced by commit
:::::: ab9ad25a727a61c0bddea103f63ecd24ba9c820c block/cgroup: Split blkg_conf_exit()

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Bart Van Assche <bvanassche@acm.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
