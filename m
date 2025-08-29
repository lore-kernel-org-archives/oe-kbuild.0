Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5779CD
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756485937; cv=none; b=AZN+Lvj4Hufc1GgpFqpXQY3YCU37otDkbumxD6OtkhoEZ6SFwCxCooSPDmjhiNn9Nbp9bdHI3ICtS1Pc023vEaBKqOj2TLLE2sGfUafMt1iRl4OTGkHovPQLFZMuodYo0vEKKevD4VX6kXvJPdDmBEx6afBAgU3mQ/q+Rhetmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756485937; c=relaxed/simple;
	bh=J7Zwy3qSGBgZ9o2EexLf4TEF3cAxf+Y/8WR6HuBbcmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCagrPq4sNAex8kkiHiKxDSYW6LUoEKifRTx0iEBiKmUbaOkZTJR1yjQVHfsnEDzQ143TZHr0sl31f1CSQWFgqQmvXtF7tAj0VrvpK3M+xckBQgp/yJ1iA0OJ2xGnJ7N8v8MHkSAHOLXGTOWhbVbuYmNf/M+KZT6jVhTq9Kr3Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzMEySBy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzMEySBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756485935; x=1788021935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7Zwy3qSGBgZ9o2EexLf4TEF3cAxf+Y/8WR6HuBbcmg=;
  b=CzMEySByKokGOoHQxqO+Lk0VYPhyGLsGl7ylZ2knY381w8L4PMQ4wEsH
   UggENyhyRqqRp2pn5Vz6r4EEOc4gqjEH18G8D0/OvEDj7vAkbWZszU6r1
   bJ975vcUygodzSsx2msGid3iACR3esX4X3qXDOZriIjjG2QCkUnavjOxT
   yHzx6Czvz8HCN087HwKq+awAwpbuzLiNFf/oOrtb9plYaoTegiYCHZ6XT
   7WknvAqNspf4FTbe1I2UsoF8Z5RwJYTU6mLi45Ag/HwXlcZwTjBhfJYye
   NqdAQoiYhQ8q1UK6o4f+jh5N3BPARgAv8lrx207GxG5C1DLIwREFSTx6L
   Q==;
X-CSE-ConnectionGUID: wbvjlDwGSACL4TLPj4Kpdw==
X-CSE-MsgGUID: aS3ALiNPRXiW8voBaBGtWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="61411068"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61411068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 09:45:34 -0700
X-CSE-ConnectionGUID: C6pwu9MMTDiurZPv36WI0w==
X-CSE-MsgGUID: aItZcq/2T1OK0sCSQW4tfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170324737"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Aug 2025 09:45:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us2EF-000Ulz-17;
	Fri, 29 Aug 2025 16:45:31 +0000
Date: Sat, 30 Aug 2025 00:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:fuse-service-container 60/74] fs/fuse/dir.c:1468
 fuse_update_get_attr() error: uninitialized symbol 'sync'.
Message-ID: <202508300059.so2lq8UG-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   f970c3e66ed46fbdf680a7998079bb922f76a2c2
commit: f7414ea43dc53887a8fe4beabf61a74be5c35c75 [60/74] fuse: allow more statx fields
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300059.so2lq8UG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508300059.so2lq8UG-lkp@intel.com/

smatch warnings:
fs/fuse/dir.c:1468 fuse_update_get_attr() error: uninitialized symbol 'sync'.

vim +/sync +1468 fs/fuse/dir.c

e5e5558e923f35 Miklos Szeredi        2005-09-09  1425  
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1426  static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1427  				struct file *file, struct kstat *stat,
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1428  				u32 request_mask, unsigned int flags)
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1429  {
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1430  	struct fuse_inode *fi = get_fuse_inode(inode);
d3045530bdd29d Miklos Szeredi        2023-08-10  1431  	struct fuse_conn *fc = get_fuse_conn(inode);
5b97eeacbd80a7 Miklos Szeredi        2017-09-12  1432  	int err = 0;
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1433  	bool sync;
ec85537519b330 Miklos Szeredi        2021-10-22  1434  	u32 inval_mask = READ_ONCE(fi->inval_mask);
ec85537519b330 Miklos Szeredi        2021-10-22  1435  	u32 cache_mask = fuse_get_cache_mask(inode);
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1436  
f7414ea43dc538 Darrick J. Wong       2025-07-18  1437  	/* Only ask for supported stats */
f7414ea43dc538 Darrick J. Wong       2025-07-18  1438  	request_mask &= FUSE_SUPPORTED_STATX_MASK;
d3045530bdd29d Miklos Szeredi        2023-08-10  1439  retry:
d3045530bdd29d Miklos Szeredi        2023-08-10  1440  	if (fc->no_statx)
8d8f9c4b8df6bc Miklos Szeredi        2023-08-10  1441  		request_mask &= STATX_BASIC_STATS;
8d8f9c4b8df6bc Miklos Szeredi        2023-08-10  1442  
8d8f9c4b8df6bc Miklos Szeredi        2023-08-10  1443  	if (!request_mask)
8d8f9c4b8df6bc Miklos Szeredi        2023-08-10  1444  		sync = false;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1445  	else if (request_mask & FUSE_UNCACHED_STATX_MASK) {
f7414ea43dc538 Darrick J. Wong       2025-07-18  1446  		switch (flags & AT_STATX_SYNC_TYPE) {
f7414ea43dc538 Darrick J. Wong       2025-07-18  1447  		case AT_STATX_DONT_SYNC:
f7414ea43dc538 Darrick J. Wong       2025-07-18  1448  			request_mask &= ~FUSE_UNCACHED_STATX_MASK;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1449  			sync = false;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1450  			break;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1451  		case AT_STATX_FORCE_SYNC:
f7414ea43dc538 Darrick J. Wong       2025-07-18  1452  		case AT_STATX_SYNC_AS_STAT:
f7414ea43dc538 Darrick J. Wong       2025-07-18  1453  			sync = true;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1454  			break;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1455  		default:
f7414ea43dc538 Darrick J. Wong       2025-07-18  1456  			WARN_ON(1);
f7414ea43dc538 Darrick J. Wong       2025-07-18  1457  			break;
f7414ea43dc538 Darrick J. Wong       2025-07-18  1458  		}
f7414ea43dc538 Darrick J. Wong       2025-07-18  1459  	} else if (flags & AT_STATX_FORCE_SYNC)
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1460  		sync = true;
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1461  	else if (flags & AT_STATX_DONT_SYNC)
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1462  		sync = false;
ec85537519b330 Miklos Szeredi        2021-10-22  1463  	else if (request_mask & inval_mask & ~cache_mask)
2f1e81965fd0f6 Miklos Szeredi        2018-10-15  1464  		sync = true;
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1465  	else
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1466  		sync = time_before64(fi->i_time, get_jiffies_64());
bf5c1898bf9e6d Miklos Szeredi        2018-03-20  1467  
bf5c1898bf9e6d Miklos Szeredi        2018-03-20 @1468  	if (sync) {
60bcc88ad185d5 Seth Forshee          2016-08-29  1469  		forget_all_cached_acls(inode);
f7414ea43dc538 Darrick J. Wong       2025-07-18  1470  		/* Try statx if a field not covered by regular stat is wanted */
d3045530bdd29d Miklos Szeredi        2023-08-10  1471  		if (!fc->no_statx && (request_mask & ~STATX_BASIC_STATS)) {
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1472  			err = fuse_do_statx(idmap, inode, file, stat);
d3045530bdd29d Miklos Szeredi        2023-08-10  1473  			if (err == -ENOSYS) {
d3045530bdd29d Miklos Szeredi        2023-08-10  1474  				fc->no_statx = 1;
eb4b691b9115fa Danny Lin             2024-04-13  1475  				err = 0;
d3045530bdd29d Miklos Szeredi        2023-08-10  1476  				goto retry;
d3045530bdd29d Miklos Szeredi        2023-08-10  1477  			}
d3045530bdd29d Miklos Szeredi        2023-08-10  1478  		} else {
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1479  			err = fuse_do_getattr(idmap, inode, stat, file);
d3045530bdd29d Miklos Szeredi        2023-08-10  1480  		}
5b97eeacbd80a7 Miklos Szeredi        2017-09-12  1481  	} else if (stat) {
2a8c810d5e4929 Alexander Mikhalitsyn 2024-09-03  1482  		generic_fillattr(idmap, request_mask, inode, stat);
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1483  		stat->mode = fi->orig_i_mode;
45c72cd73c788d Pavel Shilovsky       2012-05-10  1484  		stat->ino = fi->orig_ino;
972f4c46d0a1bb Miklos Szeredi        2023-08-10  1485  		if (test_bit(FUSE_I_BTIME, &fi->state)) {
972f4c46d0a1bb Miklos Szeredi        2023-08-10  1486  			stat->btime = fi->i_btime;
972f4c46d0a1bb Miklos Szeredi        2023-08-10  1487  			stat->result_mask |= STATX_BTIME;
972f4c46d0a1bb Miklos Szeredi        2023-08-10  1488  		}
38f21da95222cf Darrick J. Wong       2025-06-30  1489  		stat->attributes = fi->statx_attributes;
38f21da95222cf Darrick J. Wong       2025-06-30  1490  		stat->attributes_mask = fi->statx_attributes_mask;
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1491  	}
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1492  
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1493  	return err;
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1494  }
bcb4be809d2a80 Miklos Szeredi        2007-11-28  1495  

:::::: The code at line 1468 was first introduced by commit
:::::: bf5c1898bf9e6d5ce9840743e8eccc74c14d16a4 fuse: honor AT_STATX_FORCE_SYNC

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
