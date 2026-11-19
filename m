Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066113;
	b=CqCEnf96/VtoS5GvDuRNk6x3dhckcZ/t1kCRJrMBGU9dmQnslAYaCclYZ/wPUnQxM2m7
	 oq11xnpTxaJKxLWodLtMvuhq3T8EgOYEtv3cr7S8JYwbBut+pWuu+ZQSrzWNZZ7A/MYSt
	 eAK1pjzQiwyythmHcQNx+Nk/w1H+uBJARSEWM9Jb/03BAGgKOrOPJM5zZ2/GkLLvQTkMy
	 hokYoz40WSar3phRmYvXpMGq8NKcCLMqMb8gTG5hDjgQTwz6lIpG1y+wCMEM+QiITIx2Y
	 38C1Wv5b3pgv+Nni2Pgy9UjLQMdowI52VfcGX/HW93v6rvuvoXL3Ooz0vjYRYv5+8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MZKv2fG/6gjtEvheFxek6/Ft/xUBs9E8nt64wsLJSmU=;
	b=YyMnt1hLL+wwHzOJ7SOW+rPzG/JFY/g8psaPE0jGi/CcPeqJA9HhN1jNjYmPykAA1f8G
	 6D6SqpsQV+QdpG92ogBXD0mXhQTGuMyczU/lRaVpLSRtryNx4nWI9vZllOIAQyA82Dilk
	 ue5OPJ2F7DBKUiiCHsLTdEMj4gShkpsdsCxToC7ngPLdnvLirqDS/52BX/skPtsyur18z
	 dGpIJ1hrLiCsho7TMSRb2Pw57UpsrlIR0pvYd3kFlENSPy80XdgXOHKMgplbpNCcEyhmI
	 +9XxV/2uRFEVnY12WoIBmKSPO5RjKTwGnWmYkoVboRgVJdBkxJYGeAidIMajIOyMynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRcbuKbm;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0F606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 05:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRcbuKbm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795066113; x=1826602113;
  h=date:from:to:cc:subject:message-id;
  bh=CLiDFfsc9ZCYDl7eCAIhT0xChSwTuvoPC0/W3+yse90=;
  b=LRcbuKbmRYIUXTJz2dqefW/Uo1U8hr80k5WMms6XPqa/1XaR+A3U8UCC
   632PYeoy+r79s9aYhiYu2EN2GdXP57s0cmCXG+CIWzLxQMEJrLMfZilMC
   wfGXbDSQf/+FuP+AUJyyVTSX7aJG2xbDd3JmEzHwGz++gq8P8MxhqimrG
   oRDRWwaOZtfB/meXT+vD3awTFlwQ1ZPROupUCLW6V57ANsUgZ6a478hd0
   xjJgGS8wgqKORammV+k8lITpm8iDh9L9J/5A63yo9XJ4mXmLO7pFVLq6h
   Y2kbZED9kgI+rboLsR/QQCQvqj8Vb79dHMgY8KVQWP9S4Nku4vm3fXgen
   w==;
X-CSE-ConnectionGUID: LT2tivJlQ++zvWdbh0LuYA==
X-CSE-MsgGUID: FQT4u6a1RwGiUBJZ5h1TdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3793253"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3793253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 21:28:32 -0800
X-CSE-ConnectionGUID: 8mBBuyS+Q4yzNHL27Hz7PA==
X-CSE-MsgGUID: viYVKDuuSBWIPQMc5viGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10138453"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 21:28:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTuh9-000000003g5-2sQZ;
	Thu, 19 Nov 2026 05:28:27 +0000
Date: Thu, 19 Nov 2026 06:28:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15-lts 29/29] fs/f2fs/data.c:996
 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line
 995)
Message-ID: <20261119061955.OcPMvkmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   6a30f9e067712464f3f2299dc278bcb5be365a3e
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [29/29] f2fs: don't pass a bio to f2fs_target_device
:::::: branch date: 2 days ago
:::::: commit date: 4 years, 7 months ago
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119061955.OcPMvkmV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119061955.OcPMvkmV-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)

Old smatch warnings:
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
