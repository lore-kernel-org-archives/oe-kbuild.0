Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12E345EA2
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429150; cv=none; b=jhz6v+urEwP5RMA+Jpx+8tqKj1uj1y8jOuehV44XvG2Berdrb/M1jmNi5qBGoA2/J1b+4OrE2zi6qJCb3nqgCkewpfQ22XHjz1VgNiNElaYWTutGnplZssqyrzdz8mmpN3+oEfeoFJLQaBBznyB/HNMRL7vHoVYhyAUrxxLh6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429150; c=relaxed/simple;
	bh=xd/FG9Iq+Uwnn9jzGDXiKD2FVyPTeKQjZuINdAybeXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RTtKekw6OWjkssVsxHz9+bEE0+M4RQi993D3VofNWSqsrs2PoVu0yq2jnlnXqMz3+jNuuOGwrAECFZrC7/ZMOHQSTtPXdY4sWRJFbun6FQ7B1eeRLqO4cYwrDIhiGwnBYnIRv2NviZQT7TTEV52aHfvvW0N3zgVY71CjMrLLYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3n3rubq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3n3rubq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788429148; x=1819965148;
  h=date:from:to:cc:subject:message-id;
  bh=xd/FG9Iq+Uwnn9jzGDXiKD2FVyPTeKQjZuINdAybeXY=;
  b=B3n3rubqYr/XO+HwvSvVNGwX1KIX7k5ILaFuQkCB9LOJV8vtGz3/lLbb
   cdAAXlrkdIJMLQObjGQr1xj3ScRTvyy80ABSv/WU1jutR8khjn5JWXRyJ
   PeWRDh9tQhVm7luI9FUUE9gocTozCO88ihe1y5pf72jTVf5QeGFDFjGKw
   RtFDg2pWGO744ZhVilhzbtqtjldR70KGgO5wknAt/0KtIQoR5CwW9C3qh
   Ko/hlOz6LJ+l1cuQv/8D0V42DlluBSLI3OhWJbOG6bf0UvLwS6pV6vKou
   JNgcn+zJkk/wyeJS9EY5WAZtKxKAMxyKsmECu8iRdP4uQjlltWXAcRRsx
   Q==;
X-CSE-ConnectionGUID: HN6B5k6SS8KK7jPHkAup0A==
X-CSE-MsgGUID: gttt43qkQWW5ZnJOc4aZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76461287"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="76461287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 02:52:28 -0700
X-CSE-ConnectionGUID: 6Z/X/szVRHW19ScuniY3Iw==
X-CSE-MsgGUID: IrvL+X2CT7eycAPkmBe4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="266433228"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2026 02:52:26 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x247M-000000004ag-0Esf;
	Thu, 03 Sep 2026 09:52:24 +0000
Date: Thu, 03 Sep 2026 17:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2657/3131] fs/ext2/super.c:1149:3:
 warning: calling function 'ext2_rsv_window_add' requires holding spinlock
 'EXT2_SB(sb).s_rsv_window_lock' exclusively
Message-ID: <202609031718.nHHkJ5KA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Timothy Day <timday@thelustrecollective.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: a3cf61f60051ca8874f012fa8569fa971fbfbee0 [2657/3131] ext2: enable context analysis support for ext2 filesystem
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031718.nHHkJ5KA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ed1626b9d0eaf7c406f44da5fb595ad94559f54b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031718.nHHkJ5KA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609031718.nHHkJ5KA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/super.c:1149:3: warning: calling function 'ext2_rsv_window_add' requires holding spinlock 'EXT2_SB(sb).s_rsv_window_lock' exclusively [-Wthread-safety-precise]
    1149 |                 ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
         |                 ^
   fs/ext2/super.c:1149:3: note: found near match '_res->s_rsv_window_lock'
   1 warning generated.


vim +1149 fs/ext2/super.c

eab61d3260d76b Eric Sandeen      2025-02-23   866  
eab61d3260d76b Eric Sandeen      2025-02-23   867  static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds    2005-04-16   868  {
eab61d3260d76b Eric Sandeen      2025-02-23   869  	struct ext2_fs_context *ctx = fc->fs_private;
eab61d3260d76b Eric Sandeen      2025-02-23   870  	int silent = fc->sb_flags & SB_SILENT;
^1da177e4c3f41 Linus Torvalds    2005-04-16   871  	struct buffer_head * bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16   872  	struct ext2_sb_info * sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   873  	struct ext2_super_block * es;
^1da177e4c3f41 Linus Torvalds    2005-04-16   874  	struct inode *root;
^1da177e4c3f41 Linus Torvalds    2005-04-16   875  	unsigned long block;
eab61d3260d76b Eric Sandeen      2025-02-23   876  	unsigned long sb_block = ctx->s_sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   877  	unsigned long logic_sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   878  	unsigned long offset = 0;
d09099051057bb Chengguang Xu     2018-02-26   879  	long ret = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16   880  	int blocksize = BLOCK_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16   881  	int db_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16   882  	int i, j;
^1da177e4c3f41 Linus Torvalds    2005-04-16   883  	__le32 features;
833f4077bf7c2d Peter Zijlstra    2007-10-16   884  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16   885  
bf4afc53b77aea Linus Torvalds    2026-02-21   886  	sbi = kzalloc_obj(*sbi);
^1da177e4c3f41 Linus Torvalds    2005-04-16   887  	if (!sbi)
cea845cdef4f50 Christoph Hellwig 2021-11-29   888  		return -ENOMEM;
18a82eb9f980b5 Pekka J Enberg    2009-01-07   889  
18a82eb9f980b5 Pekka J Enberg    2009-01-07   890  	sbi->s_blockgroup_lock =
bf4afc53b77aea Linus Torvalds    2026-02-21   891  		kzalloc_obj(struct blockgroup_lock);
18a82eb9f980b5 Pekka J Enberg    2009-01-07   892  	if (!sbi->s_blockgroup_lock) {
18a82eb9f980b5 Pekka J Enberg    2009-01-07   893  		kfree(sbi);
cea845cdef4f50 Christoph Hellwig 2021-11-29   894  		return -ENOMEM;
18a82eb9f980b5 Pekka J Enberg    2009-01-07   895  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   896  	sb->s_fs_info = sbi;
93d44cb275f3eb Miklos Szeredi    2007-10-16   897  	sbi->s_sb_block = sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   898  
023051c2d0f1d7 Timothy Day       2026-08-11   899  	guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
d09099051057bb Chengguang Xu     2018-02-26   900  	ret = -EINVAL;
c15271f4e74cd6 Jan Blunck        2010-04-14   901  
^1da177e4c3f41 Linus Torvalds    2005-04-16   902  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   903  	 * See what the current blocksize for the device is, and
^1da177e4c3f41 Linus Torvalds    2005-04-16   904  	 * use that as the blocksize.  Otherwise (or if the blocksize
^1da177e4c3f41 Linus Torvalds    2005-04-16   905  	 * is smaller than the default) use the default.
^1da177e4c3f41 Linus Torvalds    2005-04-16   906  	 * This is important for devices that have a hardware
^1da177e4c3f41 Linus Torvalds    2005-04-16   907  	 * sectorsize that is larger than the default.
^1da177e4c3f41 Linus Torvalds    2005-04-16   908  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   909  	blocksize = sb_min_blocksize(sb, BLOCK_SIZE);
^1da177e4c3f41 Linus Torvalds    2005-04-16   910  	if (!blocksize) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   911  		ext2_msg(sb, KERN_ERR, "error: unable to set blocksize");
^1da177e4c3f41 Linus Torvalds    2005-04-16   912  		goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   913  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   914  
^1da177e4c3f41 Linus Torvalds    2005-04-16   915  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   916  	 * If the superblock doesn't start on a hardware sector boundary,
^1da177e4c3f41 Linus Torvalds    2005-04-16   917  	 * calculate the offset.  
^1da177e4c3f41 Linus Torvalds    2005-04-16   918  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   919  	if (blocksize != BLOCK_SIZE) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   920  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   921  		offset = (sb_block*BLOCK_SIZE) % blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   922  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16   923  		logic_sb_block = sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   924  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   925  
^1da177e4c3f41 Linus Torvalds    2005-04-16   926  	if (!(bh = sb_bread(sb, logic_sb_block))) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   927  		ext2_msg(sb, KERN_ERR, "error: unable to read superblock");
^1da177e4c3f41 Linus Torvalds    2005-04-16   928  		goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   929  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   930  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   931  	 * Note: s_es must be initialized as soon as possible because
^1da177e4c3f41 Linus Torvalds    2005-04-16   932  	 *       some ext2 macro-instructions depend on its value
^1da177e4c3f41 Linus Torvalds    2005-04-16   933  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   934  	es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
^1da177e4c3f41 Linus Torvalds    2005-04-16   935  	sbi->s_es = es;
^1da177e4c3f41 Linus Torvalds    2005-04-16   936  	sb->s_magic = le16_to_cpu(es->s_magic);
^1da177e4c3f41 Linus Torvalds    2005-04-16   937  
^1da177e4c3f41 Linus Torvalds    2005-04-16   938  	if (sb->s_magic != EXT2_SUPER_MAGIC)
^1da177e4c3f41 Linus Torvalds    2005-04-16   939  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16   940  
eab61d3260d76b Eric Sandeen      2025-02-23   941  	ext2_set_options(fc, sbi);
088519572ca8bd Jan Kara          2017-10-09   942  
1751e8a6cb935e Linus Torvalds    2017-11-27   943  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
38fa0e8e4a3b93 Chengguang Xu     2019-05-20   944  		(test_opt(sb, POSIX_ACL) ? SB_POSIXACL : 0);
46b15caa7cb19b Tejun Heo         2015-06-16   945  	sb->s_iflags |= SB_I_CGROUPWB;
^1da177e4c3f41 Linus Torvalds    2005-04-16   946  
^1da177e4c3f41 Linus Torvalds    2005-04-16   947  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
^1da177e4c3f41 Linus Torvalds    2005-04-16   948  	    (EXT2_HAS_COMPAT_FEATURE(sb, ~0U) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16   949  	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16   950  	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
2314b07cb47ef7 Oleksij Rempel    2009-11-19   951  		ext2_msg(sb, KERN_WARNING,
2314b07cb47ef7 Oleksij Rempel    2009-11-19   952  			"warning: feature flags set on rev 0 fs, "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   953  			"running e2fsck is recommended");
^1da177e4c3f41 Linus Torvalds    2005-04-16   954  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   955  	 * Check feature flags regardless of the revision level, since we
^1da177e4c3f41 Linus Torvalds    2005-04-16   956  	 * previously didn't change the revision level when setting the flags,
^1da177e4c3f41 Linus Torvalds    2005-04-16   957  	 * so there is a chance incompat flags are set on a rev 0 filesystem.
^1da177e4c3f41 Linus Torvalds    2005-04-16   958  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   959  	features = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP);
^1da177e4c3f41 Linus Torvalds    2005-04-16   960  	if (features) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   961  		ext2_msg(sb, KERN_ERR,	"error: couldn't mount because of "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   962  		       "unsupported optional features (%x)",
2314b07cb47ef7 Oleksij Rempel    2009-11-19   963  			le32_to_cpu(features));
^1da177e4c3f41 Linus Torvalds    2005-04-16   964  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16   965  	}
bc98a42c1f7d0f David Howells     2017-07-17   966  	if (!sb_rdonly(sb) && (features = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
2314b07cb47ef7 Oleksij Rempel    2009-11-19   967  		ext2_msg(sb, KERN_ERR, "error: couldn't mount RDWR because of "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   968  		       "unsupported optional features (%x)",
2314b07cb47ef7 Oleksij Rempel    2009-11-19   969  		       le32_to_cpu(features));
^1da177e4c3f41 Linus Torvalds    2005-04-16   970  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16   971  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   972  
62aeb94433fcec Jan Kara          2023-03-01   973  	if (le32_to_cpu(es->s_log_block_size) >
62aeb94433fcec Jan Kara          2023-03-01   974  	    (EXT2_MAX_BLOCK_LOG_SIZE - BLOCK_SIZE_BITS)) {
62aeb94433fcec Jan Kara          2023-03-01   975  		ext2_msg(sb, KERN_ERR,
62aeb94433fcec Jan Kara          2023-03-01   976  			 "Invalid log block size: %u",
62aeb94433fcec Jan Kara          2023-03-01   977  			 le32_to_cpu(es->s_log_block_size));
62aeb94433fcec Jan Kara          2023-03-01   978  		goto failed_mount;
62aeb94433fcec Jan Kara          2023-03-01   979  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   980  	blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16   981  
^1da177e4c3f41 Linus Torvalds    2005-04-16   982  	/* If the blocksize doesn't match, re-read the thing.. */
^1da177e4c3f41 Linus Torvalds    2005-04-16   983  	if (sb->s_blocksize != blocksize) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   984  		brelse(bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16   985  
^1da177e4c3f41 Linus Torvalds    2005-04-16   986  		if (!sb_set_blocksize(sb, blocksize)) {
4e299c1d9113b5 Robin Dong        2011-05-05   987  			ext2_msg(sb, KERN_ERR,
4e299c1d9113b5 Robin Dong        2011-05-05   988  				"error: bad blocksize %d", blocksize);
^1da177e4c3f41 Linus Torvalds    2005-04-16   989  			goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   990  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   991  
^1da177e4c3f41 Linus Torvalds    2005-04-16   992  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   993  		offset = (sb_block*BLOCK_SIZE) % blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   994  		bh = sb_bread(sb, logic_sb_block);
^1da177e4c3f41 Linus Torvalds    2005-04-16   995  		if(!bh) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   996  			ext2_msg(sb, KERN_ERR, "error: couldn't read"
2314b07cb47ef7 Oleksij Rempel    2009-11-19   997  				"superblock on 2nd try");
^1da177e4c3f41 Linus Torvalds    2005-04-16   998  			goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   999  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1000  		es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1001  		sbi->s_es = es;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1002  		if (es->s_magic != cpu_to_le16(EXT2_SUPER_MAGIC)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1003  			ext2_msg(sb, KERN_ERR, "error: magic mismatch");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1004  			goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1005  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1006  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1007  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1008  	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
8de52778798fe3 Al Viro           2012-02-06  1009  	sb->s_max_links = EXT2_LINK_MAX;
22b139691f9eb8 Deepa Dinamani    2019-07-30  1010  	sb->s_time_min = S32_MIN;
22b139691f9eb8 Deepa Dinamani    2019-07-30  1011  	sb->s_time_max = S32_MAX;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1012  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1013  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  		sbi->s_inode_size = EXT2_GOOD_OLD_INODE_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1015  		sbi->s_first_ino = EXT2_GOOD_OLD_FIRST_INO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1016  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1017  		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1019  		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
d8ea6cf8999100 vignesh babu      2007-10-16  1020  		    !is_power_of_2(sbi->s_inode_size) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  		    (sbi->s_inode_size > blocksize)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1022  			ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1023  				"error: unsupported inode size: %d",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1024  				sbi->s_inode_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  			goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1026  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1027  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1028  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1029  	sbi->s_blocks_per_group = le32_to_cpu(es->s_blocks_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1030  	sbi->s_inodes_per_group = le32_to_cpu(es->s_inodes_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1031  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1032  	sbi->s_inodes_per_block = sb->s_blocksize / EXT2_INODE_SIZE(sb);
607eb266aea9dd Andries Brouwer   2006-08-27  1033  	if (sbi->s_inodes_per_block == 0 || sbi->s_inodes_per_group == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1034  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1035  	sbi->s_itb_per_group = sbi->s_inodes_per_group /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1036  					sbi->s_inodes_per_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1037  	sbi->s_desc_per_block = sb->s_blocksize /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1038  					sizeof (struct ext2_group_desc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1039  	sbi->s_sbh = bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1040  	sbi->s_mount_state = le16_to_cpu(es->s_state);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1041  	sbi->s_addr_per_block_bits =
f0d1b0b30d250a David Howells     2006-12-08  1042  		ilog2 (EXT2_ADDR_PER_BLOCK(sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1043  	sbi->s_desc_per_block_bits =
f0d1b0b30d250a David Howells     2006-12-08  1044  		ilog2 (EXT2_DESC_PER_BLOCK(sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1045  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  	if (sb->s_magic != EXT2_SUPER_MAGIC)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1047  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1048  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  	if (sb->s_blocksize != bh->b_size) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  		if (!silent)
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1051  			ext2_msg(sb, KERN_ERR, "error: unsupported blocksize");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1052  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1053  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1054  
404615d7f1dcd4 Jan Kara          2023-06-13  1055  	if (es->s_log_frag_size != es->s_log_block_size) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1056  		ext2_msg(sb, KERN_ERR,
404615d7f1dcd4 Jan Kara          2023-06-13  1057  			"error: fragsize log %u != blocksize log %u",
404615d7f1dcd4 Jan Kara          2023-06-13  1058  			le32_to_cpu(es->s_log_frag_size), sb->s_blocksize_bits);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1060  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1061  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062  	if (sbi->s_blocks_per_group > sb->s_blocksize * 8) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1063  		ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1064  			"error: #blocks per group too big: %lu",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1065  			sbi->s_blocks_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1066  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1067  	}
d766f2d1e3e3bd Jan Kara          2022-09-14  1068  	/* At least inode table, bitmaps, and sb have to fit in one group */
d766f2d1e3e3bd Jan Kara          2022-09-14  1069  	if (sbi->s_blocks_per_group <= sbi->s_itb_per_group + 3) {
d766f2d1e3e3bd Jan Kara          2022-09-14  1070  		ext2_msg(sb, KERN_ERR,
d766f2d1e3e3bd Jan Kara          2022-09-14  1071  			"error: #blocks per group smaller than metadata size: %lu <= %lu",
d766f2d1e3e3bd Jan Kara          2022-09-14  1072  			sbi->s_blocks_per_group, sbi->s_inodes_per_group + 3);
d766f2d1e3e3bd Jan Kara          2022-09-14  1073  		goto failed_mount;
d766f2d1e3e3bd Jan Kara          2022-09-14  1074  	}
fa78f336937240 Jan Kara          2022-07-26  1075  	if (sbi->s_inodes_per_group < sbi->s_inodes_per_block ||
fa78f336937240 Jan Kara          2022-07-26  1076  	    sbi->s_inodes_per_group > sb->s_blocksize * 8) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1077  		ext2_msg(sb, KERN_ERR,
fa78f336937240 Jan Kara          2022-07-26  1078  			"error: invalid #inodes per group: %lu",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  			sbi->s_inodes_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1080  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1081  	}
d766f2d1e3e3bd Jan Kara          2022-09-14  1082  	if (sb_bdev_nr_blocks(sb) < le32_to_cpu(es->s_blocks_count)) {
d766f2d1e3e3bd Jan Kara          2022-09-14  1083  		ext2_msg(sb, KERN_ERR,
d766f2d1e3e3bd Jan Kara          2022-09-14  1084  			 "bad geometry: block count %u exceeds size of device (%u blocks)",
d766f2d1e3e3bd Jan Kara          2022-09-14  1085  			 le32_to_cpu(es->s_blocks_count),
d766f2d1e3e3bd Jan Kara          2022-09-14  1086  			 (unsigned)sb_bdev_nr_blocks(sb));
d766f2d1e3e3bd Jan Kara          2022-09-14  1087  		goto failed_mount;
d766f2d1e3e3bd Jan Kara          2022-09-14  1088  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1089  
41f04d852e3595 Eric Sandeen      2006-09-27  1090  	sbi->s_groups_count = ((le32_to_cpu(es->s_blocks_count) -
41f04d852e3595 Eric Sandeen      2006-09-27  1091  				le32_to_cpu(es->s_first_data_block) - 1)
41f04d852e3595 Eric Sandeen      2006-09-27  1092  					/ EXT2_BLOCKS_PER_GROUP(sb)) + 1;
fa78f336937240 Jan Kara          2022-07-26  1093  	if ((u64)sbi->s_groups_count * sbi->s_inodes_per_group !=
fa78f336937240 Jan Kara          2022-07-26  1094  	    le32_to_cpu(es->s_inodes_count)) {
fa78f336937240 Jan Kara          2022-07-26  1095  		ext2_msg(sb, KERN_ERR, "error: invalid #inodes: %u vs computed %llu",
fa78f336937240 Jan Kara          2022-07-26  1096  			 le32_to_cpu(es->s_inodes_count),
fa78f336937240 Jan Kara          2022-07-26  1097  			 (u64)sbi->s_groups_count * sbi->s_inodes_per_group);
fa78f336937240 Jan Kara          2022-07-26  1098  		goto failed_mount;
fa78f336937240 Jan Kara          2022-07-26  1099  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1100  	db_count = (sbi->s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  		   EXT2_DESC_PER_BLOCK(sb);
32a92f8c893269 Linus Torvalds    2026-02-21  1102  	sbi->s_group_desc = kvmalloc_objs(struct buffer_head *, db_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1103  	if (sbi->s_group_desc == NULL) {
6a03e6a8dcf573 Chengguang Xu     2019-01-01  1104  		ret = -ENOMEM;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1105  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1106  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1107  	}
18a82eb9f980b5 Pekka J Enberg    2009-01-07  1108  	bgl_lock_init(sbi->s_blockgroup_lock);
dd00cc486ab1c1 Yoann Padioleau   2007-07-19  1109  	sbi->s_debts = kcalloc(sbi->s_groups_count, sizeof(*sbi->s_debts), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  	if (!sbi->s_debts) {
6a03e6a8dcf573 Chengguang Xu     2019-01-01  1111  		ret = -ENOMEM;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1112  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  		goto failed_mount_group_desc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  	for (i = 0; i < db_count; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1116  		block = descriptor_loc(sb, logic_sb_block, i);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1117  		sbi->s_group_desc[i] = sb_bread(sb, block);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1118  		if (!sbi->s_group_desc[i]) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1119  			for (j = 0; j < i; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1120  				brelse (sbi->s_group_desc[j]);
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1121  			ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1122  				"error: unable to read group descriptors");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1123  			goto failed_mount_group_desc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1124  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1125  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1126  	if (!ext2_check_descriptors (sb)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1127  		ext2_msg(sb, KERN_ERR, "group descriptors corrupted");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1128  		goto failed_mount2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1129  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1130  	sbi->s_gdb_count = db_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1131  	spin_lock_init(&sbi->s_next_gen_lock);
e76ed86ee88f68 Timothy Day       2026-08-11  1132  	scoped_guard(spinlock, &sbi->s_next_gen_lock)
e76ed86ee88f68 Timothy Day       2026-08-11  1133  		sbi->s_next_generation = get_random_u32();
0216bfcffe424a Mingming Cao      2006-06-23  1134  
e312c97ea253f0 Liu xuzhi         2021-03-18  1135  	/* per filesystem reservation list head & lock */
a686cd898bd999 Martin J. Bligh   2007-10-16  1136  	spin_lock_init(&sbi->s_rsv_window_lock);
2e918ca509ae57 Timothy Day       2026-08-11  1137  	scoped_guard(spinlock, &sbi->s_rsv_window_lock) {
a686cd898bd999 Martin J. Bligh   2007-10-16  1138  		sbi->s_rsv_window_root = RB_ROOT;
a686cd898bd999 Martin J. Bligh   2007-10-16  1139  		/*
a686cd898bd999 Martin J. Bligh   2007-10-16  1140  		 * Add a single, static dummy reservation to the start of the
a686cd898bd999 Martin J. Bligh   2007-10-16  1141  		 * reservation window list --- it gives us a placeholder for
a686cd898bd999 Martin J. Bligh   2007-10-16  1142  		 * append-at-start-of-list which makes the allocation logic
a686cd898bd999 Martin J. Bligh   2007-10-16  1143  		 * _much_ simpler.
a686cd898bd999 Martin J. Bligh   2007-10-16  1144  		 */
a686cd898bd999 Martin J. Bligh   2007-10-16  1145  		sbi->s_rsv_window_head.rsv_start = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
a686cd898bd999 Martin J. Bligh   2007-10-16  1146  		sbi->s_rsv_window_head.rsv_end = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
a686cd898bd999 Martin J. Bligh   2007-10-16  1147  		sbi->s_rsv_window_head.rsv_alloc_hit = 0;
a686cd898bd999 Martin J. Bligh   2007-10-16  1148  		sbi->s_rsv_window_head.rsv_goal_size = 0;
a686cd898bd999 Martin J. Bligh   2007-10-16 @1149  		ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
2e918ca509ae57 Timothy Day       2026-08-11  1150  	}
a686cd898bd999 Martin J. Bligh   2007-10-16  1151  
833f4077bf7c2d Peter Zijlstra    2007-10-16  1152  	err = percpu_counter_init(&sbi->s_freeblocks_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1153  				ext2_count_free_blocks(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1154  	if (!err) {
833f4077bf7c2d Peter Zijlstra    2007-10-16  1155  		err = percpu_counter_init(&sbi->s_freeinodes_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1156  				ext2_count_free_inodes(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1157  	}
833f4077bf7c2d Peter Zijlstra    2007-10-16  1158  	if (!err) {
833f4077bf7c2d Peter Zijlstra    2007-10-16  1159  		err = percpu_counter_init(&sbi->s_dirs_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1160  				ext2_count_dirs(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1161  	}
833f4077bf7c2d Peter Zijlstra    2007-10-16  1162  	if (err) {
34e92542da9643 Chengguang Xu     2019-11-29  1163  		ret = err;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1164  		ext2_msg(sb, KERN_ERR, "error: insufficient memory");
833f4077bf7c2d Peter Zijlstra    2007-10-16  1165  		goto failed_mount3;
833f4077bf7c2d Peter Zijlstra    2007-10-16  1166  	}
be0726d33cb8f4 Jan Kara          2016-02-22  1167  

:::::: The code at line 1149 was first introduced by commit
:::::: a686cd898bd999fd026a51e90fb0a3410d258ddb ext2 reservations

:::::: TO: Martin J. Bligh <mbligh@mbligh.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
