Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993E262A3
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725374655; cv=none; b=HJpusOVWsTe67P/u7xsazHGPOo4CtM594vv4bi1oFUB1Oy3RjxjNf9i/JxA2RacoOTjEfQvGRyWQqbvLJm9/eAzE5YzCbtLpxECb8riO6CCze5J2KRJHvV12uLmFnYSTFCxAv0I2cHfvrcPKPx4op0Bcb7Duqu2KXbYH2TW6Tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725374655; c=relaxed/simple;
	bh=GLWRqqei8iCjSejLs/uLCnTVVtCDHbNVUvkjUM7Fj3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkI2Bt7xKT7nlPclgFsGPEA4vYNchbaiG/U/CT2IVcqxeBhzw4aWKUJwYfhIgH2Cx4jTewN3wxMkHBA9Z9yirMLZR3okfdDuT4tflHIIpORUD3rEtoyLnawfJMlFeDe53GDB3BCjACmTJV7c+qaHmNoS1DJMe/d+Q698+5theUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWOkJkOW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWOkJkOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725374654; x=1756910654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GLWRqqei8iCjSejLs/uLCnTVVtCDHbNVUvkjUM7Fj3E=;
  b=dWOkJkOW1PwHcEJoFqetlttuT5SNUlriJ7clArmM8z90VAx3aQofHukt
   wCL01+Sv2EVJqOFwS0t8+xMf7uT/1y9Udh9aebtAUdFdHBasqnt7e1jw4
   6qPCnHriFke0JmiVODzZjqZ3YtPzTL3PdA6upEtzBMZE8gzhxy6l4Iir/
   IqWLblPt0nEI4EdlRbL7l3uTAJg7tXr3XdBxbzE4Jv7yDTyDa7EkXMsCk
   9XgL+RMq7JMcnsbp2rWCtD6UN1+EfsgQuvYZphpzrMRQexlNZcCOcp2jh
   XYV7nS/v/FlMOvfFLFJrLuY9ilcgVpByBHAOF0FjcHOWI87hKnP4GoueE
   A==;
X-CSE-ConnectionGUID: HeFRRm7lQ4WVCwZJpWA5vg==
X-CSE-MsgGUID: KBSwuag0SveDpSVZB4gQOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="49383842"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="49383842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:44:13 -0700
X-CSE-ConnectionGUID: bS8uQtOSTLWuoTVKMVUTIw==
X-CSE-MsgGUID: 2h0dkz/8SxmL0430li0/zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64610457"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 07:44:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slUlN-0006oA-1O;
	Tue, 03 Sep 2024 14:44:09 +0000
Date: Tue, 3 Sep 2024 22:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [riteshharjani:notmuch-20240830073800.2131781-1-yi.zhang@huaweicloud.com
 8/10] fs/ext4/extents.c:4713 ext4_do_fallocate() error: uninitialized symbol
 'len_lblk'.
Message-ID: <202409032257.MlcGmpHd-lkp@intel.com>
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
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

Hi Zhang,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/riteshharjani/linux notmuch-20240830073800.2131781-1-yi.zhang@huaweicloud.com
head:   67214af3781b6c7fc5dcc524eb0826d638c39fdc
commit: f265e7a5e7cd772107b3876f91035bc7ab72013c [8/10] ext4: factor out ext4_do_fallocate()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r072-20240901 (https://download.01.org/0day-ci/archive/20240903/202409032257.MlcGmpHd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409032257.MlcGmpHd-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:4713 ext4_do_fallocate() error: uninitialized symbol 'len_lblk'.

vim +/len_lblk +4713 fs/ext4/extents.c

b8a8684502a0fc8 Lukas Czerner 2014-03-18  4664  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4665  static long ext4_do_fallocate(struct file *file, loff_t offset,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4666  			      loff_t len, int mode)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4667  {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4668  	struct inode *inode = file_inode(file);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4669  	loff_t end = offset + len;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4670  	loff_t new_size = 0;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4671  	ext4_lblk_t start_lblk, len_lblk;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4672  	int ret;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4673  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4674  	trace_ext4_fallocate_enter(inode, offset, len, mode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4675  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4676  	inode_lock(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4677  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4678  	/* We only support preallocation for extent-based files only. */
f265e7a5e7cd772 Zhang Yi      2024-08-30  4679  	if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4680  		ret = -EOPNOTSUPP;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4681  		goto out;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4682  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4683  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4684  	if (!(mode & FALLOC_FL_KEEP_SIZE) &&
f265e7a5e7cd772 Zhang Yi      2024-08-30  4685  	    (end > inode->i_size || end > EXT4_I(inode)->i_disksize)) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4686  		new_size = end;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4687  		ret = inode_newsize_ok(inode, new_size);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4688  		if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4689  			goto out;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4690  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4691  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4692  	/* Wait all existing dio workers, newcomers will block on i_rwsem */
f265e7a5e7cd772 Zhang Yi      2024-08-30  4693  	inode_dio_wait(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4694  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4695  	ret = file_modified(file);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4696  	if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4697  		goto out;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4698  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4699  	start_lblk = offset >> inode->i_blkbits;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4700  	len_lblk = EXT4_MAX_BLOCKS(len, offset, inode->i_blkbits);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4701  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4702  	ret = ext4_alloc_file_blocks(file, start_lblk, len_lblk, new_size,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4703  				     EXT4_GET_BLOCKS_CREATE_UNWRIT_EXT);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4704  	if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4705  		goto out;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4706  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4707  	if (file->f_flags & O_SYNC && EXT4_SB(inode->i_sb)->s_journal) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4708  		ret = ext4_fc_commit(EXT4_SB(inode->i_sb)->s_journal,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4709  					EXT4_I(inode)->i_sync_tid);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4710  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4711  out:
f265e7a5e7cd772 Zhang Yi      2024-08-30  4712  	inode_unlock(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30 @4713  	trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4714  	return ret;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4715  }
f265e7a5e7cd772 Zhang Yi      2024-08-30  4716  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
