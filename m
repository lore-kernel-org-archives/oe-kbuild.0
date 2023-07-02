Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379C17C9
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Jul 2023 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688314906; x=1719850906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxpwXio2H7wuqqEgdOrGv2up3GUAmamUBOHnO9Dwaak=;
  b=dzwr0NfEmO3GPdrdEz4as77Y6QgBS3J/m3U0eMqpLLfr7UDLftBEDJVs
   jRV69leQbyJcQGg0HBgX72TQ5bb4WSgRjfDhPGXpz/YfBvgws+GM2heSQ
   bsiAA1PowPkxnOPbLA2okfLCVxsPIiEVCNOwy9ildxS0yvU+NnNXV3n0V
   bQg1GRsYX/T1u5t4Ew55rbsoCndik060+zaKEYfSm/LK4yUgyzD8DhHEX
   8ds3PZ2NZ6YPDnSzrd0YmEJv0hciisOJmn3Fb6mEfrI3iHty3jKlanqWj
   wnRpNnZZlhFjbzToSCmc7wRrKVgNA5FdqRM/gnQTXDLjjYiT6JQxS8ehf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="347493713"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="347493713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 09:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="892309418"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="892309418"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jul 2023 09:21:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFzpW-000GkZ-0q;
	Sun, 02 Jul 2023 16:21:42 +0000
Date: Mon, 3 Jul 2023 00:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/namei.c:4875 vfs_rename() warn: variable dereferenced before
 check 'source' (see line 4830)
Message-ID: <202307030026.9sE2pk2x-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   995b406c7e972fab181a4bb57f3b95e59b8e5bf3
commit: 28eceeda130f5058074dd007d9c59d2e8bc5af2e fs: Lock moved directories
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20230702 (https://download.01.org/0day-ci/archive/20230703/202307030026.9sE2pk2x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030026.9sE2pk2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307030026.9sE2pk2x-lkp@intel.com/

New smatch warnings:
fs/namei.c:4875 vfs_rename() warn: variable dereferenced before check 'source' (see line 4830)

Old smatch warnings:
fs/namei.c:1573 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1657 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2180 hash_name() error: uninitialized symbol 'bdata'.

vim +/source +4875 fs/namei.c

5590ff0d5528b6 Ulrich Drepper        2006-01-18  4706  
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4707  /**
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4708   * vfs_rename - rename a filesystem object
2111c3c0124f74 Randy Dunlap          2021-02-15  4709   * @rd:		pointer to &struct renamedata info
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4710   *
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4711   * The caller must hold multiple mutexes--see lock_rename()).
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4712   *
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4713   * If vfs_rename discovers a delegation in need of breaking at either
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4714   * the source or destination, it will return -EWOULDBLOCK and return a
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4715   * reference to the inode in delegated_inode.  The caller should then
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4716   * break the delegation and retry.  Because breaking a delegation may
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4717   * take a long time, the caller should drop all locks before doing
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4718   * so.
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4719   *
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4720   * Alternatively, a caller may pass NULL for delegated_inode.  This may
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4721   * be appropriate for callers that expect the underlying filesystem not
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4722   * to be NFS exported.
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4723   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  4724   * The worst of all namespace operations - renaming directory. "Perverted"
^1da177e4c3f41 Linus Torvalds        2005-04-16  4725   * doesn't even start to describe it. Somebody in UCB had a heck of a trip...
^1da177e4c3f41 Linus Torvalds        2005-04-16  4726   * Problems:
0117d4272b1acd Mauro Carvalho Chehab 2017-05-12  4727   *
d03b29a271eb1d J. Bruce Fields       2014-02-17  4728   *	a) we can get into loop creation.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4729   *	b) race potential - two innocent renames can create a loop together.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4730   *	   That's where 4.4 screws up. Current fix: serialization on
a11f3a0574a573 Arjan van de Ven      2006-03-23  4731   *	   sb->s_vfs_rename_mutex. We might be more accurate, but that's another
^1da177e4c3f41 Linus Torvalds        2005-04-16  4732   *	   story.
6cedba8962f440 J. Bruce Fields       2012-03-05  4733   *	c) we have to lock _four_ objects - parents and victim (if it exists),
28eceeda130f50 Jan Kara              2023-06-01  4734   *	   and source.
1b1dcc1b57a491 Jes Sorensen          2006-01-09  4735   *	   And that - after we got ->i_mutex on parents (until then we don't know
^1da177e4c3f41 Linus Torvalds        2005-04-16  4736   *	   whether the target exists).  Solution: try to be smart with locking
^1da177e4c3f41 Linus Torvalds        2005-04-16  4737   *	   order for inodes.  We rely on the fact that tree topology may change
a11f3a0574a573 Arjan van de Ven      2006-03-23  4738   *	   only under ->s_vfs_rename_mutex _and_ that parent of the object we
^1da177e4c3f41 Linus Torvalds        2005-04-16  4739   *	   move will be locked.  Thus we can rank directories by the tree
^1da177e4c3f41 Linus Torvalds        2005-04-16  4740   *	   (ancestors first) and rank all non-directories after them.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4741   *	   That works since everybody except rename does "lock parent, lookup,
a11f3a0574a573 Arjan van de Ven      2006-03-23  4742   *	   lock child" and rename is under ->s_vfs_rename_mutex.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4743   *	   HOWEVER, it relies on the assumption that any object with ->lookup()
^1da177e4c3f41 Linus Torvalds        2005-04-16  4744   *	   has no more than 1 dentry.  If "hybrid" objects will ever appear,
^1da177e4c3f41 Linus Torvalds        2005-04-16  4745   *	   we'd better make sure that there's no link(2) for them.
e4eaac06bcccb2 Sage Weil             2011-05-24  4746   *	d) conversion from fhandle to dentry may come in the wrong moment - when
1b1dcc1b57a491 Jes Sorensen          2006-01-09  4747   *	   we are removing the target. Solution: we will have to grab ->i_mutex
^1da177e4c3f41 Linus Torvalds        2005-04-16  4748   *	   in the fhandle_to_dentry code. [FIXME - current nfsfh.c relies on
c41b20e721ea4f Adam Buchbinder       2009-12-11  4749   *	   ->i_mutex on parents, which works but leads to some truly excessive
^1da177e4c3f41 Linus Torvalds        2005-04-16  4750   *	   locking].
^1da177e4c3f41 Linus Torvalds        2005-04-16  4751   */
9fe61450972d39 Christian Brauner     2021-01-21  4752  int vfs_rename(struct renamedata *rd)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4753  {
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4754  	int error;
9fe61450972d39 Christian Brauner     2021-01-21  4755  	struct inode *old_dir = rd->old_dir, *new_dir = rd->new_dir;
9fe61450972d39 Christian Brauner     2021-01-21  4756  	struct dentry *old_dentry = rd->old_dentry;
9fe61450972d39 Christian Brauner     2021-01-21  4757  	struct dentry *new_dentry = rd->new_dentry;
9fe61450972d39 Christian Brauner     2021-01-21  4758  	struct inode **delegated_inode = rd->delegated_inode;
9fe61450972d39 Christian Brauner     2021-01-21  4759  	unsigned int flags = rd->flags;
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4760  	bool is_dir = d_is_dir(old_dentry);
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4761  	struct inode *source = old_dentry->d_inode;
9055cba711891a Sage Weil             2011-05-24  4762  	struct inode *target = new_dentry->d_inode;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4763  	bool new_is_dir = false;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4764  	unsigned max_links = new_dir->i_sb->s_max_links;
49d31c2f389acf Al Viro               2017-07-07  4765  	struct name_snapshot old_name;
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4766  
8d3e2936375bac Miklos Szeredi        2016-12-16  4767  	if (source == target)
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4768  		return 0;
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4769  
4609e1f18e19c3 Christian Brauner     2023-01-13  4770  	error = may_delete(rd->old_mnt_idmap, old_dir, old_dentry, is_dir);
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4771  	if (error)
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4772  		return error;
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4773  
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4774  	if (!target) {
4609e1f18e19c3 Christian Brauner     2023-01-13  4775  		error = may_create(rd->new_mnt_idmap, new_dir, new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4776  	} else {
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4777  		new_is_dir = d_is_dir(new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4778  
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4779  		if (!(flags & RENAME_EXCHANGE))
4609e1f18e19c3 Christian Brauner     2023-01-13  4780  			error = may_delete(rd->new_mnt_idmap, new_dir,
6521f891708292 Christian Brauner     2021-01-21  4781  					   new_dentry, is_dir);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4782  		else
4609e1f18e19c3 Christian Brauner     2023-01-13  4783  			error = may_delete(rd->new_mnt_idmap, new_dir,
6521f891708292 Christian Brauner     2021-01-21  4784  					   new_dentry, new_is_dir);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4785  	}
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4786  	if (error)
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4787  		return error;
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4788  
2773bf00aeb9bf Miklos Szeredi        2016-09-27  4789  	if (!old_dir->i_op->rename)
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4790  		return -EPERM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4791  
^1da177e4c3f41 Linus Torvalds        2005-04-16  4792  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  4793  	 * If we are going to change the parent - check write permissions,
^1da177e4c3f41 Linus Torvalds        2005-04-16  4794  	 * we'll need to flip '..'.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4795  	 */
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4796  	if (new_dir != old_dir) {
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4797  		if (is_dir) {
4609e1f18e19c3 Christian Brauner     2023-01-13  4798  			error = inode_permission(rd->old_mnt_idmap, source,
47291baa8ddfda Christian Brauner     2021-01-21  4799  						 MAY_WRITE);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4800  			if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4801  				return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4802  		}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4803  		if ((flags & RENAME_EXCHANGE) && new_is_dir) {
4609e1f18e19c3 Christian Brauner     2023-01-13  4804  			error = inode_permission(rd->new_mnt_idmap, target,
47291baa8ddfda Christian Brauner     2021-01-21  4805  						 MAY_WRITE);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4806  			if (error)
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4807  				return error;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4808  		}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4809  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  4810  
0b3974eb04c487 Miklos Szeredi        2014-04-01  4811  	error = security_inode_rename(old_dir, old_dentry, new_dir, new_dentry,
0b3974eb04c487 Miklos Szeredi        2014-04-01  4812  				      flags);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4813  	if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4814  		return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4815  
49d31c2f389acf Al Viro               2017-07-07  4816  	take_dentry_name_snapshot(&old_name, old_dentry);
1d2ef590148300 Al Viro               2011-09-14  4817  	dget(new_dentry);
28eceeda130f50 Jan Kara              2023-06-01  4818  	/*
28eceeda130f50 Jan Kara              2023-06-01  4819  	 * Lock all moved children. Moved directories may need to change parent
28eceeda130f50 Jan Kara              2023-06-01  4820  	 * pointer so they need the lock to prevent against concurrent
28eceeda130f50 Jan Kara              2023-06-01  4821  	 * directory changes moving parent pointer. For regular files we've
28eceeda130f50 Jan Kara              2023-06-01  4822  	 * historically always done this. The lockdep locking subclasses are
28eceeda130f50 Jan Kara              2023-06-01  4823  	 * somewhat arbitrary but RENAME_EXCHANGE in particular can swap
28eceeda130f50 Jan Kara              2023-06-01  4824  	 * regular files and directories so it's difficult to tell which
28eceeda130f50 Jan Kara              2023-06-01  4825  	 * subclasses to use.
28eceeda130f50 Jan Kara              2023-06-01  4826  	 */
28eceeda130f50 Jan Kara              2023-06-01  4827  	lock_two_inodes(source, target, I_MUTEX_NORMAL, I_MUTEX_NONDIR2);
9055cba711891a Sage Weil             2011-05-24  4828  
51cc3a6620a6ca Hugh Dickins          2021-09-02  4829  	error = -EPERM;
51cc3a6620a6ca Hugh Dickins          2021-09-02 @4830  	if (IS_SWAPFILE(source) || (target && IS_SWAPFILE(target)))
51cc3a6620a6ca Hugh Dickins          2021-09-02  4831  		goto out;
51cc3a6620a6ca Hugh Dickins          2021-09-02  4832  
^1da177e4c3f41 Linus Torvalds        2005-04-16  4833  	error = -EBUSY;
7af1364ffa64db Eric W. Biederman     2013-10-04  4834  	if (is_local_mountpoint(old_dentry) || is_local_mountpoint(new_dentry))
9055cba711891a Sage Weil             2011-05-24  4835  		goto out;
9055cba711891a Sage Weil             2011-05-24  4836  
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4837  	if (max_links && new_dir != old_dir) {
8de52778798fe3 Al Viro               2012-02-06  4838  		error = -EMLINK;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4839  		if (is_dir && !new_is_dir && new_dir->i_nlink >= max_links)
8de52778798fe3 Al Viro               2012-02-06  4840  			goto out;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4841  		if ((flags & RENAME_EXCHANGE) && !is_dir && new_is_dir &&
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4842  		    old_dir->i_nlink >= max_links)
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4843  			goto out;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4844  	}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4845  	if (!is_dir) {
8e6d782cab5088 J. Bruce Fields       2011-09-20  4846  		error = try_break_deleg(source, delegated_inode);
8e6d782cab5088 J. Bruce Fields       2011-09-20  4847  		if (error)
8e6d782cab5088 J. Bruce Fields       2011-09-20  4848  			goto out;
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4849  	}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4850  	if (target && !new_is_dir) {
8e6d782cab5088 J. Bruce Fields       2011-09-20  4851  		error = try_break_deleg(target, delegated_inode);
8e6d782cab5088 J. Bruce Fields       2011-09-20  4852  		if (error)
8e6d782cab5088 J. Bruce Fields       2011-09-20  4853  			goto out;
8e6d782cab5088 J. Bruce Fields       2011-09-20  4854  	}
e18275ae55e07a Christian Brauner     2023-01-13  4855  	error = old_dir->i_op->rename(rd->new_mnt_idmap, old_dir, old_dentry,
520c8b16505236 Miklos Szeredi        2014-04-01  4856  				      new_dir, new_dentry, flags);
51892bbb57e878 Sage Weil             2011-05-24  4857  	if (error)
51892bbb57e878 Sage Weil             2011-05-24  4858  		goto out;
51892bbb57e878 Sage Weil             2011-05-24  4859  
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4860  	if (!(flags & RENAME_EXCHANGE) && target) {
8767712f26d18a Al Viro               2018-05-27  4861  		if (is_dir) {
8767712f26d18a Al Viro               2018-05-27  4862  			shrink_dcache_parent(new_dentry);
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4863  			target->i_flags |= S_DEAD;
8767712f26d18a Al Viro               2018-05-27  4864  		}
d83c49f3e36cec Al Viro               2010-04-30  4865  		dont_mount(new_dentry);
8ed936b5671bfb Eric W. Biederman     2013-10-01  4866  		detach_mounts(new_dentry);
bc27027a73e8b8 Miklos Szeredi        2014-04-01  4867  	}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4868  	if (!(old_dir->i_sb->s_type->fs_flags & FS_RENAME_DOES_D_MOVE)) {
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4869  		if (!(flags & RENAME_EXCHANGE))
^1da177e4c3f41 Linus Torvalds        2005-04-16  4870  			d_move(old_dentry, new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4871  		else
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4872  			d_exchange(old_dentry, new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4873  	}
51892bbb57e878 Sage Weil             2011-05-24  4874  out:
28eceeda130f50 Jan Kara              2023-06-01 @4875  	if (source)
28eceeda130f50 Jan Kara              2023-06-01  4876  		inode_unlock(source);
28eceeda130f50 Jan Kara              2023-06-01  4877  	if (target)
5955102c9984fa Al Viro               2016-01-22  4878  		inode_unlock(target);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4879  	dput(new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4880  	if (!error) {
f4ec3a3d43bcdc Al Viro               2019-04-26  4881  		fsnotify_move(old_dir, new_dir, &old_name.name, is_dir,
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4882  			      !(flags & RENAME_EXCHANGE) ? target : NULL, old_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4883  		if (flags & RENAME_EXCHANGE) {
f4ec3a3d43bcdc Al Viro               2019-04-26  4884  			fsnotify_move(new_dir, old_dir, &old_dentry->d_name,
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4885  				      new_is_dir, NULL, new_dentry);
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4886  		}
da1ce0670c14d8 Miklos Szeredi        2014-04-01  4887  	}
49d31c2f389acf Al Viro               2017-07-07  4888  	release_dentry_name_snapshot(&old_name);
0eeca28300df11 Robert Love           2005-07-12  4889  
^1da177e4c3f41 Linus Torvalds        2005-04-16  4890  	return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4891  }
4d359507346a15 Al Viro               2014-03-14  4892  EXPORT_SYMBOL(vfs_rename);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
