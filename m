Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4F129A6B
	for <oe-kbuild@lists.linux.dev>; Thu,  9 May 2024 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294371; cv=none; b=rSoxaFsrOaaVUQhdI1MEY216X0VTwu7gF9XY/iG0AS8SceaSedXFFMRaLubHRv15Q2fSsTjlgXb/UwkB82VWHxHgT3gpExBVj5KaxJLQYHC5o8SfTX3GGsIxtXXUBPd5zF4dnRDSZI1dZjFWFYebd70l+jggWdcrd6qg7NA6FS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294371; c=relaxed/simple;
	bh=be+PFEORamRdnrRcWY1/a1Ab+quRqrajljsnKfkxbDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SfQ2H6/Jc/4r4dHQBYXL/zb3iUo8o4qegrG8DJsuv+bTjMrMG0xYLwP8aj0z8V0BCesMymL59aiGtgYUxUMS9bEM6tFr+6xKj68RtPbmFft1wH+Dzi+ipRyBmWE4wbtp+MH9OE55Ii4j1sgxMT9UtpIcB3gEQcKPPGK53AriVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALgnAhWI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALgnAhWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715294369; x=1746830369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=be+PFEORamRdnrRcWY1/a1Ab+quRqrajljsnKfkxbDE=;
  b=ALgnAhWIs0DEx2RpwgtqJ0HniYfTpTm+fO4sUbz2pCHSMxOW4nGpq0vf
   jnQV7FhzD8XuIPBJpHjGHgCigQ6uZ62JBolvOh5s9DraGIePl0Ucb9kMJ
   Aax2wzawPLpoggvaQNmcKTaIzE/f/7MDPuJg9kqg2S+u2SykEkD8NQJrJ
   FBpZsDVuktV15d5JAS6eUf3CABAAR1R1gc8nxfPBkJQT0b3xeTRae9REC
   r6N2HaqpmUy73lFsv/BvdOxh1Ob8UawG1videJe/pFIOm+/XEHsQbZ6Tz
   tDO67+bomjNcftxRIrK+n8ctcGb86kDJ6IKklO9mLFyETDpKtejGvLX3p
   Q==;
X-CSE-ConnectionGUID: WVhFUq8vQ2GJtxURyZrrNQ==
X-CSE-MsgGUID: yRux3WU2QZGruV4Ju/GkGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14202104"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="14202104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:39:28 -0700
X-CSE-ConnectionGUID: bGe0ERPvQsO6B4B5L2voug==
X-CSE-MsgGUID: ZSZFuYCTRVObR8cYMRc0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="52608042"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2024 15:39:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5CQ8-0005Rd-2n;
	Thu, 09 May 2024 22:39:24 +0000
Date: Fri, 10 May 2024 06:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7740/12321] fs/xfs/libxfs/xfs_dir2.c:415:1-5:
 alloc with no test, possible model on line 431
Message-ID: <202405100601.yF9nftCV-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Chandan Babu R <chandanbabu@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: 14ee22fef420c864c0869419e54aa4e88f64b4e6 [7740/12321] xfs: factor out a xfs_dir_lookup_args helper
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-103-20240509 (https://download.01.org/0day-ci/archive/20240510/202405100601.yF9nftCV-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405100601.yF9nftCV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_dir2.c:415:1-5: alloc with no test, possible model on line 431

vim +415 fs/xfs/libxfs/xfs_dir2.c

14ee22fef420c8 fs/xfs/libxfs/xfs_dir2.c Christoph Hellwig 2024-04-25  393  
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  394  /*
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  395   * Lookup a name in a directory, give back the inode number.
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  396   * If ci_name is not NULL, returns the actual name in ci_name if it differs
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  397   * to name, or ci_name->name is set to NULL for an exact match.
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  398   */
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  399  
f6c2d1fa6310a7 fs/xfs/xfs_dir2.c        Nathan Scott      2006-06-20  400  int
f6c2d1fa6310a7 fs/xfs/xfs_dir2.c        Nathan Scott      2006-06-20  401  xfs_dir_lookup(
996b2329b20a89 fs/xfs/libxfs/xfs_dir2.c Darrick J. Wong   2022-03-09  402  	struct xfs_trans	*tp,
996b2329b20a89 fs/xfs/libxfs/xfs_dir2.c Darrick J. Wong   2022-03-09  403  	struct xfs_inode	*dp,
996b2329b20a89 fs/xfs/libxfs/xfs_dir2.c Darrick J. Wong   2022-03-09  404  	const struct xfs_name	*name,
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  405  	xfs_ino_t		*inum,	  /* out: inode number */
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  406  	struct xfs_name		*ci_name) /* out: actual name if CI match */
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  407  {
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  408  	struct xfs_da_args	*args;
f6c2d1fa6310a7 fs/xfs/xfs_dir2.c        Nathan Scott      2006-06-20  409  	int			rval;
dbad7c993053d8 fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2015-08-19  410  	int			lock_mode;
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  411  
c19b3b05ae440d fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2016-02-09  412  	ASSERT(S_ISDIR(VFS_I(dp)->i_mode));
ff6d6af2351cae fs/xfs/libxfs/xfs_dir2.c Bill O'Donnell    2015-10-12  413  	XFS_STATS_INC(dp->i_mount, xs_dir_lookup);
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  414  
94a69db2367efc fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2024-01-16 @415  	args = kzalloc(sizeof(*args),
94a69db2367efc fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2024-01-16  416  			GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOFAIL);
0650b55497ef58 fs/xfs/xfs_dir2.c        Dave Chinner      2014-06-06  417  	args->geo = dp->i_mount->m_dir_geo;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  418  	args->name = name->name;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  419  	args->namelen = name->len;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  420  	args->filetype = name->type;
d8d11fc703a22b fs/xfs/libxfs/xfs_dir2.c Christoph Hellwig 2019-11-11  421  	args->hashval = xfs_dir2_hashname(dp->i_mount, name);
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  422  	args->dp = dp;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  423  	args->whichfork = XFS_DATA_FORK;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  424  	args->trans = tp;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  425  	args->op_flags = XFS_DA_OP_OKNOENT;
9eef772f3a194f fs/xfs/libxfs/xfs_dir2.c Darrick J. Wong   2024-04-15  426  	args->owner = dp->i_ino;
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  427  	if (ci_name)
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  428  		args->op_flags |= XFS_DA_OP_CILOOKUP;
f6c2d1fa6310a7 fs/xfs/xfs_dir2.c        Nathan Scott      2006-06-20  429  
dbad7c993053d8 fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2015-08-19  430  	lock_mode = xfs_ilock_data_map_shared(dp);
14ee22fef420c8 fs/xfs/libxfs/xfs_dir2.c Christoph Hellwig 2024-04-25 @431  	rval = xfs_dir_lookup_args(args);
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  432  	if (!rval) {
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  433  		*inum = args->inumber;
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  434  		if (ci_name) {
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  435  			ci_name->name = args->value;
a1358aa3d39251 fs/xfs/xfs_dir2.c        Dave Chinner      2014-02-27  436  			ci_name->len = args->valuelen;
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  437  		}
384f3ced07efdd fs/xfs/xfs_dir2.c        Barry Naujok      2008-05-21  438  	}
dbad7c993053d8 fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2015-08-19  439  	xfs_iunlock(dp, lock_mode);
d4c75a1b40cd03 fs/xfs/libxfs/xfs_dir2.c Dave Chinner      2024-01-16  440  	kfree(args);
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  441  	return rval;
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  442  }
^1da177e4c3f41 fs/xfs/xfs_dir2.c        Linus Torvalds    2005-04-16  443  

:::::: The code at line 415 was first introduced by commit
:::::: 94a69db2367efcd7e0eeb5d4603340aff1d3c340 xfs: use __GFP_NOLOCKDEP instead of GFP_NOFS

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Chandan Babu R <chandanbabu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
