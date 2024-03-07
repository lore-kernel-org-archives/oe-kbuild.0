Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F60B1D699
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Mar 2024 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821083; cv=none; b=JT9siwwyocrE4R43M/5ltLN2zL1Lz7wOdNMMMRxmXDEMFZe8jKhtoXmui440V0ScKcJNuoehdng9iskyEShp47f3T/t1N+KXZ8V0b/q8n8pz5LtBF7shgcpmBwh9rxQ/KJlzlSq0Hx9uVS5VBrODMYURgNcl5xXhX+lcnU515Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821083; c=relaxed/simple;
	bh=b5d5nrXIIjH+qRVb2mP8wQHwAJQsvzifISxkF8GXUcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUsoezjuaSO1A8wgx4GSq0wwjxEKKCo6EcpvTHAf8i+clDu2nK29gtA9Mu4K+G0Hl6ItFoCrXkdGmshdJsXMq978RO7dzmE7cTio4cIhWGoHN6Ke1yC6njE+CmO1SWgspoF76wNGe35QzRWUNSM7kIJw9yisQw/sD32BU5RN6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqGYDZi7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqGYDZi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709821081; x=1741357081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5d5nrXIIjH+qRVb2mP8wQHwAJQsvzifISxkF8GXUcU=;
  b=fqGYDZi7HE0JFeuZQVStqliFPhF4NbDturE7lR5iGvogMFEDcmjJN+b3
   Ck9Xol+/2BALAYepXXy698elJ7NA3uc+qi4w63oYjjnf93J3GambBvaNV
   Lp2EKo9dxWiaAF3YN7SEklp+0baKDE/ldJ2q7QruyYT44D36jlYGT0rj/
   juFuF6slxLMnVFn2b7ppzrDIh9vyRj/OxAcSc/kWrpr3elzJaEmtI/CSB
   cd6wETnT3rsFEWhEBbBKGvY9jg4dtVtiPPY+dIu7puIiOzOzYPZFYT8W5
   2kkHUl5VOWtgasCHHt5w6TWg1fGfCQwxduLpOda9tmJ0NFVr2Gms2A8ka
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22013979"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22013979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 06:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10024163"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 06:17:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riEZJ-0005Eb-0W;
	Thu, 07 Mar 2024 14:17:57 +0000
Date: Thu, 7 Mar 2024 22:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403072256.em3Fk3At-lkp@intel.com>
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
In-Reply-To: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
References: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.8-rc7 next-20240307]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240305-193337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240305112831.3380896-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r081-20240307 (https://download.01.org/0day-ci/archive/20240307/202403072256.em3Fk3At-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403072256.em3Fk3At-lkp@intel.com/

New smatch warnings:
drivers/crypto/dwc-spacc/spacc_ahash.c:1057 spacc_hash_digest() error: uninitialized symbol 'total_len'.

Old smatch warnings:
drivers/crypto/dwc-spacc/spacc_ahash.c:271 spacc_hash_init_dma() error: uninitialized symbol 'sgl_buffer'.

vim +/total_len +1057 drivers/crypto/dwc-spacc/spacc_ahash.c

6ad822cec22644 Pavitrakumar M 2024-03-05   981  
6ad822cec22644 Pavitrakumar M 2024-03-05   982  static int spacc_hash_digest(struct ahash_request *req)
6ad822cec22644 Pavitrakumar M 2024-03-05   983  {
6ad822cec22644 Pavitrakumar M 2024-03-05   984  	int final = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05   985  	int rc, total_len;
6ad822cec22644 Pavitrakumar M 2024-03-05   986  	struct crypto_ahash *reqtfm = crypto_ahash_reqtfm(req);
6ad822cec22644 Pavitrakumar M 2024-03-05   987  	struct spacc_crypto_ctx *tctx = crypto_ahash_ctx(reqtfm);
6ad822cec22644 Pavitrakumar M 2024-03-05   988  	struct spacc_crypto_reqctx *ctx = ahash_request_ctx(req);
6ad822cec22644 Pavitrakumar M 2024-03-05   989  	struct spacc_priv *priv = dev_get_drvdata(tctx->dev);
6ad822cec22644 Pavitrakumar M 2024-03-05   990  
6ad822cec22644 Pavitrakumar M 2024-03-05   991  	if (tctx->flag_ppp) {
6ad822cec22644 Pavitrakumar M 2024-03-05   992  		/* from finup */
6ad822cec22644 Pavitrakumar M 2024-03-05   993  		ctx->single_shot = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05   994  		ctx->final_part_pck = 1;
6ad822cec22644 Pavitrakumar M 2024-03-05   995  		final = 2;
6ad822cec22644 Pavitrakumar M 2024-03-05   996  	} else {
6ad822cec22644 Pavitrakumar M 2024-03-05   997  		/* direct single shot digest call */
6ad822cec22644 Pavitrakumar M 2024-03-05   998  		ctx->single_shot = 1;
6ad822cec22644 Pavitrakumar M 2024-03-05   999  		ctx->rem_len = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1000  		ctx->total_nents = sg_nents(req->src);
6ad822cec22644 Pavitrakumar M 2024-03-05  1001  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1002  
6ad822cec22644 Pavitrakumar M 2024-03-05  1003  	if (tctx->handle < 0 || !tctx->ctx_valid ||
6ad822cec22644 Pavitrakumar M 2024-03-05  1004  	    req->nbytes > priv->max_msg_len)
6ad822cec22644 Pavitrakumar M 2024-03-05  1005  		goto fallback;
6ad822cec22644 Pavitrakumar M 2024-03-05  1006  
6ad822cec22644 Pavitrakumar M 2024-03-05  1007  	rc = spacc_hash_init_dma(tctx->dev, req, final);
6ad822cec22644 Pavitrakumar M 2024-03-05  1008  	if (rc < 0)
6ad822cec22644 Pavitrakumar M 2024-03-05  1009  		goto fallback;
6ad822cec22644 Pavitrakumar M 2024-03-05  1010  
6ad822cec22644 Pavitrakumar M 2024-03-05  1011  	if (rc == 0)
6ad822cec22644 Pavitrakumar M 2024-03-05  1012  		return 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1013  
6ad822cec22644 Pavitrakumar M 2024-03-05  1014  	if (final) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1015  		if (ctx->total_nents) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1016  			/* INIT-UPDATE-UPDATE-FINUP/FINAL */
6ad822cec22644 Pavitrakumar M 2024-03-05  1017  			total_len = tctx->ppp_sgl[0].length;
6ad822cec22644 Pavitrakumar M 2024-03-05  1018  		} else if (req->src->length == 0 && ctx->total_nents == 0) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1019  			/* zero msg handling */
6ad822cec22644 Pavitrakumar M 2024-03-05  1020  			total_len = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1021  		} else {
6ad822cec22644 Pavitrakumar M 2024-03-05  1022  			/* handle INIT-FINUP sequence, process req->nbytes */
6ad822cec22644 Pavitrakumar M 2024-03-05  1023  			total_len = req->nbytes;
6ad822cec22644 Pavitrakumar M 2024-03-05  1024  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  1025  
6ad822cec22644 Pavitrakumar M 2024-03-05  1026  		rc = spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  1027  				&ctx->src, &ctx->dst, total_len,
6ad822cec22644 Pavitrakumar M 2024-03-05  1028  				0, total_len, 0, 0, 0);
6ad822cec22644 Pavitrakumar M 2024-03-05  1029  	} else {
6ad822cec22644 Pavitrakumar M 2024-03-05  1030  		rc = spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  1031  				&ctx->src, &ctx->dst, req->nbytes,
6ad822cec22644 Pavitrakumar M 2024-03-05  1032  				0, req->nbytes, 0, 0, 0);
6ad822cec22644 Pavitrakumar M 2024-03-05  1033  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1034  
6ad822cec22644 Pavitrakumar M 2024-03-05  1035  	if (rc < 0) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1036  		spacc_hash_cleanup_dma(tctx->dev, req);
6ad822cec22644 Pavitrakumar M 2024-03-05  1037  		spacc_close(&priv->spacc, ctx->acb.new_handle);
6ad822cec22644 Pavitrakumar M 2024-03-05  1038  
6ad822cec22644 Pavitrakumar M 2024-03-05  1039  		if (rc != -EBUSY) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1040  			pr_debug("Failed to enqueue job, ERR: %d\n", rc);
6ad822cec22644 Pavitrakumar M 2024-03-05  1041  			return rc;
6ad822cec22644 Pavitrakumar M 2024-03-05  1042  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  1043  
6ad822cec22644 Pavitrakumar M 2024-03-05  1044  		if (!(req->base.flags & CRYPTO_TFM_REQ_MAY_BACKLOG))
6ad822cec22644 Pavitrakumar M 2024-03-05  1045  			return -EBUSY;
6ad822cec22644 Pavitrakumar M 2024-03-05  1046  
6ad822cec22644 Pavitrakumar M 2024-03-05  1047  		goto fallback;
6ad822cec22644 Pavitrakumar M 2024-03-05  1048  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1049  
6ad822cec22644 Pavitrakumar M 2024-03-05  1050  	return -EINPROGRESS;
6ad822cec22644 Pavitrakumar M 2024-03-05  1051  
6ad822cec22644 Pavitrakumar M 2024-03-05  1052  fallback:
6ad822cec22644 Pavitrakumar M 2024-03-05  1053  	/* Start from scratch as init is not called before digest */
6ad822cec22644 Pavitrakumar M 2024-03-05  1054  	ctx->fb.hash_req.base = req->base;
6ad822cec22644 Pavitrakumar M 2024-03-05  1055  	ahash_request_set_tfm(&ctx->fb.hash_req, tctx->fb.hash);
6ad822cec22644 Pavitrakumar M 2024-03-05  1056  
6ad822cec22644 Pavitrakumar M 2024-03-05 @1057  	ctx->fb.hash_req.nbytes = total_len;
6ad822cec22644 Pavitrakumar M 2024-03-05  1058  	ctx->fb.hash_req.src = req->src;
6ad822cec22644 Pavitrakumar M 2024-03-05  1059  	ctx->fb.hash_req.result = req->result;
6ad822cec22644 Pavitrakumar M 2024-03-05  1060  
6ad822cec22644 Pavitrakumar M 2024-03-05  1061  	return crypto_ahash_digest(&ctx->fb.hash_req);
6ad822cec22644 Pavitrakumar M 2024-03-05  1062  }
6ad822cec22644 Pavitrakumar M 2024-03-05  1063  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
