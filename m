Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D31CF8B
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734825002; cv=none; b=eakb7NJyIQdwnkLxS6iuWfN6gTLDrLfR6X1vaycYrXZFOH4eIR4OCNuPbhSz7vuO+6XCIzdazThzZvDBL8ePVI/kzCCMJzMYj2yvZnb0iGSQw1HQjTs8bugGvYmpl4iEiPMfVtWEMoxPnpnEhdtVpRR1RY6N8qouCjgeWnxqqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734825002; c=relaxed/simple;
	bh=U9FqBe7VmednZ4uC5QQGmcxhE0APl6AGOzU3Nozv4JA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RB2oZudp4+RYbqp5HJAGZJNmrSA0t9xXVxfIw8wKiDrz1IU2ctEp5j9MFz5Z1h1twKeM2xKVh448fZ0ZkeNRhA05HeNnjpu4zg4tBqn14QWfvVESYUCVWZMIIKV5AAZ2qP3LwEUoJ4G9iSEV7PwGLLRCNWGqNv18YcLgC/57K/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rt4rBNsZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rt4rBNsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734825000; x=1766361000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9FqBe7VmednZ4uC5QQGmcxhE0APl6AGOzU3Nozv4JA=;
  b=Rt4rBNsZ+CxJ/0K0vU+nplg1Csha812PNojVnzclqc26IGU7gAKKItft
   UGN19X0FX3/rAQWHI8iDc0KfkOMr/eCyaj+da6IIZqVFbpd7zcLmojWQC
   PctwlBICJsUSL19pHupFNGdzLdpGvY+3UO+y7IPi5b47Bi+jEhruGetEF
   6BoTVd0uXQ64/Q9Wft8GJwudrtFzh8ZabLN3Nl1xMWeo/PZ/+kxWrKFh8
   MzRaMFRxdtREcdml5D39wO09vn/IjnU9m5FvqkJLVttFS3Y2PqON0SAmb
   aXHXNRHT7K2tvYwEsZxmdQOru7xWkzI01NB9RMhvnBKygt8nNubzSdumQ
   Q==;
X-CSE-ConnectionGUID: 6WmyAB29R/SUTZ4G3PQ6vg==
X-CSE-MsgGUID: Bp4poqUHR/GWnKosDlDTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52739048"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="52739048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 15:50:00 -0800
X-CSE-ConnectionGUID: 5WjB/pcKSaOehRlTfHvgdw==
X-CSE-MsgGUID: N5qyM+StQGOz6xw7fBLsqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103846143"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2024 15:49:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP9EJ-0002Zc-12;
	Sat, 21 Dec 2024 23:49:55 +0000
Date: Sun, 22 Dec 2024 07:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bvanassche:write-pipelining 15/24] block/blk-zoned.c:862
 blk_zone_all_zwr_inserted() warn: iterator 'i' not incremented
Message-ID: <202412220720.QDOiYdD0-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux write-pipelining
head:   ee641e2da67a08df498ab687390c897c9551eda1
commit: c1938d3a3fb7fb5946986b2712e6f478e0085afa [15/24] blk-zoned: Defer error handling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r071-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220720.QDOiYdD0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220720.QDOiYdD0-lkp@intel.com/

smatch warnings:
block/blk-zoned.c:862 blk_zone_all_zwr_inserted() warn: iterator 'i' not incremented

vim +/i +862 block/blk-zoned.c

c1938d3a3fb7fb Bart Van Assche 2024-11-15  837  
c1938d3a3fb7fb Bart Van Assche 2024-11-15  838  /*
c1938d3a3fb7fb Bart Van Assche 2024-11-15  839   * Report whether or not all zoned writes for a zone have been inserted into a
c1938d3a3fb7fb Bart Van Assche 2024-11-15  840   * software queue, elevator queue or hardware queue.
c1938d3a3fb7fb Bart Van Assche 2024-11-15  841   */
c1938d3a3fb7fb Bart Van Assche 2024-11-15  842  static bool blk_zone_all_zwr_inserted(struct blk_zone_wplug *zwplug)
c1938d3a3fb7fb Bart Van Assche 2024-11-15  843  {
c1938d3a3fb7fb Bart Van Assche 2024-11-15  844  	struct gendisk *disk = zwplug->disk;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  845  	struct request_queue *q = disk->queue;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  846  	struct all_zwr_inserted_data d = { .zwplug = zwplug, .res = true };
c1938d3a3fb7fb Bart Van Assche 2024-11-15  847  	struct blk_mq_hw_ctx *hctx;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  848  	long unsigned int i;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  849  	struct request *rq;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  850  
c1938d3a3fb7fb Bart Van Assche 2024-11-15  851  	scoped_guard(spinlock_irqsave, &q->requeue_lock) {
c1938d3a3fb7fb Bart Van Assche 2024-11-15  852  		list_for_each_entry(rq, &q->requeue_list, queuelist)
c1938d3a3fb7fb Bart Van Assche 2024-11-15  853  			if (blk_rq_is_seq_zoned_write(rq) &&
c1938d3a3fb7fb Bart Van Assche 2024-11-15  854  			    bio_zone_no(rq->bio) == zwplug->zone_no)
c1938d3a3fb7fb Bart Van Assche 2024-11-15  855  				return false;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  856  		list_for_each_entry(rq, &q->flush_list, queuelist)
c1938d3a3fb7fb Bart Van Assche 2024-11-15  857  			if (blk_rq_is_seq_zoned_write(rq) &&
c1938d3a3fb7fb Bart Van Assche 2024-11-15  858  			    bio_zone_no(rq->bio) == zwplug->zone_no)
c1938d3a3fb7fb Bart Van Assche 2024-11-15  859  				return false;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  860  	}
c1938d3a3fb7fb Bart Van Assche 2024-11-15  861  
c1938d3a3fb7fb Bart Van Assche 2024-11-15 @862  	queue_for_each_hw_ctx(q, hctx, i) {
c1938d3a3fb7fb Bart Van Assche 2024-11-15  863  		struct blk_mq_tags *tags = hctx->sched_tags ?: hctx->tags;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  864  
c1938d3a3fb7fb Bart Van Assche 2024-11-15  865  		blk_mq_all_tag_iter(tags, blk_zwr_inserted, &d);
c1938d3a3fb7fb Bart Van Assche 2024-11-15  866  		if (!d.res || blk_mq_is_shared_tags(q->tag_set->flags))
c1938d3a3fb7fb Bart Van Assche 2024-11-15  867  			break;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  868  	}
c1938d3a3fb7fb Bart Van Assche 2024-11-15  869  
c1938d3a3fb7fb Bart Van Assche 2024-11-15  870  	return d.res;
c1938d3a3fb7fb Bart Van Assche 2024-11-15  871  }
c1938d3a3fb7fb Bart Van Assche 2024-11-15  872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
