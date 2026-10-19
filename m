Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452670;
	b=kLr2Ad30W3fZGRU9S9XzdwDf/Oh/wkShGtcuQp4ASnTvKdmxDPnvZfdOiLCPvdbY41Zn
	 sKGPxvSW5LcG3ubzezH/aWsc4oCfY3CnMjE6vkLu1+X3PDJB3aoyBFLXoaLYKwEe6RbGZ
	 lVwoJ4sexSpRcbyxL49z8t+wNscJ1hzE5sTIZO9v8ofQGEgCH3EBMsA7UVhnCCUFXQEov
	 oj9g5d0ML1GAYBtL5rBX0UdyiMxO4yw94lutiEdD+jgfm6whR5YxuFlabhdo7Iq44YMfy
	 8ZsV/9NqcUn7UAIlXOiIdh6da7+K/xvw5QQ4nBAp45w/jpLuMZGXF3FDfGQXuVnHO/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452670;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fU8S0ZI2Bv8FeU4QmLWc+h9F6tRWuGWep5nis/QNEGM=;
	b=hT1cDuUve44dIzDHwwHCE0qBfHjq74b9/+7OeOV8PmEqHKyXUQWUy9THKrEUBeR+uXUP
	 0GPdjPMrr4WI7UFPpzCcFr+fArKKK0wgE6DaeMNVWxonVOBcQKUSsThCTRo05mvSIPsSM
	 QnGNSKRVh9OExycRTD+0rsB/n/Ih6eDx8oRgtvpH/ndSFVvof863L0aPbbhmMnBYWC8Jc
	 YvoH1qsBmvYkWXinK0QwXx3cdRwSNjnGlZKctAWMPcsokpW4JknTWEeLDyg7vawh9SoFl
	 me5rNkFppHFJ1DBS99jlbA7wcSHHIJwrswVpS6kP/CrIyo1yvSiwbgSt8OUSjCRnB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+Wc1I7X;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC37A606A319
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 23:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC37A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+Wc1I7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792452669; x=1823988669;
  h=date:from:to:cc:subject:message-id;
  bh=x+9/XIS3qnQS9CKJnireEBIfIAVcEoEy4LlX+asRUvQ=;
  b=V+Wc1I7XEGQxFHB4Kl6A5ckf7W5i93rljMEWp6CS+GO48BHFrr2kAG+L
   8+u/haMGrUUniPINdBOrQQS29fujXffPac7zY4sDnBSj20MA9KRr9iRk9
   vWEHXlREzw4dS7uEqG2UO4X0GOemiyBg2sX7d56RuFS0yvnwk/3mCTdZt
   NiFhBB4X8jTT71hzH2Lchdf2HIxHeS28Y5Fhx+aimHiKyrtBDrK+GI461
   iiSKg+qW51LgMJreqcH7AnqFk93IJ9BuweAhlLtc8n4F1uUe9cypATtH4
   QfOU1bs/mBP3o3N8O3wmkIV+9s4juqddDovOv10EZNtb8kYGTZJNs/UwB
   w==;
X-CSE-ConnectionGUID: nUoedhEzRfOW0ubKkxmCcA==
X-CSE-MsgGUID: 0VBtYcXVQdOH49fj3tm3xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1044216"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1044216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 16:31:09 -0700
X-CSE-ConnectionGUID: ufYXrig+SgK3qCGqh1tfcg==
X-CSE-MsgGUID: 6WJRhhHYS1WHh5PJDitwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2638267"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2026 16:31:07 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIwor-000000005y3-0CbL;
	Mon, 19 Oct 2026 23:31:05 +0000
Date: Tue, 20 Oct 2026 01:30:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 8/8]
 drivers/nvme/host/multipath.c:332 nvme_ns_head_submit_bio() warn: variable
 dereferenced before check 'bio' (see line 320)
Message-ID: <202610200148.xdHHqCtw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0bb006856b8d8b803fde48d026d89a5fafcd5263
commit: 7ec9a45fc4ee7fc1054c2cabf8b09a6bc708472e [8/8] block: handle bio_split_to_limits() NULL return
:::::: branch date: 8 hours ago
:::::: commit date: 3 years, 9 months ago
config: arm-randconfig-r2200-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200148.xdHHqCtw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200148.xdHHqCtw-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/multipath.c:332 nvme_ns_head_submit_bio() warn: variable dereferenced before check 'bio' (see line 320)

Old smatch warnings:
drivers/nvme/host/multipath.c:869 nvme_mpath_init_identify() warn: missing error code 'error'

vim +/bio +332 drivers/nvme/host/multipath.c

0157ec8dad3c8fc Sagi Grimberg     2019-07-25  317  
1496bd4936d215f Christoph Hellwig 2021-04-07  318  static blk_qc_t nvme_ns_head_submit_bio(struct bio *bio)
32acab3181c7053 Christoph Hellwig 2017-11-02  319  {
309dca309fc39a9 Christoph Hellwig 2021-01-24 @320  	struct nvme_ns_head *head = bio->bi_bdev->bd_disk->private_data;
32acab3181c7053 Christoph Hellwig 2017-11-02  321  	struct device *dev = disk_to_dev(head->disk);
32acab3181c7053 Christoph Hellwig 2017-11-02  322  	struct nvme_ns *ns;
32acab3181c7053 Christoph Hellwig 2017-11-02  323  	blk_qc_t ret = BLK_QC_T_NONE;
32acab3181c7053 Christoph Hellwig 2017-11-02  324  	int srcu_idx;
32acab3181c7053 Christoph Hellwig 2017-11-02  325  
525aa5a705d86e1 Hannes Reinecke   2019-04-30  326  	/*
f695ca3886ce72b Christoph Hellwig 2020-07-01  327  	 * The namespace might be going away and the bio might be moved to a
f695ca3886ce72b Christoph Hellwig 2020-07-01  328  	 * different queue via blk_steal_bios(), so we need to use the bio_split
f695ca3886ce72b Christoph Hellwig 2020-07-01  329  	 * pool from the original queue to allocate the bvecs from.
525aa5a705d86e1 Hannes Reinecke   2019-04-30  330  	 */
f695ca3886ce72b Christoph Hellwig 2020-07-01  331  	blk_queue_split(&bio);
7ec9a45fc4ee7fc Jens Axboe        2023-01-04 @332  	if (!bio)
7ec9a45fc4ee7fc Jens Axboe        2023-01-04  333  		return BLK_QC_T_NONE;
525aa5a705d86e1 Hannes Reinecke   2019-04-30  334  
32acab3181c7053 Christoph Hellwig 2017-11-02  335  	srcu_idx = srcu_read_lock(&head->srcu);
32acab3181c7053 Christoph Hellwig 2017-11-02  336  	ns = nvme_find_path(head);
32acab3181c7053 Christoph Hellwig 2017-11-02  337  	if (likely(ns)) {
a7c7f7b2b641bef Christoph Hellwig 2021-01-26  338  		bio_set_dev(bio, ns->disk->part0);
32acab3181c7053 Christoph Hellwig 2017-11-02  339  		bio->bi_opf |= REQ_NVME_MPATH;
1c02fca620f7273 Christoph Hellwig 2020-12-03  340  		trace_block_bio_remap(bio, disk_devt(ns->head->disk),
2796b569591c6f0 Hannes Reinecke   2018-06-07  341  				      bio->bi_iter.bi_sector);
5a6c35f9af41611 Christoph Hellwig 2020-07-01  342  		ret = submit_bio_noacct(bio);
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  343  	} else if (nvme_available_path(head)) {
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  344  		dev_warn_ratelimited(dev, "no usable path - requeuing I/O\n");
32acab3181c7053 Christoph Hellwig 2017-11-02  345  
32acab3181c7053 Christoph Hellwig 2017-11-02  346  		spin_lock_irq(&head->requeue_lock);
32acab3181c7053 Christoph Hellwig 2017-11-02  347  		bio_list_add(&head->requeue_list, bio);
32acab3181c7053 Christoph Hellwig 2017-11-02  348  		spin_unlock_irq(&head->requeue_lock);
32acab3181c7053 Christoph Hellwig 2017-11-02  349  	} else {
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  350  		dev_warn_ratelimited(dev, "no available path - failing I/O\n");
32acab3181c7053 Christoph Hellwig 2017-11-02  351  
32acab3181c7053 Christoph Hellwig 2017-11-02  352  		bio->bi_status = BLK_STS_IOERR;
32acab3181c7053 Christoph Hellwig 2017-11-02  353  		bio_endio(bio);
32acab3181c7053 Christoph Hellwig 2017-11-02  354  	}
32acab3181c7053 Christoph Hellwig 2017-11-02  355  
32acab3181c7053 Christoph Hellwig 2017-11-02  356  	srcu_read_unlock(&head->srcu, srcu_idx);
32acab3181c7053 Christoph Hellwig 2017-11-02  357  	return ret;
32acab3181c7053 Christoph Hellwig 2017-11-02  358  }
32acab3181c7053 Christoph Hellwig 2017-11-02  359  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
