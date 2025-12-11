Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E526D4CA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 03:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423715; cv=none; b=eyDWf/avAM4y3OIasIpUu4UMEOVnelIVAZYUBXxNoDv3SDZbA1WusHKZNNEZUWwgekoYS8UuJHHXo+QiBFGQL63T2KzGfshDmx0zYsfP1Wj4Zd9dOtlLHN4jK+/DF5uF1ymfwqiPjDE4IYFdTXnnI1a+lcIfb7/3Ylq8J/lD1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423715; c=relaxed/simple;
	bh=xep9iQZBC0l+mG0gKYGV8AjwYPp8GGGg+6OB6xrO7Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgMmqoALN1p6Bq0q6UwwlndywHlKWeLNUunSzVboySfQu+cNjwGP0sbYIeCkiqVfsQG9XYj72lwYAZNI7mzWAtRlwzWhALIAJxX7Mmg1zVwpTzDKZm2r9Bs5Yd0bsO9Aeg3BvEk8B0d2rsBSA1c6tTNOIR1VQnN79McQSJtufT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux5+vIMg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux5+vIMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765423714; x=1796959714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xep9iQZBC0l+mG0gKYGV8AjwYPp8GGGg+6OB6xrO7Vg=;
  b=Ux5+vIMggDqsGRiE3Qguhkm7KOQuP37jssWypr1SguagxVGk+XjVtFN0
   2E30JHIKlTSFR/lOK/VqLB+mi243BRx2kWgm2UHPv3NMV17ERO1NQdPk2
   8lyOBzTMzNi31s+LDDVTS0mA8Ij8bN4C25Qkw2SjW0a5nQhFdi53mWmQL
   5f6fpKGmbBfCmPYrtGk6loT0jhSXmAnxJxdsVj62rE7+dJddbV2YvFRE9
   8x1UptsUrGBJ7wDQAP4/ebK368FeDIsIQiLSEL3o9AxRRBTZ+Opj5IBa7
   SvhMbhTD9edSDyHGI/isRDhFZXli4gZdlC3k1s+axLCzQ4xVI9A2twtKK
   g==;
X-CSE-ConnectionGUID: ggGVyGGSRJ2CuCaMViFaug==
X-CSE-MsgGUID: 2bF9eLHzRouC4pjnSJu99A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67288682"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67288682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:28:31 -0800
X-CSE-ConnectionGUID: JqppiX+cTeKXlxTl6JUbPA==
X-CSE-MsgGUID: 6YqkhqFoSiiQ4Tl6Qf0qmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234104607"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 19:28:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXLw-0000000046U-000D;
	Thu, 11 Dec 2025 03:28:28 +0000
Date: Thu, 11 Dec 2025 11:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/namei.c:3069 ext4_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202512111116.damhAKtO-lkp@intel.com>
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
head:   0723a166d1f1da4c60d7b11289383f073e4dee9b
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111116.damhAKtO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111116.damhAKtO-lkp@intel.com/

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
