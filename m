Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C973A48DF
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605755; cv=none; b=MmAE8mbDIP2S3DnU2Fd3rM24tzIOPyiEfLict4VNng4o2A3W5WSE4WofiWv6quj6EmXyND7FY3Cpzqxd1JJeGgZschofGevsfdL7TJbmhajg5N7R6kqLUY71yyd2qQORLbOLeFkt6AB3ccyP0S0VCyGUztXg9Mt8l2M84wn4eic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605755; c=relaxed/simple;
	bh=7lWcfutCY1nQlPEiZxQjSeYVSzbW5OUh9XO2gmPPF9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tv7AYtskLqhlP/euRYE08R3HZEAI+V4GsEFdXuZ1NkRf6KalNnJtzTmeSk59/eB2CIBSjR7fHOlZdQ4VIDENMbtVOvl74LazJ04g0QUnPljO/ZHinZ0E6yeHRrOTVXx6bDLyifpfy7MZxz7tMcnQeK5jUp5D4S7IdzobBArrAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQCDF1f8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQCDF1f8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781605754; x=1813141754;
  h=date:from:to:cc:subject:message-id;
  bh=7lWcfutCY1nQlPEiZxQjSeYVSzbW5OUh9XO2gmPPF9w=;
  b=hQCDF1f8L/9hrASpzSZK8glJa8m6oBmc0+3IbwrJIb8UNAlbDqDoLF8w
   p7XAcjvvh0kdlkaAfUscw2X1iTxm48qN4gks74EGOldHxLai8bC5gWUH8
   +4Ptu+Z3Z5JsBnFwABnYzFcHbaxkMPJnKWNqobgK4fj4FrVwiiGDb7vRy
   1R0vK+Kem5XIlcGPPnYWnDXDUp4S71DD583LkAHO5KkGylctonKx+1Icd
   fcjTwH2pLivzCwr+1qxq4DZ5m+RvBCfZSXUxymejmsAnyf8qL41Z4uu6t
   42yon89rQBYFn3/P7lZuB06CmdnIb55ejTSGPzV1AxL3jCCo+qIv/6mK3
   Q==;
X-CSE-ConnectionGUID: XuYlDVNWRACtZ9tjFbhr7Q==
X-CSE-MsgGUID: muOuYGtpR8y7QxkEuIU5Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93038697"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93038697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:29:12 -0700
X-CSE-ConnectionGUID: ds8RDfeYT/WXoKuzs4uIKQ==
X-CSE-MsgGUID: xD9nLuwgQDuYlwyQtBRqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252038089"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jun 2026 03:29:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZR2a-00000000T2e-2KDf;
	Tue, 16 Jun 2026 10:29:08 +0000
Date: Tue, 16 Jun 2026 18:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/dev-replace.c:1264 btrfs_resume_dev_replace_async()
 warn: missing error code 'ret'
Message-ID: <202606161844.jE5cNpZM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christian Brauner <brauner@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/btrfs-destroy-the-target-device-when-mark_block_group_to_copy-fails/20260615-215553
head:   5527fe38a68e33db0e4b827f3c6aa4dcb13c9dbd
commit: 5527fe38a68e33db0e4b827f3c6aa4dcb13c9dbd btrfs: deny freezing devices undergoing a replace
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-141-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161844.jE5cNpZM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606161844.jE5cNpZM-lkp@intel.com/

smatch warnings:
fs/btrfs/dev-replace.c:1264 btrfs_resume_dev_replace_async() warn: missing error code 'ret'

vim +/ret +1264 fs/btrfs/dev-replace.c

e93c89c1aaaaaec Stefan Behrens    2012-11-05  1211  
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1212  /* resume dev_replace procedure that was interrupted by unmount */
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1213  int btrfs_resume_dev_replace_async(struct btrfs_fs_info *fs_info)
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1214  {
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1215  	struct task_struct *task;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1216  	struct btrfs_dev_replace *dev_replace = &fs_info->dev_replace;
5527fe38a68e33d Christian Brauner 2026-06-15  1217  	int ret = 0;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1218  
cb5583dd52fab46 David Sterba      2018-09-07  1219  	down_write(&dev_replace->rwsem);
cb5583dd52fab46 David Sterba      2018-09-07  1220  
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1221  	switch (dev_replace->replace_state) {
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1222  	case BTRFS_IOCTL_DEV_REPLACE_STATE_NEVER_STARTED:
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1223  	case BTRFS_IOCTL_DEV_REPLACE_STATE_FINISHED:
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1224  	case BTRFS_IOCTL_DEV_REPLACE_STATE_CANCELED:
cb5583dd52fab46 David Sterba      2018-09-07  1225  		up_write(&dev_replace->rwsem);
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1226  		return 0;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1227  	case BTRFS_IOCTL_DEV_REPLACE_STATE_STARTED:
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1228  		break;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1229  	case BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED:
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1230  		dev_replace->replace_state =
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1231  			BTRFS_IOCTL_DEV_REPLACE_STATE_STARTED;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1232  		break;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1233  	}
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1234  	if (!dev_replace->tgtdev || !dev_replace->tgtdev->bdev) {
5d163e0e68ce743 Jeff Mahoney      2016-09-20  1235  		btrfs_info(fs_info,
5d163e0e68ce743 Jeff Mahoney      2016-09-20  1236  			   "cannot continue dev_replace, tgtdev is missing");
efe120a067c8674 Frank Holton      2013-12-20  1237  		btrfs_info(fs_info,
efe120a067c8674 Frank Holton      2013-12-20  1238  			   "you may cancel the operation after 'mount -o degraded'");
0d228ece59a35a9 Anand Jain        2018-11-11  1239  		dev_replace->replace_state =
0d228ece59a35a9 Anand Jain        2018-11-11  1240  					BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED;
cb5583dd52fab46 David Sterba      2018-09-07  1241  		up_write(&dev_replace->rwsem);
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1242  		return 0;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1243  	}
cb5583dd52fab46 David Sterba      2018-09-07  1244  	up_write(&dev_replace->rwsem);
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1245  
010a47bde94201d David Sterba      2018-03-20  1246  	/*
010a47bde94201d David Sterba      2018-03-20  1247  	 * This could collide with a paused balance, but the exclusive op logic
010a47bde94201d David Sterba      2018-03-20  1248  	 * should never allow both to start and pause. We don't want to allow
010a47bde94201d David Sterba      2018-03-20  1249  	 * dev-replace to start anyway.
010a47bde94201d David Sterba      2018-03-20  1250  	 */
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  1251  	if (!btrfs_exclop_start(fs_info, BTRFS_EXCLOP_DEV_REPLACE)) {
cb5583dd52fab46 David Sterba      2018-09-07  1252  		down_write(&dev_replace->rwsem);
05c49e6bc1e8866 Anand Jain        2018-11-11  1253  		dev_replace->replace_state =
05c49e6bc1e8866 Anand Jain        2018-11-11  1254  					BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED;
cb5583dd52fab46 David Sterba      2018-09-07  1255  		up_write(&dev_replace->rwsem);
010a47bde94201d David Sterba      2018-03-20  1256  		btrfs_info(fs_info,
010a47bde94201d David Sterba      2018-03-20  1257  		"cannot resume dev-replace, other exclusive operation running");
010a47bde94201d David Sterba      2018-03-20  1258  		return 0;
010a47bde94201d David Sterba      2018-03-20  1259  	}
010a47bde94201d David Sterba      2018-03-20  1260  
5527fe38a68e33d Christian Brauner 2026-06-15  1261  	/* Re-deny for the resumed replace; stay suspended if frozen now. */
5527fe38a68e33d Christian Brauner 2026-06-15  1262  	if (dev_replace->srcdev->bdev &&
5527fe38a68e33d Christian Brauner 2026-06-15  1263  	    bdev_deny_freeze(dev_replace->srcdev->bdev))
5527fe38a68e33d Christian Brauner 2026-06-15 @1264  		goto suspend;
5527fe38a68e33d Christian Brauner 2026-06-15  1265  	if (bdev_deny_freeze(dev_replace->tgtdev->bdev)) {
5527fe38a68e33d Christian Brauner 2026-06-15  1266  		if (dev_replace->srcdev->bdev)
5527fe38a68e33d Christian Brauner 2026-06-15  1267  			bdev_allow_freeze(dev_replace->srcdev->bdev);
5527fe38a68e33d Christian Brauner 2026-06-15  1268  		goto suspend;
5527fe38a68e33d Christian Brauner 2026-06-15  1269  	}
5527fe38a68e33d Christian Brauner 2026-06-15  1270  
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1271  	task = kthread_run(btrfs_dev_replace_kthread, fs_info, "btrfs-devrepl");
5527fe38a68e33d Christian Brauner 2026-06-15  1272  	if (IS_ERR(task)) {
5527fe38a68e33d Christian Brauner 2026-06-15  1273  		bdev_allow_freeze(dev_replace->tgtdev->bdev);
5527fe38a68e33d Christian Brauner 2026-06-15  1274  		if (dev_replace->srcdev->bdev)
5527fe38a68e33d Christian Brauner 2026-06-15  1275  			bdev_allow_freeze(dev_replace->srcdev->bdev);
5527fe38a68e33d Christian Brauner 2026-06-15  1276  		/* Undo the deny and suspend, but still fail the mount. */
5527fe38a68e33d Christian Brauner 2026-06-15  1277  		ret = PTR_ERR(task);
5527fe38a68e33d Christian Brauner 2026-06-15  1278  		goto suspend;
5527fe38a68e33d Christian Brauner 2026-06-15  1279  	}
5527fe38a68e33d Christian Brauner 2026-06-15  1280  	return 0;
5527fe38a68e33d Christian Brauner 2026-06-15  1281  
5527fe38a68e33d Christian Brauner 2026-06-15  1282  suspend:
5527fe38a68e33d Christian Brauner 2026-06-15  1283  	btrfs_exclop_finish(fs_info);
5527fe38a68e33d Christian Brauner 2026-06-15  1284  	down_write(&dev_replace->rwsem);
5527fe38a68e33d Christian Brauner 2026-06-15  1285  	dev_replace->replace_state = BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED;
5527fe38a68e33d Christian Brauner 2026-06-15  1286  	up_write(&dev_replace->rwsem);
5527fe38a68e33d Christian Brauner 2026-06-15  1287  	return ret;
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1288  }
e93c89c1aaaaaec Stefan Behrens    2012-11-05  1289  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
