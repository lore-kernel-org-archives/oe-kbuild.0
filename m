Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577A1798F
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVsZek+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699267331; x=1730803331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0yAGOfAB94YAoeuWBRwkviNdhBXDZFDC7uUs2I7Tpw=;
  b=bVsZek+L6hRhuLLZnvI7VTOIsjYUbX/+E+pkmfMRRI2UkAHGXkrnPixr
   PH4BNIFylhYq5pRJr8grHLFqgElK7wpy90JdUuaUgxeaImYU9QjIFU0NE
   ufjNidZvb0XkVrDQeQysTGuMU8ts8ugTNGEWIlCBswvp7R3wNSLkmDBr5
   k4lW8kdbJyQSQYEcc61iaZZf5NSTmbOaUNSl4illlyswYhyz7oXtRdjN4
   8ZifNlXV5tTJJmxd+pzImUUdPOK/mqmmxEkLJf5yABveJk94PCe73FMGO
   b9ZYE9KkehHG/Vo0JbVVWnwD/MSolE5tGSoIcvKkLEKUlzxhbja0BKx4n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369456186"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369456186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797266444"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797266444"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2023 02:42:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzx3T-0006LE-37;
	Mon, 06 Nov 2023 10:42:03 +0000
Date: Mon, 6 Nov 2023 18:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 870/30000] fs/ext4/namei.c:3245
 ext4_rmdir() error: uninitialized symbol 'lblk'.
Message-ID: <202311061816.2qkXzfnp-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: 705a3e5b1852b2724218f3775696b13ef10d910d [870/30000] ANDROID: ext4: Handle casefolding with encryption
:::::: branch date: 3 days ago
:::::: commit date: 3 years, 4 months ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061816.2qkXzfnp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061816.2qkXzfnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061816.2qkXzfnp-lkp@intel.com/

New smatch warnings:
fs/ext4/namei.c:3245 ext4_rmdir() error: uninitialized symbol 'lblk'.
fs/ext4/namei.c:3689 ext4_find_delete_entry() error: uninitialized symbol 'lblk'.

Old smatch warnings:
fs/ext4/namei.c:1772 ext4_lookup() error: potentially dereferencing uninitialized 'de'.
fs/ext4/namei.c:1827 ext4_get_parent() error: potentially dereferencing uninitialized 'de'.
fs/ext4/namei.c:3227 ext4_rmdir() error: potentially dereferencing uninitialized 'de'.
fs/ext4/namei.c:3318 ext4_unlink() error: potentially dereferencing uninitialized 'de'.
fs/ext4/namei.c:3332 ext4_unlink() error: uninitialized symbol 'lblk'.
fs/ext4/namei.c:3689 ext4_find_delete_entry() error: uninitialized symbol 'de'.

vim +/lblk +3245 fs/ext4/namei.c

ac27a0ec112a08 Dave Kleikamp      2006-10-11  3194  
617ba13b31fbf5 Mingming Cao       2006-10-11  3195  static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3196  {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3197  	int retval;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3198  	struct inode *inode;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3199  	struct buffer_head *bh;
617ba13b31fbf5 Mingming Cao       2006-10-11  3200  	struct ext4_dir_entry_2 *de;
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3201  	handle_t *handle = NULL;
705a3e5b1852b2 Daniel Rosenberg   2019-10-07  3202  	ext4_lblk_t lblk;
705a3e5b1852b2 Daniel Rosenberg   2019-10-07  3203  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3204  
0db1ff222d40f1 Theodore Ts'o      2017-02-05  3205  	if (unlikely(ext4_forced_shutdown(EXT4_SB(dir->i_sb))))
0db1ff222d40f1 Theodore Ts'o      2017-02-05  3206  		return -EIO;
0db1ff222d40f1 Theodore Ts'o      2017-02-05  3207  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3208  	/* Initialize quotas before so that eventual writes go in
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3209  	 * separate transaction */
a7cdadee0e8948 Jan Kara           2015-06-29  3210  	retval = dquot_initialize(dir);
a7cdadee0e8948 Jan Kara           2015-06-29  3211  	if (retval)
a7cdadee0e8948 Jan Kara           2015-06-29  3212  		return retval;
a7cdadee0e8948 Jan Kara           2015-06-29  3213  	retval = dquot_initialize(d_inode(dentry));
a7cdadee0e8948 Jan Kara           2015-06-29  3214  	if (retval)
a7cdadee0e8948 Jan Kara           2015-06-29  3215  		return retval;
907f4554e2521c Christoph Hellwig  2010-03-03  3216  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3217  	retval = -ENOENT;
705a3e5b1852b2 Daniel Rosenberg   2019-10-07  3218  	bh = ext4_find_entry(dir, &dentry->d_name, &de, NULL, &lblk);
36de928641ee48 Theodore Ts'o      2014-08-23  3219  	if (IS_ERR(bh))
36de928641ee48 Theodore Ts'o      2014-08-23  3220  		return PTR_ERR(bh);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3221  	if (!bh)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3222  		goto end_rmdir;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3223  
2b0143b5c986be David Howells      2015-03-17  3224  	inode = d_inode(dentry);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3225  
6a797d27378389 Darrick J. Wong    2015-10-17  3226  	retval = -EFSCORRUPTED;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3227  	if (le32_to_cpu(de->inode) != inode->i_ino)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3228  		goto end_rmdir;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3229  
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3230  	retval = -ENOTEMPTY;
e875a2ddba06ff Michael Halcrow    2015-04-11  3231  	if (!ext4_empty_dir(inode))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3232  		goto end_rmdir;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3233  
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3234  	handle = ext4_journal_start(dir, EXT4_HT_DIR,
64044abf05d084 Theodore Ts'o      2013-02-09  3235  				    EXT4_DATA_TRANS_BLOCKS(dir->i_sb));
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3236  	if (IS_ERR(handle)) {
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3237  		retval = PTR_ERR(handle);
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3238  		handle = NULL;
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3239  		goto end_rmdir;
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3240  	}
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3241  
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3242  	if (IS_DIRSYNC(dir))
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3243  		ext4_handle_sync(handle);
8dcfaad244cdfa Theodore Ts'o      2013-02-09  3244  
705a3e5b1852b2 Daniel Rosenberg   2019-10-07 @3245  	retval = ext4_delete_entry(handle, dir, de, lblk, bh);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3246  	if (retval)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3247  		goto end_rmdir;
f8628a14a27eb4 Andreas Dilger     2007-07-18  3248  	if (!EXT4_DIR_LINK_EMPTY(inode))
b03a2f7eb21cc0 Andreas Dilger     2015-06-15  3249  		ext4_warning_inode(inode,
b03a2f7eb21cc0 Andreas Dilger     2015-06-15  3250  			     "empty directory '%.*s' has too many links (%u)",
b03a2f7eb21cc0 Andreas Dilger     2015-06-15  3251  			     dentry->d_name.len, dentry->d_name.name,
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3252  			     inode->i_nlink);
ee73f9a52a3437 Jeff Layton        2018-01-09  3253  	inode_inc_iversion(inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3254  	clear_nlink(inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3255  	/* There's no need to set i_disksize: the fact that i_nlink is
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3256  	 * zero will ensure that the right thing happens during any
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3257  	 * recovery. */
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3258  	inode->i_size = 0;
617ba13b31fbf5 Mingming Cao       2006-10-11  3259  	ext4_orphan_add(handle, inode);
eeca7ea1baa939 Deepa Dinamani     2016-11-14  3260  	inode->i_ctime = dir->i_ctime = dir->i_mtime = current_time(inode);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3261  	retval = ext4_mark_inode_dirty(handle, inode);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3262  	if (retval)
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3263  		goto end_rmdir;
f8628a14a27eb4 Andreas Dilger     2007-07-18  3264  	ext4_dec_count(handle, dir);
617ba13b31fbf5 Mingming Cao       2006-10-11  3265  	ext4_update_dx_flag(dir);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  3266  	retval = ext4_mark_inode_dirty(handle, dir);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  3267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
