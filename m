Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6B20FB
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 04:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFMRBavl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697000271; x=1728536271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7U6/4eIH+v7exmh/x1fS0CwxhWsot6Yfp26nkocSed8=;
  b=ZFMRBavl5/2w8NpDIXXw65VXmXvWw3vk86Su6aKFTiZ6nqMOJ1NQ+qO3
   bzrEs4zTOVFPwsv+463qBtc0ZFRqXzzDjBkcBA6m8IhRYvSTmi68LiCnh
   WirE4djnxHAEt4vedHtzhlcKD6aaIFxmQhyJvFJ5UgFBwkzfI85vn9hor
   yfFKWXfE900ZLMMAVzJ1iqOE0qsFv0lnkEXeL3kqOT/zftiKRXi6x2Xu/
   5Zwov3syztatR4fyp69LSVy6SCZsj+pm8LpRF49MjNn04B+zWxdYHJkFN
   BIYksImSDHqUQX+uikY6qdVldwJYGFcuPavZ0S4Do0JNKqvF5epIEBeik
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6138356"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6138356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788853290"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788853290"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 21:57:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRHn-0001km-1x;
	Wed, 11 Oct 2023 04:57:36 +0000
Date: Wed, 11 Oct 2023 12:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 4/7] vfs: Optimize atomic_open() on positive dentry
Message-ID: <202310111259.WGjXat6p-lkp@intel.com>
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
In-Reply-To: <20230920173445.3943581-5-bschubert@ddn.com>
References: <20230920173445.3943581-5-bschubert@ddn.com>
TO: Bernd Schubert <bschubert@ddn.com>
TO: linux-fsdevel@vger.kernel.org
CC: bernd.schubert@fastmail.fm
CC: miklos@szeredi.hu
CC: dsingh@ddn.com
CC: Bernd Schubert <bschubert@ddn.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Al Viro <viro@zeniv.linux.org.uk>

Hi Bernd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vfs-idmapping/for-next]
[cannot apply to mszeredi-fuse/for-next brauner-vfs/vfs.all linus/master viro-vfs/for-next v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-fuse_create_open/20230921-013805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230920173445.3943581-5-bschubert%40ddn.com
patch subject: [PATCH v9 4/7] vfs: Optimize atomic_open() on positive dentry
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20230927 (https://download.01.org/0day-ci/archive/20231011/202310111259.WGjXat6p-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111259.WGjXat6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310111259.WGjXat6p-lkp@intel.com/

New smatch warnings:
fs/namei.c:3418 atomic_revalidate_open() warn: variable dereferenced before check 'got_write' (see line 3414)

Old smatch warnings:
fs/namei.c:1573 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1658 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2189 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:2600 __kern_path_locked() warn: inconsistent returns '&path->dentry->d_inode->i_rwsem'.
fs/namei.c:3480 lookup_open() error: uninitialized symbol 'error'.

vim +/got_write +3418 fs/namei.c

d18e9008c377dc Miklos Szeredi 2012-06-05  3390  
0bb53ce89df211 Bernd Schubert 2023-09-20  3391  static struct dentry *atomic_revalidate_open(struct dentry *dentry,
0bb53ce89df211 Bernd Schubert 2023-09-20  3392  					     struct nameidata *nd,
0bb53ce89df211 Bernd Schubert 2023-09-20  3393  					     struct file *file,
0bb53ce89df211 Bernd Schubert 2023-09-20  3394  					     const struct open_flags *op,
0bb53ce89df211 Bernd Schubert 2023-09-20  3395  					     bool *got_write)
0bb53ce89df211 Bernd Schubert 2023-09-20  3396  {
0bb53ce89df211 Bernd Schubert 2023-09-20  3397  	struct mnt_idmap *idmap;
0bb53ce89df211 Bernd Schubert 2023-09-20  3398  	struct dentry *dir = nd->path.dentry;
0bb53ce89df211 Bernd Schubert 2023-09-20  3399  	struct inode *dir_inode = dir->d_inode;
0bb53ce89df211 Bernd Schubert 2023-09-20  3400  	int open_flag = op->open_flag;
0bb53ce89df211 Bernd Schubert 2023-09-20  3401  	umode_t mode = op->mode;
0bb53ce89df211 Bernd Schubert 2023-09-20  3402  
0bb53ce89df211 Bernd Schubert 2023-09-20  3403  	if (unlikely(IS_DEADDIR(dir_inode)))
0bb53ce89df211 Bernd Schubert 2023-09-20  3404  		return ERR_PTR(-ENOENT);
0bb53ce89df211 Bernd Schubert 2023-09-20  3405  
0bb53ce89df211 Bernd Schubert 2023-09-20  3406  	file->f_mode &= ~FMODE_CREATED;
0bb53ce89df211 Bernd Schubert 2023-09-20  3407  
0bb53ce89df211 Bernd Schubert 2023-09-20  3408  	if (unlikely(open_flag & O_CREAT)) {
0bb53ce89df211 Bernd Schubert 2023-09-20  3409  		WARN_ON(1);
0bb53ce89df211 Bernd Schubert 2023-09-20  3410  		return ERR_PTR(-EINVAL);
0bb53ce89df211 Bernd Schubert 2023-09-20  3411  	}
0bb53ce89df211 Bernd Schubert 2023-09-20  3412  
0bb53ce89df211 Bernd Schubert 2023-09-20  3413  	if (open_flag & (O_TRUNC | O_WRONLY | O_RDWR))
0bb53ce89df211 Bernd Schubert 2023-09-20 @3414  		*got_write = !mnt_want_write(nd->path.mnt);
0bb53ce89df211 Bernd Schubert 2023-09-20  3415  	else
0bb53ce89df211 Bernd Schubert 2023-09-20  3416  		*got_write = false;
0bb53ce89df211 Bernd Schubert 2023-09-20  3417  
0bb53ce89df211 Bernd Schubert 2023-09-20 @3418  	if (!got_write)
0bb53ce89df211 Bernd Schubert 2023-09-20  3419  		open_flag &= ~O_TRUNC;
0bb53ce89df211 Bernd Schubert 2023-09-20  3420  
0bb53ce89df211 Bernd Schubert 2023-09-20  3421  	inode_lock_shared(dir->d_inode);
0bb53ce89df211 Bernd Schubert 2023-09-20  3422  	dentry = atomic_open(nd, dentry, file, open_flag, mode);
0bb53ce89df211 Bernd Schubert 2023-09-20  3423  	inode_unlock_shared(dir->d_inode);
0bb53ce89df211 Bernd Schubert 2023-09-20  3424  
0bb53ce89df211 Bernd Schubert 2023-09-20  3425  	return dentry;
0bb53ce89df211 Bernd Schubert 2023-09-20  3426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
