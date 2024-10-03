Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4710145B07
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947226; cv=none; b=qQo0fDU0/YnGI3NJyGBuG+tdV83tKFiWRzc6W40svvEKnLD2tzxNa7/3me5iu0XObBnNHIskTy8iwjWQiwlJnWsNrXpu2u1dGaxD4OfTzrOTfdYOFFDC9BBwt9lJeqG6NWufNS63t81W1DKJR5kCjyQe8o85UXmbFVXvPYn08Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947226; c=relaxed/simple;
	bh=FcSt7Ov9K1ebbXxT9vx4wI44K83AkUdvxS5YmcY+jRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMCpyNaz4QCJGMtIvTM3tzp7CH8Y2gtgAflp9C9JXJ9c+/2Hb5dYZ0zsPJIeCQ31yhmLrvqtROFDplVd005EirT7SSIK3afSF3Say++zcjrBwDYwlU5JMyHrtFFlY39R5bhULIumrAPo8X7+pdQKXzVoEfvxmLWm1u77NGtYfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAKqCTxH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAKqCTxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727947224; x=1759483224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FcSt7Ov9K1ebbXxT9vx4wI44K83AkUdvxS5YmcY+jRo=;
  b=TAKqCTxHaOFUQweV2sBMCEU30r5dvGn/lcWjkWZQUqefZN6kxT5ZA/HA
   phVc9aWCdYgqmYLWydfLjshmR5JB+Z8noKQU+t5JPSZ3vaXS7dc9MPA5T
   6zOLiDDxwsQuaX6Yijsi2pf+dR21jHenk+r0hYqKzCkZ7yNCF42AENPpv
   bPj010COdl9iRX2tS+YGq6hTV/VIc70PxUdQrR0qYxqMYzLwnaG4eZpxL
   mn/EPvKXqxtJ+RDJMKCLw9zAICtbA6AY0YfcKmncSFuERVs0YLqCMzJfZ
   MLaBzzO+WVSS0bSAKb/87tbC1OE2IfdfiSNxTRc+misCClW9CY6B6FEpl
   w==;
X-CSE-ConnectionGUID: fADHhisQTz+Trz03jn1AUQ==
X-CSE-MsgGUID: rFuKcPhVRFGlaixl7TGzGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49657655"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="49657655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 02:20:24 -0700
X-CSE-ConnectionGUID: z45XNPYhSEK9bN55/n3mng==
X-CSE-MsgGUID: lSMYsEKARRGwX43iUVbVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="78708304"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2024 02:20:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swI0R-0000E4-31;
	Thu, 03 Oct 2024 09:20:19 +0000
Date: Thu, 3 Oct 2024 17:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/5] crypto: cesa: add COMPILE_TEST
Message-ID: <202410031728.sQCYdNwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241001232547.355947-2-rosenp@gmail.com>
References: <20241001232547.355947-2-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-crypto@vger.kernel.org
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Arnaud Ebalard <arno@natisbad.org>
CC: Srujana Challa <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Rosen Penev <rosenp@gmail.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.12-rc1 next-20241003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/crypto-cesa-add-COMPILE_TEST/20241002-072835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241001232547.355947-2-rosenp%40gmail.com
patch subject: [PATCH 1/5] crypto: cesa: add COMPILE_TEST
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: um-randconfig-r073-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031728.sQCYdNwD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031728.sQCYdNwD-lkp@intel.com/

smatch warnings:
drivers/crypto/marvell/cesa/cipher.c:342 mv_cesa_skcipher_dma_req_init() warn: missing unwind goto?

vim +342 drivers/crypto/marvell/cesa/cipher.c

4ada4839782370 drivers/crypto/marvell/cipher.c      Arnaud Ebalard  2015-06-18  311  
e6cd5bf64855cc drivers/crypto/marvell/cipher.c      Boris Brezillon 2017-10-13  312  static int mv_cesa_skcipher_dma_req_init(struct skcipher_request *req,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  313  					 const struct mv_cesa_op_ctx *op_templ)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  314  {
e6cd5bf64855cc drivers/crypto/marvell/cipher.c      Boris Brezillon 2017-10-13  315  	struct mv_cesa_skcipher_req *creq = skcipher_request_ctx(req);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  316  	gfp_t flags = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  317  		      GFP_KERNEL : GFP_ATOMIC;
53da740fed302f drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  318  	struct mv_cesa_req *basereq = &creq->base;
e6cd5bf64855cc drivers/crypto/marvell/cipher.c      Boris Brezillon 2017-10-13  319  	struct mv_cesa_skcipher_dma_iter iter;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  320  	bool skip_ctx = false;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  321  	int ret;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  322  
53da740fed302f drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  323  	basereq->chain.first = NULL;
53da740fed302f drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  324  	basereq->chain.last = NULL;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  325  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  326  	if (req->src != req->dst) {
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  327  		ret = dma_map_sg(cesa_dev->dev, req->src, creq->src_nents,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  328  				 DMA_TO_DEVICE);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  329  		if (!ret)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  330  			return -ENOMEM;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  331  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  332  		ret = dma_map_sg(cesa_dev->dev, req->dst, creq->dst_nents,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  333  				 DMA_FROM_DEVICE);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  334  		if (!ret) {
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  335  			ret = -ENOMEM;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  336  			goto err_unmap_src;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  337  		}
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  338  	} else {
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  339  		ret = dma_map_sg(cesa_dev->dev, req->src, creq->src_nents,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  340  				 DMA_BIDIRECTIONAL);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  341  		if (!ret)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18 @342  			return -ENOMEM;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  343  	}
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  344  
ec38f82e85532b drivers/crypto/marvell/cipher.c      Romain Perier   2016-07-22  345  	mv_cesa_tdma_desc_iter_init(&basereq->chain);
e6cd5bf64855cc drivers/crypto/marvell/cipher.c      Boris Brezillon 2017-10-13  346  	mv_cesa_skcipher_req_iter_init(&iter, req);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  347  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  348  	do {
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  349  		struct mv_cesa_op_ctx *op;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  350  
655ff1a1a727f9 drivers/crypto/marvell/cesa/cipher.c SrujanaChalla   2020-03-13  351  		op = mv_cesa_dma_add_op(&basereq->chain, op_templ, skip_ctx,
655ff1a1a727f9 drivers/crypto/marvell/cesa/cipher.c SrujanaChalla   2020-03-13  352  					flags);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  353  		if (IS_ERR(op)) {
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  354  			ret = PTR_ERR(op);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  355  			goto err_free_tdma;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  356  		}
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  357  		skip_ctx = true;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  358  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  359  		mv_cesa_set_crypt_op_len(op, iter.base.op_len);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  360  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  361  		/* Add input transfers */
ec38f82e85532b drivers/crypto/marvell/cipher.c      Romain Perier   2016-07-22  362  		ret = mv_cesa_dma_add_op_transfers(&basereq->chain, &iter.base,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  363  						   &iter.src, flags);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  364  		if (ret)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  365  			goto err_free_tdma;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  366  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  367  		/* Add dummy desc to launch the crypto operation */
ec38f82e85532b drivers/crypto/marvell/cipher.c      Romain Perier   2016-07-22  368  		ret = mv_cesa_dma_add_dummy_launch(&basereq->chain, flags);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  369  		if (ret)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  370  			goto err_free_tdma;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  371  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  372  		/* Add output transfers */
ec38f82e85532b drivers/crypto/marvell/cipher.c      Romain Perier   2016-07-22  373  		ret = mv_cesa_dma_add_op_transfers(&basereq->chain, &iter.base,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  374  						   &iter.dst, flags);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  375  		if (ret)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  376  			goto err_free_tdma;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  377  
e6cd5bf64855cc drivers/crypto/marvell/cipher.c      Boris Brezillon 2017-10-13  378  	} while (mv_cesa_skcipher_req_iter_next_op(&iter));
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  379  
bac8e805a30dc2 drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  380  	/* Add output data for IV */
655ff1a1a727f9 drivers/crypto/marvell/cesa/cipher.c SrujanaChalla   2020-03-13  381  	ret = mv_cesa_dma_add_result_op(&basereq->chain,
655ff1a1a727f9 drivers/crypto/marvell/cesa/cipher.c SrujanaChalla   2020-03-13  382  					CESA_SA_CFG_SRAM_OFFSET,
0c99620f0ac13a drivers/crypto/marvell/cipher.c      Romain Perier   2016-10-05  383  					CESA_SA_DATA_SRAM_OFFSET,
0c99620f0ac13a drivers/crypto/marvell/cipher.c      Romain Perier   2016-10-05  384  					CESA_TDMA_SRC_IN_SRAM, flags);
bac8e805a30dc2 drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  385  
bac8e805a30dc2 drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  386  	if (ret)
bac8e805a30dc2 drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  387  		goto err_free_tdma;
bac8e805a30dc2 drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  388  
85030c5168f1df drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  389  	basereq->chain.last->flags |= CESA_TDMA_END_OF_REQ;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  390  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  391  	return 0;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  392  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  393  err_free_tdma:
53da740fed302f drivers/crypto/marvell/cipher.c      Romain Perier   2016-06-21  394  	mv_cesa_dma_cleanup(basereq);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  395  	if (req->dst != req->src)
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  396  		dma_unmap_sg(cesa_dev->dev, req->dst, creq->dst_nents,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  397  			     DMA_FROM_DEVICE);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  398  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  399  err_unmap_src:
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  400  	dma_unmap_sg(cesa_dev->dev, req->src, creq->src_nents,
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  401  		     req->dst != req->src ? DMA_TO_DEVICE : DMA_BIDIRECTIONAL);
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  402  
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  403  	return ret;
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  404  }
db509a45339fd7 drivers/crypto/marvell/cipher.c      Boris Brezillon 2015-06-18  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
