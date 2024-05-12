Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1A17F3
	for <oe-kbuild@lists.linux.dev>; Sun, 12 May 2024 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715521019; cv=none; b=eaNBaLHd1MfXfs0nSYogFjWnvT52LiE8YQCPZ1goDqkecW4+1FQ2n+BbPHdOfLpu9FY4jcxamzQR37fyNmrgLQgLi63yIVw55DEB6v1GGQc0C/xdzX8tXnnpiAI2W8P+xs1koxymJ7drNaoXGRh71JceSoKicI9e7vrPE2PVoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715521019; c=relaxed/simple;
	bh=kCvsDzJOzGEM4jgZdZRu0O9z0AH9p1z8NrW4Ml2BBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiyXIxOuABAb77CeJS97OZtTlkaMjQ/DacmNQ81n1n8H93NyKPP2GVg8RSTaOQJVRfxkOG2cSnxBlJNenBOlCk+SDzAMQzIYDcQXQhU3UW7dRJvyDXlbO5thtc9+YvVrrimxT4+e/G9T75ZCJJmEjlBDF16j1YS1GWGJhkUify0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAK+TS55; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAK+TS55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715521018; x=1747057018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCvsDzJOzGEM4jgZdZRu0O9z0AH9p1z8NrW4Ml2BBKM=;
  b=PAK+TS55uR9wQjf05aIr9DtbvJVOoF9x8SUfMaq60cSbBWVdgT8e83cz
   Hyr7qFTAEJ8DQhUmFvhjGyQ/nteHwDts7AvMnnFyqXCIdf8EADYFKbQbh
   O+9kagRn9PuZEAnHRbo2gLt3SJ9tNQFpuF/sw3jEm/0G+oeayyThTmU0t
   UQCZI/L3JO2utnW44Dv5q0WHQbw0oaCg2Xv9zE20Zkru4RWSw9mHPzG3Z
   5x4SqgSwiGbNSE1Oy1kFAkN5taQrpa1SPAbuDnNaCPzEvAnY+EbwWa+kV
   XjEzVFKGgokbBYvxOAHUogXRWS0y0p3coGvBQcy7gsnrc0b6ncxvfRj9K
   g==;
X-CSE-ConnectionGUID: T691M7KwROqtwaV2xlPxfw==
X-CSE-MsgGUID: zua/HhqKQkywWYugpbwvgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15294269"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="15294269"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 06:36:57 -0700
X-CSE-ConnectionGUID: nmN7BAOPTg2p9HtOE81Skw==
X-CSE-MsgGUID: 8o98nGiWRHa+3dhId8dcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30163425"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2024 06:36:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s69Nl-0008cp-0l;
	Sun, 12 May 2024 13:36:53 +0000
Date: Sun, 12 May 2024 21:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:timestats-hoist 451/463] fs/xfs/scrub/common.c:1904
 xchk_inode_setup_verity() error: uninitialized symbol 'bs'.
Message-ID: <202405122129.2of8VK2K-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   487b4161dcf5131acc86e2e942f7bc2eb6e2891d
commit: 5086db83c78df01a341f9db1839c3d994940ed3d [451/463] xfs: check and repair the verity inode flag state
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20240512 (https://download.01.org/0day-ci/archive/20240512/202405122129.2of8VK2K-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405122129.2of8VK2K-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/common.c:1904 xchk_inode_setup_verity() error: uninitialized symbol 'bs'.
fs/xfs/scrub/common.c:1906 xchk_inode_setup_verity() error: uninitialized symbol 'ts'.

vim +/bs +1904 fs/xfs/scrub/common.c

1acb75b692cefc Darrick J. Wong 2024-01-09  1875  
5086db83c78df0 Darrick J. Wong 2024-04-26  1876  /*
5086db83c78df0 Darrick J. Wong 2024-04-26  1877   * If this inode has S_VERITY set on it, read the merkle tree geometry, which
5086db83c78df0 Darrick J. Wong 2024-04-26  1878   * will activate the incore fsverity context for this file.  If the activation
5086db83c78df0 Darrick J. Wong 2024-04-26  1879   * fails with anything other than ENOMEM, the file is corrupt, which we can
5086db83c78df0 Darrick J. Wong 2024-04-26  1880   * detect later with fsverity_active.
5086db83c78df0 Darrick J. Wong 2024-04-26  1881   *
5086db83c78df0 Darrick J. Wong 2024-04-26  1882   * Callers must hold the IOLOCK and must not hold the ILOCK of sc->ip because
5086db83c78df0 Darrick J. Wong 2024-04-26  1883   * activation reads xattrs.  @blocksize and @treesize will be filled out with
5086db83c78df0 Darrick J. Wong 2024-04-26  1884   * merkle tree geometry if they are not NULL pointers.
5086db83c78df0 Darrick J. Wong 2024-04-26  1885   */
5086db83c78df0 Darrick J. Wong 2024-04-26  1886  int
5086db83c78df0 Darrick J. Wong 2024-04-26  1887  xchk_inode_setup_verity(
5086db83c78df0 Darrick J. Wong 2024-04-26  1888  	struct xfs_scrub	*sc,
5086db83c78df0 Darrick J. Wong 2024-04-26  1889  	unsigned int		*blocksize,
5086db83c78df0 Darrick J. Wong 2024-04-26  1890  	u64			*treesize)
5086db83c78df0 Darrick J. Wong 2024-04-26  1891  {
5086db83c78df0 Darrick J. Wong 2024-04-26  1892  	unsigned int		bs;
5086db83c78df0 Darrick J. Wong 2024-04-26  1893  	u64			ts;
5086db83c78df0 Darrick J. Wong 2024-04-26  1894  	int			error;
5086db83c78df0 Darrick J. Wong 2024-04-26  1895  
5086db83c78df0 Darrick J. Wong 2024-04-26  1896  	if (!IS_VERITY(VFS_I(sc->ip)))
5086db83c78df0 Darrick J. Wong 2024-04-26  1897  		return 0;
5086db83c78df0 Darrick J. Wong 2024-04-26  1898  
5086db83c78df0 Darrick J. Wong 2024-04-26  1899  	error = fsverity_merkle_tree_geometry(VFS_I(sc->ip), &bs, &ts);
5086db83c78df0 Darrick J. Wong 2024-04-26  1900  	switch (error) {
5086db83c78df0 Darrick J. Wong 2024-04-26  1901  	case 0:
5086db83c78df0 Darrick J. Wong 2024-04-26  1902  		/* fsverity is active; return tree geometry. */
5086db83c78df0 Darrick J. Wong 2024-04-26  1903  		if (blocksize)
5086db83c78df0 Darrick J. Wong 2024-04-26 @1904  			*blocksize = bs;
5086db83c78df0 Darrick J. Wong 2024-04-26  1905  		if (treesize)
5086db83c78df0 Darrick J. Wong 2024-04-26 @1906  			*treesize = ts;
5086db83c78df0 Darrick J. Wong 2024-04-26  1907  		break;
5086db83c78df0 Darrick J. Wong 2024-04-26  1908  	case -ENODATA:
5086db83c78df0 Darrick J. Wong 2024-04-26  1909  	case -EMSGSIZE:
5086db83c78df0 Darrick J. Wong 2024-04-26  1910  	case -EINVAL:
5086db83c78df0 Darrick J. Wong 2024-04-26  1911  	case -EFSCORRUPTED:
5086db83c78df0 Darrick J. Wong 2024-04-26  1912  	case -EFBIG:
5086db83c78df0 Darrick J. Wong 2024-04-26  1913  		/*
5086db83c78df0 Darrick J. Wong 2024-04-26  1914  		 * The nonzero errno codes above are the error codes that can
5086db83c78df0 Darrick J. Wong 2024-04-26  1915  		 * be returned from fsverity on metadata validation errors.
5086db83c78df0 Darrick J. Wong 2024-04-26  1916  		 * Set the geometry to zero.
5086db83c78df0 Darrick J. Wong 2024-04-26  1917  		 */
5086db83c78df0 Darrick J. Wong 2024-04-26  1918  		if (blocksize)
5086db83c78df0 Darrick J. Wong 2024-04-26  1919  			*blocksize = 0;
5086db83c78df0 Darrick J. Wong 2024-04-26  1920  		if (treesize)
5086db83c78df0 Darrick J. Wong 2024-04-26  1921  			*treesize = 0;
5086db83c78df0 Darrick J. Wong 2024-04-26  1922  		return 0;
5086db83c78df0 Darrick J. Wong 2024-04-26  1923  	default:
5086db83c78df0 Darrick J. Wong 2024-04-26  1924  		/* runtime errors */
5086db83c78df0 Darrick J. Wong 2024-04-26  1925  		return error;
5086db83c78df0 Darrick J. Wong 2024-04-26  1926  	}
5086db83c78df0 Darrick J. Wong 2024-04-26  1927  
5086db83c78df0 Darrick J. Wong 2024-04-26  1928  	return 0;
5086db83c78df0 Darrick J. Wong 2024-04-26  1929  }
5086db83c78df0 Darrick J. Wong 2024-04-26  1930  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
