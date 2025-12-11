Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DB1E9B12
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 23:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494536; cv=none; b=sdu6NGOBv61BG4y2x3aMH9GtaB4YTeCUz2t5yoD3rAKzbaG3ERe/oJNpRaoGvcUjV1n7mZVtVrH/euWBlC2EmR44Bw4KEJ42yW+MAzSvxk4Q9Zhh3GeDfzFPtFahfhrxnkCYEjwUz5YHsyiG6WNN+yRmY5HsXAkwEF/+EI/g6pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494536; c=relaxed/simple;
	bh=L2RrOK9pADVClk2qgkAn6M9xWf9o62logeRlpLjdk+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfU0xekd+MpzVIG1y6vdYDkgBEYzo3Pt6M4ffmc4C0UcDcOSu9hdWpV+f8HRn6u37blvo2mLxYpu+Xa1NskwEG6G3Gz6WATsJZT98uSYR2ryYB0cEYGJzQcfQPdIUgZYWunJqqP7G5+zux+66zpRD34zFZ54E+DcwWIWXA6n1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atroZL88; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atroZL88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765494534; x=1797030534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2RrOK9pADVClk2qgkAn6M9xWf9o62logeRlpLjdk+0=;
  b=atroZL88OXIzN8rQC+8ykMCanbpXiWvdHgUyZguVqF4yjRbp1qT5Pzh2
   3kznPzjWnUkkzddvfNo3R0FHLILvcQrJkDnIcU9rHTC4wmd34+zmcTLoy
   CIhFZ+C6ODngpL9tWD5e00ab5+CT0gjqDnblNmN8cZ8Aqc7MIjP3Nm8oq
   a4QEb9+9xlnnxkB4OjsXGfaAR+EU68g93DbhBCbqR17g0SAgYP1JDeIBn
   fb4yfvouW7O9gc8+46KifGKJ1x5WhSJ2tx/Ms1LduZlozmOUvvScxASpa
   jTcOPzA1xOTGVlJLkykeT61k/zTOc8WbLVAWnMhL7N1XwIUu/enasIOop
   Q==;
X-CSE-ConnectionGUID: tHS7iLqEQVGxEQVSl7+GhQ==
X-CSE-MsgGUID: 2tThD9YxTteVK5bWqXLhPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78193056"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78193056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:08:53 -0800
X-CSE-ConnectionGUID: 3MBZIUHfT12YnAdJGpSPSg==
X-CSE-MsgGUID: Lvdn/ewEQWSIH4JLiBiMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196913992"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 15:08:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpmE-000000005B7-1Tb7;
	Thu, 11 Dec 2025 23:08:50 +0000
Date: Fri, 12 Dec 2025 07:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/namei.c:3069 ext4_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202512120612.rGBUXbhF-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120612.rGBUXbhF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120612.rGBUXbhF-lkp@intel.com/

New smatch warnings:
fs/ext4/namei.c:3069 ext4_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/ext4/namei.c:1802 ext4_lookup() error: uninitialized symbol 'de'.
fs/ext4/namei.c:1855 ext4_get_parent() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3176 ext4_rmdir() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3256 __ext4_unlink() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3708 ext4_find_delete_entry() error: uninitialized symbol 'de'.

vim +/ERR_PTR +3069 fs/ext4/namei.c

a774f9c20e0864 Tao Ma             2012-12-10  3006  
88d5baf69082e5 NeilBrown          2025-02-27  3007  static struct dentry *ext4_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner  2021-01-21  3008  				 struct dentry *dentry, umode_t mode)
a774f9c20e0864 Tao Ma             2012-12-10  3009  {
a774f9c20e0864 Tao Ma             2012-12-10  3010  	handle_t *handle;
a774f9c20e0864 Tao Ma             2012-12-10  3011  	struct inode *inode;
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3012  	int err, err2 = 0, credits, retries = 0;
a774f9c20e0864 Tao Ma             2012-12-10  3013  
f8628a14a27eb4 Andreas Dilger     2007-07-18  3014  	if (EXT4_DIR_LINK_MAX(dir))
88d5baf69082e5 NeilBrown          2025-02-27  3015  		return ERR_PTR(-EMLINK);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3016  
a7cdadee0e8948 Jan Kara           2015-06-29  3017  	err = dquot_initialize(dir);
a7cdadee0e8948 Jan Kara           2015-06-29  3018  	if (err)
88d5baf69082e5 NeilBrown          2025-02-27  3019  		return ERR_PTR(err);
907f4554e2521c Christoph Hellwig  2010-03-03  3020  
1139575a927010 Theodore Ts'o      2013-02-09  3021  	credits = (EXT4_DATA_TRANS_BLOCKS(dir->i_sb) +
eb9cc7e16b32c8 Jan Kara           2013-04-19  3022  		   EXT4_INDEX_EXTRA_TRANS_BLOCKS + 3);
1139575a927010 Theodore Ts'o      2013-02-09  3023  retry:
f2d40141d5d90b Christian Brauner  2023-01-13  3024  	inode = ext4_new_inode_start_handle(idmap, dir, S_IFDIR | mode,
1139575a927010 Theodore Ts'o      2013-02-09  3025  					    &dentry->d_name,
1139575a927010 Theodore Ts'o      2013-02-09  3026  					    0, NULL, EXT4_HT_DIR, credits);
1139575a927010 Theodore Ts'o      2013-02-09  3027  	handle = ext4_journal_current_handle();
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3028  	err = PTR_ERR(inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3029  	if (IS_ERR(inode))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3030  		goto out_stop;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3031  
617ba13b31fbf5 Mingming Cao       2006-10-11  3032  	inode->i_op = &ext4_dir_inode_operations;
617ba13b31fbf5 Mingming Cao       2006-10-11  3033  	inode->i_fop = &ext4_dir_operations;
a774f9c20e0864 Tao Ma             2012-12-10  3034  	err = ext4_init_new_dir(handle, dir, inode);
dabd991f9d8e32 Namhyung Kim       2011-01-10  3035  	if (err)
dabd991f9d8e32 Namhyung Kim       2011-01-10  3036  		goto out_clear_inode;
dabd991f9d8e32 Namhyung Kim       2011-01-10  3037  	err = ext4_mark_inode_dirty(handle, inode);
dabd991f9d8e32 Namhyung Kim       2011-01-10  3038  	if (!err)
617ba13b31fbf5 Mingming Cao       2006-10-11  3039  		err = ext4_add_entry(handle, dentry, inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3040  	if (err) {
4cdeed861b5f79 Aneesh Kumar K.V   2008-02-22  3041  out_clear_inode:
4cdeed861b5f79 Aneesh Kumar K.V   2008-02-22  3042  		clear_nlink(inode);
9b88f9fb0d2fc8 Jan Kara           2019-11-05  3043  		ext4_orphan_add(handle, inode);
6b38e842bb832a Al Viro            2008-12-30  3044  		unlock_new_inode(inode);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3045  		err2 = ext4_mark_inode_dirty(handle, inode);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3046  		if (unlikely(err2))
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3047  			err = err2;
9b88f9fb0d2fc8 Jan Kara           2019-11-05  3048  		ext4_journal_stop(handle);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3049  		iput(inode);
9b88f9fb0d2fc8 Jan Kara           2019-11-05  3050  		goto out_retry;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3051  	}
15ed2851b0f42d Nikolay Borisov    2020-08-26  3052  	ext4_inc_count(dir);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  3053  
617ba13b31fbf5 Mingming Cao       2006-10-11  3054  	ext4_update_dx_flag(dir);
dabd991f9d8e32 Namhyung Kim       2011-01-10  3055  	err = ext4_mark_inode_dirty(handle, dir);
dabd991f9d8e32 Namhyung Kim       2011-01-10  3056  	if (err)
dabd991f9d8e32 Namhyung Kim       2011-01-10  3057  		goto out_clear_inode;
1e2e547a93a00e Al Viro            2018-05-04  3058  	d_instantiate_new(dentry, inode);
a80f7fcf18672a Harshad Shirwadkar 2020-11-05  3059  	ext4_fc_track_create(handle, dentry);
1139575a927010 Theodore Ts'o      2013-02-09  3060  	if (IS_DIRSYNC(dir))
1139575a927010 Theodore Ts'o      2013-02-09  3061  		ext4_handle_sync(handle);
1139575a927010 Theodore Ts'o      2013-02-09  3062  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3063  out_stop:
1139575a927010 Theodore Ts'o      2013-02-09  3064  	if (handle)
617ba13b31fbf5 Mingming Cao       2006-10-11  3065  		ext4_journal_stop(handle);
9b88f9fb0d2fc8 Jan Kara           2019-11-05  3066  out_retry:
617ba13b31fbf5 Mingming Cao       2006-10-11  3067  	if (err == -ENOSPC && ext4_should_retry_alloc(dir->i_sb, &retries))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3068  		goto retry;
88d5baf69082e5 NeilBrown          2025-02-27 @3069  	return ERR_PTR(err);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3070  }
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3071  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
