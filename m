Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211920ED
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737956; cv=none; b=mWxkKjY28KEUlnE4fycBOECMYfa2185qASRMfPZ/QatRxMJat709KzR/9xekqi7xbEgCVZuSm3j1rPNlv6xH70k6Hxo96Ta5TH5nF82N2TwcEYpSffc06nUnuRZM8Vn/2NLVwDZL70wR7YhKA/SpIcxdMXf7v8+4y/vFSHDK5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737956; c=relaxed/simple;
	bh=GuVZ5dHuD6yumo82HMY6LODA2anJfEuxBianBNLu0pM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNNBsKyiSPUr22wwOPDKjM8+fMnlR05gi3riP2UacHQo98OAHOHDYSZ2eoYOQcsNwSnJj770E8coMq5JFQ0TsgdCeet2qstScTilJsWJULtOg5Qd3O447TNMW91OwONpVBhhdzY3MJMtg4sqRaRaOd1uM+GV+2eCgQ2w0jokzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+WyUMA3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+WyUMA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768737954; x=1800273954;
  h=date:from:to:cc:subject:message-id;
  bh=GuVZ5dHuD6yumo82HMY6LODA2anJfEuxBianBNLu0pM=;
  b=T+WyUMA3J1aZrv9T7ioQwJNPHmNuQfNLgKzlyXmCl/GG7awmfMsy0bk5
   Hj3O6pa9jbDWbz8qCP+qdwzvaH/yzzH0vSNy+A8gbA8LtXSkZ/LTW3bL5
   yoaNbPKvQvVugYdStJq+psQnTpdJXpGD6OLHsxuE6HDHHrNM8EzyMiF50
   t058adgbzMkL3tGss+15jCZhlem94i5wecDWRlOXEc/j/gGbJ6qwl7amY
   G+g33X0tktqbrzPVt+bAZuAOQ8hqzRR+CtKN8pLFuALy1sZcBvtXEfJRJ
   CPBHkhcVk3NV8pNV0AktQbQ5L7Pwt7p2yN9+t1nFheWHP6mUKubEr61V5
   A==;
X-CSE-ConnectionGUID: QLOxOlNgT1Gz9F5Zhn2eng==
X-CSE-MsgGUID: hYYLcISFTnCDvFL0tmw7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87554237"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="87554237"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 04:05:53 -0800
X-CSE-ConnectionGUID: vPvtegbATq+3HmIWkS7U/A==
X-CSE-MsgGUID: 72ODxcaUT4aaJs8Lb6mg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205533794"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2026 04:05:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhRXR-00000000Mvy-1ri0;
	Sun, 18 Jan 2026 12:05:49 +0000
Date: Sun, 18 Jan 2026 20:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202601182021.XCz9allr-lkp@intel.com>
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
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-102-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182021.XCz9allr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601182021.XCz9allr-lkp@intel.com/

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
