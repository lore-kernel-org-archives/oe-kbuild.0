Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC381EDA0E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756597240; cv=none; b=Devnvys8xzm5UvkU3ZpeL769EBbzByA19LQJJgGQRzMkRRo8m8YrjozxJ1M6K0DBoxtTcwnX6XEE2tNun7HjYXnIiTIylf5k5/UkYJZoEkWI1C1BT8I+QR5ATbZnwLboo2znFFDMxt4yEN7coKWruew+50WcSXBGj5b0sU9VDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756597240; c=relaxed/simple;
	bh=dq3b6raGACOtUZP23KrcEcHsfqLGJ8bN1DZAwd9/PXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dx+dwbPp1fOJSv+wM4CwnbUTZpezQQYyODQCkZ3MP7XhdZJ6kG2R0EpBRq8BXpYYq00xMK2ecGljlGQgLs0qw1eNCslr9HblokNrCouCyiokmRuI3Atin8+nVmoCynDw/xoMo5P23E+kKDQg8BUOCX/Z45Xy02dVloeG/ZoijKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inQD5d+T; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inQD5d+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756597238; x=1788133238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dq3b6raGACOtUZP23KrcEcHsfqLGJ8bN1DZAwd9/PXE=;
  b=inQD5d+TrC/lL5o2ORvNBtDh+oeo+S6OhBZYfAhm+FGG8D1cq5h9aojo
   WCqrDrNrJTNcwsumysg5TNPtUo8MshyAPDctS+SNxXGP0Rq3ZcbeGnFqT
   aNgjezaHQPzy0OTYl/avsoxeXKsW9YXzTaLQZBfkEJLdzYIP3dF3e2vXn
   ZOynTSrrLQByA+21fIbNlVvp4QBiUPSw1dre22pj/YpaEKI1wk9PVgb0l
   RcxZ7Lj3CWG+W1NaA1vdA+tA4HQFx4PbPafjDsJ9QPwKQntQJO4WVslkl
   eumcelDpVy7u+Pz2ttcD6ZrYylPqr/co4i9S3NrNR2ZxIeTRNrWvTJvOb
   g==;
X-CSE-ConnectionGUID: 9MBHSaqrRw6poxPRRWaQIw==
X-CSE-MsgGUID: OS9TS/pPSnu35KPV5X0TOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62676758"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62676758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 16:40:37 -0700
X-CSE-ConnectionGUID: YElUTB7SS0WCTtJU4V007g==
X-CSE-MsgGUID: 2KymSNmkTayY00x4RmMW+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170186614"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2025 16:40:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usVAe-000VlV-1H;
	Sat, 30 Aug 2025 23:40:00 +0000
Date: Sun, 31 Aug 2025 07:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [brauner-github:vfs-6.18.inode.refcount.preliminaries 4/5]
 fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202508310743.euHihnAz-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Josef Bacik <josef@toxicpanda.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Mateusz Guzik <mjguzik@gmail.com>

tree:   https://github.com/brauner/linux.git vfs-6.18.inode.refcount.preliminaries
head:   c06366d1d6aba8c5757b0a119a948ee37bfbc560
commit: 3cba19f6a00675fbc2af0987dfc90e216e6cfb74 [4/5] fs: rework iput logic
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-101-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310743.euHihnAz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508310743.euHihnAz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/inode.c:1924:45-46: WARNING: atomic_add_unless

vim +1924 fs/inode.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1899  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1900  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  1901   *	iput	- put an inode
^1da177e4c3f41 Linus Torvalds 2005-04-16  1902   *	@inode: inode to put
^1da177e4c3f41 Linus Torvalds 2005-04-16  1903   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  1904   *	Puts an inode, dropping its usage count. If the inode use count hits
^1da177e4c3f41 Linus Torvalds 2005-04-16  1905   *	zero, the inode is then freed and may also be destroyed.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1906   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  1907   *	Consequently, iput() can sleep.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1908   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1909  void iput(struct inode *inode)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1910  {
3cba19f6a00675 Josef Bacik    2025-08-26  1911  	if (unlikely(!inode))
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1912  		return;
3cba19f6a00675 Josef Bacik    2025-08-26  1913  
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1914  retry:
3cba19f6a00675 Josef Bacik    2025-08-26  1915  	lockdep_assert_not_held(&inode->i_lock);
3cba19f6a00675 Josef Bacik    2025-08-26  1916  	VFS_BUG_ON_INODE(inode->i_state & I_CLEAR, inode);
3cba19f6a00675 Josef Bacik    2025-08-26  1917  	/*
3cba19f6a00675 Josef Bacik    2025-08-26  1918          * Note this assert is technically racy as if the count is bogusly
3cba19f6a00675 Josef Bacik    2025-08-26  1919          * equal to one, then two CPUs racing to further drop it can both
3cba19f6a00675 Josef Bacik    2025-08-26  1920          * conclude it's fine.
3cba19f6a00675 Josef Bacik    2025-08-26  1921          */
3cba19f6a00675 Josef Bacik    2025-08-26  1922  	VFS_BUG_ON_INODE(atomic_read(&inode->i_count) < 1, inode);
3cba19f6a00675 Josef Bacik    2025-08-26  1923  
3cba19f6a00675 Josef Bacik    2025-08-26 @1924  	if (atomic_add_unless(&inode->i_count, -1, 1))
3cba19f6a00675 Josef Bacik    2025-08-26  1925  		return;
3cba19f6a00675 Josef Bacik    2025-08-26  1926  
3cba19f6a00675 Josef Bacik    2025-08-26  1927  	if ((inode->i_state & I_DIRTY_TIME) && inode->i_nlink) {
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1928  		trace_writeback_lazytime_iput(inode);
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1929  		mark_inode_dirty_sync(inode);
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1930  		goto retry;
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1931  	}
3cba19f6a00675 Josef Bacik    2025-08-26  1932  
3cba19f6a00675 Josef Bacik    2025-08-26  1933  	spin_lock(&inode->i_lock);
3cba19f6a00675 Josef Bacik    2025-08-26  1934  	if (unlikely((inode->i_state & I_DIRTY_TIME) && inode->i_nlink)) {
3cba19f6a00675 Josef Bacik    2025-08-26  1935  		spin_unlock(&inode->i_lock);
3cba19f6a00675 Josef Bacik    2025-08-26  1936  		goto retry;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1937  	}
3cba19f6a00675 Josef Bacik    2025-08-26  1938  
3cba19f6a00675 Josef Bacik    2025-08-26  1939  	if (!atomic_dec_and_test(&inode->i_count)) {
3cba19f6a00675 Josef Bacik    2025-08-26  1940  		spin_unlock(&inode->i_lock);
3cba19f6a00675 Josef Bacik    2025-08-26  1941  		return;
3cba19f6a00675 Josef Bacik    2025-08-26  1942  	}
3cba19f6a00675 Josef Bacik    2025-08-26  1943  
3cba19f6a00675 Josef Bacik    2025-08-26  1944  	/*
3cba19f6a00675 Josef Bacik    2025-08-26  1945          * iput_final() drops ->i_lock, we can't assert on it as the inode may
3cba19f6a00675 Josef Bacik    2025-08-26  1946          * be deallocated by the time the call returns.
3cba19f6a00675 Josef Bacik    2025-08-26  1947          */
3cba19f6a00675 Josef Bacik    2025-08-26  1948  	iput_final(inode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1949  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1950  EXPORT_SYMBOL(iput);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
