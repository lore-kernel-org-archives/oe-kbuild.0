Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359425C80D
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083903; cv=none; b=bV5vmvF7p0FOuNTuTiwJD29DeAzGPnFnK8GceRyUhl74pvXLqRg6WwfOWcReIZnIMfrDl0itPi8/U2l6vm1ajaME2BopFJyzhVCcqMwTXE9P480xnFeP6GUU8WAqBVZSvMbUA8YsZLnRo6Atcqj1gDxz6+bfPgSk4n+8mBKcoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083903; c=relaxed/simple;
	bh=glCj+qqwtpZO4eh2AW9oehLLKBB8K6mjVcOiK8oOAqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WlDBSVBFp6H76m5G88n4e/7S9UIjDUE/c+D/EG5ZswRyaG8ceTsnKxH0NbsIx1xZCWHagP94iQGsYGPmTXPZo20tZUyUOal0oKnYioEb4h9nwgDlFxzhOdbZhH5s8zeVROyJSkeieniEPWufER5tHOA5v0ScZTRwGpO1kZSnE9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwSQdJuk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwSQdJuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763083902; x=1794619902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glCj+qqwtpZO4eh2AW9oehLLKBB8K6mjVcOiK8oOAqU=;
  b=FwSQdJuk98IpFIOR9edk/8qGbc8kAvbi6rXnzHPMwdw10TbPYG5ErPYD
   QUUfLyxN7dAjop+1QwXLFKgwmTQosk2zdi2wvzsSLw6vHrOHkto+mudg6
   wpH2twMBo/MhJl3CzSikYh73JEdPVkt4uKr16Ev53dkXgqRENx1UAi2ov
   eHZJ8/vFs+Nzty0JBqoXZpsL7e3kQd3kMd3ugUzvU9GxKZpIXtq7wh+H8
   ldDpYNzCOBvYgIB+6XfSVesHeXBrZSVosAG9b6Ly3GK086D5t+l36lKzt
   WtZYTY7yGkJnOF3ECE5MfC5v/TWJbMQZcN1KQ72F/dnLlQ+omfZY4CwVE
   g==;
X-CSE-ConnectionGUID: SKD0w/WwRWqhwzsoImWAGw==
X-CSE-MsgGUID: b08Dm/ozRCeWPZn02SeK3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69027830"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="69027830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 17:31:34 -0800
X-CSE-ConnectionGUID: 4oXSCQB3Tyusl2mMTEy5vA==
X-CSE-MsgGUID: zk4qbWxaT/2PQZRY9uh7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194787964"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 17:31:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJiev-000633-22;
	Fri, 14 Nov 2025 01:31:29 +0000
Date: Fri, 14 Nov 2025 09:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 10/46] fs/overlayfs/dir.c:1366
 ovl_create_tmpfile() error: uninitialized symbol 'err'.
Message-ID: <202511140922.NgEZJrH6-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: b4b1703d18a590cf8c9c08ec8e416c9bfc4a42b6 [10/46] ovl: port ovl_create_tmpfile() to cred guard
:::::: branch date: 4 hours ago
:::::: commit date: 14 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140922.NgEZJrH6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511140922.NgEZJrH6-lkp@intel.com/

New smatch warnings:
fs/overlayfs/dir.c:1366 ovl_create_tmpfile() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/dir.c:654 ovl_create_or_link() error: uninitialized symbol 'err'.

vim +/err +1366 fs/overlayfs/dir.c

e9be9d5e76e348 Miklos Szeredi    2014-10-24  1322  
9a87907de3597a Miklos Szeredi    2024-05-02  1323  static int ovl_create_tmpfile(struct file *file, struct dentry *dentry,
9a87907de3597a Miklos Szeredi    2024-05-02  1324  			      struct inode *inode, umode_t mode)
9a87907de3597a Miklos Szeredi    2024-05-02  1325  {
b4b1703d18a590 Christian Brauner 2025-11-12  1326  	const struct cred *new_cred __free(put_cred) = NULL;
9a87907de3597a Miklos Szeredi    2024-05-02  1327  	struct path realparentpath;
9a87907de3597a Miklos Szeredi    2024-05-02  1328  	struct file *realfile;
87a8a76c34a2ae Amir Goldstein    2024-10-07  1329  	struct ovl_file *of;
9a87907de3597a Miklos Szeredi    2024-05-02  1330  	struct dentry *newdentry;
9a87907de3597a Miklos Szeredi    2024-05-02  1331  	/* It's okay to set O_NOATIME, since the owner will be current fsuid */
9a87907de3597a Miklos Szeredi    2024-05-02  1332  	int flags = file->f_flags | OVL_OPEN_FLAGS;
9a87907de3597a Miklos Szeredi    2024-05-02  1333  	int err;
9a87907de3597a Miklos Szeredi    2024-05-02  1334  
b4b1703d18a590 Christian Brauner 2025-11-12  1335  	scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
711747e204ead1 Amir Goldstein    2024-11-14  1336  		new_cred = ovl_setup_cred_for_create(dentry, inode, mode, old_cred);
b4b1703d18a590 Christian Brauner 2025-11-12  1337  		if (IS_ERR(new_cred))
b4b1703d18a590 Christian Brauner 2025-11-12  1338  			return PTR_ERR(new_cred);
9a87907de3597a Miklos Szeredi    2024-05-02  1339  
9a87907de3597a Miklos Szeredi    2024-05-02  1340  		ovl_path_upper(dentry->d_parent, &realparentpath);
b4b1703d18a590 Christian Brauner 2025-11-12  1341  		realfile = backing_tmpfile_open(&file->f_path, flags,
b4b1703d18a590 Christian Brauner 2025-11-12  1342  						&realparentpath, mode,
b4b1703d18a590 Christian Brauner 2025-11-12  1343  						current_cred());
9a87907de3597a Miklos Szeredi    2024-05-02  1344  		err = PTR_ERR_OR_ZERO(realfile);
b4b1703d18a590 Christian Brauner 2025-11-12  1345  		pr_debug("tmpfile/open(%pd2, 0%o) = %i\n",
b4b1703d18a590 Christian Brauner 2025-11-12  1346  			 realparentpath.dentry, mode, err);
9a87907de3597a Miklos Szeredi    2024-05-02  1347  		if (err)
b4b1703d18a590 Christian Brauner 2025-11-12  1348  			return err;
9a87907de3597a Miklos Szeredi    2024-05-02  1349  
87a8a76c34a2ae Amir Goldstein    2024-10-07  1350  		of = ovl_file_alloc(realfile);
87a8a76c34a2ae Amir Goldstein    2024-10-07  1351  		if (!of) {
87a8a76c34a2ae Amir Goldstein    2024-10-07  1352  			fput(realfile);
b4b1703d18a590 Christian Brauner 2025-11-12  1353  			return -ENOMEM;
87a8a76c34a2ae Amir Goldstein    2024-10-07  1354  		}
87a8a76c34a2ae Amir Goldstein    2024-10-07  1355  
9a87907de3597a Miklos Szeredi    2024-05-02  1356  		/* ovl_instantiate() consumes the newdentry reference on success */
9a87907de3597a Miklos Szeredi    2024-05-02  1357  		newdentry = dget(realfile->f_path.dentry);
9a87907de3597a Miklos Szeredi    2024-05-02  1358  		err = ovl_instantiate(dentry, inode, newdentry, false, file);
9a87907de3597a Miklos Szeredi    2024-05-02  1359  		if (!err) {
87a8a76c34a2ae Amir Goldstein    2024-10-07  1360  			file->private_data = of;
9a87907de3597a Miklos Szeredi    2024-05-02  1361  		} else {
9a87907de3597a Miklos Szeredi    2024-05-02  1362  			dput(newdentry);
87a8a76c34a2ae Amir Goldstein    2024-10-07  1363  			ovl_file_free(of);
9a87907de3597a Miklos Szeredi    2024-05-02  1364  		}
b4b1703d18a590 Christian Brauner 2025-11-12  1365  	}
9a87907de3597a Miklos Szeredi    2024-05-02 @1366  	return err;
9a87907de3597a Miklos Szeredi    2024-05-02  1367  }
9a87907de3597a Miklos Szeredi    2024-05-02  1368  

:::::: The code at line 1366 was first introduced by commit
:::::: 9a87907de3597a339cc129229d1a20bc7365ea5f ovl: implement tmpfile

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
