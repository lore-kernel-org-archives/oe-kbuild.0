Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A4163
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159359; cv=none; b=Mm7k3v3f+kfnMN/sByjvnj/RGgvTg0UaLQUeHpXtfNAsgjKDAJeBS3bnDBhsW9B5nawF84jS53KOywda/nh4+ej3eobrxG6XQicvFeEBQTZMz0D4FvAH0/R3lwkF7evM0PssoINObx+Jd+0RIziqU+GgBIMKOY/mO+FuY7FkyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159359; c=relaxed/simple;
	bh=TQ33iQOdCzPjzeeXET0Q9QYW8PEHbRSPjWvoRx3b0Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh0XbZMgPlqnxdAizBMGlqFKswDdSmZINiwueZJp83sprhPXViSOQhNJYdVbSpDNvV2ttghlgqssKI3heX++L05GIieHmQejPZMEFWcaoxv6P4fYfqCYGU548Q5Z94A2zAN6ckVp0JPbx/TFsuRETn5G/LeKLYnQXgRkXCTeA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5jazXxI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5jazXxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770159357; x=1801695357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQ33iQOdCzPjzeeXET0Q9QYW8PEHbRSPjWvoRx3b0Zk=;
  b=A5jazXxIwN5CA1/DbgL9KZT9a+YeH4fMGQR4nliXtdDOUnZ2Tgej2p0j
   UhhdbBXB3bSe65cLkFPYOHyWTQxsLEUuXoL90z+MgX6qfQPai1zSh5AkN
   ixOQeN/M1xHvguIzYnGFxiQklYrFBfG2E730ClH9QRW6CnOpZ6AkKCss9
   6exkO37htZ6H+yZNrxQG7AtrzH4R7Pdf+bMsXdrBxzBFy4BAwEkcRgiuJ
   ipYOsv/c+YlzBa6zQB0c+oLmvDB/ym0Hrf07fSg4m21xsw9Expba4mryU
   4gY48LDML9R+Kt4xtvSoStNJ8AgI8Ln4K9Bq601ZUN17emDeDNYEkjBDU
   Q==;
X-CSE-ConnectionGUID: QmWGjm7YSFKRQ4iPNH/81g==
X-CSE-MsgGUID: /zDZmPbyQFqD4l3Z/7d2lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58919904"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="58919904"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:55:57 -0800
X-CSE-ConnectionGUID: YZoPXYI8QVGGFw0NfxBHIg==
X-CSE-MsgGUID: 5Xmkr1eNRXqXnwmjO6b0PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210064212"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2026 14:55:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPJJ-00000000hFg-1p0y;
	Tue, 03 Feb 2026 22:55:53 +0000
Date: Wed, 4 Feb 2026 06:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH -next v2 03/22] ext4: only order data when partially
 block truncating down
Message-ID: <202602040603.cf5kNUpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ext4/inode.c:4577:32: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260203062523.3869120-4-yi.zhang@huawei.com>
References: <20260203062523.3869120-4-yi.zhang@huawei.com>
TO: Zhang Yi <yi.zhang@huawei.com>
TO: linux-ext4@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: tytso@mit.edu
CC: adilger.kernel@dilger.ca
CC: jack@suse.cz
CC: ojaswin@linux.ibm.com
CC: ritesh.list@gmail.com
CC: hch@infradead.org
CC: djwong@kernel.org
CC: yi.zhang@huawei.com
CC: yi.zhang@huaweicloud.com
CC: yizhang089@gmail.com
CC: libaokun1@huawei.com
CC: yangerkun@huawei.com
CC: yukuai@fnnas.com

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260202]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ext4-make-ext4_block_zero_page_range-pass-out-did_zero/20260203-144244
base:   next-20260202
patch link:    https://lore.kernel.org/r/20260203062523.3869120-4-yi.zhang%40huawei.com
patch subject: [PATCH -next v2 03/22] ext4: only order data when partially block truncating down
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: m68k-randconfig-r123-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040603.cf5kNUpN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040603.cf5kNUpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602040603.cf5kNUpN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:4577:32: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/ext4/inode.c:4575:52: sparse: signed value source

vim +4577 fs/ext4/inode.c

a361293f5fedea Jan Kara           2013-08-16  4494  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4495  /*
617ba13b31fbf5 Mingming Cao       2006-10-11  4496   * ext4_truncate()
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4497   *
617ba13b31fbf5 Mingming Cao       2006-10-11  4498   * We block out ext4_get_block() block instantiations across the entire
617ba13b31fbf5 Mingming Cao       2006-10-11  4499   * transaction, and VFS/VM ensures that ext4_truncate() cannot run
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4500   * simultaneously on behalf of the same inode.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4501   *
42b2aa86c66703 Justin P. Mattock  2011-11-28  4502   * As we work through the truncate and commit bits of it to the journal there
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4503   * is one core, guiding principle: the file's tree must always be consistent on
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4504   * disk.  We must be able to restart the truncate after a crash.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4505   *
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4506   * The file's tree may be transiently inconsistent in memory (although it
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4507   * probably isn't), but whenever we close off and commit a journal transaction,
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4508   * the contents of (the filesystem + the journal) must be consistent and
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4509   * restartable.  It's pretty simple, really: bottom up, right to left (although
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4510   * left-to-right works OK too).
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4511   *
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4512   * Note that at recovery time, journal replay occurs *before* the restart of
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4513   * truncate against the orphan inode list.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4514   *
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4515   * The committed inode has the new, desired i_size (which is the same as
617ba13b31fbf5 Mingming Cao       2006-10-11  4516   * i_disksize in this case).  After a crash, ext4_orphan_cleanup() will see
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4517   * that this inode's truncate did not complete and it will again call
617ba13b31fbf5 Mingming Cao       2006-10-11  4518   * ext4_truncate() to have another go.  So there will be instantiated blocks
617ba13b31fbf5 Mingming Cao       2006-10-11  4519   * to the right of the truncation point in a crashed ext4 filesystem.  But
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4520   * that's fine - as long as they are linked from the inode, the post-crash
617ba13b31fbf5 Mingming Cao       2006-10-11  4521   * ext4_truncate() run will find them and release them.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4522   */
2c98eb5ea24976 Theodore Ts'o      2016-11-13  4523  int ext4_truncate(struct inode *inode)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4524  {
819c4920b7e60e Theodore Ts'o      2013-04-03  4525  	struct ext4_inode_info *ei = EXT4_I(inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4526  	unsigned int credits;
4209ae12b12265 Harshad Shirwadkar 2020-04-26  4527  	int err = 0, err2;
819c4920b7e60e Theodore Ts'o      2013-04-03  4528  	handle_t *handle;
819c4920b7e60e Theodore Ts'o      2013-04-03  4529  	struct address_space *mapping = inode->i_mapping;
819c4920b7e60e Theodore Ts'o      2013-04-03  4530  
19b5ef61578706 Theodore Ts'o      2013-04-03  4531  	/*
19b5ef61578706 Theodore Ts'o      2013-04-03  4532  	 * There is a possibility that we're either freeing the inode
e04027e887c37b Matthew Wilcox     2014-03-24  4533  	 * or it's a completely new inode. In those cases we might not
f340b3d9027485 hongnanli          2022-01-21  4534  	 * have i_rwsem locked because it's not necessary.
19b5ef61578706 Theodore Ts'o      2013-04-03  4535  	 */
f5aa78e2be066f Mateusz Guzik      2025-10-09  4536  	if (!(inode_state_read_once(inode) & (I_NEW | I_FREEING)))
5955102c9984fa Al Viro            2016-01-22  4537  		WARN_ON(!inode_is_locked(inode));
0562e0bad483d1 Jiaying Zhang      2011-03-21  4538  	trace_ext4_truncate_enter(inode);
0562e0bad483d1 Jiaying Zhang      2011-03-21  4539  
91ef4caf800030 Duane Griffin      2008-07-11  4540  	if (!ext4_can_truncate(inode))
9a5d265fed0141 zhengliang         2020-07-01  4541  		goto out_trace;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4542  
5534fb5bb35a62 Theodore Ts'o      2009-09-17  4543  	if (inode->i_size == 0 && !test_opt(inode->i_sb, NO_AUTO_DA_ALLOC))
19f5fb7ad679bb Theodore Ts'o      2010-01-24  4544  		ext4_set_inode_state(inode, EXT4_STATE_DA_ALLOC_CLOSE);
7d8f9f7d150dde Theodore Ts'o      2009-02-24  4545  
aef1c8513c1f8a Tao Ma             2012-12-10  4546  	if (ext4_has_inline_data(inode)) {
aef1c8513c1f8a Tao Ma             2012-12-10  4547  		int has_inline = 1;
aef1c8513c1f8a Tao Ma             2012-12-10  4548  
01daf9452569fe Theodore Ts'o      2017-01-22  4549  		err = ext4_inline_data_truncate(inode, &has_inline);
9a5d265fed0141 zhengliang         2020-07-01  4550  		if (err || has_inline)
9a5d265fed0141 zhengliang         2020-07-01  4551  			goto out_trace;
aef1c8513c1f8a Tao Ma             2012-12-10  4552  	}
aef1c8513c1f8a Tao Ma             2012-12-10  4553  
a361293f5fedea Jan Kara           2013-08-16  4554  	/* If we zero-out tail of the page, we have to create jinode for jbd2 */
a361293f5fedea Jan Kara           2013-08-16  4555  	if (inode->i_size & (inode->i_sb->s_blocksize - 1)) {
a71248b1accb2b Baokun Li          2022-11-02  4556  		err = ext4_inode_attach_jinode(inode);
a71248b1accb2b Baokun Li          2022-11-02  4557  		if (err)
9a5d265fed0141 zhengliang         2020-07-01  4558  			goto out_trace;
a361293f5fedea Jan Kara           2013-08-16  4559  	}
a361293f5fedea Jan Kara           2013-08-16  4560  
819c4920b7e60e Theodore Ts'o      2013-04-03  4561  	if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
57661f28756c59 Zhang Yi           2025-07-07  4562  		credits = ext4_chunk_trans_extent(inode, 1);
819c4920b7e60e Theodore Ts'o      2013-04-03  4563  	else
819c4920b7e60e Theodore Ts'o      2013-04-03  4564  		credits = ext4_blocks_for_truncate(inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4565  
819c4920b7e60e Theodore Ts'o      2013-04-03  4566  	handle = ext4_journal_start(inode, EXT4_HT_TRUNCATE, credits);
9a5d265fed0141 zhengliang         2020-07-01  4567  	if (IS_ERR(handle)) {
9a5d265fed0141 zhengliang         2020-07-01  4568  		err = PTR_ERR(handle);
9a5d265fed0141 zhengliang         2020-07-01  4569  		goto out_trace;
9a5d265fed0141 zhengliang         2020-07-01  4570  	}
819c4920b7e60e Theodore Ts'o      2013-04-03  4571  
67ca742f43ffa5 Zhang Yi           2026-02-03  4572  	if (inode->i_size & (inode->i_sb->s_blocksize - 1)) {
67ca742f43ffa5 Zhang Yi           2026-02-03  4573  		unsigned int zero_len;
67ca742f43ffa5 Zhang Yi           2026-02-03  4574  
67ca742f43ffa5 Zhang Yi           2026-02-03  4575  		zero_len = ext4_block_truncate_page(handle, mapping,
67ca742f43ffa5 Zhang Yi           2026-02-03  4576  						    inode->i_size);
67ca742f43ffa5 Zhang Yi           2026-02-03 @4577  		if (zero_len < 0) {
67ca742f43ffa5 Zhang Yi           2026-02-03  4578  			err = zero_len;
67ca742f43ffa5 Zhang Yi           2026-02-03  4579  			goto out_stop;
67ca742f43ffa5 Zhang Yi           2026-02-03  4580  		}
67ca742f43ffa5 Zhang Yi           2026-02-03  4581  		if (zero_len && !IS_DAX(inode) &&
67ca742f43ffa5 Zhang Yi           2026-02-03  4582  		    ext4_should_order_data(inode)) {
67ca742f43ffa5 Zhang Yi           2026-02-03  4583  			err = ext4_jbd2_inode_add_write(handle, inode,
67ca742f43ffa5 Zhang Yi           2026-02-03  4584  					inode->i_size, zero_len);
67ca742f43ffa5 Zhang Yi           2026-02-03  4585  			if (err)
67ca742f43ffa5 Zhang Yi           2026-02-03  4586  				goto out_stop;
67ca742f43ffa5 Zhang Yi           2026-02-03  4587  		}
67ca742f43ffa5 Zhang Yi           2026-02-03  4588  	}
819c4920b7e60e Theodore Ts'o      2013-04-03  4589  
819c4920b7e60e Theodore Ts'o      2013-04-03  4590  	/*
819c4920b7e60e Theodore Ts'o      2013-04-03  4591  	 * We add the inode to the orphan list, so that if this
819c4920b7e60e Theodore Ts'o      2013-04-03  4592  	 * truncate spans multiple transactions, and we crash, we will
819c4920b7e60e Theodore Ts'o      2013-04-03  4593  	 * resume the truncate when the filesystem recovers.  It also
819c4920b7e60e Theodore Ts'o      2013-04-03  4594  	 * marks the inode dirty, to catch the new size.
819c4920b7e60e Theodore Ts'o      2013-04-03  4595  	 *
819c4920b7e60e Theodore Ts'o      2013-04-03  4596  	 * Implication: the file must always be in a sane, consistent
819c4920b7e60e Theodore Ts'o      2013-04-03  4597  	 * truncatable state while each transaction commits.
819c4920b7e60e Theodore Ts'o      2013-04-03  4598  	 */
2c98eb5ea24976 Theodore Ts'o      2016-11-13  4599  	err = ext4_orphan_add(handle, inode);
2c98eb5ea24976 Theodore Ts'o      2016-11-13  4600  	if (err)
819c4920b7e60e Theodore Ts'o      2013-04-03  4601  		goto out_stop;
819c4920b7e60e Theodore Ts'o      2013-04-03  4602  
4d3266463ed06a Harshad Shirwadkar 2025-05-08  4603  	ext4_fc_track_inode(handle, inode);
1b4d2a0b794669 Zhang Yi           2025-04-23  4604  	ext4_check_map_extents_env(inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4605  
1b4d2a0b794669 Zhang Yi           2025-04-23  4606  	down_write(&EXT4_I(inode)->i_data_sem);
2ffd2a6ad1d3a8 Kemeng Shi         2024-01-05  4607  	ext4_discard_preallocations(inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4608  
ff9893dc8aa622 Amir Goldstein     2011-06-27  4609  	if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
d0abb36db44faa Theodore Ts'o      2016-11-13  4610  		err = ext4_ext_truncate(handle, inode);
ff9893dc8aa622 Amir Goldstein     2011-06-27  4611  	else
819c4920b7e60e Theodore Ts'o      2013-04-03  4612  		ext4_ind_truncate(handle, inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4613  
819c4920b7e60e Theodore Ts'o      2013-04-03  4614  	up_write(&ei->i_data_sem);
d0abb36db44faa Theodore Ts'o      2016-11-13  4615  	if (err)
d0abb36db44faa Theodore Ts'o      2016-11-13  4616  		goto out_stop;
819c4920b7e60e Theodore Ts'o      2013-04-03  4617  
819c4920b7e60e Theodore Ts'o      2013-04-03  4618  	if (IS_SYNC(inode))
819c4920b7e60e Theodore Ts'o      2013-04-03  4619  		ext4_handle_sync(handle);
819c4920b7e60e Theodore Ts'o      2013-04-03  4620  
819c4920b7e60e Theodore Ts'o      2013-04-03  4621  out_stop:
819c4920b7e60e Theodore Ts'o      2013-04-03  4622  	/*
819c4920b7e60e Theodore Ts'o      2013-04-03  4623  	 * If this was a simple ftruncate() and the file will remain alive,
819c4920b7e60e Theodore Ts'o      2013-04-03  4624  	 * then we need to clear up the orphan record which we created above.
819c4920b7e60e Theodore Ts'o      2013-04-03  4625  	 * However, if this was a real unlink then we were called by
58d86a50eee6f8 Wang Shilong       2014-11-25  4626  	 * ext4_evict_inode(), and we allow that function to clean up the
819c4920b7e60e Theodore Ts'o      2013-04-03  4627  	 * orphan info for us.
819c4920b7e60e Theodore Ts'o      2013-04-03  4628  	 */
819c4920b7e60e Theodore Ts'o      2013-04-03  4629  	if (inode->i_nlink)
819c4920b7e60e Theodore Ts'o      2013-04-03  4630  		ext4_orphan_del(handle, inode);
819c4920b7e60e Theodore Ts'o      2013-04-03  4631  
b898ab233611f7 Jeff Layton        2023-10-04  4632  	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
4209ae12b12265 Harshad Shirwadkar 2020-04-26  4633  	err2 = ext4_mark_inode_dirty(handle, inode);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  4634  	if (unlikely(err2 && !err))
4209ae12b12265 Harshad Shirwadkar 2020-04-26  4635  		err = err2;
819c4920b7e60e Theodore Ts'o      2013-04-03  4636  	ext4_journal_stop(handle);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4637  
9a5d265fed0141 zhengliang         2020-07-01  4638  out_trace:
0562e0bad483d1 Jiaying Zhang      2011-03-21  4639  	trace_ext4_truncate_exit(inode);
2c98eb5ea24976 Theodore Ts'o      2016-11-13  4640  	return err;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4641  }
ac27a0ec112a08 Dave Kleikamp      2006-10-11  4642  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
