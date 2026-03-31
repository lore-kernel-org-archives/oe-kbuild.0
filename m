Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CED36AB6B
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940244; cv=none; b=ida9H50ug8ZQM+89OziAy9Bpj0Te5MrjRA4+bCOmsdRsfhBUQTXEMqa4BhIch+rP0Fn1zT+ZPMl9Xo2AWfjO+faSSguoA4YFkVXP+oUqqGh6SSX2ug/xj/YBZq7HxUOGMgjjiwECazhIoJ/sp00PX4GNXgS98URtGdCtrIEliA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940244; c=relaxed/simple;
	bh=YCcWtmRtFkh0154AxlayASEV8DKcDTKcUHuAgEYarr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fwxdh7MSFcREUHxNYfOz2O8ZT4fY3ikGv+UMoglVBOzBMUB5MXvpFlhLkLIA0gxnXjcHCaFgn4IAvdtMRfLUyIH9rv24ybAAy2j77r8K+qB8lR5D35+FHvXTzfDloi4M9zVfhdpLNDqtGs1Z07xmDqzrIB0jJI/rcn/8BidS9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AThSTEC3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AThSTEC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774940241; x=1806476241;
  h=date:from:to:cc:subject:message-id;
  bh=YCcWtmRtFkh0154AxlayASEV8DKcDTKcUHuAgEYarr0=;
  b=AThSTEC39HS/GW86EucQcZsN57A68qDYCFXgVP1If1W+NkeM2TF6NoD3
   Pf7Rz359KijbtdiLgqpP94MmnIV9BAKzejAP7NeWD0rOx4F8GERMwK7V5
   i1QP5f+cao0oTh5b6vOVMWxBqNPZPzzfMILJG9XgGxhP8Lwx77Gpatuan
   ccqUC10m3bN11QM9QfyKUrtIsG3BoWnKcVkGJ28SwWIfCeyCjcQUkh95s
   v/YVcXu5fVFoMhp8QRmbuKaApKxY5O+0gOD6UruY6B+A6oAYtfUOPxlcr
   dc8dQ7M4T7nRql6qzhCnt1dP/I7v5T60+yThIip0Xl2J+KvTooeDoIaSn
   w==;
X-CSE-ConnectionGUID: LF1JDijaQ8muQOvyFnPTCQ==
X-CSE-MsgGUID: NTdCwKKATtuCE8F5mpTLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="98552377"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="98552377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:57:20 -0700
X-CSE-ConnectionGUID: sl/wkHoHTzuHlxZzxeZ2mg==
X-CSE-MsgGUID: yVJ9t+nmRIO7iqoXTEk0lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="264215217"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 23:57:19 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7T2K-000000002Kz-3ykH;
	Tue, 31 Mar 2026 06:57:16 +0000
Date: Tue, 31 Mar 2026 14:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/buffer.c:244:1-7: preceding lock on line 203
Message-ID: <202603311409.u9JIYH0f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 7ffe3de53a885dbb5836541c2178bd07d1bad7df fs/buffer: split locking for pagecache lookups
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r062-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311409.u9JIYH0f-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603311409.u9JIYH0f-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/buffer.c:244:1-7: preceding lock on line 203

vim +244 fs/buffer.c

^1da177e4c3f415 Linus Torvalds          2005-04-16  178  
^1da177e4c3f415 Linus Torvalds          2005-04-16  179  static struct buffer_head *
7ffe3de53a885db Davidlohr Bueso         2025-04-17  180  __find_get_block_slow(struct block_device *bdev, sector_t block, bool atomic)
^1da177e4c3f415 Linus Torvalds          2005-04-16  181  {
53cd4cd3b12d8a6 Al Viro                 2024-04-28  182  	struct address_space *bd_mapping = bdev->bd_mapping;
53cd4cd3b12d8a6 Al Viro                 2024-04-28  183  	const int blkbits = bd_mapping->host->i_blkbits;
^1da177e4c3f415 Linus Torvalds          2005-04-16  184  	struct buffer_head *ret = NULL;
^1da177e4c3f415 Linus Torvalds          2005-04-16  185  	pgoff_t index;
^1da177e4c3f415 Linus Torvalds          2005-04-16  186  	struct buffer_head *bh;
^1da177e4c3f415 Linus Torvalds          2005-04-16  187  	struct buffer_head *head;
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  188) 	struct folio *folio;
^1da177e4c3f415 Linus Torvalds          2005-04-16  189  	int all_mapped = 1;
43636c804df0126 Tetsuo Handa            2019-01-21  190  	static DEFINE_RATELIMIT_STATE(last_warned, HZ, 1);
^1da177e4c3f415 Linus Torvalds          2005-04-16  191  
53cd4cd3b12d8a6 Al Viro                 2024-04-28  192  	index = ((loff_t)block << blkbits) / PAGE_SIZE;
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  193) 	folio = __filemap_get_folio(bd_mapping, index, FGP_ACCESSED, 0);
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  194) 	if (IS_ERR(folio))
^1da177e4c3f415 Linus Torvalds          2005-04-16  195  		goto out;
^1da177e4c3f415 Linus Torvalds          2005-04-16  196  
7ffe3de53a885db Davidlohr Bueso         2025-04-17  197  	/*
7ffe3de53a885db Davidlohr Bueso         2025-04-17  198  	 * Folio lock protects the buffers. Callers that cannot block
7ffe3de53a885db Davidlohr Bueso         2025-04-17  199  	 * will fallback to serializing vs try_to_free_buffers() via
7ffe3de53a885db Davidlohr Bueso         2025-04-17  200  	 * the i_private_lock.
7ffe3de53a885db Davidlohr Bueso         2025-04-17  201  	 */
7ffe3de53a885db Davidlohr Bueso         2025-04-17  202  	if (atomic)
600f111ef51dc2c Matthew Wilcox (Oracle  2023-11-17 @203) 		spin_lock(&bd_mapping->i_private_lock);
7ffe3de53a885db Davidlohr Bueso         2025-04-17  204  	else
7ffe3de53a885db Davidlohr Bueso         2025-04-17  205  		folio_lock(folio);
7ffe3de53a885db Davidlohr Bueso         2025-04-17  206  
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  207) 	head = folio_buffers(folio);
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  208) 	if (!head)
^1da177e4c3f415 Linus Torvalds          2005-04-16  209  		goto out_unlock;
^1da177e4c3f415 Linus Torvalds          2005-04-16  210  	bh = head;
^1da177e4c3f415 Linus Torvalds          2005-04-16  211  	do {
97f76d3d197f201 Nikanth Karthikesan     2009-04-02  212  		if (!buffer_mapped(bh))
97f76d3d197f201 Nikanth Karthikesan     2009-04-02  213  			all_mapped = 0;
97f76d3d197f201 Nikanth Karthikesan     2009-04-02  214  		else if (bh->b_blocknr == block) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  215  			ret = bh;
^1da177e4c3f415 Linus Torvalds          2005-04-16  216  			get_bh(bh);
^1da177e4c3f415 Linus Torvalds          2005-04-16  217  			goto out_unlock;
^1da177e4c3f415 Linus Torvalds          2005-04-16  218  		}
^1da177e4c3f415 Linus Torvalds          2005-04-16  219  		bh = bh->b_this_page;
^1da177e4c3f415 Linus Torvalds          2005-04-16  220  	} while (bh != head);
^1da177e4c3f415 Linus Torvalds          2005-04-16  221  
^1da177e4c3f415 Linus Torvalds          2005-04-16  222  	/* we might be here because some of the buffers on this page are
^1da177e4c3f415 Linus Torvalds          2005-04-16  223  	 * not mapped.  This is due to various races between
^1da177e4c3f415 Linus Torvalds          2005-04-16  224  	 * file io on the block device and getblk.  It gets dealt with
^1da177e4c3f415 Linus Torvalds          2005-04-16  225  	 * elsewhere, don't buffer_error if we had some unmapped buffers
^1da177e4c3f415 Linus Torvalds          2005-04-16  226  	 */
43636c804df0126 Tetsuo Handa            2019-01-21  227  	ratelimit_set_flags(&last_warned, RATELIMIT_MSG_ON_RELEASE);
43636c804df0126 Tetsuo Handa            2019-01-21  228  	if (all_mapped && __ratelimit(&last_warned)) {
43636c804df0126 Tetsuo Handa            2019-01-21  229  		printk("__find_get_block_slow() failed. block=%llu, "
43636c804df0126 Tetsuo Handa            2019-01-21  230  		       "b_blocknr=%llu, b_state=0x%08lx, b_size=%zu, "
43636c804df0126 Tetsuo Handa            2019-01-21  231  		       "device %pg blocksize: %d\n",
205f87f6b342444 Badari Pulavarty        2006-03-26  232  		       (unsigned long long)block,
43636c804df0126 Tetsuo Handa            2019-01-21  233  		       (unsigned long long)bh->b_blocknr,
43636c804df0126 Tetsuo Handa            2019-01-21  234  		       bh->b_state, bh->b_size, bdev,
53cd4cd3b12d8a6 Al Viro                 2024-04-28  235  		       1 << blkbits);
^1da177e4c3f415 Linus Torvalds          2005-04-16  236  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  237  out_unlock:
7ffe3de53a885db Davidlohr Bueso         2025-04-17  238  	if (atomic)
600f111ef51dc2c Matthew Wilcox (Oracle  2023-11-17  239) 		spin_unlock(&bd_mapping->i_private_lock);
7ffe3de53a885db Davidlohr Bueso         2025-04-17  240  	else
7ffe3de53a885db Davidlohr Bueso         2025-04-17  241  		folio_unlock(folio);
eee25182a80a8c8 Matthew Wilcox (Oracle  2023-06-12  242) 	folio_put(folio);
^1da177e4c3f415 Linus Torvalds          2005-04-16  243  out:
^1da177e4c3f415 Linus Torvalds          2005-04-16 @244  	return ret;
^1da177e4c3f415 Linus Torvalds          2005-04-16  245  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  246  

:::::: The code at line 244 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
