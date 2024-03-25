Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22A6E5E1
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Mar 2024 23:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711410034; cv=none; b=dh/1QN5TNTHV3FeusHWZcnBuDQ6sBtijchk81y0ZVCVXmFHuics9WvDjIoFLA5EQmhrk7qQq1J/JE+uuXPQhkmYJR0kWZc3snb0eh1I+OcZ6mFddBLjVRbZO6pUIev9p2NpYQYHiDACZoza6NOVZG/LB3KgTXuEnltnwIXud2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711410034; c=relaxed/simple;
	bh=cXlTV0rFOMvCRUjpFHdUpT4kKiHj4LC6bbvVSIJABl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tx/9ncH5tolRatNXBGLgL9aNL1r/KZtAxmTGEKQEbBIm7SgJdkUlxSuijBEzRKwtn1v+jq7/ESSpsL7bicbDjz9pHgH7AakYVpklEgqNIdOxBoJSzB8Ihc4toXN/ysma6gkqzbop1MzZuu7MrVFAdiVj/ScBdqgfwQTxZZBeocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCvzVeI+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCvzVeI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711410032; x=1742946032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXlTV0rFOMvCRUjpFHdUpT4kKiHj4LC6bbvVSIJABl8=;
  b=FCvzVeI+ovJ2LxY/cXQkMB3/aR9Xh/MhV3/Z56N65z1w4D3tEyja+dQE
   Z7A42Lc70hu9yYQQMPyvwzc9PMlgtZFC2MTnkHKRvNC6Te12l0mQ9xBZ2
   IGmwrldcqwu1BcngqcxwstGhqu6zJvvGnk8rr66egI7ikqPd38TsEcHZa
   F1q4ApnWDqfgWwfufm7uiM8e6OhWmX/097PNIQUTDTsS4l58XyopU+wC/
   VDSXsjhM+BzGXEPdZqzVa33Lao9uVp/8Br25oBbuM2SvWy9aKrfiAE/k2
   /cl4MmYL5lO+QW7PJYKKExkn2jrIEn55xsR++z125U9Q7vtWXIO829lrU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6309009"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6309009"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 16:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="16209067"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2024 16:40:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rotvY-000Mui-10;
	Mon, 25 Mar 2024 23:40:28 +0000
Date: Tue, 26 Mar 2024 07:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chao:wip 7/9] fs/f2fs/data.c:2590 f2fs_should_update_outplace()
 error: we previously assumed 'fio' could be null (see line 2581)
Message-ID: <202403260735.dL4awPJc-lkp@intel.com>
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
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   ffa2225cad631419f3944c962518291a7df50367
commit: aac0576c96c228281b5db26528047da6a585fe84 [7/9] f2fs: zone: allow IPU in regular block device
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r081-20240325 (https://download.01.org/0day-ci/archive/20240326/202403260735.dL4awPJc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403260735.dL4awPJc-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:2590 f2fs_should_update_outplace() error: we previously assumed 'fio' could be null (see line 2581)

Old smatch warnings:
fs/f2fs/data.c:276 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:281 f2fs_post_read_work() warn: bitwise AND condition is false here
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +/fio +2590 fs/f2fs/data.c

bb9e3bb8dbf597 Chao Yu          2018-01-17  2573  
4d57b86dd86404 Chao Yu          2018-05-30  2574  bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
bb9e3bb8dbf597 Chao Yu          2018-01-17  2575  {
bb9e3bb8dbf597 Chao Yu          2018-01-17  2576  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
bb9e3bb8dbf597 Chao Yu          2018-01-17  2577  
19bdba5265624b Jaegeuk Kim      2021-12-09  2578  	/* The below cases were checked when setting it. */
19bdba5265624b Jaegeuk Kim      2021-12-09  2579  	if (f2fs_is_pinned_file(inode))
19bdba5265624b Jaegeuk Kim      2021-12-09  2580  		return false;
19bdba5265624b Jaegeuk Kim      2021-12-09 @2581  	if (fio && is_sbi_flag_set(sbi, SBI_NEED_FSCK))
19bdba5265624b Jaegeuk Kim      2021-12-09  2582  		return true;
aac0576c96c228 Chao Yu          2024-03-23  2583  	if (f2fs_lfs_mode(sbi)) {
aac0576c96c228 Chao Yu          2024-03-23  2584  		if (!f2fs_sb_has_blkzoned(sbi))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2585  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2586  		/* no regular block device in mainarea */
aac0576c96c228 Chao Yu          2024-03-23  2587  		if (!sbi->first_zoned_segno)
aac0576c96c228 Chao Yu          2024-03-23  2588  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2589  		/* blkaddr locates in sequential zone */
aac0576c96c228 Chao Yu          2024-03-23 @2590  		if (GET_SEGNO(sbi, fio->old_blkaddr) >= sbi->first_zoned_segno)
aac0576c96c228 Chao Yu          2024-03-23  2591  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2592  	}
bb9e3bb8dbf597 Chao Yu          2018-01-17  2593  	if (S_ISDIR(inode->i_mode))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2594  		return true;
af033b2aa8a874 Chao Yu          2018-09-20  2595  	if (IS_NOQUOTA(inode))
af033b2aa8a874 Chao Yu          2018-09-20  2596  		return true;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2597  	if (f2fs_is_atomic_file(inode))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2598  		return true;
943f7c6f987f4a Chao Yu          2023-09-04  2599  	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
943f7c6f987f4a Chao Yu          2023-09-04  2600  	if (f2fs_compressed_file(inode) &&
943f7c6f987f4a Chao Yu          2023-09-04  2601  		F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER &&
943f7c6f987f4a Chao Yu          2023-09-04  2602  		is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
943f7c6f987f4a Chao Yu          2023-09-04  2603  		return true;
859fca6b706e00 Chao Yu          2021-05-26  2604  
859fca6b706e00 Chao Yu          2021-05-26  2605  	/* swap file is migrating in aligned write mode */
859fca6b706e00 Chao Yu          2021-05-26  2606  	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
859fca6b706e00 Chao Yu          2021-05-26  2607  		return true;
859fca6b706e00 Chao Yu          2021-05-26  2608  
1018a5463a0637 Chao Yu          2022-02-04  2609  	if (is_inode_flag_set(inode, FI_OPU_WRITE))
1018a5463a0637 Chao Yu          2022-02-04  2610  		return true;
1018a5463a0637 Chao Yu          2022-02-04  2611  
bb9e3bb8dbf597 Chao Yu          2018-01-17  2612  	if (fio) {
b763f3bedc2da2 Chao Yu          2021-04-28  2613  		if (page_private_gcing(fio->page))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2614  			return true;
4354994f097d06 Daniel Rosenberg 2018-08-20  2615  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
4354994f097d06 Daniel Rosenberg 2018-08-20  2616  			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
4354994f097d06 Daniel Rosenberg 2018-08-20  2617  			return true;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2618  	}
bb9e3bb8dbf597 Chao Yu          2018-01-17  2619  	return false;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2620  }
bb9e3bb8dbf597 Chao Yu          2018-01-17  2621  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
