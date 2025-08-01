Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0F188CC9
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 18:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754072559; cv=none; b=MpEX6Xh7XT2W0DxI/QyVMNBe8N5eFCJx1ZdNksFOy2BNDihw1sNb7LhBfLDzc9z1szVeNm1s/Yvb0ZGjD/2SjqsJ86P7kCoeylSDUWgde5sYrmR5PGGv6cEjIAgy7WQsIyIlVO/VovyW9NUrW55/YV+Kv59SYf+QlU3GNO4ZWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754072559; c=relaxed/simple;
	bh=f9TESkemF/ynfW1bN8Pn6xbPiOWTvszj+rhWk2tWJXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9Ac4A5CYGCgus5/X2uTXF0EkjFcfHl+JS0fhcD6eD5VpWJluc8vBRfQnLMfgfiak4KGz+24RuMvbvhnYduk1YTl6YU1sf5is1/3GyMnUrBhr0lS+dmtrln5D3yPF7bTrWBG5lUU0hRqybc5SkYdOQyXVf52TTmvazWRPKejuSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSYIxHNN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSYIxHNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754072557; x=1785608557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f9TESkemF/ynfW1bN8Pn6xbPiOWTvszj+rhWk2tWJXE=;
  b=cSYIxHNN6nU/9Ji4ggRA8H0QcN18JImfuLMRBuAga6rv3bS2QgO/Ss6S
   15X6Ue5ZxIAFtvRTvjVxhVlptE8NeIePx7AIr+aMD0+Zi8/XD2Ihqz231
   FTaPiat2ej/VU6J5JcF4qJPn6wTx6ALhnF1jsaUOVCT/G2n7/ah7DLq0E
   zVe6DMC32e+Rt3c0SJI7fgzy/Bb/Iw5KYenHMzTOyEcapWuxuYNCqbJq8
   heyBRd6eWhi4vHAveFMK8R1PR1drBNv/4iM+risWsiOKLOAChZXys3O8e
   6UxFEGCquQScp2ZI85OwV8FAyXdBqY75AF2K8yxjYAfxjFvcIp9q2lFmd
   Q==;
X-CSE-ConnectionGUID: csDplwRkQraTenUrffaiAA==
X-CSE-MsgGUID: ulYGxdyLSzOBiShvamEOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66699470"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="66699470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 11:22:35 -0700
X-CSE-ConnectionGUID: RtNBAVAXQ1i32UiT1MpRsA==
X-CSE-MsgGUID: 9xhAX4e1SG6R0gNQGzFk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163324820"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Aug 2025 11:22:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhuOl-0004ps-1u;
	Fri, 01 Aug 2025 18:22:31 +0000
Date: Sat, 2 Aug 2025 02:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12908/13054] fs/bcachefs/fsck.c:187
 lookup_lostfound() error: uninitialized symbol 'subvolid'.
Message-ID: <202508020200.mf738OTo-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: ffa77487e3cc4b8308b5c0d9ed501384a6c83519 [12908/13054] bcachefs: for_each_btree_key_norestart() uses CLASS(btree_iter)
:::::: branch date: 12 hours ago
:::::: commit date: 19 hours ago
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020200.mf738OTo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508020200.mf738OTo-lkp@intel.com/

smatch warnings:
fs/bcachefs/fsck.c:187 lookup_lostfound() error: uninitialized symbol 'subvolid'.

vim +/subvolid +187 fs/bcachefs/fsck.c

b5e4cd0871db885 Kent Overstreet 2024-12-20  159  
58686a259ed28f1 Kent Overstreet 2021-04-19  160  /* Get lost+found, create if it doesn't exist: */
d296e7b18521d60 Kent Overstreet 2023-12-15  161  static int lookup_lostfound(struct btree_trans *trans, u32 snapshot,
cc0532900bcf189 Kent Overstreet 2024-03-31  162  			    struct bch_inode_unpacked *lostfound,
cc0532900bcf189 Kent Overstreet 2024-03-31  163  			    u64 reattaching_inum)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  164  {
58686a259ed28f1 Kent Overstreet 2021-04-19  165  	struct bch_fs *c = trans->c;
58686a259ed28f1 Kent Overstreet 2021-04-19  166  	struct qstr lostfound_str = QSTR("lost+found");
25201eae7abed78 Kent Overstreet 2025-07-30  167  	struct btree_iter lostfound_iter = { NULL };
ef1669ffc69c492 Kent Overstreet 2021-04-20  168  	u64 inum = 0;
ef1669ffc69c492 Kent Overstreet 2021-04-20  169  	unsigned d_type = 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  170  	int ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  171  
d296e7b18521d60 Kent Overstreet 2023-12-15  172  	struct bch_snapshot_tree st;
d296e7b18521d60 Kent Overstreet 2023-12-15  173  	ret = bch2_snapshot_tree_lookup(trans,
d296e7b18521d60 Kent Overstreet 2023-12-15  174  			bch2_snapshot_tree(c, snapshot), &st);
ef1669ffc69c492 Kent Overstreet 2021-04-20  175  	if (ret)
ef1669ffc69c492 Kent Overstreet 2021-04-20  176  		return ret;
81ed9ce3671125e Kent Overstreet 2021-04-19  177  
b5e4cd0871db885 Kent Overstreet 2024-12-20  178  	u32 subvolid;
b5e4cd0871db885 Kent Overstreet 2024-12-20  179  	ret = find_snapshot_tree_subvol(trans,
b5e4cd0871db885 Kent Overstreet 2024-12-20  180  				bch2_snapshot_tree(c, snapshot), &subvolid);
b5e4cd0871db885 Kent Overstreet 2024-12-20  181  	bch_err_msg(c, ret, "finding subvol associated with snapshot tree %u",
b5e4cd0871db885 Kent Overstreet 2024-12-20  182  		    bch2_snapshot_tree(c, snapshot));
b5e4cd0871db885 Kent Overstreet 2024-12-20  183  	if (ret)
b5e4cd0871db885 Kent Overstreet 2024-12-20  184  		return ret;
d296e7b18521d60 Kent Overstreet 2023-12-15  185  
cc0532900bcf189 Kent Overstreet 2024-03-31  186  	struct bch_subvolume subvol;
b5e4cd0871db885 Kent Overstreet 2024-12-20 @187  	ret = bch2_subvolume_get(trans, subvolid, false, &subvol);
b5e4cd0871db885 Kent Overstreet 2024-12-20  188  	bch_err_msg(c, ret, "looking up subvol %u for snapshot %u", subvolid, snapshot);
cc0532900bcf189 Kent Overstreet 2024-03-31  189  	if (ret)
cc0532900bcf189 Kent Overstreet 2024-03-31  190  		return ret;
cc0532900bcf189 Kent Overstreet 2024-03-31  191  
cc0532900bcf189 Kent Overstreet 2024-03-31  192  	if (!subvol.inode) {
cc0532900bcf189 Kent Overstreet 2024-03-31  193  		struct btree_iter iter;
cc0532900bcf189 Kent Overstreet 2024-03-31  194  		struct bkey_i_subvolume *subvol = bch2_bkey_get_mut_typed(trans, &iter,
b5e4cd0871db885 Kent Overstreet 2024-12-20  195  				BTREE_ID_subvolumes, POS(0, subvolid),
cc0532900bcf189 Kent Overstreet 2024-03-31  196  				0, subvolume);
cc0532900bcf189 Kent Overstreet 2024-03-31  197  		ret = PTR_ERR_OR_ZERO(subvol);
285b181ad460bb2 Kent Overstreet 2021-10-28  198  		if (ret)
d3ff7fec9c604e2 Kent Overstreet 2021-04-07  199  			return ret;
176cf4bf59014d0 Kent Overstreet 2021-04-09  200  
cc0532900bcf189 Kent Overstreet 2024-03-31  201  		subvol->v.inode = cpu_to_le64(reattaching_inum);
951d23507b08c21 Kent Overstreet 2025-07-30  202  		bch2_trans_iter_exit(&iter);
cc0532900bcf189 Kent Overstreet 2024-03-31  203  	}
cc0532900bcf189 Kent Overstreet 2024-03-31  204  
b5e4cd0871db885 Kent Overstreet 2024-12-20  205  	subvol_inum root_inum = {
b5e4cd0871db885 Kent Overstreet 2024-12-20  206  		.subvol = subvolid,
b5e4cd0871db885 Kent Overstreet 2024-12-20  207  		.inum = le64_to_cpu(subvol.inode)
b5e4cd0871db885 Kent Overstreet 2024-12-20  208  	};
cc0532900bcf189 Kent Overstreet 2024-03-31  209  
d296e7b18521d60 Kent Overstreet 2023-12-15  210  	struct bch_inode_unpacked root_inode;
d296e7b18521d60 Kent Overstreet 2023-12-15  211  	struct bch_hash_info root_hash_info;
77eac89c7943a4e Kent Overstreet 2025-05-19  212  	ret = bch2_inode_find_by_inum_snapshot(trans, root_inum.inum, snapshot, &root_inode, 0);
cc0532900bcf189 Kent Overstreet 2024-03-31  213  	bch_err_msg(c, ret, "looking up root inode %llu for subvol %u",
b5e4cd0871db885 Kent Overstreet 2024-12-20  214  		    root_inum.inum, subvolid);
d296e7b18521d60 Kent Overstreet 2023-12-15  215  	if (ret)
d296e7b18521d60 Kent Overstreet 2023-12-15  216  		return ret;
d296e7b18521d60 Kent Overstreet 2023-12-15  217  
d296e7b18521d60 Kent Overstreet 2023-12-15  218  	root_hash_info = bch2_hash_info_init(c, &root_inode);
ef1669ffc69c492 Kent Overstreet 2021-04-20  219  
d2fda304bb739b9 Kent Overstreet 2024-01-24  220  	ret = lookup_dirent_in_snapshot(trans, root_hash_info, root_inum,
d2fda304bb739b9 Kent Overstreet 2024-01-24  221  			      &lostfound_str, &inum, &d_type, snapshot);
d296e7b18521d60 Kent Overstreet 2023-12-15  222  	if (bch2_err_matches(ret, ENOENT))
58686a259ed28f1 Kent Overstreet 2021-04-19  223  		goto create_lostfound;
176cf4bf59014d0 Kent Overstreet 2021-04-09  224  
e46c181af9e230c Kent Overstreet 2023-09-11  225  	bch_err_fn(c, ret);
285b181ad460bb2 Kent Overstreet 2021-10-28  226  	if (ret)
ef1669ffc69c492 Kent Overstreet 2021-04-20  227  		return ret;
ef1669ffc69c492 Kent Overstreet 2021-04-20  228  
ef1669ffc69c492 Kent Overstreet 2021-04-20  229  	if (d_type != DT_DIR) {
ef1669ffc69c492 Kent Overstreet 2021-04-20  230  		bch_err(c, "error looking up lost+found: not a directory");
09b9c72bd4b77a9 Kent Overstreet 2025-05-28  231  		return bch_err_throw(c, ENOENT_not_directory);
ef1669ffc69c492 Kent Overstreet 2021-04-20  232  	}
ef1669ffc69c492 Kent Overstreet 2021-04-20  233  
58686a259ed28f1 Kent Overstreet 2021-04-19  234  	/*
067d228bb0c4054 Kent Overstreet 2023-07-07  235  	 * The bch2_check_dirents pass has already run, dangling dirents
58686a259ed28f1 Kent Overstreet 2021-04-19  236  	 * shouldn't exist here:
58686a259ed28f1 Kent Overstreet 2021-04-19  237  	 */
77eac89c7943a4e Kent Overstreet 2025-05-19  238  	ret = bch2_inode_find_by_inum_snapshot(trans, inum, snapshot, lostfound, 0);
d2fda304bb739b9 Kent Overstreet 2024-01-24  239  	bch_err_msg(c, ret, "looking up lost+found %llu:%u in (root inode %llu, snapshot root %u)",
d2fda304bb739b9 Kent Overstreet 2024-01-24  240  		    inum, snapshot, root_inum.inum, bch2_snapshot_root(c, snapshot));
d2fda304bb739b9 Kent Overstreet 2024-01-24  241  	return ret;
176cf4bf59014d0 Kent Overstreet 2021-04-09  242  
58686a259ed28f1 Kent Overstreet 2021-04-19  243  create_lostfound:
fda7b1ffdef75cc Kent Overstreet 2024-09-28  244  	/*
fda7b1ffdef75cc Kent Overstreet 2024-09-28  245  	 * we always create lost+found in the root snapshot; we don't want
fda7b1ffdef75cc Kent Overstreet 2024-09-28  246  	 * different branches of the snapshot tree to have different lost+found
fda7b1ffdef75cc Kent Overstreet 2024-09-28  247  	 */
fda7b1ffdef75cc Kent Overstreet 2024-09-28  248  	snapshot = le32_to_cpu(st.root_snapshot);
d296e7b18521d60 Kent Overstreet 2023-12-15  249  	/*
d296e7b18521d60 Kent Overstreet 2023-12-15  250  	 * XXX: we could have a nicer log message here  if we had a nice way to
d296e7b18521d60 Kent Overstreet 2023-12-15  251  	 * walk backpointers to print a path
d296e7b18521d60 Kent Overstreet 2023-12-15  252  	 */
037733c903c76d8 Kent Overstreet 2025-07-14  253  	CLASS(printbuf, path)();
f7727a6767277a9 Kent Overstreet 2024-09-28  254  	ret = bch2_inum_to_path(trans, root_inum, &path);
f7727a6767277a9 Kent Overstreet 2024-09-28  255  	if (ret)
f7727a6767277a9 Kent Overstreet 2024-09-28  256  		goto err;
f7727a6767277a9 Kent Overstreet 2024-09-28  257  
f7727a6767277a9 Kent Overstreet 2024-09-28  258  	bch_notice(c, "creating %s/lost+found in subvol %llu snapshot %u",
f7727a6767277a9 Kent Overstreet 2024-09-28  259  		   path.buf, root_inum.subvol, snapshot);
d296e7b18521d60 Kent Overstreet 2023-12-15  260  
d296e7b18521d60 Kent Overstreet 2023-12-15  261  	u64 now = bch2_current_time(c);
d296e7b18521d60 Kent Overstreet 2023-12-15  262  	u64 cpu = raw_smp_processor_id();
d296e7b18521d60 Kent Overstreet 2023-12-15  263  
58686a259ed28f1 Kent Overstreet 2021-04-19  264  	bch2_inode_init_early(c, lostfound);
4ba99dde330b2d4 Kent Overstreet 2025-05-19  265  	bch2_inode_init_late(c, lostfound, now, 0, 0, S_IFDIR|0700, 0, &root_inode);
d296e7b18521d60 Kent Overstreet 2023-12-15  266  	lostfound->bi_dir = root_inode.bi_inum;
72350ee0ea22c05 Kent Overstreet 2024-09-30  267  	lostfound->bi_snapshot = le32_to_cpu(st.root_snapshot);
d296e7b18521d60 Kent Overstreet 2023-12-15  268  
d296e7b18521d60 Kent Overstreet 2023-12-15  269  	root_inode.bi_nlink++;
d296e7b18521d60 Kent Overstreet 2023-12-15  270  
d296e7b18521d60 Kent Overstreet 2023-12-15  271  	ret = bch2_inode_create(trans, &lostfound_iter, lostfound, snapshot, cpu);
d296e7b18521d60 Kent Overstreet 2023-12-15  272  	if (ret)
d296e7b18521d60 Kent Overstreet 2023-12-15  273  		goto err;
d296e7b18521d60 Kent Overstreet 2023-12-15  274  
25201eae7abed78 Kent Overstreet 2025-07-30  275  	bch2_btree_iter_set_snapshot(&lostfound_iter, snapshot);
25201eae7abed78 Kent Overstreet 2025-07-30  276  	ret = bch2_btree_iter_traverse(&lostfound_iter);
d296e7b18521d60 Kent Overstreet 2023-12-15  277  	if (ret)
d296e7b18521d60 Kent Overstreet 2023-12-15  278  		goto err;
176cf4bf59014d0 Kent Overstreet 2021-04-09  279  
d296e7b18521d60 Kent Overstreet 2023-12-15  280  	ret =   bch2_dirent_create_snapshot(trans,
56e230473d395c9 Kent Overstreet 2024-02-09  281  				0, root_inode.bi_inum, snapshot, &root_hash_info,
d296e7b18521d60 Kent Overstreet 2023-12-15  282  				mode_to_type(lostfound->bi_mode),
d296e7b18521d60 Kent Overstreet 2023-12-15  283  				&lostfound_str,
d296e7b18521d60 Kent Overstreet 2023-12-15  284  				lostfound->bi_inum,
d296e7b18521d60 Kent Overstreet 2023-12-15  285  				&lostfound->bi_dir_offset,
ecd76c5f108eec3 Kent Overstreet 2025-05-21  286  				BTREE_UPDATE_internal_snapshot_node|
5dd8c60e1e04481 Kent Overstreet 2024-04-07  287  				STR_HASH_must_create) ?:
d296e7b18521d60 Kent Overstreet 2023-12-15  288  		bch2_inode_write_flags(trans, &lostfound_iter, lostfound,
5dd8c60e1e04481 Kent Overstreet 2024-04-07  289  				       BTREE_UPDATE_internal_snapshot_node);
d296e7b18521d60 Kent Overstreet 2023-12-15  290  err:
e46c181af9e230c Kent Overstreet 2023-09-11  291  	bch_err_msg(c, ret, "creating lost+found");
951d23507b08c21 Kent Overstreet 2025-07-30  292  	bch2_trans_iter_exit(&lostfound_iter);
285b181ad460bb2 Kent Overstreet 2021-10-28  293  	return ret;
58686a259ed28f1 Kent Overstreet 2021-04-19  294  }
176cf4bf59014d0 Kent Overstreet 2021-04-09  295  

:::::: The code at line 187 was first introduced by commit
:::::: b5e4cd0871db885de05d531e8e72fa6059d81bd4 bcachefs: Don't rely on snapshot_tree.master_subvol for reattaching

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
