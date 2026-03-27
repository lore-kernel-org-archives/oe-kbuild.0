Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923F34F48A
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646486; cv=none; b=pSgk0VQztFzxCFhiLPliwzEXUG6Cs1I1FhDjhrApgAEjj4N++qFVrGJSehKNX+K3hyIMlIkO2tPW6390HgDfutax0ymVZ6ROWo97LYfgi4C/IuzTCwsmFHPckklCpFQA7rqMBI2O7WXILcchvz/1AQkYfq6Ye/b1/HgYF7QZnJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646486; c=relaxed/simple;
	bh=P23jbQrQosrDS0Ffd+4lkGtTLO3DxJFZekOU/YthvFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5IIoPBuQA9nX2CppHOTF3dovokPjpPJNS54L7JgrS+J4J9zhoUXDUbj2Z7OLGSyMxvUKR+gFPrLv2LCdy9ru+ZFTuxRw4+1br4fPvShHVAcj2wpIn9mQ1GhOHQf6Vxc5mNcm+6pVUBlXEI/LVJ1SGPy3iksJOFb2oaQzAleyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmqKyNzZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmqKyNzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774646483; x=1806182483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P23jbQrQosrDS0Ffd+4lkGtTLO3DxJFZekOU/YthvFI=;
  b=mmqKyNzZSCgQ12IFMfKVNwMz0qlccAyoq4Xqqyvu6jDcYRN5A6Ciu95c
   U71lgwBZa46Q/y5A3Yhh5PumjzasWejxXQwSzqfXSIXfcqGgpulED7t4J
   sZLKJTJTIuh4R6yr2bUXEDyZvUiqd8cdJjfBs/kN7/Yb+SSnlp6WjloUN
   FyfHTY7BzL9XnkVRtNGxvV1A3ye3qEZlXMSjv8GOzxKr3OI78Y4Rjqrp+
   At7XBq7fC6wHj1JgYnM321LvlaJOGBfNiokLCNKa2CcDJHVuRU+jwkXWM
   mXPPMZZ7KNZCbOj5MyRmTz772G+qYbGqHFZGHDbBRHWcBhZaAkDxwQmKX
   w==;
X-CSE-ConnectionGUID: 0VQw34zFT3Wp0hTWFJ46FQ==
X-CSE-MsgGUID: HmZhjqCjT5m3uh+diVHhMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86804041"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86804041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 14:21:23 -0700
X-CSE-ConnectionGUID: JA6vO3ytS8CNUt49yNjrTw==
X-CSE-MsgGUID: qkzb1DDgSuWl1aqbCLVO1Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 14:21:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6EcJ-00000000AlF-1VQ9;
	Fri, 27 Mar 2026 21:21:19 +0000
Date: Sat, 28 Mar 2026 05:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 26/26] block: Enable lock context analysis for all
 block drivers
Message-ID: <202603280554.fjeELK3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260325214518.2854494-27-bvanassche@acm.org>
References: <20260325214518.2854494-27-bvanassche@acm.org>
TO: Bart Van Assche <bvanassche@acm.org>
TO: Jens Axboe <axboe@kernel.dk>
CC: linux-block@vger.kernel.org
CC: Christoph Hellwig <hch@lst.de>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Tejun Heo <tj@kernel.org>
CC: Bart Van Assche <bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/testing]
[also build test WARNING on ceph-client/for-linus linus/master v7.0-rc5]
[cannot apply to axboe/for-next hch-configfs/for-next next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Annotate-the-queue-limits-functions/20260327-071524
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20260325214518.2854494-27-bvanassche%40acm.org
patch subject: [PATCH v2 26/26] block: Enable lock context analysis for all block drivers
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: sparc64-randconfig-001-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280554.fjeELK3q-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280554.fjeELK3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603280554.fjeELK3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/zloop.c:490:12: warning: mutex 'blk_mq_rq_from_pdu(cmd).q->queuedata->zones[zone_no].lock' is not held on every path through here [-Wthread-safety-analysis]
     490 |         nr_bvec = blk_rq_nr_bvec(rq);
         |                   ^
   drivers/block/zloop.c:436:3: note: mutex acquired here
     436 |                 mutex_lock(&zone->lock);
         |                 ^
   include/linux/mutex.h:193:26: note: expanded from macro 'mutex_lock'
     193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   drivers/block/zloop.c:537:7: warning: mutex 'blk_mq_rq_from_pdu(cmd).q->queuedata->zones[zone_no].lock' is not held on every path through here [-Wthread-safety-analysis]
     537 |         if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write)
         |              ^
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:4: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |           ^
   drivers/block/zloop.c:436:3: note: mutex acquired here
     436 |                 mutex_lock(&zone->lock);
         |                 ^
   include/linux/mutex.h:193:26: note: expanded from macro 'mutex_lock'
     193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   drivers/block/zloop.c:537:7: warning: mutex 'blk_mq_rq_from_pdu(cmd).q->queuedata->zones[zone_no].lock' is not held on every path through here [-Wthread-safety-analysis]
     537 |         if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write)
         |              ^
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:4: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |           ^
   drivers/block/zloop.c:436:3: note: mutex acquired here
     436 |                 mutex_lock(&zone->lock);
         |                 ^
   include/linux/mutex.h:193:26: note: expanded from macro 'mutex_lock'
     193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
>> drivers/block/zloop.c:538:3: warning: releasing mutex 'blk_mq_rq_from_pdu(cmd).q->queuedata->zones[zone_no].lock' that was not held [-Wthread-safety-analysis]
     538 |                 mutex_unlock(&zone->lock);
         |                 ^
   4 warnings generated.


vim +490 drivers/block/zloop.c

eb0570c7df23c2 Damien Le Moal     2025-04-07  380  
eb0570c7df23c2 Damien Le Moal     2025-04-07  381  static void zloop_rw(struct zloop_cmd *cmd)
eb0570c7df23c2 Damien Le Moal     2025-04-07  382  {
eb0570c7df23c2 Damien Le Moal     2025-04-07  383  	struct request *rq = blk_mq_rq_from_pdu(cmd);
eb0570c7df23c2 Damien Le Moal     2025-04-07  384  	struct zloop_device *zlo = rq->q->queuedata;
eb0570c7df23c2 Damien Le Moal     2025-04-07  385  	unsigned int zone_no = rq_zone_no(rq);
eb0570c7df23c2 Damien Le Moal     2025-04-07  386  	sector_t sector = blk_rq_pos(rq);
eb0570c7df23c2 Damien Le Moal     2025-04-07  387  	sector_t nr_sectors = blk_rq_sectors(rq);
eb0570c7df23c2 Damien Le Moal     2025-04-07  388  	bool is_append = req_op(rq) == REQ_OP_ZONE_APPEND;
eb0570c7df23c2 Damien Le Moal     2025-04-07  389  	bool is_write = req_op(rq) == REQ_OP_WRITE || is_append;
eb0570c7df23c2 Damien Le Moal     2025-04-07  390  	int rw = is_write ? ITER_SOURCE : ITER_DEST;
eb0570c7df23c2 Damien Le Moal     2025-04-07  391  	struct req_iterator rq_iter;
eb0570c7df23c2 Damien Le Moal     2025-04-07  392  	struct zloop_zone *zone;
eb0570c7df23c2 Damien Le Moal     2025-04-07  393  	struct iov_iter iter;
eb0570c7df23c2 Damien Le Moal     2025-04-07  394  	struct bio_vec tmp;
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  395  	unsigned long flags;
eb0570c7df23c2 Damien Le Moal     2025-04-07  396  	sector_t zone_end;
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  397  	unsigned int nr_bvec;
eb0570c7df23c2 Damien Le Moal     2025-04-07  398  	int ret;
eb0570c7df23c2 Damien Le Moal     2025-04-07  399  
eb0570c7df23c2 Damien Le Moal     2025-04-07  400  	atomic_set(&cmd->ref, 2);
eb0570c7df23c2 Damien Le Moal     2025-04-07  401  	cmd->sector = sector;
eb0570c7df23c2 Damien Le Moal     2025-04-07  402  	cmd->nr_sectors = nr_sectors;
eb0570c7df23c2 Damien Le Moal     2025-04-07  403  	cmd->ret = 0;
eb0570c7df23c2 Damien Le Moal     2025-04-07  404  
9236c5fdd5a8be Damien Le Moal     2025-11-15  405  	if (WARN_ON_ONCE(is_append && !zlo->zone_append)) {
9236c5fdd5a8be Damien Le Moal     2025-11-15  406  		ret = -EIO;
9236c5fdd5a8be Damien Le Moal     2025-11-15  407  		goto out;
9236c5fdd5a8be Damien Le Moal     2025-11-15  408  	}
9236c5fdd5a8be Damien Le Moal     2025-11-15  409  
eb0570c7df23c2 Damien Le Moal     2025-04-07  410  	/* We should never get an I/O beyond the device capacity. */
eb0570c7df23c2 Damien Le Moal     2025-04-07  411  	if (WARN_ON_ONCE(zone_no >= zlo->nr_zones)) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  412  		ret = -EIO;
eb0570c7df23c2 Damien Le Moal     2025-04-07  413  		goto out;
eb0570c7df23c2 Damien Le Moal     2025-04-07  414  	}
eb0570c7df23c2 Damien Le Moal     2025-04-07  415  	zone = &zlo->zones[zone_no];
eb0570c7df23c2 Damien Le Moal     2025-04-07  416  	zone_end = zone->start + zlo->zone_capacity;
eb0570c7df23c2 Damien Le Moal     2025-04-07  417  
eb0570c7df23c2 Damien Le Moal     2025-04-07  418  	/*
eb0570c7df23c2 Damien Le Moal     2025-04-07  419  	 * The block layer should never send requests that are not fully
eb0570c7df23c2 Damien Le Moal     2025-04-07  420  	 * contained within the zone.
eb0570c7df23c2 Damien Le Moal     2025-04-07  421  	 */
eb0570c7df23c2 Damien Le Moal     2025-04-07  422  	if (WARN_ON_ONCE(sector + nr_sectors > zone->start + zlo->zone_size)) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  423  		ret = -EIO;
eb0570c7df23c2 Damien Le Moal     2025-04-07  424  		goto out;
eb0570c7df23c2 Damien Le Moal     2025-04-07  425  	}
eb0570c7df23c2 Damien Le Moal     2025-04-07  426  
eb0570c7df23c2 Damien Le Moal     2025-04-07  427  	if (test_and_clear_bit(ZLOOP_ZONE_SEQ_ERROR, &zone->flags)) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  428  		mutex_lock(&zone->lock);
eb0570c7df23c2 Damien Le Moal     2025-04-07  429  		ret = zloop_update_seq_zone(zlo, zone_no);
eb0570c7df23c2 Damien Le Moal     2025-04-07  430  		mutex_unlock(&zone->lock);
eb0570c7df23c2 Damien Le Moal     2025-04-07  431  		if (ret)
eb0570c7df23c2 Damien Le Moal     2025-04-07  432  			goto out;
eb0570c7df23c2 Damien Le Moal     2025-04-07  433  	}
eb0570c7df23c2 Damien Le Moal     2025-04-07  434  
eb0570c7df23c2 Damien Le Moal     2025-04-07  435  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  436  		mutex_lock(&zone->lock);
eb0570c7df23c2 Damien Le Moal     2025-04-07  437  
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  438  		spin_lock_irqsave(&zone->wp_lock, flags);
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  439  
e3a96ca90462f8 Damien Le Moal     2025-11-15  440  		/*
e3a96ca90462f8 Damien Le Moal     2025-11-15  441  		 * Zone append operations always go at the current write
e3a96ca90462f8 Damien Le Moal     2025-11-15  442  		 * pointer, but regular write operations must already be
e3a96ca90462f8 Damien Le Moal     2025-11-15  443  		 * aligned to the write pointer when submitted.
e3a96ca90462f8 Damien Le Moal     2025-11-15  444  		 */
eb0570c7df23c2 Damien Le Moal     2025-04-07  445  		if (is_append) {
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  446  			/*
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  447  			 * If ordered zone append is in use, we already checked
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  448  			 * and set the target sector in zloop_queue_rq().
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  449  			 */
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  450  			if (!zlo->ordered_zone_append) {
a9637ab93c6cfd Damien Le Moal     2025-11-19  451  				if (zone->cond == BLK_ZONE_COND_FULL ||
a9637ab93c6cfd Damien Le Moal     2025-11-19  452  				    zone->wp + nr_sectors > zone_end) {
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  453  					spin_unlock_irqrestore(&zone->wp_lock,
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  454  							       flags);
cf28f6f923cb1d Damien Le Moal     2025-11-15  455  					ret = -EIO;
cf28f6f923cb1d Damien Le Moal     2025-11-15  456  					goto unlock;
cf28f6f923cb1d Damien Le Moal     2025-11-15  457  				}
eb0570c7df23c2 Damien Le Moal     2025-04-07  458  				sector = zone->wp;
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  459  			}
eb0570c7df23c2 Damien Le Moal     2025-04-07  460  			cmd->sector = sector;
e3a96ca90462f8 Damien Le Moal     2025-11-15  461  		} else if (sector != zone->wp) {
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  462  			spin_unlock_irqrestore(&zone->wp_lock, flags);
eb0570c7df23c2 Damien Le Moal     2025-04-07  463  			pr_err("Zone %u: unaligned write: sect %llu, wp %llu\n",
eb0570c7df23c2 Damien Le Moal     2025-04-07  464  			       zone_no, sector, zone->wp);
eb0570c7df23c2 Damien Le Moal     2025-04-07  465  			ret = -EIO;
eb0570c7df23c2 Damien Le Moal     2025-04-07  466  			goto unlock;
eb0570c7df23c2 Damien Le Moal     2025-04-07  467  		}
eb0570c7df23c2 Damien Le Moal     2025-04-07  468  
eb0570c7df23c2 Damien Le Moal     2025-04-07  469  		/* Implicitly open the target zone. */
eb0570c7df23c2 Damien Le Moal     2025-04-07  470  		if (zone->cond == BLK_ZONE_COND_CLOSED ||
eb0570c7df23c2 Damien Le Moal     2025-04-07  471  		    zone->cond == BLK_ZONE_COND_EMPTY)
eb0570c7df23c2 Damien Le Moal     2025-04-07  472  			zone->cond = BLK_ZONE_COND_IMP_OPEN;
eb0570c7df23c2 Damien Le Moal     2025-04-07  473  
eb0570c7df23c2 Damien Le Moal     2025-04-07  474  		/*
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  475  		 * Advance the write pointer, unless ordered zone append is in
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  476  		 * use. If the write fails, the write pointer position will be
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  477  		 * corrected when the next I/O starts execution.
eb0570c7df23c2 Damien Le Moal     2025-04-07  478  		 */
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  479  		if (!is_append || !zlo->ordered_zone_append) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  480  			zone->wp += nr_sectors;
866d65745b6359 Damien Le Moal     2025-11-15  481  			if (zone->wp == zone_end) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  482  				zone->cond = BLK_ZONE_COND_FULL;
866d65745b6359 Damien Le Moal     2025-11-15  483  				zone->wp = ULLONG_MAX;
866d65745b6359 Damien Le Moal     2025-11-15  484  			}
eb0570c7df23c2 Damien Le Moal     2025-04-07  485  		}
eb0570c7df23c2 Damien Le Moal     2025-04-07  486  
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  487  		spin_unlock_irqrestore(&zone->wp_lock, flags);
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  488  	}
fcc6eaa3a03a0e Damien Le Moal     2025-11-15  489  
71075d25ca5cae Chaitanya Kulkarni 2025-12-02 @490  	nr_bvec = blk_rq_nr_bvec(rq);
eb0570c7df23c2 Damien Le Moal     2025-04-07  491  
eb0570c7df23c2 Damien Le Moal     2025-04-07  492  	if (rq->bio != rq->biotail) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  493  		struct bio_vec *bvec;
eb0570c7df23c2 Damien Le Moal     2025-04-07  494  
69050f8d6d075d Kees Cook          2026-02-20  495  		cmd->bvec = kmalloc_objs(*cmd->bvec, nr_bvec, GFP_NOIO);
eb0570c7df23c2 Damien Le Moal     2025-04-07  496  		if (!cmd->bvec) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  497  			ret = -EIO;
eb0570c7df23c2 Damien Le Moal     2025-04-07  498  			goto unlock;
eb0570c7df23c2 Damien Le Moal     2025-04-07  499  		}
eb0570c7df23c2 Damien Le Moal     2025-04-07  500  
eb0570c7df23c2 Damien Le Moal     2025-04-07  501  		/*
eb0570c7df23c2 Damien Le Moal     2025-04-07  502  		 * The bios of the request may be started from the middle of
eb0570c7df23c2 Damien Le Moal     2025-04-07  503  		 * the 'bvec' because of bio splitting, so we can't directly
eb0570c7df23c2 Damien Le Moal     2025-04-07  504  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
eb0570c7df23c2 Damien Le Moal     2025-04-07  505  		 * API will take care of all details for us.
eb0570c7df23c2 Damien Le Moal     2025-04-07  506  		 */
eb0570c7df23c2 Damien Le Moal     2025-04-07  507  		bvec = cmd->bvec;
eb0570c7df23c2 Damien Le Moal     2025-04-07  508  		rq_for_each_bvec(tmp, rq, rq_iter) {
eb0570c7df23c2 Damien Le Moal     2025-04-07  509  			*bvec = tmp;
eb0570c7df23c2 Damien Le Moal     2025-04-07  510  			bvec++;
eb0570c7df23c2 Damien Le Moal     2025-04-07  511  		}
eb0570c7df23c2 Damien Le Moal     2025-04-07  512  		iov_iter_bvec(&iter, rw, cmd->bvec, nr_bvec, blk_rq_bytes(rq));
eb0570c7df23c2 Damien Le Moal     2025-04-07  513  	} else {
eb0570c7df23c2 Damien Le Moal     2025-04-07  514  		/*
eb0570c7df23c2 Damien Le Moal     2025-04-07  515  		 * Same here, this bio may be started from the middle of the
eb0570c7df23c2 Damien Le Moal     2025-04-07  516  		 * 'bvec' because of bio splitting, so offset from the bvec
eb0570c7df23c2 Damien Le Moal     2025-04-07  517  		 * must be passed to iov iterator
eb0570c7df23c2 Damien Le Moal     2025-04-07  518  		 */
eb0570c7df23c2 Damien Le Moal     2025-04-07  519  		iov_iter_bvec(&iter, rw,
eb0570c7df23c2 Damien Le Moal     2025-04-07  520  			__bvec_iter_bvec(rq->bio->bi_io_vec, rq->bio->bi_iter),
eb0570c7df23c2 Damien Le Moal     2025-04-07  521  					nr_bvec, blk_rq_bytes(rq));
eb0570c7df23c2 Damien Le Moal     2025-04-07  522  		iter.iov_offset = rq->bio->bi_iter.bi_bvec_done;
eb0570c7df23c2 Damien Le Moal     2025-04-07  523  	}
eb0570c7df23c2 Damien Le Moal     2025-04-07  524  
eb0570c7df23c2 Damien Le Moal     2025-04-07  525  	cmd->iocb.ki_pos = (sector - zone->start) << SECTOR_SHIFT;
eb0570c7df23c2 Damien Le Moal     2025-04-07  526  	cmd->iocb.ki_filp = zone->file;
eb0570c7df23c2 Damien Le Moal     2025-04-07  527  	cmd->iocb.ki_complete = zloop_rw_complete;
eb0570c7df23c2 Damien Le Moal     2025-04-07  528  	if (!zlo->buffered_io)
eb0570c7df23c2 Damien Le Moal     2025-04-07  529  		cmd->iocb.ki_flags = IOCB_DIRECT;
eb0570c7df23c2 Damien Le Moal     2025-04-07  530  	cmd->iocb.ki_ioprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, 0);
eb0570c7df23c2 Damien Le Moal     2025-04-07  531  
eb0570c7df23c2 Damien Le Moal     2025-04-07  532  	if (rw == ITER_SOURCE)
eb0570c7df23c2 Damien Le Moal     2025-04-07  533  		ret = zone->file->f_op->write_iter(&cmd->iocb, &iter);
eb0570c7df23c2 Damien Le Moal     2025-04-07  534  	else
eb0570c7df23c2 Damien Le Moal     2025-04-07  535  		ret = zone->file->f_op->read_iter(&cmd->iocb, &iter);
eb0570c7df23c2 Damien Le Moal     2025-04-07  536  unlock:
eb0570c7df23c2 Damien Le Moal     2025-04-07  537  	if (!test_bit(ZLOOP_ZONE_CONV, &zone->flags) && is_write)
eb0570c7df23c2 Damien Le Moal     2025-04-07 @538  		mutex_unlock(&zone->lock);
eb0570c7df23c2 Damien Le Moal     2025-04-07  539  out:
eb0570c7df23c2 Damien Le Moal     2025-04-07  540  	if (ret != -EIOCBQUEUED)
eb0570c7df23c2 Damien Le Moal     2025-04-07  541  		zloop_rw_complete(&cmd->iocb, ret);
eb0570c7df23c2 Damien Le Moal     2025-04-07  542  	zloop_put_cmd(cmd);
eb0570c7df23c2 Damien Le Moal     2025-04-07  543  }
eb0570c7df23c2 Damien Le Moal     2025-04-07  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
