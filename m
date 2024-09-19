Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1463168C7
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726720575; cv=none; b=jTGohhKhLpWGQHJxxEgVR5Z8WKjlKc0nVRW0uSE110d7m7vR0JayGhFQtnVQx/MXBboWX39KRVntEYUY77jlu68nmv0YC1NY0+E01pHjeysz5eR6XFVAMzCPjkLeqqfCvU9+LWZy7002hhA6wblPBFNeke6bkhiaHsy8jvX9Xg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726720575; c=relaxed/simple;
	bh=zqeS1RFVg3KuR10wbwqE6MmU5XOzL/Vf0HxFeUKEn9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=utzo+j9DUhdMldafth8wpHudfcUxAFSzqJ5wsMlCzRi/kpGO2VmxlemEmqN1Lx7k0abgCHEJ6yDxw2xuZvqKQxh/bT1o8624nLrorR6AZCbV7io9KIJz3jqaG3GezSDOsSC4mr8J6N690+rQLlthwtlB7fDIeZyCFgEd04hoO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZB8A/h38; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB8A/h38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726720574; x=1758256574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqeS1RFVg3KuR10wbwqE6MmU5XOzL/Vf0HxFeUKEn9E=;
  b=ZB8A/h38DbnwtGQaoy2p6SyBhwSPMLPOUFuHSEpgpN0EvBbvvyDzSBkj
   UJV8rqerLpgi19CyUmitBiVaoxVKdjHEhuVRXHLMz/SxHoRiM+2wooqyz
   U52wZvOXo7JgFHykTIGLtxzltUySACubATxq4ZDVy+wBVXcNcz6PVDSW1
   kYYDVuY6ueDh6ME4I5NVSrPU0bIsHye2NxMo4EH2RgtEVBPUrHzVFTD88
   8hPDiLREowdMaLqOGXMw6aDpgvFVRJGWtU/BI/wYRajA+IUYW73gIh1+B
   dDsp0x7ZfAFO7tzUBumm7/Vftxjphq+d9mFFubgmcYkCOgVpkdBnOJ4Kn
   Q==;
X-CSE-ConnectionGUID: KH2EVDp7Rp2UUMSdO0cnBg==
X-CSE-MsgGUID: W24squcVQYel0/ZCqu+liQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36234372"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="36234372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 21:36:13 -0700
X-CSE-ConnectionGUID: XeUJ/IgdR2CmQRlw5Mv5DQ==
X-CSE-MsgGUID: LACUYrD8RLqlQfzluEsAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74590074"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Sep 2024 21:36:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr8tk-000Ctz-1U;
	Thu, 19 Sep 2024 04:36:08 +0000
Date: Thu, 19 Sep 2024 12:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/tee_core.c:528 tee_ioctl_supp_recv() warn: potential
 user controlled sizeof overflow '8 + (32 * num_params)' '8 + 0-u32max'
Message-ID: <202409191231.Wgud8Px3-lkp@intel.com>
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
TO: Rijo Thomas <Rijo-john.Thomas@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>
CC: Gary R Hook <gary.hook@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
commit: 1a74fa3894e7ee23a36f677789dd1e3048b82a72 tee: allow compilation of tee subsystem for AMD CPUs
date:   4 years, 9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 years, 9 months ago
config: i386-randconfig-141-20240918 (https://download.01.org/0day-ci/archive/20240919/202409191231.Wgud8Px3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409191231.Wgud8Px3-lkp@intel.com/

New smatch warnings:
drivers/tee/tee_core.c:528 tee_ioctl_supp_recv() warn: potential user controlled sizeof overflow '8 + (32 * num_params)' '8 + 0-u32max'
drivers/tee/tee_core.c:528 tee_ioctl_supp_recv() warn: potential user controlled sizeof overflow '32 * num_params' '32 * 0-u32max'
drivers/tee/tee_core.c:627 tee_ioctl_supp_send() warn: potential user controlled sizeof overflow '8 + (32 * num_params)' '8 + 0-u32max'
drivers/tee/tee_core.c:627 tee_ioctl_supp_send() warn: potential user controlled sizeof overflow '32 * num_params' '32 * 0-u32max'

Old smatch warnings:
drivers/tee/tee_core.c:323 tee_ioctl_open_session() warn: potential user controlled sizeof overflow '56 + (32 * (arg.num_params))' '56 + 0-u32max'
drivers/tee/tee_core.c:323 tee_ioctl_open_session() warn: potential user controlled sizeof overflow '32 * (arg.num_params)' '32 * 0-u32max'
drivers/tee/tee_core.c:394 tee_ioctl_invoke() warn: potential user controlled sizeof overflow '24 + (32 * (arg.num_params))' '24 + 0-u32max'
drivers/tee/tee_core.c:394 tee_ioctl_invoke() warn: potential user controlled sizeof overflow '32 * (arg.num_params)' '32 * 0-u32max'
drivers/tee/tee_core.c:528 tee_ioctl_supp_recv() warn: check for integer overflow 'num_params'
drivers/tee/tee_core.c:627 tee_ioctl_supp_send() warn: check for integer overflow 'num_params'

vim +528 drivers/tee/tee_core.c

967c9cca2cc505 Jens Wiklander 2015-03-11  503  
967c9cca2cc505 Jens Wiklander 2015-03-11  504  static int tee_ioctl_supp_recv(struct tee_context *ctx,
967c9cca2cc505 Jens Wiklander 2015-03-11  505  			       struct tee_ioctl_buf_data __user *ubuf)
967c9cca2cc505 Jens Wiklander 2015-03-11  506  {
967c9cca2cc505 Jens Wiklander 2015-03-11  507  	int rc;
967c9cca2cc505 Jens Wiklander 2015-03-11  508  	struct tee_ioctl_buf_data buf;
967c9cca2cc505 Jens Wiklander 2015-03-11  509  	struct tee_iocl_supp_recv_arg __user *uarg;
967c9cca2cc505 Jens Wiklander 2015-03-11  510  	struct tee_param *params;
967c9cca2cc505 Jens Wiklander 2015-03-11  511  	u32 num_params;
967c9cca2cc505 Jens Wiklander 2015-03-11  512  	u32 func;
967c9cca2cc505 Jens Wiklander 2015-03-11  513  
967c9cca2cc505 Jens Wiklander 2015-03-11  514  	if (!ctx->teedev->desc->ops->supp_recv)
967c9cca2cc505 Jens Wiklander 2015-03-11  515  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  516  
967c9cca2cc505 Jens Wiklander 2015-03-11  517  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
967c9cca2cc505 Jens Wiklander 2015-03-11  518  		return -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  519  
967c9cca2cc505 Jens Wiklander 2015-03-11  520  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
967c9cca2cc505 Jens Wiklander 2015-03-11  521  	    buf.buf_len < sizeof(struct tee_iocl_supp_recv_arg))
967c9cca2cc505 Jens Wiklander 2015-03-11  522  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  523  
967c9cca2cc505 Jens Wiklander 2015-03-11  524  	uarg = u64_to_user_ptr(buf.buf_ptr);
967c9cca2cc505 Jens Wiklander 2015-03-11  525  	if (get_user(num_params, &uarg->num_params))
967c9cca2cc505 Jens Wiklander 2015-03-11  526  		return -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  527  
967c9cca2cc505 Jens Wiklander 2015-03-11 @528  	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) != buf.buf_len)
967c9cca2cc505 Jens Wiklander 2015-03-11  529  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  530  
967c9cca2cc505 Jens Wiklander 2015-03-11  531  	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
967c9cca2cc505 Jens Wiklander 2015-03-11  532  	if (!params)
967c9cca2cc505 Jens Wiklander 2015-03-11  533  		return -ENOMEM;
967c9cca2cc505 Jens Wiklander 2015-03-11  534  
f2aa97240c84b8 Jens Wiklander 2016-12-23  535  	rc = params_from_user(ctx, params, num_params, uarg->params);
f2aa97240c84b8 Jens Wiklander 2016-12-23  536  	if (rc)
f2aa97240c84b8 Jens Wiklander 2016-12-23  537  		goto out;
f2aa97240c84b8 Jens Wiklander 2016-12-23  538  
967c9cca2cc505 Jens Wiklander 2015-03-11  539  	rc = ctx->teedev->desc->ops->supp_recv(ctx, &func, &num_params, params);
967c9cca2cc505 Jens Wiklander 2015-03-11  540  	if (rc)
967c9cca2cc505 Jens Wiklander 2015-03-11  541  		goto out;
967c9cca2cc505 Jens Wiklander 2015-03-11  542  
967c9cca2cc505 Jens Wiklander 2015-03-11  543  	if (put_user(func, &uarg->func) ||
967c9cca2cc505 Jens Wiklander 2015-03-11  544  	    put_user(num_params, &uarg->num_params)) {
967c9cca2cc505 Jens Wiklander 2015-03-11  545  		rc = -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  546  		goto out;
967c9cca2cc505 Jens Wiklander 2015-03-11  547  	}
967c9cca2cc505 Jens Wiklander 2015-03-11  548  
967c9cca2cc505 Jens Wiklander 2015-03-11  549  	rc = params_to_supp(ctx, uarg->params, num_params, params);
967c9cca2cc505 Jens Wiklander 2015-03-11  550  out:
967c9cca2cc505 Jens Wiklander 2015-03-11  551  	kfree(params);
967c9cca2cc505 Jens Wiklander 2015-03-11  552  	return rc;
967c9cca2cc505 Jens Wiklander 2015-03-11  553  }
967c9cca2cc505 Jens Wiklander 2015-03-11  554  
967c9cca2cc505 Jens Wiklander 2015-03-11  555  static int params_from_supp(struct tee_param *params, size_t num_params,
967c9cca2cc505 Jens Wiklander 2015-03-11  556  			    struct tee_ioctl_param __user *uparams)
967c9cca2cc505 Jens Wiklander 2015-03-11  557  {
967c9cca2cc505 Jens Wiklander 2015-03-11  558  	size_t n;
967c9cca2cc505 Jens Wiklander 2015-03-11  559  
967c9cca2cc505 Jens Wiklander 2015-03-11  560  	for (n = 0; n < num_params; n++) {
967c9cca2cc505 Jens Wiklander 2015-03-11  561  		struct tee_param *p = params + n;
967c9cca2cc505 Jens Wiklander 2015-03-11  562  		struct tee_ioctl_param ip;
967c9cca2cc505 Jens Wiklander 2015-03-11  563  
967c9cca2cc505 Jens Wiklander 2015-03-11  564  		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
967c9cca2cc505 Jens Wiklander 2015-03-11  565  			return -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  566  
967c9cca2cc505 Jens Wiklander 2015-03-11  567  		/* All unused attribute bits has to be zero */
f2aa97240c84b8 Jens Wiklander 2016-12-23  568  		if (ip.attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
967c9cca2cc505 Jens Wiklander 2015-03-11  569  			return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  570  
967c9cca2cc505 Jens Wiklander 2015-03-11  571  		p->attr = ip.attr;
f2aa97240c84b8 Jens Wiklander 2016-12-23  572  		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
967c9cca2cc505 Jens Wiklander 2015-03-11  573  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
967c9cca2cc505 Jens Wiklander 2015-03-11  574  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
967c9cca2cc505 Jens Wiklander 2015-03-11  575  			/* Only out and in/out values can be updated */
967c9cca2cc505 Jens Wiklander 2015-03-11  576  			p->u.value.a = ip.a;
967c9cca2cc505 Jens Wiklander 2015-03-11  577  			p->u.value.b = ip.b;
967c9cca2cc505 Jens Wiklander 2015-03-11  578  			p->u.value.c = ip.c;
967c9cca2cc505 Jens Wiklander 2015-03-11  579  			break;
967c9cca2cc505 Jens Wiklander 2015-03-11  580  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
967c9cca2cc505 Jens Wiklander 2015-03-11  581  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
967c9cca2cc505 Jens Wiklander 2015-03-11  582  			/*
967c9cca2cc505 Jens Wiklander 2015-03-11  583  			 * Only the size of the memref can be updated.
967c9cca2cc505 Jens Wiklander 2015-03-11  584  			 * Since we don't have access to the original
967c9cca2cc505 Jens Wiklander 2015-03-11  585  			 * parameters here, only store the supplied size.
967c9cca2cc505 Jens Wiklander 2015-03-11  586  			 * The driver will copy the updated size into the
967c9cca2cc505 Jens Wiklander 2015-03-11  587  			 * original parameters.
967c9cca2cc505 Jens Wiklander 2015-03-11  588  			 */
967c9cca2cc505 Jens Wiklander 2015-03-11  589  			p->u.memref.shm = NULL;
967c9cca2cc505 Jens Wiklander 2015-03-11  590  			p->u.memref.shm_offs = 0;
967c9cca2cc505 Jens Wiklander 2015-03-11  591  			p->u.memref.size = ip.b;
967c9cca2cc505 Jens Wiklander 2015-03-11  592  			break;
967c9cca2cc505 Jens Wiklander 2015-03-11  593  		default:
967c9cca2cc505 Jens Wiklander 2015-03-11  594  			memset(&p->u, 0, sizeof(p->u));
967c9cca2cc505 Jens Wiklander 2015-03-11  595  			break;
967c9cca2cc505 Jens Wiklander 2015-03-11  596  		}
967c9cca2cc505 Jens Wiklander 2015-03-11  597  	}
967c9cca2cc505 Jens Wiklander 2015-03-11  598  	return 0;
967c9cca2cc505 Jens Wiklander 2015-03-11  599  }
967c9cca2cc505 Jens Wiklander 2015-03-11  600  
967c9cca2cc505 Jens Wiklander 2015-03-11  601  static int tee_ioctl_supp_send(struct tee_context *ctx,
967c9cca2cc505 Jens Wiklander 2015-03-11  602  			       struct tee_ioctl_buf_data __user *ubuf)
967c9cca2cc505 Jens Wiklander 2015-03-11  603  {
967c9cca2cc505 Jens Wiklander 2015-03-11  604  	long rc;
967c9cca2cc505 Jens Wiklander 2015-03-11  605  	struct tee_ioctl_buf_data buf;
967c9cca2cc505 Jens Wiklander 2015-03-11  606  	struct tee_iocl_supp_send_arg __user *uarg;
967c9cca2cc505 Jens Wiklander 2015-03-11  607  	struct tee_param *params;
967c9cca2cc505 Jens Wiklander 2015-03-11  608  	u32 num_params;
967c9cca2cc505 Jens Wiklander 2015-03-11  609  	u32 ret;
967c9cca2cc505 Jens Wiklander 2015-03-11  610  
967c9cca2cc505 Jens Wiklander 2015-03-11  611  	/* Not valid for this driver */
967c9cca2cc505 Jens Wiklander 2015-03-11  612  	if (!ctx->teedev->desc->ops->supp_send)
967c9cca2cc505 Jens Wiklander 2015-03-11  613  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  614  
967c9cca2cc505 Jens Wiklander 2015-03-11  615  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
967c9cca2cc505 Jens Wiklander 2015-03-11  616  		return -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  617  
967c9cca2cc505 Jens Wiklander 2015-03-11  618  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
967c9cca2cc505 Jens Wiklander 2015-03-11  619  	    buf.buf_len < sizeof(struct tee_iocl_supp_send_arg))
967c9cca2cc505 Jens Wiklander 2015-03-11  620  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  621  
967c9cca2cc505 Jens Wiklander 2015-03-11  622  	uarg = u64_to_user_ptr(buf.buf_ptr);
967c9cca2cc505 Jens Wiklander 2015-03-11  623  	if (get_user(ret, &uarg->ret) ||
967c9cca2cc505 Jens Wiklander 2015-03-11  624  	    get_user(num_params, &uarg->num_params))
967c9cca2cc505 Jens Wiklander 2015-03-11  625  		return -EFAULT;
967c9cca2cc505 Jens Wiklander 2015-03-11  626  
967c9cca2cc505 Jens Wiklander 2015-03-11 @627  	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.buf_len)
967c9cca2cc505 Jens Wiklander 2015-03-11  628  		return -EINVAL;
967c9cca2cc505 Jens Wiklander 2015-03-11  629  
967c9cca2cc505 Jens Wiklander 2015-03-11  630  	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
967c9cca2cc505 Jens Wiklander 2015-03-11  631  	if (!params)
967c9cca2cc505 Jens Wiklander 2015-03-11  632  		return -ENOMEM;
967c9cca2cc505 Jens Wiklander 2015-03-11  633  
967c9cca2cc505 Jens Wiklander 2015-03-11  634  	rc = params_from_supp(params, num_params, uarg->params);
967c9cca2cc505 Jens Wiklander 2015-03-11  635  	if (rc)
967c9cca2cc505 Jens Wiklander 2015-03-11  636  		goto out;
967c9cca2cc505 Jens Wiklander 2015-03-11  637  
967c9cca2cc505 Jens Wiklander 2015-03-11  638  	rc = ctx->teedev->desc->ops->supp_send(ctx, ret, num_params, params);
967c9cca2cc505 Jens Wiklander 2015-03-11  639  out:
967c9cca2cc505 Jens Wiklander 2015-03-11  640  	kfree(params);
967c9cca2cc505 Jens Wiklander 2015-03-11  641  	return rc;
967c9cca2cc505 Jens Wiklander 2015-03-11  642  }
967c9cca2cc505 Jens Wiklander 2015-03-11  643  

:::::: The code at line 528 was first introduced by commit
:::::: 967c9cca2cc50569efc65945325c173cecba83bd tee: generic TEE subsystem

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
