Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC62B9B3
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142968; cv=none; b=nJFVCYJtDZLgKTBhX/xXZmooPE1/ex+NYquMpaLOHewiGoYw1QyMSWg+O7gHIHLJLkO3TLMht8WFZDuVLj19U5xhIeVTwTbqsUcUBzB2YyhlxghNK5YZLmmy+7JuGf6PtYVS2YyY4XnYUkqLjbqH+rvLeWHLKMXJSGctuX4u3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142968; c=relaxed/simple;
	bh=A6/Wd0fCz18+nCHGhzDqcGLaKUAti5h3PRZD8sfIADg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGiMvEdiI/1WUlcItqDENFQsVpC1pXRw31phU5XXVU2bivgk4Mm8Hsramk6x1Qfi8hbl1zdYU+9aJbmCNbtHNuPtYhIpAQw3Jn83TWEM8mjHlMCxiI1uJ7IbhFNb+iKzK+dcwDGoL6+HAsorEzOnZlR6/qO6R/j0oC775bm+d6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxOuxAMk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxOuxAMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721142964; x=1752678964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6/Wd0fCz18+nCHGhzDqcGLaKUAti5h3PRZD8sfIADg=;
  b=gxOuxAMkn2xY1xH0Xlh1X2S/tE8Vdnkksvkr7PCvYoY6c1gLj3J7YwAm
   eSKvs6GOldVU3nLeVmmUdp5qBeelzG4wvt0Gx23gEe+I5ZFUQEwsL1JoT
   e9NtUgNlBdHrXEcn+JAbL7Dta2N3dLRvE7hdnwNWrKkJQP/RRpL3OdBXA
   gx/QzTXfEm/0Yt89SK/JD5UXMv1Xfd2pS2svze4XNocw8+ZE02X7bophp
   q8weFNrjxVHG96XU62v7exenD6J6OJng4PYtbppwWB4W++2DFa7mNuNwE
   J1YnwUy0CpWHXJVm+9SlZVbdJhMXig34hPzJKjKz4IpSJ8lKYXH/ybo4U
   w==;
X-CSE-ConnectionGUID: 7EEjmAziTlyk2+AKOmIYKQ==
X-CSE-MsgGUID: LqWbwlLJSXeE5aJhUFjetg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18784794"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18784794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 08:16:02 -0700
X-CSE-ConnectionGUID: dC5eT0VeTSSgtrdovbw4Sw==
X-CSE-MsgGUID: +sXnRF8qQ/aGXAWwDI0MVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="50126374"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jul 2024 08:16:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTjuI-000fMc-2r;
	Tue, 16 Jul 2024 15:15:58 +0000
Date: Tue, 16 Jul 2024 23:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-per-rtg-inodes 2/3] fs/xfs/libxfs/xfs_imeta.c:107
 xfs_imeta_lookup_component() warn: missing unwind goto?
Message-ID: <202407162302.cKOegsRA-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-inodes
head:   97bcfdc4558fc6300487e92a782d1dd9228a1fc4
commit: 4b9f1b548721032058dc9afd1f8c909ec907484c [2/3] xfs: merge xfs_imeta_dir_lookup into xfs_imeta_lookup_component
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162302.cKOegsRA-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407162302.cKOegsRA-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_imeta.c:107 xfs_imeta_lookup_component() warn: missing unwind goto?

Old smatch warnings:
fs/xfs/libxfs/xfs_imeta.c:408 xfs_imeta_start_link() warn: missing error code 'error'

vim +107 fs/xfs/libxfs/xfs_imeta.c

2328cc72959ca5 Darrick J. Wong   2024-05-28   71  
2328cc72959ca5 Darrick J. Wong   2024-05-28   72  /*
4b9f1b54872103 Christoph Hellwig 2024-07-10   73   * Given a parent directory @dp and a metadata inode path component @xname,
4b9f1b54872103 Christoph Hellwig 2024-07-10   74   * Look up the inode number in the directory, returning it in @ino.
4b9f1b54872103 Christoph Hellwig 2024-07-10   75   * @xname.type must match the directory entry's ftype.
4b9f1b54872103 Christoph Hellwig 2024-07-10   76   *
2328cc72959ca5 Darrick J. Wong   2024-05-28   77   * Caller must hold ILOCK_EXCL.
2328cc72959ca5 Darrick J. Wong   2024-05-28   78   */
2328cc72959ca5 Darrick J. Wong   2024-05-28   79  static inline int
4b9f1b54872103 Christoph Hellwig 2024-07-10   80  xfs_imeta_lookup_component(
2328cc72959ca5 Darrick J. Wong   2024-05-28   81  	struct xfs_trans	*tp,
2328cc72959ca5 Darrick J. Wong   2024-05-28   82  	struct xfs_inode	*dp,
2328cc72959ca5 Darrick J. Wong   2024-05-28   83  	struct xfs_name		*xname,
2328cc72959ca5 Darrick J. Wong   2024-05-28   84  	xfs_ino_t		*ino)
2328cc72959ca5 Darrick J. Wong   2024-05-28   85  {
4b9f1b54872103 Christoph Hellwig 2024-07-10   86  	struct xfs_mount	*mp = dp->i_mount;
2328cc72959ca5 Darrick J. Wong   2024-05-28   87  	struct xfs_da_args	args = {
2328cc72959ca5 Darrick J. Wong   2024-05-28   88  		.trans		= tp,
2328cc72959ca5 Darrick J. Wong   2024-05-28   89  		.dp		= dp,
4b9f1b54872103 Christoph Hellwig 2024-07-10   90  		.geo		= mp->m_dir_geo,
2328cc72959ca5 Darrick J. Wong   2024-05-28   91  		.name		= xname->name,
2328cc72959ca5 Darrick J. Wong   2024-05-28   92  		.namelen	= xname->len,
4b9f1b54872103 Christoph Hellwig 2024-07-10   93  		.hashval	= xfs_dir2_hashname(mp, xname),
2328cc72959ca5 Darrick J. Wong   2024-05-28   94  		.whichfork	= XFS_DATA_FORK,
2328cc72959ca5 Darrick J. Wong   2024-05-28   95  		.op_flags	= XFS_DA_OP_OKNOENT,
2328cc72959ca5 Darrick J. Wong   2024-05-28   96  		.owner		= dp->i_ino,
2328cc72959ca5 Darrick J. Wong   2024-05-28   97  	};
2328cc72959ca5 Darrick J. Wong   2024-05-28   98  	int			error;
2328cc72959ca5 Darrick J. Wong   2024-05-28   99  
4b9f1b54872103 Christoph Hellwig 2024-07-10  100  	if (!S_ISDIR(VFS_I(dp)->i_mode))
4b9f1b54872103 Christoph Hellwig 2024-07-10  101  		goto corrupt;
4b9f1b54872103 Christoph Hellwig 2024-07-10  102  	if (xfs_is_shutdown(mp))
2328cc72959ca5 Darrick J. Wong   2024-05-28  103  		return -EIO;
2328cc72959ca5 Darrick J. Wong   2024-05-28  104  
2328cc72959ca5 Darrick J. Wong   2024-05-28  105  	error = xfs_dir_lookup_args(&args);
2328cc72959ca5 Darrick J. Wong   2024-05-28  106  	if (error)
2328cc72959ca5 Darrick J. Wong   2024-05-28 @107  		return error;
2328cc72959ca5 Darrick J. Wong   2024-05-28  108  
4b9f1b54872103 Christoph Hellwig 2024-07-10  109  	if (!xfs_verify_ino(mp, args.inumber))
4b9f1b54872103 Christoph Hellwig 2024-07-10  110  		goto corrupt;
4b9f1b54872103 Christoph Hellwig 2024-07-10  111  	if (xname->type != XFS_DIR3_FT_UNKNOWN && xname->type != args.filetype)
4b9f1b54872103 Christoph Hellwig 2024-07-10  112  		goto corrupt;
4b9f1b54872103 Christoph Hellwig 2024-07-10  113  
4b9f1b54872103 Christoph Hellwig 2024-07-10  114  	trace_xfs_imeta_lookup_component(dp, xname, args.inumber);
2328cc72959ca5 Darrick J. Wong   2024-05-28  115  	*ino = args.inumber;
2328cc72959ca5 Darrick J. Wong   2024-05-28  116  	return 0;
4b9f1b54872103 Christoph Hellwig 2024-07-10  117  corrupt:
4b9f1b54872103 Christoph Hellwig 2024-07-10  118  	xfs_fs_mark_sick(mp, XFS_SICK_FS_METADIR);
2328cc72959ca5 Darrick J. Wong   2024-05-28  119  	return -EFSCORRUPTED;
ebcc1a28a3df59 Darrick J. Wong   2024-05-28  120  }
2328cc72959ca5 Darrick J. Wong   2024-05-28  121  

:::::: The code at line 107 was first introduced by commit
:::::: 2328cc72959ca5f05754baa7d6439127fd311918 xfs: read and write metadata inode directory

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
