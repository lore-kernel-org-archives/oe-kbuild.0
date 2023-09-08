Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552401849
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694165949; x=1725701949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvUOtdw/9MAwQlniZ9nG3WvNg+6YQDvZlH8yAdGri2I=;
  b=WxQrlxRUi/wSc0+xoeozVUqEku9FDKsnYL89KxsJsRQAYRTHgE5NeCaf
   BagqEyVFTv/NV8onxJ6JcTJzxznnXTKag5hWO4mH3pRJCJvXS3ApAYLvH
   USx7+a/EHHNNfy2We3RQIruuaLPFNAEaOCvnP69L8LVg7xxpU0VD+uS5q
   RHpYh6beYtqabiV0YDN+BpbIM1fVQVT7hYhKz4nBRMjRrkIxmv9Q/ZkMq
   sWzMoFl5Jcm8Qha4CJxUYIof3IOmz2VtLPq0c2u76Wrycg3jdSLcg9tLb
   EpxmIxO9/3fd3JhQi01n9cSBQdwIR9NKvBT659KYxDq5iNKt0SSm2aiwh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="441627317"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="441627317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 02:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="989190617"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="989190617"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 02:38:59 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeXx3-00028z-1L;
	Fri, 08 Sep 2023 09:38:57 +0000
Date: Fri, 8 Sep 2023 17:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] btrfs: pseudo device-scan for single-device filesystems
Message-ID: <202309081720.APyzBPju-lkp@intel.com>
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
In-Reply-To: <b0e0240254557461c137cd9b943f00b0d5048083.1693959204.git.anand.jain@oracle.com>
References: <b0e0240254557461c137cd9b943f00b0d5048083.1693959204.git.anand.jain@oracle.com>
TO: Anand Jain <anand.jain@oracle.com>
TO: linux-btrfs@vger.kernel.org
CC: Anand Jain <anand.jain@oracle.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Jain/btrfs-pseudo-device-scan-for-single-device-filesystems/20230907-003117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/b0e0240254557461c137cd9b943f00b0d5048083.1693959204.git.anand.jain%40oracle.com
patch subject: [PATCH] btrfs: pseudo device-scan for single-device filesystems
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081720.APyzBPju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309081720.APyzBPju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309081720.APyzBPju-lkp@intel.com/

New smatch warnings:
fs/btrfs/super.c:1550 btrfs_mount_root() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/btrfs/super.c:1490 btrfs_mount_root() warn: passing zero to 'PTR_ERR'
fs/btrfs/super.c:2225 btrfs_control_ioctl() warn: passing zero to 'PTR_ERR'

vim +/ERR_PTR +1550 fs/btrfs/super.c

450ba0ea06b6ed Josef Bacik       2010-11-19  1433  
312c89fbca0689 Misono, Tomohiro  2017-12-14  1434  /*
312c89fbca0689 Misono, Tomohiro  2017-12-14  1435   * Find a superblock for the given device / mount point.
312c89fbca0689 Misono, Tomohiro  2017-12-14  1436   *
312c89fbca0689 Misono, Tomohiro  2017-12-14  1437   * Note: This is based on mount_bdev from fs/super.c with a few additions
312c89fbca0689 Misono, Tomohiro  2017-12-14  1438   *       for multiple device setup.  Make sure to keep it in sync.
312c89fbca0689 Misono, Tomohiro  2017-12-14  1439   */
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1440  static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1441  		int flags, const char *device_name, void *data)
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1442  {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1443  	struct block_device *bdev = NULL;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1444  	struct super_block *s;
36350e95a2b1fe Gu Jinxiang       2018-07-12  1445  	struct btrfs_device *device = NULL;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1446  	struct btrfs_fs_devices *fs_devices = NULL;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1447  	struct btrfs_fs_info *fs_info = NULL;
204cc0ccf1d49c Al Viro           2018-12-13  1448  	void *new_sec_opts = NULL;
05bdb9965305bb Christoph Hellwig 2023-06-08  1449  	blk_mode_t mode = sb_open_mode(flags);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1450  	int error = 0;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1451  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1452  	if (data) {
a65001e8a4d465 Al Viro           2018-12-10  1453  		error = security_sb_eat_lsm_opts(data, &new_sec_opts);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1454  		if (error)
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1455  			return ERR_PTR(error);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1456  	}
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1457  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1458  	/*
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1459  	 * Setup a dummy root and fs_info for test/set super.  This is because
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1460  	 * we don't actually fill this stuff out until open_ctree, but we need
8260edba67a2e6 Josef Bacik       2020-01-24  1461  	 * then open_ctree will properly initialize the file system specific
8260edba67a2e6 Josef Bacik       2020-01-24  1462  	 * settings later.  btrfs_init_fs_info initializes the static elements
8260edba67a2e6 Josef Bacik       2020-01-24  1463  	 * of the fs_info (locks and such) to make cleanup easier if we find a
8260edba67a2e6 Josef Bacik       2020-01-24  1464  	 * superblock with our given fs_devices later on at sget() time.
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1465  	 */
a8fd1f71749387 Jeff Mahoney      2018-02-15  1466  	fs_info = kvzalloc(sizeof(struct btrfs_fs_info), GFP_KERNEL);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1467  	if (!fs_info) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1468  		error = -ENOMEM;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1469  		goto error_sec_opts;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1470  	}
8260edba67a2e6 Josef Bacik       2020-01-24  1471  	btrfs_init_fs_info(fs_info);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1472  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1473  	fs_info->super_copy = kzalloc(BTRFS_SUPER_INFO_SIZE, GFP_KERNEL);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1474  	fs_info->super_for_commit = kzalloc(BTRFS_SUPER_INFO_SIZE, GFP_KERNEL);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1475  	if (!fs_info->super_copy || !fs_info->super_for_commit) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1476  		error = -ENOMEM;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1477  		goto error_fs_info;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1478  	}
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1479  
399f7f4c42e8a5 David Sterba      2018-06-19  1480  	mutex_lock(&uuid_mutex);
2ef789288afd36 Christoph Hellwig 2023-06-08  1481  	error = btrfs_parse_device_options(data, mode);
81ffd56b574535 David Sterba      2018-06-19  1482  	if (error) {
399f7f4c42e8a5 David Sterba      2018-06-19  1483  		mutex_unlock(&uuid_mutex);
399f7f4c42e8a5 David Sterba      2018-06-19  1484  		goto error_fs_info;
81ffd56b574535 David Sterba      2018-06-19  1485  	}
399f7f4c42e8a5 David Sterba      2018-06-19  1486  
48c78d20503e8d Anand Jain        2023-09-07  1487  	device = btrfs_scan_one_device(device_name, mode, true);
48c78d20503e8d Anand Jain        2023-09-07  1488  	if (IS_ERR_OR_NULL(device)) {
399f7f4c42e8a5 David Sterba      2018-06-19  1489  		mutex_unlock(&uuid_mutex);
36350e95a2b1fe Gu Jinxiang       2018-07-12  1490  		error = PTR_ERR(device);
48c78d20503e8d Anand Jain        2023-09-07  1491  		/*
48c78d20503e8d Anand Jain        2023-09-07  1492  		 * As 3rd argument in the funtion
48c78d20503e8d Anand Jain        2023-09-07  1493  		 * btrfs_scan_one_device( , ,mount_arg_dev) above is true, the
48c78d20503e8d Anand Jain        2023-09-07  1494  		 * 'device' or the 'error' won't be NULL or 0 respectively
48c78d20503e8d Anand Jain        2023-09-07  1495  		 * unless for a bug.
48c78d20503e8d Anand Jain        2023-09-07  1496  		 */
48c78d20503e8d Anand Jain        2023-09-07  1497  		ASSERT(error);
399f7f4c42e8a5 David Sterba      2018-06-19  1498  		goto error_fs_info;
81ffd56b574535 David Sterba      2018-06-19  1499  	}
399f7f4c42e8a5 David Sterba      2018-06-19  1500  
36350e95a2b1fe Gu Jinxiang       2018-07-12  1501  	fs_devices = device->fs_devices;
399f7f4c42e8a5 David Sterba      2018-06-19  1502  	fs_info->fs_devices = fs_devices;
399f7f4c42e8a5 David Sterba      2018-06-19  1503  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1504  	error = btrfs_open_devices(fs_devices, mode, fs_type);
f5194e34cabadd David Sterba      2018-06-19  1505  	mutex_unlock(&uuid_mutex);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1506  	if (error)
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1507  		goto error_fs_info;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1508  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1509  	if (!(flags & SB_RDONLY) && fs_devices->rw_devices == 0) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1510  		error = -EACCES;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1511  		goto error_close_devices;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1512  	}
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1513  
d24fa5c1da0802 Anand Jain        2021-08-24  1514  	bdev = fs_devices->latest_dev->bdev;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1515  	s = sget(fs_type, btrfs_test_super, btrfs_set_super, flags | SB_NOSEC,
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1516  		 fs_info);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1517  	if (IS_ERR(s)) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1518  		error = PTR_ERR(s);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1519  		goto error_close_devices;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1520  	}
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1521  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1522  	if (s->s_root) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1523  		btrfs_close_devices(fs_devices);
0d4b0463011de0 Josef Bacik       2020-01-24  1524  		btrfs_free_fs_info(fs_info);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1525  		if ((flags ^ s->s_flags) & SB_RDONLY)
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1526  			error = -EBUSY;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1527  	} else {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1528  		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
e33c267ab70de4 Roman Gushchin    2022-05-31  1529  		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
e33c267ab70de4 Roman Gushchin    2022-05-31  1530  					s->s_id);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1531  		btrfs_sb(s)->bdev_holder = fs_type;
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1532  		error = btrfs_fill_super(s, fs_devices, data);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1533  	}
a65001e8a4d465 Al Viro           2018-12-10  1534  	if (!error)
204cc0ccf1d49c Al Viro           2018-12-13  1535  		error = security_sb_set_mnt_opts(s, new_sec_opts, 0, NULL);
a65001e8a4d465 Al Viro           2018-12-10  1536  	security_free_mnt_opts(&new_sec_opts);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1537  	if (error) {
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1538  		deactivate_locked_super(s);
a65001e8a4d465 Al Viro           2018-12-10  1539  		return ERR_PTR(error);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1540  	}
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1541  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1542  	return dget(s->s_root);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1543  
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1544  error_close_devices:
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1545  	btrfs_close_devices(fs_devices);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1546  error_fs_info:
0d4b0463011de0 Josef Bacik       2020-01-24  1547  	btrfs_free_fs_info(fs_info);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1548  error_sec_opts:
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1549  	security_free_mnt_opts(&new_sec_opts);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14 @1550  	return ERR_PTR(error);
72fa39f5c7a1c9 Misono, Tomohiro  2017-12-14  1551  }
312c89fbca0689 Misono, Tomohiro  2017-12-14  1552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
