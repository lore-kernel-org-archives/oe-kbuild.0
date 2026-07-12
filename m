Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69958EACD
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 00:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783817729; cv=none; b=WfGXShW4tTgNMeoLFxARiCcQ90ugjePFeDzWGDmhC7J5plMYgMoG5HUnuua9OFi68ZXKIvM3f9utmWmT1q+h9cSrD0vNgubZjTyNKaydGm2K1Xa+lursu5jXJtUTvhHifOhLmdcRmA2REAjWn0EJGfePpX249pFeRJLQphEJm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783817729; c=relaxed/simple;
	bh=JwL0SwKhPsQ4LYFQQ2djxiEDV12fm5SAvOQQcoVtc4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RmOccku6yb5n1WHyMYEQZ7ux3HoOpNAMzfAI8jSxFp8rWsIzJD+PcsO+1AVwJyxybKzWJFdIqfYWct53mgvbziKBrKDYzfWyfWec+IBDUYwdBZ1j3opkGhxvgcDeXhm+Q5YcwMftiddtGnhjiHMJmZYC901Sc6JAckcd/0ZP0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1elrArk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1elrArk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783817727; x=1815353727;
  h=date:from:to:cc:subject:message-id;
  bh=JwL0SwKhPsQ4LYFQQ2djxiEDV12fm5SAvOQQcoVtc4k=;
  b=g1elrArk6HeitnJ6v6N+9yWxu9pLWnP1PoIeKWEi1LsBZYuYHdxex+sZ
   3UlOqxOT98NhgGvtKQ3jKmU9iWHO/CiGztM0sRKbPcXJ3b+GDKFam4XpW
   YAmcvbN7syZLkp+paZPxegA5wNphEZTbdUw/leTOPrA3Kti/Sb+jLH/NC
   6Menn8dv4LuUbotLsZs7AP8kYIvLmBzUgbYYvENGg+eJWPadvqGvCgmSh
   b37t3qaMHYJveRpByDnULPweK/K5dIPxFNBpDd49AtmEvPvj7XJm2oSwH
   in4zO89W4fLTi9g553UwVrX4pEdKvE0C4bscBj9lk/nxHZvJAl6NizQHM
   w==;
X-CSE-ConnectionGUID: l4NslL1gQP6LemQAWcsofA==
X-CSE-MsgGUID: iDS/fPZXSfeb9Mmcx5KJeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84357588"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84357588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 17:55:27 -0700
X-CSE-ConnectionGUID: R8xxPO2/T76Q1J6J2eR4Ww==
X-CSE-MsgGUID: B41XNfxWRAi66DQTcQwRPw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2026 17:55:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiiSc-00000000KXS-2ABm;
	Sun, 12 Jul 2026 00:54:46 +0000
Date: Sun, 12 Jul 2026 08:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/xilinx/zynqmp-aes-gcm.c:183:11-12: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 182)
Message-ID: <202607120806.w8NH8R9l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Harsh Jain <h.jain@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: c315cb0005bed288e1db58f52ccd60ec189302d7 crypto: xilinx - Change coherent DMA to streaming DMA API
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260712/202607120806.w8NH8R9l-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c315cb0005be ("crypto: xilinx - Change coherent DMA to streaming DMA API")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607120806.w8NH8R9l-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/xilinx/zynqmp-aes-gcm.c:183:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 182)
   drivers/crypto/xilinx/zynqmp-aes-gcm.c:185:13-14: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 184)

vim +183 drivers/crypto/xilinx/zynqmp-aes-gcm.c

43f0478672c323 Harsh Jain    2025-12-20   85  
4d96f7d48131fe Kalyani Akula 2020-02-17   86  static int zynqmp_aes_aead_cipher(struct aead_request *req)
4d96f7d48131fe Kalyani Akula 2020-02-17   87  {
4d96f7d48131fe Kalyani Akula 2020-02-17   88  	struct crypto_aead *aead = crypto_aead_reqtfm(req);
56934489a80a74 Harsh Jain    2025-12-20   89  	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
56934489a80a74 Harsh Jain    2025-12-20   90  	struct xilinx_aead_req_ctx *rq_ctx = aead_request_ctx(req);
c315cb0005bed2 Harsh Jain    2025-12-20   91  	dma_addr_t dma_addr_data, dma_addr_hw_req;
4d96f7d48131fe Kalyani Akula 2020-02-17   92  	struct device *dev = tfm_ctx->dev;
4d96f7d48131fe Kalyani Akula 2020-02-17   93  	struct zynqmp_aead_hw_req *hwreq;
4d96f7d48131fe Kalyani Akula 2020-02-17   94  	unsigned int data_size;
4d96f7d48131fe Kalyani Akula 2020-02-17   95  	unsigned int status;
1d9000262b3b80 Rajan Vaja    2020-05-01   96  	int ret;
4d96f7d48131fe Kalyani Akula 2020-02-17   97  	size_t dma_size;
c315cb0005bed2 Harsh Jain    2025-12-20   98  	void *dmabuf;
4d96f7d48131fe Kalyani Akula 2020-02-17   99  	char *kbuf;
4d96f7d48131fe Kalyani Akula 2020-02-17  100  
c315cb0005bed2 Harsh Jain    2025-12-20  101  	dma_size = req->cryptlen + XILINX_AES_AUTH_SIZE;
c315cb0005bed2 Harsh Jain    2025-12-20  102  	kbuf = kmalloc(dma_size, GFP_KERNEL);
4d96f7d48131fe Kalyani Akula 2020-02-17  103  	if (!kbuf)
4d96f7d48131fe Kalyani Akula 2020-02-17  104  		return -ENOMEM;
4d96f7d48131fe Kalyani Akula 2020-02-17  105  
c315cb0005bed2 Harsh Jain    2025-12-20  106  	dmabuf = kmalloc(sizeof(*hwreq) + GCM_AES_IV_SIZE, GFP_KERNEL);
c315cb0005bed2 Harsh Jain    2025-12-20  107  	if (!dmabuf) {
c315cb0005bed2 Harsh Jain    2025-12-20  108  		kfree(kbuf);
4d96f7d48131fe Kalyani Akula 2020-02-17  109  		return -ENOMEM;
4d96f7d48131fe Kalyani Akula 2020-02-17  110  	}
c315cb0005bed2 Harsh Jain    2025-12-20  111  	hwreq = dmabuf;
4d96f7d48131fe Kalyani Akula 2020-02-17  112  	data_size = req->cryptlen;
4d96f7d48131fe Kalyani Akula 2020-02-17  113  	scatterwalk_map_and_copy(kbuf, req->src, 0, req->cryptlen, 0);
c315cb0005bed2 Harsh Jain    2025-12-20  114  	memcpy(dmabuf + sizeof(struct zynqmp_aead_hw_req), req->iv, GCM_AES_IV_SIZE);
c315cb0005bed2 Harsh Jain    2025-12-20  115  	dma_addr_data = dma_map_single(dev, kbuf, dma_size, DMA_BIDIRECTIONAL);
c315cb0005bed2 Harsh Jain    2025-12-20  116  	if (unlikely(dma_mapping_error(dev, dma_addr_data))) {
c315cb0005bed2 Harsh Jain    2025-12-20  117  		ret = -ENOMEM;
c315cb0005bed2 Harsh Jain    2025-12-20  118  		goto freemem;
c315cb0005bed2 Harsh Jain    2025-12-20  119  	}
4d96f7d48131fe Kalyani Akula 2020-02-17  120  
4d96f7d48131fe Kalyani Akula 2020-02-17  121  	hwreq->src = dma_addr_data;
4d96f7d48131fe Kalyani Akula 2020-02-17  122  	hwreq->dst = dma_addr_data;
4d96f7d48131fe Kalyani Akula 2020-02-17  123  	hwreq->keysrc = tfm_ctx->keysrc;
4d96f7d48131fe Kalyani Akula 2020-02-17  124  	hwreq->op = rq_ctx->op;
4d96f7d48131fe Kalyani Akula 2020-02-17  125  
56934489a80a74 Harsh Jain    2025-12-20  126  	if (hwreq->op == XILINX_AES_ENCRYPT)
4d96f7d48131fe Kalyani Akula 2020-02-17  127  		hwreq->size = data_size;
4d96f7d48131fe Kalyani Akula 2020-02-17  128  	else
56934489a80a74 Harsh Jain    2025-12-20  129  		hwreq->size = data_size - XILINX_AES_AUTH_SIZE;
4d96f7d48131fe Kalyani Akula 2020-02-17  130  
c315cb0005bed2 Harsh Jain    2025-12-20  131  	if (hwreq->keysrc == ZYNQMP_AES_KUP_KEY)
c315cb0005bed2 Harsh Jain    2025-12-20  132  		hwreq->key = tfm_ctx->key_dma_addr;
c315cb0005bed2 Harsh Jain    2025-12-20  133  	else
4d96f7d48131fe Kalyani Akula 2020-02-17  134  		hwreq->key = 0;
4d96f7d48131fe Kalyani Akula 2020-02-17  135  
c315cb0005bed2 Harsh Jain    2025-12-20  136  	dma_addr_hw_req = dma_map_single(dev, dmabuf, sizeof(struct zynqmp_aead_hw_req) +
c315cb0005bed2 Harsh Jain    2025-12-20  137  					 GCM_AES_IV_SIZE,
c315cb0005bed2 Harsh Jain    2025-12-20  138  					 DMA_TO_DEVICE);
c315cb0005bed2 Harsh Jain    2025-12-20  139  	if (unlikely(dma_mapping_error(dev, dma_addr_hw_req))) {
c315cb0005bed2 Harsh Jain    2025-12-20  140  		ret = -ENOMEM;
c315cb0005bed2 Harsh Jain    2025-12-20  141  		dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
c315cb0005bed2 Harsh Jain    2025-12-20  142  		goto freemem;
c315cb0005bed2 Harsh Jain    2025-12-20  143  	}
c315cb0005bed2 Harsh Jain    2025-12-20  144  	hwreq->iv = dma_addr_hw_req + sizeof(struct zynqmp_aead_hw_req);
c315cb0005bed2 Harsh Jain    2025-12-20  145  	dma_sync_single_for_device(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) +
c315cb0005bed2 Harsh Jain    2025-12-20  146  				   GCM_AES_IV_SIZE, DMA_TO_DEVICE);
1d9000262b3b80 Rajan Vaja    2020-05-01  147  	ret = zynqmp_pm_aes_engine(dma_addr_hw_req, &status);
c315cb0005bed2 Harsh Jain    2025-12-20  148  	dma_unmap_single(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE,
c315cb0005bed2 Harsh Jain    2025-12-20  149  			 DMA_TO_DEVICE);
c315cb0005bed2 Harsh Jain    2025-12-20  150  	dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
1d9000262b3b80 Rajan Vaja    2020-05-01  151  	if (ret) {
1d9000262b3b80 Rajan Vaja    2020-05-01  152  		dev_err(dev, "ERROR: AES PM API failed\n");
1d9000262b3b80 Rajan Vaja    2020-05-01  153  	} else if (status) {
4d96f7d48131fe Kalyani Akula 2020-02-17  154  		switch (status) {
4d96f7d48131fe Kalyani Akula 2020-02-17  155  		case ZYNQMP_AES_GCM_TAG_MISMATCH_ERR:
349f0d326d7c92 Harsh Jain    2025-12-20  156  			ret = -EBADMSG;
4d96f7d48131fe Kalyani Akula 2020-02-17  157  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  158  		case ZYNQMP_AES_WRONG_KEY_SRC_ERR:
349f0d326d7c92 Harsh Jain    2025-12-20  159  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  160  			dev_err(dev, "ERROR: Wrong KeySrc, enable secure mode\n");
4d96f7d48131fe Kalyani Akula 2020-02-17  161  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  162  		case ZYNQMP_AES_PUF_NOT_PROGRAMMED:
349f0d326d7c92 Harsh Jain    2025-12-20  163  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  164  			dev_err(dev, "ERROR: PUF is not registered\n");
4d96f7d48131fe Kalyani Akula 2020-02-17  165  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  166  		default:
349f0d326d7c92 Harsh Jain    2025-12-20  167  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  168  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  169  		}
4d96f7d48131fe Kalyani Akula 2020-02-17  170  	} else {
56934489a80a74 Harsh Jain    2025-12-20  171  		if (hwreq->op == XILINX_AES_ENCRYPT)
f939b88c7ca56c Harsh Jain    2025-12-20  172  			data_size = data_size + crypto_aead_authsize(aead);
4d96f7d48131fe Kalyani Akula 2020-02-17  173  		else
56934489a80a74 Harsh Jain    2025-12-20  174  			data_size = data_size - XILINX_AES_AUTH_SIZE;
4d96f7d48131fe Kalyani Akula 2020-02-17  175  
4d96f7d48131fe Kalyani Akula 2020-02-17  176  		sg_copy_from_buffer(req->dst, sg_nents(req->dst),
4d96f7d48131fe Kalyani Akula 2020-02-17  177  				    kbuf, data_size);
349f0d326d7c92 Harsh Jain    2025-12-20  178  		ret = 0;
4d96f7d48131fe Kalyani Akula 2020-02-17  179  	}
4d96f7d48131fe Kalyani Akula 2020-02-17  180  
c315cb0005bed2 Harsh Jain    2025-12-20  181  freemem:
4d96f7d48131fe Kalyani Akula 2020-02-17 @182  	memzero_explicit(kbuf, dma_size);
c315cb0005bed2 Harsh Jain    2025-12-20 @183  	kfree(kbuf);
c315cb0005bed2 Harsh Jain    2025-12-20  184  	memzero_explicit(dmabuf, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE);
c315cb0005bed2 Harsh Jain    2025-12-20  185  	kfree(dmabuf);
349f0d326d7c92 Harsh Jain    2025-12-20  186  
349f0d326d7c92 Harsh Jain    2025-12-20  187  	return ret;
4d96f7d48131fe Kalyani Akula 2020-02-17  188  }
4d96f7d48131fe Kalyani Akula 2020-02-17  189  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
