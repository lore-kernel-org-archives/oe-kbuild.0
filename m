Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27424A945
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764720180; cv=none; b=eP/TqPJnwVMBscrem25urU2N95+swXuXRnhKm5b++ROT3Ta7KtAGEIfuxzG6FfbeXdDMLjz91q1FDy1AyaxStR4+9/m0WszitO5t9WY9Y3tei45SwE4mAFIvtkcyJyxg1S9lnmkzs9U00FuQfFcI+gX4n2O5DLW8omgNCOoU1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764720180; c=relaxed/simple;
	bh=Wu676z+aGZD7mUP8WspaCr5ajWn97eUeNOCrtoXwwVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WfOXhEIIIZD+fVxrYk8MdtuG9TpOeKbB1JcRobrwNbb2tVLGJSQQ5r4cJPFlww/90szwzdPE2z8MgVnk6qVw+eB88ENASAxAZ7qSBW8Bv/ghM5FR6JHQcE+w8TrcMAX5+ZdeqZaucAgpTuUUvKvAWmDQEsCXT9GWylBeJakKsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL+7yl7G; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL+7yl7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764720177; x=1796256177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wu676z+aGZD7mUP8WspaCr5ajWn97eUeNOCrtoXwwVg=;
  b=LL+7yl7GG34ZrQA5ACGfwToqJYwzTE21VKyop0nyZfpAmwuUFIGtfUW8
   I+rBVDFkCoyM4dJcPHByGCvS9M7gyheeZTx5/lhJtt6CfrwEMtITkw/Pm
   63iZllUR5GSiuLuamzVrtLhzDDS8Apm2ajbIi6s9sgZ1HchDmoMITfsnU
   OOIZjTkiENgXZLVtI9bOG+3Yx8lbHPbr0pnYGi2qLI9Dhk2f+i7hDkmRh
   HgwP0x0lXixhiPcARDDwEevBKMmj8akx79brjeJd8jlVzphIyzqVrlEvW
   DbBLPM0IlGdXLhn4vlGYT4zvH2t3HnuoU9gT15HfZBdQ1bXfX4ZfNiCsC
   Q==;
X-CSE-ConnectionGUID: S8mt0OKfSEyypgTxsWWF5g==
X-CSE-MsgGUID: /aEJipAbSuWuD8HB3dZJsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70323788"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70323788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 16:02:56 -0800
X-CSE-ConnectionGUID: +MQb/nAzQFOX2yT49top6g==
X-CSE-MsgGUID: M+Em4RwZS0qTYcvsVCsw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="217858699"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 16:02:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQaKc-00000000AJZ-1Klx;
	Wed, 03 Dec 2025 00:02:54 +0000
Date: Wed, 3 Dec 2025 08:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/blk-sysfs.c:715 queue_attr_store() warn: inconsistent returns
 '&q->limits_lock'.
Message-ID: <202512030750.e2bgxIGx-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Ming Lei <ming.lei@redhat.com>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Nilay Shroff <nilay@linux.ibm.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: John Garry <john.g.garry@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7489818348e5374a8a12a309183fa44b3df41cc
commit: a16230649ce27f8ac7dd8a5b079d9657aa96de16 block: add a store_limit operations for sysfs entries
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030750.e2bgxIGx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512030750.e2bgxIGx-lkp@intel.com/

smatch warnings:
block/blk-sysfs.c:715 queue_attr_store() warn: inconsistent returns '&q->limits_lock'.

vim +715 block/blk-sysfs.c

8324aa91d1e11a Jens Axboe        2008-01-29  676  
8324aa91d1e11a Jens Axboe        2008-01-29  677  static ssize_t
8324aa91d1e11a Jens Axboe        2008-01-29  678  queue_attr_store(struct kobject *kobj, struct attribute *attr,
8324aa91d1e11a Jens Axboe        2008-01-29  679  		    const char *page, size_t length)
8324aa91d1e11a Jens Axboe        2008-01-29  680  {
8324aa91d1e11a Jens Axboe        2008-01-29  681  	struct queue_sysfs_entry *entry = to_queue(attr);
2bd85221a625b3 Christoph Hellwig 2022-11-14  682  	struct gendisk *disk = container_of(kobj, struct gendisk, queue_kobj);
2bd85221a625b3 Christoph Hellwig 2022-11-14  683  	struct request_queue *q = disk->queue;
8324aa91d1e11a Jens Axboe        2008-01-29  684  	ssize_t res;
8324aa91d1e11a Jens Axboe        2008-01-29  685  
a16230649ce27f Christoph Hellwig 2025-01-10  686  	if (!entry->store_limit && !entry->store)
8324aa91d1e11a Jens Axboe        2008-01-29  687  		return -EIO;
6728cb0e6343d4 Jens Axboe        2008-01-31  688  
734e1a8603128a Damien Le Moal    2024-09-08  689  	/*
734e1a8603128a Damien Le Moal    2024-09-08  690  	 * If the attribute needs to load a module, do it before freezing the
734e1a8603128a Damien Le Moal    2024-09-08  691  	 * queue to ensure that the module file can be read when the request
734e1a8603128a Damien Le Moal    2024-09-08  692  	 * queue is the one for the device storing the module file.
734e1a8603128a Damien Le Moal    2024-09-08  693  	 */
d51c9cdfc214dd Christoph Hellwig 2024-10-08  694  	if (entry->load_module)
d51c9cdfc214dd Christoph Hellwig 2024-10-08  695  		entry->load_module(disk, page, length);
734e1a8603128a Damien Le Moal    2024-09-08  696  
224749be6c23ef Ming Lei          2024-12-18  697  	mutex_lock(&q->sysfs_lock);
a16230649ce27f Christoph Hellwig 2025-01-10  698  	blk_mq_freeze_queue(q);
a16230649ce27f Christoph Hellwig 2025-01-10  699  	if (entry->store_limit) {
a16230649ce27f Christoph Hellwig 2025-01-10  700  		struct queue_limits lim = queue_limits_start_update(q);
a16230649ce27f Christoph Hellwig 2025-01-10  701  
a16230649ce27f Christoph Hellwig 2025-01-10  702  		res = entry->store_limit(disk, page, length, &lim);
a16230649ce27f Christoph Hellwig 2025-01-10  703  		if (res < 0) {
a16230649ce27f Christoph Hellwig 2025-01-10  704  			queue_limits_cancel_update(q);
a16230649ce27f Christoph Hellwig 2025-01-10  705  		} else {
a16230649ce27f Christoph Hellwig 2025-01-10  706  			res = queue_limits_commit_update(q, &lim);
a16230649ce27f Christoph Hellwig 2025-01-10  707  			if (!res)
a16230649ce27f Christoph Hellwig 2025-01-10  708  				res = length;
a16230649ce27f Christoph Hellwig 2025-01-10  709  		}
a16230649ce27f Christoph Hellwig 2025-01-10  710  	} else {
62e35f942231e3 Christoph Hellwig 2024-06-27  711  		res = entry->store(disk, page, length);
a16230649ce27f Christoph Hellwig 2025-01-10  712  	}
224749be6c23ef Ming Lei          2024-12-18  713  	blk_mq_unfreeze_queue(q);
a16230649ce27f Christoph Hellwig 2025-01-10  714  	mutex_unlock(&q->sysfs_lock);
8324aa91d1e11a Jens Axboe        2008-01-29 @715  	return res;
8324aa91d1e11a Jens Axboe        2008-01-29  716  }
8324aa91d1e11a Jens Axboe        2008-01-29  717  

:::::: The code at line 715 was first introduced by commit
:::::: 8324aa91d1e11a1fc25f209687a0b2e6c2ed47d0 block: split tag and sysfs handling from blk-core.c

:::::: TO: Jens Axboe <jens.axboe@oracle.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
