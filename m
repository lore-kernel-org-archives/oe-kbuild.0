Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60023BF9E
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762316457; cv=none; b=X1fmKPtF0WVHMq3JYAUV+MEiqZ5p8GAHvTmS+UTf7lNTxuG77+dEPzdgvmGwdFpHCxdt87DknxaVvWroe7qEVYpb7wHkHjTtHjnvxyFDzmsVWbUWIYcmUMjiU3fGpQdsjbxMpIbHKeAfuGVUQY0R7LlmcIs05I5r+ksQKf/y31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762316457; c=relaxed/simple;
	bh=SIONsr4rjsmlSSF/4sLCGncbJ6XCliqNf4ENZANTM8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THRm1HjBejAT2405GV5QPyWai2R4lEYH+knGv3wHWx5TjMBxVRh53pVkx7mCrBaFOHpQbkcCJvcDfRis2M+bUxmYhLU2KSAWZW5wSMBWX4bc/Pre7JV1Efg7eOt3Los5wAiCpjzeAFQtOuBxR54LPj5u4oZV88vKFJVPXLcyQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kI+VvQwd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kI+VvQwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762316454; x=1793852454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIONsr4rjsmlSSF/4sLCGncbJ6XCliqNf4ENZANTM8o=;
  b=kI+VvQwdlAOdYRQZY3E9pfFzW/1JOEOcYFhJpvDn/Bi0B61mx4fOeRtP
   0Em7ykpzwxkwzI9HoB6Zkzf48XOErvemdse+fJinJNKiE/u5rLgdm8LGK
   WLO/Dd2nArx5cO7TfaxezHTyb3eXLqyxOSqzum5jdCA+GyWo60AMHxa8H
   33I/HarztSXQrDd0+ycwYqoGYfGKD6YStc3s3vF/Z539sBh4CoNBUW4YU
   c+l2EKNvCewkGcy4AgzRD9haNN2zZeU/UQgtJf5mnrn26MS1+DajcZmir
   KosYKjqFdykk5CzHy8PXJ/ao0UxNcLv0qy0Yt1thacBXb5dmcd1yTvS45
   g==;
X-CSE-ConnectionGUID: js8NniniRUuLneGv3Vn3zg==
X-CSE-MsgGUID: xcwytdr3Tg+lXAdfWWu4Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64346424"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64346424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 20:20:53 -0800
X-CSE-ConnectionGUID: hQwHSGlnTte3wocxxavh2A==
X-CSE-MsgGUID: u8ni78b0RuS2JQTFPRfq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="217989896"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 20:20:54 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGV0o-000SA3-2u;
	Wed, 05 Nov 2025 04:20:48 +0000
Date: Wed, 5 Nov 2025 12:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15 0/1] fs/f2fs/file.c:4296:36-45:
 WARNING: Unsigned expression compared with zero: map . m_len > 0
Message-ID: <202511051200.72M0tuV9-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3a3182c2bccc0f83e85c72d4b06dcce7da072b50
commit: 5b26cc027d8837677f1b3cb10291ed0d686c0c75 [0/1] f2fs: rework write preallocations
:::::: branch date: 31 hours ago
:::::: commit date: 3 years, 11 months ago
config: i386-randconfig-053-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051200.72M0tuV9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511051200.72M0tuV9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/file.c:4296:36-45: WARNING: Unsigned expression compared with zero: map . m_len > 0

vim +4296 fs/f2fs/file.c

4c8ff7095bef64 Chao Yu      2019-11-01  4237  
5b26cc027d8837 Eric Biggers 2021-07-16  4238  /*
5b26cc027d8837 Eric Biggers 2021-07-16  4239   * Preallocate blocks for a write request, if it is possible and helpful to do
5b26cc027d8837 Eric Biggers 2021-07-16  4240   * so.  Returns a positive number if blocks may have been preallocated, 0 if no
5b26cc027d8837 Eric Biggers 2021-07-16  4241   * blocks were preallocated, or a negative errno value if something went
5b26cc027d8837 Eric Biggers 2021-07-16  4242   * seriously wrong.  Also sets FI_PREALLOCATED_ALL on the inode if *all* the
5b26cc027d8837 Eric Biggers 2021-07-16  4243   * requested blocks (not just some of them) have been allocated.
5b26cc027d8837 Eric Biggers 2021-07-16  4244   */
5b26cc027d8837 Eric Biggers 2021-07-16  4245  static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
5b26cc027d8837 Eric Biggers 2021-07-16  4246  {
5b26cc027d8837 Eric Biggers 2021-07-16  4247  	struct inode *inode = file_inode(iocb->ki_filp);
5b26cc027d8837 Eric Biggers 2021-07-16  4248  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
5b26cc027d8837 Eric Biggers 2021-07-16  4249  	const loff_t pos = iocb->ki_pos;
5b26cc027d8837 Eric Biggers 2021-07-16  4250  	const size_t count = iov_iter_count(iter);
5b26cc027d8837 Eric Biggers 2021-07-16  4251  	struct f2fs_map_blocks map = {};
5b26cc027d8837 Eric Biggers 2021-07-16  4252  	bool dio = (iocb->ki_flags & IOCB_DIRECT) &&
5b26cc027d8837 Eric Biggers 2021-07-16  4253  		   !f2fs_force_buffered_io(inode, iocb, iter);
5b26cc027d8837 Eric Biggers 2021-07-16  4254  	int flag;
5b26cc027d8837 Eric Biggers 2021-07-16  4255  	int ret;
5b26cc027d8837 Eric Biggers 2021-07-16  4256  
5b26cc027d8837 Eric Biggers 2021-07-16  4257  	/* If it will be an out-of-place direct write, don't bother. */
5b26cc027d8837 Eric Biggers 2021-07-16  4258  	if (dio && f2fs_lfs_mode(sbi))
5b26cc027d8837 Eric Biggers 2021-07-16  4259  		return 0;
5b26cc027d8837 Eric Biggers 2021-07-16  4260  
5b26cc027d8837 Eric Biggers 2021-07-16  4261  	/* No-wait I/O can't allocate blocks. */
5b26cc027d8837 Eric Biggers 2021-07-16  4262  	if (iocb->ki_flags & IOCB_NOWAIT)
5b26cc027d8837 Eric Biggers 2021-07-16  4263  		return 0;
5b26cc027d8837 Eric Biggers 2021-07-16  4264  
5b26cc027d8837 Eric Biggers 2021-07-16  4265  	/* If it will be a short write, don't bother. */
5b26cc027d8837 Eric Biggers 2021-07-16  4266  	if (iov_iter_fault_in_readable(iter, count))
5b26cc027d8837 Eric Biggers 2021-07-16  4267  		return 0;
5b26cc027d8837 Eric Biggers 2021-07-16  4268  
5b26cc027d8837 Eric Biggers 2021-07-16  4269  	if (f2fs_has_inline_data(inode)) {
5b26cc027d8837 Eric Biggers 2021-07-16  4270  		/* If the data will fit inline, don't bother. */
5b26cc027d8837 Eric Biggers 2021-07-16  4271  		if (pos + count <= MAX_INLINE_DATA(inode))
5b26cc027d8837 Eric Biggers 2021-07-16  4272  			return 0;
5b26cc027d8837 Eric Biggers 2021-07-16  4273  		ret = f2fs_convert_inline_inode(inode);
5b26cc027d8837 Eric Biggers 2021-07-16  4274  		if (ret)
5b26cc027d8837 Eric Biggers 2021-07-16  4275  			return ret;
5b26cc027d8837 Eric Biggers 2021-07-16  4276  	}
5b26cc027d8837 Eric Biggers 2021-07-16  4277  
5b26cc027d8837 Eric Biggers 2021-07-16  4278  	/* Do not preallocate blocks that will be written partially in 4KB. */
5b26cc027d8837 Eric Biggers 2021-07-16  4279  	map.m_lblk = F2FS_BLK_ALIGN(pos);
5b26cc027d8837 Eric Biggers 2021-07-16  4280  	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
5b26cc027d8837 Eric Biggers 2021-07-16  4281  	if (map.m_len > map.m_lblk)
5b26cc027d8837 Eric Biggers 2021-07-16  4282  		map.m_len -= map.m_lblk;
5b26cc027d8837 Eric Biggers 2021-07-16  4283  	else
5b26cc027d8837 Eric Biggers 2021-07-16  4284  		map.m_len = 0;
5b26cc027d8837 Eric Biggers 2021-07-16  4285  	map.m_may_create = true;
5b26cc027d8837 Eric Biggers 2021-07-16  4286  	if (dio) {
5b26cc027d8837 Eric Biggers 2021-07-16  4287  		map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
5b26cc027d8837 Eric Biggers 2021-07-16  4288  		flag = F2FS_GET_BLOCK_PRE_DIO;
5b26cc027d8837 Eric Biggers 2021-07-16  4289  	} else {
5b26cc027d8837 Eric Biggers 2021-07-16  4290  		map.m_seg_type = NO_CHECK_TYPE;
5b26cc027d8837 Eric Biggers 2021-07-16  4291  		flag = F2FS_GET_BLOCK_PRE_AIO;
5b26cc027d8837 Eric Biggers 2021-07-16  4292  	}
5b26cc027d8837 Eric Biggers 2021-07-16  4293  
5b26cc027d8837 Eric Biggers 2021-07-16  4294  	ret = f2fs_map_blocks(inode, &map, 1, flag);
5b26cc027d8837 Eric Biggers 2021-07-16  4295  	/* -ENOSPC is only a fatal error if no blocks could be allocated. */
5b26cc027d8837 Eric Biggers 2021-07-16 @4296  	if (ret < 0 && !(ret == -ENOSPC && map.m_len > 0))
5b26cc027d8837 Eric Biggers 2021-07-16  4297  		return ret;
5b26cc027d8837 Eric Biggers 2021-07-16  4298  	if (ret == 0)
5b26cc027d8837 Eric Biggers 2021-07-16  4299  		set_inode_flag(inode, FI_PREALLOCATED_ALL);
5b26cc027d8837 Eric Biggers 2021-07-16  4300  	return map.m_len;
5b26cc027d8837 Eric Biggers 2021-07-16  4301  }
5b26cc027d8837 Eric Biggers 2021-07-16  4302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
