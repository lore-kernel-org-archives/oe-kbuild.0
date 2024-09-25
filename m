Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308A1537B9
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255835; cv=none; b=pe/eBIiRFVIEiagcoSzPHZNtBwdYbFEbso9RNMwU/kOeWK54i2qKB9iqZlYL9x4VG0Im6dhJxd5rC/hj9mMDu8L9oWYQAwgNrj2t5hqQOx1K9PAl77DVtiO9w/FwMcoy0D0Kz6iVUe3CpLwsbVLBBT65BgFqIE/2Vvhwt3SDv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255835; c=relaxed/simple;
	bh=e0X6LO4eTqpLw6UjjihclkJ50D9FaLrGaW2vH4hdx68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bcya8EpntxG5xm1N8pIk7YCOstHUfAdFAGOvrC+9ZxX4K6WZ89Qer2EH2oGPWHVsIKmEQR3UZIXmGuFHeeyxB3VUY3TRyTuXm4CJZEK+Duk22fG7uE+RFe2oT/YK5L1R9K46B7W4mYVSO4QBvfeD12r0gk+0HF2Nc+Q+oQ3FQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efl43e/A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efl43e/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727255833; x=1758791833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0X6LO4eTqpLw6UjjihclkJ50D9FaLrGaW2vH4hdx68=;
  b=Efl43e/AK5T5WPqGpc5tutzybEOALtNK4nxJ/WRFIw09Tnl+lKGbuGQD
   kQWoLSCBQfFMyMSRoYx8jF5sTFtkJ9XemQ5kLZNKZUbftQiqIF7zlroCo
   AFh4m5KLX35MRoOoO7Vpev0DPncj+AF35NzKX0bYqpEyNrzb3HeuxITLJ
   zmP9ogvBGnCW3p87eeJPEKw4o/1/VOraUvV4V8ZLP5d8bFsAAcipXJDdm
   MKNP/n1qg6jLU6RWCI6eOsUNgBRKJYS26OXHh9MiTEsD03KJSiSXPjBbM
   YsQg2mFsBklSrGdpj9Krxn8f+mCkNMi5ff4q0N34z4YGx6evSWpnO1ApF
   w==;
X-CSE-ConnectionGUID: Hue+f4coTZ+jIYgkMz8tVQ==
X-CSE-MsgGUID: TV1Zro6kSNKTq0XCipG0Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25802652"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="25802652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:17:13 -0700
X-CSE-ConnectionGUID: 4UkJrASJTRaKA1AtTav7HQ==
X-CSE-MsgGUID: 2WeWZ1b6RGSSQgjPAZBNDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="95037750"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2024 02:17:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stO8z-000JP1-0g;
	Wed, 25 Sep 2024 09:17:09 +0000
Date: Wed, 25 Sep 2024 17:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned 51/58] fs/xfs/xfs_zone_gc.c:1362:22-31: ERROR:
 rtg is NULL but dereferenced.
Message-ID: <202409251726.NlsVcyZz-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   22bf42bc647f9649d96ceeab18db28394f25eb7d
commit: 525c726a912d856e3dec2becd77454538646c6a9 [51/58] xfs: support zoned RT devices
:::::: branch date: 28 hours ago
:::::: commit date: 9 days ago
config: i386-randconfig-053-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251726.NlsVcyZz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409251726.NlsVcyZz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_gc.c:1362:22-31: ERROR: rtg is NULL but dereferenced.
--
>> fs/xfs/xfs_zone_gc.c:439:33-34: WARNING opportunity for min()
--
>> fs/xfs/xfs_zone_alloc.c:544:44-47: ERROR: invalid reference to the index variable of the iterator on line 537

vim +1362 fs/xfs/xfs_zone_gc.c

525c726a912d85 Christoph Hellwig 2024-09-10  1222  
525c726a912d85 Christoph Hellwig 2024-09-10  1223  int
525c726a912d85 Christoph Hellwig 2024-09-10  1224  xfs_mount_zones(
525c726a912d85 Christoph Hellwig 2024-09-10  1225  	struct xfs_mount	*mp)
525c726a912d85 Christoph Hellwig 2024-09-10  1226  {
525c726a912d85 Christoph Hellwig 2024-09-10  1227  	struct xfs_buftarg	*bt = mp->m_rtdev_targp;
525c726a912d85 Christoph Hellwig 2024-09-10  1228  	unsigned int		bdev_open_zones;
525c726a912d85 Christoph Hellwig 2024-09-10  1229  	int64_t			available = 0, freedblocks = 0;
525c726a912d85 Christoph Hellwig 2024-09-10  1230  	struct xfs_rtgroup	*rtg;
525c726a912d85 Christoph Hellwig 2024-09-10  1231  	xfs_rgnumber_t		rgno;
525c726a912d85 Christoph Hellwig 2024-09-10  1232  	int			error;
525c726a912d85 Christoph Hellwig 2024-09-10  1233  
525c726a912d85 Christoph Hellwig 2024-09-10  1234  	if (!bt) {
525c726a912d85 Christoph Hellwig 2024-09-10  1235  		xfs_notice(mp, "RT device missing.");
525c726a912d85 Christoph Hellwig 2024-09-10  1236  		return -EINVAL;
525c726a912d85 Christoph Hellwig 2024-09-10  1237  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1238  
525c726a912d85 Christoph Hellwig 2024-09-10  1239  	if (!xfs_has_rtgroups(mp) || !xfs_has_rmapbt(mp)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1240  		xfs_notice(mp, "invalid flag combination.");
525c726a912d85 Christoph Hellwig 2024-09-10  1241  		return -EFSCORRUPTED;
525c726a912d85 Christoph Hellwig 2024-09-10  1242  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1243  	if (mp->m_sb.sb_rextsize != 1) {
525c726a912d85 Christoph Hellwig 2024-09-10  1244  		xfs_notice(mp, "zoned file systems do not support rextsize.");
525c726a912d85 Christoph Hellwig 2024-09-10  1245  		return -EFSCORRUPTED;
525c726a912d85 Christoph Hellwig 2024-09-10  1246  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1247  	if (mp->m_sb.sb_rgcount < XFS_MIN_ZONES) {
525c726a912d85 Christoph Hellwig 2024-09-10  1248  		xfs_notice(mp,
525c726a912d85 Christoph Hellwig 2024-09-10  1249  "zoned file systems need to have at least %d zones.", XFS_MIN_ZONES);
525c726a912d85 Christoph Hellwig 2024-09-10  1250  		return -EFSCORRUPTED;
525c726a912d85 Christoph Hellwig 2024-09-10  1251  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1252  
525c726a912d85 Christoph Hellwig 2024-09-10  1253  	/*
525c726a912d85 Christoph Hellwig 2024-09-10  1254  	 * Normally we pick the open zone limit that the device reports.  If
525c726a912d85 Christoph Hellwig 2024-09-10  1255  	 * there isn't one let the user pick one from the command line.
525c726a912d85 Christoph Hellwig 2024-09-10  1256  	 *
525c726a912d85 Christoph Hellwig 2024-09-10  1257  	 * If the device doesn't report an open zone limit and there is no
525c726a912d85 Christoph Hellwig 2024-09-10  1258  	 * override, allow to hold about half of the zones open.  In theory we
525c726a912d85 Christoph Hellwig 2024-09-10  1259  	 * should allow to be open, but at that point we run into GC deadlocks
525c726a912d85 Christoph Hellwig 2024-09-10  1260  	 * because we (at least currently) can't reclaim open zones.
525c726a912d85 Christoph Hellwig 2024-09-10  1261  	 *
525c726a912d85 Christoph Hellwig 2024-09-10  1262  	 * When used on conventional SSDs a lower open limit is advisable as
525c726a912d85 Christoph Hellwig 2024-09-10  1263  	 * we'll otherwise overwhelm the FTL just as much as a conventional
525c726a912d85 Christoph Hellwig 2024-09-10  1264  	 * block allocator.
525c726a912d85 Christoph Hellwig 2024-09-10  1265  	 *
525c726a912d85 Christoph Hellwig 2024-09-10  1266  	 * Note: To debug the open zone management code, force max_open to
525c726a912d85 Christoph Hellwig 2024-09-10  1267  	 * 1 here.
525c726a912d85 Christoph Hellwig 2024-09-10  1268  	 */
525c726a912d85 Christoph Hellwig 2024-09-10  1269  	bdev_open_zones = bdev_max_open_zones(bt->bt_bdev);
525c726a912d85 Christoph Hellwig 2024-09-10  1270  	if (bdev_open_zones && !mp->m_max_open_zones)
525c726a912d85 Christoph Hellwig 2024-09-10  1271  		mp->m_max_open_zones = bdev_open_zones;
525c726a912d85 Christoph Hellwig 2024-09-10  1272  	if (mp->m_max_open_zones) {
525c726a912d85 Christoph Hellwig 2024-09-10  1273  		if (mp->m_max_open_zones < XFS_MIN_OPEN_ZONES) {
525c726a912d85 Christoph Hellwig 2024-09-10  1274  			xfs_notice(mp, "need at least %d open zones.",
525c726a912d85 Christoph Hellwig 2024-09-10  1275  				XFS_MIN_OPEN_ZONES);
525c726a912d85 Christoph Hellwig 2024-09-10  1276  			return -EIO;
525c726a912d85 Christoph Hellwig 2024-09-10  1277  		}
525c726a912d85 Christoph Hellwig 2024-09-10  1278  		if (bdev_open_zones && bdev_open_zones < mp->m_max_open_zones) {
525c726a912d85 Christoph Hellwig 2024-09-10  1279  			xfs_warn(mp, "device only supports %d open zones.\n",
525c726a912d85 Christoph Hellwig 2024-09-10  1280  				bdev_open_zones);
525c726a912d85 Christoph Hellwig 2024-09-10  1281  			mp->m_max_open_zones = bdev_open_zones;
525c726a912d85 Christoph Hellwig 2024-09-10  1282  		}
525c726a912d85 Christoph Hellwig 2024-09-10  1283  		if (mp->m_max_open_zones > xfs_max_open_zones(mp)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1284  			mp->m_max_open_zones = xfs_max_open_zones(mp);
525c726a912d85 Christoph Hellwig 2024-09-10  1285  			xfs_info(mp,
525c726a912d85 Christoph Hellwig 2024-09-10  1286  "limiting open zones to %u due to total zone count (%u)",
525c726a912d85 Christoph Hellwig 2024-09-10  1287  				mp->m_max_open_zones, mp->m_sb.sb_rgcount);
525c726a912d85 Christoph Hellwig 2024-09-10  1288  		}
525c726a912d85 Christoph Hellwig 2024-09-10  1289  	} else {
525c726a912d85 Christoph Hellwig 2024-09-10  1290  		mp->m_max_open_zones = xfs_max_open_zones(mp);
525c726a912d85 Christoph Hellwig 2024-09-10  1291  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1292  
525c726a912d85 Christoph Hellwig 2024-09-10  1293  	INIT_LIST_HEAD(&mp->m_free_zones);
525c726a912d85 Christoph Hellwig 2024-09-10  1294  	INIT_LIST_HEAD(&mp->m_open_zones);
525c726a912d85 Christoph Hellwig 2024-09-10  1295  	INIT_LIST_HEAD(&mp->m_emptied_zones);
525c726a912d85 Christoph Hellwig 2024-09-10  1296  	INIT_LIST_HEAD(&mp->m_reclaim_reservations);
525c726a912d85 Christoph Hellwig 2024-09-10  1297  	spin_lock_init(&mp->m_zone_list_lock);
525c726a912d85 Christoph Hellwig 2024-09-10  1298  	spin_lock_init(&mp->m_reservation_lock);
525c726a912d85 Christoph Hellwig 2024-09-10  1299  	init_waitqueue_head(&mp->m_zone_wait);
525c726a912d85 Christoph Hellwig 2024-09-10  1300  
525c726a912d85 Christoph Hellwig 2024-09-10  1301  	xfs_info(mp, "%u zones of %u blocks size (%d max open)",
525c726a912d85 Christoph Hellwig 2024-09-10  1302  		 mp->m_sb.sb_rgcount, mp->m_rgblocks, mp->m_max_open_zones);
525c726a912d85 Christoph Hellwig 2024-09-10  1303  
525c726a912d85 Christoph Hellwig 2024-09-10  1304  	/*
525c726a912d85 Christoph Hellwig 2024-09-10  1305  	 * Sync our own information with the hardware zone state.
525c726a912d85 Christoph Hellwig 2024-09-10  1306  	 */
525c726a912d85 Christoph Hellwig 2024-09-10  1307  	if (bdev_is_zoned(bt->bt_bdev)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1308  		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1309  			xfs_warn(mp,
525c726a912d85 Christoph Hellwig 2024-09-10  1310  "zoned device support requires CONFIG_BLK_DEV_ZONED");
525c726a912d85 Christoph Hellwig 2024-09-10  1311  			return -EINVAL;
525c726a912d85 Christoph Hellwig 2024-09-10  1312  		}
525c726a912d85 Christoph Hellwig 2024-09-10  1313  		error = blkdev_report_zones(bt->bt_bdev, 0, mp->m_sb.sb_rgcount,
525c726a912d85 Christoph Hellwig 2024-09-10  1314  					    xfs_get_zone_info_cb, mp);
525c726a912d85 Christoph Hellwig 2024-09-10  1315  		if (error < 0)
525c726a912d85 Christoph Hellwig 2024-09-10  1316  			return error;
525c726a912d85 Christoph Hellwig 2024-09-10  1317  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1318  
525c726a912d85 Christoph Hellwig 2024-09-10  1319  	mp->m_zone_gc_thread = kthread_create(xfs_zoned_gcd, mp,
525c726a912d85 Christoph Hellwig 2024-09-10  1320  				"xfs-zone-gc/%s",
525c726a912d85 Christoph Hellwig 2024-09-10  1321  				mp->m_super->s_id);
525c726a912d85 Christoph Hellwig 2024-09-10  1322  	if (IS_ERR(mp->m_zone_gc_thread)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1323  		xfs_warn(mp, "unable to create zone gc thread");
525c726a912d85 Christoph Hellwig 2024-09-10  1324  		return PTR_ERR(mp->m_zone_gc_thread);
525c726a912d85 Christoph Hellwig 2024-09-10  1325  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1326  	/* xfs_zone_gc_start will unpark for rw mounts */
525c726a912d85 Christoph Hellwig 2024-09-10  1327  	kthread_park(mp->m_zone_gc_thread);
525c726a912d85 Christoph Hellwig 2024-09-10  1328  
525c726a912d85 Christoph Hellwig 2024-09-10  1329  	for_each_rtgroup(mp, rgno, rtg) {
525c726a912d85 Christoph Hellwig 2024-09-10  1330  		error = xfs_init_zone(rtg, &available, &freedblocks);
525c726a912d85 Christoph Hellwig 2024-09-10  1331  		if (error)
525c726a912d85 Christoph Hellwig 2024-09-10  1332  			goto out_unlink_zones;
525c726a912d85 Christoph Hellwig 2024-09-10  1333  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1334  
525c726a912d85 Christoph Hellwig 2024-09-10  1335  	/*
525c726a912d85 Christoph Hellwig 2024-09-10  1336  	 * XXX: convert to rtxlen.  Or just give up on the conversion because
525c726a912d85 Christoph Hellwig 2024-09-10  1337  	 * we have a 1:1 mapping.
525c726a912d85 Christoph Hellwig 2024-09-10  1338  	 */
525c726a912d85 Christoph Hellwig 2024-09-10  1339  	percpu_counter_set(&mp->m_free[FREE_RTAVAILABLE], available);
525c726a912d85 Christoph Hellwig 2024-09-10  1340  	percpu_counter_set(&mp->m_free[FREE_RTEXTENTS],
525c726a912d85 Christoph Hellwig 2024-09-10  1341  			available + freedblocks);
525c726a912d85 Christoph Hellwig 2024-09-10  1342  
525c726a912d85 Christoph Hellwig 2024-09-10  1343  	/*
525c726a912d85 Christoph Hellwig 2024-09-10  1344  	 * If there are no free zones available for GC, pick the open zone with
525c726a912d85 Christoph Hellwig 2024-09-10  1345  	 * the least used space to GC into.
525c726a912d85 Christoph Hellwig 2024-09-10  1346  	 */
525c726a912d85 Christoph Hellwig 2024-09-10  1347  	if (list_empty(&mp->m_free_zones)) {
525c726a912d85 Christoph Hellwig 2024-09-10  1348  		rtg = xfs_pick_open_zone_for_gc(mp);
525c726a912d85 Christoph Hellwig 2024-09-10  1349  		if (!rtg) {
525c726a912d85 Christoph Hellwig 2024-09-10  1350  			error = -EINVAL;
525c726a912d85 Christoph Hellwig 2024-09-10  1351  			goto out_unlink_zones;
525c726a912d85 Christoph Hellwig 2024-09-10  1352  		}
525c726a912d85 Christoph Hellwig 2024-09-10  1353  		list_del_init(&rtg->rtg_entry);
525c726a912d85 Christoph Hellwig 2024-09-10  1354  		mp->m_nr_open_zones--;
525c726a912d85 Christoph Hellwig 2024-09-10  1355  		clear_bit(RTG_F_OPEN, &rtg->rtg_flags);
525c726a912d85 Christoph Hellwig 2024-09-10  1356  		mp->m_open_gc_zone = rtg;
525c726a912d85 Christoph Hellwig 2024-09-10  1357  	}
525c726a912d85 Christoph Hellwig 2024-09-10  1358  	return 0;
525c726a912d85 Christoph Hellwig 2024-09-10  1359  
525c726a912d85 Christoph Hellwig 2024-09-10  1360  out_unlink_zones:
525c726a912d85 Christoph Hellwig 2024-09-10  1361  	for_each_rtgroup(mp, rgno, rtg)
525c726a912d85 Christoph Hellwig 2024-09-10 @1362  		list_del_init(&rtg->rtg_entry);
525c726a912d85 Christoph Hellwig 2024-09-10  1363  	return error;
525c726a912d85 Christoph Hellwig 2024-09-10  1364  }
525c726a912d85 Christoph Hellwig 2024-09-10  1365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
