Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43112C80
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732462476; cv=none; b=Xi88hruQmtkUIxMJJ4UHdFEEV6qgBk6izfZ/2VrbDCbafyLP6EyO8SCPaJJDImgUEXylWDaOT7Q1Yci/HUKv3y0ZxS3k6EyKs+AUiieEeYmR6DMOq/jP0n4OuwJcBmdSztC4dj2ng9f40lHUmY1gbq/j4832g6lQd19FcpAOKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732462476; c=relaxed/simple;
	bh=CwEvGnTziCZ16JyIw6/B/j7Oj3ozfACydfSe2/nsM9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6C332B5IjyTI/c6gaOh3hdny4rYSUWwB/iORJHjkXuKmnuF68yt2klJ9L6766/fEV1Ghob9ZVyC2V4XcItb64pEYCJsZGsiPKuLpbo+BpUTxpC/71xIq7X1AXiC8FwRmARQj2F248PoAdpWsI0u2jYU8GeNrJ91h8tAIuXuec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dvfw7ZtO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dvfw7ZtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732462475; x=1763998475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CwEvGnTziCZ16JyIw6/B/j7Oj3ozfACydfSe2/nsM9c=;
  b=Dvfw7ZtO/wzzGwAAb8o5tkUwmf+lTYJcQizanVVS1WfmT+YdO8GnvKQs
   CoNrp4uyoZn+fW6dOtcXAh/BO8EQMuZYGitFiu+y2zA56QGg10Ma6Mv5u
   6Su6Z4X9Uwa4i9+1QbOCzRIobeg5MZFvA9e4CWRLGsr5Ox3clOl1uQ1tj
   L0+cicezsKdAXzRe/xCTuRnpu0ksdOtcYTC7Ncu0xHfZxy3bn7XtQs8hG
   /LmPHaQFlBLI6tTRi2656KIZjJXR55ze9+s3JAhy23/xZgkUnmfF2YQAy
   vUw7kxxmpQbDXUktn4ObpzBDTaB80e5An/kBr6d8QAB2yc0WY2ULMV9Vc
   Q==;
X-CSE-ConnectionGUID: AmMiMeAGSByq+xY1NDlzfA==
X-CSE-MsgGUID: qxCLPOXqR1K3IQLsDTOLUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43949436"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43949436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 07:34:35 -0800
X-CSE-ConnectionGUID: TK1z9EpHR6i+oq4huEemLw==
X-CSE-MsgGUID: r7m0HuVMTn+8RXr475CDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="95968803"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2024 07:34:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFEd4-000545-2P;
	Sun, 24 Nov 2024 15:34:30 +0000
Date: Sun, 24 Nov 2024 23:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v16 04/26] blk-zoned: Only handle errors after pending
 zoned writes have completed
Message-ID: <202411242326.HSKyGmyJ-lkp@intel.com>
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
In-Reply-To: <20241119002815.600608-5-bvanassche@acm.org>
References: <20241119002815.600608-5-bvanassche@acm.org>
TO: Bart Van Assche <bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20241122]
[cannot apply to jejb-scsi/for-next mkp-scsi/for-next v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/blk-zoned-Fix-a-reference-count-leak/20241121-112830
base:   linus/master
patch link:    https://lore.kernel.org/r/20241119002815.600608-5-bvanassche%40acm.org
patch subject: [PATCH v16 04/26] blk-zoned: Only handle errors after pending zoned writes have completed
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-r072-20241124 (https://download.01.org/0day-ci/archive/20241124/202411242326.HSKyGmyJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411242326.HSKyGmyJ-lkp@intel.com/

New smatch warnings:
block/blk-zoned.c:804 blk_zone_all_zwr_inserted() warn: iterator 'i' not incremented

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/i +804 block/blk-zoned.c

2238dfb90653aa Bart Van Assche 2024-11-18  779  
2238dfb90653aa Bart Van Assche 2024-11-18  780  /*
2238dfb90653aa Bart Van Assche 2024-11-18  781   * Report whether or not all zoned writes for a zone have been inserted into a
2238dfb90653aa Bart Van Assche 2024-11-18  782   * software queue, elevator queue or hardware queue.
2238dfb90653aa Bart Van Assche 2024-11-18  783   */
2238dfb90653aa Bart Van Assche 2024-11-18  784  static bool blk_zone_all_zwr_inserted(struct blk_zone_wplug *zwplug)
2238dfb90653aa Bart Van Assche 2024-11-18  785  {
2238dfb90653aa Bart Van Assche 2024-11-18  786  	struct gendisk *disk = zwplug->disk;
2238dfb90653aa Bart Van Assche 2024-11-18  787  	struct request_queue *q = disk->queue;
2238dfb90653aa Bart Van Assche 2024-11-18  788  	struct all_zwr_inserted_data d = { .zwplug = zwplug, .res = true };
2238dfb90653aa Bart Van Assche 2024-11-18  789  	struct blk_mq_hw_ctx *hctx;
2238dfb90653aa Bart Van Assche 2024-11-18  790  	long unsigned int i;
2238dfb90653aa Bart Van Assche 2024-11-18  791  	struct request *rq;
2238dfb90653aa Bart Van Assche 2024-11-18  792  
2238dfb90653aa Bart Van Assche 2024-11-18  793  	scoped_guard(spinlock_irqsave, &q->requeue_lock) {
2238dfb90653aa Bart Van Assche 2024-11-18  794  		list_for_each_entry(rq, &q->requeue_list, queuelist)
2238dfb90653aa Bart Van Assche 2024-11-18  795  			if (blk_rq_is_seq_zoned_write(rq) &&
2238dfb90653aa Bart Van Assche 2024-11-18  796  			    bio_zone_no(rq->bio) == zwplug->zone_no)
2238dfb90653aa Bart Van Assche 2024-11-18  797  				return false;
2238dfb90653aa Bart Van Assche 2024-11-18  798  		list_for_each_entry(rq, &q->flush_list, queuelist)
2238dfb90653aa Bart Van Assche 2024-11-18  799  			if (blk_rq_is_seq_zoned_write(rq) &&
2238dfb90653aa Bart Van Assche 2024-11-18  800  			    bio_zone_no(rq->bio) == zwplug->zone_no)
2238dfb90653aa Bart Van Assche 2024-11-18  801  				return false;
2238dfb90653aa Bart Van Assche 2024-11-18  802  	}
2238dfb90653aa Bart Van Assche 2024-11-18  803  
2238dfb90653aa Bart Van Assche 2024-11-18 @804  	queue_for_each_hw_ctx(q, hctx, i) {
2238dfb90653aa Bart Van Assche 2024-11-18  805  		struct blk_mq_tags *tags = hctx->sched_tags ?: hctx->tags;
2238dfb90653aa Bart Van Assche 2024-11-18  806  
2238dfb90653aa Bart Van Assche 2024-11-18  807  		blk_mq_all_tag_iter(tags, blk_zwr_inserted, &d);
2238dfb90653aa Bart Van Assche 2024-11-18  808  		if (!d.res || blk_mq_is_shared_tags(q->tag_set->flags))
2238dfb90653aa Bart Van Assche 2024-11-18  809  			break;
2238dfb90653aa Bart Van Assche 2024-11-18  810  	}
2238dfb90653aa Bart Van Assche 2024-11-18  811  
2238dfb90653aa Bart Van Assche 2024-11-18  812  	return d.res;
2238dfb90653aa Bart Van Assche 2024-11-18  813  }
2238dfb90653aa Bart Van Assche 2024-11-18  814  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
