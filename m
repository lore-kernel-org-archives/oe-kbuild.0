Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894D277030
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Feb 2025 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740770229; cv=none; b=rcrXCyxKBOB/dPlPsWyb1mDPKY0b3obPT5HW2l2bCBnRkDkiAqbGANqLsM0zULLHnWJZSoRWcwrnVyzi8cWR+M2O+yPN746h4XcIcLQyiwbY57POLdF9APW0eOghH047BLLWfzC1U1sf8eYi5athSs9eWmSGNqw0Sb9hb/qU7Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740770229; c=relaxed/simple;
	bh=hPnPabMPYNN+vXQVHWMR7n490GbYrLwRCf05OxsrRqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tc3pJ770lSjdR5qElNclDuUx2IKdfYouq0I+DGxgDgv8oxtuxWjQq0m12O+lryFl4iXAnJq8rEK2UNnQT7Dpx/0qNHzmem4TXPHu/16+t4lF3feJQNi5OBI+cNMUbWV7l0LhQ7/iv5bZNsN3MB+9kDsyGZNnvOqMzngbMHiwHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYSbZD4I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYSbZD4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740770227; x=1772306227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPnPabMPYNN+vXQVHWMR7n490GbYrLwRCf05OxsrRqM=;
  b=SYSbZD4IEGBVvl9u67nS+KU0iJSj4lgMUcJ3VFeDWyYeFpyz1bltyYWD
   oPopEjo1KyDGXm88ekbndHQwOcuac19Wd8YqxuruXAtDu6JuhxumHyj6S
   1WBhoFA4dv4KJI1Hepov6nD90f1EDYUfis1prgcpflvpFXWK5cWsccdPc
   HWvPAnJTZBLr0pj5WsqtyWjSRXJLN+f8Lc4tHeXdm6I+Lv3VY8ICyIer2
   rH9zn3EpRGelQNYTfHD28HgBUt7mMWUa6DCPTxtV46uxxs5DiEEfbAoZD
   prSwE6wv8VWoUB5ai9bfqeICvIJgu9+8XMELLeFhDhaF6MRvtfFW3xE7n
   g==;
X-CSE-ConnectionGUID: QBJo7eEtTwKlMpDRWqxtvg==
X-CSE-MsgGUID: pjjanDUkRHmO9It7E6Q40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41734878"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="41734878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 11:17:06 -0800
X-CSE-ConnectionGUID: bRSv6L5FT4KuRygwpAQLrA==
X-CSE-MsgGUID: 3ZcnOdBPTn+fda7ZHHVIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117209733"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 11:17:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to5r5-000FOV-1e;
	Fri, 28 Feb 2025 19:17:03 +0000
Date: Sat, 1 Mar 2025 03:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs-6.15.async.dir 4/11] fs/ramfs/inode.c:128
 ramfs_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202503010357.WCxw3oXN-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.async.dir
head:   ddf2b1bdf725c7b06d42133519c360e3afc2f3d4
commit: 88d5baf69082e5b410296435008329676b687549 [4/11] Change inode_operations.mkdir to return struct dentry *
:::::: branch date: 9 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010357.WCxw3oXN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503010357.WCxw3oXN-lkp@intel.com/

New smatch warnings:
fs/ramfs/inode.c:128 ramfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/9p/vfs_inode_dotl.c:420 v9fs_vfs_mkdir_dotl() warn: passing zero to 'ERR_PTR'
fs/9p/vfs_inode.c:695 v9fs_vfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/configfs/dir.c:1464 configfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/orangefs/namei.c:369 orangefs_mkdir() warn: passing zero to 'ERR_PTR'
fs/smb/client/inode.c:2286 cifs_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/smb/client/inode.c:1694 cifs_root_iget() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +128 fs/ramfs/inode.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  121  
88d5baf69082e5b NeilBrown         2025-02-27  122  static struct dentry *ramfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32e Christian Brauner 2021-01-21  123  				 struct dentry *dentry, umode_t mode)
^1da177e4c3f415 Linus Torvalds    2005-04-16  124  {
5ebb29bee8d5fc1 Christian Brauner 2023-01-13  125  	int retval = ramfs_mknod(&nop_mnt_idmap, dir, dentry, mode | S_IFDIR, 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  126  	if (!retval)
d8c76e6f45c111c Dave Hansen       2006-09-30  127  		inc_nlink(dir);
88d5baf69082e5b NeilBrown         2025-02-27 @128  	return ERR_PTR(retval);
^1da177e4c3f415 Linus Torvalds    2005-04-16  129  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
