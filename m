Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A603638D3FB
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 23:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802241; cv=none; b=Sot4Ko2+1n10Z9+Um2kgU6YXFWskZaglfqYD6RQRWSLYvGF1tw+jwfSMUtBkDLeh+50XJkoGRtESRvSIQPL5dc1YYkpO7/jNBsxfkXnVVaxxwlFJpCP0hvGyDTzcCtULZWy041T6AtniB1kVPY9AxwvVglcI2p/3yeQi95QMVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802241; c=relaxed/simple;
	bh=9e8Z/lQ4njHZspKWwKLTvubf5X6sQYGL7JFsyuY40Mg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qZ1i+9Xx9XiNPRLqnHQQcVGZT6JC+krko4E46hVS5BF4SayuOChMv2Huf5lTVodpVlqJa9qMLDa0+bLk2xvDvbp4D5yiZaX3AVcjF2AoiXiIjybVRgyB8RNtVwO9VbRIo9Ferl7CzgVYuGK6FpAbRc8+SMhjlvvnMcrtx6Q88xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCcajJQz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCcajJQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778802240; x=1810338240;
  h=date:from:to:cc:subject:message-id;
  bh=9e8Z/lQ4njHZspKWwKLTvubf5X6sQYGL7JFsyuY40Mg=;
  b=YCcajJQzV9vyuWPMY81RujCnwVoIrrXSbmCSA8m6PXvkijDCYbMmLqIn
   Ujdk8+P6FN68n5IQVRJNn0VicqLRHN4lrifmZWbvGoXLxFNGsYwN3mJe9
   JQYJWQMHVC4MykdmHBexL4GS3x6yt3bf93CKxtLqPRbqg3ZFckWv7RWIg
   Rot+y6epha54X0Vvwb9QjqeKYvFS+HNBsZXPCJYYs9LOSB+aRQTkZo7gm
   HoSNk/8NClxfmWsTlnwinzToIwDU1F+x57BeWBfxy/poZwjKvqMvFCX89
   ZbX/6cFB2UfZ35oxAxd+QUzsshm0dfD0P34ZoVKCvhOyzWpj5CV5bGACS
   Q==;
X-CSE-ConnectionGUID: Cmrsn2uOQ1qTWRg1qiytCA==
X-CSE-MsgGUID: XdORglsARmaJTBvvO82ccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79471572"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79471572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 16:44:00 -0700
X-CSE-ConnectionGUID: KcctgLCaQ7a/9wEMCqxx1A==
X-CSE-MsgGUID: LwE8X5aqSYGB0YY3YdXjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242870640"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 May 2026 16:43:58 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNfi9-000000000MN-0lUI;
	Thu, 14 May 2026 23:43:35 +0000
Date: Fri, 15 May 2026 07:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 3/95]
 fs/bcachefs/vfs/direct.c:141 __bch2_direct_IO_read() warn: statement has no
 effect 'struct'
Message-ID: <202605150733.jdC7hgBv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 92b3d152fe07e1f2a7060adb3f06afcae6135437 [3/95] bcachefs: fix __bch2_direct_IO_read() error path
:::::: branch date: 30 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150733.jdC7hgBv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605150733.jdC7hgBv-lkp@intel.com/

smatch warnings:
fs/bcachefs/vfs/direct.c:141 __bch2_direct_IO_read() warn: statement has no effect 'struct'

vim +/struct +141 fs/bcachefs/vfs/direct.c

dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   64  
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   65  static int __bch2_direct_IO_read(struct kiocb *req, struct iov_iter *iter,
39fe245ff806f1d fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   66  				enum bch_read_flags flags,
39fe245ff806f1d fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   67  				struct bch_read_err_report *err_report)
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   68  {
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   69  	struct file *file = req->ki_filp;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   70  	struct bch_inode_info *inode = file_bch_inode(file);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   71  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   72  	struct dio_read *dio;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   73  	struct bio *bio;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   74  	loff_t offset = req->ki_pos;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   75  	bool sync = is_sync_kiocb(req);
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15   76  	bool split = false;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   77  	size_t shorten;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   78  	ssize_t ret;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   79  
e6479021dea40bb fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-08-23   80  	struct bch_inode_opts opts;
e6479021dea40bb fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-08-23   81  	bch2_inode_opts_get_inode(c, &inode->ei_inode, &opts);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   82  
00fff4dd5866194 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   83  	/* bios must be 512 byte aligned: */
00fff4dd5866194 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   84  	if ((offset|iter->count) & (SECTOR_SIZE - 1))
15be180f2638ee6 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-03   85  		return bch_err_throw(c, EINVAL_unaligned_io);
00fff4dd5866194 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   86  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   87  	ret = min_t(loff_t, iter->count,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   88  		    max_t(loff_t, 0, i_size_read(&inode->v) - offset));
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   89  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   90  	if (!ret)
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   91  		return ret;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   92  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   93  	shorten = iov_iter_count(iter) - round_up(ret, block_bytes(c));
b58b1b883b9b702 fs/bcachefs/fs-io-direct.c Brian Foster    2024-02-15   94  	if (shorten >= iter->count)
b58b1b883b9b702 fs/bcachefs/fs-io-direct.c Brian Foster    2024-02-15   95  		shorten = 0;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   96  	iter->count -= shorten;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   97  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   98  	bio = bio_alloc_bioset(NULL,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   99  			       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  100  			       REQ_OP_READ,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  101  			       GFP_KERNEL,
52d279ad5f3e4ca fs/bcachefs/vfs/direct.c   Kent Overstreet 2025-11-30  102  			       &c->vfs.dio_read_bioset);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  103  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  104  	dio = container_of(bio, struct dio_read, rbio.bio);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  105  	closure_init(&dio->cl, NULL);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  106  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  107  	/*
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  108  	 * this is a _really_ horrible hack just to avoid an atomic sub at the
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  109  	 * end:
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  110  	 */
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  111  	if (!sync) {
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  112  		set_closure_fn(&dio->cl, bch2_dio_read_complete, NULL);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  113  		atomic_set(&dio->cl.remaining,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  114  			   CLOSURE_REMAINING_INITIALIZER -
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  115  			   CLOSURE_RUNNING +
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  116  			   CLOSURE_DESTRUCTOR);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  117  	} else {
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  118  		atomic_set(&dio->cl.remaining,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  119  			   CLOSURE_REMAINING_INITIALIZER + 1);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  120  	}
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  121  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  122  	dio->req	= req;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  123  	dio->ret	= ret;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  124  	/*
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  125  	 * This is one of the sketchier things I've encountered: we have to skip
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  126  	 * the dirtying of requests that are internal from the kernel (i.e. from
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  127  	 * loopback), because we'll deadlock on page_lock.
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  128  	 */
8838999ccf4f6ff fs/bcachefs/fs-io-direct.c Alan Huang      2025-07-19  129  	dio->should_dirty = user_backed_iter(iter);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  130  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  131  	goto start;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  132  	while (iter->count) {
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  133  		split = true;
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  134  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  135  		bio = bio_alloc_bioset(NULL,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  136  				       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  137  				       REQ_OP_READ,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  138  				       GFP_KERNEL,
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  139  				       &c->bio_read);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  140  start:
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15 @141  		struct bch_read_bio *rbio =
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  142  			rbio_init(bio,
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  143  				  c,
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  144  				  opts,
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  145  				  split
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  146  				  ? bch2_direct_IO_read_split_endio
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  147  				  : bch2_direct_IO_read_endio);
dfa204b169ed29e fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  148  
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  149  		BUG_ON(rbio->_state);
39fe245ff806f1d fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  150  		rbio->err_report		= err_report;
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  151  		rbio->subvol			= inode_inum(inode).subvol;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  152  		rbio->bio.bi_opf		= REQ_OP_READ|REQ_SYNC;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  153  		rbio->bio.bi_iter.bi_sector	= offset >> 9;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  154  		rbio->bio.bi_private		= dio;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  155  
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  156  		ret = bch2_bio_iov_iter_get_pages(&rbio->bio, iter, 0);
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  157  		if (ret < 0) {
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  158  			/* XXX: fault inject this path */
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  159  			rbio->ret = ret;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  160  			bio_endio(&rbio->bio);
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  161  			break;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  162  		}
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  163  
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  164  		offset += rbio->bio.bi_iter.bi_size;
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  165  
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  166  		if (dio->should_dirty)
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  167  			bio_set_pages_dirty(&rbio->bio);
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  168  
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  169  		if (iter->count)
92b3d152fe07e1f fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  170  			closure_get(&dio->cl);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  171  
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  172  		CLASS(btree_trans, trans)(c);
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  173  		bch2_read(trans, rbio, rbio->bio.bi_iter, inode_inum(inode),
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  174  			  NULL, NULL,
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  175  			  BCH_READ_retry_if_stale|
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  176  			  BCH_READ_may_promote|
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  177  			  BCH_READ_user_mapped|
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  178  			  flags);
1fd72aa451b8bb2 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  179  	}
27de0ee39f810da fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-10-14  180  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  181  	iter->count += shorten;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  182  
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  183  	if (sync) {
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  184  		closure_sync(&dio->cl);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  185  		closure_debug_destroy(&dio->cl);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  186  		ret = dio->ret;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  187  		bio_check_or_release(&dio->rbio.bio, dio->should_dirty);
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  188  		return ret;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  189  	} else {
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  190  		return -EIOCBQUEUED;
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  191  	}
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  192  }
dbbfca9f41e8690 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  193  

:::::: The code at line 141 was first introduced by commit
:::::: dfa204b169ed29e4cdcb5a20d4cba2f579235543 bcachefs: rbio_init() cleanup

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
