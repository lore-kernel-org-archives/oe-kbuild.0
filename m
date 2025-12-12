Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A5222FE0E
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 00:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765500544; cv=none; b=GPtnWoT9APVnBvHls+9Z3PD1hT/EDWR6S+mrN3y3+cMlke9m9+v+0UvydYlM9e9Wzouc50MQq1Ii55Nhw2BgPjtHf0WWrbQoUKIxSoEKBHw+gOznIrqNN6zjLyJ64U9wOv+yEY3voe43HeHi9q/K7p3IZjSy1HwDqRWmkyZZIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765500544; c=relaxed/simple;
	bh=0hZ/u/a/deTOrOecADke3JLP93zsFlTJBqM0ysCFahI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHfLf2h3pPR1TUMGMgav4u4F1+ub/dOUKN7nOZvDCOSQUgg4HPNNG/96+DxqnczQ3AlJ1dZUoQ6PHErI6hFzCcCx0oI/ccnz4o/6bSlZE/ELmLw+0w4bbneeAK47/MYUj0fhniweBL3gKbpcDdqUDxMyDbTCV0FJ9nFdVxyxMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbD7Moww; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbD7Moww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765500543; x=1797036543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hZ/u/a/deTOrOecADke3JLP93zsFlTJBqM0ysCFahI=;
  b=IbD7Moww5ml6HyVkfsHfmwsFaUjzZJx5GJdUVqItS43mLCOrMtgEgvfR
   eDSpXYV4/BDuEIRE5f8hj3BT5JUd/FIJzJYV7bxjW22esON2rbYZvNMhP
   n4utWtRwc7GZugjwywBSyHR99HddNovBde6Uwr8dKDBkZC9cJ1kc9o7YL
   QTS8mk/fuLq5pgTywkqzgV4Fv0QD4rzM/S0WRwIDW/YelV5akZpbEoq4v
   YMJRBWA8qxI8/neW2F1nrPWgFY1ejK59lydxT0uvc07fv4P7eHBFXvf1Y
   dJQ0WmJCA/EMF7iFmtVq0MFp8m3bvTQY9CfZVcgisvPDzATHWSMNNspCI
   A==;
X-CSE-ConnectionGUID: kw+ILEG3Tgyl+dbDFOH05g==
X-CSE-MsgGUID: XeJLfmyCQCqzleOGKiFaxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55042972"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="55042972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:49:01 -0800
X-CSE-ConnectionGUID: M0fTtfqySJyz3BqKnpEBuQ==
X-CSE-MsgGUID: buSCWQo/QTSvobSvUqo4cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201414675"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 16:48:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrL7-000000005Fp-1s4y;
	Fri, 12 Dec 2025 00:48:57 +0000
Date: Fri, 12 Dec 2025 08:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/volumes.c:1334 open_fs_devices() error: we previously
 assumed 'latest_dev' could be null (see line 1310)
Message-ID: <202512120812.Xf0N9YiQ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Anand Jain <anand.jain@oracle.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: c86aae73bd5882e4a6b4e1b6ed448ea902551f80 btrfs: add read policy to set a preferred device
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-r071-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120812.Xf0N9YiQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120812.Xf0N9YiQ-lkp@intel.com/

New smatch warnings:
fs/btrfs/volumes.c:1334 open_fs_devices() error: we previously assumed 'latest_dev' could be null (see line 1310)

Old smatch warnings:
fs/btrfs/volumes.c:894 device_list_add() warn: inconsistent indenting

vim +/latest_dev +1334 fs/btrfs/volumes.c

2b82032c34ec405 Yan Zheng         2008-11-17  1295  
897fb5734a95454 Anand Jain        2018-04-12  1296  static int open_fs_devices(struct btrfs_fs_devices *fs_devices,
05bdb9965305bbf Christoph Hellwig 2023-06-08  1297  				blk_mode_t flags, void *holder)
8a4b83cc8bd75fc Chris Mason       2008-03-24  1298  {
8a4b83cc8bd75fc Chris Mason       2008-03-24  1299  	struct btrfs_device *device;
443f24fee731703 Miao Xie          2014-07-24  1300  	struct btrfs_device *latest_dev = NULL;
96c2e067ed3e3e0 Anand Jain        2020-09-30  1301  	struct btrfs_device *tmp_device;
2f1aeab9fca1a5f Anand Jain        2024-03-19  1302  	int ret = 0;
8a4b83cc8bd75fc Chris Mason       2008-03-24  1303  
96c2e067ed3e3e0 Anand Jain        2020-09-30  1304  	list_for_each_entry_safe(device, tmp_device, &fs_devices->devices,
96c2e067ed3e3e0 Anand Jain        2020-09-30  1305  				 dev_list) {
2f1aeab9fca1a5f Anand Jain        2024-03-19  1306  		int ret2;
a0af469b58944f6 Chris Mason       2008-05-13  1307  
2f1aeab9fca1a5f Anand Jain        2024-03-19  1308  		ret2 = btrfs_open_one_device(fs_devices, device, flags, holder);
2f1aeab9fca1a5f Anand Jain        2024-03-19  1309  		if (ret2 == 0 &&
96c2e067ed3e3e0 Anand Jain        2020-09-30 @1310  		    (!latest_dev || device->generation > latest_dev->generation)) {
9f050db43e0f671 Anand Jain        2017-11-09  1311  			latest_dev = device;
2f1aeab9fca1a5f Anand Jain        2024-03-19  1312  		} else if (ret2 == -ENODATA) {
96c2e067ed3e3e0 Anand Jain        2020-09-30  1313  			fs_devices->num_devices--;
96c2e067ed3e3e0 Anand Jain        2020-09-30  1314  			list_del(&device->dev_list);
96c2e067ed3e3e0 Anand Jain        2020-09-30  1315  			btrfs_free_device(device);
96c2e067ed3e3e0 Anand Jain        2020-09-30  1316  		}
2f1aeab9fca1a5f Anand Jain        2024-03-19  1317  		if (ret == 0 && ret2 != 0)
2f1aeab9fca1a5f Anand Jain        2024-03-19  1318  			ret = ret2;
8a4b83cc8bd75fc Chris Mason       2008-03-24  1319  	}
2f1aeab9fca1a5f Anand Jain        2024-03-19  1320  
2f1aeab9fca1a5f Anand Jain        2024-03-19  1321  	if (fs_devices->open_devices == 0) {
2f1aeab9fca1a5f Anand Jain        2024-03-19  1322  		if (ret)
2f1aeab9fca1a5f Anand Jain        2024-03-19  1323  			return ret;
1ed802c972c6c67 Anand Jain        2020-04-28  1324  		return -EINVAL;
2f1aeab9fca1a5f Anand Jain        2024-03-19  1325  	}
1ed802c972c6c67 Anand Jain        2020-04-28  1326  
2b82032c34ec405 Yan Zheng         2008-11-17  1327  	fs_devices->opened = 1;
d24fa5c1da08026 Anand Jain        2021-08-24  1328  	fs_devices->latest_dev = latest_dev;
2b82032c34ec405 Yan Zheng         2008-11-17  1329  	fs_devices->total_rw_bytes = 0;
c4a816c67c396b1 Naohiro Aota      2020-02-25  1330  	fs_devices->chunk_alloc_policy = BTRFS_CHUNK_ALLOC_REGULAR;
33fd2f714cde793 Anand Jain        2020-10-28  1331  	fs_devices->read_policy = BTRFS_READ_POLICY_PID;
6d7a9154955e50c Anand Jain        2025-01-02  1332  #ifdef CONFIG_BTRFS_EXPERIMENTAL
6d7a9154955e50c Anand Jain        2025-01-02  1333  	fs_devices->rr_min_contig_read = BTRFS_DEFAULT_RR_MIN_CONTIG_READ;
c86aae73bd5882e Anand Jain        2025-01-02 @1334  	fs_devices->read_devid = latest_dev->devid;
6d7a9154955e50c Anand Jain        2025-01-02  1335  #endif
1ed802c972c6c67 Anand Jain        2020-04-28  1336  
1ed802c972c6c67 Anand Jain        2020-04-28  1337  	return 0;
2b82032c34ec405 Yan Zheng         2008-11-17  1338  }
2b82032c34ec405 Yan Zheng         2008-11-17  1339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
