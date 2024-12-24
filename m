Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEEF14A099
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735075698; cv=none; b=FCDX9T33YSDoMPXqJIDOE7VCOeqqk7kW8Nm3E646H9Zc2w9qPNJ+v8um1TkeU/Ce7wNleisv7QBnFsH+4Qp31P38l1Wl8iZKteg6Ts6vNoajjTbKCroOO0acWabOYuryzobizXG1W+bDgoAB8xVIOaQnvaN6/R9suWN98RpZbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735075698; c=relaxed/simple;
	bh=5zR8UE8soujBME9jPJXgpW9/hjUKooL49FIDWQ0JukA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHoZtTU4yTVrI0mytD2RKGOcZrPr21OnYXytulhKFXY2+mnZvtNIqTizI51FOpwPbudE493+X822mCIA0VsJsF3naM0ru68Sg7OfFiu0n3aF/O9bfDRNmSx5mdWQZiF4TaJBOCTFMDytfpC3yiKJDj2ZF+bTdDonV6lwiTkKVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBR+Xk9L; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBR+Xk9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735075696; x=1766611696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zR8UE8soujBME9jPJXgpW9/hjUKooL49FIDWQ0JukA=;
  b=oBR+Xk9L2jahQzvLhpV0GaEvHhOUAAJNfgz2tftGEem+5kRWX5Yc83wa
   E26CyXV8Rc1KZb6o2dabj7NQ6Buvoowbb0uF/cWqNYY/hjR1V0qjnijpZ
   nUGo+TvmFzTftgbll//NC0PrY8I/4y20O0PM69+XOgNOxUqHghrQERIjG
   cP4I1t4RI79KMdl+FDZoHjvsQMvn0NHPAuNneIXOJB4G/1CSKEQekbEnH
   7kmByq4uRnV+wuIWKMezzaaUFKZbt7Xbz1Bh6/l11lPMSmG6McTFBgKa8
   nZmsPO+A2L67YyoOqVeW/h8fhtWNXZhhdtQtv3eJniHUlUf0MF5lH2V7F
   w==;
X-CSE-ConnectionGUID: KwqnzfaHQ/Gpb3q6aGttEw==
X-CSE-MsgGUID: 3mHDZYOvSnutYRUoDmpUig==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35705521"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="35705521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 13:28:15 -0800
X-CSE-ConnectionGUID: h7dzaNNKQ9OzkndUzsPrLg==
X-CSE-MsgGUID: yOwZOEcsRDK3Y6PtNEYxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100396180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2024 13:28:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQCRn-0001TX-2m;
	Tue, 24 Dec 2024 21:28:11 +0000
Date: Wed, 25 Dec 2024 05:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2/2] fs/incfs/vfs.c:1523 dir_lookup()
 warn: passing zero to 'ERR_PTR'
Message-ID: <202412250520.8iJo1Iey-lkp@intel.com>
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
head:   cc2a6cb2e3103c2718274f27b95bf61fb8225ab6
commit: c6819dd77861f22858a4371f755c7d5422920eeb [2/2] ANDROID: Initial commit of Incremental FS
:::::: branch date: 3 hours ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241225/202412250520.8iJo1Iey-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412250520.8iJo1Iey-lkp@intel.com/

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
