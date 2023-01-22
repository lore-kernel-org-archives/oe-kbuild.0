Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808E7E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 01:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674351241; x=1705887241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yNU1MciupQLW8TVBtXtnJsee2+BAih/1CSkx3xSnIQ=;
  b=f4pDZRYxsz7H8EC01taNdjeoixYL7M1EMUWir9DnNC5NCkj5WbItoqex
   xxFRmQlHUKcWwPjQbv63DLDJ7IAQ/oPd8AUw8RfG9nVyeMeQFQ/IpbmDy
   HTnaW6ND2/arqJNxg6Dz5qLBwkJCaZsVjDdfXBrsnWpB5StjgH7hQZHmA
   pX4kGQdKFe9bSRZEnvY+9/EyO9x4TSoL03TEPovY0EwyQKwJtNrfoZ+oL
   kk/HsZbbQe7iL+HOtPPELQYMWrQTQUz8QjYueQTnymjPQpZU0sBPih0Pk
   nBBe5PECK+XhjbDIZiQKzIvIjZ0EQgSohhJvoUFXwccxrMCTMCL3waCf5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388216389"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="388216389"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 17:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="610896740"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="610896740"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jan 2023 17:33:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJPF8-0004eC-0v;
	Sun, 22 Jan 2023 01:33:58 +0000
Date: Sun, 22 Jan 2023 09:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced
 before check 'bio' (see line 995)
Message-ID: <202301220910.UeYxE65s-lkp@intel.com>
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
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
head:   4bf3e7f429f64b802942c685cf37b02a546a25e5
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/361] f2fs: don't pass a bio to f2fs_target_device
:::::: branch date: 2 weeks ago
:::::: commit date: 9 months ago
config: arm64-randconfig-m041-20230115 (https://download.01.org/0day-ci/archive/20230122/202301220910.UeYxE65s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)

Old smatch warnings:
fs/f2fs/data.c:212 f2fs_verify_and_finish_bio() warn: bitwise AND condition is false here
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
https://github.com/intel/lkp-tests
