Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378673932C8
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654321; cv=none; b=T+pr46OeQruDximAOjaFqpUBikc/Fp7rhbSixqt70KnmUsQp+e2utoqUc3+995H19I3dftYAbLz38H5TxfSk4H1hRwP47zbklHQm+SeWgmhN/WxQ2HssDed6fA8jyJEvPVqDQ0Ev4AygmDdGHhOQzGNR7bCOIjA1l9IXN/7QGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654321; c=relaxed/simple;
	bh=rr9+KomkpuXE7m3CZibrQjWyJsilox2CYzyQf8P+nvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LwGlMLnwKbkwUHGQJODJYib5zTss7hce/JxO3CqyDX3/Kd/OC2wO2kHz75fb9Od2nIuFsJHUonefVgX0gHZbmqq6FYrNdnvEjL4Ibqphqdk7EG3EeOyI/LA//O5+Wz1ZZyV+1sciwEucI5z8/f9ggjubbgECF74xXzeHQA+Tkmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkZuNc4Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkZuNc4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787654319; x=1819190319;
  h=date:from:to:cc:subject:message-id;
  bh=rr9+KomkpuXE7m3CZibrQjWyJsilox2CYzyQf8P+nvk=;
  b=PkZuNc4YVEJAzBaQbhMWAsCOib6NcFYfWm5p31YhrBuf+BDHX7GX8lPm
   BpA9Krjl5HTU6BhvF8IPdkNPJrNsMEb618zvOpB7XPpHe30O+QFdI5Z/L
   CG/s8bw39YZyrm0f6q38NPR2xbAakwQBpCJh5bpCiNW/m77qE4qnpWc33
   EWHezY0UT27Ws+aWnQByghOVi2d2FwqTrhVYLOwx+LvngbLWMKirvZ2W1
   c7Euw5WpzLoudzWBU6u0zyHpe7HCnqpyVsyefvTjEhQ3krxTusaEf6thA
   umCmtZiK96UkJHEk+0nYD9U+PEq0NU3InXl934wetVt9lYyzCGr4J40Np
   Q==;
X-CSE-ConnectionGUID: SMAl6DvkRK6YwNS3UKZxjA==
X-CSE-MsgGUID: MCVA+wivQOaCp/p5B90Pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98706668"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98706668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:38:38 -0700
X-CSE-ConnectionGUID: IcVth0dQTqORNzU/1AaCIA==
X-CSE-MsgGUID: nfLRiSSFTXuAm+Or4LLE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267825006"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 03:38:36 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyoY5-000000005gh-28VU;
	Tue, 25 Aug 2026 10:38:33 +0000
Date: Tue, 25 Aug 2026 18:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202608251841.1Hnx2vuQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Mateusz Guzik <mjguzik@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   12 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-054-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251841.1Hnx2vuQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e70e985bdc2 ("fs: rework iput logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608251841.1Hnx2vuQ-lkp@intel.com/

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
9e70e985bdc2c6 Josef Bacik    2025-08-26  1911  	if (unlikely(!inode))
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1912  		return;
9e70e985bdc2c6 Josef Bacik    2025-08-26  1913  
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1914  retry:
9e70e985bdc2c6 Josef Bacik    2025-08-26  1915  	lockdep_assert_not_held(&inode->i_lock);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1916  	VFS_BUG_ON_INODE(inode->i_state & I_CLEAR, inode);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1917  	/*
9e70e985bdc2c6 Josef Bacik    2025-08-26  1918  	 * Note this assert is technically racy as if the count is bogusly
9e70e985bdc2c6 Josef Bacik    2025-08-26  1919  	 * equal to one, then two CPUs racing to further drop it can both
9e70e985bdc2c6 Josef Bacik    2025-08-26  1920  	 * conclude it's fine.
9e70e985bdc2c6 Josef Bacik    2025-08-26  1921  	 */
9e70e985bdc2c6 Josef Bacik    2025-08-26  1922  	VFS_BUG_ON_INODE(atomic_read(&inode->i_count) < 1, inode);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1923  
9e70e985bdc2c6 Josef Bacik    2025-08-26 @1924  	if (atomic_add_unless(&inode->i_count, -1, 1))
9e70e985bdc2c6 Josef Bacik    2025-08-26  1925  		return;
9e70e985bdc2c6 Josef Bacik    2025-08-26  1926  
9e70e985bdc2c6 Josef Bacik    2025-08-26  1927  	if ((inode->i_state & I_DIRTY_TIME) && inode->i_nlink) {
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1928  		trace_writeback_lazytime_iput(inode);
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1929  		mark_inode_dirty_sync(inode);
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1930  		goto retry;
0ae45f63d4ef8d Theodore Ts'o  2015-02-02  1931  	}
9e70e985bdc2c6 Josef Bacik    2025-08-26  1932  
9e70e985bdc2c6 Josef Bacik    2025-08-26  1933  	spin_lock(&inode->i_lock);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1934  	if (unlikely((inode->i_state & I_DIRTY_TIME) && inode->i_nlink)) {
9e70e985bdc2c6 Josef Bacik    2025-08-26  1935  		spin_unlock(&inode->i_lock);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1936  		goto retry;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1937  	}
9e70e985bdc2c6 Josef Bacik    2025-08-26  1938  
9e70e985bdc2c6 Josef Bacik    2025-08-26  1939  	if (!atomic_dec_and_test(&inode->i_count)) {
9e70e985bdc2c6 Josef Bacik    2025-08-26  1940  		spin_unlock(&inode->i_lock);
9e70e985bdc2c6 Josef Bacik    2025-08-26  1941  		return;
9e70e985bdc2c6 Josef Bacik    2025-08-26  1942  	}
9e70e985bdc2c6 Josef Bacik    2025-08-26  1943  
9e70e985bdc2c6 Josef Bacik    2025-08-26  1944  	/*
9e70e985bdc2c6 Josef Bacik    2025-08-26  1945  	 * iput_final() drops ->i_lock, we can't assert on it as the inode may
9e70e985bdc2c6 Josef Bacik    2025-08-26  1946  	 * be deallocated by the time the call returns.
9e70e985bdc2c6 Josef Bacik    2025-08-26  1947  	 */
9e70e985bdc2c6 Josef Bacik    2025-08-26  1948  	iput_final(inode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1949  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1950  EXPORT_SYMBOL(iput);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1951  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
