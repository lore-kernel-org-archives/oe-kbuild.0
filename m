Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D61944E
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 01:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIarAs6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705108652; x=1736644652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEMiYgJEzDYP1x2dS+QoOWefLt0hZTE2uYR5coTVMFY=;
  b=KIarAs6VZ7gjkv0UIjCGAArtMd5c1k4zdkaKgCibdDtCdTsPrrlTmPvb
   3WSUCeHjB/yQBw6poW43mM4G86r6aUOvP3ii8VmzpTwrYIMu/avp37a/G
   mngkXHv8aElFaBfdvHaA795FotO1iKegGoM2poTu1ybSzdoK3fSs6Lq5H
   23mWfeRDXUIaXAIYFbqTmhPK2Qt495Qw4MDCiY0t6W9TP9ewyGJsliOhP
   QpvpV11lZFrWTRHEqKY15+HKg1ymURRY/g26eDLhNgO81ik32eovpHKCI
   LJUhqsAA4XY0NH0l3cFPgWtN/gAKFNWGC5IjV1qifTHgQYvYU3qyOEZp5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="389777259"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="389777259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 17:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1030096753"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="1030096753"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jan 2024 17:17:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOSeK-0009xM-2n;
	Sat, 13 Jan 2024 01:17:25 +0000
Date: Sat, 13 Jan 2024 09:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.7/zen-sauce 8/31] fs/bcachefs/fs-common.c:501:1: warning: the
 frame size of 1064 bytes is larger than 1024 bytes
Message-ID: <202401130945.9aSSS5wY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 47715d438aa7c28ae732ab8cce27b832e93b6b51 [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-002-20240113 (https://download.01.org/0day-ci/archive/20240113/202401130945.9aSSS5wY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130945.9aSSS5wY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401130945.9aSSS5wY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs-common.c: In function 'bch2_rename_trans':
>> fs/bcachefs/fs-common.c:501:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     501 | }
         | ^


vim +501 fs/bcachefs/fs-common.c

9638574229e3ae Kent Overstreet 2019-10-02  355  
9638574229e3ae Kent Overstreet 2019-10-02  356  int bch2_rename_trans(struct btree_trans *trans,
6fed42bb7750e2 Kent Overstreet 2021-03-16  357  		      subvol_inum src_dir, struct bch_inode_unpacked *src_dir_u,
6fed42bb7750e2 Kent Overstreet 2021-03-16  358  		      subvol_inum dst_dir, struct bch_inode_unpacked *dst_dir_u,
9638574229e3ae Kent Overstreet 2019-10-02  359  		      struct bch_inode_unpacked *src_inode_u,
9638574229e3ae Kent Overstreet 2019-10-02  360  		      struct bch_inode_unpacked *dst_inode_u,
9638574229e3ae Kent Overstreet 2019-10-02  361  		      const struct qstr *src_name,
9638574229e3ae Kent Overstreet 2019-10-02  362  		      const struct qstr *dst_name,
9638574229e3ae Kent Overstreet 2019-10-02  363  		      enum bch_rename_mode mode)
9638574229e3ae Kent Overstreet 2019-10-02  364  {
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  365  	struct bch_fs *c = trans->c;
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  366  	struct btree_iter src_dir_iter = { NULL };
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  367  	struct btree_iter dst_dir_iter = { NULL };
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  368  	struct btree_iter src_inode_iter = { NULL };
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  369  	struct btree_iter dst_inode_iter = { NULL };
9638574229e3ae Kent Overstreet 2019-10-02  370  	struct bch_hash_info src_hash, dst_hash;
6fed42bb7750e2 Kent Overstreet 2021-03-16  371  	subvol_inum src_inum, dst_inum;
6fed42bb7750e2 Kent Overstreet 2021-03-16  372  	u64 src_offset, dst_offset;
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  373  	u64 now = bch2_current_time(c);
9638574229e3ae Kent Overstreet 2019-10-02  374  	int ret;
9638574229e3ae Kent Overstreet 2019-10-02  375  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  376  	ret = bch2_inode_peek(trans, &src_dir_iter, src_dir_u, src_dir,
9638574229e3ae Kent Overstreet 2019-10-02  377  			      BTREE_ITER_INTENT);
8b53852d0a80ec Kent Overstreet 2020-02-18  378  	if (ret)
8b53852d0a80ec Kent Overstreet 2020-02-18  379  		goto err;
9638574229e3ae Kent Overstreet 2019-10-02  380  
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  381  	src_hash = bch2_hash_info_init(c, src_dir_u);
9638574229e3ae Kent Overstreet 2019-10-02  382  
6fed42bb7750e2 Kent Overstreet 2021-03-16  383  	if (dst_dir.inum	!= src_dir.inum ||
6fed42bb7750e2 Kent Overstreet 2021-03-16  384  	    dst_dir.subvol	!= src_dir.subvol) {
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  385  		ret = bch2_inode_peek(trans, &dst_dir_iter, dst_dir_u, dst_dir,
9638574229e3ae Kent Overstreet 2019-10-02  386  				      BTREE_ITER_INTENT);
8b53852d0a80ec Kent Overstreet 2020-02-18  387  		if (ret)
8b53852d0a80ec Kent Overstreet 2020-02-18  388  			goto err;
9638574229e3ae Kent Overstreet 2019-10-02  389  
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  390  		dst_hash = bch2_hash_info_init(c, dst_dir_u);
9638574229e3ae Kent Overstreet 2019-10-02  391  	} else {
9638574229e3ae Kent Overstreet 2019-10-02  392  		dst_dir_u = src_dir_u;
9638574229e3ae Kent Overstreet 2019-10-02  393  		dst_hash = src_hash;
9638574229e3ae Kent Overstreet 2019-10-02  394  	}
9638574229e3ae Kent Overstreet 2019-10-02  395  
9638574229e3ae Kent Overstreet 2019-10-02  396  	ret = bch2_dirent_rename(trans,
9638574229e3ae Kent Overstreet 2019-10-02  397  				 src_dir, &src_hash,
9638574229e3ae Kent Overstreet 2019-10-02  398  				 dst_dir, &dst_hash,
6fed42bb7750e2 Kent Overstreet 2021-03-16  399  				 src_name, &src_inum, &src_offset,
6fed42bb7750e2 Kent Overstreet 2021-03-16  400  				 dst_name, &dst_inum, &dst_offset,
9638574229e3ae Kent Overstreet 2019-10-02  401  				 mode);
9638574229e3ae Kent Overstreet 2019-10-02  402  	if (ret)
8b53852d0a80ec Kent Overstreet 2020-02-18  403  		goto err;
9638574229e3ae Kent Overstreet 2019-10-02  404  
6fed42bb7750e2 Kent Overstreet 2021-03-16  405  	ret = bch2_inode_peek(trans, &src_inode_iter, src_inode_u, src_inum,
9638574229e3ae Kent Overstreet 2019-10-02  406  			      BTREE_ITER_INTENT);
8b53852d0a80ec Kent Overstreet 2020-02-18  407  	if (ret)
8b53852d0a80ec Kent Overstreet 2020-02-18  408  		goto err;
9638574229e3ae Kent Overstreet 2019-10-02  409  
6fed42bb7750e2 Kent Overstreet 2021-03-16  410  	if (dst_inum.inum) {
6fed42bb7750e2 Kent Overstreet 2021-03-16  411  		ret = bch2_inode_peek(trans, &dst_inode_iter, dst_inode_u, dst_inum,
9638574229e3ae Kent Overstreet 2019-10-02  412  				      BTREE_ITER_INTENT);
8b53852d0a80ec Kent Overstreet 2020-02-18  413  		if (ret)
8b53852d0a80ec Kent Overstreet 2020-02-18  414  			goto err;
9638574229e3ae Kent Overstreet 2019-10-02  415  	}
9638574229e3ae Kent Overstreet 2019-10-02  416  
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  417  	if (c->sb.version >= bcachefs_metadata_version_inode_backpointers) {
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  418  		src_inode_u->bi_dir		= dst_dir_u->bi_inum;
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  419  		src_inode_u->bi_dir_offset	= dst_offset;
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  420  
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  421  		if (mode == BCH_RENAME_EXCHANGE) {
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  422  			dst_inode_u->bi_dir		= src_dir_u->bi_inum;
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  423  			dst_inode_u->bi_dir_offset	= src_offset;
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  424  		}
16ac8c9523a274 Kent Overstreet 2021-05-20  425  
16ac8c9523a274 Kent Overstreet 2021-05-20  426  		if (mode == BCH_RENAME_OVERWRITE &&
16ac8c9523a274 Kent Overstreet 2021-05-20  427  		    dst_inode_u->bi_dir		== dst_dir_u->bi_inum &&
16ac8c9523a274 Kent Overstreet 2021-05-20  428  		    dst_inode_u->bi_dir_offset	== src_offset) {
16ac8c9523a274 Kent Overstreet 2021-05-20  429  			dst_inode_u->bi_dir		= 0;
16ac8c9523a274 Kent Overstreet 2021-05-20  430  			dst_inode_u->bi_dir_offset	= 0;
16ac8c9523a274 Kent Overstreet 2021-05-20  431  		}
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  432  	}
ab2a29ccffd0e9 Kent Overstreet 2021-03-02  433  
9638574229e3ae Kent Overstreet 2019-10-02  434  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae Kent Overstreet 2019-10-02  435  		if (S_ISDIR(src_inode_u->bi_mode) !=
8b53852d0a80ec Kent Overstreet 2020-02-18  436  		    S_ISDIR(dst_inode_u->bi_mode)) {
8b53852d0a80ec Kent Overstreet 2020-02-18  437  			ret = -ENOTDIR;
8b53852d0a80ec Kent Overstreet 2020-02-18  438  			goto err;
8b53852d0a80ec Kent Overstreet 2020-02-18  439  		}
9638574229e3ae Kent Overstreet 2019-10-02  440  
9638574229e3ae Kent Overstreet 2019-10-02  441  		if (S_ISDIR(dst_inode_u->bi_mode) &&
6fed42bb7750e2 Kent Overstreet 2021-03-16  442  		    bch2_empty_dir_trans(trans, dst_inum)) {
8b53852d0a80ec Kent Overstreet 2020-02-18  443  			ret = -ENOTEMPTY;
8b53852d0a80ec Kent Overstreet 2020-02-18  444  			goto err;
8b53852d0a80ec Kent Overstreet 2020-02-18  445  		}
9638574229e3ae Kent Overstreet 2019-10-02  446  	}
9638574229e3ae Kent Overstreet 2019-10-02  447  
9638574229e3ae Kent Overstreet 2019-10-02  448  	if (bch2_reinherit_attrs(src_inode_u, dst_dir_u) &&
8b53852d0a80ec Kent Overstreet 2020-02-18  449  	    S_ISDIR(src_inode_u->bi_mode)) {
8b53852d0a80ec Kent Overstreet 2020-02-18  450  		ret = -EXDEV;
8b53852d0a80ec Kent Overstreet 2020-02-18  451  		goto err;
8b53852d0a80ec Kent Overstreet 2020-02-18  452  	}
9638574229e3ae Kent Overstreet 2019-10-02  453  
9638574229e3ae Kent Overstreet 2019-10-02  454  	if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae Kent Overstreet 2019-10-02  455  	    bch2_reinherit_attrs(dst_inode_u, src_dir_u) &&
8b53852d0a80ec Kent Overstreet 2020-02-18  456  	    S_ISDIR(dst_inode_u->bi_mode)) {
8b53852d0a80ec Kent Overstreet 2020-02-18  457  		ret = -EXDEV;
8b53852d0a80ec Kent Overstreet 2020-02-18  458  		goto err;
8b53852d0a80ec Kent Overstreet 2020-02-18  459  	}
9638574229e3ae Kent Overstreet 2019-10-02  460  
42d237320e9817 Kent Overstreet 2021-03-16  461  	if (is_subdir_for_nlink(src_inode_u)) {
9638574229e3ae Kent Overstreet 2019-10-02  462  		src_dir_u->bi_nlink--;
9638574229e3ae Kent Overstreet 2019-10-02  463  		dst_dir_u->bi_nlink++;
9638574229e3ae Kent Overstreet 2019-10-02  464  	}
9638574229e3ae Kent Overstreet 2019-10-02  465  
42d237320e9817 Kent Overstreet 2021-03-16  466  	if (dst_inum.inum && is_subdir_for_nlink(dst_inode_u)) {
9638574229e3ae Kent Overstreet 2019-10-02  467  		dst_dir_u->bi_nlink--;
9638574229e3ae Kent Overstreet 2019-10-02  468  		src_dir_u->bi_nlink += mode == BCH_RENAME_EXCHANGE;
9638574229e3ae Kent Overstreet 2019-10-02  469  	}
9638574229e3ae Kent Overstreet 2019-10-02  470  
9638574229e3ae Kent Overstreet 2019-10-02  471  	if (mode == BCH_RENAME_OVERWRITE)
962ad1a7666944 Kent Overstreet 2022-06-23  472  		bch2_inode_nlink_dec(trans, dst_inode_u);
9638574229e3ae Kent Overstreet 2019-10-02  473  
9638574229e3ae Kent Overstreet 2019-10-02  474  	src_dir_u->bi_mtime		= now;
9638574229e3ae Kent Overstreet 2019-10-02  475  	src_dir_u->bi_ctime		= now;
9638574229e3ae Kent Overstreet 2019-10-02  476  
6fed42bb7750e2 Kent Overstreet 2021-03-16  477  	if (src_dir.inum != dst_dir.inum) {
9638574229e3ae Kent Overstreet 2019-10-02  478  		dst_dir_u->bi_mtime	= now;
9638574229e3ae Kent Overstreet 2019-10-02  479  		dst_dir_u->bi_ctime	= now;
9638574229e3ae Kent Overstreet 2019-10-02  480  	}
9638574229e3ae Kent Overstreet 2019-10-02  481  
9638574229e3ae Kent Overstreet 2019-10-02  482  	src_inode_u->bi_ctime		= now;
9638574229e3ae Kent Overstreet 2019-10-02  483  
6fed42bb7750e2 Kent Overstreet 2021-03-16  484  	if (dst_inum.inum)
9638574229e3ae Kent Overstreet 2019-10-02  485  		dst_inode_u->bi_ctime	= now;
9638574229e3ae Kent Overstreet 2019-10-02  486  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  487  	ret =   bch2_inode_write(trans, &src_dir_iter, src_dir_u) ?:
6fed42bb7750e2 Kent Overstreet 2021-03-16  488  		(src_dir.inum != dst_dir.inum
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  489  		 ? bch2_inode_write(trans, &dst_dir_iter, dst_dir_u)
9638574229e3ae Kent Overstreet 2019-10-02  490  		 : 0) ?:
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  491  		bch2_inode_write(trans, &src_inode_iter, src_inode_u) ?:
6fed42bb7750e2 Kent Overstreet 2021-03-16  492  		(dst_inum.inum
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  493  		 ? bch2_inode_write(trans, &dst_inode_iter, dst_inode_u)
9638574229e3ae Kent Overstreet 2019-10-02  494  		 : 0);
8b53852d0a80ec Kent Overstreet 2020-02-18  495  err:
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  496  	bch2_trans_iter_exit(trans, &dst_inode_iter);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  497  	bch2_trans_iter_exit(trans, &src_inode_iter);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  498  	bch2_trans_iter_exit(trans, &dst_dir_iter);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  499  	bch2_trans_iter_exit(trans, &src_dir_iter);
8b53852d0a80ec Kent Overstreet 2020-02-18  500  	return ret;
9638574229e3ae Kent Overstreet 2019-10-02 @501  }

:::::: The code at line 501 was first introduced by commit
:::::: 9638574229e3ae0175a46a63431149746c777b3a bcachefs: Factor out fs-common.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
