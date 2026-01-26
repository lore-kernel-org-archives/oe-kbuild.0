Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884410F2
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468499; cv=none; b=Bp4ZVPy4E94pV0L1PrHeqf1WUFrd8VJx1JKkFDgrazWcYJoAstjpx5Dk0ePrnVghkFM6+W40VZhhwiJYKpAK5VV9sntbXkYHbGE/0Q82JQzaWniP7luHV6dZBAsxtL3vgWR6cEBiqerZAz+rSvSsa9IywzF9Bbs5+eSs7Pfx1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468499; c=relaxed/simple;
	bh=nkgkc3lGRSgg3X44wG10ze5I3UsYh+4eROgW9Gshruk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QEeeM48oMMYdRZcs7YFn/Bwk2iEdH1TDkbCk91MBQJNbdCT8VNiYK16JKSecEXKZbFRawAIyytT0+vdAPIWfglbPalb0DJCR7xJ5LfGrdOm0ya4v4qUvQok+/YD4nw9o6y6Hb/355dGGnMymWrGdsNfrJAh/ji1xhtCUqfUW0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eP1+4+tu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eP1+4+tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769468499; x=1801004499;
  h=date:from:to:cc:subject:message-id;
  bh=nkgkc3lGRSgg3X44wG10ze5I3UsYh+4eROgW9Gshruk=;
  b=eP1+4+tus2sonr/Qr2QStO/IlrOK+H1EJ3iz2bBkvU2odTlRszbxp4nk
   4BFAwVgBeZTCCdbYHYmAnws43AkmRVXmj52sOYBeAwXphrNJdFZk/mAG/
   Z8dYtq8KIGetezkgREPVqNFw+63u42Vso0dgFDWgIp2XW/JRsnAP+wH3Y
   x15IkU0WlmSeOBQfh95C8UoA//SaIDNis/ov7WtACFaAVndcGbrk5EpfV
   VhVtDf+XtngJHrmL2oArjRqx8TwdoRn6oGVcjnU2ASuDCRf4uMDkjjQ6e
   BHEZswJjo6wcXkiHABRyU4WNicNwSFguR06M2o1RPEg84fJJVjWKzPrOh
   Q==;
X-CSE-ConnectionGUID: lLi1k1QDRCeSZqLVJMkK/A==
X-CSE-MsgGUID: YDCcxCEEQnqF4HEGE64alg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70744809"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70744809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 15:01:38 -0800
X-CSE-ConnectionGUID: gEGlan3jRbS8likqdKXK+g==
X-CSE-MsgGUID: WT4UoffiQe+QmNSEwsXWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208043375"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jan 2026 15:01:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkVaQ-00000000Xl0-2g7Z;
	Mon, 26 Jan 2026 23:01:34 +0000
Date: Tue, 27 Jan 2026 07:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 fs/bcachefs/vfs/fs.c:360 bch2_inode_hash_find() warn: inconsistent returns
 '&inode->v.i_lock'.
Message-ID: <202601270616.M4JJ7rmO-lkp@intel.com>
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
:::::: commit date: 3 months ago
config: parisc-randconfig-r071-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270616.M4JJ7rmO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601270616.M4JJ7rmO-lkp@intel.com/

smatch warnings:
fs/bcachefs/vfs/fs.c:360 bch2_inode_hash_find() warn: inconsistent returns '&inode->v.i_lock'.

vim +360 fs/bcachefs/vfs/fs.c

112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  332  
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  333  static struct bch_inode_info *bch2_inode_hash_find(struct bch_fs *c, struct btree_trans *trans,
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  334  						   subvol_inum inum)
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  335  {
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  336  	struct bch_inode_info *inode;
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  337  repeat:
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  338  	inode = __bch2_inode_hash_find(c, inum);
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  339  	if (inode) {
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  340  		spin_lock(&inode->v.i_lock);
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  341  		if (!test_bit(EI_INODE_HASHED, &inode->ei_flags)) {
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  342  			spin_unlock(&inode->v.i_lock);
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  343  			return NULL;
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  344  		}
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  345  		if ((inode->v.i_state & (I_FREEING|I_WILL_FREE))) {
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  346  			if (!trans) {
6b63a948a73ba3 fs/bcachefs/fs.c Kent Overstreet 2024-10-04  347  				__wait_on_freeing_inode(c, inode, inum);
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  348  			} else {
83ecd1b122f49c fs/bcachefs/fs.c Kent Overstreet 2025-04-13  349  				int ret = drop_locks_do(trans,
83ecd1b122f49c fs/bcachefs/fs.c Kent Overstreet 2025-04-13  350  						(__wait_on_freeing_inode(c, inode, inum), 0));
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  351  				if (ret)
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  352  					return ERR_PTR(ret);
54f7702466b3a1 fs/bcachefs/fs.c Kent Overstreet 2024-08-16  353  			}
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  354  			goto repeat;
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  355  		}
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  356  		__iget(&inode->v);
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  357  		spin_unlock(&inode->v.i_lock);
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  358  	}
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  359  
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08 @360  	return inode;
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  361  }
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  362  

:::::: The code at line 360 was first introduced by commit
:::::: 112d21fd1a122f778c383aa44d5448f4da9518c3 bcachefs: switch to rhashtable for vfs inodes hash

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
