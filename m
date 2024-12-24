Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8514D433
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735059752; cv=none; b=fjFeoOBPgfFhrytaStUrPXX6AXhtyWqaAzhXWN+ilhQVlynal0cXLkMJn9yYMFqfxE650a6RZRobjZkB8e+l3iSzsQX2AKa7zGIQk2zV7XcdZFjBJdnTCClnyyQEUUDUypUZsrrjRZ4SIQ0S4ef+CiAbL0jL4Mrckty7HjdufQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735059752; c=relaxed/simple;
	bh=4+BoewIuqXStu3lKP9cIbTPyQMkPl9kSQGqqRSS77jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOqSbQNaDf75Zx9BXLzMPE6z7EwA4njSLNOG29kHCbIuARIxsWEN8vqAcM2GIqkiwNy8AQEF6tExRORCLMaA3F5CBHOURzgjqsIRteBnco483OBv4pjVfwAe94vfj+OohsbPh63gaM+TKHPyMRODbS4ilNfjP5WW0VrqEavi0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/Q036y1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/Q036y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735059750; x=1766595750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+BoewIuqXStu3lKP9cIbTPyQMkPl9kSQGqqRSS77jA=;
  b=D/Q036y16tzHt3TSOV5a0QX2RuIsccNvWeCQWsHCOAZ5v/VwHP6tzYin
   c6BcbCpSwonjfONumYZT+VthfG7sSLR1gmCcNM9GwvqfYapK0MXj+YJTb
   HbqnyLblO7SNI2m/2N7jjEbjCwn+x6oapNBkZM8SH/2Dsoec2FJtJJ/UP
   gRR+mGEgOlv9NwD1bHH6euEqgkgos9F96QCNvaBdkT68QwmyMuBzPJYx2
   dPWU29A/tIaAyyeswO/Y+h6Q2ATAxLl5QJWA5Z+4sozduzfjUwEwlrlQC
   l+gpKr/XZaqwmqu9H5WxQL+qq/csGNttuczFLG8uAqHdgX3hVc/wBcJio
   Q==;
X-CSE-ConnectionGUID: hEdSi7g7RgGXxXHujr7eOA==
X-CSE-MsgGUID: rz/nqztiQvuB0QsGLhNWzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46536261"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="46536261"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 09:02:19 -0800
X-CSE-ConnectionGUID: MMeQuwApQZCUizTrG7WJLw==
X-CSE-MsgGUID: dDGNsQ4YTXGddyr0hqTQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104379631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 09:02:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ8IS-0001JC-0G;
	Tue, 24 Dec 2024 17:02:16 +0000
Date: Wed, 25 Dec 2024 01:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2/2] fs/nilfs2/super.c:1366
 nilfs_mount() warn: inconsistent returns '&s->s_umount'.
Message-ID: <202412250042.tVVXnoPE-lkp@intel.com>
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
head:   31219eb89ffa5fc9ea8af23ef3117be82bf7513e
commit: c1e012ea9e835f81ac6062e8aa9e72940a671b95 [2/2] nilfs2: use setup_bdev_super to de-duplicate the mount code
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241225/202412250042.tVVXnoPE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412250042.tVVXnoPE-lkp@intel.com/

smatch warnings:
fs/nilfs2/super.c:1366 nilfs_mount() warn: inconsistent returns '&s->s_umount'.

vim +1366 fs/nilfs2/super.c

783f61843e9d147 Ryusuke Konishi   2009-04-06  1294  
e4c59d61e80529a Al Viro           2010-07-26  1295  static struct dentry *
e4c59d61e80529a Al Viro           2010-07-26  1296  nilfs_mount(struct file_system_type *fs_type, int flags,
e4c59d61e80529a Al Viro           2010-07-26  1297  	     const char *dev_name, void *data)
783f61843e9d147 Ryusuke Konishi   2009-04-06  1298  {
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1299  	struct nilfs_super_data sd = { .flags = flags };
33c8e57c86d1bd1 Ryusuke Konishi   2009-06-08  1300  	struct super_block *s;
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1301  	dev_t dev;
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1302  	int err;
783f61843e9d147 Ryusuke Konishi   2009-04-06  1303  
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1304  	if (nilfs_identify(data, &sd))
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1305  		return ERR_PTR(-EINVAL);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1306  
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1307  	err = lookup_bdev(dev_name, &dev);
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1308  	if (err)
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1309  		return ERR_PTR(err);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1310  
9249e17fe094d85 David Howells     2012-06-25  1311  	s = sget(fs_type, nilfs_test_bdev_super, nilfs_set_bdev_super, flags,
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1312  		 &dev);
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1313  	if (IS_ERR(s))
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1314  		return ERR_CAST(s);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1315  
783f61843e9d147 Ryusuke Konishi   2009-04-06  1316  	if (!s->s_root) {
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1317  		/*
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1318  		 * We drop s_umount here because we need to open the bdev and
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1319  		 * bdev->open_mutex ranks above s_umount (blkdev_put() ->
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1320  		 * __invalidate_device()). It is safe because we have active sb
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1321  		 * reference and SB_BORN is not set yet.
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1322  		 */
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1323  		up_write(&s->s_umount);
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1324  		err = setup_bdev_super(s, flags, NULL);
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1325  		down_write(&s->s_umount);
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1326  		if (!err)
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1327  			err = nilfs_fill_super(s, data,
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1328  					       flags & SB_SILENT ? 1 : 0);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1329  		if (err)
348fe8da13621b3 Ryusuke Konishi   2010-09-09  1330  			goto failed_super;
783f61843e9d147 Ryusuke Konishi   2009-04-06  1331  
1751e8a6cb935e5 Linus Torvalds    2017-11-27  1332  		s->s_flags |= SB_ACTIVE;
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1333  	} else if (!sd.cno) {
e95c311e170afc9 Al Viro           2013-08-24  1334  		if (nilfs_tree_is_busy(s->s_root)) {
1751e8a6cb935e5 Linus Torvalds    2017-11-27  1335  			if ((flags ^ s->s_flags) & SB_RDONLY) {
a1d0747a393a079 Joe Perches       2020-08-11  1336  				nilfs_err(s,
feee880fa58254f Ryusuke Konishi   2016-08-02  1337  					  "the device already has a %s mount.",
bc98a42c1f7d0f8 David Howells     2017-07-17  1338  					  sb_rdonly(s) ? "read-only" : "read/write");
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1339  				err = -EBUSY;
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1340  				goto failed_super;
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1341  			}
e95c311e170afc9 Al Viro           2013-08-24  1342  		} else {
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1343  			/*
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1344  			 * Try remount to setup mount states if the current
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1345  			 * tree is not mounted and only snapshots use this sb.
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1346  			 */
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1347  			err = nilfs_remount(s, &flags, data);
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1348  			if (err)
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1349  				goto failed_super;
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1350  		}
783f61843e9d147 Ryusuke Konishi   2009-04-06  1351  	}
783f61843e9d147 Ryusuke Konishi   2009-04-06  1352  
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1353  	if (sd.cno) {
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1354  		struct dentry *root_dentry;
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1355  
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1356  		err = nilfs_attach_snapshot(s, sd.cno, &root_dentry);
348fe8da13621b3 Ryusuke Konishi   2010-09-09  1357  		if (err)
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1358  			goto failed_super;
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1359  		return root_dentry;
783f61843e9d147 Ryusuke Konishi   2009-04-06  1360  	}
783f61843e9d147 Ryusuke Konishi   2009-04-06  1361  
c1e012ea9e835f8 Christoph Hellwig 2023-08-02  1362  	return dget(s->s_root);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1363  
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1364   failed_super:
f11459ad7dab9e9 Ryusuke Konishi   2010-08-16  1365  	deactivate_locked_super(s);
e4c59d61e80529a Al Viro           2010-07-26 @1366  	return ERR_PTR(err);
783f61843e9d147 Ryusuke Konishi   2009-04-06  1367  }
783f61843e9d147 Ryusuke Konishi   2009-04-06  1368  

:::::: The code at line 1366 was first introduced by commit
:::::: e4c59d61e80529aebca4a3690b4378f2c6fc4e82 convert nilfs

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
