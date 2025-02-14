Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4755265CA3
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547097; cv=none; b=KQ49MhegvGtlQPKk+IFy4RDsurEV6lBFikPq16rXrEmP1dl7pKvHg7JInHABEVO+gtBqYb8mx9A/W1PRHbkFh1dFZgXtCoTxShU8R1h/6kCzd+SkymP3WAWYO01h6kr43L+N8FgOpzk2M3KZKVIjLe03twFWktwoLF9/U5PPkhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547097; c=relaxed/simple;
	bh=5IiD/aI2Uruoj3mksM0kHl+X57BRjsRljcasHoRFFOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxOOsbiHkQvE8sA6R4qPoLP9SZhQ9mwA8dGEx5PKFzo6qRMhMb4i4EdA0zmWE34niR893fybdGTw1NxgX2Dgg+gsmNJd27IZsOIvbIDgx15VML0u6NtOvPWq1XG69TGVhP3dmRlUFB2ix6wxSbE/ntRDffvhEgvolmFEvEExDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGPtUyEK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGPtUyEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547096; x=1771083096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5IiD/aI2Uruoj3mksM0kHl+X57BRjsRljcasHoRFFOU=;
  b=mGPtUyEK4uMY9yKzgpiMS4EXaUWON9yPCi9m7a3utNgqW571wboztpVd
   fXiziJSGndOuxGg7XG6LjYq5LIbxyAzKW/6rcBPMfH98BTInrhfhRZquC
   W96HGfdQI60dz+VwTPm4uU8DnqdSm1YGzlJCkGHtts6GWI4N/W9S8pRHG
   wADY78zVcBl2Vm5X9DiCDLMuliNiPgi6scJAH6L7NVt0In4dsO/bKTv9s
   tnfj5S3xa2aSGdfCoLFQI/f+XYPhddGxtF+y3l9Bb8/w6f4w5tHsCsIc0
   060cILm7EUsBGMWcIxPl3KLtCXtTGjMN3Ja8xRIgCX8vaDjJjz73yZ7og
   g==;
X-CSE-ConnectionGUID: x96NCeFWTPCYIZncGZdMaA==
X-CSE-MsgGUID: YhPFDsXLQl+ETKZQ1vOYTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50512351"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50512351"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:31:34 -0800
X-CSE-ConnectionGUID: dD8QHHE5SD6lroJ7yFwBdQ==
X-CSE-MsgGUID: WzuvfQPZRWe8n/9pdb0fzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118416799"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 07:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixf8-0019mH-1N;
	Fri, 14 Feb 2025 15:31:30 +0000
Date: Fri, 14 Feb 2025 23:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:test 13/15] fs/ext4/extents.c:4780 ext4_fallocate()
 warn: inconsistent returns '&inode->i_rwsem'.
Message-ID: <202502142300.QWZQEt11-lkp@intel.com>
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
CC: linux-ext4@vger.kernel.org
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>
CC: Ojaswin Mujoo <ojaswin@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git test
head:   e5a9a1fce162be14c6f1ac325faac48b1a7dea9e
commit: 2890e5e0f49e10f3dadc5f7b7ea434e3e77e12a6 [13/15] ext4: move out common parts into ext4_fallocate()
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142300.QWZQEt11-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502142300.QWZQEt11-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:4780 ext4_fallocate() warn: inconsistent returns '&inode->i_rwsem'.

vim +4780 fs/ext4/extents.c

fd2f764826df54 Zhang Yi           2024-12-20  4707  
a2df2a63407803 Amit Arora         2007-07-17  4708  /*
2fe17c1075836b Christoph Hellwig  2011-01-14  4709   * preallocate space for a file. This implements ext4's fallocate file
a2df2a63407803 Amit Arora         2007-07-17  4710   * operation, which gets called from sys_fallocate system call.
a2df2a63407803 Amit Arora         2007-07-17  4711   * For block-mapped files, posix_fallocate should fall back to the method
a2df2a63407803 Amit Arora         2007-07-17  4712   * of writing zeroes to the required new blocks (the same behavior which is
a2df2a63407803 Amit Arora         2007-07-17  4713   * expected for file systems which do not support fallocate() system call).
a2df2a63407803 Amit Arora         2007-07-17  4714   */
2fe17c1075836b Christoph Hellwig  2011-01-14  4715  long ext4_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
a2df2a63407803 Amit Arora         2007-07-17  4716  {
496ad9aa8ef448 Al Viro            2013-01-23  4717  	struct inode *inode = file_inode(file);
2890e5e0f49e10 Zhang Yi           2024-12-20  4718  	struct address_space *mapping = file->f_mapping;
fd2f764826df54 Zhang Yi           2024-12-20  4719  	int ret;
a2df2a63407803 Amit Arora         2007-07-17  4720  
2058f83a728adf Michael Halcrow    2015-04-12  4721  	/*
2058f83a728adf Michael Halcrow    2015-04-12  4722  	 * Encrypted inodes can't handle collapse range or insert
2058f83a728adf Michael Halcrow    2015-04-12  4723  	 * range since we would need to re-encrypt blocks with a
2058f83a728adf Michael Halcrow    2015-04-12  4724  	 * different IV or XTS tweak (which are based on the logical
2058f83a728adf Michael Halcrow    2015-04-12  4725  	 * block number).
2058f83a728adf Michael Halcrow    2015-04-12  4726  	 */
592ddec7578a33 Chandan Rajendra   2018-12-12  4727  	if (IS_ENCRYPTED(inode) &&
457b1e353c739a Eric Biggers       2019-12-26  4728  	    (mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
2058f83a728adf Michael Halcrow    2015-04-12  4729  		return -EOPNOTSUPP;
2058f83a728adf Michael Halcrow    2015-04-12  4730  
a4bb6b64e39abc Allison Henderson  2011-05-25  4731  	/* Return error if mode is not supported */
9eb79482a97152 Namjae Jeon        2014-02-23  4732  	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
331573febb6a22 Namjae Jeon        2015-06-09  4733  		     FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
331573febb6a22 Namjae Jeon        2015-06-09  4734  		     FALLOC_FL_INSERT_RANGE))
a4bb6b64e39abc Allison Henderson  2011-05-25  4735  		return -EOPNOTSUPP;
a4bb6b64e39abc Allison Henderson  2011-05-25  4736  
f87c7a4b084afc Baokun Li          2022-04-28  4737  	inode_lock(inode);
f87c7a4b084afc Baokun Li          2022-04-28  4738  	ret = ext4_convert_inline_data(inode);
f87c7a4b084afc Baokun Li          2022-04-28  4739  	if (ret)
ea3f17efd36b56 Zhang Yi           2024-12-20  4740  		goto out_inode_lock;
f87c7a4b084afc Baokun Li          2022-04-28  4741  
2890e5e0f49e10 Zhang Yi           2024-12-20  4742  	/* Wait all existing dio workers, newcomers will block on i_rwsem */
2890e5e0f49e10 Zhang Yi           2024-12-20  4743  	inode_dio_wait(inode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4744  
2890e5e0f49e10 Zhang Yi           2024-12-20  4745  	ret = file_modified(file);
2890e5e0f49e10 Zhang Yi           2024-12-20  4746  	if (ret)
2890e5e0f49e10 Zhang Yi           2024-12-20  4747  		return ret;
2890e5e0f49e10 Zhang Yi           2024-12-20  4748  
2890e5e0f49e10 Zhang Yi           2024-12-20  4749  	if ((mode & FALLOC_FL_MODE_MASK) == FALLOC_FL_ALLOCATE_RANGE) {
2890e5e0f49e10 Zhang Yi           2024-12-20  4750  		ret = ext4_do_fallocate(file, offset, len, mode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4751  		goto out_inode_lock;
2890e5e0f49e10 Zhang Yi           2024-12-20  4752  	}
2890e5e0f49e10 Zhang Yi           2024-12-20  4753  
2890e5e0f49e10 Zhang Yi           2024-12-20  4754  	/*
2890e5e0f49e10 Zhang Yi           2024-12-20  4755  	 * Follow-up operations will drop page cache, hold invalidate lock
2890e5e0f49e10 Zhang Yi           2024-12-20  4756  	 * to prevent page faults from reinstantiating pages we have
2890e5e0f49e10 Zhang Yi           2024-12-20  4757  	 * released from page cache.
2890e5e0f49e10 Zhang Yi           2024-12-20  4758  	 */
2890e5e0f49e10 Zhang Yi           2024-12-20  4759  	filemap_invalidate_lock(mapping);
2890e5e0f49e10 Zhang Yi           2024-12-20  4760  
2890e5e0f49e10 Zhang Yi           2024-12-20  4761  	ret = ext4_break_layouts(inode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4762  	if (ret)
2890e5e0f49e10 Zhang Yi           2024-12-20  4763  		goto out_invalidate_lock;
2890e5e0f49e10 Zhang Yi           2024-12-20  4764  
fd2f764826df54 Zhang Yi           2024-12-20  4765  	if (mode & FALLOC_FL_PUNCH_HOLE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4766  		ret = ext4_punch_hole(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4767  	else if (mode & FALLOC_FL_COLLAPSE_RANGE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4768  		ret = ext4_collapse_range(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4769  	else if (mode & FALLOC_FL_INSERT_RANGE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4770  		ret = ext4_insert_range(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4771  	else if (mode & FALLOC_FL_ZERO_RANGE)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  4772  		ret = ext4_zero_range(file, offset, len, mode);
fd2f764826df54 Zhang Yi           2024-12-20  4773  	else
2890e5e0f49e10 Zhang Yi           2024-12-20  4774  		ret = -EOPNOTSUPP;
2890e5e0f49e10 Zhang Yi           2024-12-20  4775  
2890e5e0f49e10 Zhang Yi           2024-12-20  4776  out_invalidate_lock:
2890e5e0f49e10 Zhang Yi           2024-12-20  4777  	filemap_invalidate_unlock(mapping);
ea3f17efd36b56 Zhang Yi           2024-12-20  4778  out_inode_lock:
ea3f17efd36b56 Zhang Yi           2024-12-20  4779  	inode_unlock(inode);
0e8b6879f3c234 Lukas Czerner      2014-03-18 @4780  	return ret;
a2df2a63407803 Amit Arora         2007-07-17  4781  }
6873fa0de14e49 Eric Sandeen       2008-10-07  4782  

:::::: The code at line 4780 was first introduced by commit
:::::: 0e8b6879f3c234036181526683be2b0231892ae4 ext4: refactor ext4_fallocate code

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
