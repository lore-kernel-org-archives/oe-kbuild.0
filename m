Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486323054C7
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180363; cv=none; b=UlcBZHnuJcrepTD6bnTXnVDtrkPRN+fu4PuxG3z4RgRDHeMjbs0zV/3qj9qQrOiHNqAw4v9NjjacCdX7f0hdqsxWHJqp81idjgcH7/vyQXoVVro/VFyoM6XW0FiE1NtNg1kfA7HTcVZTUtG9zHfdcPZizZywbrQlQewy1MSWnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180363; c=relaxed/simple;
	bh=h4Qn/E5tAFprYvzUgxDQoR2hBOv3NS13heJi56PNz8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXFr/Csod5onIJFBJE7vaFGkfugkadnIsRPfQFyY0FLYCnB38cl8YyfDc0EfvMg5w5MI+ETFgQqPEmlU/FTtHEx7tYkCt8dL+WeVCJ132k2HcKXL/EMS5hH1l8d+d8AGnzbu10/ix4ui2s7QFvIiZDmOvMMTFmqcSk/pCz1qTgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kt6E9oJ4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kt6E9oJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781180361; x=1812716361;
  h=date:from:to:cc:subject:message-id;
  bh=h4Qn/E5tAFprYvzUgxDQoR2hBOv3NS13heJi56PNz8E=;
  b=kt6E9oJ4Fo6GFxtEzR9PjbxRaGFXxwqqVEJl+ESbukzC2X/sIEo/5R0x
   92nXowFMwKxBxR/LyLBWUs6V0L4N8bQsMUBPSsiEH/1+8DOvEYLz2Dd9S
   UiK0KQeaDozMQmy3/iXBDvYQGhuSdMf6yhgQ4bt49hPJ4EWr8Oqdv2EAe
   c6Z+SJ/4BppI90BhrUugfbxvrcfsUCNP37jDfxR47joj18u4dEeEgyWTS
   Ap+ubl50FBTin01+hlGSg0KzO0f1RJt9hkojr9jhBeaIFLhJv9l+SVJ7e
   rZ9UjKXDWitEp5WmuJBdYMzsMqik7etxQgGOuAer6Rz0q0FzYmbTqG2e0
   Q==;
X-CSE-ConnectionGUID: OqhL/gzKSWiWKO5z9+5wZg==
X-CSE-MsgGUID: B0SL4TtMTnuNh0uq4tcVAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99567450"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99567450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:19:20 -0700
X-CSE-ConnectionGUID: QTMxCCA7S+6wSSXg7XDm2A==
X-CSE-MsgGUID: 9x5xqbV6SMSxWMFIHDOqcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251558330"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 05:19:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXeNQ-00000000MwI-3xWi;
	Thu, 11 Jun 2026 12:19:16 +0000
Date: Thu, 11 Jun 2026 20:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202606112012.rV4AG324-lkp@intel.com>
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
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: s390-randconfig-r054-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112012.rV4AG324-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e70e985bdc2 ("fs: rework iput logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606112012.rV4AG324-lkp@intel.com/

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
