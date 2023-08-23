Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A027E
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Aug 2023 00:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692750416; x=1724286416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68Tx+tagSjaj2RJw44itQezn55frOrP4LA5fJmiOZQY=;
  b=W7ocdqNkcAJ5VfSFHaW7iJWC2ckGqXPSru1Pjwv1bkNxSOTiCQKdKPqC
   Qmqxc5+Qc7QK0VnMKb9yMaCrTFeNdOPZRwRhr55ajTxohTQYyalCzm36g
   BYX40gsWGJ1V1rhLn0SNH0eqNzq5z7rmBVmyql0jeNznlFp5Rb1qfzMKn
   /lNoQXtOlBkWI/9489jxaQgKsiHx2FgTtxYjOqdANL3A8TnTQeZHmmML6
   cjGOXa9txm6LUqD+MdAt88rOQKn5YAq2II2ITmEJpJh5nlSiaTHG/5osN
   iQouGAY9QflVRN9KeMzY2YvSNjnbzYjidtkkp77MIW2/cJ/46EFqpg6bv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374003849"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="374003849"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067256446"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1067256446"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 17:26:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbhz-0000eO-1O;
	Wed, 23 Aug 2023 00:26:51 +0000
Date: Wed, 23 Aug 2023 08:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/6] [RFC] Allow atomic_open() on positive dentry
Message-ID: <202308230837.ERLB0v0U-lkp@intel.com>
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
In-Reply-To: <20230816143313.2591328-4-bschubert@ddn.com>
References: <20230816143313.2591328-4-bschubert@ddn.com>
TO: Bernd Schubert <bschubert@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc7]
[cannot apply to mszeredi-fuse/for-next next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-fuse_create_open/20230816-223637
base:   linus/master
patch link:    https://lore.kernel.org/r/20230816143313.2591328-4-bschubert%40ddn.com
patch subject: [PATCH 3/6] [RFC] Allow atomic_open() on positive dentry
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230837.ERLB0v0U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230837.ERLB0v0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308230837.ERLB0v0U-lkp@intel.com/

New smatch warnings:
fs/namei.c:3442 lookup_open() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/namei.c:1573 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1658 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2189 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:2600 __kern_path_locked() warn: inconsistent returns '&path->dentry->d_inode->i_rwsem'.

vim +/error +3442 fs/namei.c

d18e9008c377dc Miklos Szeredi    2012-06-05  3390  
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3391  /*
1acf0af9b98102 David Howells     2012-06-14  3392   * Look up and maybe create and open the last component.
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3393   *
00a07c1591a3fb Al Viro           2018-07-09  3394   * Must be called with parent locked (exclusive in O_CREAT case).
1acf0af9b98102 David Howells     2012-06-14  3395   *
00a07c1591a3fb Al Viro           2018-07-09  3396   * Returns 0 on success, that is, if
00a07c1591a3fb Al Viro           2018-07-09  3397   *  the file was successfully atomically created (if necessary) and opened, or
00a07c1591a3fb Al Viro           2018-07-09  3398   *  the file was not completely opened at this time, though lookups and
00a07c1591a3fb Al Viro           2018-07-09  3399   *  creations were performed.
00a07c1591a3fb Al Viro           2018-07-09  3400   * These case are distinguished by presence of FMODE_OPENED on file->f_mode.
00a07c1591a3fb Al Viro           2018-07-09  3401   * In the latter case dentry returned in @path might be negative if O_CREAT
00a07c1591a3fb Al Viro           2018-07-09  3402   * hadn't been specified.
1acf0af9b98102 David Howells     2012-06-14  3403   *
00a07c1591a3fb Al Viro           2018-07-09  3404   * An error code is returned on failure.
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3405   */
da5ebf5aa676c4 Al Viro           2020-01-09  3406  static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3407  				  const struct open_flags *op,
3ec2eef116e900 Al Viro           2018-06-08  3408  				  bool got_write)
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3409  {
6c960e68aaed33 Christian Brauner 2023-01-13  3410  	struct mnt_idmap *idmap;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3411  	struct dentry *dir = nd->path.dentry;
54ef487241e863 Miklos Szeredi    2012-06-05  3412  	struct inode *dir_inode = dir->d_inode;
1643b43fbd0524 Al Viro           2016-04-27  3413  	int open_flag = op->open_flag;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3414  	struct dentry *dentry;
1643b43fbd0524 Al Viro           2016-04-27  3415  	int error, create_error = 0;
1643b43fbd0524 Al Viro           2016-04-27  3416  	umode_t mode = op->mode;
6fbd07146d9923 Al Viro           2016-04-28  3417  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wq);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3418  
ce8644fcadc52d Al Viro           2016-04-26  3419  	if (unlikely(IS_DEADDIR(dir_inode)))
da5ebf5aa676c4 Al Viro           2020-01-09  3420  		return ERR_PTR(-ENOENT);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3421  
73a09dd94377e4 Al Viro           2018-06-08  3422  	file->f_mode &= ~FMODE_CREATED;
6fbd07146d9923 Al Viro           2016-04-28  3423  	dentry = d_lookup(dir, &nd->last);
6fbd07146d9923 Al Viro           2016-04-28  3424  	for (;;) {
6fbd07146d9923 Al Viro           2016-04-28  3425  		if (!dentry) {
6fbd07146d9923 Al Viro           2016-04-28  3426  			dentry = d_alloc_parallel(dir, &nd->last, &wq);
54ef487241e863 Miklos Szeredi    2012-06-05  3427  			if (IS_ERR(dentry))
da5ebf5aa676c4 Al Viro           2020-01-09  3428  				return dentry;
6fbd07146d9923 Al Viro           2016-04-28  3429  		}
6fbd07146d9923 Al Viro           2016-04-28  3430  		if (d_in_lookup(dentry))
6fbd07146d9923 Al Viro           2016-04-28  3431  			break;
54ef487241e863 Miklos Szeredi    2012-06-05  3432  
6fbd07146d9923 Al Viro           2016-04-28  3433  		error = d_revalidate(dentry, nd->flags);
6fbd07146d9923 Al Viro           2016-04-28  3434  		if (likely(error > 0))
6fbd07146d9923 Al Viro           2016-04-28  3435  			break;
6fbd07146d9923 Al Viro           2016-04-28  3436  		if (error)
6fbd07146d9923 Al Viro           2016-04-28  3437  			goto out_dput;
6fbd07146d9923 Al Viro           2016-04-28  3438  		d_invalidate(dentry);
6fbd07146d9923 Al Viro           2016-04-28  3439  		dput(dentry);
6fbd07146d9923 Al Viro           2016-04-28  3440  		dentry = NULL;
6fbd07146d9923 Al Viro           2016-04-28  3441  	}
7fb3498469c8a4 Miklos Szeredi    2023-08-16 @3442  	if (dentry->d_inode && error != D_REVALIDATE_ATOMIC) {
d18e9008c377dc Miklos Szeredi    2012-06-05  3443  		/* Cached positive dentry: will open in f_op->open */
da5ebf5aa676c4 Al Viro           2020-01-09  3444  		return dentry;
6c51e513a3aa49 Al Viro           2016-03-05  3445  	}
d18e9008c377dc Miklos Szeredi    2012-06-05  3446  
1643b43fbd0524 Al Viro           2016-04-27  3447  	/*
1643b43fbd0524 Al Viro           2016-04-27  3448  	 * Checking write permission is tricky, bacuse we don't know if we are
1643b43fbd0524 Al Viro           2016-04-27  3449  	 * going to actually need it: O_CREAT opens should work as long as the
1643b43fbd0524 Al Viro           2016-04-27  3450  	 * file exists.  But checking existence breaks atomicity.  The trick is
1643b43fbd0524 Al Viro           2016-04-27  3451  	 * to check access and if not granted clear O_CREAT from the flags.
1643b43fbd0524 Al Viro           2016-04-27  3452  	 *
1643b43fbd0524 Al Viro           2016-04-27  3453  	 * Another problem is returing the "right" error value (e.g. for an
1643b43fbd0524 Al Viro           2016-04-27  3454  	 * O_EXCL open we want to return EEXIST not EROFS).
1643b43fbd0524 Al Viro           2016-04-27  3455  	 */
99a4a90c8e9337 Al Viro           2020-03-12  3456  	if (unlikely(!got_write))
99a4a90c8e9337 Al Viro           2020-03-12  3457  		open_flag &= ~O_TRUNC;
6c960e68aaed33 Christian Brauner 2023-01-13  3458  	idmap = mnt_idmap(nd->path.mnt);
1643b43fbd0524 Al Viro           2016-04-27  3459  	if (open_flag & O_CREAT) {
99a4a90c8e9337 Al Viro           2020-03-12  3460  		if (open_flag & O_EXCL)
99a4a90c8e9337 Al Viro           2020-03-12  3461  			open_flag &= ~O_TRUNC;
9452e93e6dae86 Christian Brauner 2023-01-13  3462  		mode = vfs_prepare_mode(idmap, dir->d_inode, mode, mode, mode);
99a4a90c8e9337 Al Viro           2020-03-12  3463  		if (likely(got_write))
4609e1f18e19c3 Christian Brauner 2023-01-13  3464  			create_error = may_o_create(idmap, &nd->path,
ba73d98745be1c Christian Brauner 2021-01-21  3465  						    dentry, mode);
99a4a90c8e9337 Al Viro           2020-03-12  3466  		else
99a4a90c8e9337 Al Viro           2020-03-12  3467  			create_error = -EROFS;
d18e9008c377dc Miklos Szeredi    2012-06-05  3468  	}
99a4a90c8e9337 Al Viro           2020-03-12  3469  	if (create_error)
99a4a90c8e9337 Al Viro           2020-03-12  3470  		open_flag &= ~O_CREAT;
6ac087099edf09 Al Viro           2016-04-26  3471  	if (dir_inode->i_op->atomic_open) {
d489cf9a3e88aa Al Viro           2020-03-11  3472  		dentry = atomic_open(nd, dentry, file, open_flag, mode);
da5ebf5aa676c4 Al Viro           2020-01-09  3473  		if (unlikely(create_error) && dentry == ERR_PTR(-ENOENT))
da5ebf5aa676c4 Al Viro           2020-01-09  3474  			dentry = ERR_PTR(create_error);
da5ebf5aa676c4 Al Viro           2020-01-09  3475  		return dentry;
239eb983383b1b Al Viro           2020-01-09  3476  	}
54ef487241e863 Miklos Szeredi    2012-06-05  3477  
6fbd07146d9923 Al Viro           2016-04-28  3478  	if (d_in_lookup(dentry)) {
12fa5e24041923 Al Viro           2016-04-28  3479  		struct dentry *res = dir_inode->i_op->lookup(dir_inode, dentry,
12fa5e24041923 Al Viro           2016-04-28  3480  							     nd->flags);
6fbd07146d9923 Al Viro           2016-04-28  3481  		d_lookup_done(dentry);
12fa5e24041923 Al Viro           2016-04-28  3482  		if (unlikely(res)) {
12fa5e24041923 Al Viro           2016-04-28  3483  			if (IS_ERR(res)) {
12fa5e24041923 Al Viro           2016-04-28  3484  				error = PTR_ERR(res);
12fa5e24041923 Al Viro           2016-04-28  3485  				goto out_dput;
12fa5e24041923 Al Viro           2016-04-28  3486  			}
12fa5e24041923 Al Viro           2016-04-28  3487  			dput(dentry);
12fa5e24041923 Al Viro           2016-04-28  3488  			dentry = res;
12fa5e24041923 Al Viro           2016-04-28  3489  		}
54ef487241e863 Miklos Szeredi    2012-06-05  3490  	}
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3491  
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3492  	/* Negative dentry, just create the file */
1643b43fbd0524 Al Viro           2016-04-27  3493  	if (!dentry->d_inode && (open_flag & O_CREAT)) {
73a09dd94377e4 Al Viro           2018-06-08  3494  		file->f_mode |= FMODE_CREATED;
ce8644fcadc52d Al Viro           2016-04-26  3495  		audit_inode_child(dir_inode, dentry, AUDIT_TYPE_CHILD_CREATE);
ce8644fcadc52d Al Viro           2016-04-26  3496  		if (!dir_inode->i_op->create) {
ce8644fcadc52d Al Viro           2016-04-26  3497  			error = -EACCES;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3498  			goto out_dput;
64894cf843278c Al Viro           2012-07-31  3499  		}
549c7297717c32 Christian Brauner 2021-01-21  3500  
6c960e68aaed33 Christian Brauner 2023-01-13  3501  		error = dir_inode->i_op->create(idmap, dir_inode, dentry,
549c7297717c32 Christian Brauner 2021-01-21  3502  						mode, open_flag & O_EXCL);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3503  		if (error)
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3504  			goto out_dput;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3505  	}
1643b43fbd0524 Al Viro           2016-04-27  3506  	if (unlikely(create_error) && !dentry->d_inode) {
1643b43fbd0524 Al Viro           2016-04-27  3507  		error = create_error;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3508  		goto out_dput;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3509  	}
da5ebf5aa676c4 Al Viro           2020-01-09  3510  	return dentry;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3511  
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3512  out_dput:
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3513  	dput(dentry);
da5ebf5aa676c4 Al Viro           2020-01-09  3514  	return ERR_PTR(error);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3515  }
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
