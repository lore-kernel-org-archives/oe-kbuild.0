Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DE1A5B9
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBtllT+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698422701; x=1729958701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fA93iWTPOc6wOLd6YG4tZ5TP9X0OvLLMlKtKlg2AKlI=;
  b=CBtllT+kmxOCy30X3YWA/A7HNMGs2V+Bii8GuChHcwVSACEssOyIs2FQ
   NVAwPdQANGVxBChjWUK6Oc74bTb+hAXXcgn4nJ8DuEVhUzcjDQPfOy3AL
   wU7OOFkid7cxIoz94LY3KVhXMH1BjqyYPYxXTa7kJbvqs6BVOehfTKXkO
   x4a6aEZmUoMr+WWRvkO+JZNX+yUExixgLGcURQ9SK9Nzi1vy2F3ddHgXW
   XYC1QnXgOIjEwMx5oxIOTA+c3UjhZMRD5KaXAH9pYG52GeQVh2QwDjMAq
   yIb+MWLTQRwwi/Myf9HRPhHe7CFDNY42IbnBIeNSnQ+51nM86wiWnSR0y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="368013956"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="368013956"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 09:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759630668"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="759630668"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2023 09:04:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwPKI-000Az9-1f;
	Fri, 27 Oct 2023 16:04:46 +0000
Date: Sat, 28 Oct 2023 00:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v17 03/12] block: add copy offload support
Message-ID: <202310272353.bsyeSGp9-lkp@intel.com>
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
In-Reply-To: <20231019110147.31672-4-nj.shetty@samsung.com>
References: <20231019110147.31672-4-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: Jonathan Corbet <corbet@lwn.net>
TO: "Alasdair Kergon" <agk@redhat.com>
TO: Mike Snitzer <snitzer@kernel.org>
TO: dm-devel@lists.linux.dev
TO: Keith Busch <kbusch@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: Chaitanya Kulkarni <kch@nvidia.com>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: "Christian Brauner" <brauner@kernel.org>
CC: martin.petersen@oracle.com
CC: linux-scsi@vger.kernel.org
CC: nitheshshetty@gmail.com
CC: anuj1072538@gmail.com
CC: gost.dev@samsung.com
CC: mcgrof@kernel.org
CC: Nitesh Shetty <nj.shetty@samsung.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Anuj Gupta <anuj20.g@samsung.com>
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org

Hi Nitesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 213f891525c222e8ed145ce1ce7ae1f47921cb9c]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-Introduce-queue-limits-and-sysfs-for-copy-offload-support/20231019-200658
base:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
patch link:    https://lore.kernel.org/r/20231019110147.31672-4-nj.shetty%40samsung.com
patch subject: [PATCH v17 03/12] block: add copy offload support
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231027/202310272353.bsyeSGp9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310272353.bsyeSGp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310272353.bsyeSGp9-lkp@intel.com/

New smatch warnings:
block/blk-lib.c:248 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?

Old smatch warnings:
block/blk-lib.c:264 blkdev_copy_offload() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +248 block/blk-lib.c

391929a15e2c18 Nitesh Shetty 2023-10-19  200  
391929a15e2c18 Nitesh Shetty 2023-10-19  201  /*
391929a15e2c18 Nitesh Shetty 2023-10-19  202   * @bdev:	block device
391929a15e2c18 Nitesh Shetty 2023-10-19  203   * @pos_in:	source offset
391929a15e2c18 Nitesh Shetty 2023-10-19  204   * @pos_out:	destination offset
391929a15e2c18 Nitesh Shetty 2023-10-19  205   * @len:	length in bytes to be copied
391929a15e2c18 Nitesh Shetty 2023-10-19  206   * @endio:	endio function to be called on completion of copy operation,
391929a15e2c18 Nitesh Shetty 2023-10-19  207   *		for synchronous operation this should be NULL
391929a15e2c18 Nitesh Shetty 2023-10-19  208   * @private:	endio function will be called with this private data,
391929a15e2c18 Nitesh Shetty 2023-10-19  209   *		for synchronous operation this should be NULL
391929a15e2c18 Nitesh Shetty 2023-10-19  210   * @gfp_mask:	memory allocation flags (for bio_alloc)
391929a15e2c18 Nitesh Shetty 2023-10-19  211   *
391929a15e2c18 Nitesh Shetty 2023-10-19  212   * For synchronous operation returns the length of bytes copied or error
391929a15e2c18 Nitesh Shetty 2023-10-19  213   * For asynchronous operation returns -EIOCBQUEUED or error
391929a15e2c18 Nitesh Shetty 2023-10-19  214   *
391929a15e2c18 Nitesh Shetty 2023-10-19  215   * Description:
391929a15e2c18 Nitesh Shetty 2023-10-19  216   *	Copy source offset to destination offset within block device, using
391929a15e2c18 Nitesh Shetty 2023-10-19  217   *	device's native copy offload feature.
391929a15e2c18 Nitesh Shetty 2023-10-19  218   *	We perform copy operation using 2 bio's.
391929a15e2c18 Nitesh Shetty 2023-10-19  219   *	1. We take a plug and send a REQ_OP_COPY_SRC bio along with source
391929a15e2c18 Nitesh Shetty 2023-10-19  220   *	sector and length. Once this bio reaches request layer, we form a
391929a15e2c18 Nitesh Shetty 2023-10-19  221   *	request and wait for dst bio to arrive.
391929a15e2c18 Nitesh Shetty 2023-10-19  222   *	2. We issue REQ_OP_COPY_DST bio along with destination sector, length.
391929a15e2c18 Nitesh Shetty 2023-10-19  223   *	Once this bio reaches request layer and find a request with previously
391929a15e2c18 Nitesh Shetty 2023-10-19  224   *	sent source info we merge the destination bio and return.
391929a15e2c18 Nitesh Shetty 2023-10-19  225   *	3. Release the plug and request is sent to driver
391929a15e2c18 Nitesh Shetty 2023-10-19  226   *	This design works only for drivers with request queue.
391929a15e2c18 Nitesh Shetty 2023-10-19  227   */
391929a15e2c18 Nitesh Shetty 2023-10-19  228  ssize_t blkdev_copy_offload(struct block_device *bdev, loff_t pos_in,
391929a15e2c18 Nitesh Shetty 2023-10-19  229  			    loff_t pos_out, size_t len,
391929a15e2c18 Nitesh Shetty 2023-10-19  230  			    void (*endio)(void *, int, ssize_t),
391929a15e2c18 Nitesh Shetty 2023-10-19  231  			    void *private, gfp_t gfp)
391929a15e2c18 Nitesh Shetty 2023-10-19  232  {
391929a15e2c18 Nitesh Shetty 2023-10-19  233  	struct blkdev_copy_io *cio;
391929a15e2c18 Nitesh Shetty 2023-10-19  234  	struct blkdev_copy_offload_io *offload_io;
391929a15e2c18 Nitesh Shetty 2023-10-19  235  	struct bio *src_bio, *dst_bio;
391929a15e2c18 Nitesh Shetty 2023-10-19  236  	size_t rem, chunk;
391929a15e2c18 Nitesh Shetty 2023-10-19  237  	size_t max_copy_bytes = bdev_max_copy_sectors(bdev) << SECTOR_SHIFT;
391929a15e2c18 Nitesh Shetty 2023-10-19  238  	ssize_t ret;
391929a15e2c18 Nitesh Shetty 2023-10-19  239  	struct blk_plug plug;
391929a15e2c18 Nitesh Shetty 2023-10-19  240  
391929a15e2c18 Nitesh Shetty 2023-10-19  241  	if (!max_copy_bytes)
391929a15e2c18 Nitesh Shetty 2023-10-19  242  		return -EOPNOTSUPP;
391929a15e2c18 Nitesh Shetty 2023-10-19  243  
391929a15e2c18 Nitesh Shetty 2023-10-19  244  	ret = blkdev_copy_sanity_check(bdev, pos_in, bdev, pos_out, len);
391929a15e2c18 Nitesh Shetty 2023-10-19  245  	if (ret)
391929a15e2c18 Nitesh Shetty 2023-10-19  246  		return ret;
391929a15e2c18 Nitesh Shetty 2023-10-19  247  
391929a15e2c18 Nitesh Shetty 2023-10-19 @248  	cio = kzalloc(sizeof(*cio), GFP_KERNEL);
391929a15e2c18 Nitesh Shetty 2023-10-19  249  	if (!cio)
391929a15e2c18 Nitesh Shetty 2023-10-19  250  		return -ENOMEM;
391929a15e2c18 Nitesh Shetty 2023-10-19  251  	atomic_set(&cio->refcount, 1);
391929a15e2c18 Nitesh Shetty 2023-10-19  252  	cio->waiter = current;
391929a15e2c18 Nitesh Shetty 2023-10-19  253  	cio->endio = endio;
391929a15e2c18 Nitesh Shetty 2023-10-19  254  	cio->private = private;
391929a15e2c18 Nitesh Shetty 2023-10-19  255  
391929a15e2c18 Nitesh Shetty 2023-10-19  256  	/*
391929a15e2c18 Nitesh Shetty 2023-10-19  257  	 * If there is a error, copied will be set to least successfully
391929a15e2c18 Nitesh Shetty 2023-10-19  258  	 * completed copied length
391929a15e2c18 Nitesh Shetty 2023-10-19  259  	 */
391929a15e2c18 Nitesh Shetty 2023-10-19  260  	cio->copied = len;
391929a15e2c18 Nitesh Shetty 2023-10-19  261  	for (rem = len; rem > 0; rem -= chunk) {
391929a15e2c18 Nitesh Shetty 2023-10-19  262  		chunk = min(rem, max_copy_bytes);
391929a15e2c18 Nitesh Shetty 2023-10-19  263  
391929a15e2c18 Nitesh Shetty 2023-10-19  264  		offload_io = kzalloc(sizeof(*offload_io), GFP_KERNEL);
391929a15e2c18 Nitesh Shetty 2023-10-19  265  		if (!offload_io)
391929a15e2c18 Nitesh Shetty 2023-10-19  266  			goto err_free_cio;
391929a15e2c18 Nitesh Shetty 2023-10-19  267  		offload_io->cio = cio;
391929a15e2c18 Nitesh Shetty 2023-10-19  268  		/*
391929a15e2c18 Nitesh Shetty 2023-10-19  269  		 * For partial completion, we use offload_io->offset to truncate
391929a15e2c18 Nitesh Shetty 2023-10-19  270  		 * successful copy length
391929a15e2c18 Nitesh Shetty 2023-10-19  271  		 */
391929a15e2c18 Nitesh Shetty 2023-10-19  272  		offload_io->offset = len - rem;
391929a15e2c18 Nitesh Shetty 2023-10-19  273  
391929a15e2c18 Nitesh Shetty 2023-10-19  274  		src_bio = bio_alloc(bdev, 0, REQ_OP_COPY_SRC, gfp);
391929a15e2c18 Nitesh Shetty 2023-10-19  275  		if (!src_bio)
391929a15e2c18 Nitesh Shetty 2023-10-19  276  			goto err_free_offload_io;
391929a15e2c18 Nitesh Shetty 2023-10-19  277  		src_bio->bi_iter.bi_size = chunk;
391929a15e2c18 Nitesh Shetty 2023-10-19  278  		src_bio->bi_iter.bi_sector = pos_in >> SECTOR_SHIFT;
391929a15e2c18 Nitesh Shetty 2023-10-19  279  
391929a15e2c18 Nitesh Shetty 2023-10-19  280  		blk_start_plug(&plug);
391929a15e2c18 Nitesh Shetty 2023-10-19  281  		dst_bio = blk_next_bio(src_bio, bdev, 0, REQ_OP_COPY_DST, gfp);
391929a15e2c18 Nitesh Shetty 2023-10-19  282  		if (!dst_bio)
391929a15e2c18 Nitesh Shetty 2023-10-19  283  			goto err_free_src_bio;
391929a15e2c18 Nitesh Shetty 2023-10-19  284  		dst_bio->bi_iter.bi_size = chunk;
391929a15e2c18 Nitesh Shetty 2023-10-19  285  		dst_bio->bi_iter.bi_sector = pos_out >> SECTOR_SHIFT;
391929a15e2c18 Nitesh Shetty 2023-10-19  286  		dst_bio->bi_end_io = blkdev_copy_offload_dst_endio;
391929a15e2c18 Nitesh Shetty 2023-10-19  287  		dst_bio->bi_private = offload_io;
391929a15e2c18 Nitesh Shetty 2023-10-19  288  
391929a15e2c18 Nitesh Shetty 2023-10-19  289  		atomic_inc(&cio->refcount);
391929a15e2c18 Nitesh Shetty 2023-10-19  290  		submit_bio(dst_bio);
391929a15e2c18 Nitesh Shetty 2023-10-19  291  		blk_finish_plug(&plug);
391929a15e2c18 Nitesh Shetty 2023-10-19  292  		pos_in += chunk;
391929a15e2c18 Nitesh Shetty 2023-10-19  293  		pos_out += chunk;
391929a15e2c18 Nitesh Shetty 2023-10-19  294  	}
391929a15e2c18 Nitesh Shetty 2023-10-19  295  
391929a15e2c18 Nitesh Shetty 2023-10-19  296  	if (atomic_dec_and_test(&cio->refcount))
391929a15e2c18 Nitesh Shetty 2023-10-19  297  		blkdev_copy_endio(cio);
391929a15e2c18 Nitesh Shetty 2023-10-19  298  	if (endio)
391929a15e2c18 Nitesh Shetty 2023-10-19  299  		return -EIOCBQUEUED;
391929a15e2c18 Nitesh Shetty 2023-10-19  300  
391929a15e2c18 Nitesh Shetty 2023-10-19  301  	return blkdev_copy_wait_for_completion_io(cio);
391929a15e2c18 Nitesh Shetty 2023-10-19  302  
391929a15e2c18 Nitesh Shetty 2023-10-19  303  err_free_src_bio:
391929a15e2c18 Nitesh Shetty 2023-10-19  304  	bio_put(src_bio);
391929a15e2c18 Nitesh Shetty 2023-10-19  305  err_free_offload_io:
391929a15e2c18 Nitesh Shetty 2023-10-19  306  	kfree(offload_io);
391929a15e2c18 Nitesh Shetty 2023-10-19  307  err_free_cio:
391929a15e2c18 Nitesh Shetty 2023-10-19  308  	cio->copied = min_t(ssize_t, cio->copied, (len - rem));
391929a15e2c18 Nitesh Shetty 2023-10-19  309  	cio->status = -ENOMEM;
391929a15e2c18 Nitesh Shetty 2023-10-19  310  	if (rem == len) {
391929a15e2c18 Nitesh Shetty 2023-10-19  311  		ret = cio->status;
391929a15e2c18 Nitesh Shetty 2023-10-19  312  		kfree(cio);
391929a15e2c18 Nitesh Shetty 2023-10-19  313  		return ret;
391929a15e2c18 Nitesh Shetty 2023-10-19  314  	}
391929a15e2c18 Nitesh Shetty 2023-10-19  315  	if (cio->endio)
391929a15e2c18 Nitesh Shetty 2023-10-19  316  		return cio->status;
391929a15e2c18 Nitesh Shetty 2023-10-19  317  
391929a15e2c18 Nitesh Shetty 2023-10-19  318  	return blkdev_copy_wait_for_completion_io(cio);
391929a15e2c18 Nitesh Shetty 2023-10-19  319  }
391929a15e2c18 Nitesh Shetty 2023-10-19  320  EXPORT_SYMBOL_GPL(blkdev_copy_offload);
391929a15e2c18 Nitesh Shetty 2023-10-19  321  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
