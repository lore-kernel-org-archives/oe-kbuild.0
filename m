Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE3C959
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679602604; x=1711138604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvNPopJoaSgIvKGRxdJU+JowJtUCsPRsnZzrfNS3F6I=;
  b=UfXN52j6kNCQwwKrERlOgTjgKa67EdIjI1RLcGGDyKmOCUNYikx6x/Mg
   z45vfw+UVzodZfiKbKGnkdpl7KOfoeIIcY5B1HQLKoAGeSxElTTzuN52F
   zeb1/65aR/Qq4D5saZj+tnJR6zTkiIibzIvr5RpqGcTGWh8fTTZ/tgVS3
   qMSjjVVFjpB/GmdzRNIHSAW5JT9D174YGY7BI1NXFQ5fDIqrJC1v+UwMi
   LJ7tOUrRZR/6CUUNLc4QqKdA3fo7GHxDITO5Y1CLJ5T47t5rXDNZxU5fy
   Dq5ucrmap4tf0InQk78Xfem3XicCHU3YP171ZUgOWHJbnvHSPYJQAtA7a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402193454"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402193454"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="751634792"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="751634792"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2023 13:16:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfRMX-000Eg0-2S;
	Thu, 23 Mar 2023 20:16:41 +0000
Date: Fri, 24 Mar 2023 04:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mtd/ubi/block.c:224 ubiblock_read() error: uninitialized
 symbol 'ret'.
Message-ID: <202303240415.LyVFKy3l-lkp@intel.com>
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
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: 91cc8fbcc8c705310fc6e39899e6e6685531935b ubi: block: set BLK_MQ_F_BLOCKING
date:   7 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 weeks ago
config: m68k-randconfig-m031-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240415.LyVFKy3l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240415.LyVFKy3l-lkp@intel.com/

New smatch warnings:
drivers/mtd/ubi/block.c:224 ubiblock_read() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/mtd/ubi/block.c:438 ubiblock_create() warn: '&dev->list' not removed from list

vim +/ret +224 drivers/mtd/ubi/block.c

9d54c8a33eec78 Ezequiel Garcia    2014-02-25  179  
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  180  static blk_status_t ubiblock_read(struct request *req)
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  181  {
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  182  	struct ubiblock_pdu *pdu = blk_mq_rq_to_pdu(req);
ff1f48ee3bb3af Richard Weinberger 2015-01-10  183  	struct ubiblock *dev = req->q->queuedata;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  184  	u64 pos = blk_rq_pos(req) << 9;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  185  	int to_read = blk_rq_bytes(req);
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  186  	int bytes_left = to_read;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  187  	/* Get LEB:offset address to read from */
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  188  	int offset = do_div(pos, dev->leb_size);
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  189  	int leb = pos;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  190  	struct req_iterator iter;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  191  	struct bio_vec bvec;
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  192  	int ret;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  193  
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  194  	blk_mq_start_request(req);
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  195  
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  196  	/*
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  197  	 * It is safe to ignore the return value of blk_rq_map_sg() because
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  198  	 * the number of sg entries is limited to UBI_MAX_SG_COUNT
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  199  	 * and ubi_read_sg() will check that limit.
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  200  	 */
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  201  	ubi_sgl_init(&pdu->usgl);
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  202  	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  203  
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  204  	while (bytes_left) {
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  205  		/*
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  206  		 * We can only read one LEB at a time. Therefore if the read
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  207  		 * length is larger than one LEB size, we split the operation.
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  208  		 */
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  209  		if (offset + to_read > dev->leb_size)
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  210  			to_read = dev->leb_size - offset;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  211  
ff1f48ee3bb3af Richard Weinberger 2015-01-10  212  		ret = ubi_read_sg(dev->desc, leb, &pdu->usgl, offset, to_read);
ff1f48ee3bb3af Richard Weinberger 2015-01-10  213  		if (ret < 0)
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  214  			break;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  215  
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  216  		bytes_left -= to_read;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  217  		to_read = bytes_left;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  218  		leb += 1;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  219  		offset = 0;
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  220  	}
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  221  
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  222  	rq_for_each_segment(bvec, req, iter)
91cc8fbcc8c705 Christoph Hellwig  2023-01-12  223  		flush_dcache_page(bvec.bv_page);
91cc8fbcc8c705 Christoph Hellwig  2023-01-12 @224  	return errno_to_blk_status(ret);
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  225  }
9d54c8a33eec78 Ezequiel Garcia    2014-02-25  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
