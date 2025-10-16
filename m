Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB291E5215
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760641706; cv=none; b=k/OvHlZoVwWfpcgS25y5UbE8siQMjEt6ys3qCDM5eznq7kbYEso/+h/uxB5Uj7LuCE/QyTONe2CWmNzeusp2snujz8n5ovxGCjks6faGZ2qSF46ZlD7cY5zLrPIBDZb4zcyBtDRdRaNnvyROkeYPBAbcrHWKU8nDUJQumSg2bTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760641706; c=relaxed/simple;
	bh=w7E6hfAw5jppbVEMhJwgJ3HswTZiiQzjSzSYzsUi5rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+fRG9T5Yos53CNwXW78hAVFHJNLjFtYPrp5IdkZp/Oy4yFRcHp5ofGfIDiDaUPxKRTjbY7P7V7/f+yOyvSNuKGOkoaR//bXf/mau0+B59RXX8SlM02sD8M8kI6Ushi5NoLi/eEXhpaSM1fGcuZ6ISKkZEjJaemCP6koUsXANOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCj2jw7X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCj2jw7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760641703; x=1792177703;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w7E6hfAw5jppbVEMhJwgJ3HswTZiiQzjSzSYzsUi5rw=;
  b=YCj2jw7XfmrgUiDE7La2N8auAtkINS2MLD+OmU2cPN05kn2eRyLdBf1g
   4KUC67lDn+fX6JHmI/IeCWKRJRdyEvDV9cas5kfl33OKymwB2Wlf4iq3m
   /urHAhzxJrKm48uV6z2pTjY2Mkbeoxa/IoPsr+gl9TFNnbZEJ8/16XcSl
   5jpOX5nQ/SXoUW98uBsZdYiyvqMxATsbPlHKHq7yiX2kkZZrqs5igHvMy
   leO33A3HuvShPOEdubNALrl3X2jN0B1cQMvSHb7YcgkVl3s1zhnux/fhO
   Jt2oFVB/I4gjdybA/5jYVtJmIpy8mPwbaafplBBQwhN6JOYXXHfq6AVZ9
   Q==;
X-CSE-ConnectionGUID: Mqo5NzFhQMyP8uUlyIZSZg==
X-CSE-MsgGUID: Qj5kPyGpR+K5FUwytnx/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66713465"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66713465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:08:22 -0700
X-CSE-ConnectionGUID: XkztIgLlTF2LQQA9H56fpw==
X-CSE-MsgGUID: MmIh6VVPR+uglG1zqjj9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213504553"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 12:08:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9TKc-0005Aj-34;
	Thu, 16 Oct 2025 19:08:12 +0000
Date: Fri, 17 Oct 2025 03:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/blk-cgroup.c:845 blkg_conf_open_bdev_frozen() error: we
 previously assumed 'ctx->bdev' could be null (see line 832)
Message-ID: <202510170324.JVGAvxHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nilay Shroff <nilay@linux.ibm.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ea30958b3054f5e488fa0b33c352723f7ab3a2a
commit: 9730763f4756e32520cb86778331465e8d063a8f block: correct locking order for protecting blk-wbt parameters
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20251016 (https://download.01.org/0day-ci/archive/20251017/202510170324.JVGAvxHk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510170324.JVGAvxHk-lkp@intel.com/

smatch warnings:
block/blk-cgroup.c:845 blkg_conf_open_bdev_frozen() error: we previously assumed 'ctx->bdev' could be null (see line 832)

vim +845 block/blk-cgroup.c

faffaab2895914a Tejun Heo         2023-04-12  767  
faffaab2895914a Tejun Heo         2023-04-12  768  /**
faffaab2895914a Tejun Heo         2023-04-12  769   * blkg_conf_open_bdev - parse and open bdev for per-blkg config update
faffaab2895914a Tejun Heo         2023-04-12  770   * @ctx: blkg_conf_ctx initialized with blkg_conf_init()
015d254cb02b6d8 Tejun Heo         2019-08-28  771   *
faffaab2895914a Tejun Heo         2023-04-12  772   * Parse the device node prefix part, MAJ:MIN, of per-blkg config update from
faffaab2895914a Tejun Heo         2023-04-12  773   * @ctx->input and get and store the matching bdev in @ctx->bdev. @ctx->body is
faffaab2895914a Tejun Heo         2023-04-12  774   * set to point past the device node prefix.
015d254cb02b6d8 Tejun Heo         2019-08-28  775   *
faffaab2895914a Tejun Heo         2023-04-12  776   * This function may be called multiple times on @ctx and the extra calls become
faffaab2895914a Tejun Heo         2023-04-12  777   * NOOPs. blkg_conf_prep() implicitly calls this function. Use this function
faffaab2895914a Tejun Heo         2023-04-12  778   * explicitly if bdev access is needed without resolving the blkcg / policy part
faffaab2895914a Tejun Heo         2023-04-12  779   * of @ctx->input. Returns -errno on error.
015d254cb02b6d8 Tejun Heo         2019-08-28  780   */
faffaab2895914a Tejun Heo         2023-04-12  781  int blkg_conf_open_bdev(struct blkg_conf_ctx *ctx)
015d254cb02b6d8 Tejun Heo         2019-08-28  782  {
faffaab2895914a Tejun Heo         2023-04-12  783  	char *input = ctx->input;
015d254cb02b6d8 Tejun Heo         2019-08-28  784  	unsigned int major, minor;
22ae8ce8b89241c Christoph Hellwig 2020-11-26  785  	struct block_device *bdev;
22ae8ce8b89241c Christoph Hellwig 2020-11-26  786  	int key_len;
015d254cb02b6d8 Tejun Heo         2019-08-28  787  
faffaab2895914a Tejun Heo         2023-04-12  788  	if (ctx->bdev)
faffaab2895914a Tejun Heo         2023-04-12  789  		return 0;
faffaab2895914a Tejun Heo         2023-04-12  790  
015d254cb02b6d8 Tejun Heo         2019-08-28  791  	if (sscanf(input, "%u:%u%n", &major, &minor, &key_len) != 2)
faffaab2895914a Tejun Heo         2023-04-12  792  		return -EINVAL;
015d254cb02b6d8 Tejun Heo         2019-08-28  793  
015d254cb02b6d8 Tejun Heo         2019-08-28  794  	input += key_len;
015d254cb02b6d8 Tejun Heo         2019-08-28  795  	if (!isspace(*input))
faffaab2895914a Tejun Heo         2023-04-12  796  		return -EINVAL;
015d254cb02b6d8 Tejun Heo         2019-08-28  797  	input = skip_spaces(input);
015d254cb02b6d8 Tejun Heo         2019-08-28  798  
22ae8ce8b89241c Christoph Hellwig 2020-11-26  799  	bdev = blkdev_get_no_open(MKDEV(major, minor));
22ae8ce8b89241c Christoph Hellwig 2020-11-26  800  	if (!bdev)
faffaab2895914a Tejun Heo         2023-04-12  801  		return -ENODEV;
22ae8ce8b89241c Christoph Hellwig 2020-11-26  802  	if (bdev_is_partition(bdev)) {
22ae8ce8b89241c Christoph Hellwig 2020-11-26  803  		blkdev_put_no_open(bdev);
faffaab2895914a Tejun Heo         2023-04-12  804  		return -ENODEV;
015d254cb02b6d8 Tejun Heo         2019-08-28  805  	}
015d254cb02b6d8 Tejun Heo         2019-08-28  806  
a13bd91be223187 Yu Kuai           2023-04-14  807  	mutex_lock(&bdev->bd_queue->rq_qos_mutex);
a13bd91be223187 Yu Kuai           2023-04-14  808  	if (!disk_live(bdev->bd_disk)) {
a13bd91be223187 Yu Kuai           2023-04-14  809  		blkdev_put_no_open(bdev);
a13bd91be223187 Yu Kuai           2023-04-14  810  		mutex_unlock(&bdev->bd_queue->rq_qos_mutex);
a13bd91be223187 Yu Kuai           2023-04-14  811  		return -ENODEV;
a13bd91be223187 Yu Kuai           2023-04-14  812  	}
a13bd91be223187 Yu Kuai           2023-04-14  813  
faffaab2895914a Tejun Heo         2023-04-12  814  	ctx->body = input;
faffaab2895914a Tejun Heo         2023-04-12  815  	ctx->bdev = bdev;
faffaab2895914a Tejun Heo         2023-04-12  816  	return 0;
015d254cb02b6d8 Tejun Heo         2019-08-28  817  }
9730763f4756e32 Nilay Shroff      2025-03-19  818  /*
9730763f4756e32 Nilay Shroff      2025-03-19  819   * Similar to blkg_conf_open_bdev, but additionally freezes the queue,
9730763f4756e32 Nilay Shroff      2025-03-19  820   * acquires q->elevator_lock, and ensures the correct locking order
9730763f4756e32 Nilay Shroff      2025-03-19  821   * between q->elevator_lock and q->rq_qos_mutex.
9730763f4756e32 Nilay Shroff      2025-03-19  822   *
9730763f4756e32 Nilay Shroff      2025-03-19  823   * This function returns negative error on failure. On success it returns
9730763f4756e32 Nilay Shroff      2025-03-19  824   * memflags which must be saved and later passed to blkg_conf_exit_frozen
9730763f4756e32 Nilay Shroff      2025-03-19  825   * for restoring the memalloc scope.
9730763f4756e32 Nilay Shroff      2025-03-19  826   */
9730763f4756e32 Nilay Shroff      2025-03-19  827  unsigned long __must_check blkg_conf_open_bdev_frozen(struct blkg_conf_ctx *ctx)
9730763f4756e32 Nilay Shroff      2025-03-19  828  {
9730763f4756e32 Nilay Shroff      2025-03-19  829  	int ret;
9730763f4756e32 Nilay Shroff      2025-03-19  830  	unsigned long memflags;
9730763f4756e32 Nilay Shroff      2025-03-19  831  
9730763f4756e32 Nilay Shroff      2025-03-19 @832  	if (ctx->bdev)
9730763f4756e32 Nilay Shroff      2025-03-19  833  		return -EINVAL;
9730763f4756e32 Nilay Shroff      2025-03-19  834  
9730763f4756e32 Nilay Shroff      2025-03-19  835  	ret = blkg_conf_open_bdev(ctx);
9730763f4756e32 Nilay Shroff      2025-03-19  836  	if (ret < 0)
9730763f4756e32 Nilay Shroff      2025-03-19  837  		return ret;
9730763f4756e32 Nilay Shroff      2025-03-19  838  	/*
9730763f4756e32 Nilay Shroff      2025-03-19  839  	 * At this point, we haven’t started protecting anything related to QoS,
9730763f4756e32 Nilay Shroff      2025-03-19  840  	 * so we release q->rq_qos_mutex here, which was first acquired in blkg_
9730763f4756e32 Nilay Shroff      2025-03-19  841  	 * conf_open_bdev. Later, we re-acquire q->rq_qos_mutex after freezing
9730763f4756e32 Nilay Shroff      2025-03-19  842  	 * the queue and acquiring q->elevator_lock to maintain the correct
9730763f4756e32 Nilay Shroff      2025-03-19  843  	 * locking order.
9730763f4756e32 Nilay Shroff      2025-03-19  844  	 */
9730763f4756e32 Nilay Shroff      2025-03-19 @845  	mutex_unlock(&ctx->bdev->bd_queue->rq_qos_mutex);
9730763f4756e32 Nilay Shroff      2025-03-19  846  
9730763f4756e32 Nilay Shroff      2025-03-19  847  	memflags = blk_mq_freeze_queue(ctx->bdev->bd_queue);
9730763f4756e32 Nilay Shroff      2025-03-19  848  	mutex_lock(&ctx->bdev->bd_queue->elevator_lock);
9730763f4756e32 Nilay Shroff      2025-03-19  849  	mutex_lock(&ctx->bdev->bd_queue->rq_qos_mutex);
9730763f4756e32 Nilay Shroff      2025-03-19  850  
9730763f4756e32 Nilay Shroff      2025-03-19  851  	return memflags;
9730763f4756e32 Nilay Shroff      2025-03-19  852  }
015d254cb02b6d8 Tejun Heo         2019-08-28  853  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
