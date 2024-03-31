Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859B145FF0
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 21:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711922265; cv=none; b=UQPhy/EDA5DUbuvGzitzbvSR0XaomEkst+MrrfKfeHewPRtYCOX79QOMN4fVLFDGzH8AojFRIb74HjAIlLQx2gamm3YK1AwKk574xAWA3ZBNBRJTMkT1brqVgaKct2C3Mtuquh+wrbPr48eWcH2VK73+cEFuGgn6nVYvnibuZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711922265; c=relaxed/simple;
	bh=CL8aUwK+JUI2CQtbW8kaEauzveMs0OKPbXLgrP5Wzdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jA0dgJnuhXCyIdvZ+vyrdMSqlEGeL+UdzI0UOBU6IaD1ghw8KV9NwZ1E3JfTsaeboLCHr6ty6oy79R8IIAdFw4cQ/g/trOCwMa2iT6/fsKX/ZkwHtUAghHJwa+8DC3yHqSD1VGKv4xKb6wrTN4LpqYN0qMxCe9TxtPvD1jaUsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uw3PC1uh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw3PC1uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711922263; x=1743458263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CL8aUwK+JUI2CQtbW8kaEauzveMs0OKPbXLgrP5Wzdk=;
  b=Uw3PC1uh5w/uEW/APrUj5Kte5l+or1QHV3c/hgZ0oZFSdIy7iFav4VXh
   OSaj62O+q/P4BHPFgVQAg9Jv+xeVZ8aQQEoivU05UnBbDzMnoHmLwS2lu
   0MYBJTcK5tVF146tHWyY8Pg+wDHrvZLCQ6t6mtAGWaMGgYn221BRHUbpv
   E1zUPSQe/aDupwGmyhUBMXktH/EwubDvFXdGsllrli6lJ/HDQOmVEDznk
   Xfduw4hOwYMTCxQsfYBgWzsfT03Ik+dQhdwGezpPYGLESoppj7HzH+ZmN
   2eJ+tC+i2jYnRtmYNhG6IuZfcrBm3j+1pNptg+ET+FGAAYvJlO8ibWIw+
   Q==;
X-CSE-ConnectionGUID: mg4gAppCTyC761v5x+xixQ==
X-CSE-MsgGUID: mUzNIlmzRY2KXhy96pXFpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7257351"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="7257351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 14:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22024397"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2024 14:57:41 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr3BL-0001RO-0V;
	Sun, 31 Mar 2024 21:57:39 +0000
Date: Mon, 1 Apr 2024 05:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 103/159] fs/xfs/scrub/attr.c:512
 xchk_xattr_rec() warn: missing error code? 'error'
Message-ID: <202404010529.7F6qVl9f-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   99c234d902a07d52b882f19b188bd6c96ed25640
commit: 25308399c1406b821d4df4a51294087c2726cb1e [103/159] xfs: enforce one namespace per attribute
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010529.7F6qVl9f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404010529.7F6qVl9f-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/attr.c:512 xchk_xattr_rec() warn: missing error code? 'error'

Old smatch warnings:
fs/xfs/scrub/attr.c:516 xchk_xattr_rec() warn: missing error code? 'error'

vim +/error +512 fs/xfs/scrub/attr.c

13791d3b833428 Darrick J. Wong   2017-10-31  461  
eec0482e0829ea Darrick J. Wong   2017-10-17  462  /* Scrub a attribute btree record. */
eec0482e0829ea Darrick J. Wong   2017-10-17  463  STATIC int
c517b3aa02cff1 Darrick J. Wong   2018-07-19  464  xchk_xattr_rec(
c517b3aa02cff1 Darrick J. Wong   2018-07-19  465  	struct xchk_da_btree		*ds,
649d9d98c60ec5 Christoph Hellwig 2019-11-08  466  	int				level)
eec0482e0829ea Darrick J. Wong   2017-10-17  467  {
eec0482e0829ea Darrick J. Wong   2017-10-17  468  	struct xfs_mount		*mp = ds->state->mp;
649d9d98c60ec5 Christoph Hellwig 2019-11-08  469  	struct xfs_da_state_blk		*blk = &ds->state->path.blk[level];
eec0482e0829ea Darrick J. Wong   2017-10-17  470  	struct xfs_attr_leaf_name_local	*lentry;
eec0482e0829ea Darrick J. Wong   2017-10-17  471  	struct xfs_attr_leaf_name_remote	*rentry;
eec0482e0829ea Darrick J. Wong   2017-10-17  472  	struct xfs_buf			*bp;
649d9d98c60ec5 Christoph Hellwig 2019-11-08  473  	struct xfs_attr_leaf_entry	*ent;
eec0482e0829ea Darrick J. Wong   2017-10-17  474  	xfs_dahash_t			calc_hash;
eec0482e0829ea Darrick J. Wong   2017-10-17  475  	xfs_dahash_t			hash;
eec0482e0829ea Darrick J. Wong   2017-10-17  476  	int				nameidx;
eec0482e0829ea Darrick J. Wong   2017-10-17  477  	int				hdrsize;
eec0482e0829ea Darrick J. Wong   2017-10-17  478  	unsigned int			badflags;
eec0482e0829ea Darrick J. Wong   2017-10-17  479  	int				error;
eec0482e0829ea Darrick J. Wong   2017-10-17  480  
649d9d98c60ec5 Christoph Hellwig 2019-11-08  481  	ASSERT(blk->magic == XFS_ATTR_LEAF_MAGIC);
649d9d98c60ec5 Christoph Hellwig 2019-11-08  482  
649d9d98c60ec5 Christoph Hellwig 2019-11-08  483  	ent = xfs_attr3_leaf_entryp(blk->bp->b_addr) + blk->index;
eec0482e0829ea Darrick J. Wong   2017-10-17  484  
13791d3b833428 Darrick J. Wong   2017-10-31  485  	/* Check the whole block, if necessary. */
c517b3aa02cff1 Darrick J. Wong   2018-07-19  486  	error = xchk_xattr_block(ds, level);
13791d3b833428 Darrick J. Wong   2017-10-31  487  	if (error)
13791d3b833428 Darrick J. Wong   2017-10-31  488  		goto out;
13791d3b833428 Darrick J. Wong   2017-10-31  489  	if (ds->sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
13791d3b833428 Darrick J. Wong   2017-10-31  490  		goto out;
13791d3b833428 Darrick J. Wong   2017-10-31  491  
eec0482e0829ea Darrick J. Wong   2017-10-17  492  	/* Check the hash of the entry. */
c517b3aa02cff1 Darrick J. Wong   2018-07-19  493  	error = xchk_da_btree_hash(ds, level, &ent->hashval);
eec0482e0829ea Darrick J. Wong   2017-10-17  494  	if (error)
eec0482e0829ea Darrick J. Wong   2017-10-17  495  		goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  496  
eec0482e0829ea Darrick J. Wong   2017-10-17  497  	/* Find the attr entry's location. */
eec0482e0829ea Darrick J. Wong   2017-10-17  498  	bp = blk->bp;
eec0482e0829ea Darrick J. Wong   2017-10-17  499  	hdrsize = xfs_attr3_leaf_hdr_size(bp->b_addr);
eec0482e0829ea Darrick J. Wong   2017-10-17  500  	nameidx = be16_to_cpu(ent->nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  501  	if (nameidx < hdrsize || nameidx >= mp->m_attr_geo->blksize) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  502  		xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  503  		goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  504  	}
eec0482e0829ea Darrick J. Wong   2017-10-17  505  
eec0482e0829ea Darrick J. Wong   2017-10-17  506  	/* Retrieve the entry and check it. */
eec0482e0829ea Darrick J. Wong   2017-10-17  507  	hash = be32_to_cpu(ent->hashval);
eec0482e0829ea Darrick J. Wong   2017-10-17  508  	badflags = ~(XFS_ATTR_LOCAL | XFS_ATTR_ROOT | XFS_ATTR_SECURE |
3c41934e739891 Allison Henderson 2024-01-09  509  			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT);
25308399c1406b Darrick J. Wong   2024-03-26  510  	if ((ent->flags & badflags) != 0) {
25308399c1406b Darrick J. Wong   2024-03-26  511  		xchk_da_set_corrupt(ds, level);
25308399c1406b Darrick J. Wong   2024-03-26 @512  		return error;
25308399c1406b Darrick J. Wong   2024-03-26  513  	}
25308399c1406b Darrick J. Wong   2024-03-26  514  	if (!xfs_attr_check_namespace(ent->flags)) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  515  		xchk_da_set_corrupt(ds, level);
25308399c1406b Darrick J. Wong   2024-03-26  516  		return error;
25308399c1406b Darrick J. Wong   2024-03-26  517  	}
25308399c1406b Darrick J. Wong   2024-03-26  518  
eec0482e0829ea Darrick J. Wong   2017-10-17  519  	if (ent->flags & XFS_ATTR_LOCAL) {
eec0482e0829ea Darrick J. Wong   2017-10-17  520  		lentry = (struct xfs_attr_leaf_name_local *)
eec0482e0829ea Darrick J. Wong   2017-10-17  521  				(((char *)bp->b_addr) + nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  522  		if (lentry->namelen <= 0) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  523  			xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  524  			goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  525  		}
dd3edd796680a0 Darrick J. Wong   2024-03-26  526  		calc_hash = xfs_attr_hashval(mp, ent->flags, lentry->nameval,
dd3edd796680a0 Darrick J. Wong   2024-03-26  527  					     lentry->namelen,
dd3edd796680a0 Darrick J. Wong   2024-03-26  528  					     lentry->nameval + lentry->namelen,
dd3edd796680a0 Darrick J. Wong   2024-03-26  529  					     be16_to_cpu(lentry->valuelen));
eec0482e0829ea Darrick J. Wong   2017-10-17  530  	} else {
eec0482e0829ea Darrick J. Wong   2017-10-17  531  		rentry = (struct xfs_attr_leaf_name_remote *)
eec0482e0829ea Darrick J. Wong   2017-10-17  532  				(((char *)bp->b_addr) + nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  533  		if (rentry->namelen <= 0) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  534  			xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  535  			goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  536  		}
dd3edd796680a0 Darrick J. Wong   2024-03-26  537  		calc_hash = xfs_attr_hashval(mp, ent->flags, rentry->name,
dd3edd796680a0 Darrick J. Wong   2024-03-26  538  					     rentry->namelen, NULL,
dd3edd796680a0 Darrick J. Wong   2024-03-26  539  					     be32_to_cpu(rentry->valuelen));
eec0482e0829ea Darrick J. Wong   2017-10-17  540  	}
eec0482e0829ea Darrick J. Wong   2017-10-17  541  	if (calc_hash != hash)
c517b3aa02cff1 Darrick J. Wong   2018-07-19  542  		xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  543  
eec0482e0829ea Darrick J. Wong   2017-10-17  544  out:
eec0482e0829ea Darrick J. Wong   2017-10-17  545  	return error;
eec0482e0829ea Darrick J. Wong   2017-10-17  546  }
eec0482e0829ea Darrick J. Wong   2017-10-17  547  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
