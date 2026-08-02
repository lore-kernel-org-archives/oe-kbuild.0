Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E682DB78C
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 23:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785714260; cv=none; b=eSt7+GPV0umU6GTgzYWcgXO2qdq2boJA4Gkt4MusZVGJ2TUTq0UJIzxLCxBxWSJIEiFVJaSrM7rVcCD4KyZN0MRtSCq4kF5O7o2oR8srICSa9VmA6/dKmUWE5zqDF/53BG470fQENFmvLik/8jbzIcB+GLz4MoMKBW80Dc6fq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785714260; c=relaxed/simple;
	bh=3PoAhQgbA4eNTVoHd1R6QeKBCi3Cml2loEztRxMcFGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJ0FUZ5aiMbojD+TThOIiqcolyoqYWSqq/YXxDl0HOaAqOpN8j1Ue3lwX24PBmJvmCXRswN80PRIhbQacvHMxbU4u+BYQ8CvcQGdz2IEhQBmHgZH+3xDogGw0h7+79uDWqlakxu/V5n2YJC+NAK/eNE2pkH8CjsCmy5JVGd0avs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi5jVIt+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi5jVIt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785714258; x=1817250258;
  h=date:from:to:cc:subject:message-id;
  bh=3PoAhQgbA4eNTVoHd1R6QeKBCi3Cml2loEztRxMcFGI=;
  b=hi5jVIt+8nRKHDub1tYhxXGYhD33/tDTZw/SEWfsBUtSTwU8aj7J7Hv1
   MCrD5naMzIzDPpWnPMaKhuZmZRwiOD5vF6t81okr2SPfhfCR2da3xKVSy
   +Gh8fJ7rd29pvC+dnr0o6Dnmp6ow8mXeJzOUxoHr3wk6xSRT2KojD5wiK
   wRiRSO2183uv/3NCf4bP0mluHMHRT1on5QoC8HfZm/c3r22GGVHEaAy9M
   VyrJ96IDKiXnuDdtAQWVX36uNqEBqDW7hkMfsqj7p8VVotBW8ck8wxtVC
   nfR+lJqE4zAF7nS1KhIq6R/BA82d5PYWDPbFV7r+Pu4iwv0mM/vg61W9A
   Q==;
X-CSE-ConnectionGUID: 4xHIgXneRW+zpdm/306nqA==
X-CSE-MsgGUID: +RmeBF5JRiyYlvmi+ksnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85225032"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="85225032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 16:44:17 -0700
X-CSE-ConnectionGUID: sQvDaGs8To+a7TqlO1m8jQ==
X-CSE-MsgGUID: oX1NypUfQ76bO98x1zXV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="266161606"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2026 16:44:16 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqfqn-000000005fZ-2ZVL;
	Sun, 02 Aug 2026 23:44:13 +0000
Date: Mon, 03 Aug 2026 07:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11181/11507] fs/iomap/direct-io.c:996
 __iomap_dio_read_simple() warn: bitwise AND condition is false here
Message-ID: <202608030751.N396tSCu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Fengnan Chang <changfengnan@bytedance.com>
CC: Joanne Koong <joannelkoong@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 335d4b6201ac317d906e6a694f07de0792325fee [11181/11507] iomap: decouple simple direct I/O reads from iomap_dio_rw
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260803 (https://download.01.org/0day-ci/archive/20260803/202608030751.N396tSCu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608030751.N396tSCu-lkp@intel.com/

New smatch warnings:
fs/iomap/direct-io.c:996 __iomap_dio_read_simple() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/direct-io.c:376 iomap_dio_bio_iter_one() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here

vim +996 fs/iomap/direct-io.c

36f199c8d0ee4b Fengnan Chang     2026-07-01   985  
335d4b6201ac31 Christoph Hellwig 2026-07-29   986  ssize_t __iomap_dio_read_simple(struct kiocb *iocb, struct iov_iter *iter,
335d4b6201ac31 Christoph Hellwig 2026-07-29   987  		struct iomap_iter *iomi)
36f199c8d0ee4b Fengnan Chang     2026-07-01   988  {
36f199c8d0ee4b Fengnan Chang     2026-07-01   989  	struct iomap_dio_simple *sr;
36f199c8d0ee4b Fengnan Chang     2026-07-01   990  	unsigned int alignment;
36f199c8d0ee4b Fengnan Chang     2026-07-01   991  	struct bio *bio;
36f199c8d0ee4b Fengnan Chang     2026-07-01   992  	ssize_t ret;
36f199c8d0ee4b Fengnan Chang     2026-07-01   993  
335d4b6201ac31 Christoph Hellwig 2026-07-29   994  	if (iomi->iomap.type != IOMAP_MAPPED ||
335d4b6201ac31 Christoph Hellwig 2026-07-29   995  	    iomi->iomap.offset + iomi->iomap.length < iomi->pos + iomi->len ||
335d4b6201ac31 Christoph Hellwig 2026-07-29  @996  	    (iomi->iomap.flags & IOMAP_F_INTEGRITY)) {
36f199c8d0ee4b Fengnan Chang     2026-07-01   997  		ret = -ENOTBLK;
335d4b6201ac31 Christoph Hellwig 2026-07-29   998  		goto out_dio_end;
36f199c8d0ee4b Fengnan Chang     2026-07-01   999  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1000  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1001  	alignment = iomap_dio_alignment(iomi->inode, iomi->iomap.bdev, 0);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1002  	if ((iomi->pos | iomi->len) & (alignment - 1)) {
36f199c8d0ee4b Fengnan Chang     2026-07-01  1003  		ret = -EINVAL;
335d4b6201ac31 Christoph Hellwig 2026-07-29  1004  		goto out_dio_end;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1005  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1006  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1007  	if (unlikely(!iomi->inode->i_sb->s_dio_done_wq &&
335d4b6201ac31 Christoph Hellwig 2026-07-29  1008  			!is_sync_kiocb(iocb))) {
335d4b6201ac31 Christoph Hellwig 2026-07-29  1009  		ret = sb_init_dio_done_wq(iomi->inode->i_sb);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1010  		if (ret < 0)
335d4b6201ac31 Christoph Hellwig 2026-07-29  1011  			goto out_dio_end;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1012  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1013  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1014  	trace_iomap_dio_rw_begin(iocb, iter, 0, 0);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1015  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1016  	bio = bio_alloc_bioset(iomi->iomap.bdev,
36f199c8d0ee4b Fengnan Chang     2026-07-01  1017  			       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
36f199c8d0ee4b Fengnan Chang     2026-07-01  1018  			       REQ_OP_READ, GFP_KERNEL, &iomap_dio_simple_pool);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1019  	sr = container_of(bio, struct iomap_dio_simple, bio);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1020  	sr->iocb = iocb;
335d4b6201ac31 Christoph Hellwig 2026-07-29  1021  	sr->dio_flags = 0;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1022  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1023  	bio->bi_iter.bi_sector = iomap_sector(&iomi->iomap, iomi->pos);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1024  	bio->bi_ioprio = iocb->ki_ioprio;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1025  
36f199c8d0ee4b Fengnan Chang     2026-07-01  1026  	ret = bio_iov_iter_get_pages(bio, iter, alignment - 1);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1027  	if (unlikely(ret))
36f199c8d0ee4b Fengnan Chang     2026-07-01  1028  		goto out_bio_put;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1029  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1030  	if (bio->bi_iter.bi_size != iomi->len) {
36f199c8d0ee4b Fengnan Chang     2026-07-01  1031  		iov_iter_revert(iter, bio->bi_iter.bi_size);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1032  		ret = -ENOTBLK;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1033  		goto out_bio_release_pages;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1034  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1035  
36f199c8d0ee4b Fengnan Chang     2026-07-01  1036  	sr->size = bio->bi_iter.bi_size;
335d4b6201ac31 Christoph Hellwig 2026-07-29  1037  	if (user_backed_iter(iter)) {
36f199c8d0ee4b Fengnan Chang     2026-07-01  1038  		bio_set_pages_dirty(bio);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1039  		sr->dio_flags |= IOMAP_DIO_USER_BACKED;
335d4b6201ac31 Christoph Hellwig 2026-07-29  1040  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1041  
36f199c8d0ee4b Fengnan Chang     2026-07-01  1042  	if (iocb->ki_flags & IOCB_NOWAIT)
36f199c8d0ee4b Fengnan Chang     2026-07-01  1043  		bio->bi_opf |= REQ_NOWAIT;
335d4b6201ac31 Christoph Hellwig 2026-07-29  1044  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1045  	if (is_sync_kiocb(iocb)) {
335d4b6201ac31 Christoph Hellwig 2026-07-29  1046  		submit_bio_wait(bio);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1047  		return iomap_dio_simple_complete(sr);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1048  	}
335d4b6201ac31 Christoph Hellwig 2026-07-29  1049  
335d4b6201ac31 Christoph Hellwig 2026-07-29  1050  	if ((iocb->ki_flags & IOCB_HIPRI)) {
36f199c8d0ee4b Fengnan Chang     2026-07-01  1051  		bio->bi_opf |= REQ_POLLED;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1052  		WRITE_ONCE(iocb->private, bio);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1053  	}
36f199c8d0ee4b Fengnan Chang     2026-07-01  1054  	bio->bi_end_io = iomap_dio_simple_end_io;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1055  	submit_bio(bio);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1056  	trace_iomap_dio_rw_queued(iomi->inode, iocb->ki_pos, iomi->len);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1057  	return -EIOCBQUEUED;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1058  
36f199c8d0ee4b Fengnan Chang     2026-07-01  1059  out_bio_release_pages:
36f199c8d0ee4b Fengnan Chang     2026-07-01  1060  	bio_release_pages(bio, false);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1061  out_bio_put:
36f199c8d0ee4b Fengnan Chang     2026-07-01  1062  	bio_put(bio);
335d4b6201ac31 Christoph Hellwig 2026-07-29  1063  out_dio_end:
335d4b6201ac31 Christoph Hellwig 2026-07-29  1064  	inode_dio_end(iomi->inode);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1065  	return ret;
36f199c8d0ee4b Fengnan Chang     2026-07-01  1066  }
335d4b6201ac31 Christoph Hellwig 2026-07-29  1067  EXPORT_SYMBOL_GPL(__iomap_dio_read_simple);
36f199c8d0ee4b Fengnan Chang     2026-07-01  1068  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
