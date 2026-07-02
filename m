Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95494412299
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987036; cv=none; b=AM7vMeVxlgdYglwBA0e/q5m+VX+RXEZ6+S4/l6suz3T9ZTFsdlPHwD5JgUviSRh8qKEcjRS3akomg81krLywuQ8sE7rv6VNFIW9JrdXiuRXJ2YoiafaH9+sTtY4kVutcvZlnuNZXD2MlxldNxER1K+Ot4o4Hl9Gfhh4psz9qPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987036; c=relaxed/simple;
	bh=vK0mqSXrIcj9YF2e2z0Z3ObwNyVS7kx/5g9gxULR41Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bkvM5Z0DBuELPKzcX5PHwtbvV8wSHxqc7o7Lu0fzACcxExE3/iYDRYHCNapm00tQX9vND/iRwB3uvaRdSJGBQjoVvo8UJPAWTTsotFA7EoWbSU6P3IpIQvFo4+moscxb1WsM+ism8b35J+HXjeb+etYOLU/Jjtd2+Lls2yW6CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXtDk9P2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXtDk9P2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782987034; x=1814523034;
  h=date:from:to:cc:subject:message-id;
  bh=vK0mqSXrIcj9YF2e2z0Z3ObwNyVS7kx/5g9gxULR41Y=;
  b=cXtDk9P2uN4C2JK336MV1iJwFqV6gswuj5MWuQ8p0mBSxR+UNp7GsVPS
   Rkv3/3HeckzbVS5ZxOTCZUFZV15n4vrGUyYGfAyu2cdH1IQdDmPxhQeCY
   Y3ggrTR/8NSXhsNOog/XOTM/FhweMxKXd8jAfPqXWFmyXB3mreK1kNPyr
   ecCz+4QtrgpTBpPuzUfMuE8aGuYcByshObZBAPRNpj+NfKOEPJfpLLLlA
   Yx3kozTtqnOpG8YbXEL+27lPCiXvtY/d/qDFWvsBKJxioV6bhFUBTxPhU
   d+QMlyYJcpmNpebzaTsx/t9zlKswCQciQg+I+gERlUVFwJYZdAAQX0C+2
   w==;
X-CSE-ConnectionGUID: Puixuiw0QJ2hK4t6JujxqQ==
X-CSE-MsgGUID: 0czgIja7SaCLoQjtbPxRlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94337931"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94337931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:10:33 -0700
X-CSE-ConnectionGUID: xUI2LLRVQNilQsbvlw8WjA==
X-CSE-MsgGUID: DlU+6aIZTmyY61YjyQYWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248370150"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 03:10:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfENC-00000000Afn-0o2o;
	Thu, 02 Jul 2026 10:10:24 +0000
Date: Thu, 02 Jul 2026 18:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.all 117/195] fs/iomap/direct-io.c:1074
 iomap_dio_simple() warn: bitwise AND condition is false here
Message-ID: <202607021845.yVHnfllM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Fengnan Chang <changfengnan@bytedance.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   cf6f88615485a68df77092de1f90f88708a32fa6
commit: c45650e4f8ba25d02e860094a77bf85ec3a35f13 [117/195] iomap: add simple dio path for small direct I/O
:::::: branch date: 2 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021845.yVHnfllM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021845.yVHnfllM-lkp@intel.com/

New smatch warnings:
fs/iomap/direct-io.c:1074 iomap_dio_simple() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/direct-io.c:376 iomap_dio_bio_iter_one() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here

vim +1074 fs/iomap/direct-io.c

c45650e4f8ba25 Fengnan Chang 2026-07-01  1002  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1003  /*
c45650e4f8ba25 Fengnan Chang 2026-07-01  1004   * Fast path for small, block-aligned direct I/Os that map to a single
c45650e4f8ba25 Fengnan Chang 2026-07-01  1005   * contiguous on-disk extent.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1006   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1007   * iomap_dio_simple_supported() enforces the cheap up-front constraints before
c45650e4f8ba25 Fengnan Chang 2026-07-01  1008   * entering this path.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1009   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1010   * @dops must be NULL: a non-NULL @dops means the caller wants its
c45650e4f8ba25 Fengnan Chang 2026-07-01  1011   * ->end_io / ->submit_io hooks invoked, and in particular wants its bios to be
c45650e4f8ba25 Fengnan Chang 2026-07-01  1012   * allocated from the filesystem-private @dops->bio_set (whose front_pad sizes a
c45650e4f8ba25 Fengnan Chang 2026-07-01  1013   * filesystem-private wrapper around the bio).  The fast path instead allocates
c45650e4f8ba25 Fengnan Chang 2026-07-01  1014   * from the shared iomap_dio_simple_pool, whose front_pad matches struct
c45650e4f8ba25 Fengnan Chang 2026-07-01  1015   * iomap_dio_simple; the two wrappers are not interchangeable, so we must fall
c45650e4f8ba25 Fengnan Chang 2026-07-01  1016   * back to __iomap_dio_rw() in that case.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1017   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1018   * @done_before must be zero: a non-zero caller-accumulated residual cannot be
c45650e4f8ba25 Fengnan Chang 2026-07-01  1019   * carried through a single-bio inline completion.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1020   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1021   * @iter must describe a non-empty READ no larger than the inode block size:
c45650e4f8ba25 Fengnan Chang 2026-07-01  1022   * writes, zero-length I/O, and larger requests need the generic iomap direct
c45650e4f8ba25 Fengnan Chang 2026-07-01  1023   * I/O path.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1024   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1025   * @dio_flags must not request IOMAP_DIO_FORCE_WAIT, IOMAP_DIO_PARTIAL, or
c45650e4f8ba25 Fengnan Chang 2026-07-01  1026   * IOMAP_DIO_BOUNCE: this path does not support forced waiting, partial direct
c45650e4f8ba25 Fengnan Chang 2026-07-01  1027   * I/O, or bouncing.  The range must also stay within i_size and encrypted
c45650e4f8ba25 Fengnan Chang 2026-07-01  1028   * inodes must use the generic iomap direct I/O path.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1029   *
c45650e4f8ba25 Fengnan Chang 2026-07-01  1030   * -ENOTBLK is the private sentinel returned by iomap_dio_simple() when it
c45650e4f8ba25 Fengnan Chang 2026-07-01  1031   * decides the request does not fit the fast path.  In that case we proceed to
c45650e4f8ba25 Fengnan Chang 2026-07-01  1032   * the generic __iomap_dio_rw() slow path.  Any other errno is a real result and
c45650e4f8ba25 Fengnan Chang 2026-07-01  1033   * is propagated as-is, in particular -EAGAIN for IOCB_NOWAIT must reach the
c45650e4f8ba25 Fengnan Chang 2026-07-01  1034   * caller.
c45650e4f8ba25 Fengnan Chang 2026-07-01  1035   */
c45650e4f8ba25 Fengnan Chang 2026-07-01  1036  static ssize_t
c45650e4f8ba25 Fengnan Chang 2026-07-01  1037  iomap_dio_simple(struct kiocb *iocb, struct iov_iter *iter,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1038  		 const struct iomap_ops *ops, void *private,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1039  		 unsigned int dio_flags)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1040  {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1041  	struct inode *inode = file_inode(iocb->ki_filp);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1042  	size_t count = iov_iter_count(iter);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1043  	bool wait_for_completion = is_sync_kiocb(iocb);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1044  	struct iomap_iter iomi = {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1045  		.inode		= inode,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1046  		.pos		= iocb->ki_pos,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1047  		.len		= count,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1048  		.flags		= IOMAP_DIRECT,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1049  		.private	= private,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1050  	};
c45650e4f8ba25 Fengnan Chang 2026-07-01  1051  	struct iomap_dio_simple *sr;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1052  	unsigned int alignment;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1053  	struct bio *bio;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1054  	ssize_t ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1055  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1056  	if (iocb->ki_flags & IOCB_NOWAIT)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1057  		iomi.flags |= IOMAP_NOWAIT;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1058  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1059  	ret = kiocb_write_and_wait(iocb, count);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1060  	if (ret)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1061  		return ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1062  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1063  	inode_dio_begin(inode);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1064  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1065  	ret = ops->iomap_begin(inode, iomi.pos, count, iomi.flags,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1066  			       &iomi.iomap, &iomi.srcmap);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1067  	if (ret) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1068  		inode_dio_end(inode);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1069  		return ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1070  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1071  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1072  	if (iomi.iomap.type != IOMAP_MAPPED ||
c45650e4f8ba25 Fengnan Chang 2026-07-01  1073  	    iomi.iomap.offset + iomi.iomap.length < iomi.pos + count ||
c45650e4f8ba25 Fengnan Chang 2026-07-01 @1074  	    (iomi.iomap.flags & IOMAP_F_INTEGRITY)) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1075  		ret = -ENOTBLK;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1076  		goto out_iomap_end;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1077  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1078  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1079  	alignment = iomap_dio_alignment(inode, iomi.iomap.bdev, dio_flags);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1080  	if ((iomi.pos | count) & (alignment - 1)) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1081  		ret = -EINVAL;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1082  		goto out_iomap_end;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1083  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1084  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1085  	if (!wait_for_completion && unlikely(!inode->i_sb->s_dio_done_wq)) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1086  		ret = sb_init_dio_done_wq(inode->i_sb);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1087  		if (ret < 0)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1088  			goto out_iomap_end;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1089  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1090  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1091  	trace_iomap_dio_rw_begin(iocb, iter, dio_flags, 0);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1092  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1093  	if (user_backed_iter(iter))
c45650e4f8ba25 Fengnan Chang 2026-07-01  1094  		dio_flags |= IOMAP_DIO_USER_BACKED;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1095  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1096  	bio = bio_alloc_bioset(iomi.iomap.bdev,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1097  			       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
c45650e4f8ba25 Fengnan Chang 2026-07-01  1098  			       REQ_OP_READ, GFP_KERNEL, &iomap_dio_simple_pool);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1099  	sr = container_of(bio, struct iomap_dio_simple, bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1100  	sr->iocb = iocb;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1101  	sr->dio_flags = dio_flags;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1102  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1103  	bio->bi_iter.bi_sector = iomap_sector(&iomi.iomap, iomi.pos);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1104  	bio->bi_ioprio = iocb->ki_ioprio;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1105  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1106  	ret = bio_iov_iter_get_pages(bio, iter, alignment - 1);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1107  	if (unlikely(ret))
c45650e4f8ba25 Fengnan Chang 2026-07-01  1108  		goto out_bio_put;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1109  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1110  	if (bio->bi_iter.bi_size != count) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1111  		iov_iter_revert(iter, bio->bi_iter.bi_size);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1112  		ret = -ENOTBLK;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1113  		goto out_bio_release_pages;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1114  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1115  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1116  	sr->size = bio->bi_iter.bi_size;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1117  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1118  	if (dio_flags & IOMAP_DIO_USER_BACKED)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1119  		bio_set_pages_dirty(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1120  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1121  	if (iocb->ki_flags & IOCB_NOWAIT)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1122  		bio->bi_opf |= REQ_NOWAIT;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1123  	if ((iocb->ki_flags & IOCB_HIPRI) && !wait_for_completion) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1124  		bio->bi_opf |= REQ_POLLED;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1125  		WRITE_ONCE(iocb->private, bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1126  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1127  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1128  	if (ops->iomap_end)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1129  		ops->iomap_end(inode, iomi.pos, count, count, iomi.flags,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1130  			       &iomi.iomap);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1131  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1132  	if (!wait_for_completion) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  1133  		bio->bi_end_io = iomap_dio_simple_end_io;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1134  		submit_bio(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1135  		trace_iomap_dio_rw_queued(inode, iomi.pos, count);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1136  		return -EIOCBQUEUED;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1137  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  1138  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1139  	submit_bio_wait(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1140  	return iomap_dio_simple_complete(sr);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1141  
c45650e4f8ba25 Fengnan Chang 2026-07-01  1142  out_bio_release_pages:
c45650e4f8ba25 Fengnan Chang 2026-07-01  1143  	bio_release_pages(bio, false);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1144  out_bio_put:
c45650e4f8ba25 Fengnan Chang 2026-07-01  1145  	bio_put(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1146  out_iomap_end:
c45650e4f8ba25 Fengnan Chang 2026-07-01  1147  	if (ops->iomap_end)
c45650e4f8ba25 Fengnan Chang 2026-07-01  1148  		ops->iomap_end(inode, iomi.pos, count, 0, iomi.flags,
c45650e4f8ba25 Fengnan Chang 2026-07-01  1149  			       &iomi.iomap);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1150  	inode_dio_end(inode);
c45650e4f8ba25 Fengnan Chang 2026-07-01  1151  	return ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  1152  }
c45650e4f8ba25 Fengnan Chang 2026-07-01  1153  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
