Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA777282F4
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732633346; cv=none; b=HYuVqv7j1yg8QOeDgW3u/wsMvHo0KA7lx3x36nNToup6r8cGPFB5TkohcH9lP7j4aIfV/uM5fTlIKrd2xY0cZOLDVFbZJJleC5LT+X+mxKQU75evSlV4Xl+c5QySphm5QnNK/gvjUCCAF/jAXdnbQTabOIjqkN0fvuVl7B/VwGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732633346; c=relaxed/simple;
	bh=Y0Mg9RPBqn4I0gxunaliuV4es4dXzpFKBEWABL9zijo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcqUJkkP+OCJhh7G6cUgraVpsA+8No4xFGziAhtfjdlhIzbcrM0gaf1yo72SyMW8vNqwWExc57FlGfTl6CmhgLiuvVw+SPlagilMt6krjN8mcFxlGA5d4r52ukpoEoTmYbISq103/mFvdz3XZL6oyOvpBDSvRJPEzO2DODkdAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiPvT0ra; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiPvT0ra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732633344; x=1764169344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y0Mg9RPBqn4I0gxunaliuV4es4dXzpFKBEWABL9zijo=;
  b=jiPvT0raFbHdwWFNdHqP7fh88TOUCqqhYigNs+Y/cpE6it0EYBs7E/jN
   8+vl4CYNKMs17PgbHHNAAvRcKuDtr6s7g5eba01EFXpKuyCEvWcaWhdZ2
   Bu2UTDFjV8uUQZ/6GRBBZGmwCZ36CSwK3MY8hNadkLjOReadzJ3nVqHoi
   o4E4i4LNtThfjpuLknJOqSY5blsc5/xtbyikjipDWHkVbgFuZryw+lN5g
   eODJ2M+CEiW46RH3Uj1Tr2liQUbWQhStk5k7LPxioByATdzxYJ8eC6Kfz
   stoIGfiVTdqVJbL5fH4tf65rnCUcds2qBVxLwoO3/0M7rO5FU2/AEeMDP
   g==;
X-CSE-ConnectionGUID: thbYIUEpSLSvWkcwWJTeAg==
X-CSE-MsgGUID: 0cnylx/ER52cgEDo+Au2Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43864551"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43864551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:02:23 -0800
X-CSE-ConnectionGUID: ZsBnjGQaRCa5SvDIReOtFA==
X-CSE-MsgGUID: 9oEoKqWiQY6+6K5aIhkC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="92048147"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2024 07:02:21 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFx51-0007Lh-0P;
	Tue, 26 Nov 2024 15:02:19 +0000
Date: Tue, 26 Nov 2024 23:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:inode_hash_find_debug 123/124]
 fs/bcachefs/fs.c:398 bch2_inode_hash_insert() warn: statement has no effect
 3
Message-ID: <202411262205.TbVyd9Tj-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs inode_hash_find_debug
head:   942bfc10d286a7fe82d8064250cf0341c1f86608
commit: 7f0ae9ab2f5f2ea12951f1d5ff04ff35bbee8d3f [123/124] bcachefs: Debug counters for bch2_inode_hash_find()
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r071-20241124 (https://download.01.org/0day-ci/archive/20241126/202411262205.TbVyd9Tj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411262205.TbVyd9Tj-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs.c:398 bch2_inode_hash_insert() warn: statement has no effect 3

vim +398 fs/bcachefs/fs.c

16005147cca41a Kent Overstreet 2024-09-08  387  
54f7702466b3a1 Kent Overstreet 2024-08-16  388  static struct bch_inode_info *bch2_inode_hash_insert(struct bch_fs *c,
54f7702466b3a1 Kent Overstreet 2024-08-16  389  						     struct btree_trans *trans,
54f7702466b3a1 Kent Overstreet 2024-08-16  390  						     struct bch_inode_info *inode)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  391  {
112d21fd1a122f Kent Overstreet 2024-06-08  392  	struct bch_inode_info *old = inode;
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  393  	struct inode_hash_find_counters s = {};
112d21fd1a122f Kent Overstreet 2024-06-08  394  
112d21fd1a122f Kent Overstreet 2024-06-08  395  	set_bit(EI_INODE_HASHED, &inode->ei_flags);
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  396  	smp_mb__after_atomic();
112d21fd1a122f Kent Overstreet 2024-06-08  397  retry:
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22 @398  	int ret = rhashtable_lookup_insert_key(&c->vfs_inodes_table,
9d86178782a25f Kent Overstreet 2024-10-02  399  					&inode->ei_inum,
112d21fd1a122f Kent Overstreet 2024-06-08  400  					&inode->hash,
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  401  					bch2_vfs_inodes_params);
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  402  	if (unlikely(ret)) {
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  403  		pr_info("%s", bch2_err_str(ret));
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  404  		old = bch2_inode_hash_find(c, trans, inode->ei_inum, &s);
112d21fd1a122f Kent Overstreet 2024-06-08  405  		if (!old)
112d21fd1a122f Kent Overstreet 2024-06-08  406  			goto retry;
112d21fd1a122f Kent Overstreet 2024-06-08  407  
112d21fd1a122f Kent Overstreet 2024-06-08  408  		clear_bit(EI_INODE_HASHED, &inode->ei_flags);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  409  
dd9086487c1bb3 Kent Overstreet 2024-06-20  410  		/*
dd9086487c1bb3 Kent Overstreet 2024-06-20  411  		 * bcachefs doesn't use I_NEW; we have no use for it since we
dd9086487c1bb3 Kent Overstreet 2024-06-20  412  		 * only insert fully created inodes in the inode hash table. But
dd9086487c1bb3 Kent Overstreet 2024-06-20  413  		 * discard_new_inode() expects it to be set...
dd9086487c1bb3 Kent Overstreet 2024-06-20  414  		 */
99c87fe0f584f8 Kent Overstreet 2024-08-16  415  		inode->v.i_state |= I_NEW;
b02f973e67589c Kent Overstreet 2024-07-01  416  		/*
b02f973e67589c Kent Overstreet 2024-07-01  417  		 * We don't want bch2_evict_inode() to delete the inode on disk,
b02f973e67589c Kent Overstreet 2024-07-01  418  		 * we just raced and had another inode in cache. Normally new
b02f973e67589c Kent Overstreet 2024-07-01  419  		 * inodes don't have nlink == 0 - except tmpfiles do...
b02f973e67589c Kent Overstreet 2024-07-01  420  		 */
b02f973e67589c Kent Overstreet 2024-07-01  421  		set_nlink(&inode->v, 1);
d93ff5fa40b9db Kent Overstreet 2024-05-22  422  		discard_new_inode(&inode->v);
54f7702466b3a1 Kent Overstreet 2024-08-16  423  		return old;
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  424  	}
7f0ae9ab2f5f2e Kent Overstreet 2024-11-22  425  
112d21fd1a122f Kent Overstreet 2024-06-08  426  	inode_fake_hash(&inode->v);
112d21fd1a122f Kent Overstreet 2024-06-08  427  
112d21fd1a122f Kent Overstreet 2024-06-08  428  	inode_sb_list_add(&inode->v);
112d21fd1a122f Kent Overstreet 2024-06-08  429  
9edbcc72f6987b Kent Overstreet 2023-03-15  430  	mutex_lock(&c->vfs_inodes_lock);
9edbcc72f6987b Kent Overstreet 2023-03-15  431  	list_add(&inode->ei_vfs_inode_list, &c->vfs_inodes_list);
9edbcc72f6987b Kent Overstreet 2023-03-15  432  	mutex_unlock(&c->vfs_inodes_lock);
a91bc5e50558fd Kent Overstreet 2024-01-25  433  	return inode;
a91bc5e50558fd Kent Overstreet 2024-01-25  434  }
a91bc5e50558fd Kent Overstreet 2024-01-25  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
