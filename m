Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABBD33D6D7
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965514; cv=none; b=K2nSR1vuZoi/rh7xxasd72nNQAWARZfgxhvenSw8SVHaEevA8GAmFyDKuLGbu8n2L4dUreM9APhwjE6NT8vDSk7gydvTFHPiX4f++3e3PGj5zYNW7d95Zxzrnx5bzoTqWWxGx/QVdzMmHnF6tFXjYiRVJs27c0AXBsGpsEUamOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965514; c=relaxed/simple;
	bh=xphcP/URlo/OYLfpmk/sUaVwdl83YdQRAfR/B/tLsqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTRryLFvQIO9Ocf6XKdPO0Y9ABsTP/WwGvoLoSA/4cfePm12QjX04dCqwpoF57jSXG0dkoT+opu6XYd7zg72KauB+1hO/03mCTMSxURICyz32CyWFrwHh6hIE87nHgeSziDifEHLKWHNEdgwk4j1LLMH5gULgeF6vS+Ned1+9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGENszjY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGENszjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765965512; x=1797501512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xphcP/URlo/OYLfpmk/sUaVwdl83YdQRAfR/B/tLsqU=;
  b=mGENszjY1mkOqWg+IL0+4BmuXqedSbv3QOfwiLI9tK+BJO6Tap68Z1R4
   +Ou0d9HKGlTQb2z6ZXHTy0afxSBmXeX7HAsnaPJe7XuUclbhXU+5vGhF8
   Cbck8UcUuXrVdzkDsGc45gipPxTqrh+/TiNPX2JM1TGff7CbgcYQwb05/
   TeDNR6eF42UZluoWZy3XPnSL0jox/iJW5JuyzgjiKQd0zSTspqFm36eCc
   WLgHoALMxjPvDKIZWyygyyPGEFrx01HOvkytfLJ4IIOI53T1cvaC+pB6H
   v3sqk7+KsEsaQwQlHNRd6HpVk3LvBUy6CJbcWPKxU1CfMs/3OzKcT3BpE
   A==;
X-CSE-ConnectionGUID: /l1UHFJzQjyYy2O9j7pZTg==
X-CSE-MsgGUID: 7hsYNNfUQfShgooVti4TgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67839165"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67839165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:58:29 -0800
X-CSE-ConnectionGUID: kNCNceIpTUerCPgTMO04qA==
X-CSE-MsgGUID: v6MkO0r0SqiI/8oYiR2pxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198757304"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 01:58:27 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVoIb-000000000Mt-1gD4;
	Wed, 17 Dec 2025 09:58:25 +0000
Date: Wed, 17 Dec 2025 17:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:fuse-service-container 58/87] fs/fuse/dir.c:1655
 fuse_update_get_attr() error: uninitialized symbol 'sync'.
Message-ID: <202512171706.7enL72yt-lkp@intel.com>
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
head:   2e08cf085a3a45dfa83afdef3bfcc69b7e4a6684
commit: 4eee3bdd21af4141d3093a0a95df647f32407940 [58/87] fuse: allow more statx fields
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171706.7enL72yt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171706.7enL72yt-lkp@intel.com/

smatch warnings:
fs/fuse/dir.c:1655 fuse_update_get_attr() error: uninitialized symbol 'sync'.

vim +/sync +1655 fs/fuse/dir.c

e5e5558e923f358 Miklos Szeredi        2005-09-09  1612  
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1613  static int fuse_update_get_attr(struct mnt_idmap *idmap, struct inode *inode,
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1614  				struct file *file, struct kstat *stat,
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1615  				u32 request_mask, unsigned int flags)
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1616  {
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1617  	struct fuse_inode *fi = get_fuse_inode(inode);
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1618  	struct fuse_conn *fc = get_fuse_conn(inode);
5b97eeacbd80a7b Miklos Szeredi        2017-09-12  1619  	int err = 0;
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1620  	bool sync;
ec85537519b330a Miklos Szeredi        2021-10-22  1621  	u32 inval_mask = READ_ONCE(fi->inval_mask);
ec85537519b330a Miklos Szeredi        2021-10-22  1622  	u32 cache_mask = fuse_get_cache_mask(inode);
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1623  
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1624  	/* Only ask for supported stats */
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1625  	request_mask &= FUSE_SUPPORTED_STATX_MASK;
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1626  retry:
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1627  	if (fc->no_statx)
8d8f9c4b8df6bc2 Miklos Szeredi        2023-08-10  1628  		request_mask &= STATX_BASIC_STATS;
8d8f9c4b8df6bc2 Miklos Szeredi        2023-08-10  1629  
8d8f9c4b8df6bc2 Miklos Szeredi        2023-08-10  1630  	if (!request_mask)
8d8f9c4b8df6bc2 Miklos Szeredi        2023-08-10  1631  		sync = false;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1632  	else if (request_mask & FUSE_UNCACHED_STATX_MASK) {
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1633  		switch (flags & AT_STATX_SYNC_TYPE) {
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1634  		case AT_STATX_DONT_SYNC:
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1635  			request_mask &= ~FUSE_UNCACHED_STATX_MASK;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1636  			sync = false;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1637  			break;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1638  		case AT_STATX_FORCE_SYNC:
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1639  		case AT_STATX_SYNC_AS_STAT:
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1640  			sync = true;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1641  			break;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1642  		default:
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1643  			WARN_ON(1);
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1644  			break;
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1645  		}
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1646  	} else if (flags & AT_STATX_FORCE_SYNC)
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1647  		sync = true;
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1648  	else if (flags & AT_STATX_DONT_SYNC)
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1649  		sync = false;
ec85537519b330a Miklos Szeredi        2021-10-22  1650  	else if (request_mask & inval_mask & ~cache_mask)
2f1e81965fd0f67 Miklos Szeredi        2018-10-15  1651  		sync = true;
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1652  	else
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1653  		sync = time_before64(fi->i_time, get_jiffies_64());
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20  1654  
bf5c1898bf9e6d5 Miklos Szeredi        2018-03-20 @1655  	if (sync) {
60bcc88ad185d51 Seth Forshee          2016-08-29  1656  		forget_all_cached_acls(inode);
4eee3bdd21af414 Darrick J. Wong       2025-07-18  1657  		/* Try statx if a field not covered by regular stat is wanted */
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1658  		if (!fc->no_statx && (request_mask & ~STATX_BASIC_STATS)) {
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1659  			err = fuse_do_statx(idmap, inode, file, stat);
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1660  			if (err == -ENOSYS) {
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1661  				fc->no_statx = 1;
eb4b691b9115fae Danny Lin             2024-04-13  1662  				err = 0;
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1663  				goto retry;
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1664  			}
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1665  		} else {
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1666  			err = fuse_do_getattr(idmap, inode, stat, file);
d3045530bdd29d9 Miklos Szeredi        2023-08-10  1667  		}
5b97eeacbd80a7b Miklos Szeredi        2017-09-12  1668  	} else if (stat) {
2a8c810d5e49290 Alexander Mikhalitsyn 2024-09-03  1669  		generic_fillattr(idmap, request_mask, inode, stat);
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1670  		stat->mode = fi->orig_i_mode;
45c72cd73c788dd Pavel Shilovsky       2012-05-10  1671  		stat->ino = fi->orig_ino;
79569946502258e Joanne Koong          2025-08-15  1672  		stat->blksize = 1 << fi->cached_i_blkbits;
972f4c46d0a1bb7 Miklos Szeredi        2023-08-10  1673  		if (test_bit(FUSE_I_BTIME, &fi->state)) {
972f4c46d0a1bb7 Miklos Szeredi        2023-08-10  1674  			stat->btime = fi->i_btime;
972f4c46d0a1bb7 Miklos Szeredi        2023-08-10  1675  			stat->result_mask |= STATX_BTIME;
972f4c46d0a1bb7 Miklos Szeredi        2023-08-10  1676  		}
593e4bf43877233 Darrick J. Wong       2025-06-30  1677  		stat->attributes = fi->statx_attributes;
593e4bf43877233 Darrick J. Wong       2025-06-30  1678  		stat->attributes_mask = fi->statx_attributes_mask;
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1679  	}
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1680  
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1681  	return err;
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1682  }
bcb4be809d2a804 Miklos Szeredi        2007-11-28  1683  

:::::: The code at line 1655 was first introduced by commit
:::::: bf5c1898bf9e6d5ce9840743e8eccc74c14d16a4 fuse: honor AT_STATX_FORCE_SYNC

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
