Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57D613774D
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588690; cv=none; b=JgdlX8A9Ud8eYhAIAlXZdYSEMYsdf+v6lo5j+0h/GYZbMjBzqypr468GJGyNtFJIRdVMpJiMF7+jNRUqBKrrKOArInljJvPVUEAOn6WHgA+Drd7ondH0OoMcnYHPrgLGDR5PBJC9IZ/IavtWEdIiszplNjohaAySRI5zmSLL1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588690; c=relaxed/simple;
	bh=8IjuOH5JJpx2cV67BshQmt0sEeYDLhW8ACQNrV5yAEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5q8xGkboiQnqRS60AOB3qXLJzOre8fy4yGtGypACxVVatHDCtMLemIzNxxxb4gJ9iGw34wPoCFcN0x1SSz43mG4IEWDy8Z5Q2QWyORONghMoJPW2RbMGBpAS31fIbKV67usEJfXvyIVTj+kpRih3S/EzghmEs6Zca3ui/sTCak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+mcwBP0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+mcwBP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756588689; x=1788124689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IjuOH5JJpx2cV67BshQmt0sEeYDLhW8ACQNrV5yAEM=;
  b=C+mcwBP0INZpkLfZEzqdMLLxWhL2PaQrcd6oStp3Bw9xtNwccL+S+sVX
   PTQhyqER7YhX63H4bfh93xgJEkhVZbmb2gZXOBg4rRdLTrcRH7UHxVMCs
   hQc6NdhYE9qForDHhsaUzqBCvLeeSw98lFdQ7TlUaE64yATeZ7dvfY1IZ
   q83Bft5vryo67TBlycE8ckQ/1yW4jK7ukblzufLmj+vyc3NIVaUusEbjP
   XEBbInuc4Gu18JhoURStMSiO8MTaZrB6Dw6PbjpwASti8HgziDS6VVI9G
   YLXC8OYIi5OO+uhuCE/UG9p99QyAaQr7xPg8LhGxTmwosjewTW2F1H0Bw
   Q==;
X-CSE-ConnectionGUID: EEKNoNYCQlG5izXTayiNAg==
X-CSE-MsgGUID: 33M6EWkfTzCQjDTiMZmksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81429388"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81429388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 14:18:08 -0700
X-CSE-ConnectionGUID: GfECGRwTSVWOwk+liS5Lcw==
X-CSE-MsgGUID: CrhUu5oOTVyWDVznwT6e5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194312202"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 14:18:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usSxY-000Vhj-2Q;
	Sat, 30 Aug 2025 21:18:04 +0000
Date: Sun, 31 Aug 2025 05:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs-6.18.inode.refcount.preliminaries 4/5]
 fs/inode.c:1948 iput() warn: inconsistent returns '&inode->i_lock'.
Message-ID: <202508310517.8dy7Pq7r-lkp@intel.com>
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
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310517.8dy7Pq7r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508310517.8dy7Pq7r-lkp@intel.com/

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
3cba19f6a00675 Josef Bacik    2025-08-26  1924  	if (atomic_add_unless(&inode->i_count, -1, 1))
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
3cba19f6a00675 Josef Bacik    2025-08-26 @1948  	iput_final(inode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1949  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1950  EXPORT_SYMBOL(iput);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
