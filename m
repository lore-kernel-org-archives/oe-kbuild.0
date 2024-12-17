Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80C61F03CE
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418162; cv=none; b=DPKT7+7G0XKBVoq2VJ5FzpWbCWf5I2M7KHQ7rUWVtujhgxKjbSTWxalh0QdE0A12Gkij+4/tp62XEKrekRdeijCWmYNDNJyvnP6MkqSvcPPlualwIohMYTC2T3ctJl/fMhgAJyO01mEz29mLSE7xqsuFEx2/j+r/Uksxi0dlaTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418162; c=relaxed/simple;
	bh=9qfHEOQD0zWSJ4VpwGDvjqs/zGThqqGbi4jrs8mcGTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESiuw+9n36lpXOXhW+29gbPZRh87HlZAZXSU1a/N9ZXVTm+e8qnJs7/oU5K9BXRCEZjVas3IKXckKKdcwMWwGBMJFEsBl8G7UK6A+3VIWCAGvNFltm4rl431GwdZFX8BJnWNQUdHZrBj2x+B4h41L+Z9Rb50I4i3j6KYH+7uEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UktIVANN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UktIVANN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734418160; x=1765954160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qfHEOQD0zWSJ4VpwGDvjqs/zGThqqGbi4jrs8mcGTc=;
  b=UktIVANNdqG+QJhtvcLPrI/QNvSDdIKME/apQfLF4WrpIixab/H/3x9Z
   yRxHNxMIlIQ1q5GXD67xzT+oeSKqGRyYqp2heKnAX8J+gBLW8/TOi28pZ
   b74UeMJJt5LW7zBd1Z1CGqXs+BmMa6Qy59e0ZR0smDO0Gl/qLlF5o0Fao
   4thq/wDtqlKBpdUAsWa0ETwDHZfr3LPmH3OH+zROzaTVI21AHQgLRK5l3
   vRlrnMuoiFRmjaIurixtg0XdypS+FoVoKg2G3KvQO6ZZzJpjmuwBiMmzv
   cIELSAwvvTUXj8dlYEsmxLKJLlzbJVCwI/0FC/RvNc+EDHlT/n0GlwMP2
   A==;
X-CSE-ConnectionGUID: sQS1cgluRCW07VfVrwqzRw==
X-CSE-MsgGUID: hBU9rcwCTGG0ZorlAB8V7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34122896"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34122896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 22:49:19 -0800
X-CSE-ConnectionGUID: o42YBz5hSJOnEcntA6BUBA==
X-CSE-MsgGUID: 66eDwHqRSpyIgpNoBnyosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98237234"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 22:49:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNRON-000Elk-22;
	Tue, 17 Dec 2024 06:49:15 +0000
Date: Tue, 17 Dec 2024 14:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 766/20502] fs/incfs/vfs.c:1523
 dir_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202412171435.q1kPYqlj-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4c2c65ff08ee9a0f8d838770b1e921da2adf3fa2
commit: c6819dd77861f22858a4371f755c7d5422920eeb [766/20502] ANDROID: Initial commit of Incremental FS
:::::: branch date: 10 hours ago
:::::: commit date: 4 years, 10 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171435.q1kPYqlj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412171435.q1kPYqlj-lkp@intel.com/

New smatch warnings:
fs/incfs/vfs.c:1523 dir_lookup() warn: passing zero to 'ERR_PTR'
fs/incfs/vfs.c:2154 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/incfs/vfs.c:1223 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid

vim +/ERR_PTR +1523 fs/incfs/vfs.c

c6819dd77861f22 Eugene Zemtsov 2019-11-18  1420  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1421  static struct dentry *dir_lookup(struct inode *dir_inode, struct dentry *dentry,
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1422  				 unsigned int flags)
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1423  {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1424  	struct mount_info *mi = get_mount_info(dir_inode->i_sb);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1425  	struct dentry *dir_dentry = NULL;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1426  	struct dentry *backing_dentry = NULL;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1427  	struct path dir_backing_path = {};
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1428  	struct inode_info *dir_info = get_incfs_node(dir_inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1429  	struct mem_range name_range =
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1430  			range((u8 *)dentry->d_name.name, dentry->d_name.len);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1431  	int err = 0;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1432  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1433  	if (d_inode(mi->mi_backing_dir_path.dentry) ==
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1434  		dir_info->n_backing_inode) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1435  		/* We do lookup in the FS root. Show pseudo files. */
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1436  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1437  		if (incfs_equal_ranges(pending_reads_file_name_range,
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1438  								name_range)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1439  			struct inode *inode = fetch_pending_reads_inode(
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1440  				dir_inode->i_sb);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1441  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1442  			if (IS_ERR(inode)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1443  				err = PTR_ERR(inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1444  				goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1445  			}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1446  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1447  			d_add(dentry, inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1448  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1449  		}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1450  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1451  		if (incfs_equal_ranges(log_file_name_range, name_range)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1452  			struct inode *inode = fetch_log_inode(
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1453  				dir_inode->i_sb);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1454  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1455  			if (IS_ERR(inode)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1456  				err = PTR_ERR(inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1457  				goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1458  			}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1459  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1460  			d_add(dentry, inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1461  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1462  		}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1463  	}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1464  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1465  	dir_dentry = dget_parent(dentry);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1466  	get_incfs_backing_path(dir_dentry, &dir_backing_path);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1467  	backing_dentry = incfs_lookup_dentry(dir_backing_path.dentry,
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1468  						dentry->d_name.name);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1469  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1470  	if (!backing_dentry || IS_ERR(backing_dentry)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1471  		err = IS_ERR(backing_dentry)
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1472  			? PTR_ERR(backing_dentry)
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1473  			: -EFAULT;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1474  		goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1475  	} else {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1476  		struct inode *inode = NULL;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1477  		struct path backing_path = {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1478  			.mnt = dir_backing_path.mnt,
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1479  			.dentry = backing_dentry
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1480  		};
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1481  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1482  		err = incfs_init_dentry(dentry, &backing_path);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1483  		if (err)
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1484  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1485  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1486  		if (!d_really_is_positive(backing_dentry)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1487  			/*
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1488  			 * No such entry found in the backing dir.
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1489  			 * Create a negative entry.
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1490  			 */
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1491  			d_add(dentry, NULL);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1492  			err = 0;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1493  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1494  		}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1495  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1496  		if (d_inode(backing_dentry)->i_sb !=
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1497  				dir_info->n_backing_inode->i_sb) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1498  			/*
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1499  			 * Somehow after the path lookup we ended up in a
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1500  			 * different fs mount. If we keep going it's going
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1501  			 * to end badly.
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1502  			 */
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1503  			err = -EXDEV;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1504  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1505  		}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1506  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1507  		inode = fetch_regular_inode(dir_inode->i_sb, backing_dentry);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1508  		if (IS_ERR(inode)) {
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1509  			err = PTR_ERR(inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1510  			goto out;
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1511  		}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1512  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1513  		d_add(dentry, inode);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1514  	}
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1515  
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1516  out:
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1517  	dput(dir_dentry);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1518  	dput(backing_dentry);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1519  	path_put(&dir_backing_path);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1520  	if (err)
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1521  		pr_debug("incfs: %s %s %d\n", __func__,
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1522  			 dentry->d_name.name, err);
c6819dd77861f22 Eugene Zemtsov 2019-11-18 @1523  	return ERR_PTR(err);
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1524  }
c6819dd77861f22 Eugene Zemtsov 2019-11-18  1525  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
