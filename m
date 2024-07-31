Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B517557
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439550; cv=none; b=NlIcRDn68p4XTgqSrnwim1Rrru/ErcdaXiv1/zQDvXhxhSnzbh2Wd2Ut6YrwuhS/8AoXtn4FvVy3USbkV2LHdoViwrzVfcQEerfW4QtIDFY13/gQT50TjBfSzc9MWktA2oj5qxLTwnWNJi4ljVZOxOuQLnfEQqrTRVnSQNOD9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439550; c=relaxed/simple;
	bh=ZB8uUj2T1qTxSl7At8+MKwxxDSkABxgkk+krYuAXoEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twIO0fQRRW+1GDkbmNLoj0s0noUMCl1bTQyVyT8N4EL8aNI6to+t3vSUn6PSpaHyXfyQnFe1MDBjSckw4Xzx2K7/Ek1yTLHbrNSkAyxqTAqSlO8Bk77rniUnYag2p0SseW4UCXARjS8qT0g9/HmXMxhcL/98C9ohmt1+rvQcTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn9TyS2r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn9TyS2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722439549; x=1753975549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB8uUj2T1qTxSl7At8+MKwxxDSkABxgkk+krYuAXoEE=;
  b=hn9TyS2r12gaBXkufzVLHSDi35RkwJ6I2jq9pqo5YOHqWJNZxOMeBlXo
   kTN2wgaWUCKSZA4t2HpJMg0uGDXegEnKPdmvWYo2u/MG2paO/oHQeA89p
   uK2qsuAJNSRHBA4xh8bxJFeDoar79SWR+9JVwZCKCMs3ikIgbcI9h8zov
   1wmiTViHQNdHj37oPyl/L53PWXA1Kgm7vnSWG/OPPcSYe/btOlgUoIFwL
   BwuF9zxUpkptwdbzIBdp7ElS/uVo2MN8ao5E03JaEaVg8Dy4c2z0D58Il
   BqHN5bTED2ts6kp5VFhgUM7JqAEDu5onqdxV/0e0GRiIGLf+9FY1CazxE
   A==;
X-CSE-ConnectionGUID: hWx0LMw7QSe0D+qDz/RKJA==
X-CSE-MsgGUID: yWyq9a8HT0WAkoSqDm9LkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24119154"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="24119154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:25:48 -0700
X-CSE-ConnectionGUID: 67mBLA54QbuFpgkI/VedOg==
X-CSE-MsgGUID: kPFkVoe4Tn6i39k3zyE7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="55313295"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2024 08:25:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZBCy-000uVw-0d;
	Wed, 31 Jul 2024 15:25:44 +0000
Date: Wed, 31 Jul 2024 23:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:iou/discard 13/13] block/ioctl.c:206
 blkdev_cmd_queue_discard() error: we previously assumed 'bio' could be null
 (see line 199)
Message-ID: <202407312305.YVmb427T-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux iou/discard
head:   444b80e47399c01839870b7d75c968fc0e438b29
commit: 444b80e47399c01839870b7d75c968fc0e438b29 [13/13] block: implement io_uring discard cmd
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240730 (https://download.01.org/0day-ci/archive/20240731/202407312305.YVmb427T-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407312305.YVmb427T-lkp@intel.com/

smatch warnings:
block/ioctl.c:206 blkdev_cmd_queue_discard() error: we previously assumed 'bio' could be null (see line 199)

vim +/bio +206 block/ioctl.c

d30a2605be9d51 David Woodhouse 2008-08-11  175  
444b80e47399c0 Pavel Begunkov  2024-07-20  176  int blkdev_cmd_queue_discard(struct io_uring_cmd *cmd,
444b80e47399c0 Pavel Begunkov  2024-07-20  177  			     uint64_t start, uint64_t len, bool nowait,
444b80e47399c0 Pavel Begunkov  2024-07-20  178  			     void (*end_io)(struct bio *))
444b80e47399c0 Pavel Begunkov  2024-07-20  179  {
444b80e47399c0 Pavel Begunkov  2024-07-20  180  	struct file *file = cmd->file;
444b80e47399c0 Pavel Begunkov  2024-07-20  181  	struct block_device *bdev = I_BDEV(file->f_mapping->host);
444b80e47399c0 Pavel Begunkov  2024-07-20  182  	sector_t sector = start >> SECTOR_SHIFT;
444b80e47399c0 Pavel Begunkov  2024-07-20  183  	sector_t nr_sects = len >> SECTOR_SHIFT;
444b80e47399c0 Pavel Begunkov  2024-07-20  184  	struct bio *prev = NULL, *bio;
444b80e47399c0 Pavel Begunkov  2024-07-20  185  	int err;
444b80e47399c0 Pavel Begunkov  2024-07-20  186  
444b80e47399c0 Pavel Begunkov  2024-07-20  187  	err = blk_check_discard(bdev, file_to_blk_mode(file), start, len);
444b80e47399c0 Pavel Begunkov  2024-07-20  188  	if (err)
444b80e47399c0 Pavel Begunkov  2024-07-20  189  		return err;
444b80e47399c0 Pavel Begunkov  2024-07-20  190  
444b80e47399c0 Pavel Begunkov  2024-07-20  191  	err = filemap_invalidate_pages(bdev->bd_mapping, start,
444b80e47399c0 Pavel Begunkov  2024-07-20  192  					start + len - 1, nowait);
444b80e47399c0 Pavel Begunkov  2024-07-20  193  	if (err)
444b80e47399c0 Pavel Begunkov  2024-07-20  194  		return err;
444b80e47399c0 Pavel Begunkov  2024-07-20  195  
444b80e47399c0 Pavel Begunkov  2024-07-20  196  	while (1) {
444b80e47399c0 Pavel Begunkov  2024-07-20  197  		bio = blk_alloc_discard_bio(bdev, &sector, &nr_sects,
444b80e47399c0 Pavel Begunkov  2024-07-20  198  					    GFP_KERNEL);
444b80e47399c0 Pavel Begunkov  2024-07-20 @199  		if (!bio)
444b80e47399c0 Pavel Begunkov  2024-07-20  200  			break;
444b80e47399c0 Pavel Begunkov  2024-07-20  201  		if (nowait)
444b80e47399c0 Pavel Begunkov  2024-07-20  202  			bio->bi_opf |= REQ_NOWAIT;
444b80e47399c0 Pavel Begunkov  2024-07-20  203  		prev = bio_chain_and_submit(prev, bio);
444b80e47399c0 Pavel Begunkov  2024-07-20  204  	}
444b80e47399c0 Pavel Begunkov  2024-07-20  205  
444b80e47399c0 Pavel Begunkov  2024-07-20 @206  	bio->bi_private = cmd;
444b80e47399c0 Pavel Begunkov  2024-07-20  207  	bio->bi_end_io = end_io;
444b80e47399c0 Pavel Begunkov  2024-07-20  208  
444b80e47399c0 Pavel Begunkov  2024-07-20  209  	if (nr_sects) {
444b80e47399c0 Pavel Begunkov  2024-07-20  210  		bio->bi_status = BLK_STS_AGAIN;
444b80e47399c0 Pavel Begunkov  2024-07-20  211  		bio_put(bio);
444b80e47399c0 Pavel Begunkov  2024-07-20  212  		return -EIOCBQUEUED;
444b80e47399c0 Pavel Begunkov  2024-07-20  213  	}
444b80e47399c0 Pavel Begunkov  2024-07-20  214  	submit_bio(bio);
444b80e47399c0 Pavel Begunkov  2024-07-20  215  	return -EIOCBQUEUED;
444b80e47399c0 Pavel Begunkov  2024-07-20  216  }
444b80e47399c0 Pavel Begunkov  2024-07-20  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
