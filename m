Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770151E49F
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821959; cv=none; b=JbD0sumdsB9YVc40/CahCv1xHcPhpQ5Jx3h7qsKfPTocJ6a741Cigr8J5pB1BgM6kHtJvxwL4ZMYvYWog+OzpPUpOgl0DiMHKe8M3B1LIaaSeURVNaFpL2U+NYvXhLFUXDsO73/qlm6L9KfO4fPghzKs93xYdB5jfkbJCzBj0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821959; c=relaxed/simple;
	bh=pfZV/YqrGg5p1k0uKH3INgR2OhMs+m4PDQ4gW44unUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3g/aOwnxUhunFblWSdytu+yzRr2N/1f5JP4g8KZjP4kgR7npxJbOSKBI21e9rly5cNy+WJTFNP9t0xyPXAm1sZobbVPsev9CTZ+3sLV3t29wEhvlyWK6hgZIF85yIfjEgZ72S+VhA8HxLRJf0cgkeL/ffK+WvstmhQQF/BMLxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIaq4h3v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIaq4h3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740821957; x=1772357957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfZV/YqrGg5p1k0uKH3INgR2OhMs+m4PDQ4gW44unUQ=;
  b=EIaq4h3vmyQVUaQQu2HPYdBIHHhMqAui+/wdQmaR/QJqr70KiG3CfKdh
   fkEJSrtNJ6aD3YDIy7ON3gK013J83726dOwZUnklOebC+O3SEdSgCHjsr
   QSp54xioicwmYsyZaMOfZRQFmA2MHl0RBmzCvxifMDU8XTxf7ZtZQj/xl
   WziOv5l3poZtPG2wlYnJ/qmKmgrPQtCjGbAgffkyw7fwcmFHbrHJZcwew
   lu9sSIpIWqoxwepSsG3J6GpRrWFXS4GCvaqxGQMHuhpSOFSYEzQ8J+M8g
   qBFt9MzO97w9c2i+AzUqxftfvCfdrBxvPYEadMplkMQjEQJ27z9eqSwDi
   A==;
X-CSE-ConnectionGUID: DqeIqti7RYShK5ygKM00Cw==
X-CSE-MsgGUID: 0nDLTZjQQBSzC+g1IsWblQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="53137011"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="53137011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 01:39:15 -0800
X-CSE-ConnectionGUID: sbNr8ExjQQC1jntBIK5w/Q==
X-CSE-MsgGUID: s/d4qgxwRSmv4ei9h1hkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117416083"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 01:39:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toJIt-000G62-0D;
	Sat, 01 Mar 2025 09:39:11 +0000
Date: Sat, 1 Mar 2025 17:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs-6.15.async.dir 4/11] fs/hugetlbfs/inode.c:1001
 hugetlbfs_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202503011706.fRncHLHs-lkp@intel.com>
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
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011706.fRncHLHs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503011706.fRncHLHs-lkp@intel.com/

smatch warnings:
fs/hugetlbfs/inode.c:1001 hugetlbfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ecryptfs/inode.c:529 ecryptfs_mkdir() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1001 fs/hugetlbfs/inode.c

1ab5b82f540b31 Piotr Sarna       2019-11-30   993  
88d5baf69082e5 NeilBrown         2025-02-27   994  static struct dentry *hugetlbfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21   995  				      struct dentry *dentry, umode_t mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16   996  {
91e78a1eb6b1c0 Giuseppe Scrivano 2024-02-29   997  	int retval = hugetlbfs_mknod(idmap, dir, dentry,
549c7297717c32 Christian Brauner 2021-01-21   998  				     mode | S_IFDIR, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16   999  	if (!retval)
d8c76e6f45c111 Dave Hansen       2006-09-30  1000  		inc_nlink(dir);
88d5baf69082e5 NeilBrown         2025-02-27 @1001  	return ERR_PTR(retval);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1002  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1003  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
