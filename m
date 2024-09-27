Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED61B6534
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477395; cv=none; b=B+y8IWdqhpxNrjCjx2A4z1D7h1EFSVH+GqY6pw20hpsgh6b3ysV5zcnjQ4kNdIluSiSe6uHMM5tS9xH4piAdncBI9pbsMvs7sfog/58V78Y/tBUbtARSFnWycz1A2+CC0FAQIccupVzH6uSShbLWQIk4974P2g4WHDw0zkiyywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477395; c=relaxed/simple;
	bh=+bK9teM/k6sbjb/BG/Eentom9k1NnlUPobYl03Xr4EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGLZbIWNusy5u3JZoTZW2X8Pa8VlSclJVAfJmp3koO2cofbnhwLfsH2JYFuvdtz5WeV+VDz4dsQZdwVVWurRf2ZEs4nJhdatT89FXn5tfjpEtfpJ9WiOVTzoh9qcmI5Uo5T2NhzN5BN3jJo/ScvgNq2lBJSrS4zKQ856so+sfbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeOyVjzX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeOyVjzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727477394; x=1759013394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bK9teM/k6sbjb/BG/Eentom9k1NnlUPobYl03Xr4EU=;
  b=WeOyVjzXJw2IX/ax1kNFNLjR5klu3Im7CLFluF5/9HOqvTR8LTkcZ9x0
   3mc4Siu5YWiUNMOpHy9IKpA8mxj/wZxZ5sYO3k/tE2PnEMNH5espZHNh1
   FN9xKrboMomv5jGJyLUNDrKg4x2cI+QNXlIaSZb9BHMs97YR3RnvEmgvk
   DS5hnM0XFXxmzgG1uJkVlq5y462jd7Hc/oK9BgHMpDP7Qx3IzPspdBGo4
   PNWJdWMREXaeG51LM+mjWamKfrKv6V9WcrvwJPgA6gc7pR5N2CYgYWXPG
   JF7WTRAQG5iPnVzIv0HnKBz1JAmSXkLkesm+ijttoEgsf04EgPuA3aTlz
   A==;
X-CSE-ConnectionGUID: VCsZDX/yTBCfD1STQpev+Q==
X-CSE-MsgGUID: eRFkTdJ7Q+uUl80IbhTJZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="29516936"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="29516936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 15:49:52 -0700
X-CSE-ConnectionGUID: QSbAg95iTfS1VrAb6Kyajg==
X-CSE-MsgGUID: hsJx/4gfRnC4ZhPGt5H2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77454148"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2024 15:49:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suJmW-000Mhj-0E;
	Fri, 27 Sep 2024 22:49:48 +0000
Date: Sat, 28 Sep 2024 06:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 766/5421] fs/incfs/vfs.c:1523
 dir_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202409280641.vY9ZvVGu-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   da0c10aefaf6089b483a9c679b7151dc316a36c7
commit: c6819dd77861f22858a4371f755c7d5422920eeb [766/5421] ANDROID: Initial commit of Incremental FS
:::::: branch date: 20 hours ago
:::::: commit date: 4 years, 8 months ago
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280641.vY9ZvVGu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409280641.vY9ZvVGu-lkp@intel.com/

New smatch warnings:
fs/incfs/vfs.c:1523 dir_lookup() warn: passing zero to 'ERR_PTR'
fs/incfs/vfs.c:2154 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/incfs/data_mgmt.h:263 get_incfs_node() warn: always true condition '(inode->i_sb->s_magic != (357661101641)) => (0-u32max != 357661101641)'
fs/incfs/vfs.c:1223 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid

vim +/ERR_PTR +1523 fs/incfs/vfs.c

c6819dd77861f2 Eugene Zemtsov 2019-11-18  1420  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1421  static struct dentry *dir_lookup(struct inode *dir_inode, struct dentry *dentry,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1422  				 unsigned int flags)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1423  {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1424  	struct mount_info *mi = get_mount_info(dir_inode->i_sb);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1425  	struct dentry *dir_dentry = NULL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1426  	struct dentry *backing_dentry = NULL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1427  	struct path dir_backing_path = {};
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1428  	struct inode_info *dir_info = get_incfs_node(dir_inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1429  	struct mem_range name_range =
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1430  			range((u8 *)dentry->d_name.name, dentry->d_name.len);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1431  	int err = 0;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1432  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1433  	if (d_inode(mi->mi_backing_dir_path.dentry) ==
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1434  		dir_info->n_backing_inode) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1435  		/* We do lookup in the FS root. Show pseudo files. */
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1436  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1437  		if (incfs_equal_ranges(pending_reads_file_name_range,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1438  								name_range)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1439  			struct inode *inode = fetch_pending_reads_inode(
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1440  				dir_inode->i_sb);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1441  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1442  			if (IS_ERR(inode)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1443  				err = PTR_ERR(inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1444  				goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1445  			}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1446  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1447  			d_add(dentry, inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1448  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1449  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1450  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1451  		if (incfs_equal_ranges(log_file_name_range, name_range)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1452  			struct inode *inode = fetch_log_inode(
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1453  				dir_inode->i_sb);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1454  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1455  			if (IS_ERR(inode)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1456  				err = PTR_ERR(inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1457  				goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1458  			}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1459  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1460  			d_add(dentry, inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1461  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1462  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1463  	}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1464  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1465  	dir_dentry = dget_parent(dentry);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1466  	get_incfs_backing_path(dir_dentry, &dir_backing_path);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1467  	backing_dentry = incfs_lookup_dentry(dir_backing_path.dentry,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1468  						dentry->d_name.name);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1469  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1470  	if (!backing_dentry || IS_ERR(backing_dentry)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1471  		err = IS_ERR(backing_dentry)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1472  			? PTR_ERR(backing_dentry)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1473  			: -EFAULT;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1474  		goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1475  	} else {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1476  		struct inode *inode = NULL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1477  		struct path backing_path = {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1478  			.mnt = dir_backing_path.mnt,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1479  			.dentry = backing_dentry
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1480  		};
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1481  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1482  		err = incfs_init_dentry(dentry, &backing_path);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1483  		if (err)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1484  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1485  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1486  		if (!d_really_is_positive(backing_dentry)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1487  			/*
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1488  			 * No such entry found in the backing dir.
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1489  			 * Create a negative entry.
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1490  			 */
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1491  			d_add(dentry, NULL);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1492  			err = 0;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1493  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1494  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1495  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1496  		if (d_inode(backing_dentry)->i_sb !=
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1497  				dir_info->n_backing_inode->i_sb) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1498  			/*
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1499  			 * Somehow after the path lookup we ended up in a
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1500  			 * different fs mount. If we keep going it's going
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1501  			 * to end badly.
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1502  			 */
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1503  			err = -EXDEV;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1504  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1505  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1506  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1507  		inode = fetch_regular_inode(dir_inode->i_sb, backing_dentry);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1508  		if (IS_ERR(inode)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1509  			err = PTR_ERR(inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1510  			goto out;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1511  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1512  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1513  		d_add(dentry, inode);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1514  	}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1515  
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1516  out:
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1517  	dput(dir_dentry);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1518  	dput(backing_dentry);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1519  	path_put(&dir_backing_path);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1520  	if (err)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1521  		pr_debug("incfs: %s %s %d\n", __func__,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1522  			 dentry->d_name.name, err);
c6819dd77861f2 Eugene Zemtsov 2019-11-18 @1523  	return ERR_PTR(err);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1524  }
c6819dd77861f2 Eugene Zemtsov 2019-11-18  1525  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
