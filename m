Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058B1384BF
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Nov 2024 02:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983842; cv=none; b=KVD3XWyQNnx9grdA1s3AysQ96IBnv9jgyD1uztKsNZAisS6mgnI43xccjIvtjnJVGtlIEggNpeppzjUuvSw63tSdxTbl9v9UtxpopvMhAY4nc6Mobtck3OwjuHUldST89XPuM99NKyHl3Sdhn8t9U/m3wjMfN7+trPefZXRah0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983842; c=relaxed/simple;
	bh=quXNVnSTUTezDIYZ/TNpjx/2N2iGiwubhbxxhXyjfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+cRzN3ph9b1mQnF3cRBrJhZmvHcn725vdMRUhrhPOBGCFs6UVTmXY2xEqoR7WYZ2g22mBuVcsPTfQxzGO+gIqQcZG/yEXKrfYMioy+nUz8lL8JkC5IzfVJIDNF9fHuqw6A2T3hjTed5FUV239+c79wKeTVLk3evEdq8tciHPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km1Rh72K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km1Rh72K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731983840; x=1763519840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quXNVnSTUTezDIYZ/TNpjx/2N2iGiwubhbxxhXyjfTM=;
  b=Km1Rh72K2yl+FRRKGnzs+nAseJJX0nkWkz+WNzD6hPm/7Ilbp98KlfYh
   ZRfu/qjjTUhdWsGoxcGiedjte1Vwm7kkfBqGcpTPiV3W0QmUE7YYF0IVP
   BXZkz9GLireCMYwNb46flskkGCGWJWL2fYm4JdZNZs+IirWwtEhf6tWgw
   PxYZrXXJBAnJVzx4x1VSbhxZFAtE/MwezSzeHHgihEgzXUuexZtQN1ibZ
   wBx44guzCltS1uUZ2zpA9OUXOAzUWmnKj+HW2H3iF6Sb2PFEtODKtSrGe
   NHnFvgo03KNvv+zYtyMU0r+G0cHGldJLCDY4rZeq+k4AtvvD/p75O0J97
   A==;
X-CSE-ConnectionGUID: t9WCaM29QzW40nyDFswVSQ==
X-CSE-MsgGUID: X+sOck3GT225qdiEjb1dSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31339386"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31339386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:37:19 -0800
X-CSE-ConnectionGUID: 0UEhSMlIQxC/mUwrJz/2pA==
X-CSE-MsgGUID: Ml7gL/qxTVSv2IoLf59w3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="126952329"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2024 18:37:18 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDE79-000038-2X;
	Tue, 19 Nov 2024 02:37:15 +0000
Date: Tue, 19 Nov 2024 10:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.12/zen-sauce 8/31] fs/bcachefs/fsck.c:483:1: warning: the
 frame size of 1048 bytes is larger than 1024 bytes
Message-ID: <202411191006.FxE0agls-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   a77e5dc91c4328da8b938f220477e8de98165075
commit: 87b0cab8d8701db7754e5778b93ff83ffc64c7ae [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411191006.FxE0agls-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191006.FxE0agls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411191006.FxE0agls-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fsck.c: In function 'reattach_inode':
>> fs/bcachefs/fsck.c:483:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     483 | }
         | ^


vim +483 fs/bcachefs/fsck.c

38864eccf78b4e Kent Overstreet 2024-09-30  368  
72350ee0ea22c0 Kent Overstreet 2024-09-30  369  static int reattach_inode(struct btree_trans *trans, struct bch_inode_unpacked *inode)
176cf4bf59014d Kent Overstreet 2021-04-09  370  {
7a086baad0d640 Kent Overstreet 2024-07-20  371  	struct bch_fs *c = trans->c;
58686a259ed28f Kent Overstreet 2021-04-19  372  	struct bch_inode_unpacked lostfound;
58686a259ed28f Kent Overstreet 2021-04-19  373  	char name_buf[20];
58686a259ed28f Kent Overstreet 2021-04-19  374  	int ret;
58686a259ed28f Kent Overstreet 2021-04-19  375  
38864eccf78b4e Kent Overstreet 2024-09-30  376  	u32 dirent_snapshot = inode->bi_snapshot;
56e230473d395c Kent Overstreet 2024-02-09  377  	if (inode->bi_subvol) {
56e230473d395c Kent Overstreet 2024-02-09  378  		inode->bi_parent_subvol = BCACHEFS_ROOT_SUBVOL;
56e230473d395c Kent Overstreet 2024-02-09  379  
56e230473d395c Kent Overstreet 2024-02-09  380  		u64 root_inum;
56e230473d395c Kent Overstreet 2024-02-09  381  		ret = subvol_lookup(trans, inode->bi_parent_subvol,
56e230473d395c Kent Overstreet 2024-02-09  382  				    &dirent_snapshot, &root_inum);
56e230473d395c Kent Overstreet 2024-02-09  383  		if (ret)
56e230473d395c Kent Overstreet 2024-02-09  384  			return ret;
56e230473d395c Kent Overstreet 2024-02-09  385  
56e230473d395c Kent Overstreet 2024-02-09  386  		snprintf(name_buf, sizeof(name_buf), "subvol-%u", inode->bi_subvol);
56e230473d395c Kent Overstreet 2024-02-09  387  	} else {
56e230473d395c Kent Overstreet 2024-02-09  388  		snprintf(name_buf, sizeof(name_buf), "%llu", inode->bi_inum);
56e230473d395c Kent Overstreet 2024-02-09  389  	}
56e230473d395c Kent Overstreet 2024-02-09  390  
cc0532900bcf18 Kent Overstreet 2024-03-31  391  	ret = lookup_lostfound(trans, dirent_snapshot, &lostfound, inode->bi_inum);
9638574229e3ae Kent Overstreet 2019-10-02  392  	if (ret)
58686a259ed28f Kent Overstreet 2021-04-19  393  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  394  
20826fe6b810bc Kent Overstreet 2024-09-28  395  	lostfound.bi_nlink += S_ISDIR(inode->bi_mode);
58686a259ed28f Kent Overstreet 2021-04-19  396  
20826fe6b810bc Kent Overstreet 2024-09-28  397  	/* ensure lost+found inode is also present in inode snapshot */
72350ee0ea22c0 Kent Overstreet 2024-09-30  398  	if (!inode->bi_subvol) {
72350ee0ea22c0 Kent Overstreet 2024-09-30  399  		BUG_ON(!bch2_snapshot_is_ancestor(c, inode->bi_snapshot, lostfound.bi_snapshot));
72350ee0ea22c0 Kent Overstreet 2024-09-30  400  		lostfound.bi_snapshot = inode->bi_snapshot;
72350ee0ea22c0 Kent Overstreet 2024-09-30  401  	}
72350ee0ea22c0 Kent Overstreet 2024-09-30  402  
72350ee0ea22c0 Kent Overstreet 2024-09-30  403  	ret = __bch2_fsck_write_inode(trans, &lostfound);
58686a259ed28f Kent Overstreet 2021-04-19  404  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  405  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  406  
38864eccf78b4e Kent Overstreet 2024-09-30  407  	struct bch_hash_info dir_hash = bch2_hash_info_init(c, &lostfound);
38864eccf78b4e Kent Overstreet 2024-09-30  408  	struct qstr name = (struct qstr) QSTR(name_buf);
58686a259ed28f Kent Overstreet 2021-04-19  409  
38864eccf78b4e Kent Overstreet 2024-09-30  410  	inode->bi_dir = lostfound.bi_inum;
58686a259ed28f Kent Overstreet 2021-04-19  411  
d296e7b18521d6 Kent Overstreet 2023-12-15  412  	ret = bch2_dirent_create_snapshot(trans,
56e230473d395c Kent Overstreet 2024-02-09  413  				inode->bi_parent_subvol, lostfound.bi_inum,
56e230473d395c Kent Overstreet 2024-02-09  414  				dirent_snapshot,
ef1669ffc69c49 Kent Overstreet 2021-04-20  415  				&dir_hash,
285b181ad460bb Kent Overstreet 2021-10-28  416  				inode_d_type(inode),
56e230473d395c Kent Overstreet 2024-02-09  417  				&name,
56e230473d395c Kent Overstreet 2024-02-09  418  				inode->bi_subvol ?: inode->bi_inum,
38864eccf78b4e Kent Overstreet 2024-09-30  419  				&inode->bi_dir_offset,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  420  				STR_HASH_must_create);
7a086baad0d640 Kent Overstreet 2024-07-20  421  	if (ret) {
7a086baad0d640 Kent Overstreet 2024-07-20  422  		bch_err_msg(c, ret, "error creating dirent");
285b181ad460bb Kent Overstreet 2021-10-28  423  		return ret;
7a086baad0d640 Kent Overstreet 2024-07-20  424  	}
285b181ad460bb Kent Overstreet 2021-10-28  425  
38864eccf78b4e Kent Overstreet 2024-09-30  426  	ret = __bch2_fsck_write_inode(trans, inode);
38864eccf78b4e Kent Overstreet 2024-09-30  427  	if (ret)
38864eccf78b4e Kent Overstreet 2024-09-30  428  		return ret;
38864eccf78b4e Kent Overstreet 2024-09-30  429  
38864eccf78b4e Kent Overstreet 2024-09-30  430  	/*
38864eccf78b4e Kent Overstreet 2024-09-30  431  	 * Fix up inodes in child snapshots: if they should also be reattached
38864eccf78b4e Kent Overstreet 2024-09-30  432  	 * update the backpointer field, if they should not be we need to emit
38864eccf78b4e Kent Overstreet 2024-09-30  433  	 * whiteouts for the dirent we just created.
38864eccf78b4e Kent Overstreet 2024-09-30  434  	 */
38864eccf78b4e Kent Overstreet 2024-09-30  435  	if (!inode->bi_subvol && bch2_snapshot_is_leaf(c, inode->bi_snapshot) <= 0) {
38864eccf78b4e Kent Overstreet 2024-09-30  436  		snapshot_id_list whiteouts_done;
38864eccf78b4e Kent Overstreet 2024-09-30  437  		struct btree_iter iter;
38864eccf78b4e Kent Overstreet 2024-09-30  438  		struct bkey_s_c k;
285b181ad460bb Kent Overstreet 2021-10-28  439  
38864eccf78b4e Kent Overstreet 2024-09-30  440  		darray_init(&whiteouts_done);
38864eccf78b4e Kent Overstreet 2024-09-30  441  
38864eccf78b4e Kent Overstreet 2024-09-30  442  		for_each_btree_key_reverse_norestart(trans, iter,
38864eccf78b4e Kent Overstreet 2024-09-30  443  				BTREE_ID_inodes, SPOS(0, inode->bi_inum, inode->bi_snapshot - 1),
38864eccf78b4e Kent Overstreet 2024-09-30  444  				BTREE_ITER_all_snapshots|BTREE_ITER_intent, k, ret) {
38864eccf78b4e Kent Overstreet 2024-09-30  445  			if (k.k->p.offset != inode->bi_inum)
38864eccf78b4e Kent Overstreet 2024-09-30  446  				break;
38864eccf78b4e Kent Overstreet 2024-09-30  447  
38864eccf78b4e Kent Overstreet 2024-09-30  448  			if (!bkey_is_inode(k.k) ||
38864eccf78b4e Kent Overstreet 2024-09-30  449  			    !bch2_snapshot_is_ancestor(c, k.k->p.snapshot, inode->bi_snapshot) ||
38864eccf78b4e Kent Overstreet 2024-09-30  450  			    snapshot_list_has_ancestor(c, &whiteouts_done, k.k->p.snapshot))
38864eccf78b4e Kent Overstreet 2024-09-30  451  				continue;
38864eccf78b4e Kent Overstreet 2024-09-30  452  
38864eccf78b4e Kent Overstreet 2024-09-30  453  			struct bch_inode_unpacked child_inode;
38864eccf78b4e Kent Overstreet 2024-09-30  454  			bch2_inode_unpack(k, &child_inode);
38864eccf78b4e Kent Overstreet 2024-09-30  455  
38864eccf78b4e Kent Overstreet 2024-09-30  456  			if (!inode_should_reattach(&child_inode)) {
38864eccf78b4e Kent Overstreet 2024-09-30  457  				ret = maybe_delete_dirent(trans,
38864eccf78b4e Kent Overstreet 2024-09-30  458  							  SPOS(lostfound.bi_inum, inode->bi_dir_offset,
38864eccf78b4e Kent Overstreet 2024-09-30  459  							       dirent_snapshot),
38864eccf78b4e Kent Overstreet 2024-09-30  460  							  k.k->p.snapshot);
38864eccf78b4e Kent Overstreet 2024-09-30  461  				if (ret)
38864eccf78b4e Kent Overstreet 2024-09-30  462  					break;
38864eccf78b4e Kent Overstreet 2024-09-30  463  
38864eccf78b4e Kent Overstreet 2024-09-30  464  				ret = snapshot_list_add(c, &whiteouts_done, k.k->p.snapshot);
38864eccf78b4e Kent Overstreet 2024-09-30  465  				if (ret)
38864eccf78b4e Kent Overstreet 2024-09-30  466  					break;
38864eccf78b4e Kent Overstreet 2024-09-30  467  			} else {
38864eccf78b4e Kent Overstreet 2024-09-30  468  				iter.snapshot = k.k->p.snapshot;
38864eccf78b4e Kent Overstreet 2024-09-30  469  				child_inode.bi_dir = inode->bi_dir;
38864eccf78b4e Kent Overstreet 2024-09-30  470  				child_inode.bi_dir_offset = inode->bi_dir_offset;
38864eccf78b4e Kent Overstreet 2024-09-30  471  
38864eccf78b4e Kent Overstreet 2024-09-30  472  				ret = bch2_inode_write_flags(trans, &iter, &child_inode,
38864eccf78b4e Kent Overstreet 2024-09-30  473  							     BTREE_UPDATE_internal_snapshot_node);
38864eccf78b4e Kent Overstreet 2024-09-30  474  				if (ret)
38864eccf78b4e Kent Overstreet 2024-09-30  475  					break;
38864eccf78b4e Kent Overstreet 2024-09-30  476  			}
38864eccf78b4e Kent Overstreet 2024-09-30  477  		}
38864eccf78b4e Kent Overstreet 2024-09-30  478  		darray_exit(&whiteouts_done);
38864eccf78b4e Kent Overstreet 2024-09-30  479  		bch2_trans_iter_exit(trans, &iter);
38864eccf78b4e Kent Overstreet 2024-09-30  480  	}
38864eccf78b4e Kent Overstreet 2024-09-30  481  
38864eccf78b4e Kent Overstreet 2024-09-30  482  	return ret;
285b181ad460bb Kent Overstreet 2021-10-28 @483  }
285b181ad460bb Kent Overstreet 2021-10-28  484  

:::::: The code at line 483 was first introduced by commit
:::::: 285b181ad460bb240041a9ca7935f9e884040405 bcachefs: Improve transaction restart handling in fsck code

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
