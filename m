Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3086B2040BF
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066611; cv=none; b=AQdTbZ5rKMcuovEnEV0kcMpXOdhY94+1AW4ZyZTQ6s0VjUM5UgNlcJGAKSewKyL/Vvl4aokMSH+xaPSwLGaiMVjTwO5letIaQdVtQ4KapaVmR4kSOVnd7VsoXw/V6tDj0Nf9gat2lcGGWPmTjNVNjNL7DetgBHp6hulSCfBPXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066611; c=relaxed/simple;
	bh=yf/+yeY+Iqo4P5FW8jPFkhr9pMfrTYemoS8HoJYCsDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHxhp/+2gxFeFQ/fbXuEP8htIMdJErinwtRsny48toj4UZ92RvvAyeBSJ2glb0KCOs6lcsNK2e81YMSDCXHNzRUswUXszrFOA/Akr8VuLRstA8PRfGDqZn23WI9E7XH8JvtLymIpXN/IZmpz3n0QAepuoxma2NhX3LDhIrg5BEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBTCeX2o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBTCeX2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744066609; x=1775602609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yf/+yeY+Iqo4P5FW8jPFkhr9pMfrTYemoS8HoJYCsDo=;
  b=ZBTCeX2oJKavsc0AMElTdr/vIC5/6oP09qsk3YiJmOKBPFTIaV18JDcz
   d7LhDsw4TvB79sv8tqb9m29Ay6slaTl39K2CoD10euouxzl4a7ZYKggx/
   glP1iLukDQqzNZI5wIsKKhFvZ9z4RuIhrB8T+2xGE1f7eXGwbx52Hbw/w
   fRIq5C7qn5jX0BRyBnJp8aj8ejqzNiv6dm6ZuE+qYCezJSy7AupkvpmdC
   xiNm45A4rdnIbWleQyyuDa6Cx36VdjD19YR0sOIbM5+Aj7nxkaBfQmzmt
   BZcVr3pbgrailqV+szHquvnUn+pY3c6dAbNOhKI2CTu4LE9FaYq2qvLuz
   g==;
X-CSE-ConnectionGUID: 1NpI/EemTueknIGXsiOX7g==
X-CSE-MsgGUID: 58sWoigORnmOHxnzTflVHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45193156"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45193156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:56:48 -0700
X-CSE-ConnectionGUID: 7G2nRXk4ScKXc2ocrY6sqw==
X-CSE-MsgGUID: YFf+fOXESXi9YSlRoXUZxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="133255636"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2025 15:56:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1vOX-0003sz-0s;
	Mon, 07 Apr 2025 22:56:45 +0000
Date: Tue, 8 Apr 2025 06:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mcgrof:20250406-migraiton-bh-fix-v3 1/4] fs/buffer.c:248:1-7:
 preceding lock on line 205
Message-ID: <202504080628.6sPRifqX-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250406-migraiton-bh-fix-v3
head:   0eab9b2a908054d4ad963b2f4ebf05d50f17249b
commit: f0b6282cf5ca5c69457cc5ddcddcff8f81f9b311 [1/4] fs/buffer: rely on the folio lock for lookups when possible
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: microblaze-randconfig-r051-20250408 (https://download.01.org/0day-ci/archive/20250408/202504080628.6sPRifqX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504080628.6sPRifqX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/buffer.c:248:1-7: preceding lock on line 205

vim +248 fs/buffer.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  178  
^1da177e4c3f41 Linus Torvalds          2005-04-16  179  static struct buffer_head *
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  180  __find_get_block_slow(struct block_device *bdev, sector_t block, bool atomic)
^1da177e4c3f41 Linus Torvalds          2005-04-16  181  {
53cd4cd3b12d8a Al Viro                 2024-04-28  182  	struct address_space *bd_mapping = bdev->bd_mapping;
53cd4cd3b12d8a Al Viro                 2024-04-28  183  	const int blkbits = bd_mapping->host->i_blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  184  	struct buffer_head *ret = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  185  	pgoff_t index;
^1da177e4c3f41 Linus Torvalds          2005-04-16  186  	struct buffer_head *bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  187  	struct buffer_head *head;
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  188) 	struct folio *folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  189  	int all_mapped = 1;
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  190  	bool folio_locked = true;
43636c804df012 Tetsuo Handa            2019-01-21  191  	static DEFINE_RATELIMIT_STATE(last_warned, HZ, 1);
^1da177e4c3f41 Linus Torvalds          2005-04-16  192  
53cd4cd3b12d8a Al Viro                 2024-04-28  193  	index = ((loff_t)block << blkbits) / PAGE_SIZE;
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  194) 	folio = __filemap_get_folio(bd_mapping, index, FGP_ACCESSED, 0);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  195) 	if (IS_ERR(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  196  		goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  197  
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  198  	/*
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  199  	 * Folio lock protects the buffers. Callers that cannot block
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  200  	 * will fallback to serializing vs try_to_free_buffers() via
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  201  	 * the i_private_lock.
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  202  	 */
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  203  	if (!folio_trylock(folio)) {
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  204  		if (atomic) {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @205) 			spin_lock(&bd_mapping->i_private_lock);
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  206  			folio_locked = false;
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  207  		} else
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  208  			folio_lock(folio);
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  209  	}
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  210  
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  211) 	head = folio_buffers(folio);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  212) 	if (!head)
^1da177e4c3f41 Linus Torvalds          2005-04-16  213  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  214  	bh = head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  215  	do {
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  216  		if (!buffer_mapped(bh))
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  217  			all_mapped = 0;
97f76d3d197f20 Nikanth Karthikesan     2009-04-02  218  		else if (bh->b_blocknr == block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  219  			ret = bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  220  			get_bh(bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  221  			goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  222  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  223  		bh = bh->b_this_page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  224  	} while (bh != head);
^1da177e4c3f41 Linus Torvalds          2005-04-16  225  
^1da177e4c3f41 Linus Torvalds          2005-04-16  226  	/* we might be here because some of the buffers on this page are
^1da177e4c3f41 Linus Torvalds          2005-04-16  227  	 * not mapped.  This is due to various races between
^1da177e4c3f41 Linus Torvalds          2005-04-16  228  	 * file io on the block device and getblk.  It gets dealt with
^1da177e4c3f41 Linus Torvalds          2005-04-16  229  	 * elsewhere, don't buffer_error if we had some unmapped buffers
^1da177e4c3f41 Linus Torvalds          2005-04-16  230  	 */
43636c804df012 Tetsuo Handa            2019-01-21  231  	ratelimit_set_flags(&last_warned, RATELIMIT_MSG_ON_RELEASE);
43636c804df012 Tetsuo Handa            2019-01-21  232  	if (all_mapped && __ratelimit(&last_warned)) {
43636c804df012 Tetsuo Handa            2019-01-21  233  		printk("__find_get_block_slow() failed. block=%llu, "
43636c804df012 Tetsuo Handa            2019-01-21  234  		       "b_blocknr=%llu, b_state=0x%08lx, b_size=%zu, "
43636c804df012 Tetsuo Handa            2019-01-21  235  		       "device %pg blocksize: %d\n",
205f87f6b34244 Badari Pulavarty        2006-03-26  236  		       (unsigned long long)block,
43636c804df012 Tetsuo Handa            2019-01-21  237  		       (unsigned long long)bh->b_blocknr,
43636c804df012 Tetsuo Handa            2019-01-21  238  		       bh->b_state, bh->b_size, bdev,
53cd4cd3b12d8a Al Viro                 2024-04-28  239  		       1 << blkbits);
^1da177e4c3f41 Linus Torvalds          2005-04-16  240  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  241  out_unlock:
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  242  	if (folio_locked)
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  243  		folio_unlock(folio);
f0b6282cf5ca5c Davidlohr Bueso         2025-04-04  244  	else
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  245) 		spin_unlock(&bd_mapping->i_private_lock);
eee25182a80a8c Matthew Wilcox (Oracle  2023-06-12  246) 	folio_put(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  247  out:
^1da177e4c3f41 Linus Torvalds          2005-04-16 @248  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  249  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  250  

:::::: The code at line 248 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
