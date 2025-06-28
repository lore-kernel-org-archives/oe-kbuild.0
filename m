Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA311C549F
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 02:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751078293; cv=none; b=LMqQ+pbp+d218nBpHXQeo9gWbXOX/MHTmgyivDVIC6vg+QYVudTmqtXDvSw7N81FDfkW5TYOM1fr6Ai4zlvKPJTp7SccHMzYwCY8WlWJ68aqk1nef/GdEduEZJz7tUYlEMkC3cfQIrnb4PsWFd6J4flTMyB1Wx1RKtR0iPlyV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751078293; c=relaxed/simple;
	bh=/zrSTTEX5JMQ71RJXJPw6knukNei3uoUKFwcLsoYJiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9/w9sqMIBKphM+U8kX9CyPynHn1tjDEUgcvHsFJLXp8TBwbI+eFojvZPOgZxkPdi43vthQw427+mGAe4jFIDqZuZDlrJF8xdkvECeOJe2TAIDWUvx0REtXY6kh5VmsJt/Lmjs/HfmVfH0nYh6EEBUiltbgf4b+fPOCnLGcZEcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6AhQfbw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6AhQfbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751078291; x=1782614291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zrSTTEX5JMQ71RJXJPw6knukNei3uoUKFwcLsoYJiY=;
  b=P6AhQfbwK4Sx7oXzozwNqQ4CvyNVxW1tESJRf9e9pIo7XsMZLnNEt6R4
   2QU1vRLvhMBLVrgKuLzQ7y0UgNbuInQhcQkM0sscvtyNWNEYZgG6dt72J
   fll+77OVAB/hFsHZ7WFZ/Prb7ommRlFPOlIBph2p7XAf0e7RFOVMiDIBN
   /tC51eu1XnG5eH+nGOW2m+nryjd/htmxEj9t/F5dgILIuaTECl/AIGNuj
   bjjSMIptNkTSCKu04iDq6fYX2NI8AEWl4rAOS3eszkeDG+C62+HWsm/V5
   BilxRxlnLUBQ/bglmRpVniBYqjh6utZ4ApJnQnM8XWeNn7tSxrChnuYJz
   Q==;
X-CSE-ConnectionGUID: NNIb8aptRfO5/Q/TDMaZCQ==
X-CSE-MsgGUID: BlJ7hVtkRBuPMkMlKs5qJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63649431"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="63649431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 19:38:10 -0700
X-CSE-ConnectionGUID: H37GRql3T6GEfM1P46bW0Q==
X-CSE-MsgGUID: UcVEVWsvRXGqJw39Hr8/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="176637402"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 19:38:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVLSB-000WgE-0d;
	Sat, 28 Jun 2025 02:38:07 +0000
Date: Sat, 28 Jun 2025 10:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 02/12] ovl: Call ovl_create_temp() and ovl_create_index()
 without lock held.
Message-ID: <202506281017.jeQF1pnr-lkp@intel.com>
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
In-Reply-To: <20250624230636.3233059-3-neil@brown.name>
References: <20250624230636.3233059-3-neil@brown.name>
TO: NeilBrown <neil@brown.name>
TO: Miklos Szeredi <miklos@szeredi.hu>
TO: Amir Goldstein <amir73il@gmail.com>
CC: linux-unionfs@vger.kernel.org
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: linux-fsdevel@vger.kernel.org

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[cannot apply to mszeredi-vfs/overlayfs-next mszeredi-vfs/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/ovl-use-is_subdir-for-testing-if-one-thing-is-a-subdir-of-another/20250625-070919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250624230636.3233059-3-neil%40brown.name
patch subject: [PATCH 02/12] ovl: Call ovl_create_temp() and ovl_create_index() without lock held.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281017.jeQF1pnr-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506281017.jeQF1pnr-lkp@intel.com/

New smatch warnings:
fs/overlayfs/dir.c:427 ovl_clear_empty() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/overlayfs/dir.c:58 ovl_cleanup_unlocked() error: uninitialized symbol 'err'.

vim +/ERR_PTR +427 fs/overlayfs/dir.c

e9be9d5e76e348 Miklos Szeredi    2014-10-24  352  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  353  static struct dentry *ovl_clear_empty(struct dentry *dentry,
e9be9d5e76e348 Miklos Szeredi    2014-10-24  354  				      struct list_head *list)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  355  {
576bb263450bbb Christian Brauner 2022-04-04  356  	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  357  	struct dentry *workdir = ovl_workdir(dentry);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  358  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  359  	struct dentry *upperdir = ovl_dentry_upper(dentry->d_parent);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  360  	struct inode *udir = upperdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  361  	struct path upperpath;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  362  	struct dentry *upper;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  363  	struct dentry *opaquedir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  364  	struct kstat stat;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  365  	int err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  366  
cc6f67bcafcb6b Miklos Szeredi    2015-05-19  367  	if (WARN_ON(!workdir))
cc6f67bcafcb6b Miklos Szeredi    2015-05-19  368  		return ERR_PTR(-EROFS);
cc6f67bcafcb6b Miklos Szeredi    2015-05-19  369  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  370  	ovl_path_upper(dentry, &upperpath);
a528d35e8bfcc5 David Howells     2017-01-31  371  	err = vfs_getattr(&upperpath, &stat,
a528d35e8bfcc5 David Howells     2017-01-31  372  			  STATX_BASIC_STATS, AT_STATX_SYNC_AS_STAT);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  373  	if (err)
fb1b87daadb6ed NeilBrown         2025-06-25  374  		goto out;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  375  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  376  	err = -ESTALE;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  377  	if (!S_ISDIR(stat.mode))
fb1b87daadb6ed NeilBrown         2025-06-25  378  		goto out;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  379  	upper = upperpath.dentry;
fb1b87daadb6ed NeilBrown         2025-06-25  380  	/* This test is racey but we re-test under the lock */
fb1b87daadb6ed NeilBrown         2025-06-25  381  	if (upper->d_parent != upperdir)
fb1b87daadb6ed NeilBrown         2025-06-25  382  		goto out;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  383  
576bb263450bbb Christian Brauner 2022-04-04  384  	opaquedir = ovl_create_temp(ofs, workdir, OVL_CATTR(stat.mode));
e9be9d5e76e348 Miklos Szeredi    2014-10-24  385  	err = PTR_ERR(opaquedir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  386  	if (IS_ERR(opaquedir))
fb1b87daadb6ed NeilBrown         2025-06-25  387  		/* workdir was unlocked, no upperdir */
fb1b87daadb6ed NeilBrown         2025-06-25  388  		goto out;
fb1b87daadb6ed NeilBrown         2025-06-25  389  	err = ovl_lock_rename_workdir(workdir, upperdir);
fb1b87daadb6ed NeilBrown         2025-06-25  390  	if (err)
fb1b87daadb6ed NeilBrown         2025-06-25  391  		goto out_cleanup_unlocked;
fb1b87daadb6ed NeilBrown         2025-06-25  392  	if (upper->d_parent->d_inode != udir)
fb1b87daadb6ed NeilBrown         2025-06-25  393  		goto out_cleanup;
dad7017a840d8d Christian Brauner 2022-04-04  394  	err = ovl_copy_xattr(dentry->d_sb, &upperpath, opaquedir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  395  	if (err)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  396  		goto out_cleanup;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  397  
5cf5b477f0ca33 Miklos Szeredi    2016-12-16  398  	err = ovl_set_opaque(dentry, opaquedir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  399  	if (err)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  400  		goto out_cleanup;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  401  
5955102c9984fa Al Viro           2016-01-22  402  	inode_lock(opaquedir->d_inode);
5272eaf3a56827 Christian Brauner 2022-04-04  403  	err = ovl_set_attr(ofs, opaquedir, &stat);
5955102c9984fa Al Viro           2016-01-22  404  	inode_unlock(opaquedir->d_inode);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  405  	if (err)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  406  		goto out_cleanup;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  407  
bc9241367aac08 NeilBrown         2025-06-13  408  	err = ovl_do_rename(ofs, workdir, opaquedir, upperdir, upper, RENAME_EXCHANGE);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  409  	if (err)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  410  		goto out_cleanup;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  411  
576bb263450bbb Christian Brauner 2022-04-04  412  	ovl_cleanup_whiteouts(ofs, upper, list);
576bb263450bbb Christian Brauner 2022-04-04  413  	ovl_cleanup(ofs, wdir, upper);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  414  	unlock_rename(workdir, upperdir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  415  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  416  	/* dentry's upper doesn't match now, get rid of it */
e9be9d5e76e348 Miklos Szeredi    2014-10-24  417  	d_drop(dentry);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  418  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  419  	return opaquedir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  420  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  421  out_cleanup:
e9be9d5e76e348 Miklos Szeredi    2014-10-24  422  	unlock_rename(workdir, upperdir);
fb1b87daadb6ed NeilBrown         2025-06-25  423  out_cleanup_unlocked:
fb1b87daadb6ed NeilBrown         2025-06-25  424  	ovl_cleanup_unlocked(ofs, workdir, opaquedir);
fb1b87daadb6ed NeilBrown         2025-06-25  425  	dput(opaquedir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  426  out:
e9be9d5e76e348 Miklos Szeredi    2014-10-24 @427  	return ERR_PTR(err);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  428  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
