Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77C299943
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925238; cv=none; b=k4rmj3X2FQyER3WLSlLo2kqNOP85LK0H6JvrMbt9jRcCeAvCSYJhVOR9OtRtT7KuUiVYLvIuCIoGQ53Q4klcG0SYNDf8UUpY4Zl4vqJEr+hLhIr2XS7iZGq/im931rerD8ih3Qmdr0ii6KPAOJZiarSkccgjNT0njPLq5PPMWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925238; c=relaxed/simple;
	bh=nMtLDbpVe+BqEIb4tShyxwSBHLeFnVijsLFo0jjHdDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHYAsuaUkjIEGpR/+SzQRR6N9tep04LVZBCvma3zkgciqWLPU4jA7REgdXaa8JrcpBKtxM/cI8q9dQuS22Jl1RUwh9TvBGs0/u3q3Tdo8TKsHjR4toDuT/KwTxmaFkQCtEPql+N5a5UQh96JKUg/lG0SU+MbCoDGh1EkAWEtyBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzljD3hX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzljD3hX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790925237; x=1822461237;
  h=date:from:to:cc:subject:message-id;
  bh=nMtLDbpVe+BqEIb4tShyxwSBHLeFnVijsLFo0jjHdDo=;
  b=YzljD3hXkX9HY4X0hPFKNE7YXPA7vRQ3wZCP3RfPN+h51EZW9EmqUOWE
   TvGnHbJXPFmorRLwpQ/qPgQTsEiTmPkJNfF0Ovl7OcVwxXFDa0QW4THiS
   Lfg55FQGh7uVvgQf6m/H2SuojYvHjYhn9u/Vrk/Y6cBJ1XXdLnQFVj7xC
   BCWbfK5pMKCZaZfdQCKVZ3u4bIFKmFEcPtGy2jdWqTokgN8y3/EX8/T5S
   vhg6jJu15+ubMoy/8Ebp/l0i1nryghINgmeVtua/m/9u++khco/ep1nvF
   sXV0m1ywlEm5vrJJOPQmgZPcK+8S5R47o5Y/4vQMAac6Fc1JDziWA8gBo
   A==;
X-CSE-ConnectionGUID: IkUbRjKbQaSR2tBAEFD9Qw==
X-CSE-MsgGUID: EZoJ/rn3QMSmooAU+gFqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94178126"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94178126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:13:56 -0700
X-CSE-ConnectionGUID: 1qo/GSoyTdiq2hzDmFeobg==
X-CSE-MsgGUID: DF713YmURcO83CT+7q2FCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279479011"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2026 00:13:55 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCXSp-000000000SB-2skb;
	Fri, 02 Oct 2026 07:13:51 +0000
Date: Fri, 02 Oct 2026 09:13:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202610020909.QkfhfWQa-lkp@intel.com>
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
head:   ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-r2107-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020909.QkfhfWQa-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e70e985bdc2 ("fs: rework iput logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610020909.QkfhfWQa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/inode.c:1924:45-46: WARNING: atomic_add_unless

vim +1924 fs/inode.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  1899  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1900  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  1901   *	iput	- put an inode
^1da177e4c3f415 Linus Torvalds 2005-04-16  1902   *	@inode: inode to put
^1da177e4c3f415 Linus Torvalds 2005-04-16  1903   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  1904   *	Puts an inode, dropping its usage count. If the inode use count hits
^1da177e4c3f415 Linus Torvalds 2005-04-16  1905   *	zero, the inode is then freed and may also be destroyed.
^1da177e4c3f415 Linus Torvalds 2005-04-16  1906   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  1907   *	Consequently, iput() can sleep.
^1da177e4c3f415 Linus Torvalds 2005-04-16  1908   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  1909  void iput(struct inode *inode)
^1da177e4c3f415 Linus Torvalds 2005-04-16  1910  {
9e70e985bdc2c6f Josef Bacik    2025-08-26  1911  	if (unlikely(!inode))
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1912  		return;
9e70e985bdc2c6f Josef Bacik    2025-08-26  1913  
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1914  retry:
9e70e985bdc2c6f Josef Bacik    2025-08-26  1915  	lockdep_assert_not_held(&inode->i_lock);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1916  	VFS_BUG_ON_INODE(inode->i_state & I_CLEAR, inode);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1917  	/*
9e70e985bdc2c6f Josef Bacik    2025-08-26  1918  	 * Note this assert is technically racy as if the count is bogusly
9e70e985bdc2c6f Josef Bacik    2025-08-26  1919  	 * equal to one, then two CPUs racing to further drop it can both
9e70e985bdc2c6f Josef Bacik    2025-08-26  1920  	 * conclude it's fine.
9e70e985bdc2c6f Josef Bacik    2025-08-26  1921  	 */
9e70e985bdc2c6f Josef Bacik    2025-08-26  1922  	VFS_BUG_ON_INODE(atomic_read(&inode->i_count) < 1, inode);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1923  
9e70e985bdc2c6f Josef Bacik    2025-08-26 @1924  	if (atomic_add_unless(&inode->i_count, -1, 1))
9e70e985bdc2c6f Josef Bacik    2025-08-26  1925  		return;
9e70e985bdc2c6f Josef Bacik    2025-08-26  1926  
9e70e985bdc2c6f Josef Bacik    2025-08-26  1927  	if ((inode->i_state & I_DIRTY_TIME) && inode->i_nlink) {
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1928  		trace_writeback_lazytime_iput(inode);
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1929  		mark_inode_dirty_sync(inode);
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1930  		goto retry;
0ae45f63d4ef8d8 Theodore Ts'o  2015-02-02  1931  	}
9e70e985bdc2c6f Josef Bacik    2025-08-26  1932  
9e70e985bdc2c6f Josef Bacik    2025-08-26  1933  	spin_lock(&inode->i_lock);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1934  	if (unlikely((inode->i_state & I_DIRTY_TIME) && inode->i_nlink)) {
9e70e985bdc2c6f Josef Bacik    2025-08-26  1935  		spin_unlock(&inode->i_lock);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1936  		goto retry;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1937  	}
9e70e985bdc2c6f Josef Bacik    2025-08-26  1938  
9e70e985bdc2c6f Josef Bacik    2025-08-26  1939  	if (!atomic_dec_and_test(&inode->i_count)) {
9e70e985bdc2c6f Josef Bacik    2025-08-26  1940  		spin_unlock(&inode->i_lock);
9e70e985bdc2c6f Josef Bacik    2025-08-26  1941  		return;
9e70e985bdc2c6f Josef Bacik    2025-08-26  1942  	}
9e70e985bdc2c6f Josef Bacik    2025-08-26  1943  
9e70e985bdc2c6f Josef Bacik    2025-08-26  1944  	/*
9e70e985bdc2c6f Josef Bacik    2025-08-26  1945  	 * iput_final() drops ->i_lock, we can't assert on it as the inode may
9e70e985bdc2c6f Josef Bacik    2025-08-26  1946  	 * be deallocated by the time the call returns.
9e70e985bdc2c6f Josef Bacik    2025-08-26  1947  	 */
9e70e985bdc2c6f Josef Bacik    2025-08-26  1948  	iput_final(inode);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1949  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  1950  EXPORT_SYMBOL(iput);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1951  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
