Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B578F58
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 02:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736647556; cv=none; b=lJlwhwr4X/oXLJJV+hsEXhd0ym6p0M+QFOrJgCDOzsZOvAqCWIXVUNyhM6frNL2TeK8nQnU4B4H78Y2jkHWAsZjUAB0In6V0NZkNaCTh4pxHnRegeCYex3yUbtAFUOEmDzekknH3OH3EuU2G/GpUPuOzmqAPMU0UBb0IGI7l3UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736647556; c=relaxed/simple;
	bh=OpjZ2N6bs3ruGhgRQjE4woM3HiSaXRtluqmg40dV8xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atu2SI2Uy4/QnWfMKwWzBPKdb/3J/SdiYVx4jcv4gwttfTbij696UNn6tFZgs9BIf5hpYH/63ToXnDvF/kFuHjaTfdY6qnzt0962zPbumjtesiCoN6uLEBuFj2ie2YVgwrO14kVh7pDWmel6/jZbugSYIvtfdRWpAmqUUnV+3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4KKCOr7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4KKCOr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736647555; x=1768183555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OpjZ2N6bs3ruGhgRQjE4woM3HiSaXRtluqmg40dV8xM=;
  b=X4KKCOr7HEqrlnk1QVHRjYkYZl7I+3gSiXWQF7vDOh7CbMzhwcpbqo7f
   1+y6fD7Ugks8h96fX0/9nYFE6aXUkDVwrExEeF9M12ES0KcmqG909s20L
   +OReOeUOfdO8f1HxXcHQWe41R+KP66NVP3Vne1yIzSf84thZNPuN/b4QV
   svrKqfdcaRjlppr+TkvZZPvr1APRaVTnaxnmhzXNAS6bxFU1+y7Nf7Czc
   MOYNI2lnrO7uzRc7D/pnM6Jrn4J5lYGLd3X2/if5wkw6oIInXmhKr4M4H
   MvCEq+OpFzpIwGnmMrqFMHzDyd7diTlz+C0WFBzRm9SppZ09WqspGGQXO
   w==;
X-CSE-ConnectionGUID: YQWSF7GvThq5IoAZLQl5pg==
X-CSE-MsgGUID: MUydAKQIRxy+JPG+/gucbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36924533"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36924533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:05:53 -0800
X-CSE-ConnectionGUID: h3LA8vlxQaeYv4TU+wNDrg==
X-CSE-MsgGUID: B5cdozCUShmVTB6OvStkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108718154"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 18:05:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWnMK-000LRY-30;
	Sun, 12 Jan 2025 02:05:48 +0000
Date: Sun, 12 Jan 2025 10:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 396/504]
 drivers/crypto/xilinx/zynqmp-aes-gcm.c:367:13-14: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 366)
Message-ID: <202501120936.R4BjxD5g-lkp@intel.com>
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
CC: git@amd.com
TO: Harsh Jain <h.jain@amd.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 7312c9df281491d9188d15344f7e1e860dff6c08 [396/504] crypto: zynqmp-aes-gcm: Change coherent to dma alloc
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r064-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120936.R4BjxD5g-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501120936.R4BjxD5g-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/xilinx/zynqmp-aes-gcm.c:367:13-14: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 366)
   drivers/crypto/xilinx/zynqmp-aes-gcm.c:370:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 369)
   drivers/crypto/xilinx/zynqmp-aes-gcm.c:227:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 226)
   drivers/crypto/xilinx/zynqmp-aes-gcm.c:229:13-14: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 228)

vim +367 drivers/crypto/xilinx/zynqmp-aes-gcm.c

4d96f7d48131fe Kalyani Akula 2020-02-17  233  
55ae2e40a896d5 Dhaval Shah   2023-12-08  234  static int versal_aes_aead_cipher(struct aead_request *req)
55ae2e40a896d5 Dhaval Shah   2023-12-08  235  {
55ae2e40a896d5 Dhaval Shah   2023-12-08  236  	struct crypto_aead *aead = crypto_aead_reqtfm(req);
55ae2e40a896d5 Dhaval Shah   2023-12-08  237  	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
55ae2e40a896d5 Dhaval Shah   2023-12-08  238  	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
55ae2e40a896d5 Dhaval Shah   2023-12-08  239  	dma_addr_t dma_addr_data, dma_addr_hw_req, dma_addr_in;
55ae2e40a896d5 Dhaval Shah   2023-12-08  240  	u32 total_len = req->assoclen + req->cryptlen;
55ae2e40a896d5 Dhaval Shah   2023-12-08  241  	struct device *dev = tfm_ctx->dev;
55ae2e40a896d5 Dhaval Shah   2023-12-08  242  	struct versal_init_ops *hwreq;
55ae2e40a896d5 Dhaval Shah   2023-12-08  243  	struct versal_in_params *in;
55ae2e40a896d5 Dhaval Shah   2023-12-08  244  	u32 gcm_offset, out_len;
7312c9df281491 Harsh Jain    2024-11-21  245  	size_t kbuf_size;
7312c9df281491 Harsh Jain    2024-11-21  246  	size_t dmabuf_size;
5e734633dfa25a Harsh Jain    2024-11-21  247  	void *dmabuf;
55ae2e40a896d5 Dhaval Shah   2023-12-08  248  	char *kbuf;
55ae2e40a896d5 Dhaval Shah   2023-12-08  249  	int ret;
55ae2e40a896d5 Dhaval Shah   2023-12-08  250  
55ae2e40a896d5 Dhaval Shah   2023-12-08  251  	if (tfm_ctx->keylen != XSECURE_AES_KEY_SIZE_128 &&
55ae2e40a896d5 Dhaval Shah   2023-12-08  252  	    tfm_ctx->keylen != XSECURE_AES_KEY_SIZE_256) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  253  		ret = -EINVAL;
55ae2e40a896d5 Dhaval Shah   2023-12-08  254  		goto err;
55ae2e40a896d5 Dhaval Shah   2023-12-08  255  	}
55ae2e40a896d5 Dhaval Shah   2023-12-08  256  
7312c9df281491 Harsh Jain    2024-11-21  257  	kbuf_size = total_len + ZYNQMP_AES_AUTH_SIZE;
7312c9df281491 Harsh Jain    2024-11-21  258  	kbuf = kmalloc(kbuf_size, GFP_KERNEL);
7312c9df281491 Harsh Jain    2024-11-21  259  	if (unlikely(!kbuf)) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  260  		ret = -ENOMEM;
55ae2e40a896d5 Dhaval Shah   2023-12-08  261  		goto err;
55ae2e40a896d5 Dhaval Shah   2023-12-08  262  	}
7312c9df281491 Harsh Jain    2024-11-21  263  	dmabuf_size = sizeof(struct versal_init_ops) +
de4f641a50846e Harsh Jain    2024-11-21  264  		      sizeof(struct versal_in_params) +
7312c9df281491 Harsh Jain    2024-11-21  265  		      GCM_AES_IV_SIZE;
7312c9df281491 Harsh Jain    2024-11-21  266  	dmabuf = kmalloc(dmabuf_size, GFP_KERNEL);
7312c9df281491 Harsh Jain    2024-11-21  267  	if (unlikely(!dmabuf)) {
7312c9df281491 Harsh Jain    2024-11-21  268  		ret = -ENOMEM;
7312c9df281491 Harsh Jain    2024-11-21  269  		goto buf1_free;
7312c9df281491 Harsh Jain    2024-11-21  270  	}
7312c9df281491 Harsh Jain    2024-11-21  271  
7312c9df281491 Harsh Jain    2024-11-21  272  	dma_addr_hw_req = dma_map_single(dev, dmabuf, dmabuf_size, DMA_BIDIRECTIONAL);
7312c9df281491 Harsh Jain    2024-11-21  273  	if (unlikely(dma_mapping_error(dev, dma_addr_hw_req))) {
7312c9df281491 Harsh Jain    2024-11-21  274  		ret = -ENOMEM;
7312c9df281491 Harsh Jain    2024-11-21  275  		goto buf2_free;
7312c9df281491 Harsh Jain    2024-11-21  276  	}
7312c9df281491 Harsh Jain    2024-11-21  277  	scatterwalk_map_and_copy(kbuf, req->src, 0, total_len, 0);
7312c9df281491 Harsh Jain    2024-11-21  278  	dma_addr_data = dma_map_single(dev, kbuf, kbuf_size, DMA_BIDIRECTIONAL);
7312c9df281491 Harsh Jain    2024-11-21  279  	if (unlikely(dma_mapping_error(dev, dma_addr_data))) {
7312c9df281491 Harsh Jain    2024-11-21  280  		dma_unmap_single(dev, dma_addr_hw_req, dmabuf_size, DMA_BIDIRECTIONAL);
55ae2e40a896d5 Dhaval Shah   2023-12-08  281  		ret = -ENOMEM;
7312c9df281491 Harsh Jain    2024-11-21  282  		goto buf2_free;
55ae2e40a896d5 Dhaval Shah   2023-12-08  283  	}
5e734633dfa25a Harsh Jain    2024-11-21  284  	hwreq = dmabuf;
5e734633dfa25a Harsh Jain    2024-11-21  285  	in = dmabuf + sizeof(struct versal_init_ops);
de4f641a50846e Harsh Jain    2024-11-21  286  	memcpy(dmabuf + sizeof(struct versal_init_ops) +
de4f641a50846e Harsh Jain    2024-11-21  287  	       sizeof(struct versal_in_params), req->iv, GCM_AES_IV_SIZE);
de4f641a50846e Harsh Jain    2024-11-21  288  	hwreq->iv = dma_addr_hw_req + sizeof(struct versal_init_ops) +
de4f641a50846e Harsh Jain    2024-11-21  289  		    sizeof(struct versal_in_params);
55ae2e40a896d5 Dhaval Shah   2023-12-08  290  	hwreq->keysrc = tfm_ctx->keysrc;
7312c9df281491 Harsh Jain    2024-11-21  291  	dma_addr_in = dma_addr_hw_req + sizeof(struct versal_init_ops);
55ae2e40a896d5 Dhaval Shah   2023-12-08  292  	if (rq_ctx->op == ZYNQMP_AES_ENCRYPT) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  293  		hwreq->op = VERSAL_AES_ENCRYPT;
55ae2e40a896d5 Dhaval Shah   2023-12-08  294  		out_len = total_len + ZYNQMP_AES_AUTH_SIZE;
55ae2e40a896d5 Dhaval Shah   2023-12-08  295  		in->size = req->cryptlen;
55ae2e40a896d5 Dhaval Shah   2023-12-08  296  	} else {
55ae2e40a896d5 Dhaval Shah   2023-12-08  297  		hwreq->op = VERSAL_AES_DECRYPT;
55ae2e40a896d5 Dhaval Shah   2023-12-08  298  		out_len = total_len - ZYNQMP_AES_AUTH_SIZE;
55ae2e40a896d5 Dhaval Shah   2023-12-08  299  		in->size = req->cryptlen - ZYNQMP_AES_AUTH_SIZE;
55ae2e40a896d5 Dhaval Shah   2023-12-08  300  	}
55ae2e40a896d5 Dhaval Shah   2023-12-08  301  
55ae2e40a896d5 Dhaval Shah   2023-12-08  302  	if (tfm_ctx->keylen == XSECURE_AES_KEY_SIZE_128)
55ae2e40a896d5 Dhaval Shah   2023-12-08  303  		hwreq->size = AES_KEY_SIZE_128;
55ae2e40a896d5 Dhaval Shah   2023-12-08  304  	else if (tfm_ctx->keylen == XSECURE_AES_KEY_SIZE_256)
55ae2e40a896d5 Dhaval Shah   2023-12-08  305  		hwreq->size = AES_KEY_SIZE_256;
55ae2e40a896d5 Dhaval Shah   2023-12-08  306  
55ae2e40a896d5 Dhaval Shah   2023-12-08  307  	/* Request aes key write for volatile user keys */
55ae2e40a896d5 Dhaval Shah   2023-12-08  308  	if (hwreq->keysrc >= VERSAL_AES_USER_KEY_0 && hwreq->keysrc <= VERSAL_AES_USER_KEY_7) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  309  		ret = versal_pm_aes_key_write(hwreq->size, hwreq->keysrc,
de4f641a50846e Harsh Jain    2024-11-21  310  					      tfm_ctx->key_dma_addr);
55ae2e40a896d5 Dhaval Shah   2023-12-08  311  		if (ret)
7312c9df281491 Harsh Jain    2024-11-21  312  			goto unmap;
55ae2e40a896d5 Dhaval Shah   2023-12-08  313  	}
55ae2e40a896d5 Dhaval Shah   2023-12-08  314  
7312c9df281491 Harsh Jain    2024-11-21  315  	in->in_data_addr = dma_addr_data + req->assoclen;
7312c9df281491 Harsh Jain    2024-11-21  316  	in->is_last = 1;
7312c9df281491 Harsh Jain    2024-11-21  317  	gcm_offset = req->assoclen + in->size;
7312c9df281491 Harsh Jain    2024-11-21  318  	dma_sync_single_for_device(dev, dma_addr_hw_req, dmabuf_size, DMA_BIDIRECTIONAL);
55ae2e40a896d5 Dhaval Shah   2023-12-08  319  	ret = versal_pm_aes_op_init(dma_addr_hw_req);
55ae2e40a896d5 Dhaval Shah   2023-12-08  320  	if (ret)
55ae2e40a896d5 Dhaval Shah   2023-12-08  321  		goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  322  
55ae2e40a896d5 Dhaval Shah   2023-12-08  323  	if (req->assoclen > 0) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  324  		/* Currently GMAC is OFF by default */
55ae2e40a896d5 Dhaval Shah   2023-12-08  325  		ret = versal_pm_aes_update_aad(dma_addr_data, req->assoclen);
55ae2e40a896d5 Dhaval Shah   2023-12-08  326  		if (ret)
55ae2e40a896d5 Dhaval Shah   2023-12-08  327  			goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  328  	}
55ae2e40a896d5 Dhaval Shah   2023-12-08  329  	if (rq_ctx->op == ZYNQMP_AES_ENCRYPT) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  330  		ret = versal_pm_aes_enc_update(dma_addr_in,
55ae2e40a896d5 Dhaval Shah   2023-12-08  331  					       dma_addr_data + req->assoclen);
55ae2e40a896d5 Dhaval Shah   2023-12-08  332  		if (ret)
55ae2e40a896d5 Dhaval Shah   2023-12-08  333  			goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  334  
55ae2e40a896d5 Dhaval Shah   2023-12-08  335  		ret = versal_pm_aes_enc_final(dma_addr_data + gcm_offset);
55ae2e40a896d5 Dhaval Shah   2023-12-08  336  		if (ret)
55ae2e40a896d5 Dhaval Shah   2023-12-08  337  			goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  338  	} else {
55ae2e40a896d5 Dhaval Shah   2023-12-08  339  		ret = versal_pm_aes_dec_update(dma_addr_in,
55ae2e40a896d5 Dhaval Shah   2023-12-08  340  					       dma_addr_data + req->assoclen);
55ae2e40a896d5 Dhaval Shah   2023-12-08  341  		if (ret)
55ae2e40a896d5 Dhaval Shah   2023-12-08  342  			goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  343  
55ae2e40a896d5 Dhaval Shah   2023-12-08  344  		ret = versal_pm_aes_dec_final(dma_addr_data + gcm_offset);
55ae2e40a896d5 Dhaval Shah   2023-12-08  345  		if (ret) {
55ae2e40a896d5 Dhaval Shah   2023-12-08  346  			ret = -EBADMSG;
55ae2e40a896d5 Dhaval Shah   2023-12-08  347  			goto clearkey;
55ae2e40a896d5 Dhaval Shah   2023-12-08  348  		}
55ae2e40a896d5 Dhaval Shah   2023-12-08  349  	}
7312c9df281491 Harsh Jain    2024-11-21  350  	dma_unmap_single(dev, dma_addr_data, kbuf_size, DMA_BIDIRECTIONAL);
7312c9df281491 Harsh Jain    2024-11-21  351  	dma_unmap_single(dev, dma_addr_hw_req, dmabuf_size, DMA_BIDIRECTIONAL);
55ae2e40a896d5 Dhaval Shah   2023-12-08  352  	sg_copy_from_buffer(req->dst, sg_nents(req->dst),
55ae2e40a896d5 Dhaval Shah   2023-12-08  353  			    kbuf, out_len);
7312c9df281491 Harsh Jain    2024-11-21  354  	dma_addr_data = 0;
7312c9df281491 Harsh Jain    2024-11-21  355  	dma_addr_hw_req = 0;
55ae2e40a896d5 Dhaval Shah   2023-12-08  356  
55ae2e40a896d5 Dhaval Shah   2023-12-08  357  clearkey:
55ae2e40a896d5 Dhaval Shah   2023-12-08  358  	if (hwreq->keysrc >= VERSAL_AES_USER_KEY_0 && hwreq->keysrc <= VERSAL_AES_USER_KEY_7)
55ae2e40a896d5 Dhaval Shah   2023-12-08  359  		versal_pm_aes_key_zero(hwreq->keysrc);
7312c9df281491 Harsh Jain    2024-11-21  360  unmap:
7312c9df281491 Harsh Jain    2024-11-21  361  	if (unlikely(dma_addr_data))
7312c9df281491 Harsh Jain    2024-11-21  362  		dma_unmap_single(dev, dma_addr_data, kbuf_size, DMA_BIDIRECTIONAL);
7312c9df281491 Harsh Jain    2024-11-21  363  	if (unlikely(dma_addr_hw_req))
7312c9df281491 Harsh Jain    2024-11-21  364  		dma_unmap_single(dev, dma_addr_hw_req, dmabuf_size, DMA_BIDIRECTIONAL);
7312c9df281491 Harsh Jain    2024-11-21  365  buf2_free:
7312c9df281491 Harsh Jain    2024-11-21 @366  	memzero_explicit(dmabuf, dmabuf_size);
7312c9df281491 Harsh Jain    2024-11-21 @367  	kfree(dmabuf);
7312c9df281491 Harsh Jain    2024-11-21  368  buf1_free:
7312c9df281491 Harsh Jain    2024-11-21  369  	memzero_explicit(kbuf, kbuf_size);
7312c9df281491 Harsh Jain    2024-11-21  370  	kfree(kbuf);
55ae2e40a896d5 Dhaval Shah   2023-12-08  371  err:
55ae2e40a896d5 Dhaval Shah   2023-12-08  372  	return ret;
55ae2e40a896d5 Dhaval Shah   2023-12-08  373  }
55ae2e40a896d5 Dhaval Shah   2023-12-08  374  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
