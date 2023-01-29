Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A4317F1
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674994929; x=1706530929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CPdWPQO4EgguIS6KEHsmFHYfQf77in18AlZYuNCmMY=;
  b=a5TPrVT6TjB+aDc5q2uLSFkCmbRiz73NRMl4Txn/MIr0X4B44c8rm7Je
   Y+61hmQ34G0RHbQiVCYJ95uMO0zFhpalPcd43iFwCW2PQk0xzgknhkGz/
   X2BjurCaFpAERJ+3fwdnKIxcX1WylvGkEWhX42BDvrHgMJNGQVCE5MzUI
   Rcgulign9x6w8dc8qQuFQjb376JjFsbw2gHoqoFFnWqoJZE2Ffc9MsIab
   Q5MxxvNrE2pSJ/xg9kPpECVxfilSqKDC3Bz11SGdJsx29jNL2dWSXxs8E
   c8DLjmOP6AsMs9fveRtjm5K6Yfyv18euudCGp0Td08wJjkenY3vduCIpS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326062832"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="326062832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 04:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="657140725"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="657140725"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jan 2023 04:22:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM6hC-0002nG-2P;
	Sun, 29 Jan 2023 12:22:06 +0000
Date: Sun, 29 Jan 2023 20:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bvanassche:block-small-segments 10/13] block/blk.h:343
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 340)
Message-ID: <202301292052.ofpUPNlC-lkp@intel.com>
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

tree:   https://github.com/bvanassche/linux block-small-segments
head:   c776ad1c2e1e0afaefb3ef5f1710dc3886f5348f
commit: b91c4a42d14ad8bfd74387c10c8c21db9fb2b998 [10/13] block: Add support for filesystem requests and small segments
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: m68k-randconfig-m041-20230129 (https://download.01.org/0day-ci/archive/20230129/202301292052.ofpUPNlC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
block/blk.h:343 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)

vim +343 block/blk.h

83d016ac86428d Bart Van Assche   2018-01-17  308  
3ad5cee5cd000d Christoph Hellwig 2020-03-24  309  ssize_t part_size_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  310  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  311  ssize_t part_stat_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  312  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  313  ssize_t part_inflight_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  314  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  315  ssize_t part_fail_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  316  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  317  ssize_t part_fail_store(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  318  		const char *buf, size_t count);
581d4e28d9195a Jens Axboe        2008-09-14  319  ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
581d4e28d9195a Jens Axboe        2008-09-14  320  ssize_t part_timeout_store(struct device *, struct device_attribute *,
581d4e28d9195a Jens Axboe        2008-09-14  321  				const char *, size_t);
581d4e28d9195a Jens Axboe        2008-09-14  322  
c55ddd9082f757 Christoph Hellwig 2022-07-27  323  static inline bool bio_may_exceed_limits(struct bio *bio,
aa261f20589d89 Bart Van Assche   2022-10-25  324  					 const struct queue_limits *lim)
abd45c159df5fc Jens Axboe        2021-10-13  325  {
abd45c159df5fc Jens Axboe        2021-10-13  326  	switch (bio_op(bio)) {
abd45c159df5fc Jens Axboe        2021-10-13  327  	case REQ_OP_DISCARD:
abd45c159df5fc Jens Axboe        2021-10-13  328  	case REQ_OP_SECURE_ERASE:
abd45c159df5fc Jens Axboe        2021-10-13  329  	case REQ_OP_WRITE_ZEROES:
abd45c159df5fc Jens Axboe        2021-10-13  330  		return true; /* non-trivial splitting decisions */
abd45c159df5fc Jens Axboe        2021-10-13  331  	default:
abd45c159df5fc Jens Axboe        2021-10-13  332  		break;
abd45c159df5fc Jens Axboe        2021-10-13  333  	}
abd45c159df5fc Jens Axboe        2021-10-13  334  
abd45c159df5fc Jens Axboe        2021-10-13  335  	/*
b91c4a42d14ad8 Bart Van Assche   2022-09-27  336  	 * Check whether bio splitting should be performed. This check may
b91c4a42d14ad8 Bart Van Assche   2022-09-27  337  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  338  	 */
b91c4a42d14ad8 Bart Van Assche   2022-09-27  339  	if (blk_queue_sub_page_limits(lim) &&
b91c4a42d14ad8 Bart Van Assche   2022-09-27 @340  	    bio->bi_io_vec && bio->bi_io_vec->bv_len > lim->max_segment_size)
b91c4a42d14ad8 Bart Van Assche   2022-09-27  341  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  342  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @343  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
abd45c159df5fc Jens Axboe        2021-10-13  344  }
abd45c159df5fc Jens Axboe        2021-10-13  345  

:::::: The code at line 343 was first introduced by commit
:::::: abd45c159df5fcb7ac820e2825dac85de7c01c21 block: handle fast path of bio splitting inline

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
