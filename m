Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23521A03
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP8v7gQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701937241; x=1733473241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahNRoAwxUsj06aTmufeaoo0btXC4NBSjwWF0kgZlMzU=;
  b=QP8v7gQO/j5TISqpo3ekFxNMBCS2bnZd7r7DC1YukaKF4PBBzi5AeJhA
   a2KdWZgWYfW/eVaEM07biBYQlRjs2RVr6PViqYW4gqpnBcEgJkYGqTatm
   WiJq/H5ajuf/z3N8/FI0xcCsM3FCVQk5Q61HMIpQjoXCEaRYiRBASlJvH
   WOmfVprcTCOHPfOeihVb1a2pI4ZXDfjf5vbezyqLlYcHqcx7DdV/3Yi+J
   PLpqtWeW7EUu6bUyRdII1iarKmGKHV+iSoC/+b1pXSi/zKl0akwq01kCy
   5cS7bFhOZy8g+0J7X2sd2aBVzJpCElgBhympDqGWB226HHWBLRS/iyU/d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7506181"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7506181"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 00:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842131431"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="842131431"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2023 00:20:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB9cO-000ByQ-0t;
	Thu, 07 Dec 2023 08:20:26 +0000
Date: Thu, 7 Dec 2023 16:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-f2fs-stable-linux-5.15.y 115/609]
 fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before
 check 'bio' (see line 995)
Message-ID: <202312071658.K2fohs9s-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.15.y
head:   f2de1a67d29d396f18aa7973b6792b29a84ed1f6
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/609] f2fs: don't pass a bio to f2fs_target_device
:::::: branch date: 7 weeks ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-141-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071658.K2fohs9s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071658.K2fohs9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312071658.K2fohs9s-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)

Old smatch warnings:
fs/f2fs/data.c:212 f2fs_verify_and_finish_bio() warn: bitwise AND condition is false here
fs/f2fs/data.c:263 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:2158 f2fs_read_multi_pages() warn: missing error code 'ret'

vim +/bio +996 fs/f2fs/data.c

93dfe2ac516250 Jaegeuk Kim             2013-11-30   981  
13ba41e346170e Jaegeuk Kim             2017-09-06   982  static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
95ae251fe82838 Eric Biggers            2019-07-22   983  				      unsigned nr_pages, unsigned op_flag,
7f59b277f79e8a Eric Biggers            2021-01-04   984  				      pgoff_t first_idx, bool for_write)
13ba41e346170e Jaegeuk Kim             2017-09-06   985  {
13ba41e346170e Jaegeuk Kim             2017-09-06   986  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
13ba41e346170e Jaegeuk Kim             2017-09-06   987  	struct bio *bio;
a4b6817625e71d Daeho Jeong             2021-08-20   988  	struct bio_post_read_ctx *ctx = NULL;
6dbb17961f46b2 Eric Biggers            2018-04-18   989  	unsigned int post_read_steps = 0;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   990  	sector_t sector;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   991  	struct block_device *bdev = f2fs_target_device(sbi, blkaddr, &sector);
13ba41e346170e Jaegeuk Kim             2017-09-06   992  
67883ade7a98a7 Christoph Hellwig       2021-01-26   993  	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
5f7136db829960 Matthew Wilcox (Oracle  2021-01-29   994) 			       bio_max_segs(nr_pages), &f2fs_bioset);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28  @995  	bio_set_dev(bio, bdev);
6dbb17961f46b2 Eric Biggers            2018-04-18  @996  	if (!bio)
13ba41e346170e Jaegeuk Kim             2017-09-06   997  		return ERR_PTR(-ENOMEM);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   998  	bio->bi_iter.bi_sector = sector;
27aacd28ea3b89 Satya Tangirala         2020-07-02   999  	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
13ba41e346170e Jaegeuk Kim             2017-09-06  1000  	bio->bi_end_io = f2fs_read_end_io;
e2e59414aae2c8 Jaegeuk Kim             2018-06-21  1001  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
13ba41e346170e Jaegeuk Kim             2017-09-06  1002  
27aacd28ea3b89 Satya Tangirala         2020-07-02  1003  	if (fscrypt_inode_uses_fs_layer_crypto(inode))
7f59b277f79e8a Eric Biggers            2021-01-04  1004  		post_read_steps |= STEP_DECRYPT;
7f59b277f79e8a Eric Biggers            2021-01-04  1005  
7f59b277f79e8a Eric Biggers            2021-01-04  1006  	if (f2fs_need_verity(inode, first_idx))
7f59b277f79e8a Eric Biggers            2021-01-04  1007  		post_read_steps |= STEP_VERITY;
7f59b277f79e8a Eric Biggers            2021-01-04  1008  
7f59b277f79e8a Eric Biggers            2021-01-04  1009  	/*
7f59b277f79e8a Eric Biggers            2021-01-04  1010  	 * STEP_DECOMPRESS is handled specially, since a compressed file might
7f59b277f79e8a Eric Biggers            2021-01-04  1011  	 * contain both compressed and uncompressed clusters.  We'll allocate a
7f59b277f79e8a Eric Biggers            2021-01-04  1012  	 * bio_post_read_ctx if the file is compressed, but the caller is
7f59b277f79e8a Eric Biggers            2021-01-04  1013  	 * responsible for enabling STEP_DECOMPRESS if it's actually needed.
7f59b277f79e8a Eric Biggers            2021-01-04  1014  	 */
95ae251fe82838 Eric Biggers            2019-07-22  1015  
7f59b277f79e8a Eric Biggers            2021-01-04  1016  	if (post_read_steps || f2fs_compressed_file(inode)) {
e8ce5749d781ec Eric Biggers            2019-12-31  1017  		/* Due to the mempool, this never fails. */
6dbb17961f46b2 Eric Biggers            2018-04-18  1018  		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
6dbb17961f46b2 Eric Biggers            2018-04-18  1019  		ctx->bio = bio;
4c8ff7095bef64 Chao Yu                 2019-11-01  1020  		ctx->sbi = sbi;
6dbb17961f46b2 Eric Biggers            2018-04-18  1021  		ctx->enabled_steps = post_read_steps;
4931e0c93e1243 Daeho Jeong             2021-07-28  1022  		ctx->fs_blkaddr = blkaddr;
6dbb17961f46b2 Eric Biggers            2018-04-18  1023  		bio->bi_private = ctx;
6dbb17961f46b2 Eric Biggers            2018-04-18  1024  	}
a4b6817625e71d Daeho Jeong             2021-08-20  1025  	iostat_alloc_and_bind_ctx(sbi, bio, ctx);
6dbb17961f46b2 Eric Biggers            2018-04-18  1026  
13ba41e346170e Jaegeuk Kim             2017-09-06  1027  	return bio;
13ba41e346170e Jaegeuk Kim             2017-09-06  1028  }
13ba41e346170e Jaegeuk Kim             2017-09-06  1029  

:::::: The code at line 996 was first introduced by commit
:::::: 6dbb17961f46b2eafcea2f2627aabb309553e068 f2fs: refactor read path to allow multiple postprocessing steps

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
