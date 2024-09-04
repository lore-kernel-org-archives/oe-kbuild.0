Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4F1DFE1F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725468755; cv=none; b=jI/9Xc3Reeorovr+dqCNmWYiNv5K2gOzB7iSDLhbBU/1NZ1bWYiDQI+bGrUPYA3e6QgeUR89pX58WHjesO0E2gEP850boMbEvvgZJIZgfhLQ9ocY+i/+/0+QJI0ZKlNAwKlLCKiJLpOsBmgITv9Xby7O0f6k5pqv3s4pbhPWLrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725468755; c=relaxed/simple;
	bh=PvuDMQ+oBePukUcK8AB52p8dYaqNpNghPn068i5LuOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1YI+0uurOspsA/vuN04/TlVL/tihnOtcD7Qqhh9SepUEY5fL6/ZKfADUwlXH8pXeTjbe1VhAdgF9DswjSuU5y6YKdKes/MfZJixdVWK5/3fL1ZFBUmIPG/SGkWvgtxJosRDpAcRHgamI5RtWI9RNDx9y74qP7zfFphLqHVwdKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf4XHFFF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf4XHFFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725468754; x=1757004754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvuDMQ+oBePukUcK8AB52p8dYaqNpNghPn068i5LuOs=;
  b=Yf4XHFFF95NBNi+lkPjIQDvaTJGbXPrVh/8KVB09a5dltOMqW/mOZ8xu
   s9fJ9dMkQgIwbDTFmWRFWvxu9xEHAzeoFEGW0lUfo56WKD7wmOWCjbLRK
   sbuA/Yl/+BuEobMw+sk4EoWzKOQ5GfdVbEOa4JDQbSCBRNU2TP/8pgWr3
   C0l5lyy8qpxLG+1dAOcX3skUT1lnarZFh6qGNRKL+ZNkCiUriXbuMVFM1
   HAqajIRjW5OfryfOb1OJl7+uPqcMqtGAV/R+pS+4Q1a8inZ71d/Vx91m5
   rp/ukgrZQQ4VfUWjuSsbScIVPdgLY3QVk/1Tqur6evKh/S449kAvEvTxB
   g==;
X-CSE-ConnectionGUID: tmO+mxn9RQaRNpGf6voJRQ==
X-CSE-MsgGUID: FMnVhWinT/SEnc59oX/UPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23706958"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="23706958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 09:52:32 -0700
X-CSE-ConnectionGUID: 00XiEIjDQJmnKC7Qe+ATmQ==
X-CSE-MsgGUID: 2LinzVStSA2saSsgcSL5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65661100"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Sep 2024 09:52:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sltF6-0008Lv-2E;
	Wed, 04 Sep 2024 16:52:28 +0000
Date: Thu, 5 Sep 2024 00:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
Message-ID: <202409050044.EGobujzB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Baokun Li <libaokun1@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>
CC: Ojaswin Mujoo <ojaswin@linux.ibm.com>

Hi Baokun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 92bbb922166cd7a829bf60d168372ffa1c54e81d [8348/9291] ext4: make some fast commit functions reuse extents path
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050044.EGobujzB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409050044.EGobujzB-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:6155 ext4_ext_clear_bb() error: double free of 'path'

vim +/path +6155 fs/ext4/extents.c

8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6107  
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6108  int ext4_ext_clear_bb(struct inode *inode)
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6109  {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6110  	struct ext4_ext_path *path = NULL;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6111  	struct ext4_extent *ex;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6112  	ext4_lblk_t cur = 0, end;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6113  	int j, ret = 0;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6114  	struct ext4_map_blocks map;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6115  
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6116  	if (ext4_test_inode_flag(inode, EXT4_INODE_INLINE_DATA))
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6117  		return 0;
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6118  
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6119  	/* Determin the size of the file first */
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6120  	path = ext4_find_extent(inode, EXT_MAX_BLOCKS - 1, NULL,
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6121  					EXT4_EX_NOCACHE);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6122  	if (IS_ERR(path))
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6123  		return PTR_ERR(path);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6124  	ex = path[path->p_depth].p_ext;
92bbb922166cd7 Baokun Li          2024-08-22  6125  	if (!ex)
92bbb922166cd7 Baokun Li          2024-08-22  6126  		goto out;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6127  	end = le32_to_cpu(ex->ee_block) + ext4_ext_get_actual_len(ex);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6128  
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6129  	cur = 0;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6130  	while (cur < end) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6131  		map.m_lblk = cur;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6132  		map.m_len = end - cur;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6133  		ret = ext4_map_blocks(NULL, inode, &map, 0);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6134  		if (ret < 0)
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6135  			break;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6136  		if (ret > 0) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6137  			path = ext4_find_extent(inode, map.m_lblk, NULL, 0);
b2e662cb86ca9f Li Zetao           2024-08-20  6138  			if (!IS_ERR(path)) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6139  				for (j = 0; j < path->p_depth; j++) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6140  					ext4_mb_mark_bb(inode->i_sb,
d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6141  							path[j].p_block, 1, false);
599ea31d13617c Xin Yin            2022-01-10  6142  					ext4_fc_record_regions(inode->i_sb, inode->i_ino,
599ea31d13617c Xin Yin            2022-01-10  6143  							0, path[j].p_block, 1, 1);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6144  				}
7ff5fddaddf2cc Ye Bin             2022-09-24  6145  				ext4_free_ext_path(path);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6146  			}
d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6147  			ext4_mb_mark_bb(inode->i_sb, map.m_pblk, map.m_len, false);
599ea31d13617c Xin Yin            2022-01-10  6148  			ext4_fc_record_regions(inode->i_sb, inode->i_ino,
599ea31d13617c Xin Yin            2022-01-10  6149  					map.m_lblk, map.m_pblk, map.m_len, 1);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6150  		}
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6151  		cur = cur + map.m_len;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6152  	}
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6153  
92bbb922166cd7 Baokun Li          2024-08-22  6154  out:
92bbb922166cd7 Baokun Li          2024-08-22 @6155  	ext4_free_ext_path(path);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
