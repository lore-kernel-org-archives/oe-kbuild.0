Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD112BE89
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747062; cv=none; b=aMMkfUgE7K88jR7atNIM/J+GrhmLvYAGWdMs8wWg1E2v3TO8iq1fZgi8fn9ScgCyWOCMVrPSm3yDmP+F1T79fA8iqA2G5kqlU7pByXFYnW5vJTZzEpdX12OhTUmQShhRgQUgbsMsRNVJhvZU9l02Qd6Ne+5FyaTTwJArPHOd4SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747062; c=relaxed/simple;
	bh=kDKZ8Nq1pTQ2MrjuoNy102tjxvlSWeT0wxTyGEpWIBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2kEquIrcc3aBPRlsJAmBPpDjl24dsLYjPBmnAB4sYLs0+YuSZW0ktejEk/tVzlOL0rG5TZUliEznLZD3lqYtsNGe/7k5L2ML6DXoJ2J60l00OCGVpELplksPqeDMATnFfG/8aKllXPqrQh8Z6pqijM652f3FxT0eo5zQ+1DUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anBBrUpL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anBBrUpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716747061; x=1748283061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDKZ8Nq1pTQ2MrjuoNy102tjxvlSWeT0wxTyGEpWIBI=;
  b=anBBrUpLzPNcrg1cMer8a0d6AWhJ+SPF9Y9YS4ONcXYKPbGHVyMjGnVz
   suZGVpgs7kfh9PKZ3ISR2D+V9bgQJTsmX3vhBFJUka1tTXCFmf7ugyXmj
   MmomrLP3RF+SWicCA3sPOxCsmoDcvnhC3Hz9Lng8aKRaPiREyR7U5nZHK
   SmFaMMhHAvAMucqQVVF0sTOpZEsywzJHW1FEyGjtTA1lVAXCRgPBLSKc4
   DkIjjtX2YXNvYFOS7IZMfSX0Bf8AyhcP0BoBc2k5uQInCA0cvb9Aqb5+S
   yXbK9EnCc+MmjAx9CpY2Pl6OESmQV+Zr3d9gBZAPpAhCypdirz7LPIrXj
   g==;
X-CSE-ConnectionGUID: KparVuO1Sa2d41jADJ6etA==
X-CSE-MsgGUID: +FraHhjSQ0S1fqfcFMazLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13237593"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="13237593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 11:11:00 -0700
X-CSE-ConnectionGUID: RQE2O919TMu18Yd+cLArHQ==
X-CSE-MsgGUID: 0SKFAiV8TsiOv8OMIgcXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="65760395"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 May 2024 11:10:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBIKe-0008M9-08;
	Sun, 26 May 2024 18:10:56 +0000
Date: Mon, 27 May 2024 02:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/mxs-dcp.c:292 mxs_dcp_run_aes() error: uninitialized
 symbol 'key_phys'.
Message-ID: <202405270146.Y9tPoil8-lkp@intel.com>
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
TO: David Gstir <david@sigma-star.at>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: Richard Weinberger <richard@nod.at>
CC: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c13320499ba0efd93174ef6462ae8a7a2933f6e7
commit: 3d16af0b4cfac4b2c3b238e2ec37b38c2f316978 crypto: mxs-dcp: Add support for hardware-bound keys
date:   2 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r071-20240524 (https://download.01.org/0day-ci/archive/20240527/202405270146.Y9tPoil8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405270146.Y9tPoil8-lkp@intel.com/

smatch warnings:
drivers/crypto/mxs-dcp.c:292 mxs_dcp_run_aes() error: uninitialized symbol 'key_phys'.

vim +/key_phys +292 drivers/crypto/mxs-dcp.c

15b59e7c3733f90 Marek Vasut    2013-12-10  221  
15b59e7c3733f90 Marek Vasut    2013-12-10  222  /*
15b59e7c3733f90 Marek Vasut    2013-12-10  223   * Encryption (AES128)
15b59e7c3733f90 Marek Vasut    2013-12-10  224   */
2021abaa00da64a Marek Vasut    2014-01-14  225  static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
9acb3247e0e1d94 Ard Biesheuvel 2019-11-09  226  			   struct skcipher_request *req, int init)
15b59e7c3733f90 Marek Vasut    2013-12-10  227  {
df6313d707e575a Sean Anderson  2021-07-01  228  	dma_addr_t key_phys, src_phys, dst_phys;
15b59e7c3733f90 Marek Vasut    2013-12-10  229  	struct dcp *sdcp = global_sdcp;
15b59e7c3733f90 Marek Vasut    2013-12-10  230  	struct dcp_dma_desc *desc = &sdcp->coh->desc[actx->chan];
9acb3247e0e1d94 Ard Biesheuvel 2019-11-09  231  	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
3d16af0b4cfac4b David Gstir    2024-04-03  232  	bool key_referenced = actx->key_referenced;
15b59e7c3733f90 Marek Vasut    2013-12-10  233  	int ret;
15b59e7c3733f90 Marek Vasut    2013-12-10  234  
3d16af0b4cfac4b David Gstir    2024-04-03  235  	if (!key_referenced) {
df6313d707e575a Sean Anderson  2021-07-01  236  		key_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_key,
df6313d707e575a Sean Anderson  2021-07-01  237  					  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
df6313d707e575a Sean Anderson  2021-07-01  238  		ret = dma_mapping_error(sdcp->dev, key_phys);
df6313d707e575a Sean Anderson  2021-07-01  239  		if (ret)
df6313d707e575a Sean Anderson  2021-07-01  240  			return ret;
3d16af0b4cfac4b David Gstir    2024-04-03  241  	}
df6313d707e575a Sean Anderson  2021-07-01  242  
df6313d707e575a Sean Anderson  2021-07-01  243  	src_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_in_buf,
15b59e7c3733f90 Marek Vasut    2013-12-10  244  				  DCP_BUF_SZ, DMA_TO_DEVICE);
df6313d707e575a Sean Anderson  2021-07-01  245  	ret = dma_mapping_error(sdcp->dev, src_phys);
df6313d707e575a Sean Anderson  2021-07-01  246  	if (ret)
df6313d707e575a Sean Anderson  2021-07-01  247  		goto err_src;
df6313d707e575a Sean Anderson  2021-07-01  248  
df6313d707e575a Sean Anderson  2021-07-01  249  	dst_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_out_buf,
15b59e7c3733f90 Marek Vasut    2013-12-10  250  				  DCP_BUF_SZ, DMA_FROM_DEVICE);
df6313d707e575a Sean Anderson  2021-07-01  251  	ret = dma_mapping_error(sdcp->dev, dst_phys);
df6313d707e575a Sean Anderson  2021-07-01  252  	if (ret)
df6313d707e575a Sean Anderson  2021-07-01  253  		goto err_dst;
15b59e7c3733f90 Marek Vasut    2013-12-10  254  
fadd7a6e616b89c Radu Solea     2018-10-02  255  	if (actx->fill % AES_BLOCK_SIZE) {
fadd7a6e616b89c Radu Solea     2018-10-02  256  		dev_err(sdcp->dev, "Invalid block size!\n");
fadd7a6e616b89c Radu Solea     2018-10-02  257  		ret = -EINVAL;
fadd7a6e616b89c Radu Solea     2018-10-02  258  		goto aes_done_run;
fadd7a6e616b89c Radu Solea     2018-10-02  259  	}
fadd7a6e616b89c Radu Solea     2018-10-02  260  
15b59e7c3733f90 Marek Vasut    2013-12-10  261  	/* Fill in the DMA descriptor. */
15b59e7c3733f90 Marek Vasut    2013-12-10  262  	desc->control0 = MXS_DCP_CONTROL0_DECR_SEMAPHORE |
15b59e7c3733f90 Marek Vasut    2013-12-10  263  		    MXS_DCP_CONTROL0_INTERRUPT |
15b59e7c3733f90 Marek Vasut    2013-12-10  264  		    MXS_DCP_CONTROL0_ENABLE_CIPHER;
15b59e7c3733f90 Marek Vasut    2013-12-10  265  
3d16af0b4cfac4b David Gstir    2024-04-03  266  	if (key_referenced)
3d16af0b4cfac4b David Gstir    2024-04-03  267  		/* Set OTP key bit to select the key via KEY_SELECT. */
3d16af0b4cfac4b David Gstir    2024-04-03  268  		desc->control0 |= MXS_DCP_CONTROL0_OTP_KEY;
3d16af0b4cfac4b David Gstir    2024-04-03  269  	else
15b59e7c3733f90 Marek Vasut    2013-12-10  270  		/* Payload contains the key. */
15b59e7c3733f90 Marek Vasut    2013-12-10  271  		desc->control0 |= MXS_DCP_CONTROL0_PAYLOAD_KEY;
15b59e7c3733f90 Marek Vasut    2013-12-10  272  
2021abaa00da64a Marek Vasut    2014-01-14  273  	if (rctx->enc)
15b59e7c3733f90 Marek Vasut    2013-12-10  274  		desc->control0 |= MXS_DCP_CONTROL0_CIPHER_ENCRYPT;
15b59e7c3733f90 Marek Vasut    2013-12-10  275  	if (init)
15b59e7c3733f90 Marek Vasut    2013-12-10  276  		desc->control0 |= MXS_DCP_CONTROL0_CIPHER_INIT;
15b59e7c3733f90 Marek Vasut    2013-12-10  277  
15b59e7c3733f90 Marek Vasut    2013-12-10  278  	desc->control1 = MXS_DCP_CONTROL1_CIPHER_SELECT_AES128;
15b59e7c3733f90 Marek Vasut    2013-12-10  279  
2021abaa00da64a Marek Vasut    2014-01-14  280  	if (rctx->ecb)
15b59e7c3733f90 Marek Vasut    2013-12-10  281  		desc->control1 |= MXS_DCP_CONTROL1_CIPHER_MODE_ECB;
15b59e7c3733f90 Marek Vasut    2013-12-10  282  	else
15b59e7c3733f90 Marek Vasut    2013-12-10  283  		desc->control1 |= MXS_DCP_CONTROL1_CIPHER_MODE_CBC;
15b59e7c3733f90 Marek Vasut    2013-12-10  284  
3d16af0b4cfac4b David Gstir    2024-04-03  285  	if (key_referenced)
3d16af0b4cfac4b David Gstir    2024-04-03  286  		desc->control1 |= sdcp->coh->aes_key[0] << MXS_DCP_CONTROL1_KEY_SELECT_SHIFT;
3d16af0b4cfac4b David Gstir    2024-04-03  287  
15b59e7c3733f90 Marek Vasut    2013-12-10  288  	desc->next_cmd_addr = 0;
15b59e7c3733f90 Marek Vasut    2013-12-10  289  	desc->source = src_phys;
15b59e7c3733f90 Marek Vasut    2013-12-10  290  	desc->destination = dst_phys;
15b59e7c3733f90 Marek Vasut    2013-12-10  291  	desc->size = actx->fill;
15b59e7c3733f90 Marek Vasut    2013-12-10 @292  	desc->payload = key_phys;
15b59e7c3733f90 Marek Vasut    2013-12-10  293  	desc->status = 0;
15b59e7c3733f90 Marek Vasut    2013-12-10  294  
15b59e7c3733f90 Marek Vasut    2013-12-10  295  	ret = mxs_dcp_start_dma(actx);
15b59e7c3733f90 Marek Vasut    2013-12-10  296  
fadd7a6e616b89c Radu Solea     2018-10-02  297  aes_done_run:
df6313d707e575a Sean Anderson  2021-07-01  298  	dma_unmap_single(sdcp->dev, dst_phys, DCP_BUF_SZ, DMA_FROM_DEVICE);
df6313d707e575a Sean Anderson  2021-07-01  299  err_dst:
df6313d707e575a Sean Anderson  2021-07-01  300  	dma_unmap_single(sdcp->dev, src_phys, DCP_BUF_SZ, DMA_TO_DEVICE);
df6313d707e575a Sean Anderson  2021-07-01  301  err_src:
3d16af0b4cfac4b David Gstir    2024-04-03  302  	if (!key_referenced)
15b59e7c3733f90 Marek Vasut    2013-12-10  303  		dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
15b59e7c3733f90 Marek Vasut    2013-12-10  304  				 DMA_TO_DEVICE);
15b59e7c3733f90 Marek Vasut    2013-12-10  305  	return ret;
15b59e7c3733f90 Marek Vasut    2013-12-10  306  }
15b59e7c3733f90 Marek Vasut    2013-12-10  307  

:::::: The code at line 292 was first introduced by commit
:::::: 15b59e7c3733f90ff1f7dd66ad77ae1c90bcdff5 crypto: mxs - Add Freescale MXS DCP driver

:::::: TO: Marek Vasut <marex@denx.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
