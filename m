Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE763BF66E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793837; cv=none; b=jsu9HCfY1RgHZAvwJDev+6Z4Xm18OdV7307nAQCLvYnMhTK9Y9p1xT3F8yvKxVFM3IsoR+V2H2a0HYpmAocE2BlLeEpqgWNmk5ovGOioZ/XL99vIvLizHxgyRLknEQvKcacnp/CYoecsDenwZfrBAvJmxQCk5AQai7YU2w3Fc3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793837; c=relaxed/simple;
	bh=GeYjfB/1XgZrydExqtgFOwxdkEIScLMAIDvydnk3PIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hTZphArnHXF40vU7Y4LCHFQxBLf4POXNnJaru6AjnFWGdxglqbX0Ys2x/xn6V+wUKroSWnXQGKsm/TPOdQAHML8jtmBE2hEwbeXsZtOeAo3PZipLpysK8FDsWJ54wv8+mAn6CKgnjP8drgmyOIQkCSAavQKPgFNk0IflQMCnQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDKNniKq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDKNniKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793835; x=1810329835;
  h=date:from:to:cc:subject:message-id;
  bh=GeYjfB/1XgZrydExqtgFOwxdkEIScLMAIDvydnk3PIE=;
  b=VDKNniKqMsr2Ec7iiV1K9QqgPW5jyg7paC69agvnYoM9ly4Xzsr4KPbC
   rk4rWPovVi59/dZ62vQuYOekPJ+IPX3QDG3n9Kaqu7OYpA6buf1qSL7kX
   3kHJMcMe+T0IhcdjjX+Yfk6Y/Q/AxlREuksJnurRneY7pkwEiQ43cSlTd
   yyHvoq/LIsHI2Ck35oUDnnGjGzijD3mh6RzCts0Ul2542bEu6ufFJ03bR
   X9FPfOWCliXWHFvAjnLvJgx7QoZoFGrQgzYHDR5WwRG6jZ1Q77tZ+5hc4
   WZePzLQknLHswn9gsd6buF428catHycW1yqWT59/njPOfvwRskarx4g+r
   g==;
X-CSE-ConnectionGUID: w2uYfHlRSn2DClHM+yQvcA==
X-CSE-MsgGUID: eP2HBmbTQ8yRvO7y8KSPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603408"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603408"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: WXKAn1adR3aInw8EO8qodQ==
X-CSE-MsgGUID: kZJtHOG6THSDqNrHvluMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458963"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX3-0000000001r-0P7k;
	Thu, 14 May 2026 21:23:49 +0000
Date: Fri, 15 May 2026 04:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 fs/bcachefs/vfs/fs.c:360 bch2_inode_hash_find() warn: inconsistent returns
 '&inode->v.i_lock'.
Message-ID: <202605150441.ClakfxbR-lkp@intel.com>
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
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150441.ClakfxbR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605150441.ClakfxbR-lkp@intel.com/

smatch warnings:
fs/bcachefs/vfs/fs.c:360 bch2_inode_hash_find() warn: inconsistent returns '&inode->v.i_lock'.

vim +360 fs/bcachefs/vfs/fs.c

112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  332  
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  333  static struct bch_inode_info *bch2_inode_hash_find(struct bch_fs *c, struct btree_trans *trans,
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  334  						   subvol_inum inum)
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  335  {
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  336  	struct bch_inode_info *inode;
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  337  repeat:
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  338  	inode = __bch2_inode_hash_find(c, inum);
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  339  	if (inode) {
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  340  		spin_lock(&inode->v.i_lock);
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  341  		if (!test_bit(EI_INODE_HASHED, &inode->ei_flags)) {
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  342  			spin_unlock(&inode->v.i_lock);
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  343  			return NULL;
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  344  		}
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  345  		if ((inode->v.i_state & (I_FREEING|I_WILL_FREE))) {
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  346  			if (!trans) {
6b63a948a73ba3d fs/bcachefs/fs.c Kent Overstreet 2024-10-04  347  				__wait_on_freeing_inode(c, inode, inum);
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  348  			} else {
83ecd1b122f49c9 fs/bcachefs/fs.c Kent Overstreet 2025-04-13  349  				int ret = drop_locks_do(trans,
83ecd1b122f49c9 fs/bcachefs/fs.c Kent Overstreet 2025-04-13  350  						(__wait_on_freeing_inode(c, inode, inum), 0));
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  351  				if (ret)
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  352  					return ERR_PTR(ret);
54f7702466b3a10 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  353  			}
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  354  			goto repeat;
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  355  		}
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  356  		__iget(&inode->v);
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  357  		spin_unlock(&inode->v.i_lock);
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  358  	}
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  359  
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08 @360  	return inode;
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  361  }
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet 2024-06-08  362  

:::::: The code at line 360 was first introduced by commit
:::::: 112d21fd1a122f778c383aa44d5448f4da9518c3 bcachefs: switch to rhashtable for vfs inodes hash

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
