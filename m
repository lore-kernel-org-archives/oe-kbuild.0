Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA228C5C0
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754065227; cv=none; b=nkA6LJCL78tUUz6Iyl1lewSO3Ac/asQ2QPE+ctNj3ERQxXlb/hpPDX3IEfHMzm/KZ1wOk6iqbJdc2swvKskSlgaPf3D5wL92/wB90H9Qg5XuPdQpKQT3Ashqg0h8XgEVegnDqlj3LTOw68I28m2jg9YqEaEI0Xfp+tvC2k1y/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754065227; c=relaxed/simple;
	bh=eQTgZeABu+l9FtJ8gLJ4LfYnJXhuNins9oX26oNvDdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yc4bq3OA8mJDfj+fNKNIfS3fdJj4EywmfbW6NtQSyD2/qRxuFwcUbTWsHeeZnGdnzWoeV13BAjq7BhkRkF1aLQWN4ySiLHeyjX+FcnWbkB7/2SfRDmkWkRhrDqJGP2E5dez8M8CrdhipvA6MVj8JQo7XwZUFbqcY5Uc3cxttJT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5t1opwq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5t1opwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754065225; x=1785601225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQTgZeABu+l9FtJ8gLJ4LfYnJXhuNins9oX26oNvDdw=;
  b=I5t1opwq+PNdEDRGkZUjmvz8XgJ5CdWqyP8DbUxPSQHA8c/Ap7HK8e3u
   qlWl8s7NM6m4wJ6m/Q38UUkJRtGkSOHfSn7lcSjPaKTOQhoJ6wLbomrDT
   J2zLF1J4ClA1JQj/fbXaLy308+GtZsYid2OvzmLiUcBIuv5kd0Yt8TSRT
   agixo9l3u9PPUAN/QL6QI7K4FlMhWC1GyzyZj66FVH5l3ESbJIoX7jvTV
   trmtvoAqbViF/gs4vkrU0yBP1cMf6m1SbLpKF+5kQcWluP+7Cfp+YKh71
   Enr9T5hPto35my43F4hehxpeJU5vNmu0B8wTxiZH42nkRvHxXuZQQB/h2
   A==;
X-CSE-ConnectionGUID: /7fOo01FR/+bPQdVrJMZ4g==
X-CSE-MsgGUID: axPqJkMISFSght1YD7ndvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59038820"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="59038820"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 09:20:25 -0700
X-CSE-ConnectionGUID: 7g9YmhKzRaeO5/f8ZDiZ6w==
X-CSE-MsgGUID: idyoU8N9Q9aapGm0ibr+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167784986"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 09:20:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhsUX-0004kC-0d;
	Fri, 01 Aug 2025 16:20:21 +0000
Date: Sat, 2 Aug 2025 00:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 214/239] fs/bcachefs/namei.c:711
 __bch2_inum_to_path() warn: missing error code 'ret'
Message-ID: <202508020051.jtP9RM21-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   06e1afcade290ef4790187563371c63d4a3d5bc2
commit: 986cef178c949afda68367503d8cbce3da879aa3 [214/239] bcachefs: inum_to_path() now prints inum when disconnected
:::::: branch date: 83 minutes ago
:::::: commit date: 34 hours ago
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020051.jtP9RM21-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508020051.jtP9RM21-lkp@intel.com/

smatch warnings:
fs/bcachefs/namei.c:711 __bch2_inum_to_path() warn: missing error code 'ret'

vim +/ret +711 fs/bcachefs/namei.c

f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  641  
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  642  static int __bch2_inum_to_path(struct btree_trans *trans,
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  643  			       u32 subvol, u64 inum, u32 snapshot,
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  644  			       struct printbuf *path)
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  645  {
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  646  	unsigned orig_pos = path->pos;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  647  	int ret = 0;
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  648  	DARRAY(subvol_inum) inums = {};
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  649  
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  650  	if (!snapshot) {
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  651  		ret = bch2_subvolume_get_snapshot(trans, subvol, &snapshot);
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  652  		if (ret)
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  653  			goto disconnected;
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  654  	}
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  655  
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  656  	while (true) {
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  657  		subvol_inum n = (subvol_inum) { subvol ?: snapshot, inum };
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  658  
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  659  		if (darray_find_p(inums, i, i->subvol == n.subvol && i->inum == n.inum)) {
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  660  			prt_printf_reversed(path, "(loop at %llu:%u)", inum, snapshot);
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  661  			break;
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  662  		}
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  663  
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  664  		ret = darray_push(&inums, n);
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  665  		if (ret)
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  666  			goto err;
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  667  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  668  		struct bch_inode_unpacked inode;
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  669  		ret = bch2_inode_find_by_inum_snapshot(trans, inum, snapshot, &inode, 0);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  670  		if (ret)
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  671  			goto disconnected;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  672  
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  673  		if (inode.bi_subvol == BCACHEFS_ROOT_SUBVOL &&
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  674  		    inode.bi_inum == BCACHEFS_ROOT_INO)
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  675  			break;
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  676  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  677  		if (!inode.bi_dir && !inode.bi_dir_offset) {
09b9c72bd4b77a fs/bcachefs/namei.c     Kent Overstreet 2025-05-28  678  			ret = bch_err_throw(trans->c, ENOENT_inode_no_backpointer);
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  679  			goto disconnected;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  680  		}
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  681  
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  682  		inum = inode.bi_dir;
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  683  		if (inode.bi_parent_subvol) {
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  684  			subvol = inode.bi_parent_subvol;
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  685  			ret = bch2_subvolume_get_snapshot(trans, inode.bi_parent_subvol, &snapshot);
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  686  			if (ret)
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  687  				goto disconnected;
f638b84224348d fs/bcachefs/namei.c     Kent Overstreet 2025-05-20  688  		}
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  689  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  690  		struct btree_iter d_iter;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  691  		struct bkey_s_c_dirent d = bch2_bkey_get_iter_typed(trans, &d_iter,
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  692  				BTREE_ID_dirents, SPOS(inode.bi_dir, inode.bi_dir_offset, snapshot),
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  693  				0, dirent);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  694  		ret = bkey_err(d.s_c);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  695  		if (ret)
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  696  			goto disconnected;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  697  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  698  		struct qstr dirent_name = bch2_dirent_get_name(d);
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  699  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  700  		prt_bytes_reversed(path, dirent_name.name, dirent_name.len);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  701  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  702  		prt_char(path, '/');
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  703  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  704  		bch2_trans_iter_exit(trans, &d_iter);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  705  	}
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  706  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  707  	if (orig_pos == path->pos)
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  708  		prt_char(path, '/');
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  709  out:
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  710  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30 @711  		goto err;
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  712  
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  713  	ret = path->allocation_failure ? -ENOMEM : 0;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  714  	if (ret)
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  715  		goto err;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  716  
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  717  	printbuf_reverse_from(path, orig_pos);
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  718  	darray_exit(&inums);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  719  	return 0;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  720  err:
9ba6930ef8e0e0 fs/bcachefs/namei.c     Kent Overstreet 2025-06-16  721  	darray_exit(&inums);
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  722  	return ret;
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  723  disconnected:
986cef178c949a fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  724  	prt_printf_reversed(path, "(disconnected at %llu.%u)", inum, snapshot);
ce9a21713bfd97 fs/bcachefs/fs-common.c Kent Overstreet 2024-12-24  725  	goto out;
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  726  }
758ea4ff812b4d fs/bcachefs/namei.c     Kent Overstreet 2025-03-20  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
