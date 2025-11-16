Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455D233735
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Nov 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763277324; cv=none; b=lTybSHCyHBQV4KfZzZjJqOHuIkzLQsFwLaYSW15UtswNl0xYdWXPI+58RlFQ37XrlvNLsxIiw3YJHs2UA2G+t0Q7x+FjqIIvGnlIDfXhnsmE7cF22lCA3by2hQuf5LB2XMvygOWJYA0laXA4SKg4HaFmN7t5JlmLafPcMWtAXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763277324; c=relaxed/simple;
	bh=zPjiZYiwetEyUKd8peQRRz9HZU2jOG3/TO/h99x47a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nl+LE1/HVkM1bD6d01W1OMdMT7JgDyjbIrpMKkB+6aGrvwy54gyA7UGLmyvzOJmW+PIWTdgWrl9EHOjn6jKW9fInRUzgwCkFu0S42AGI6ra/bo5h3Zjg7jPMM9HA4Tdy/q830jGlikLuKMI0KBKjzHs8m8sSwad13/yg6hY7cCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6ZbpZxJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6ZbpZxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763277322; x=1794813322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPjiZYiwetEyUKd8peQRRz9HZU2jOG3/TO/h99x47a4=;
  b=V6ZbpZxJpqx6j0Gq2wKcO3QytRFHVMvSwx1zzr5SuYNwliX8a4egTqSH
   enUsBFC65QDCIx2FUtSRZNoiHx4+aGxz+MkueFr2otdQiNvfQKPx9Uz5o
   q61ZkSJGj5PIMW205NvOSnrfZ1tokij3Fah/YlDFWmKO6WPPB1TZRE/G1
   0b+pWYQ9CQ+kU8nAVXcL8tR6yp13Cm9/JIlFEwZurNbPzb59GyZyBWgn5
   pMaaVu/Tz8co3LpLOrcTp99dKcl3aO4c9bKi14kthgmVN/bzCJLOjCHHt
   Qn5Nc1Inn19+rsOTwrhERuFlEbFttFzBhJnJ2Vx/Lqzh1hGIcZb+D4FJo
   g==;
X-CSE-ConnectionGUID: K6mPeayeSNKjmIFG/WBR/A==
X-CSE-MsgGUID: LQFx4RM7SaulEaDigUSSAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76659532"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76659532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 23:15:19 -0800
X-CSE-ConnectionGUID: i5OF/J+oScKcJ9g64D5qTQ==
X-CSE-MsgGUID: qgKrb2UfSrC0nuVhSLzs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195299745"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2025 23:15:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKWyi-0008aR-0l;
	Sun, 16 Nov 2025 07:15:16 +0000
Date: Sun, 16 Nov 2025 15:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 21/24] ext4: make data=journal support large block size
Message-ID: <202511161433.qI6uGU0m-lkp@intel.com>
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
In-Reply-To: <20251111142634.3301616-22-libaokun@huaweicloud.com>
References: <20251111142634.3301616-22-libaokun@huaweicloud.com>
TO: libaokun@huaweicloud.com
TO: linux-ext4@vger.kernel.org
CC: tytso@mit.edu
CC: adilger.kernel@dilger.ca
CC: jack@suse.cz
CC: linux-kernel@vger.kernel.org
CC: kernel@pankajraghav.com
CC: mcgrof@kernel.org
CC: ebiggers@kernel.org
CC: willy@infradead.org
CC: yi.zhang@huawei.com
CC: yangerkun@huawei.com
CC: chengzhihao1@huawei.com
CC: libaokun1@huawei.com
CC: libaokun@huaweicloud.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/libaokun-huaweicloud-com/ext4-remove-page-offset-calculation-in-ext4_block_zero_page_range/20251111-224944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20251111142634.3301616-22-libaokun%40huaweicloud.com
patch subject: [PATCH v3 21/24] ext4: make data=journal support large block size
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r071-20251114 (https://download.01.org/0day-ci/archive/20251116/202511161433.qI6uGU0m-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511161433.qI6uGU0m-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:6612 ext4_change_inode_journal_flag() warn: inconsistent returns '&inode->i_mapping->invalidate_lock'.

Old smatch warnings:
fs/ext4/inode.c:2660 mpage_prepare_extent_to_map() warn: missing error code 'err'
fs/ext4/inode.c:5133 check_igot_inode() warn: missing unwind goto?

vim +6612 fs/ext4/inode.c

ac27a0ec112a08 Dave Kleikamp      2006-10-11  6526  
617ba13b31fbf5 Mingming Cao       2006-10-11  6527  int ext4_change_inode_journal_flag(struct inode *inode, int val)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6528  {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6529  	journal_t *journal;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6530  	handle_t *handle;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6531  	int err;
00d873c17e29cc Jan Kara           2023-05-04  6532  	int alloc_ctx;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6533  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6534  	/*
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6535  	 * We have to be very careful here: changing a data block's
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6536  	 * journaling status dynamically is dangerous.  If we write a
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6537  	 * data block to the journal, change the status and then delete
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6538  	 * that block, we risk forgetting to revoke the old log record
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6539  	 * from the journal and so a subsequent replay can corrupt data.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6540  	 * So, first we make sure that the journal is empty and that
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6541  	 * nobody is changing anything.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6542  	 */
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6543  
617ba13b31fbf5 Mingming Cao       2006-10-11  6544  	journal = EXT4_JOURNAL(inode);
0390131ba84fd3 Frank Mayhar       2009-01-07  6545  	if (!journal)
0390131ba84fd3 Frank Mayhar       2009-01-07  6546  		return 0;
d699594dc151c6 Dave Hansen        2007-07-18  6547  	if (is_journal_aborted(journal))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6548  		return -EROFS;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6549  
17335dcc471199 Dmitry Monakhov    2012-09-29  6550  	/* Wait for all existing dio workers */
17335dcc471199 Dmitry Monakhov    2012-09-29  6551  	inode_dio_wait(inode);
17335dcc471199 Dmitry Monakhov    2012-09-29  6552  
4c54659269ecb7 Daeho Jeong        2016-04-25  6553  	/*
4c54659269ecb7 Daeho Jeong        2016-04-25  6554  	 * Before flushing the journal and switching inode's aops, we have
4c54659269ecb7 Daeho Jeong        2016-04-25  6555  	 * to flush all dirty data the inode has. There can be outstanding
4c54659269ecb7 Daeho Jeong        2016-04-25  6556  	 * delayed allocations, there can be unwritten extents created by
4c54659269ecb7 Daeho Jeong        2016-04-25  6557  	 * fallocate or buffered writes in dioread_nolock mode covered by
4c54659269ecb7 Daeho Jeong        2016-04-25  6558  	 * dirty data which can be converted only after flushing the dirty
4c54659269ecb7 Daeho Jeong        2016-04-25  6559  	 * data (and journalled aops don't know how to handle these cases).
4c54659269ecb7 Daeho Jeong        2016-04-25  6560  	 */
d4f5258eae7b38 Jan Kara           2021-02-04  6561  	filemap_invalidate_lock(inode->i_mapping);
4c54659269ecb7 Daeho Jeong        2016-04-25  6562  	err = filemap_write_and_wait(inode->i_mapping);
4c54659269ecb7 Daeho Jeong        2016-04-25  6563  	if (err < 0) {
d4f5258eae7b38 Jan Kara           2021-02-04  6564  		filemap_invalidate_unlock(inode->i_mapping);
4c54659269ecb7 Daeho Jeong        2016-04-25  6565  		return err;
4c54659269ecb7 Daeho Jeong        2016-04-25  6566  	}
f893fb965834e9 Baokun Li          2025-11-11  6567  	/* Before switch the inode journalling mode evict all the page cache. */
f893fb965834e9 Baokun Li          2025-11-11  6568  	truncate_pagecache(inode, 0);
4c54659269ecb7 Daeho Jeong        2016-04-25  6569  
00d873c17e29cc Jan Kara           2023-05-04  6570  	alloc_ctx = ext4_writepages_down_write(inode->i_sb);
dab291af8d6307 Mingming Cao       2006-10-11  6571  	jbd2_journal_lock_updates(journal);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6572  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6573  	/*
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6574  	 * OK, there are no updates running now, and all cached data is
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6575  	 * synced to disk.  We are now in a completely consistent state
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6576  	 * which doesn't have anything in the journal, and we know that
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6577  	 * no filesystem updates are running, so it is safe to modify
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6578  	 * the inode's in-core data-journaling state flag now.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6579  	 */
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6580  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6581  	if (val)
12e9b892002d9a Dmitry Monakhov    2010-05-16  6582  		ext4_set_inode_flag(inode, EXT4_INODE_JOURNAL_DATA);
5872ddaaf05bf2 Yongqiang Yang     2011-12-28  6583  	else {
01d5d96542fd4e Leah Rumancik      2021-05-18  6584  		err = jbd2_journal_flush(journal, 0);
4f879ca687a5f2 Jan Kara           2014-10-30  6585  		if (err < 0) {
4f879ca687a5f2 Jan Kara           2014-10-30  6586  			jbd2_journal_unlock_updates(journal);
00d873c17e29cc Jan Kara           2023-05-04  6587  			ext4_writepages_up_write(inode->i_sb, alloc_ctx);
4f879ca687a5f2 Jan Kara           2014-10-30  6588  			return err;
4f879ca687a5f2 Jan Kara           2014-10-30  6589  		}
12e9b892002d9a Dmitry Monakhov    2010-05-16  6590  		ext4_clear_inode_flag(inode, EXT4_INODE_JOURNAL_DATA);
5872ddaaf05bf2 Yongqiang Yang     2011-12-28  6591  	}
617ba13b31fbf5 Mingming Cao       2006-10-11  6592  	ext4_set_aops(inode);
f893fb965834e9 Baokun Li          2025-11-11  6593  	ext4_set_inode_mapping_order(inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6594  
dab291af8d6307 Mingming Cao       2006-10-11  6595  	jbd2_journal_unlock_updates(journal);
00d873c17e29cc Jan Kara           2023-05-04  6596  	ext4_writepages_up_write(inode->i_sb, alloc_ctx);
d4f5258eae7b38 Jan Kara           2021-02-04  6597  	filemap_invalidate_unlock(inode->i_mapping);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6598  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6599  	/* Finally we can mark the inode as dirty. */
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6600  
9924a92a8c2175 Theodore Ts'o      2013-02-08  6601  	handle = ext4_journal_start(inode, EXT4_HT_INODE, 1);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6602  	if (IS_ERR(handle))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6603  		return PTR_ERR(handle);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6604  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  6605  	ext4_fc_mark_ineligible(inode->i_sb,
e85c81ba8859a4 Xin Yin            2022-01-17  6606  		EXT4_FC_REASON_JOURNAL_FLAG_CHANGE, handle);
617ba13b31fbf5 Mingming Cao       2006-10-11  6607  	err = ext4_mark_inode_dirty(handle, inode);
0390131ba84fd3 Frank Mayhar       2009-01-07  6608  	ext4_handle_sync(handle);
617ba13b31fbf5 Mingming Cao       2006-10-11  6609  	ext4_journal_stop(handle);
617ba13b31fbf5 Mingming Cao       2006-10-11  6610  	ext4_std_error(inode->i_sb, err);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6611  
ac27a0ec112a08 Dave Kleikamp      2006-10-11 @6612  	return err;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  6613  }
2e9ee850355593 Aneesh Kumar K.V   2008-07-11  6614  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
