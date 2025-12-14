Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7133632
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765754334; cv=none; b=ZVP/DnN39ILb80HbVn5NXbfkJ4mrfnl5Y/B/0NXUw0ny/BHhA0w3LTMkkJsyMVgLlhEKzxPnwYMFgeZ7aPb7TsK3xb3ugx7YQqBVAUGrLOiHljbFMcH0OK8DUWxa+VBJ2yjrdkjDsgUXs5I7ZFvZGLHjkS2HjbBt9PZBfaxfp5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765754334; c=relaxed/simple;
	bh=t+NOeeviK5RRdDJwkY82KFllCGoFK3NDVs3OGWJQ5x0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3THBmp8bMHnNBqeoap2qtnc3vvXraLplr9W3pqnGlhcV0E5m1qK4AQ7AwO2Sq+QBatZmzpnwhHCGeGfIjT5ExI+tls+N35OOb6B/ef6vSfNFfDJ3wCB55Np7sWTu4dxfogbzJMNvhjdhdusvlMRJBciRXko4QI54r7PgCUHm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBjaIit2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBjaIit2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765754333; x=1797290333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+NOeeviK5RRdDJwkY82KFllCGoFK3NDVs3OGWJQ5x0=;
  b=BBjaIit298OoxmtL79aw9NQHxbqDEjbKSG1gz5qKpG0hpPfsaR0cpeLB
   aZ60vnfOI5P6re++/EggojK0vqb3bjn2eVg7fTeHkmUasXf9ve0SiIeyq
   1jyeP4Mh6y3gHRnqTlbGDJzlugU4c0WlLowro6o4G5pTCaLmP++qnPXet
   +suKpQ4sLKITIxKDkdef9H2aWaPLG/y82R8+bUQwZHqjPIKoqmxhdIt6i
   IZwkHAm/sbi0UuNr8blXS/ZfZFH3go93Jvg/BaFggH4vXOTy3xpSOed9C
   9KDtxc7AMMbhclZx6WmUSmWA5x/9XwmrpqYXZY0Ek5cmpwBwH438hZw1z
   Q==;
X-CSE-ConnectionGUID: adN5UUlIQKG/mzuxk1ga+Q==
X-CSE-MsgGUID: w4Ht14dDTzWANw9pUD4rlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66644928"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66644928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:18:52 -0800
X-CSE-ConnectionGUID: XvAQEK33Ql2j51GHUUdK7g==
X-CSE-MsgGUID: 1esTgeTKSLuJUToV0HEJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197864785"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2025 15:18:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvMW-000000009U9-3YUk;
	Sun, 14 Dec 2025 23:18:48 +0000
Date: Mon, 15 Dec 2025 07:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/block/zloop.c:494:0-1: preceding lock on line 407
Message-ID: <202512150752.gDKr4ykQ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: eb0570c7df23c2f32fe899fcdaf8fca9a5ecd51e block: new zoned loop block device driver
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-054-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150752.gDKr4ykQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512150752.gDKr4ykQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/zloop.c:494:0-1: preceding lock on line 407

vim +494 drivers/block/zloop.c

eb0570c7df23c2 Damien Le Moal 2025-04-07  357  
eb0570c7df23c2 Damien Le Moal 2025-04-07  358  static void zloop_rw(struct zloop_cmd *cmd)
eb0570c7df23c2 Damien Le Moal 2025-04-07  359  {
eb0570c7df23c2 Damien Le Moal 2025-04-07  360  	struct request *rq = blk_mq_rq_from_pdu(cmd);
eb0570c7df23c2 Damien Le Moal 2025-04-07  361  	struct zloop_device *zlo = rq->q->queuedata;
eb0570c7df23c2 Damien Le Moal 2025-04-07  362  	unsigned int zone_no = rq_zone_no(rq);
eb0570c7df23c2 Damien Le Moal 2025-04-07  363  	sector_t sector = blk_rq_pos(rq);
eb0570c7df23c2 Damien Le Moal 2025-04-07  364  	sector_t nr_sectors = blk_rq_sectors(rq);
eb0570c7df23c2 Damien Le Moal 2025-04-07  365  	bool is_append = req_op(rq) == REQ_OP_ZONE_APPEND;
eb0570c7df23c2 Damien Le Moal 2025-04-07  366  	bool is_write = req_op(rq) == REQ_OP_WRITE || is_append;
eb0570c7df23c2 Damien Le Moal 2025-04-07  367  	int rw = is_write ? ITER_SOURCE : ITER_DEST;
eb0570c7df23c2 Damien Le Moal 2025-04-07  368  	struct req_iterator rq_iter;
eb0570c7df23c2 Damien Le Moal 2025-04-07  369  	struct zloop_zone *zone;
eb0570c7df23c2 Damien Le Moal 2025-04-07  370  	struct iov_iter iter;
eb0570c7df23c2 Damien Le Moal 2025-04-07  371  	struct bio_vec tmp;
eb0570c7df23c2 Damien Le Moal 2025-04-07  372  	sector_t zone_end;
eb0570c7df23c2 Damien Le Moal 2025-04-07  373  	int nr_bvec = 0;
eb0570c7df23c2 Damien Le Moal 2025-04-07  374  	int ret;
eb0570c7df23c2 Damien Le Moal 2025-04-07  375  
eb0570c7df23c2 Damien Le Moal 2025-04-07  376  	atomic_set(&cmd->ref, 2);
eb0570c7df23c2 Damien Le Moal 2025-04-07  377  	cmd->sector = sector;
eb0570c7df23c2 Damien Le Moal 2025-04-07  378  	cmd->nr_sectors = nr_sectors;
eb0570c7df23c2 Damien Le Moal 2025-04-07  379  	cmd->ret = 0;
eb0570c7df23c2 Damien Le Moal 2025-04-07  380  
eb0570c7df23c2 Damien Le Moal 2025-04-07  381  	/* We should never get an I/O beyond the device capacity. */
eb0570c7df23c2 Damien Le Moal 2025-04-07  382  	if (WARN_ON_ONCE(zone_no >= zlo->nr_zones)) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  383  		ret = -EIO;
eb0570c7df23c2 Damien Le Moal 2025-04-07  384  		goto out;
eb0570c7df23c2 Damien Le Moal 2025-04-07  385  	}
eb0570c7df23c2 Damien Le Moal 2025-04-07  386  	zone = &zlo->zones[zone_no];
eb0570c7df23c2 Damien Le Moal 2025-04-07  387  	zone_end = zone->start + zlo->zone_capacity;
eb0570c7df23c2 Damien Le Moal 2025-04-07  388  
eb0570c7df23c2 Damien Le Moal 2025-04-07  389  	/*
eb0570c7df23c2 Damien Le Moal 2025-04-07  390  	 * The block layer should never send requests that are not fully
eb0570c7df23c2 Damien Le Moal 2025-04-07  391  	 * contained within the zone.
eb0570c7df23c2 Damien Le Moal 2025-04-07  392  	 */
eb0570c7df23c2 Damien Le Moal 2025-04-07  393  	if (WARN_ON_ONCE(sector + nr_sectors > zone->start + zlo->zone_size)) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  394  		ret = -EIO;
eb0570c7df23c2 Damien Le Moal 2025-04-07  395  		goto out;
eb0570c7df23c2 Damien Le Moal 2025-04-07  396  	}
eb0570c7df23c2 Damien Le Moal 2025-04-07  397  
eb0570c7df23c2 Damien Le Moal 2025-04-07  398  	if (test_and_clear_bit(ZLOOP_ZONE_SEQ_ERROR, &zone->flags)) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  399  		mutex_lock(&zone->lock);
eb0570c7df23c2 Damien Le Moal 2025-04-07  400  		ret = zloop_update_seq_zone(zlo, zone_no);
eb0570c7df23c2 Damien Le Moal 2025-04-07  401  		mutex_unlock(&zone->lock);
eb0570c7df23c2 Damien Le Moal 2025-04-07  402  		if (ret)
eb0570c7df23c2 Damien Le Moal 2025-04-07  403  			goto out;
eb0570c7df23c2 Damien Le Moal 2025-04-07  404  	}
eb0570c7df23c2 Damien Le Moal 2025-04-07  405  
eb0570c7df23c2 Damien Le Moal 2025-04-07  406  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write) {
eb0570c7df23c2 Damien Le Moal 2025-04-07 @407  		mutex_lock(&zone->lock);
eb0570c7df23c2 Damien Le Moal 2025-04-07  408  
eb0570c7df23c2 Damien Le Moal 2025-04-07  409  		if (is_append) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  410  			sector = zone->wp;
eb0570c7df23c2 Damien Le Moal 2025-04-07  411  			cmd->sector = sector;
eb0570c7df23c2 Damien Le Moal 2025-04-07  412  		}
eb0570c7df23c2 Damien Le Moal 2025-04-07  413  
eb0570c7df23c2 Damien Le Moal 2025-04-07  414  		/*
eb0570c7df23c2 Damien Le Moal 2025-04-07  415  		 * Write operations must be aligned to the write pointer and
eb0570c7df23c2 Damien Le Moal 2025-04-07  416  		 * fully contained within the zone capacity.
eb0570c7df23c2 Damien Le Moal 2025-04-07  417  		 */
eb0570c7df23c2 Damien Le Moal 2025-04-07  418  		if (sector != zone->wp || zone->wp + nr_sectors > zone_end) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  419  			pr_err("Zone %u: unaligned write: sect %llu, wp %llu\n",
eb0570c7df23c2 Damien Le Moal 2025-04-07  420  			       zone_no, sector, zone->wp);
eb0570c7df23c2 Damien Le Moal 2025-04-07  421  			ret = -EIO;
eb0570c7df23c2 Damien Le Moal 2025-04-07  422  			goto unlock;
eb0570c7df23c2 Damien Le Moal 2025-04-07  423  		}
eb0570c7df23c2 Damien Le Moal 2025-04-07  424  
eb0570c7df23c2 Damien Le Moal 2025-04-07  425  		/* Implicitly open the target zone. */
eb0570c7df23c2 Damien Le Moal 2025-04-07  426  		if (zone->cond == BLK_ZONE_COND_CLOSED ||
eb0570c7df23c2 Damien Le Moal 2025-04-07  427  		    zone->cond == BLK_ZONE_COND_EMPTY)
eb0570c7df23c2 Damien Le Moal 2025-04-07  428  			zone->cond = BLK_ZONE_COND_IMP_OPEN;
eb0570c7df23c2 Damien Le Moal 2025-04-07  429  
eb0570c7df23c2 Damien Le Moal 2025-04-07  430  		/*
eb0570c7df23c2 Damien Le Moal 2025-04-07  431  		 * Advance the write pointer of sequential zones. If the write
eb0570c7df23c2 Damien Le Moal 2025-04-07  432  		 * fails, the wp position will be corrected when the next I/O
eb0570c7df23c2 Damien Le Moal 2025-04-07  433  		 * copmpletes.
eb0570c7df23c2 Damien Le Moal 2025-04-07  434  		 */
eb0570c7df23c2 Damien Le Moal 2025-04-07  435  		zone->wp += nr_sectors;
eb0570c7df23c2 Damien Le Moal 2025-04-07  436  		if (zone->wp == zone_end)
eb0570c7df23c2 Damien Le Moal 2025-04-07  437  			zone->cond = BLK_ZONE_COND_FULL;
eb0570c7df23c2 Damien Le Moal 2025-04-07  438  	}
eb0570c7df23c2 Damien Le Moal 2025-04-07  439  
eb0570c7df23c2 Damien Le Moal 2025-04-07  440  	rq_for_each_bvec(tmp, rq, rq_iter)
eb0570c7df23c2 Damien Le Moal 2025-04-07  441  		nr_bvec++;
eb0570c7df23c2 Damien Le Moal 2025-04-07  442  
eb0570c7df23c2 Damien Le Moal 2025-04-07  443  	if (rq->bio != rq->biotail) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  444  		struct bio_vec *bvec;
eb0570c7df23c2 Damien Le Moal 2025-04-07  445  
eb0570c7df23c2 Damien Le Moal 2025-04-07  446  		cmd->bvec = kmalloc_array(nr_bvec, sizeof(*cmd->bvec), GFP_NOIO);
eb0570c7df23c2 Damien Le Moal 2025-04-07  447  		if (!cmd->bvec) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  448  			ret = -EIO;
eb0570c7df23c2 Damien Le Moal 2025-04-07  449  			goto unlock;
eb0570c7df23c2 Damien Le Moal 2025-04-07  450  		}
eb0570c7df23c2 Damien Le Moal 2025-04-07  451  
eb0570c7df23c2 Damien Le Moal 2025-04-07  452  		/*
eb0570c7df23c2 Damien Le Moal 2025-04-07  453  		 * The bios of the request may be started from the middle of
eb0570c7df23c2 Damien Le Moal 2025-04-07  454  		 * the 'bvec' because of bio splitting, so we can't directly
eb0570c7df23c2 Damien Le Moal 2025-04-07  455  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
eb0570c7df23c2 Damien Le Moal 2025-04-07  456  		 * API will take care of all details for us.
eb0570c7df23c2 Damien Le Moal 2025-04-07  457  		 */
eb0570c7df23c2 Damien Le Moal 2025-04-07  458  		bvec = cmd->bvec;
eb0570c7df23c2 Damien Le Moal 2025-04-07  459  		rq_for_each_bvec(tmp, rq, rq_iter) {
eb0570c7df23c2 Damien Le Moal 2025-04-07  460  			*bvec = tmp;
eb0570c7df23c2 Damien Le Moal 2025-04-07  461  			bvec++;
eb0570c7df23c2 Damien Le Moal 2025-04-07  462  		}
eb0570c7df23c2 Damien Le Moal 2025-04-07  463  		iov_iter_bvec(&iter, rw, cmd->bvec, nr_bvec, blk_rq_bytes(rq));
eb0570c7df23c2 Damien Le Moal 2025-04-07  464  	} else {
eb0570c7df23c2 Damien Le Moal 2025-04-07  465  		/*
eb0570c7df23c2 Damien Le Moal 2025-04-07  466  		 * Same here, this bio may be started from the middle of the
eb0570c7df23c2 Damien Le Moal 2025-04-07  467  		 * 'bvec' because of bio splitting, so offset from the bvec
eb0570c7df23c2 Damien Le Moal 2025-04-07  468  		 * must be passed to iov iterator
eb0570c7df23c2 Damien Le Moal 2025-04-07  469  		 */
eb0570c7df23c2 Damien Le Moal 2025-04-07  470  		iov_iter_bvec(&iter, rw,
eb0570c7df23c2 Damien Le Moal 2025-04-07  471  			__bvec_iter_bvec(rq->bio->bi_io_vec, rq->bio->bi_iter),
eb0570c7df23c2 Damien Le Moal 2025-04-07  472  					nr_bvec, blk_rq_bytes(rq));
eb0570c7df23c2 Damien Le Moal 2025-04-07  473  		iter.iov_offset = rq->bio->bi_iter.bi_bvec_done;
eb0570c7df23c2 Damien Le Moal 2025-04-07  474  	}
eb0570c7df23c2 Damien Le Moal 2025-04-07  475  
eb0570c7df23c2 Damien Le Moal 2025-04-07  476  	cmd->iocb.ki_pos = (sector - zone->start) << SECTOR_SHIFT;
eb0570c7df23c2 Damien Le Moal 2025-04-07  477  	cmd->iocb.ki_filp = zone->file;
eb0570c7df23c2 Damien Le Moal 2025-04-07  478  	cmd->iocb.ki_complete = zloop_rw_complete;
eb0570c7df23c2 Damien Le Moal 2025-04-07  479  	if (!zlo->buffered_io)
eb0570c7df23c2 Damien Le Moal 2025-04-07  480  		cmd->iocb.ki_flags = IOCB_DIRECT;
eb0570c7df23c2 Damien Le Moal 2025-04-07  481  	cmd->iocb.ki_ioprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, 0);
eb0570c7df23c2 Damien Le Moal 2025-04-07  482  
eb0570c7df23c2 Damien Le Moal 2025-04-07  483  	if (rw == ITER_SOURCE)
eb0570c7df23c2 Damien Le Moal 2025-04-07  484  		ret = zone->file->f_op->write_iter(&cmd->iocb, &iter);
eb0570c7df23c2 Damien Le Moal 2025-04-07  485  	else
eb0570c7df23c2 Damien Le Moal 2025-04-07  486  		ret = zone->file->f_op->read_iter(&cmd->iocb, &iter);
eb0570c7df23c2 Damien Le Moal 2025-04-07  487  unlock:
eb0570c7df23c2 Damien Le Moal 2025-04-07  488  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write)
eb0570c7df23c2 Damien Le Moal 2025-04-07  489  		mutex_unlock(&zone->lock);
eb0570c7df23c2 Damien Le Moal 2025-04-07  490  out:
eb0570c7df23c2 Damien Le Moal 2025-04-07  491  	if (ret != -EIOCBQUEUED)
eb0570c7df23c2 Damien Le Moal 2025-04-07  492  		zloop_rw_complete(&cmd->iocb, ret);
eb0570c7df23c2 Damien Le Moal 2025-04-07  493  	zloop_put_cmd(cmd);
eb0570c7df23c2 Damien Le Moal 2025-04-07 @494  }
eb0570c7df23c2 Damien Le Moal 2025-04-07  495  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
