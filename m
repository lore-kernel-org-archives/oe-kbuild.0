Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35CA38E113
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458345; cv=none; b=KKIwi2RRiTMoa8xMobnuKr9kZ4BeEUPBTGTcDfKOK34nd3zVI8EayU1EnO8O7jwqTedtEHK5FtFfh5fQftDvGe/hKNO56+BGbKUvl/I+Fo6FWt28NqmmE2J+4ZAiuwdGDMUPrztgu1fDswjkmCXVaYfscHyerXc4jUP72UqZjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458345; c=relaxed/simple;
	bh=5UXvHZflhrusm5i400VcOOidT2fkvstF7WLh7mRa73c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bW3ejgSFJvIdiOx4fV7thaQ1Eemv+Tvr3gfhPV8IgIna+SJfCQBjE7JEZ2CRKFxu1PndZ+s0bktSyE/I5+IIZbQJ69CMQgukSDJKOaIvc0TwRkSyr1V+QodwygQWDR+TzeSBh9blD/wCe0oVOwljrIjDDo3Pex6UGhLLFZ/UtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1efcdhQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1efcdhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784458343; x=1815994343;
  h=date:from:to:cc:subject:message-id;
  bh=5UXvHZflhrusm5i400VcOOidT2fkvstF7WLh7mRa73c=;
  b=X1efcdhQjYhMQeqV+8Vuiot8uREJgXFStzDBDv//x7W9kXsT+5g64gKa
   NrGhhszlX1oA1AaANSFlb/eAud208MQe/MbLlOhoyqWiQbJg7s/3PJCe2
   CIc8104Q5s7k2XaAD0L0ynVIrOrZ7mqExrcah85wA2mB9aa6Wn6s7knhL
   TlPE1wnU7MNhIxeTfeU3JN47Mi2IlTwCkf2pHn+a4mbQOljGI2SUBO/EB
   VtMdbx93lJpMW3G+vWvcKwUudWIv2SE9oUyOpQLyhF7IX+sJq0T05FKmD
   FuVfcmMth2XSCLVFexMyyZCDnnjju2ruI0tlaDBzEyjFdtOJtodCTpTma
   Q==;
X-CSE-ConnectionGUID: z8ptB9LGSte8D5kCzB3tcw==
X-CSE-MsgGUID: DsO4wgJuRYCiDsYJ3r1hdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="85087129"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="85087129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 03:52:23 -0700
X-CSE-ConnectionGUID: gS803EuNSC+9ySdJLhEDHg==
X-CSE-MsgGUID: dg+za7J6Sim4rF/+a/yFVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="255422397"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Jul 2026 03:52:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlP86-00000000VPl-1ij3;
	Sun, 19 Jul 2026 10:52:18 +0000
Date: Sun, 19 Jul 2026 18:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/inode.c:1924:45-46: WARNING: atomic_add_unless
Message-ID: <202607191803.vYS3E9ez-lkp@intel.com>
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
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 9e70e985bdc2c6fe7a160e4d59ddd7c0a39bc077 fs: rework iput logic
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260719/202607191803.vYS3E9ez-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e70e985bdc2 ("fs: rework iput logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607191803.vYS3E9ez-lkp@intel.com/

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
