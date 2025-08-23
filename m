Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3F1A9FA4
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 04:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755921611; cv=none; b=YtZK1wFd9iXlQEo47DJ2MeUNvAvPhBdm+pOeZF4dCja451z7D3z/5MLkzQiKvL2g1qB42LDHJ25upJ/+UKQUaCBulyHKuTom2O6UwxEy1VTrLdeNJ1Ho8YDsYXKbm/yhjWEAPAat2hujQyxfUUNrtav0RhToipr0TIH6A62pLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755921611; c=relaxed/simple;
	bh=qWfHow+6fi0LqC5n23mc+INdUHpn3LWIufI/rClfZso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELUOwiJIBNmF+WNS89Jjt1oyOqIiao/iYPfiITvb8BdJifIKoZBPxB/HK/VnzXLa29RC6hljkVTFntz8GxCaVgl9MTX7K9/2IelYdrHE7MHccgIEizwFLbNeenf0WIYs0bC2wl5EW6sB1kpAsvqXcufj5bb/FzrDqQq0d8D+Fb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bslZpls+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bslZpls+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755921608; x=1787457608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWfHow+6fi0LqC5n23mc+INdUHpn3LWIufI/rClfZso=;
  b=bslZpls+dg3zWD/ChBleA9s9ldoqiMe5hjkqWxZH0ciajvO2Vg075bLe
   QsBTheXRSErTEj5H4hF7OIZUN0TAdzWwLYCm/QV2q7PxbW+2Zg7LsEQ4k
   5Lerej+/sCn/HTmZXDfqAUpm75esiHrMmCQJT+i8cOaZo7MFr7uTl+kvW
   pukfrXxof7ByjK8WPR1OEs5Kw5q6oGi7yjWoz/hwVMOWOb6JXfZYSzE/C
   7wHhfGOjVu+ziP7ZP9navFhUAB9LMhu/uqdTPBDcSK3OLkFm1o4FF0glF
   5Bz5s8TDGKu2kg0ZsMAisTzqfRcPD6JzV3ClvExoBtxm9NT7CCoaKz34D
   w==;
X-CSE-ConnectionGUID: 6ZIziOk3SEedz64mhTtgyA==
X-CSE-MsgGUID: SNjBSMNnRoeVOID8Qof0mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58290984"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58290984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 21:00:08 -0700
X-CSE-ConnectionGUID: ep4/V8XCT3KFhZ4G/YPyZA==
X-CSE-MsgGUID: B50ldU70QT2TV/qmgdK4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206028112"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2025 21:00:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upfQ0-000M4Z-0t;
	Sat, 23 Aug 2025 04:00:04 +0000
Date: Sat, 23 Aug 2025 11:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/blk-sysfs.c:715 queue_attr_store() warn: inconsistent returns
 '&q->limits_lock'.
Message-ID: <202508231113.ClVzivQP-lkp@intel.com>
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
head:   6debb69041724bae8a8a4d0ac60502754c1cd945
commit: a16230649ce27f8ac7dd8a5b079d9657aa96de16 block: add a store_limit operations for sysfs entries
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231113.ClVzivQP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508231113.ClVzivQP-lkp@intel.com/

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
