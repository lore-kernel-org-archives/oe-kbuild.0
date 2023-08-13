Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7913315BF
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Aug 2023 05:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691902834; x=1723438834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hixlv3/unG0DBcunIBqSPpn8dp3nsvdSMTO/QaXXpeU=;
  b=Y9J61O5Vp79cFYcBvYCosomXLhCUA9RBd4XmFiTi7RiBMLSftPpQak7o
   RdPbBwz3IKgX1og2FNlAQjIHlVAvkiCXecNf8MDH22aIRzfukO78rM2xX
   jsL5+fio3Tn045qWNFlxvfZ3e+rCpRoV9PGT+1iWjZnKNjs0f6GX3IBRH
   KU8MHSgrRakKWV9ZSF5pGjJ56+F/txju6XnTuSJP/SIJkwaBW4qJ0PJDA
   Lg6NFtFIX+roxraKf7PcZ5yJ8fomRyMT+jezK/Fq2RKF8rhL9ninZDWu4
   HKRdabp3Iz7FoHJn13OPYeymx1EgaxWk94iG38Wrg67db+uAWZqcbBIPD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="362011176"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="362011176"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 22:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="733059086"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="733059086"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Aug 2023 22:00:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV3DL-0008xc-0Z;
	Sun, 13 Aug 2023 05:00:31 +0000
Date: Sun, 13 Aug 2023 13:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 04/11] block: add emulation for copy
Message-ID: <202308131233.B29RhKuB-lkp@intel.com>
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
In-Reply-To: <20230811105300.15889-5-nj.shetty@samsung.com>
References: <20230811105300.15889-5-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Alasdair Kergon <agk@redhat.com>
TO: Mike Snitzer <snitzer@kernel.org>
TO: dm-devel@redhat.com
TO: Keith Busch <kbusch@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: Chaitanya Kulkarni <kch@nvidia.com>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
CC: martin.petersen@oracle.com
CC: mcgrof@kernel.org
CC: dlemoal@kernel.org
CC: gost.dev@samsung.com
CC: Nitesh Shetty <nj.shetty@samsung.com>
CC: Vincent Fu <vincent.fu@samsung.com>
CC: Anuj Gupta <anuj20.g@samsung.com>
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org

Hi Nitesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-Introduce-queue-limits-and-sysfs-for-copy-offload-support/20230811-192259
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230811105300.15889-5-nj.shetty%40samsung.com
patch subject: [PATCH v14 04/11] block: add emulation for copy
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20230813/202308131233.B29RhKuB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131233.B29RhKuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308131233.B29RhKuB-lkp@intel.com/

New smatch warnings:
block/blk-lib.c:496 blkdev_copy_emulation() warn: use 'gfp' here instead of GFP_KERNEL?

Old smatch warnings:
block/blk-lib.c:260 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?
block/blk-lib.c:276 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?
block/blk-lib.c:319 blkdev_copy_offload() error: dereferencing freed memory 'cio'

vim +/gfp +496 block/blk-lib.c

71342ad1494fdc Nitesh Shetty 2023-08-11  449  
71342ad1494fdc Nitesh Shetty 2023-08-11  450  static inline ssize_t queue_max_hw_bytes(struct request_queue *q)
71342ad1494fdc Nitesh Shetty 2023-08-11  451  {
71342ad1494fdc Nitesh Shetty 2023-08-11  452  	return min_t(ssize_t, queue_max_hw_sectors(q) << SECTOR_SHIFT,
71342ad1494fdc Nitesh Shetty 2023-08-11  453  		     queue_max_segments(q) << PAGE_SHIFT);
71342ad1494fdc Nitesh Shetty 2023-08-11  454  }
71342ad1494fdc Nitesh Shetty 2023-08-11  455  /*
71342ad1494fdc Nitesh Shetty 2023-08-11  456   * @bdev_in:	source block device
71342ad1494fdc Nitesh Shetty 2023-08-11  457   * @pos_in:	source offset
71342ad1494fdc Nitesh Shetty 2023-08-11  458   * @bdev_out:	destination block device
71342ad1494fdc Nitesh Shetty 2023-08-11  459   * @pos_out:	destination offset
71342ad1494fdc Nitesh Shetty 2023-08-11  460   * @len:	length in bytes to be copied
71342ad1494fdc Nitesh Shetty 2023-08-11  461   * @endio:	endio function to be called on completion of copy operation,
71342ad1494fdc Nitesh Shetty 2023-08-11  462   *		for synchronous operation this should be NULL
71342ad1494fdc Nitesh Shetty 2023-08-11  463   * @private:	endio function will be called with this private data,
71342ad1494fdc Nitesh Shetty 2023-08-11  464   *		for synchronous operation this should be NULL
71342ad1494fdc Nitesh Shetty 2023-08-11  465   * @gfp_mask:	memory allocation flags (for bio_alloc)
71342ad1494fdc Nitesh Shetty 2023-08-11  466   *
71342ad1494fdc Nitesh Shetty 2023-08-11  467   * For synchronous operation returns the length of bytes copied or error
71342ad1494fdc Nitesh Shetty 2023-08-11  468   * For asynchronous operation returns -EIOCBQUEUED or error
71342ad1494fdc Nitesh Shetty 2023-08-11  469   *
71342ad1494fdc Nitesh Shetty 2023-08-11  470   * Description:
71342ad1494fdc Nitesh Shetty 2023-08-11  471   *	If native copy offload feature is absent, caller can use this function
71342ad1494fdc Nitesh Shetty 2023-08-11  472   *	as fallback to perform copy.
71342ad1494fdc Nitesh Shetty 2023-08-11  473   *	We store information required to perform the copy along with temporary
71342ad1494fdc Nitesh Shetty 2023-08-11  474   *	buffer allocation. We async punt copy emulation to a worker. And worker
71342ad1494fdc Nitesh Shetty 2023-08-11  475   *	performs copy in 2 steps.
71342ad1494fdc Nitesh Shetty 2023-08-11  476   *	1. Read data from source to temporary buffer
71342ad1494fdc Nitesh Shetty 2023-08-11  477   *	2. Write data to destination from temporary buffer
71342ad1494fdc Nitesh Shetty 2023-08-11  478   */
71342ad1494fdc Nitesh Shetty 2023-08-11  479  ssize_t blkdev_copy_emulation(struct block_device *bdev_in, loff_t pos_in,
71342ad1494fdc Nitesh Shetty 2023-08-11  480  			      struct block_device *bdev_out, loff_t pos_out,
71342ad1494fdc Nitesh Shetty 2023-08-11  481  			      size_t len, void (*endio)(void *, int, ssize_t),
71342ad1494fdc Nitesh Shetty 2023-08-11  482  			      void *private, gfp_t gfp)
71342ad1494fdc Nitesh Shetty 2023-08-11  483  {
71342ad1494fdc Nitesh Shetty 2023-08-11  484  	struct request_queue *in = bdev_get_queue(bdev_in);
71342ad1494fdc Nitesh Shetty 2023-08-11  485  	struct request_queue *out = bdev_get_queue(bdev_out);
71342ad1494fdc Nitesh Shetty 2023-08-11  486  	struct blkdev_copy_emulation_io *emulation_io;
71342ad1494fdc Nitesh Shetty 2023-08-11  487  	struct blkdev_copy_io *cio;
71342ad1494fdc Nitesh Shetty 2023-08-11  488  	ssize_t ret;
71342ad1494fdc Nitesh Shetty 2023-08-11  489  	size_t max_hw_bytes = min(queue_max_hw_bytes(in),
71342ad1494fdc Nitesh Shetty 2023-08-11  490  				  queue_max_hw_bytes(out));
71342ad1494fdc Nitesh Shetty 2023-08-11  491  
71342ad1494fdc Nitesh Shetty 2023-08-11  492  	ret = blkdev_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len);
71342ad1494fdc Nitesh Shetty 2023-08-11  493  	if (ret)
71342ad1494fdc Nitesh Shetty 2023-08-11  494  		return ret;
71342ad1494fdc Nitesh Shetty 2023-08-11  495  
71342ad1494fdc Nitesh Shetty 2023-08-11 @496  	cio = kzalloc(sizeof(*cio), GFP_KERNEL);
71342ad1494fdc Nitesh Shetty 2023-08-11  497  	if (!cio)
71342ad1494fdc Nitesh Shetty 2023-08-11  498  		return -ENOMEM;
71342ad1494fdc Nitesh Shetty 2023-08-11  499  
71342ad1494fdc Nitesh Shetty 2023-08-11  500  	cio->waiter = current;
71342ad1494fdc Nitesh Shetty 2023-08-11  501  	cio->copied = len;
71342ad1494fdc Nitesh Shetty 2023-08-11  502  	cio->endio = endio;
71342ad1494fdc Nitesh Shetty 2023-08-11  503  	cio->private = private;
71342ad1494fdc Nitesh Shetty 2023-08-11  504  
71342ad1494fdc Nitesh Shetty 2023-08-11  505  	emulation_io = kzalloc(sizeof(*emulation_io), gfp);
71342ad1494fdc Nitesh Shetty 2023-08-11  506  	if (!emulation_io)
71342ad1494fdc Nitesh Shetty 2023-08-11  507  		goto err_free_cio;
71342ad1494fdc Nitesh Shetty 2023-08-11  508  	emulation_io->cio = cio;
71342ad1494fdc Nitesh Shetty 2023-08-11  509  	INIT_WORK(&emulation_io->emulation_work, blkdev_copy_emulation_work);
71342ad1494fdc Nitesh Shetty 2023-08-11  510  	emulation_io->pos_in = pos_in;
71342ad1494fdc Nitesh Shetty 2023-08-11  511  	emulation_io->pos_out = pos_out;
71342ad1494fdc Nitesh Shetty 2023-08-11  512  	emulation_io->len = len;
71342ad1494fdc Nitesh Shetty 2023-08-11  513  	emulation_io->bdev_in = bdev_in;
71342ad1494fdc Nitesh Shetty 2023-08-11  514  	emulation_io->bdev_out = bdev_out;
71342ad1494fdc Nitesh Shetty 2023-08-11  515  	emulation_io->gfp = gfp;
71342ad1494fdc Nitesh Shetty 2023-08-11  516  
71342ad1494fdc Nitesh Shetty 2023-08-11  517  	emulation_io->buf = blkdev_copy_alloc_buf(min(max_hw_bytes, len),
71342ad1494fdc Nitesh Shetty 2023-08-11  518  						  &emulation_io->buf_len, gfp);
71342ad1494fdc Nitesh Shetty 2023-08-11  519  	if (!emulation_io->buf)
71342ad1494fdc Nitesh Shetty 2023-08-11  520  		goto err_free_emulation_io;
71342ad1494fdc Nitesh Shetty 2023-08-11  521  
71342ad1494fdc Nitesh Shetty 2023-08-11  522  	schedule_work(&emulation_io->emulation_work);
71342ad1494fdc Nitesh Shetty 2023-08-11  523  
71342ad1494fdc Nitesh Shetty 2023-08-11  524  	if (cio->endio)
71342ad1494fdc Nitesh Shetty 2023-08-11  525  		return -EIOCBQUEUED;
71342ad1494fdc Nitesh Shetty 2023-08-11  526  
71342ad1494fdc Nitesh Shetty 2023-08-11  527  	return blkdev_copy_wait_io_completion(cio);
71342ad1494fdc Nitesh Shetty 2023-08-11  528  
71342ad1494fdc Nitesh Shetty 2023-08-11  529  err_free_emulation_io:
71342ad1494fdc Nitesh Shetty 2023-08-11  530  	kfree(emulation_io);
71342ad1494fdc Nitesh Shetty 2023-08-11  531  err_free_cio:
71342ad1494fdc Nitesh Shetty 2023-08-11  532  	kfree(cio);
71342ad1494fdc Nitesh Shetty 2023-08-11  533  	return -ENOMEM;
71342ad1494fdc Nitesh Shetty 2023-08-11  534  }
71342ad1494fdc Nitesh Shetty 2023-08-11  535  EXPORT_SYMBOL_GPL(blkdev_copy_emulation);
71342ad1494fdc Nitesh Shetty 2023-08-11  536  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
