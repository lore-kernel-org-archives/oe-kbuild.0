Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1A320B
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732971211; cv=none; b=NpgfhHgoIMImi8zkt9qxTxVGlxOxvTMq6OHvvmHTVC71QgUEBWBi7PZ5uo/f+Aw3S+7zyEVQOVV5EpxTVWeyay5mvWOZ7mI7IJUdJEdkU6XVYn4LD5XR58jUWK16pVn//Vb44dAUi25LkYEg++rHJZuS3qPhHV4PwlCnN4pqflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732971211; c=relaxed/simple;
	bh=rWqF+w5rlhtWz2JKHr4PClaSINQjH6QC+Aue3xbHH7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DjWj+38hWK/Fo13EosbOteQHz7Nrfl+dSXM7uX5Ex6TLHSutn4HCML8RUuN3PXm24f2Uk0HQaWlZJjxfVupQHbwE42zXtaZ6eq9RRxd9IUT7vqgBdodJDKhyDhbSiIkE2MMkneTnn1g4MOVbxl6O4wD0sbSr4Da7i08/DeZmipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VK2BFoZ6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK2BFoZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732971209; x=1764507209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWqF+w5rlhtWz2JKHr4PClaSINQjH6QC+Aue3xbHH7g=;
  b=VK2BFoZ67JnRZrWvFJ9N6OB5JFSg5rp9M4TBCwCsYaHGMYW4iGwC2Aei
   4I/NF+4WlWc9LQlslr30/GxCpsgYLU7IBwjrpK1MRoS0mCL7SU/l03QyR
   CVWDkXQ3mvk+7ZW9fxwl440Dvuw0phwzK1h75dmazDTZC4sxPzRSW1C38
   p6lH9BSlSkrpEH4OhwoM24ADxN5Nuc35sePpOUykvRHLj7A1UxSlOlHwd
   g6ggCTM800R/i3zN/7slaYOkrfK/+Ke2mzmMrQnkqu8T7xItyELrd5az9
   3WDBhkhsTS9ja25Qa/r9aZFL0srrDISXE38oZf3rvvK0QoBGSo1bktIb/
   A==;
X-CSE-ConnectionGUID: 1tp5z/EeSAyn7bBDBaWvyg==
X-CSE-MsgGUID: 1BjZwjWLSM2NNEdoWmQNSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33233941"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33233941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 04:53:28 -0800
X-CSE-ConnectionGUID: TpfdlUJFTh6resVPYUdGkg==
X-CSE-MsgGUID: qJPihJkKRbytZryTlW0WiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92559173"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 04:53:27 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHMyS-0000g3-1R;
	Sat, 30 Nov 2024 12:53:24 +0000
Date: Sat, 30 Nov 2024 20:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 145/166]
 fs/bcachefs/fs-io.c:214 bch2_flush_inode() error: uninitialized symbol
 'seq'.
Message-ID: <202411302017.i3vMey3D-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   0646dd12d4cdc32902feec7c97924e3db70d4087
commit: 36a8b97c9ab9f4819dc37a29b30144bf84f82bb8 [145/166] bcachefs: Check for inode journal seq in the future
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20241130 (https://download.01.org/0day-ci/archive/20241130/202411302017.i3vMey3D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411302017.i3vMey3D-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs-io.c:214 bch2_flush_inode() error: uninitialized symbol 'seq'.

vim +/seq +214 fs/bcachefs/fs-io.c

36a8b97c9ab9f4 Kent Overstreet 2024-11-28  197  
68a2054d88f7cd Kent Overstreet 2021-11-05  198  /*
68a2054d88f7cd Kent Overstreet 2021-11-05  199   * inode->ei_inode.bi_journal_seq won't be up to date since it's set in an
68a2054d88f7cd Kent Overstreet 2021-11-05  200   * insert trigger: look up the btree inode instead
68a2054d88f7cd Kent Overstreet 2021-11-05  201   */
a8b3a677e786fa Kent Overstreet 2022-11-02  202  static int bch2_flush_inode(struct bch_fs *c,
a8b3a677e786fa Kent Overstreet 2022-11-02  203  			    struct bch_inode_info *inode)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  204  {
68a2054d88f7cd Kent Overstreet 2021-11-05  205  	if (c->opts.journal_flush_disabled)
68a2054d88f7cd Kent Overstreet 2021-11-05  206  		return 0;
68a2054d88f7cd Kent Overstreet 2021-11-05  207  
9e203c43dc1cba Kent Overstreet 2024-04-13  208  	if (!bch2_write_ref_tryget(c, BCH_WRITE_REF_fsync))
9e203c43dc1cba Kent Overstreet 2024-04-13  209  		return -EROFS;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  210  
36a8b97c9ab9f4 Kent Overstreet 2024-11-28  211  	u64 seq;
36a8b97c9ab9f4 Kent Overstreet 2024-11-28  212  	int ret = bch2_trans_commit_do(c, NULL, NULL, 0,
36a8b97c9ab9f4 Kent Overstreet 2024-11-28  213  			bch2_get_inode_journal_seq_trans(trans, inode_inum(inode), &seq)) ?:
36a8b97c9ab9f4 Kent Overstreet 2024-11-28 @214  		  bch2_journal_flush_seq(&c->journal, seq, TASK_INTERRUPTIBLE) ?:
a8b3a677e786fa Kent Overstreet 2022-11-02  215  		  bch2_inode_flush_nocow_writes(c, inode);
9e203c43dc1cba Kent Overstreet 2024-04-13  216  	bch2_write_ref_put(c, BCH_WRITE_REF_fsync);
9e203c43dc1cba Kent Overstreet 2024-04-13  217  	return ret;
68a2054d88f7cd Kent Overstreet 2021-11-05  218  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
