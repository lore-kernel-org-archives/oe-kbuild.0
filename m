Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBE4186607
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335964; cv=none; b=JgHpWvONJDdE3afXoe8j9Av1Ij4Snn/7uTpMK34AO51HK8gZSWlzpaf76dBfOm2HkdUiTc1eWMkt8u//Y/UME+6Dw/uoyropDwVel8P/X5oz/nGr+1kosVvyAYdKfKwWcmxSHe74R4ffOYQwYQ9UzFJ0w+qBlOyddo9u5E9mrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335964; c=relaxed/simple;
	bh=+lnRUtPhD3WETeI6z5MudVQ4hJeYrO1wrDg9eTy5/FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrY8/zNR774TgiGAhqwSSGvujoEOOL6+sGtALi3mcQ6WsVmkZMuD2KZJIeHCFBwjfttjhrrNQAeYfBNNkCoYxir4SK2eeWrd7Q0pVHRcrtNc8aHvsJiBOV38hohK5eFr7o5mTWlbE1qlDTLMhcizaRpUFto1+UxxUchsgjsjDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKU/mocW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKU/mocW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741335962; x=1772871962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lnRUtPhD3WETeI6z5MudVQ4hJeYrO1wrDg9eTy5/FE=;
  b=WKU/mocWWnVWFV+QprfQaZV78OwHXsvntgUmPPmLbZzoM2naex7pbRXz
   q+gsi2pG/30bbuIpiR9oIfH1FAx89ONUw7FL4b/SjYojpK2lWpY54WxZT
   iG6AOeGcCKTL4lybRY5Y9aMhS/H97+r7cE6rsqz7w6w6IOmFf07qTf8dv
   AEUT3WxBeKssLvUlV/WvGIDNb7R36daa9PZwsq+X4PX2+daDiuCysn3xo
   4Ru7X8xzSgzD705vw9GgtPcaLzanxlTOq/GPZ4tNmZnUWxsqgRUZDd+JZ
   dEPrdBZsE0OrQ+4cDBGPaaXL5eLD+nqJut5Sl+5XXVVsCRdKgZ2iXgKNP
   g==;
X-CSE-ConnectionGUID: e+NhtwEfQaeb4vUVEnj/hw==
X-CSE-MsgGUID: h5KP2Kl0SaOssY0NOcodAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53767596"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53767596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 00:26:01 -0800
X-CSE-ConnectionGUID: HALN3XwaTlWspmNbQXFIcQ==
X-CSE-MsgGUID: etZ3VFu+TNuMB05oQHJNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119445853"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 00:26:00 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqT1h-0000AV-0i;
	Fri, 07 Mar 2025 08:25:50 +0000
Date: Fri, 7 Mar 2025 16:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jens-wiklander-tee:testing/tuxbuild 6/10] drivers/tee/tee_shm.c:258
 tee_shm_register_fd() warn: passing zero to 'PTR_ERR'
Message-ID: <202503071648.ViJVMQTh-lkp@intel.com>
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
TO: Etienne Carriere <etienne.carriere@linaro.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>
CC: Olivier Masse <olivier.masse@nxp.com>

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   f4198d1f9ee51430ec81d02bb21f769cb6fd14c1
commit: 7fc3cd07fc7e055deefa3b33ff9f702ccd9f7864 [6/10] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071648.ViJVMQTh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071648.ViJVMQTh-lkp@intel.com/

smatch warnings:
drivers/tee/tee_shm.c:258 tee_shm_register_fd() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +258 drivers/tee/tee_shm.c

dc7019b7d0e188 Jens Wiklander   2021-06-14  209  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  210  struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  211  {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  212  	struct tee_shm_dmabuf_ref *ref;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  213  	int rc;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  214  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  215  	if (!tee_device_get(ctx->teedev))
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  216  		return ERR_PTR(-EINVAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  217  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  218  	teedev_ctx_get(ctx);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  219  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  220  	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  221  	if (!ref) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  222  		rc = -ENOMEM;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  223  		goto err_put_tee;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  224  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  225  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  226  	refcount_set(&ref->shm.refcount, 1);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  227  	ref->shm.ctx = ctx;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  228  	ref->shm.id = -1;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  229  	ref->shm.flags = TEE_SHM_DMA_BUF;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  230  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  231  	ref->dmabuf = dma_buf_get(fd);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  232  	if (IS_ERR(ref->dmabuf)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  233  		rc = PTR_ERR(ref->dmabuf);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  234  		goto err_kfree_ref;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  235  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  236  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  237  	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  238  					  &ref->offset, &ref->shm,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  239  					  &ref->parent_shm);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  240  	if (!rc)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  241  		goto out;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  242  	if (rc != -EINVAL)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  243  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  244  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  245  	ref->attach = dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  246  	if (IS_ERR(ref->attach)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  247  		rc = PTR_ERR(ref->attach);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  248  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  249  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  250  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  251  	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  252  	if (IS_ERR(ref->sgt)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  253  		rc = PTR_ERR(ref->sgt);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  254  		goto err_detach;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  255  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  256  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  257  	if (sg_nents(ref->sgt->sgl) != 1) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27 @258  		rc = PTR_ERR(ref->sgt->sgl);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  259  		goto err_unmap_attachement;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  260  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  261  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  262  	ref->shm.paddr = page_to_phys(sg_page(ref->sgt->sgl));
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  263  	ref->shm.size = ref->sgt->sgl->length;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  264  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  265  out:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  266  	mutex_lock(&ref->shm.ctx->teedev->mutex);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  267  	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  268  				1, 0, GFP_KERNEL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  269  	mutex_unlock(&ref->shm.ctx->teedev->mutex);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  270  	if (ref->shm.id < 0) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  271  		rc = ref->shm.id;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  272  		if (ref->attach)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  273  			goto err_unmap_attachement;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  274  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  275  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  276  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  277  	return &ref->shm;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  278  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  279  err_unmap_attachement:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  280  	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  281  err_detach:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  282  	dma_buf_detach(ref->dmabuf, ref->attach);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  283  err_put_dmabuf:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  284  	dma_buf_put(ref->dmabuf);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  285  err_kfree_ref:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  286  	kfree(ref);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  287  err_put_tee:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  288  	teedev_ctx_put(ctx);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  289  	tee_device_put(ctx->teedev);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  290  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  291  	return ERR_PTR(rc);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  292  }
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  293  EXPORT_SYMBOL_GPL(tee_shm_register_fd);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
