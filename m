Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0627A904
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 03:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770693440; cv=none; b=VdBk/x9BRwoGi3SiWYcAqCmMPl+76wo8hGd6m9SILXT/NodR8bHPNy5n7T/ouNS83OhBqzWB10xh0XpvHzEV1lZ41WJ1R+fro7FBXEPh/9RiMP162E9NY5Ubv5FdMou+DSXBjV3NErbJuHz7zAHUcRmS3K5jxrIvvMD591sqASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770693440; c=relaxed/simple;
	bh=LwlmlBoXUejFz0ghP6f+dCwDFbh7NLPiEX5uvr0Qs/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+1tF2iOvmZu1/yv+AJeJvgSNI5uc6JASH6+o/yrx/mm+cB2ErAsMhLOfgtuWMk9LAo7Qr8XA9+IzQiYCEIO1IgW0PpQMrIIOmqat24Y19pgAausGT3r9eRENXlwsIpAyW119Sq7rBVYxLez2aL++oHz6UHNyqFVvHXwTsVXOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQ1wGr9y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQ1wGr9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770693439; x=1802229439;
  h=date:from:to:cc:subject:message-id;
  bh=LwlmlBoXUejFz0ghP6f+dCwDFbh7NLPiEX5uvr0Qs/o=;
  b=JQ1wGr9yC2L/4JOwNT677hQ0rWXI5upDHOCnEw95xJ+utbEA8rvRX8re
   Fk20+he2EKJJEJkOV6nBrLzRBg/+88hVFAnVPVHxZdkTYIW2JSdX8J63o
   iw0Ieu/kWqNlm3GKzdqVfXDzL/QOeBxdkbt8PITniersBlpOd5YvljebC
   UBQfwP4ms9pMoagQtj3aW339lDVRdd+PZsRyMLkCxEhO4fpAl4TkN2baX
   HRlAdyJZTpXX1dZ1QI9P3r6gyvuAcpX2xDFPTpEle/5kUA5I6Sv051p4C
   L/qKajNkL99oVLcp5SewPD4GbcB2gXWQu8MPdUBLscgc+9exVp0YPHSHV
   A==;
X-CSE-ConnectionGUID: SGhvSxiBRPG4zNhZVTxIfg==
X-CSE-MsgGUID: Kx+t+QjCQMmjMutpeT1n2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83254044"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83254044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:17:18 -0800
X-CSE-ConnectionGUID: 0cUjgNR4TXuzQv3oawQslg==
X-CSE-MsgGUID: NxGCqbDzTCqX+JNuWAbjHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211462284"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2026 19:17:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpeFW-00000000oZg-1Bda;
	Tue, 10 Feb 2026 03:17:14 +0000
Date: Tue, 10 Feb 2026 11:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 fs/bcachefs/vfs/fs.c:626:1-7: preceding lock on line 559
Message-ID: <202602101108.St92u6VJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101108.St92u6VJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602101108.St92u6VJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/vfs/fs.c:626:1-7: preceding lock on line 559

vim +626 fs/bcachefs/vfs/fs.c

1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  522  
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  523  struct bch_inode_info *
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  524  __bch2_create(struct mnt_idmap *idmap,
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  525  	      struct bch_inode_info *dir, struct dentry *dentry,
42d237320e9817 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  526  	      umode_t mode, dev_t rdev, subvol_inum snapshot_src,
42d237320e9817 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  527  	      unsigned flags)
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  528  {
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  529  	struct bch_fs *c = dir->v.i_sb->s_fs_info;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  530  	struct bch_inode_unpacked dir_u;
a91bc5e50558fd fs/bcachefs/fs.c Kent Overstreet 2024-01-25  531  	struct bch_inode_info *inode;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  532  	struct bch_inode_unpacked inode_u;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  533  	struct posix_acl *default_acl = NULL, *acl = NULL;
284ae18c1d7aa4 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  534  	subvol_inum inum;
9ca4853b98af5f fs/bcachefs/fs.c Kent Overstreet 2021-10-27  535  	struct bch_subvolume subvol;
73ab6f356db737 fs/bcachefs/fs.c Kent Overstreet 2018-07-23  536  	u64 journal_seq = 0;
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  537  	kuid_t kuid;
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  538  	kgid_t kgid;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  539  	int ret;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  540  
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  541  	/*
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  542  	 * preallocate acls + vfs inode before btree transaction, so that
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  543  	 * nothing can fail after the transaction succeeds:
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  544  	 */
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  545  	ret = posix_acl_create(&dir->v, &mode, &default_acl, &acl);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  546  	if (ret)
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  547  		return ERR_PTR(ret);
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  548  
9897713fe1077c fs/bcachefs/fs.c Michal Hocko    2024-09-26  549  	inode = __bch2_new_inode(c, GFP_NOFS);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  550  	if (unlikely(!inode)) {
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  551  		posix_acl_release(default_acl);
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  552  		posix_acl_release(acl);
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  553  		return ERR_PTR(-ENOMEM);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  554  	}
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  555  
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  556  	bch2_inode_init_early(c, &inode_u);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  557  
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  558  	if (!(flags & BCH_CREATE_TMPFILE))
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16 @559  		mutex_lock(&dir->ei_update_lock);
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  560  	/*
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  561  	 * posix_acl_create() calls get_acl -> btree transaction, don't start
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  562  	 * ours until after, ei->update_lock must also be taken first:
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  563  	 */
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  564  	CLASS(btree_trans, trans)(c);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  565  retry:
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  566  	bch2_trans_begin(trans);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  567  
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  568  	kuid = mapped_fsuid(idmap, i_user_ns(&dir->v));
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  569  	kgid = mapped_fsgid(idmap, i_user_ns(&dir->v));
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  570  	ret   = bch2_subvol_is_ro_trans(trans, dir->ei_inum.subvol) ?:
0d72ab35a925d6 fs/bcachefs/fs.c Kent Overstreet 2023-12-29  571  		bch2_create_trans(trans,
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  572  				  inode_inum(dir), &dir_u, &inode_u,
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  573  				  !(flags & BCH_CREATE_TMPFILE)
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  574  				  ? &dentry->d_name : NULL,
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  575  				  from_kuid(i_user_ns(&dir->v), kuid),
c24adfa0dfc275 fs/bcachefs/fs.c Hongbo Li       2024-08-24  576  				  from_kgid(i_user_ns(&dir->v), kgid),
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  577  				  mode, rdev,
42d237320e9817 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  578  				  default_acl, acl, snapshot_src, flags) ?:
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  579  		bch2_quota_acct(c, bch_qid(&inode_u), Q_INO, 1,
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  580  				KEY_TYPE_QUOTA_PREALLOC);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  581  	if (unlikely(ret))
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  582  		goto err_before_quota;
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  583  
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  584  	inum.subvol = inode_u.bi_subvol ?: dir->ei_inum.subvol;
9ca4853b98af5f fs/bcachefs/fs.c Kent Overstreet 2021-10-27  585  	inum.inum = inode_u.bi_inum;
9ca4853b98af5f fs/bcachefs/fs.c Kent Overstreet 2021-10-27  586  
ce70157112482c fs/bcachefs/fs.c Kent Overstreet 2024-12-04  587  	ret   = bch2_subvolume_get(trans, inum.subvol, true, &subvol) ?:
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  588  		bch2_trans_commit(trans, NULL, &journal_seq, 0);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  589  	if (unlikely(ret)) {
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  590  		bch2_quota_acct(c, bch_qid(&inode_u), Q_INO, -1,
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  591  				KEY_TYPE_QUOTA_WARN);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  592  err_before_quota:
549d173c1bd9b5 fs/bcachefs/fs.c Kent Overstreet 2022-07-17  593  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  594  			goto retry;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  595  		goto err_trans;
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  596  	}
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  597  
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  598  	if (!(flags & BCH_CREATE_TMPFILE)) {
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  599  		bch2_inode_update_after_write(trans, dir, &dir_u,
e614a6c52d32c9 fs/bcachefs/fs.c Hongbo Li       2025-01-07  600  					      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  601  		mutex_unlock(&dir->ei_update_lock);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  602  	}
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  603  
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  604  	bch2_vfs_inode_init(trans, inum, inode, &inode_u, &subvol);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  605  
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  606  	set_cached_acl(&inode->v, ACL_TYPE_ACCESS, acl);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  607  	set_cached_acl(&inode->v, ACL_TYPE_DEFAULT, default_acl);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  608  
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  609  	/*
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  610  	 * we must insert the new inode into the inode cache before calling
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  611  	 * bch2_trans_exit() and dropping locks, else we could race with another
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  612  	 * thread pulling the inode in and modifying it:
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  613  	 *
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  614  	 * also, calling bch2_inode_hash_insert() without passing in the
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  615  	 * transaction object is sketchy - if we could ever end up in
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  616  	 * __wait_on_freeing_inode(), we'd risk deadlock.
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  617  	 *
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  618  	 * But that shouldn't be possible, since we still have the inode locked
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  619  	 * that we just created, and we _really_ can't take a transaction
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  620  	 * restart here.
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  621  	 */
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  622  	inode = bch2_inode_hash_insert(c, NULL, inode);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  623  err:
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  624  	posix_acl_release(default_acl);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  625  	posix_acl_release(acl);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16 @626  	return inode;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  627  err_trans:
6fed42bb7750e2 fs/bcachefs/fs.c Kent Overstreet 2021-03-16  628  	if (!(flags & BCH_CREATE_TMPFILE))
19ee5f2ac4b346 fs/bcachefs/fs.c Kent Overstreet 2018-07-20  629  		mutex_unlock(&dir->ei_update_lock);
19ee5f2ac4b346 fs/bcachefs/fs.c Kent Overstreet 2018-07-20  630  
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  631  	make_bad_inode(&inode->v);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  632  	iput(&inode->v);
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  633  	inode = ERR_PTR(ret);
9638574229e3ae fs/bcachefs/fs.c Kent Overstreet 2019-10-02  634  	goto err;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  635  }
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  636  

:::::: The code at line 626 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
