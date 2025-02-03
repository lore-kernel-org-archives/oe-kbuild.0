Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABC1DB377
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611738; cv=none; b=R1i1TdjMPMEDNF6Lpr2i7DWOBnrbxvtvEPyY4xQ4WlMDUnmf6Aelj4cnkE3VCgm+UfGMu6HUawXmYVjyhSG3j8ZWP/1GPkwA7qj9HljUMCaKNCK4eHaqdROEbJECttwIl2DUi5JcKaymebbUS91U8f8GQ9JkuB6k7sMQM24dUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611738; c=relaxed/simple;
	bh=oF8WDsxMQIcA1rqqC+ireaJbFTchYiBtb+H3FHnTHyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdQr0AfWV9eW854LlQpohBOxSGKdIBRsSLxnVp9JJ6tjDqElwemxDgQ11SN41IDy4ieWSjdpA3fi4a53MeEFtJf5+DEUuMZNwo9WExe1vIpLRjkBNevTMaHwbUxdoCUuU1FAS3BICiKpYHwGP+bDpYxCD45Jesb/xUkL9vqzA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHWtlKT7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHWtlKT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738611737; x=1770147737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oF8WDsxMQIcA1rqqC+ireaJbFTchYiBtb+H3FHnTHyg=;
  b=UHWtlKT7sV8DKRt62kZOSbN11dOxsJruQPrnTcMcQ1PtrOmEJo7WlnFa
   ElZav6fy7RFR9zvPXEvCvDfCLl4IBjjGajSKfAgce+e2eCYVZ79DK7HfS
   Ky+ky81W1Rc+FksY75apzs+wRvznuQVhbUEi17d/KITp9h3d6XMW++ZCn
   lLfTY8oDEh/pWS+45Vm95BEdihAkjzKzhqrrTG7joMklZRFU4ayM0JZHI
   QQFB3iItfSxc1DLSCImvvNUj2BnhQaDi8zt7Dn7u+QB3aRP2yOqbvobTA
   I9ECVpv7yF9b8mgUedSwoNTILoOZqRmCZJhN/XqycX5tjAykWmoDmek6k
   w==;
X-CSE-ConnectionGUID: QoIut8IMQt6T4xpMJHZpYA==
X-CSE-MsgGUID: TeKGJlUMS9GuFQ9EY45HCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42771947"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="42771947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:42:14 -0800
X-CSE-ConnectionGUID: 53+bJ4gJRKmL/G0HXgAR2Q==
X-CSE-MsgGUID: KNIe7YDwSNeUW+vWWOxAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133632110"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 11:42:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2Kg-000rOt-17;
	Mon, 03 Feb 2025 19:42:10 +0000
Date: Tue, 4 Feb 2025 03:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned-rebase 3/59] drivers/block/zloop.c:494:0-1:
 preceding lock on line 407
Message-ID: <202502040303.BEoHkPjA-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   5cee788f85c03e72a78f0fa3347d499e4db1d621
commit: 5865d129d01ab863a2b45ebeb87f806475d74c84 [3/59] block: new zoned loop block device driver
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040303.BEoHkPjA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502040303.BEoHkPjA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/zloop.c:494:0-1: preceding lock on line 407

vim +494 drivers/block/zloop.c

5865d129d01ab8 Damien Le Moal 2025-01-31  357  
5865d129d01ab8 Damien Le Moal 2025-01-31  358  static void zloop_rw(struct zloop_cmd *cmd)
5865d129d01ab8 Damien Le Moal 2025-01-31  359  {
5865d129d01ab8 Damien Le Moal 2025-01-31  360  	struct request *rq = blk_mq_rq_from_pdu(cmd);
5865d129d01ab8 Damien Le Moal 2025-01-31  361  	struct zloop_device *zlo = rq->q->queuedata;
5865d129d01ab8 Damien Le Moal 2025-01-31  362  	unsigned int zone_no = rq_zone_no(rq);
5865d129d01ab8 Damien Le Moal 2025-01-31  363  	sector_t sector = blk_rq_pos(rq);
5865d129d01ab8 Damien Le Moal 2025-01-31  364  	sector_t nr_sectors = blk_rq_sectors(rq);
5865d129d01ab8 Damien Le Moal 2025-01-31  365  	bool is_append = req_op(rq) == REQ_OP_ZONE_APPEND;
5865d129d01ab8 Damien Le Moal 2025-01-31  366  	bool is_write = req_op(rq) == REQ_OP_WRITE || is_append;
5865d129d01ab8 Damien Le Moal 2025-01-31  367  	int rw = is_write ? ITER_SOURCE : ITER_DEST;
5865d129d01ab8 Damien Le Moal 2025-01-31  368  	struct req_iterator rq_iter;
5865d129d01ab8 Damien Le Moal 2025-01-31  369  	struct zloop_zone *zone;
5865d129d01ab8 Damien Le Moal 2025-01-31  370  	struct iov_iter iter;
5865d129d01ab8 Damien Le Moal 2025-01-31  371  	struct bio_vec tmp;
5865d129d01ab8 Damien Le Moal 2025-01-31  372  	sector_t zone_end;
5865d129d01ab8 Damien Le Moal 2025-01-31  373  	int nr_bvec = 0;
5865d129d01ab8 Damien Le Moal 2025-01-31  374  	int ret;
5865d129d01ab8 Damien Le Moal 2025-01-31  375  
5865d129d01ab8 Damien Le Moal 2025-01-31  376  	atomic_set(&cmd->ref, 2);
5865d129d01ab8 Damien Le Moal 2025-01-31  377  	cmd->sector = sector;
5865d129d01ab8 Damien Le Moal 2025-01-31  378  	cmd->nr_sectors = nr_sectors;
5865d129d01ab8 Damien Le Moal 2025-01-31  379  	cmd->ret = 0;
5865d129d01ab8 Damien Le Moal 2025-01-31  380  
5865d129d01ab8 Damien Le Moal 2025-01-31  381  	/* We should never get an I/O beyond the device capacity. */
5865d129d01ab8 Damien Le Moal 2025-01-31  382  	if (WARN_ON_ONCE(zone_no >= zlo->nr_zones)) {
5865d129d01ab8 Damien Le Moal 2025-01-31  383  		ret = -EIO;
5865d129d01ab8 Damien Le Moal 2025-01-31  384  		goto out;
5865d129d01ab8 Damien Le Moal 2025-01-31  385  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  386  	zone = &zlo->zones[zone_no];
5865d129d01ab8 Damien Le Moal 2025-01-31  387  	zone_end = zone->start + zlo->zone_capacity;
5865d129d01ab8 Damien Le Moal 2025-01-31  388  
5865d129d01ab8 Damien Le Moal 2025-01-31  389  	/*
5865d129d01ab8 Damien Le Moal 2025-01-31  390  	 * The block layer should never send requests that are not fully
5865d129d01ab8 Damien Le Moal 2025-01-31  391  	 * contained within the zone.
5865d129d01ab8 Damien Le Moal 2025-01-31  392  	 */
5865d129d01ab8 Damien Le Moal 2025-01-31  393  	if (WARN_ON_ONCE(sector + nr_sectors > zone->start + zlo->zone_size)) {
5865d129d01ab8 Damien Le Moal 2025-01-31  394  		ret = -EIO;
5865d129d01ab8 Damien Le Moal 2025-01-31  395  		goto out;
5865d129d01ab8 Damien Le Moal 2025-01-31  396  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  397  
5865d129d01ab8 Damien Le Moal 2025-01-31  398  	if (test_and_clear_bit(ZLOOP_ZONE_SEQ_ERROR, &zone->flags)) {
5865d129d01ab8 Damien Le Moal 2025-01-31  399  		mutex_lock(&zone->lock);
5865d129d01ab8 Damien Le Moal 2025-01-31  400  		ret = zloop_update_seq_zone(zlo, zone_no);
5865d129d01ab8 Damien Le Moal 2025-01-31  401  		mutex_unlock(&zone->lock);
5865d129d01ab8 Damien Le Moal 2025-01-31  402  		if (ret)
5865d129d01ab8 Damien Le Moal 2025-01-31  403  			goto out;
5865d129d01ab8 Damien Le Moal 2025-01-31  404  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  405  
5865d129d01ab8 Damien Le Moal 2025-01-31  406  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write) {
5865d129d01ab8 Damien Le Moal 2025-01-31 @407  		mutex_lock(&zone->lock);
5865d129d01ab8 Damien Le Moal 2025-01-31  408  
5865d129d01ab8 Damien Le Moal 2025-01-31  409  		if (is_append) {
5865d129d01ab8 Damien Le Moal 2025-01-31  410  			sector = zone->wp;
5865d129d01ab8 Damien Le Moal 2025-01-31  411  			cmd->sector = sector;
5865d129d01ab8 Damien Le Moal 2025-01-31  412  		}
5865d129d01ab8 Damien Le Moal 2025-01-31  413  
5865d129d01ab8 Damien Le Moal 2025-01-31  414  		/*
5865d129d01ab8 Damien Le Moal 2025-01-31  415  		 * Write operations must be aligned to the write pointer and
5865d129d01ab8 Damien Le Moal 2025-01-31  416  		 * fully contained within the zone capacity.
5865d129d01ab8 Damien Le Moal 2025-01-31  417  		 */
5865d129d01ab8 Damien Le Moal 2025-01-31  418  		if (sector != zone->wp || zone->wp + nr_sectors > zone_end) {
5865d129d01ab8 Damien Le Moal 2025-01-31  419  			pr_err("Zone %u: unaligned write: sect %llu, wp %llu\n",
5865d129d01ab8 Damien Le Moal 2025-01-31  420  			       zone_no, sector, zone->wp);
5865d129d01ab8 Damien Le Moal 2025-01-31  421  			ret = -EIO;
5865d129d01ab8 Damien Le Moal 2025-01-31  422  			goto unlock;
5865d129d01ab8 Damien Le Moal 2025-01-31  423  		}
5865d129d01ab8 Damien Le Moal 2025-01-31  424  
5865d129d01ab8 Damien Le Moal 2025-01-31  425  		/* Implicitly open the target zone. */
5865d129d01ab8 Damien Le Moal 2025-01-31  426  		if (zone->cond == BLK_ZONE_COND_CLOSED ||
5865d129d01ab8 Damien Le Moal 2025-01-31  427  		    zone->cond == BLK_ZONE_COND_EMPTY)
5865d129d01ab8 Damien Le Moal 2025-01-31  428  			zone->cond = BLK_ZONE_COND_IMP_OPEN;
5865d129d01ab8 Damien Le Moal 2025-01-31  429  
5865d129d01ab8 Damien Le Moal 2025-01-31  430  		/*
5865d129d01ab8 Damien Le Moal 2025-01-31  431  		 * Advance the write pointer of sequential zones. If the write
5865d129d01ab8 Damien Le Moal 2025-01-31  432  		 * fails, the wp position will be corrected when the next I/O
5865d129d01ab8 Damien Le Moal 2025-01-31  433  		 * copmpletes.
5865d129d01ab8 Damien Le Moal 2025-01-31  434  		 */
5865d129d01ab8 Damien Le Moal 2025-01-31  435  		zone->wp += nr_sectors;
5865d129d01ab8 Damien Le Moal 2025-01-31  436  		if (zone->wp == zone_end)
5865d129d01ab8 Damien Le Moal 2025-01-31  437  			zone->cond = BLK_ZONE_COND_FULL;
5865d129d01ab8 Damien Le Moal 2025-01-31  438  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  439  
5865d129d01ab8 Damien Le Moal 2025-01-31  440  	rq_for_each_bvec(tmp, rq, rq_iter)
5865d129d01ab8 Damien Le Moal 2025-01-31  441  		nr_bvec++;
5865d129d01ab8 Damien Le Moal 2025-01-31  442  
5865d129d01ab8 Damien Le Moal 2025-01-31  443  	if (rq->bio != rq->biotail) {
5865d129d01ab8 Damien Le Moal 2025-01-31  444  		struct bio_vec *bvec;
5865d129d01ab8 Damien Le Moal 2025-01-31  445  
5865d129d01ab8 Damien Le Moal 2025-01-31  446  		cmd->bvec = kmalloc_array(nr_bvec, sizeof(*cmd->bvec), GFP_NOIO);
5865d129d01ab8 Damien Le Moal 2025-01-31  447  		if (!cmd->bvec) {
5865d129d01ab8 Damien Le Moal 2025-01-31  448  			ret = -EIO;
5865d129d01ab8 Damien Le Moal 2025-01-31  449  			goto unlock;
5865d129d01ab8 Damien Le Moal 2025-01-31  450  		}
5865d129d01ab8 Damien Le Moal 2025-01-31  451  
5865d129d01ab8 Damien Le Moal 2025-01-31  452  		/*
5865d129d01ab8 Damien Le Moal 2025-01-31  453  		 * The bios of the request may be started from the middle of
5865d129d01ab8 Damien Le Moal 2025-01-31  454  		 * the 'bvec' because of bio splitting, so we can't directly
5865d129d01ab8 Damien Le Moal 2025-01-31  455  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
5865d129d01ab8 Damien Le Moal 2025-01-31  456  		 * API will take care of all details for us.
5865d129d01ab8 Damien Le Moal 2025-01-31  457  		 */
5865d129d01ab8 Damien Le Moal 2025-01-31  458  		bvec = cmd->bvec;
5865d129d01ab8 Damien Le Moal 2025-01-31  459  		rq_for_each_bvec(tmp, rq, rq_iter) {
5865d129d01ab8 Damien Le Moal 2025-01-31  460  			*bvec = tmp;
5865d129d01ab8 Damien Le Moal 2025-01-31  461  			bvec++;
5865d129d01ab8 Damien Le Moal 2025-01-31  462  		}
5865d129d01ab8 Damien Le Moal 2025-01-31  463  		iov_iter_bvec(&iter, rw, cmd->bvec, nr_bvec, blk_rq_bytes(rq));
5865d129d01ab8 Damien Le Moal 2025-01-31  464  	} else {
5865d129d01ab8 Damien Le Moal 2025-01-31  465  		/*
5865d129d01ab8 Damien Le Moal 2025-01-31  466  		 * Same here, this bio may be started from the middle of the
5865d129d01ab8 Damien Le Moal 2025-01-31  467  		 * 'bvec' because of bio splitting, so offset from the bvec
5865d129d01ab8 Damien Le Moal 2025-01-31  468  		 * must be passed to iov iterator
5865d129d01ab8 Damien Le Moal 2025-01-31  469  		 */
5865d129d01ab8 Damien Le Moal 2025-01-31  470  		iov_iter_bvec(&iter, rw,
5865d129d01ab8 Damien Le Moal 2025-01-31  471  			__bvec_iter_bvec(rq->bio->bi_io_vec, rq->bio->bi_iter),
5865d129d01ab8 Damien Le Moal 2025-01-31  472  					nr_bvec, blk_rq_bytes(rq));
5865d129d01ab8 Damien Le Moal 2025-01-31  473  		iter.iov_offset = rq->bio->bi_iter.bi_bvec_done;
5865d129d01ab8 Damien Le Moal 2025-01-31  474  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  475  
5865d129d01ab8 Damien Le Moal 2025-01-31  476  	cmd->iocb.ki_pos = (sector - zone->start) << SECTOR_SHIFT;
5865d129d01ab8 Damien Le Moal 2025-01-31  477  	cmd->iocb.ki_filp = zone->file;
5865d129d01ab8 Damien Le Moal 2025-01-31  478  	cmd->iocb.ki_complete = zloop_rw_complete;
5865d129d01ab8 Damien Le Moal 2025-01-31  479  	if (!zlo->buffered_io)
5865d129d01ab8 Damien Le Moal 2025-01-31  480  		cmd->iocb.ki_flags = IOCB_DIRECT;
5865d129d01ab8 Damien Le Moal 2025-01-31  481  	cmd->iocb.ki_ioprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, 0);
5865d129d01ab8 Damien Le Moal 2025-01-31  482  
5865d129d01ab8 Damien Le Moal 2025-01-31  483  	if (rw == ITER_SOURCE)
5865d129d01ab8 Damien Le Moal 2025-01-31  484  		ret = zone->file->f_op->write_iter(&cmd->iocb, &iter);
5865d129d01ab8 Damien Le Moal 2025-01-31  485  	else
5865d129d01ab8 Damien Le Moal 2025-01-31  486  		ret = zone->file->f_op->read_iter(&cmd->iocb, &iter);
5865d129d01ab8 Damien Le Moal 2025-01-31  487  unlock:
5865d129d01ab8 Damien Le Moal 2025-01-31  488  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write)
5865d129d01ab8 Damien Le Moal 2025-01-31  489  		mutex_unlock(&zone->lock);
5865d129d01ab8 Damien Le Moal 2025-01-31  490  out:
5865d129d01ab8 Damien Le Moal 2025-01-31  491  	if (ret != -EIOCBQUEUED)
5865d129d01ab8 Damien Le Moal 2025-01-31  492  		zloop_rw_complete(&cmd->iocb, ret);
5865d129d01ab8 Damien Le Moal 2025-01-31  493  	zloop_put_cmd(cmd);
5865d129d01ab8 Damien Le Moal 2025-01-31 @494  }
5865d129d01ab8 Damien Le Moal 2025-01-31  495  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
