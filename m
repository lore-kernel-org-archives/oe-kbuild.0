Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900F139B
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Aug 2023 03:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691898516; x=1723434516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9lTogJX2Ni/ZH2Q7L7o+t6cmoQv+Ut9T/Jq40eb2K8=;
  b=bsS+IZ56TRYbyM8e6mgUApac6yvEqs/s7QMLNZkknl9IP8QB7pu1fW5V
   44pGlesisrY4UpY/Z2dHnOgzBCk29YOomo1p59u3ceWjzJ/BbPROnpf+W
   ezlXi6j4Nl3MPX/4DCXwPqSmiYk0YezHL4LDLaWsnUsrem8XZwIY/t+FH
   gX+p1L8CIuXwNdIQiEEX+libqh8zRVIgqZq55B+4Cd54F/vcbvGxNPg+a
   QZUuWtNnN369wclxt7n8dCbZoeYtw8Sg7oHzQJwPr2MaGf1skFHhfGBKj
   zJSjCsIiGofqCWLqSUK93EO5D6T9zAXGQWgQF8uLVeUh0rq/8nyrzA2G3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="352191595"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="352191595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 20:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="847203389"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="847203389"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2023 20:48:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV25e-0008wS-1X;
	Sun, 13 Aug 2023 03:48:30 +0000
Date: Sun, 13 Aug 2023 11:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 03/11] block: add copy offload support
Message-ID: <202308131151.rPKkesMS-lkp@intel.com>
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
In-Reply-To: <20230811105300.15889-4-nj.shetty@samsung.com>
References: <20230811105300.15889-4-nj.shetty@samsung.com>
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
patch link:    https://lore.kernel.org/r/20230811105300.15889-4-nj.shetty%40samsung.com
patch subject: [PATCH v14 03/11] block: add copy offload support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20230813/202308131151.rPKkesMS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131151.rPKkesMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308131151.rPKkesMS-lkp@intel.com/

New smatch warnings:
block/blk-lib.c:246 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?
block/blk-lib.c:305 blkdev_copy_offload() error: dereferencing freed memory 'cio'

Old smatch warnings:
block/blk-lib.c:262 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +246 block/blk-lib.c

c0debc6f05047b Nitesh Shetty 2023-08-11  199  
c0debc6f05047b Nitesh Shetty 2023-08-11  200  /*
c0debc6f05047b Nitesh Shetty 2023-08-11  201   * @bdev:	block device
c0debc6f05047b Nitesh Shetty 2023-08-11  202   * @pos_in:	source offset
c0debc6f05047b Nitesh Shetty 2023-08-11  203   * @pos_out:	destination offset
c0debc6f05047b Nitesh Shetty 2023-08-11  204   * @len:	length in bytes to be copied
c0debc6f05047b Nitesh Shetty 2023-08-11  205   * @endio:	endio function to be called on completion of copy operation,
c0debc6f05047b Nitesh Shetty 2023-08-11  206   *		for synchronous operation this should be NULL
c0debc6f05047b Nitesh Shetty 2023-08-11  207   * @private:	endio function will be called with this private data,
c0debc6f05047b Nitesh Shetty 2023-08-11  208   *		for synchronous operation this should be NULL
c0debc6f05047b Nitesh Shetty 2023-08-11  209   * @gfp_mask:	memory allocation flags (for bio_alloc)
c0debc6f05047b Nitesh Shetty 2023-08-11  210   *
c0debc6f05047b Nitesh Shetty 2023-08-11  211   * For synchronous operation returns the length of bytes copied or error
c0debc6f05047b Nitesh Shetty 2023-08-11  212   * For asynchronous operation returns -EIOCBQUEUED or error
c0debc6f05047b Nitesh Shetty 2023-08-11  213   *
c0debc6f05047b Nitesh Shetty 2023-08-11  214   * Description:
c0debc6f05047b Nitesh Shetty 2023-08-11  215   *	Copy source offset to destination offset within block device, using
c0debc6f05047b Nitesh Shetty 2023-08-11  216   *	device's native copy offload feature.
c0debc6f05047b Nitesh Shetty 2023-08-11  217   *	We perform copy operation by sending 2 bio's.
c0debc6f05047b Nitesh Shetty 2023-08-11  218   *	1. We take a plug and send a REQ_OP_COPY_SRC bio along with source
c0debc6f05047b Nitesh Shetty 2023-08-11  219   *	sector and length. Once this bio reaches request layer, we form a
c0debc6f05047b Nitesh Shetty 2023-08-11  220   *	request and wait for dst bio to arrive.
c0debc6f05047b Nitesh Shetty 2023-08-11  221   *	2. We issue REQ_OP_COPY_DST bio along with destination sector, length.
c0debc6f05047b Nitesh Shetty 2023-08-11  222   *	Once this bio reaches request layer and find a request with previously
c0debc6f05047b Nitesh Shetty 2023-08-11  223   *	sent source info we merge the destination bio and return.
c0debc6f05047b Nitesh Shetty 2023-08-11  224   *	3. Release the plug and request is sent to driver
c0debc6f05047b Nitesh Shetty 2023-08-11  225   *	This design works only for drivers with request queue.
c0debc6f05047b Nitesh Shetty 2023-08-11  226   */
c0debc6f05047b Nitesh Shetty 2023-08-11  227  ssize_t blkdev_copy_offload(struct block_device *bdev, loff_t pos_in,
c0debc6f05047b Nitesh Shetty 2023-08-11  228  			    loff_t pos_out, size_t len,
c0debc6f05047b Nitesh Shetty 2023-08-11  229  			    void (*endio)(void *, int, ssize_t),
c0debc6f05047b Nitesh Shetty 2023-08-11  230  			    void *private, gfp_t gfp)
c0debc6f05047b Nitesh Shetty 2023-08-11  231  {
c0debc6f05047b Nitesh Shetty 2023-08-11  232  	struct blkdev_copy_io *cio;
c0debc6f05047b Nitesh Shetty 2023-08-11  233  	struct blkdev_copy_offload_io *offload_io;
c0debc6f05047b Nitesh Shetty 2023-08-11  234  	struct bio *src_bio, *dst_bio;
c0debc6f05047b Nitesh Shetty 2023-08-11  235  	ssize_t rem, chunk, ret;
c0debc6f05047b Nitesh Shetty 2023-08-11  236  	ssize_t max_copy_bytes = bdev_max_copy_sectors(bdev) << SECTOR_SHIFT;
c0debc6f05047b Nitesh Shetty 2023-08-11  237  	struct blk_plug plug;
c0debc6f05047b Nitesh Shetty 2023-08-11  238  
c0debc6f05047b Nitesh Shetty 2023-08-11  239  	if (!max_copy_bytes)
c0debc6f05047b Nitesh Shetty 2023-08-11  240  		return -EINVAL;
c0debc6f05047b Nitesh Shetty 2023-08-11  241  
c0debc6f05047b Nitesh Shetty 2023-08-11  242  	ret = blkdev_copy_sanity_check(bdev, pos_in, bdev, pos_out, len);
c0debc6f05047b Nitesh Shetty 2023-08-11  243  	if (ret)
c0debc6f05047b Nitesh Shetty 2023-08-11  244  		return ret;
c0debc6f05047b Nitesh Shetty 2023-08-11  245  
c0debc6f05047b Nitesh Shetty 2023-08-11 @246  	cio = kzalloc(sizeof(*cio), GFP_KERNEL);
c0debc6f05047b Nitesh Shetty 2023-08-11  247  	if (!cio)
c0debc6f05047b Nitesh Shetty 2023-08-11  248  		return -ENOMEM;
c0debc6f05047b Nitesh Shetty 2023-08-11  249  	atomic_set(&cio->refcount, 1);
c0debc6f05047b Nitesh Shetty 2023-08-11  250  	cio->waiter = current;
c0debc6f05047b Nitesh Shetty 2023-08-11  251  	cio->endio = endio;
c0debc6f05047b Nitesh Shetty 2023-08-11  252  	cio->private = private;
c0debc6f05047b Nitesh Shetty 2023-08-11  253  
c0debc6f05047b Nitesh Shetty 2023-08-11  254  	/*
c0debc6f05047b Nitesh Shetty 2023-08-11  255  	 * If there is a error, copied will be set to least successfully
c0debc6f05047b Nitesh Shetty 2023-08-11  256  	 * completed copied length
c0debc6f05047b Nitesh Shetty 2023-08-11  257  	 */
c0debc6f05047b Nitesh Shetty 2023-08-11  258  	cio->copied = len;
c0debc6f05047b Nitesh Shetty 2023-08-11  259  	for (rem = len; rem > 0; rem -= chunk) {
c0debc6f05047b Nitesh Shetty 2023-08-11  260  		chunk = min(rem, max_copy_bytes);
c0debc6f05047b Nitesh Shetty 2023-08-11  261  
c0debc6f05047b Nitesh Shetty 2023-08-11  262  		offload_io = kzalloc(sizeof(*offload_io), GFP_KERNEL);
c0debc6f05047b Nitesh Shetty 2023-08-11  263  		if (!offload_io)
c0debc6f05047b Nitesh Shetty 2023-08-11  264  			goto err_free_cio;
c0debc6f05047b Nitesh Shetty 2023-08-11  265  		offload_io->cio = cio;
c0debc6f05047b Nitesh Shetty 2023-08-11  266  		/*
c0debc6f05047b Nitesh Shetty 2023-08-11  267  		 * For partial completion, we use offload_io->offset to truncate
c0debc6f05047b Nitesh Shetty 2023-08-11  268  		 * successful copy length
c0debc6f05047b Nitesh Shetty 2023-08-11  269  		 */
c0debc6f05047b Nitesh Shetty 2023-08-11  270  		offload_io->offset = len - rem;
c0debc6f05047b Nitesh Shetty 2023-08-11  271  
c0debc6f05047b Nitesh Shetty 2023-08-11  272  		src_bio = bio_alloc(bdev, 0, REQ_OP_COPY_SRC, gfp);
c0debc6f05047b Nitesh Shetty 2023-08-11  273  		if (!src_bio)
c0debc6f05047b Nitesh Shetty 2023-08-11  274  			goto err_free_offload_io;
c0debc6f05047b Nitesh Shetty 2023-08-11  275  		src_bio->bi_iter.bi_size = chunk;
c0debc6f05047b Nitesh Shetty 2023-08-11  276  		src_bio->bi_iter.bi_sector = pos_in >> SECTOR_SHIFT;
c0debc6f05047b Nitesh Shetty 2023-08-11  277  
c0debc6f05047b Nitesh Shetty 2023-08-11  278  		blk_start_plug(&plug);
c0debc6f05047b Nitesh Shetty 2023-08-11  279  		dst_bio = blk_next_bio(src_bio, bdev, 0, REQ_OP_COPY_DST, gfp);
c0debc6f05047b Nitesh Shetty 2023-08-11  280  		dst_bio->bi_iter.bi_size = chunk;
c0debc6f05047b Nitesh Shetty 2023-08-11  281  		dst_bio->bi_iter.bi_sector = pos_out >> SECTOR_SHIFT;
c0debc6f05047b Nitesh Shetty 2023-08-11  282  		dst_bio->bi_end_io = blkdev_copy_offload_dst_endio;
c0debc6f05047b Nitesh Shetty 2023-08-11  283  		dst_bio->bi_private = offload_io;
c0debc6f05047b Nitesh Shetty 2023-08-11  284  
c0debc6f05047b Nitesh Shetty 2023-08-11  285  		if (rem != chunk)
c0debc6f05047b Nitesh Shetty 2023-08-11  286  			atomic_inc(&cio->refcount);
c0debc6f05047b Nitesh Shetty 2023-08-11  287  		submit_bio(dst_bio);
c0debc6f05047b Nitesh Shetty 2023-08-11  288  		blk_finish_plug(&plug);
c0debc6f05047b Nitesh Shetty 2023-08-11  289  		pos_in += chunk;
c0debc6f05047b Nitesh Shetty 2023-08-11  290  		pos_out += chunk;
c0debc6f05047b Nitesh Shetty 2023-08-11  291  	}
c0debc6f05047b Nitesh Shetty 2023-08-11  292  
c0debc6f05047b Nitesh Shetty 2023-08-11  293  	if (cio->endio)
c0debc6f05047b Nitesh Shetty 2023-08-11  294  		return -EIOCBQUEUED;
c0debc6f05047b Nitesh Shetty 2023-08-11  295  
c0debc6f05047b Nitesh Shetty 2023-08-11  296  	return blkdev_copy_wait_io_completion(cio);
c0debc6f05047b Nitesh Shetty 2023-08-11  297  
c0debc6f05047b Nitesh Shetty 2023-08-11  298  err_free_offload_io:
c0debc6f05047b Nitesh Shetty 2023-08-11  299  	kfree(offload_io);
c0debc6f05047b Nitesh Shetty 2023-08-11  300  err_free_cio:
c0debc6f05047b Nitesh Shetty 2023-08-11  301  	cio->copied = min_t(ssize_t, cio->copied, (len - rem));
c0debc6f05047b Nitesh Shetty 2023-08-11  302  	cio->status = -ENOMEM;
c0debc6f05047b Nitesh Shetty 2023-08-11  303  	if (rem == len) {
c0debc6f05047b Nitesh Shetty 2023-08-11  304  		kfree(cio);
c0debc6f05047b Nitesh Shetty 2023-08-11 @305  		return cio->status;
c0debc6f05047b Nitesh Shetty 2023-08-11  306  	}
c0debc6f05047b Nitesh Shetty 2023-08-11  307  	if (cio->endio)
c0debc6f05047b Nitesh Shetty 2023-08-11  308  		return cio->status;
c0debc6f05047b Nitesh Shetty 2023-08-11  309  
c0debc6f05047b Nitesh Shetty 2023-08-11  310  	return blkdev_copy_wait_io_completion(cio);
c0debc6f05047b Nitesh Shetty 2023-08-11  311  }
c0debc6f05047b Nitesh Shetty 2023-08-11  312  EXPORT_SYMBOL_GPL(blkdev_copy_offload);
c0debc6f05047b Nitesh Shetty 2023-08-11  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
