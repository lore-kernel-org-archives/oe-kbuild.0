Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554735F170
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930733; cv=none; b=bWhML5TF+/DQMrJiPZPwCKsRejxq0ZQ9LGj19sNx648bQTgmzz0A6K19rB6JgSGHuqcpWHcvIFPDtWSi7/rrjVHPmN37YcZXz5p/z367oxfO4Pe7rSi//vgV2ZajM0TItST9O0F8oIHw5+yHrM04MHghOvfO4oQgwp8MFy4m22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930733; c=relaxed/simple;
	bh=TLzDyYLqbixcJuX6gVIcDdjJyINqEPSwh0HdLQrtdX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3rXpNzv2nTMwi+4638qJLiX7KxRk8nfA/wuNNlI42iOHaA2I79PSkYJJMBBvCBeOGyKeYeqpOCM2GfvTQ4BPGUhgASpCzEvHVS71jWbdSeY5qKr7wFVlYRh1R3iPr9By0bFcFfRZ5f1sMi6Moe7NUDA9U85GqERsKSeQFBjFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaFL1NDK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaFL1NDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777930732; x=1809466732;
  h=date:from:to:cc:subject:message-id;
  bh=TLzDyYLqbixcJuX6gVIcDdjJyINqEPSwh0HdLQrtdX4=;
  b=AaFL1NDKA04eBfVuGNl/U/cV4cxVSC68VQ7TegZhl1zb/6AjyAsxk5uz
   SeVcQbuL6VtJrw8NTs6q8fHM+nGAEevP0oNA5J1uuLwsiCWuz+MEz9PJj
   g4mDnLzR4E4r2BGU4hSS9gkG8iIPdcg0caiwJgi+R3hZ/I0OCgkldf2Mp
   F8mfuP8pFTIoF294iotfTR4mdRGJ2W69wftUWKsMUt6T0ajzEMp3AiaHI
   ElmJbR54D1gfaTx+/r/omfpx0ROaCWIgtqJjdNa0QjB+TvSL8kKhFfP9J
   wrQzrpUY0ESt3ROZENR0zuUjOXxvNpkxGbwXQRRf7cagj529YHViUTPeC
   Q==;
X-CSE-ConnectionGUID: 76F01Xv+SgCE/p7rA2YWGQ==
X-CSE-MsgGUID: SztfDRMfRMeyp2omo1slrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82664602"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="82664602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 14:38:51 -0700
X-CSE-ConnectionGUID: HA7KubQgTFmIhr8axpIgzw==
X-CSE-MsgGUID: 1jBG+l0xSqS9QUokAg0OKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235878326"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 May 2026 14:38:15 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK0zL-0000000041Z-41gV;
	Mon, 04 May 2026 21:38:05 +0000
Date: Tue, 05 May 2026 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key()
 error: buffer overflow 'ctx->key' 16 <= 1073741823
Message-ID: <202605050545.FsB0X2gZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: T Pratham <t-pratham@ti.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 4fbfd7b206b1aa3fedfe8e82a8d3b8daca007d57 crypto: ti - Add support for AES-XTS in DTHEv2 driver
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r071-20260505 (https://download.01.org/0day-ci/archive/20260505/202605050545.FsB0X2gZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbfd7b206b1 ("crypto: ti - Add support for AES-XTS in DTHEv2 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605050545.FsB0X2gZ-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823

vim +205 drivers/crypto/ti/dthev2-aes.c

4fbfd7b206b1aa3 T Pratham 2025-10-22  179  
52f641bc63a4665 T Pratham 2025-08-20  180  static void dthe_aes_set_ctrl_key(struct dthe_tfm_ctx *ctx,
52f641bc63a4665 T Pratham 2025-08-20  181  				  struct dthe_aes_req_ctx *rctx,
52f641bc63a4665 T Pratham 2025-08-20  182  				  u32 *iv_in)
52f641bc63a4665 T Pratham 2025-08-20  183  {
52f641bc63a4665 T Pratham 2025-08-20  184  	struct dthe_data *dev_data = dthe_get_dev(ctx);
52f641bc63a4665 T Pratham 2025-08-20  185  	void __iomem *aes_base_reg = dev_data->regs + DTHE_P_AES_BASE;
52f641bc63a4665 T Pratham 2025-08-20  186  	u32 ctrl_val = 0;
52f641bc63a4665 T Pratham 2025-08-20  187  
52f641bc63a4665 T Pratham 2025-08-20  188  	writel_relaxed(ctx->key[0], aes_base_reg + DTHE_P_AES_KEY1_0);
52f641bc63a4665 T Pratham 2025-08-20  189  	writel_relaxed(ctx->key[1], aes_base_reg + DTHE_P_AES_KEY1_1);
52f641bc63a4665 T Pratham 2025-08-20  190  	writel_relaxed(ctx->key[2], aes_base_reg + DTHE_P_AES_KEY1_2);
52f641bc63a4665 T Pratham 2025-08-20  191  	writel_relaxed(ctx->key[3], aes_base_reg + DTHE_P_AES_KEY1_3);
52f641bc63a4665 T Pratham 2025-08-20  192  
52f641bc63a4665 T Pratham 2025-08-20  193  	if (ctx->keylen > AES_KEYSIZE_128) {
52f641bc63a4665 T Pratham 2025-08-20  194  		writel_relaxed(ctx->key[4], aes_base_reg + DTHE_P_AES_KEY1_4);
52f641bc63a4665 T Pratham 2025-08-20  195  		writel_relaxed(ctx->key[5], aes_base_reg + DTHE_P_AES_KEY1_5);
52f641bc63a4665 T Pratham 2025-08-20  196  	}
52f641bc63a4665 T Pratham 2025-08-20  197  	if (ctx->keylen == AES_KEYSIZE_256) {
52f641bc63a4665 T Pratham 2025-08-20  198  		writel_relaxed(ctx->key[6], aes_base_reg + DTHE_P_AES_KEY1_6);
52f641bc63a4665 T Pratham 2025-08-20  199  		writel_relaxed(ctx->key[7], aes_base_reg + DTHE_P_AES_KEY1_7);
52f641bc63a4665 T Pratham 2025-08-20  200  	}
52f641bc63a4665 T Pratham 2025-08-20  201  
4fbfd7b206b1aa3 T Pratham 2025-10-22  202  	if (ctx->aes_mode == DTHE_AES_XTS) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  203  		size_t key2_offset = ctx->keylen / sizeof(u32);
4fbfd7b206b1aa3 T Pratham 2025-10-22  204  
4fbfd7b206b1aa3 T Pratham 2025-10-22 @205  		writel_relaxed(ctx->key[key2_offset + 0], aes_base_reg + DTHE_P_AES_KEY2_0);
4fbfd7b206b1aa3 T Pratham 2025-10-22  206  		writel_relaxed(ctx->key[key2_offset + 1], aes_base_reg + DTHE_P_AES_KEY2_1);
4fbfd7b206b1aa3 T Pratham 2025-10-22  207  		writel_relaxed(ctx->key[key2_offset + 2], aes_base_reg + DTHE_P_AES_KEY2_2);
4fbfd7b206b1aa3 T Pratham 2025-10-22  208  		writel_relaxed(ctx->key[key2_offset + 3], aes_base_reg + DTHE_P_AES_KEY2_3);
4fbfd7b206b1aa3 T Pratham 2025-10-22  209  
4fbfd7b206b1aa3 T Pratham 2025-10-22  210  		if (ctx->keylen > AES_KEYSIZE_128) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  211  			writel_relaxed(ctx->key[key2_offset + 4], aes_base_reg + DTHE_P_AES_KEY2_4);
4fbfd7b206b1aa3 T Pratham 2025-10-22  212  			writel_relaxed(ctx->key[key2_offset + 5], aes_base_reg + DTHE_P_AES_KEY2_5);
4fbfd7b206b1aa3 T Pratham 2025-10-22  213  		}
4fbfd7b206b1aa3 T Pratham 2025-10-22  214  		if (ctx->keylen == AES_KEYSIZE_256) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  215  			writel_relaxed(ctx->key[key2_offset + 6], aes_base_reg + DTHE_P_AES_KEY2_6);
4fbfd7b206b1aa3 T Pratham 2025-10-22  216  			writel_relaxed(ctx->key[key2_offset + 7], aes_base_reg + DTHE_P_AES_KEY2_7);
4fbfd7b206b1aa3 T Pratham 2025-10-22  217  		}
4fbfd7b206b1aa3 T Pratham 2025-10-22  218  	}
4fbfd7b206b1aa3 T Pratham 2025-10-22  219  
52f641bc63a4665 T Pratham 2025-08-20  220  	if (rctx->enc)
52f641bc63a4665 T Pratham 2025-08-20  221  		ctrl_val |= DTHE_AES_CTRL_DIR_ENC;
52f641bc63a4665 T Pratham 2025-08-20  222  
52f641bc63a4665 T Pratham 2025-08-20  223  	if (ctx->keylen == AES_KEYSIZE_128)
52f641bc63a4665 T Pratham 2025-08-20  224  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_16B;
52f641bc63a4665 T Pratham 2025-08-20  225  	else if (ctx->keylen == AES_KEYSIZE_192)
52f641bc63a4665 T Pratham 2025-08-20  226  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_24B;
52f641bc63a4665 T Pratham 2025-08-20  227  	else
52f641bc63a4665 T Pratham 2025-08-20  228  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_32B;
52f641bc63a4665 T Pratham 2025-08-20  229  
52f641bc63a4665 T Pratham 2025-08-20  230  	// Write AES mode
52f641bc63a4665 T Pratham 2025-08-20  231  	ctrl_val &= DTHE_AES_CTRL_MODE_CLEAR_MASK;
52f641bc63a4665 T Pratham 2025-08-20  232  	switch (ctx->aes_mode) {
52f641bc63a4665 T Pratham 2025-08-20  233  	case DTHE_AES_ECB:
52f641bc63a4665 T Pratham 2025-08-20  234  		ctrl_val |= AES_CTRL_ECB_MASK;
52f641bc63a4665 T Pratham 2025-08-20  235  		break;
52f641bc63a4665 T Pratham 2025-08-20  236  	case DTHE_AES_CBC:
52f641bc63a4665 T Pratham 2025-08-20  237  		ctrl_val |= AES_CTRL_CBC_MASK;
52f641bc63a4665 T Pratham 2025-08-20  238  		break;
4fbfd7b206b1aa3 T Pratham 2025-10-22  239  	case DTHE_AES_XTS:
4fbfd7b206b1aa3 T Pratham 2025-10-22  240  		ctrl_val |= AES_CTRL_XTS_MASK;
4fbfd7b206b1aa3 T Pratham 2025-10-22  241  		break;
52f641bc63a4665 T Pratham 2025-08-20  242  	}
52f641bc63a4665 T Pratham 2025-08-20  243  
52f641bc63a4665 T Pratham 2025-08-20  244  	if (iv_in) {
52f641bc63a4665 T Pratham 2025-08-20  245  		ctrl_val |= DTHE_AES_CTRL_SAVE_CTX_SET;
52f641bc63a4665 T Pratham 2025-08-20  246  		for (int i = 0; i < AES_IV_WORDS; ++i)
52f641bc63a4665 T Pratham 2025-08-20  247  			writel_relaxed(iv_in[i],
52f641bc63a4665 T Pratham 2025-08-20  248  				       aes_base_reg + DTHE_P_AES_IV_IN_0 + (DTHE_REG_SIZE * i));
52f641bc63a4665 T Pratham 2025-08-20  249  	}
52f641bc63a4665 T Pratham 2025-08-20  250  
52f641bc63a4665 T Pratham 2025-08-20  251  	writel_relaxed(ctrl_val, aes_base_reg + DTHE_P_AES_CTRL);
52f641bc63a4665 T Pratham 2025-08-20  252  }
52f641bc63a4665 T Pratham 2025-08-20  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
