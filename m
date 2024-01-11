Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D4E544
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jan 2024 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtsWo6IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704961079; x=1736497079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZWzpEks75ib463rW3inixxVBIJ4e6zjZcFQPF0VEnc=;
  b=TtsWo6IUjO5biyzphiJHtobEOyFHgu+PZN/WkV9zguuN/1my3t4UC44k
   Q5LIOLbMRox/teAc0yW2PWmA14wwg3upIUKGSOFaEo9iXGFYi8C/yOTCH
   YQYmnPY0T4dkEZiKek3rfZ8fxKTUWh7yUZx2opoowxY0ksU4BcIg9jGHY
   a8XPuY1v59wZYAyR2lKqqzihx2hUejKVS/UbTmFctxl6zohnpEv1QlLE7
   Gk7w2QdwDQRFqtSxbDgzgcS/k4QtCmPA0rH8qVrSu8412LT54bb6ipcUl
   BpcW7oLYznosv4WDd8w6MumMgBC+i79jv2bJztJCUBdeMFFXsoXGwsQ0b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12263320"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="12263320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 00:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="782534042"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="782534042"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Jan 2024 00:17:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNqFx-0007zb-1X;
	Thu, 11 Jan 2024 08:17:41 +0000
Date: Thu, 11 Jan 2024 16:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/blk-mq.c:2992 blk_rq_prep_clone() error: uninitialized symbol
 'bio'.
Message-ID: <202401111612.Z2gDhcUB-lkp@intel.com>
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
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de927f6c0b07d9e698416c5b287c521b07694cac
commit: 06c8c691e2820077936e59ad334eb806e90b69eb block: move request based cloning helpers to blk-mq.c
date:   2 years, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240111/202401111612.Z2gDhcUB-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401111612.Z2gDhcUB-lkp@intel.com/

smatch warnings:
block/blk-mq.c:2992 blk_rq_prep_clone() error: uninitialized symbol 'bio'.

vim +/bio +2992 block/blk-mq.c

06c8c691e28200 Christoph Hellwig 2021-11-17  2931  
06c8c691e28200 Christoph Hellwig 2021-11-17  2932  /**
06c8c691e28200 Christoph Hellwig 2021-11-17  2933   * blk_rq_prep_clone - Helper function to setup clone request
06c8c691e28200 Christoph Hellwig 2021-11-17  2934   * @rq: the request to be setup
06c8c691e28200 Christoph Hellwig 2021-11-17  2935   * @rq_src: original request to be cloned
06c8c691e28200 Christoph Hellwig 2021-11-17  2936   * @bs: bio_set that bios for clone are allocated from
06c8c691e28200 Christoph Hellwig 2021-11-17  2937   * @gfp_mask: memory allocation mask for bio
06c8c691e28200 Christoph Hellwig 2021-11-17  2938   * @bio_ctr: setup function to be called for each clone bio.
06c8c691e28200 Christoph Hellwig 2021-11-17  2939   *           Returns %0 for success, non %0 for failure.
06c8c691e28200 Christoph Hellwig 2021-11-17  2940   * @data: private data to be passed to @bio_ctr
06c8c691e28200 Christoph Hellwig 2021-11-17  2941   *
06c8c691e28200 Christoph Hellwig 2021-11-17  2942   * Description:
06c8c691e28200 Christoph Hellwig 2021-11-17  2943   *     Clones bios in @rq_src to @rq, and copies attributes of @rq_src to @rq.
06c8c691e28200 Christoph Hellwig 2021-11-17  2944   *     Also, pages which the original bios are pointing to are not copied
06c8c691e28200 Christoph Hellwig 2021-11-17  2945   *     and the cloned bios just point same pages.
06c8c691e28200 Christoph Hellwig 2021-11-17  2946   *     So cloned bios must be completed before original bios, which means
06c8c691e28200 Christoph Hellwig 2021-11-17  2947   *     the caller must complete @rq before @rq_src.
06c8c691e28200 Christoph Hellwig 2021-11-17  2948   */
06c8c691e28200 Christoph Hellwig 2021-11-17  2949  int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
06c8c691e28200 Christoph Hellwig 2021-11-17  2950  		      struct bio_set *bs, gfp_t gfp_mask,
06c8c691e28200 Christoph Hellwig 2021-11-17  2951  		      int (*bio_ctr)(struct bio *, struct bio *, void *),
06c8c691e28200 Christoph Hellwig 2021-11-17  2952  		      void *data)
06c8c691e28200 Christoph Hellwig 2021-11-17  2953  {
06c8c691e28200 Christoph Hellwig 2021-11-17  2954  	struct bio *bio, *bio_src;
06c8c691e28200 Christoph Hellwig 2021-11-17  2955  
06c8c691e28200 Christoph Hellwig 2021-11-17  2956  	if (!bs)
06c8c691e28200 Christoph Hellwig 2021-11-17  2957  		bs = &fs_bio_set;
06c8c691e28200 Christoph Hellwig 2021-11-17  2958  
06c8c691e28200 Christoph Hellwig 2021-11-17  2959  	__rq_for_each_bio(bio_src, rq_src) {
06c8c691e28200 Christoph Hellwig 2021-11-17  2960  		bio = bio_clone_fast(bio_src, gfp_mask, bs);
06c8c691e28200 Christoph Hellwig 2021-11-17  2961  		if (!bio)
06c8c691e28200 Christoph Hellwig 2021-11-17  2962  			goto free_and_out;
06c8c691e28200 Christoph Hellwig 2021-11-17  2963  
06c8c691e28200 Christoph Hellwig 2021-11-17  2964  		if (bio_ctr && bio_ctr(bio, bio_src, data))
06c8c691e28200 Christoph Hellwig 2021-11-17  2965  			goto free_and_out;
06c8c691e28200 Christoph Hellwig 2021-11-17  2966  
06c8c691e28200 Christoph Hellwig 2021-11-17  2967  		if (rq->bio) {
06c8c691e28200 Christoph Hellwig 2021-11-17  2968  			rq->biotail->bi_next = bio;
06c8c691e28200 Christoph Hellwig 2021-11-17  2969  			rq->biotail = bio;
06c8c691e28200 Christoph Hellwig 2021-11-17  2970  		} else {
06c8c691e28200 Christoph Hellwig 2021-11-17  2971  			rq->bio = rq->biotail = bio;
06c8c691e28200 Christoph Hellwig 2021-11-17  2972  		}
06c8c691e28200 Christoph Hellwig 2021-11-17  2973  		bio = NULL;
06c8c691e28200 Christoph Hellwig 2021-11-17  2974  	}
06c8c691e28200 Christoph Hellwig 2021-11-17  2975  
06c8c691e28200 Christoph Hellwig 2021-11-17  2976  	/* Copy attributes of the original request to the clone request. */
06c8c691e28200 Christoph Hellwig 2021-11-17  2977  	rq->__sector = blk_rq_pos(rq_src);
06c8c691e28200 Christoph Hellwig 2021-11-17  2978  	rq->__data_len = blk_rq_bytes(rq_src);
06c8c691e28200 Christoph Hellwig 2021-11-17  2979  	if (rq_src->rq_flags & RQF_SPECIAL_PAYLOAD) {
06c8c691e28200 Christoph Hellwig 2021-11-17  2980  		rq->rq_flags |= RQF_SPECIAL_PAYLOAD;
06c8c691e28200 Christoph Hellwig 2021-11-17  2981  		rq->special_vec = rq_src->special_vec;
06c8c691e28200 Christoph Hellwig 2021-11-17  2982  	}
06c8c691e28200 Christoph Hellwig 2021-11-17  2983  	rq->nr_phys_segments = rq_src->nr_phys_segments;
06c8c691e28200 Christoph Hellwig 2021-11-17  2984  	rq->ioprio = rq_src->ioprio;
06c8c691e28200 Christoph Hellwig 2021-11-17  2985  
06c8c691e28200 Christoph Hellwig 2021-11-17  2986  	if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
06c8c691e28200 Christoph Hellwig 2021-11-17  2987  		goto free_and_out;
06c8c691e28200 Christoph Hellwig 2021-11-17  2988  
06c8c691e28200 Christoph Hellwig 2021-11-17  2989  	return 0;
06c8c691e28200 Christoph Hellwig 2021-11-17  2990  
06c8c691e28200 Christoph Hellwig 2021-11-17  2991  free_and_out:
06c8c691e28200 Christoph Hellwig 2021-11-17 @2992  	if (bio)
06c8c691e28200 Christoph Hellwig 2021-11-17  2993  		bio_put(bio);
06c8c691e28200 Christoph Hellwig 2021-11-17  2994  	blk_rq_unprep_clone(rq);
06c8c691e28200 Christoph Hellwig 2021-11-17  2995  
06c8c691e28200 Christoph Hellwig 2021-11-17  2996  	return -ENOMEM;
06c8c691e28200 Christoph Hellwig 2021-11-17  2997  }
06c8c691e28200 Christoph Hellwig 2021-11-17  2998  EXPORT_SYMBOL_GPL(blk_rq_prep_clone);
06c8c691e28200 Christoph Hellwig 2021-11-17  2999  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
