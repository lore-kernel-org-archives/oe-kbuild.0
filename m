Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038003;
	b=uKf0VIqE5ItYmJbh2+FwXno055ywKqTHvSaz9ZXmSYSlbiwDbeXd1R2M6+heEVmnHJUn
	 vUZpeGV3Zr5ozaxYKTixPa7131QdOssqhcCwWxEK1+/j9x9CKIg6v/RszPMtJ/Fb149Fd
	 QyBtsg3sDgl7VY6pfd8YUdChSFgeIV0Ur2m4piSSEGHFOYdicWWO1jQi7rZxiR0BhKgGL
	 TeJZ7d2lWKAKMus3yXfH7IJCuKMFmbmpG+DqEH7BJ0rQpdjj7+BpnCCuB6CQP5Te6lc2c
	 7dG5atPB7SzHUODUNN+sA3x3SfdGGquqZP6ibGK1tBXW4o9DTBp+OHVzLepPRQYSC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cABipspjBjJ/LKcd9FVm0Y+J8zbR9ax6vU0wzvwVNEE=;
	b=QevFxjIiPRPZa/CIuFyWWTHlPPSIIAPK1L05LB/YhKrhkVE9qVOEQgWO3/xSUvSK5emB
	 GZGjD67Bm6R+zczGfurowA/fCY6PJZ+/4WnT0AqaGmiPgiQH+kGDtCa+a/Mdsk5F8F1tp
	 gKKs3uJO3r4Drl0xPaPo/Mstc8T8T5w5mi64TNqtQZFC2pEQbH2f4E0N/Fb0JLxJHfPnW
	 mm/gF3NivJX+vc+k94HZvMZF/LnZYwi4akp8s9A1pdaMP+gXdl3kc9Cr6Ho4aouHUGDKf
	 UFN/HY8qeJrIQBK227evqlmq2NT3nCwZecH+eVU1vxg+1Ack5CobgvT66cwt4nme1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V7O8WqRo;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933C606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 07:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5933C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V7O8WqRo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794038001; x=1825574001;
  h=date:from:to:cc:subject:message-id;
  bh=g/EDfmr9jewmzOBYvBeZj0XjA0p450+AwR0t6NFdhl8=;
  b=V7O8WqRoStJ3w07CN60UQDo45fmXEEu2s1TQJEh3gN2chpybEOXqPM2N
   bDskwGGLAs6RDPEY7p0ZiD8P+5d8DfaY52uPTZDUNE7paJ/viwLRDehxK
   l8KdHC1DG57lVi/5vBIl3+KTYXF2+wGJjiDfjBgWmQJs1QcK4E/ngV2xu
   qK/x0i4W3hb5+5yCthGt053Kw5qedE84uXZeMg26v9VnTRS/rORE+xi17
   iuP7rbTbj18zTaLmdaSrz//6uK/ahdReGlj25qBhM1xUC3051Pl5gtE43
   JWLUdUZwbkItHN9xq9047NLX1GtUnIQ8K39Hs/IJZsI3fYH6LaBQRl986
   Q==;
X-CSE-ConnectionGUID: n2JrGvI9R2OLCcy7ncxmCA==
X-CSE-MsgGUID: KoKI2QnbR5WDCGhH2MKDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2837862"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2837862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:53:21 -0800
X-CSE-ConnectionGUID: EDvdU+doQVuMG3UnKAHwGA==
X-CSE-MsgGUID: Y7Hr6VhsSOu4yf/h18woLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7580562"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 23:53:20 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPbEg-00000000AbL-2Y3i;
	Sat, 07 Nov 2026 07:53:14 +0000
Date: Sat, 07 Nov 2026 08:52:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mcgrof:2026-11-06-dmabuf-io-async-release 2/23]
 fs/iomap/direct-io.c:431 iomap_dio_bio_iter() warn: bitwise AND condition is
 false here
Message-ID: <202611070851.g3apJXi3-lkp@intel.com>
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
TO: Nitesh Shetty <nj.shetty@samsung.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Anuj Gupta <anuj20.g@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 2026-11-06-dmabuf-io-async-release
head:   a7c2fb31d587738afec3fe514f0d2b87eedc80b9
commit: e51a118c99a32849c193327f2ef58f7e8c261030 [2/23] iomap: add dma-buf direct I/O guards and registration helper
:::::: branch date: 7 hours ago
:::::: commit date: 8 days ago
config: nios2-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070851.g3apJXi3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611070851.g3apJXi3-lkp@intel.com/

New smatch warnings:
fs/iomap/direct-io.c:431 iomap_dio_bio_iter() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/direct-io.c:377 iomap_dio_bio_iter_one() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/direct-io.c:1032 __iomap_dio_read_simple() warn: bitwise AND condition is false here

vim +431 fs/iomap/direct-io.c

27b7efca5bb4e0e Fengnan Chang     2026-07-01  415  
8fecec46d10bafb Brian Foster      2025-02-24  416  static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
db074436f421967 Darrick J. Wong   2019-07-15  417  {
a6d3d49587d10d2 Christoph Hellwig 2021-08-10  418  	const struct iomap *iomap = &iter->iomap;
a6d3d49587d10d2 Christoph Hellwig 2021-08-10  419  	struct inode *inode = iter->inode;
db074436f421967 Darrick J. Wong   2019-07-15  420  	unsigned int fs_block_size = i_blocksize(inode), pad;
9e0933c21c128d6 John Garry        2024-11-04  421  	const loff_t length = iomap_length(iter);
a6d3d49587d10d2 Christoph Hellwig 2021-08-10  422  	loff_t pos = iter->pos;
d279c80e0bac8a4 John Garry        2025-03-20  423  	blk_opf_t bio_opf = REQ_SYNC | REQ_IDLE;
db074436f421967 Darrick J. Wong   2019-07-15  424  	bool need_zeroout = false;
8fecec46d10bafb Brian Foster      2025-02-24  425  	u64 copied = 0;
f550ee9b85fd47f Jan Kara          2019-11-26  426  	size_t orig_count;
001397f5ef4908e Qu Wenruo         2025-10-31  427  	unsigned int alignment;
2631c9460229709 Christoph Hellwig 2026-01-26  428  	ssize_t ret = 0;
db074436f421967 Darrick J. Wong   2019-07-15  429  
e51a118c99a3284 Nitesh Shetty     2026-10-16  430  	if (iov_iter_is_dmabuf_map(dio->submit.iter) &&
e51a118c99a3284 Nitesh Shetty     2026-10-16 @431  	    (iomap->flags & IOMAP_F_INTEGRITY))
e51a118c99a3284 Nitesh Shetty     2026-10-16  432  		return -EOPNOTSUPP;
e51a118c99a3284 Nitesh Shetty     2026-10-16  433  
001397f5ef4908e Qu Wenruo         2025-10-31  434  	/*
001397f5ef4908e Qu Wenruo         2025-10-31  435  	 * File systems that write out of place and always allocate new blocks
001397f5ef4908e Qu Wenruo         2025-10-31  436  	 * need each bio to be block aligned as that's the unit of allocation.
001397f5ef4908e Qu Wenruo         2025-10-31  437  	 */
27b7efca5bb4e0e Fengnan Chang     2026-07-01  438  	alignment = iomap_dio_alignment(inode, iomap->bdev, dio->flags);
001397f5ef4908e Qu Wenruo         2025-10-31  439  
001397f5ef4908e Qu Wenruo         2025-10-31  440  	if ((pos | length) & (alignment - 1))
db074436f421967 Darrick J. Wong   2019-07-15  441  		return -EINVAL;
db074436f421967 Darrick J. Wong   2019-07-15  442  
d279c80e0bac8a4 John Garry        2025-03-20  443  	if (dio->flags & IOMAP_DIO_WRITE) {
29086a31b3abc66 Christoph Hellwig 2025-11-13  444  		bool need_completion_work = true;
29086a31b3abc66 Christoph Hellwig 2025-11-13  445  
29086a31b3abc66 Christoph Hellwig 2025-11-13  446  		switch (iomap->type) {
29086a31b3abc66 Christoph Hellwig 2025-11-13  447  		case IOMAP_MAPPED:
29086a31b3abc66 Christoph Hellwig 2025-11-13  448  			/*
29086a31b3abc66 Christoph Hellwig 2025-11-13  449  			 * Directly mapped I/O does not inherently need to do
29086a31b3abc66 Christoph Hellwig 2025-11-13  450  			 * work at I/O completion time.  But there are various
29086a31b3abc66 Christoph Hellwig 2025-11-13  451  			 * cases below where this will get set again.
29086a31b3abc66 Christoph Hellwig 2025-11-13  452  			 */
29086a31b3abc66 Christoph Hellwig 2025-11-13  453  			need_completion_work = false;
29086a31b3abc66 Christoph Hellwig 2025-11-13  454  			break;
29086a31b3abc66 Christoph Hellwig 2025-11-13  455  		case IOMAP_UNWRITTEN:
29086a31b3abc66 Christoph Hellwig 2025-11-13  456  			dio->flags |= IOMAP_DIO_UNWRITTEN;
29086a31b3abc66 Christoph Hellwig 2025-11-13  457  			need_zeroout = true;
29086a31b3abc66 Christoph Hellwig 2025-11-13  458  			break;
29086a31b3abc66 Christoph Hellwig 2025-11-13  459  		default:
29086a31b3abc66 Christoph Hellwig 2025-11-13  460  			break;
29086a31b3abc66 Christoph Hellwig 2025-11-13  461  		}
d279c80e0bac8a4 John Garry        2025-03-20  462  
370a6de7651b974 John Garry        2025-03-20  463  		if (iomap->flags & IOMAP_F_ATOMIC_BIO) {
aacd436e40b0a8f John Garry        2025-03-20  464  			/*
aacd436e40b0a8f John Garry        2025-03-20  465  			 * Ensure that the mapping covers the full write
aacd436e40b0a8f John Garry        2025-03-20  466  			 * length, otherwise it won't be submitted as a single
aacd436e40b0a8f John Garry        2025-03-20  467  			 * bio, which is required to use hardware atomics.
aacd436e40b0a8f John Garry        2025-03-20  468  			 */
d279c80e0bac8a4 John Garry        2025-03-20  469  			if (length != iter->len)
d279c80e0bac8a4 John Garry        2025-03-20  470  				return -EINVAL;
d279c80e0bac8a4 John Garry        2025-03-20  471  			bio_opf |= REQ_ATOMIC;
d279c80e0bac8a4 John Garry        2025-03-20  472  		}
d279c80e0bac8a4 John Garry        2025-03-20  473  
29086a31b3abc66 Christoph Hellwig 2025-11-13  474  		if (iomap->flags & IOMAP_F_SHARED) {
29086a31b3abc66 Christoph Hellwig 2025-11-13  475  			/*
29086a31b3abc66 Christoph Hellwig 2025-11-13  476  			 * Unsharing of needs to update metadata at I/O
29086a31b3abc66 Christoph Hellwig 2025-11-13  477  			 * completion time.
29086a31b3abc66 Christoph Hellwig 2025-11-13  478  			 */
29086a31b3abc66 Christoph Hellwig 2025-11-13  479  			need_completion_work = true;
db074436f421967 Darrick J. Wong   2019-07-15  480  			dio->flags |= IOMAP_DIO_COW;
29086a31b3abc66 Christoph Hellwig 2025-11-13  481  		}
db074436f421967 Darrick J. Wong   2019-07-15  482  
29086a31b3abc66 Christoph Hellwig 2025-11-13  483  		if (iomap->flags & IOMAP_F_NEW) {
29086a31b3abc66 Christoph Hellwig 2025-11-13  484  			/*
29086a31b3abc66 Christoph Hellwig 2025-11-13  485  			 * Newly allocated blocks might need recording in
29086a31b3abc66 Christoph Hellwig 2025-11-13  486  			 * metadata at I/O completion time.
29086a31b3abc66 Christoph Hellwig 2025-11-13  487  			 */
29086a31b3abc66 Christoph Hellwig 2025-11-13  488  			need_completion_work = true;
db074436f421967 Darrick J. Wong   2019-07-15  489  			need_zeroout = true;
29086a31b3abc66 Christoph Hellwig 2025-11-13  490  		}
6b65028e2b51c02 Jan Kara          2025-07-30  491  
29086a31b3abc66 Christoph Hellwig 2025-11-13  492  		/*
29086a31b3abc66 Christoph Hellwig 2025-11-13  493  		 * Use a FUA write if we need datasync semantics and this is a
29086a31b3abc66 Christoph Hellwig 2025-11-13  494  		 * pure overwrite that doesn't require any metadata updates.
29086a31b3abc66 Christoph Hellwig 2025-11-13  495  		 *
29086a31b3abc66 Christoph Hellwig 2025-11-13  496  		 * This allows us to avoid cache flushes on I/O completion.
29086a31b3abc66 Christoph Hellwig 2025-11-13  497  		 */
29086a31b3abc66 Christoph Hellwig 2025-11-13  498  		if (dio->flags & IOMAP_DIO_WRITE_THROUGH) {
29086a31b3abc66 Christoph Hellwig 2025-11-13  499  			if (!need_completion_work &&
29086a31b3abc66 Christoph Hellwig 2025-11-13  500  			    !(iomap->flags & IOMAP_F_DIRTY) &&
29086a31b3abc66 Christoph Hellwig 2025-11-13  501  			    (!bdev_write_cache(iomap->bdev) ||
29086a31b3abc66 Christoph Hellwig 2025-11-13  502  			     bdev_fua(iomap->bdev)))
29086a31b3abc66 Christoph Hellwig 2025-11-13  503  				bio_opf |= REQ_FUA;
29086a31b3abc66 Christoph Hellwig 2025-11-13  504  			else
d279c80e0bac8a4 John Garry        2025-03-20  505  				dio->flags &= ~IOMAP_DIO_WRITE_THROUGH;
29086a31b3abc66 Christoph Hellwig 2025-11-13  506  		}
eca9dc20891de4c Christoph Hellwig 2025-11-13  507  
eca9dc20891de4c Christoph Hellwig 2025-11-13  508  		/*
eca9dc20891de4c Christoph Hellwig 2025-11-13  509  		 * We can only do inline completion for pure overwrites that
eca9dc20891de4c Christoph Hellwig 2025-11-13  510  		 * don't require additional I/O at completion time.
eca9dc20891de4c Christoph Hellwig 2025-11-13  511  		 *
eca9dc20891de4c Christoph Hellwig 2025-11-13  512  		 * This rules out writes that need zeroing or metdata updates to
eca9dc20891de4c Christoph Hellwig 2025-11-13  513  		 * convert unwritten or shared extents.
eca9dc20891de4c Christoph Hellwig 2025-11-13  514  		 *
eca9dc20891de4c Christoph Hellwig 2025-11-13  515  		 * Writes that extend i_size are also not supported, but this is
eca9dc20891de4c Christoph Hellwig 2025-11-13  516  		 * handled in __iomap_dio_rw().
eca9dc20891de4c Christoph Hellwig 2025-11-13  517  		 */
eca9dc20891de4c Christoph Hellwig 2025-11-13  518  		if (need_completion_work)
76192a42c210cd6 Christoph Hellwig 2025-11-13  519  			dio->flags |= IOMAP_DIO_COMP_WORK;
eca9dc20891de4c Christoph Hellwig 2025-11-13  520  
29086a31b3abc66 Christoph Hellwig 2025-11-13  521  		bio_opf |= REQ_OP_WRITE;
d279c80e0bac8a4 John Garry        2025-03-20  522  	} else {
d279c80e0bac8a4 John Garry        2025-03-20  523  		bio_opf |= REQ_OP_READ;
db074436f421967 Darrick J. Wong   2019-07-15  524  	}
db074436f421967 Darrick J. Wong   2019-07-15  525  
db074436f421967 Darrick J. Wong   2019-07-15  526  	/*
f550ee9b85fd47f Jan Kara          2019-11-26  527  	 * Save the original count and trim the iter to just the extent we
f550ee9b85fd47f Jan Kara          2019-11-26  528  	 * are operating on right now.  The iter will be re-expanded once
f550ee9b85fd47f Jan Kara          2019-11-26  529  	 * we are done.
db074436f421967 Darrick J. Wong   2019-07-15  530  	 */
f550ee9b85fd47f Jan Kara          2019-11-26  531  	orig_count = iov_iter_count(dio->submit.iter);
f550ee9b85fd47f Jan Kara          2019-11-26  532  	iov_iter_truncate(dio->submit.iter, length);
db074436f421967 Darrick J. Wong   2019-07-15  533  
3e1a88ec9625928 Pavel Begunkov    2021-01-09  534  	if (!iov_iter_count(dio->submit.iter))
f550ee9b85fd47f Jan Kara          2019-11-26  535  		goto out;
db074436f421967 Darrick J. Wong   2019-07-15  536  
8c052fb3002e6e7 Jens Axboe        2023-07-08  537  	/*
8c052fb3002e6e7 Jens Axboe        2023-07-08  538  	 * The rules for polled IO completions follow the guidelines as the
8c052fb3002e6e7 Jens Axboe        2023-07-08  539  	 * ones we set for inline and deferred completions. If none of those
8c052fb3002e6e7 Jens Axboe        2023-07-08  540  	 * are available for this IO, clear the polled flag.
8c052fb3002e6e7 Jens Axboe        2023-07-08  541  	 */
76192a42c210cd6 Christoph Hellwig 2025-11-13  542  	if (dio->flags & IOMAP_DIO_COMP_WORK)
f79d474905fec0b Christoph Hellwig 2021-10-12  543  		dio->iocb->ki_flags &= ~IOCB_HIPRI;
f79d474905fec0b Christoph Hellwig 2021-10-12  544  
db074436f421967 Darrick J. Wong   2019-07-15  545  	if (need_zeroout) {
db074436f421967 Darrick J. Wong   2019-07-15  546  		/* zero out from the start of the block to the write offset */
db074436f421967 Darrick J. Wong   2019-07-15  547  		pad = pos & (fs_block_size - 1);
10553a91652d995 Pankaj Raghav     2024-08-22  548  
10553a91652d995 Pankaj Raghav     2024-08-22  549  		ret = iomap_dio_zero(iter, dio, pos - pad, pad);
10553a91652d995 Pankaj Raghav     2024-08-22  550  		if (ret)
10553a91652d995 Pankaj Raghav     2024-08-22  551  			goto out;
db074436f421967 Darrick J. Wong   2019-07-15  552  	}
db074436f421967 Darrick J. Wong   2019-07-15  553  
db074436f421967 Darrick J. Wong   2019-07-15  554  	do {
4ad357e39b2ecd5 Christoph Hellwig 2026-01-26  555  		/*
4ad357e39b2ecd5 Christoph Hellwig 2026-01-26  556  		 * If completions already occurred and reported errors, give up now and
4ad357e39b2ecd5 Christoph Hellwig 2026-01-26  557  		 * don't bother submitting more bios.
4ad357e39b2ecd5 Christoph Hellwig 2026-01-26  558  		 */
2631c9460229709 Christoph Hellwig 2026-01-26  559  		if (unlikely(data_race(dio->error)))
f550ee9b85fd47f Jan Kara          2019-11-26  560  			goto out;
db074436f421967 Darrick J. Wong   2019-07-15  561  
2631c9460229709 Christoph Hellwig 2026-01-26  562  		ret = iomap_dio_bio_iter_one(iter, dio, pos, alignment, bio_opf);
2631c9460229709 Christoph Hellwig 2026-01-26  563  		if (unlikely(ret < 0)) {
db074436f421967 Darrick J. Wong   2019-07-15  564  			/*
db074436f421967 Darrick J. Wong   2019-07-15  565  			 * We have to stop part way through an IO. We must fall
db074436f421967 Darrick J. Wong   2019-07-15  566  			 * through to the sub-block tail zeroing here, otherwise
db074436f421967 Darrick J. Wong   2019-07-15  567  			 * this short IO may expose stale data in the tail of
db074436f421967 Darrick J. Wong   2019-07-15  568  			 * the block we haven't written data to.
db074436f421967 Darrick J. Wong   2019-07-15  569  			 */
2631c9460229709 Christoph Hellwig 2026-01-26  570  			break;
9e0933c21c128d6 John Garry        2024-11-04  571  		}
2631c9460229709 Christoph Hellwig 2026-01-26  572  		dio->size += ret;
2631c9460229709 Christoph Hellwig 2026-01-26  573  		copied += ret;
2631c9460229709 Christoph Hellwig 2026-01-26  574  		pos += ret;
2631c9460229709 Christoph Hellwig 2026-01-26  575  		ret = 0;
6e7a6c80198ead0 Christoph Hellwig 2026-01-26  576  	} while (iov_iter_count(dio->submit.iter));
db074436f421967 Darrick J. Wong   2019-07-15  577  
db074436f421967 Darrick J. Wong   2019-07-15  578  	/*
db074436f421967 Darrick J. Wong   2019-07-15  579  	 * We need to zeroout the tail of a sub-block write if the extent type
db074436f421967 Darrick J. Wong   2019-07-15  580  	 * requires zeroing or the write extends beyond EOF. If we don't zero
db074436f421967 Darrick J. Wong   2019-07-15  581  	 * the block tail in the latter case, we can expose stale data via mmap
db074436f421967 Darrick J. Wong   2019-07-15  582  	 * reads of the EOF block.
db074436f421967 Darrick J. Wong   2019-07-15  583  	 */
db074436f421967 Darrick J. Wong   2019-07-15  584  	if (need_zeroout ||
db074436f421967 Darrick J. Wong   2019-07-15  585  	    ((dio->flags & IOMAP_DIO_WRITE) && pos >= i_size_read(inode))) {
db074436f421967 Darrick J. Wong   2019-07-15  586  		/* zero out from the end of the write to the end of the block */
db074436f421967 Darrick J. Wong   2019-07-15  587  		pad = pos & (fs_block_size - 1);
db074436f421967 Darrick J. Wong   2019-07-15  588  		if (pad)
10553a91652d995 Pankaj Raghav     2024-08-22  589  			ret = iomap_dio_zero(iter, dio, pos,
10553a91652d995 Pankaj Raghav     2024-08-22  590  					     fs_block_size - pad);
db074436f421967 Darrick J. Wong   2019-07-15  591  	}
f550ee9b85fd47f Jan Kara          2019-11-26  592  out:
f550ee9b85fd47f Jan Kara          2019-11-26  593  	/* Undo iter limitation to current extent */
f550ee9b85fd47f Jan Kara          2019-11-26  594  	iov_iter_reexpand(dio->submit.iter, orig_count - copied);
e9f930ac88a8936 Jan Stancek       2019-11-11  595  	if (copied)
ca82a7ea2299b45 Joanne Koong      2025-09-19  596  		return iomap_iter_advance(iter, copied);
e9f930ac88a8936 Jan Stancek       2019-11-11  597  	return ret;
db074436f421967 Darrick J. Wong   2019-07-15  598  }
db074436f421967 Darrick J. Wong   2019-07-15  599  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
