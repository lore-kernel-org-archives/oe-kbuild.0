Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3023A4
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682755619; x=1714291619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrwOGKQe7QvFP3ryd+I3Uik9u+MIgc+Y1iUfxfk+Ptw=;
  b=gOeW8gVUVxprEVB6nBT9/uVrMhIZguOu/CehkQ9xnaGlzQ0fGAte/KxJ
   zUQBzjeMsSxduak/CGxz50LOOW2W3k2B6yyYC8d71eCwDcJgg5aYSllmM
   lElRfCQvBQ6grSspdbCjbNgIry+c5iYT4xp54B6LDjvFsmQ2Y92kpDRYS
   +lny0uyke5s0sn57Ta9FAjrLOl0Zyj8Z50NkM+wEdtT44xUskQ4X6CsZd
   lfMvXYJ9DnLj1uPayRGcQSFZ0BtT3EtOYPlFsSbkWiMIjifWOMxSb0APY
   ha+ZDIsKsaMXgAUE1HGenPbVS8fv21R7QK0M+ojBMAbzqVTZUeqQ7oeIl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346699208"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="346699208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 01:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941422473"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="941422473"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2023 01:06:57 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psfbc-0000zj-30;
	Sat, 29 Apr 2023 08:06:56 +0000
Date: Sat, 29 Apr 2023 16:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c:688
 sun8i_ss_hash_run() error: uninitialized symbol 'addr_xpad'.
Message-ID: <202304291534.kALUsnSv-lkp@intel.com>
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
TO: Corentin Labbe <clabbe@baylibre.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89d77f71f493a3663b10fa812d17f472935d24be
commit: 801b7d572c0ad46b116730121e9d3beefb0c7004 crypto: sun8i-ss - add hmac(sha1)
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230429/202304291534.kALUsnSv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304291534.kALUsnSv-lkp@intel.com/

New smatch warnings:
drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c:688 sun8i_ss_hash_run() error: uninitialized symbol 'addr_xpad'.

Old smatch warnings:
drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c:695 sun8i_ss_hash_run() error: uninitialized symbol 'err'.

vim +/addr_xpad +688 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c

d9b45418a91773 Corentin Labbe 2020-09-18  526  
d9b45418a91773 Corentin Labbe 2020-09-18  527  	rctx->method = ss->variant->alg_hash[algt->ss_algo_id];
d9b45418a91773 Corentin Labbe 2020-09-18  528  
d9b45418a91773 Corentin Labbe 2020-09-18  529  	nr_sgs = dma_map_sg(ss->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
d9b45418a91773 Corentin Labbe 2020-09-18  530  	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
d9b45418a91773 Corentin Labbe 2020-09-18  531  		dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
d9b45418a91773 Corentin Labbe 2020-09-18  532  		err = -EINVAL;
d9b45418a91773 Corentin Labbe 2020-09-18  533  		goto theend;
d9b45418a91773 Corentin Labbe 2020-09-18  534  	}
d9b45418a91773 Corentin Labbe 2020-09-18  535  
d9b45418a91773 Corentin Labbe 2020-09-18  536  	addr_res = dma_map_single(ss->dev, result, digestsize, DMA_FROM_DEVICE);
d9b45418a91773 Corentin Labbe 2020-09-18  537  	if (dma_mapping_error(ss->dev, addr_res)) {
d9b45418a91773 Corentin Labbe 2020-09-18  538  		dev_err(ss->dev, "DMA map dest\n");
d9b45418a91773 Corentin Labbe 2020-09-18  539  		err = -EINVAL;
801b7d572c0ad4 Corentin Labbe 2022-05-02  540  		goto err_dma_result;
d9b45418a91773 Corentin Labbe 2020-09-18  541  	}
d9b45418a91773 Corentin Labbe 2020-09-18  542  
c35e523a8b6962 Corentin Labbe 2022-05-02  543  	j = 0;
d9b45418a91773 Corentin Labbe 2020-09-18  544  	len = areq->nbytes;
c149e4763d28bb Corentin Labbe 2022-05-02  545  	sg = areq->src;
c149e4763d28bb Corentin Labbe 2022-05-02  546  	i = 0;
c149e4763d28bb Corentin Labbe 2022-05-02  547  	while (len > 0 && sg) {
c149e4763d28bb Corentin Labbe 2022-05-02  548  		if (sg_dma_len(sg) == 0) {
c149e4763d28bb Corentin Labbe 2022-05-02  549  			sg = sg_next(sg);
c149e4763d28bb Corentin Labbe 2022-05-02  550  			continue;
c149e4763d28bb Corentin Labbe 2022-05-02  551  		}
d9b45418a91773 Corentin Labbe 2020-09-18  552  		todo = min(len, sg_dma_len(sg));
c35e523a8b6962 Corentin Labbe 2022-05-02  553  		/* only the last SG could be with a size not modulo64 */
c35e523a8b6962 Corentin Labbe 2022-05-02  554  		if (todo % 64 == 0) {
c35e523a8b6962 Corentin Labbe 2022-05-02  555  			rctx->t_src[i].addr = sg_dma_address(sg);
d9b45418a91773 Corentin Labbe 2020-09-18  556  			rctx->t_src[i].len = todo / 4;
d9b45418a91773 Corentin Labbe 2020-09-18  557  			rctx->t_dst[i].addr = addr_res;
d9b45418a91773 Corentin Labbe 2020-09-18  558  			rctx->t_dst[i].len = digestsize / 4;
c35e523a8b6962 Corentin Labbe 2022-05-02  559  			len -= todo;
c35e523a8b6962 Corentin Labbe 2022-05-02  560  		} else {
c35e523a8b6962 Corentin Labbe 2022-05-02  561  			scatterwalk_map_and_copy(bf, sg, 0, todo, 0);
c35e523a8b6962 Corentin Labbe 2022-05-02  562  			j += todo / 4;
c35e523a8b6962 Corentin Labbe 2022-05-02  563  			len -= todo;
c35e523a8b6962 Corentin Labbe 2022-05-02  564  		}
c149e4763d28bb Corentin Labbe 2022-05-02  565  		sg = sg_next(sg);
c149e4763d28bb Corentin Labbe 2022-05-02  566  		i++;
d9b45418a91773 Corentin Labbe 2020-09-18  567  	}
d9b45418a91773 Corentin Labbe 2020-09-18  568  	if (len > 0) {
d9b45418a91773 Corentin Labbe 2020-09-18  569  		dev_err(ss->dev, "remaining len %d\n", len);
d9b45418a91773 Corentin Labbe 2020-09-18  570  		err = -EINVAL;
d9b45418a91773 Corentin Labbe 2020-09-18  571  		goto theend;
d9b45418a91773 Corentin Labbe 2020-09-18  572  	}
d9b45418a91773 Corentin Labbe 2020-09-18  573  
c35e523a8b6962 Corentin Labbe 2022-05-02  574  	if (j > 0)
c35e523a8b6962 Corentin Labbe 2022-05-02  575  		i--;
c35e523a8b6962 Corentin Labbe 2022-05-02  576  
801b7d572c0ad4 Corentin Labbe 2022-05-02  577  retry:
d9b45418a91773 Corentin Labbe 2020-09-18  578  	byte_count = areq->nbytes;
801b7d572c0ad4 Corentin Labbe 2022-05-02  579  	if (tfmctx->keylen && hmac == 0) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  580  		hmac = 1;
801b7d572c0ad4 Corentin Labbe 2022-05-02  581  		/* shift all SG one slot up, to free slot 0 for IPAD */
801b7d572c0ad4 Corentin Labbe 2022-05-02  582  		for (k = 6; k >= 0; k--) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  583  			rctx->t_src[k + 1].addr = rctx->t_src[k].addr;
801b7d572c0ad4 Corentin Labbe 2022-05-02  584  			rctx->t_src[k + 1].len = rctx->t_src[k].len;
801b7d572c0ad4 Corentin Labbe 2022-05-02  585  			rctx->t_dst[k + 1].addr = rctx->t_dst[k].addr;
801b7d572c0ad4 Corentin Labbe 2022-05-02  586  			rctx->t_dst[k + 1].len = rctx->t_dst[k].len;
801b7d572c0ad4 Corentin Labbe 2022-05-02  587  		}
801b7d572c0ad4 Corentin Labbe 2022-05-02  588  		addr_xpad = dma_map_single(ss->dev, tfmctx->ipad, bs, DMA_TO_DEVICE);
801b7d572c0ad4 Corentin Labbe 2022-05-02  589  		if (dma_mapping_error(ss->dev, addr_xpad)) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  590  			dev_err(ss->dev, "Fail to create DMA mapping of ipad\n");
801b7d572c0ad4 Corentin Labbe 2022-05-02  591  			goto err_dma_xpad;
801b7d572c0ad4 Corentin Labbe 2022-05-02  592  		}
801b7d572c0ad4 Corentin Labbe 2022-05-02  593  		rctx->t_src[0].addr = addr_xpad;
801b7d572c0ad4 Corentin Labbe 2022-05-02  594  		rctx->t_src[0].len = bs / 4;
801b7d572c0ad4 Corentin Labbe 2022-05-02  595  		rctx->t_dst[0].addr = addr_res;
801b7d572c0ad4 Corentin Labbe 2022-05-02  596  		rctx->t_dst[0].len = digestsize / 4;
801b7d572c0ad4 Corentin Labbe 2022-05-02  597  		i++;
801b7d572c0ad4 Corentin Labbe 2022-05-02  598  		byte_count = areq->nbytes + bs;
801b7d572c0ad4 Corentin Labbe 2022-05-02  599  	}
801b7d572c0ad4 Corentin Labbe 2022-05-02  600  	if (tfmctx->keylen && hmac == 2) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  601  		for (i = 0; i < MAX_SG; i++) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  602  			rctx->t_src[i].addr = 0;
801b7d572c0ad4 Corentin Labbe 2022-05-02  603  			rctx->t_src[i].len = 0;
801b7d572c0ad4 Corentin Labbe 2022-05-02  604  			rctx->t_dst[i].addr = 0;
801b7d572c0ad4 Corentin Labbe 2022-05-02  605  			rctx->t_dst[i].len = 0;
801b7d572c0ad4 Corentin Labbe 2022-05-02  606  		}
801b7d572c0ad4 Corentin Labbe 2022-05-02  607  
801b7d572c0ad4 Corentin Labbe 2022-05-02  608  		addr_res = dma_map_single(ss->dev, result, digestsize, DMA_FROM_DEVICE);
801b7d572c0ad4 Corentin Labbe 2022-05-02  609  		if (dma_mapping_error(ss->dev, addr_res)) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  610  			dev_err(ss->dev, "Fail to create DMA mapping of result\n");
801b7d572c0ad4 Corentin Labbe 2022-05-02  611  			err = -EINVAL;
801b7d572c0ad4 Corentin Labbe 2022-05-02  612  			goto err_dma_result;
801b7d572c0ad4 Corentin Labbe 2022-05-02  613  		}
801b7d572c0ad4 Corentin Labbe 2022-05-02  614  		addr_xpad = dma_map_single(ss->dev, tfmctx->opad, bs, DMA_TO_DEVICE);
801b7d572c0ad4 Corentin Labbe 2022-05-02  615  		if (dma_mapping_error(ss->dev, addr_xpad)) {
801b7d572c0ad4 Corentin Labbe 2022-05-02  616  			dev_err(ss->dev, "Fail to create DMA mapping of opad\n");
801b7d572c0ad4 Corentin Labbe 2022-05-02  617  			goto err_dma_xpad;
801b7d572c0ad4 Corentin Labbe 2022-05-02  618  		}
801b7d572c0ad4 Corentin Labbe 2022-05-02  619  		rctx->t_src[0].addr = addr_xpad;
801b7d572c0ad4 Corentin Labbe 2022-05-02  620  		rctx->t_src[0].len = bs / 4;
801b7d572c0ad4 Corentin Labbe 2022-05-02  621  
801b7d572c0ad4 Corentin Labbe 2022-05-02  622  		memcpy(bf, result, digestsize);
801b7d572c0ad4 Corentin Labbe 2022-05-02  623  		j = digestsize / 4;
801b7d572c0ad4 Corentin Labbe 2022-05-02  624  		i = 1;
801b7d572c0ad4 Corentin Labbe 2022-05-02  625  		byte_count = digestsize + bs;
801b7d572c0ad4 Corentin Labbe 2022-05-02  626  
801b7d572c0ad4 Corentin Labbe 2022-05-02  627  		rctx->t_dst[0].addr = addr_res;
801b7d572c0ad4 Corentin Labbe 2022-05-02  628  		rctx->t_dst[0].len = digestsize / 4;
801b7d572c0ad4 Corentin Labbe 2022-05-02  629  	}
801b7d572c0ad4 Corentin Labbe 2022-05-02  630  
d9b45418a91773 Corentin Labbe 2020-09-18  631  	switch (algt->ss_algo_id) {
d9b45418a91773 Corentin Labbe 2020-09-18  632  	case SS_ID_HASH_MD5:
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  633  		j = hash_pad(bf, 4096, j, byte_count, true, bs);
d9b45418a91773 Corentin Labbe 2020-09-18  634  		break;
d9b45418a91773 Corentin Labbe 2020-09-18  635  	case SS_ID_HASH_SHA1:
d9b45418a91773 Corentin Labbe 2020-09-18  636  	case SS_ID_HASH_SHA224:
d9b45418a91773 Corentin Labbe 2020-09-18  637  	case SS_ID_HASH_SHA256:
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  638  		j = hash_pad(bf, 4096, j, byte_count, false, bs);
d9b45418a91773 Corentin Labbe 2020-09-18  639  		break;
d9b45418a91773 Corentin Labbe 2020-09-18  640  	}
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  641  	if (!j) {
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  642  		err = -EINVAL;
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  643  		goto theend;
e76ee4db9eb8f4 Corentin Labbe 2022-05-02  644  	}
d9b45418a91773 Corentin Labbe 2020-09-18  645  
d9b45418a91773 Corentin Labbe 2020-09-18  646  	addr_pad = dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
d9b45418a91773 Corentin Labbe 2020-09-18  647  	if (dma_mapping_error(ss->dev, addr_pad)) {
d9b45418a91773 Corentin Labbe 2020-09-18  648  		dev_err(ss->dev, "DMA error on padding SG\n");
d9b45418a91773 Corentin Labbe 2020-09-18  649  		err = -EINVAL;
801b7d572c0ad4 Corentin Labbe 2022-05-02  650  		goto err_dma_pad;
d9b45418a91773 Corentin Labbe 2020-09-18  651  	}
d86e3f37a6d05d Corentin Labbe 2022-05-02  652  	rctx->t_src[i].addr = addr_pad;
d86e3f37a6d05d Corentin Labbe 2022-05-02  653  	rctx->t_src[i].len = j;
d86e3f37a6d05d Corentin Labbe 2022-05-02  654  	rctx->t_dst[i].addr = addr_res;
d86e3f37a6d05d Corentin Labbe 2022-05-02  655  	rctx->t_dst[i].len = digestsize / 4;
d9b45418a91773 Corentin Labbe 2020-09-18  656  
d9b45418a91773 Corentin Labbe 2020-09-18  657  	err = sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq->base.tfm));
d9b45418a91773 Corentin Labbe 2020-09-18  658  
801b7d572c0ad4 Corentin Labbe 2022-05-02  659  	/*
801b7d572c0ad4 Corentin Labbe 2022-05-02  660  	 * mini helper for checking dma map/unmap
801b7d572c0ad4 Corentin Labbe 2022-05-02  661  	 * flow start for hmac = 0 (and HMAC = 1)
801b7d572c0ad4 Corentin Labbe 2022-05-02  662  	 * HMAC = 0
801b7d572c0ad4 Corentin Labbe 2022-05-02  663  	 * MAP src
801b7d572c0ad4 Corentin Labbe 2022-05-02  664  	 * MAP res
801b7d572c0ad4 Corentin Labbe 2022-05-02  665  	 *
801b7d572c0ad4 Corentin Labbe 2022-05-02  666  	 * retry:
801b7d572c0ad4 Corentin Labbe 2022-05-02  667  	 * if hmac then hmac = 1
801b7d572c0ad4 Corentin Labbe 2022-05-02  668  	 *	MAP xpad (ipad)
801b7d572c0ad4 Corentin Labbe 2022-05-02  669  	 * if hmac == 2
801b7d572c0ad4 Corentin Labbe 2022-05-02  670  	 *	MAP res
801b7d572c0ad4 Corentin Labbe 2022-05-02  671  	 *	MAP xpad (opad)
801b7d572c0ad4 Corentin Labbe 2022-05-02  672  	 * MAP pad
801b7d572c0ad4 Corentin Labbe 2022-05-02  673  	 * ACTION!
801b7d572c0ad4 Corentin Labbe 2022-05-02  674  	 * UNMAP pad
801b7d572c0ad4 Corentin Labbe 2022-05-02  675  	 * if hmac
801b7d572c0ad4 Corentin Labbe 2022-05-02  676  	 *	UNMAP xpad
801b7d572c0ad4 Corentin Labbe 2022-05-02  677  	 * UNMAP res
801b7d572c0ad4 Corentin Labbe 2022-05-02  678  	 * if hmac < 2
801b7d572c0ad4 Corentin Labbe 2022-05-02  679  	 *	UNMAP SRC
801b7d572c0ad4 Corentin Labbe 2022-05-02  680  	 *
801b7d572c0ad4 Corentin Labbe 2022-05-02  681  	 * if hmac = 1 then hmac = 2 goto retry
801b7d572c0ad4 Corentin Labbe 2022-05-02  682  	 */
801b7d572c0ad4 Corentin Labbe 2022-05-02  683  
d9b45418a91773 Corentin Labbe 2020-09-18  684  	dma_unmap_single(ss->dev, addr_pad, j * 4, DMA_TO_DEVICE);
801b7d572c0ad4 Corentin Labbe 2022-05-02  685  
801b7d572c0ad4 Corentin Labbe 2022-05-02  686  err_dma_pad:
801b7d572c0ad4 Corentin Labbe 2022-05-02  687  	if (hmac > 0)
801b7d572c0ad4 Corentin Labbe 2022-05-02 @688  		dma_unmap_single(ss->dev, addr_xpad, bs, DMA_TO_DEVICE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
