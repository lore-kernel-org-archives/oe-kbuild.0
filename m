Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBED29E0E5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455424; cv=none; b=FoVubgEdBvmFeZ9eUq8+WITXnmJnlCQoARRDnH01HKtIk/y3i6F+eY02Ss1ITnFb4zo6O6U2RHWe5iZ1QfxRScy1BVwWqtGF7W1t+/IqQezpNLJ/UHCzei4Wh5xpHU9c4XSUKiTzwVx2dPEgqZexQ1RjP67PBlQAV+d8xK78iQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455424; c=relaxed/simple;
	bh=xMwe+nonnvOa1qyyX0KkvRqW0C9X0jv2x8IAZuJ/vXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1TgXLH3aSocNyMtH9qpw5ts5fs1wO9qsXfMFpqbUjBa/u5ORfeBjX0+mIOoRmUy/v9hJKyE/kGAI3+4MXAGybQu9IVaJCTOq0Z/0ILlB2ppjvfte2e9vOQ1RrNftr3f2Qy+iSu8ff3+W7zlofqIDSaK3PsJyc+L8iUzoj1ruxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/UUBtSw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/UUBtSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765455423; x=1796991423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMwe+nonnvOa1qyyX0KkvRqW0C9X0jv2x8IAZuJ/vXQ=;
  b=W/UUBtSwXAgbHpS/ULqTxSj874yGD2z/MM21q9gOTyqOb6GIzhB4uWA4
   4XE6iJpDv1vNI0kaHLQ5NJqeZNHwD5hbSfpCtYEoEUVOPsKoS4+uzan2+
   DcnmH+Af5zt/fLGQ7fyRDNK5RtHWz1WrF8Qf7Owq+CRgDf8ep0lSYppMj
   mlyETIj3EgUjfj0zWUxrEkUdDPZeSGuxWRq7lODWPw7FouBfuqYey5pII
   2YsngHINMCUE8Vihu1QP+x3iRmmXnU5UpdM6oA3i1pscDl909HkTym2VZ
   HgWRCOYwLzRD+PscxuCmcNdhjJEYUe/Zlin+gqduy8hvFS0q0GIMbtHEx
   Q==;
X-CSE-ConnectionGUID: AnxquEu8RiiqUpvC8c4EAg==
X-CSE-MsgGUID: 6/H8IMIjRqqCQrGAEzoh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92914609"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="92914609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:17:00 -0800
X-CSE-ConnectionGUID: 32ukiMDIQN2udf67uj0zAw==
X-CSE-MsgGUID: y6BYGIeiRzWP0K9oynmFqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="197266531"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 04:16:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfbN-000000004d1-0jrI;
	Thu, 11 Dec 2025 12:16:57 +0000
Date: Thu, 11 Dec 2025 20:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/inode.c:1948 iput() warn: inconsistent returns '&inode->i_lock'.
Message-ID: <202512112020.i3lLyQNv-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Mateusz Guzik <mjguzik@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112020.i3lLyQNv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512112020.i3lLyQNv-lkp@intel.com/

smatch warnings:
fs/inode.c:1948 iput() warn: inconsistent returns '&inode->i_lock'.

vim +1948 fs/inode.c

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
9e70e985bdc2c6 Josef Bacik    2025-08-26  1924  	if (atomic_add_unless(&inode->i_count, -1, 1))
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
9e70e985bdc2c6 Josef Bacik    2025-08-26 @1948  	iput_final(inode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1949  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1950  EXPORT_SYMBOL(iput);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
