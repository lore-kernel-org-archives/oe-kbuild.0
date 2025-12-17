Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D312BCF5
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 04:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765945815; cv=none; b=YpF5SWT39AMHVAZH+LuQXGRP7ASjKkqtx4HNON/dvBzIg9TvE2wN9E47tDnIpGxGCqVFHI7eExiqffLSYljQ7OE2ZpPNzhwDnnN8uXyR8qWmk3KQr35dglJu3+RWw5aViv412pPNYO0pMYPrGx2+nL5yli+mGMEMIIa/EWBJDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765945815; c=relaxed/simple;
	bh=EPG+yyUpsRsm2VOYoCmvbmBkTtGLikMqhRVjfCbU/jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsOyq4HEAFbQ6UuMvVZLaoLG+GehrwsG30mgHyXPDTtsmWajkmJaibJxkKZbbdldUqiKE/+jZAqGsAYElh7XM+E9uSaLeR3457ortvKSW0FytsI+ut8gsUN6BjjW11xcS5O7+4xYdzkpuNY7w08nWb4BoQjO2JJBC1aYSj7ThJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amDsfbM8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amDsfbM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765945813; x=1797481813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EPG+yyUpsRsm2VOYoCmvbmBkTtGLikMqhRVjfCbU/jo=;
  b=amDsfbM87apaw61O0H4uaLK98yqGlIY3xv5Ne/GVvcfLzHmeY+Z1KiqJ
   rXkhbTV63eViLbsCu4FDjcucQca42LjORtQgCCGTcVgHpw+ora3XRCqqE
   bJqgRxRazIfb5sJlAaFSBSuBmCF8Zn8yKKXQ3griXtPPoNyVNLHbJ9fyg
   cp2Y35+HV0CcOpIUm8Sk6KJbFgBD017x3KZqA6d2E8VX6nVJjoZA3/L94
   f5oN3oFfEaQHQWIFQh3OMZfk4OYbDgFBbMznCfzGHW2tovVyQmCQZ0SCP
   VnHcRdtv1VJC7GD+G6aESKgzbYUc6HD6hafkR57C+2F+CsANgb7sCkEo7
   w==;
X-CSE-ConnectionGUID: E+Ht0FfvRqexDRK5084Wlg==
X-CSE-MsgGUID: 2BzByRwAQditUnE3oPjMuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67069666"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67069666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:30:12 -0800
X-CSE-ConnectionGUID: Vt4i2rSrS9iCdlieBfb1AA==
X-CSE-MsgGUID: MMHsVNiUTbaQ4B4ALxkOFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="199000427"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 20:30:11 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVjAm-000000004BT-3etH;
	Wed, 17 Dec 2025 04:30:07 +0000
Date: Wed, 17 Dec 2025 12:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/buffer.c:244:1-7: preceding lock on line 203
Message-ID: <202512171226.E5QG43jR-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 7ffe3de53a885dbb5836541c2178bd07d1bad7df fs/buffer: split locking for pagecache lookups
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: sparc-randconfig-r054-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171226.E5QG43jR-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512171226.E5QG43jR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/buffer.c:244:1-7: preceding lock on line 203

vim +244 fs/buffer.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  178  
^1da177e4c3f41 Linus Torvalds          2005-04-16  179  static struct buffer_head *
7ffe3de53a885d Davidlohr Bueso         2025-04-17  180  __find_get_block_slow(struct block_device *bdev, sector_t block, bool atomic)
^1da177e4c3f41 Linus Torvalds          2005-04-16  181  {
53cd4cd3b12d8a Al Viro                 2024-04-28  182  	struct address_space *bd_mapping = bdev->bd_mapping;
53cd4cd3b12d8a Al Viro                 2024-04-28  183  	const int blkbits = bd_mapping->host->i_blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  184  	struct buffer_head *ret = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  185  	pgoff_t index;
^1da177e4c3f41 Linus Torvalds          2005-04-16  186  	struct buffer_head *bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  187  	struct buffer_head *head;
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  188) 	struct folio *folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  189  	int all_mapped = 1;
43636c804df012 Tetsuo Handa            2019-01-21  190  	static DEFINE_RATELIMIT_STATE(last_warned, HZ, 1);
^1da177e4c3f41 Linus Torvalds          2005-04-16  191  
53cd4cd3b12d8a Al Viro                 2024-04-28  192  	index = ((loff_t)block << blkbits) / PAGE_SIZE;
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  193) 	folio = __filemap_get_folio(bd_mapping, index, FGP_ACCESSED, 0);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  194) 	if (IS_ERR(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  195  		goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  196  
7ffe3de53a885d Davidlohr Bueso         2025-04-17  197  	/*
7ffe3de53a885d Davidlohr Bueso         2025-04-17  198  	 * Folio lock protects the buffers. Callers that cannot block
7ffe3de53a885d Davidlohr Bueso         2025-04-17  199  	 * will fallback to serializing vs try_to_free_buffers() via
7ffe3de53a885d Davidlohr Bueso         2025-04-17  200  	 * the i_private_lock.
7ffe3de53a885d Davidlohr Bueso         2025-04-17  201  	 */
7ffe3de53a885d Davidlohr Bueso         2025-04-17  202  	if (atomic)
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @203) 		spin_lock(&bd_mapping->i_private_lock);
7ffe3de53a885d Davidlohr Bueso         2025-04-17  204  	else
7ffe3de53a885d Davidlohr Bueso         2025-04-17  205  		folio_lock(folio);
7ffe3de53a885d Davidlohr Bueso         2025-04-17  206  
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  207) 	head = folio_buffers(folio);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  208) 	if (!head)
^1da177e4c3f41 Linus Torvalds          2005-04-16  209  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  210  	bh = head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  211  	do {
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  212  		if (!buffer_mapped(bh))
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  213  			all_mapped = 0;
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  214  		else if (bh->b_blocknr == block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  215  			ret = bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  216  			get_bh(bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  217  			goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  218  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  219  		bh = bh->b_this_page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  220  	} while (bh != head);
^1da177e4c3f41 Linus Torvalds          2005-04-16  221  
^1da177e4c3f41 Linus Torvalds          2005-04-16  222  	/* we might be here because some of the buffers on this page are
^1da177e4c3f41 Linus Torvalds          2005-04-16  223  	 * not mapped.  This is due to various races between
^1da177e4c3f41 Linus Torvalds          2005-04-16  224  	 * file io on the block device and getblk.  It gets dealt with
^1da177e4c3f41 Linus Torvalds          2005-04-16  225  	 * elsewhere, don't buffer_error if we had some unmapped buffers
^1da177e4c3f41 Linus Torvalds          2005-04-16  226  	 */
43636c804df012 Tetsuo Handa            2019-01-21  227  	ratelimit_set_flags(&last_warned, RATELIMIT_MSG_ON_RELEASE);
43636c804df012 Tetsuo Handa            2019-01-21  228  	if (all_mapped && __ratelimit(&last_warned)) {
43636c804df012 Tetsuo Handa            2019-01-21  229  		printk("__find_get_block_slow() failed. block=%llu, "
43636c804df012 Tetsuo Handa            2019-01-21  230  		       "b_blocknr=%llu, b_state=0x%08lx, b_size=%zu, "
43636c804df012 Tetsuo Handa            2019-01-21  231  		       "device %pg blocksize: %d\n",
205f87f6b34244 Badari Pulavarty        2006-03-26  232  		       (unsigned long long)block,
43636c804df012 Tetsuo Handa            2019-01-21  233  		       (unsigned long long)bh->b_blocknr,
43636c804df012 Tetsuo Handa            2019-01-21  234  		       bh->b_state, bh->b_size, bdev,
53cd4cd3b12d8a Al Viro                 2024-04-28  235  		       1 << blkbits);
^1da177e4c3f41 Linus Torvalds          2005-04-16  236  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  237  out_unlock:
7ffe3de53a885d Davidlohr Bueso         2025-04-17  238  	if (atomic)
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  239) 		spin_unlock(&bd_mapping->i_private_lock);
7ffe3de53a885d Davidlohr Bueso         2025-04-17  240  	else
7ffe3de53a885d Davidlohr Bueso         2025-04-17  241  		folio_unlock(folio);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  242) 	folio_put(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  243  out:
^1da177e4c3f41 Linus Torvalds          2005-04-16 @244  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  245  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  246  

:::::: The code at line 244 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
