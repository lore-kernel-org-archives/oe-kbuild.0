Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E332D0FC
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679923; cv=none; b=ZsJWy8CWT7r/YQVo+xuuLLWYrlMbr/KMxeW4Ny5/jWY0OBLyyXDJvGSj8AJwNLqWxe6zncUli92Ctn84yG3umMp0TlIDZfDnPzLIVm49X2V6oHFKtNIIrDk8R5stIkAu4DN/uJynU3g2iRqRoMOvPa1oafJ+FBJ/j38jv+4GJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679923; c=relaxed/simple;
	bh=i33QdeMW5CTXV0RzOgsfEZaeXHK2vIBnUj4nWyJFN8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ajl27nK2rYxs+7AC4DKLvgSpkI5AEiN33pDXu9jxaWcZGivvofND/Jl5thHupZW9alkk0LxPNkpC3bl7VyvZ3z18hASgN2QHtxsykCWup8gb+BcyXzWALSiXTHkd2wR5bUkE/LvmBH5f7lpluHOxWoyczuAUIAbObWjRSa+Tbcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djn9xUxj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djn9xUxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787679921; x=1819215921;
  h=date:from:to:cc:subject:message-id;
  bh=i33QdeMW5CTXV0RzOgsfEZaeXHK2vIBnUj4nWyJFN8Y=;
  b=Djn9xUxjS9561j/0jrt5EHNU02Hzf/9N+AXvF+b78mo59fYA3EDlhSLP
   9IFs0kevb84Nq4tkzdah1npD37ckLhitONh3dM71Cmmrsg6mq7fjEztd1
   orXcGPyfjzoOWOUAi3HnC0T55T0LjnkYloMNYrcDDjDS9f88cH5JttZzG
   GbFcfbH3YnC86k9u+TeIOedkaxbWfPNalrvgL8VPaFTNA0V/pms1ABrkG
   eNjxf60UE3cDVjcJP309Qo8Ea/U32QP0meRocXCu2zJIBioUOncAVJ00c
   26Zk2yxQlXs+T/8DijUXQCk1GU/RmqfUYCKg0Bi0yc7NFBI1twyayRHd0
   A==;
X-CSE-ConnectionGUID: PsL3K2AOQDaUDgnzsvJVSw==
X-CSE-MsgGUID: h4YeTYsBSF+dgM+HjYhQxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87281948"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="87281948"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 10:45:20 -0700
X-CSE-ConnectionGUID: T+ZD+xkpQniQXvj+OlDziw==
X-CSE-MsgGUID: F5h15pzHS2uxjawRyv1YYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="269297401"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2026 10:45:19 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyvD3-000000006Bt-0Wzj;
	Tue, 25 Aug 2026 17:45:17 +0000
Date: Wed, 26 Aug 2026 01:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key()
 error: buffer overflow 'ctx->key' 16 <= 1073741823
Message-ID: <202608260145.PmdJvd3y-lkp@intel.com>
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
head:   66498c75b4f8017f62d720d9b59675bdf3abce91
commit: 4fbfd7b206b1aa3fedfe8e82a8d3b8daca007d57 crypto: ti - Add support for AES-XTS in DTHEv2 driver
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r072-20260822 (https://download.01.org/0day-ci/archive/20260826/202608260145.PmdJvd3y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbfd7b206b1 ("crypto: ti - Add support for AES-XTS in DTHEv2 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608260145.PmdJvd3y-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823

vim +205 drivers/crypto/ti/dthev2-aes.c

4fbfd7b206b1aa T Pratham 2025-10-22  179  
52f641bc63a466 T Pratham 2025-08-20  180  static void dthe_aes_set_ctrl_key(struct dthe_tfm_ctx *ctx,
52f641bc63a466 T Pratham 2025-08-20  181  				  struct dthe_aes_req_ctx *rctx,
52f641bc63a466 T Pratham 2025-08-20  182  				  u32 *iv_in)
52f641bc63a466 T Pratham 2025-08-20  183  {
52f641bc63a466 T Pratham 2025-08-20  184  	struct dthe_data *dev_data = dthe_get_dev(ctx);
52f641bc63a466 T Pratham 2025-08-20  185  	void __iomem *aes_base_reg = dev_data->regs + DTHE_P_AES_BASE;
52f641bc63a466 T Pratham 2025-08-20  186  	u32 ctrl_val = 0;
52f641bc63a466 T Pratham 2025-08-20  187  
52f641bc63a466 T Pratham 2025-08-20  188  	writel_relaxed(ctx->key[0], aes_base_reg + DTHE_P_AES_KEY1_0);
52f641bc63a466 T Pratham 2025-08-20  189  	writel_relaxed(ctx->key[1], aes_base_reg + DTHE_P_AES_KEY1_1);
52f641bc63a466 T Pratham 2025-08-20  190  	writel_relaxed(ctx->key[2], aes_base_reg + DTHE_P_AES_KEY1_2);
52f641bc63a466 T Pratham 2025-08-20  191  	writel_relaxed(ctx->key[3], aes_base_reg + DTHE_P_AES_KEY1_3);
52f641bc63a466 T Pratham 2025-08-20  192  
52f641bc63a466 T Pratham 2025-08-20  193  	if (ctx->keylen > AES_KEYSIZE_128) {
52f641bc63a466 T Pratham 2025-08-20  194  		writel_relaxed(ctx->key[4], aes_base_reg + DTHE_P_AES_KEY1_4);
52f641bc63a466 T Pratham 2025-08-20  195  		writel_relaxed(ctx->key[5], aes_base_reg + DTHE_P_AES_KEY1_5);
52f641bc63a466 T Pratham 2025-08-20  196  	}
52f641bc63a466 T Pratham 2025-08-20  197  	if (ctx->keylen == AES_KEYSIZE_256) {
52f641bc63a466 T Pratham 2025-08-20  198  		writel_relaxed(ctx->key[6], aes_base_reg + DTHE_P_AES_KEY1_6);
52f641bc63a466 T Pratham 2025-08-20  199  		writel_relaxed(ctx->key[7], aes_base_reg + DTHE_P_AES_KEY1_7);
52f641bc63a466 T Pratham 2025-08-20  200  	}
52f641bc63a466 T Pratham 2025-08-20  201  
4fbfd7b206b1aa T Pratham 2025-10-22  202  	if (ctx->aes_mode == DTHE_AES_XTS) {
4fbfd7b206b1aa T Pratham 2025-10-22  203  		size_t key2_offset = ctx->keylen / sizeof(u32);
4fbfd7b206b1aa T Pratham 2025-10-22  204  
4fbfd7b206b1aa T Pratham 2025-10-22 @205  		writel_relaxed(ctx->key[key2_offset + 0], aes_base_reg + DTHE_P_AES_KEY2_0);
4fbfd7b206b1aa T Pratham 2025-10-22  206  		writel_relaxed(ctx->key[key2_offset + 1], aes_base_reg + DTHE_P_AES_KEY2_1);
4fbfd7b206b1aa T Pratham 2025-10-22  207  		writel_relaxed(ctx->key[key2_offset + 2], aes_base_reg + DTHE_P_AES_KEY2_2);
4fbfd7b206b1aa T Pratham 2025-10-22  208  		writel_relaxed(ctx->key[key2_offset + 3], aes_base_reg + DTHE_P_AES_KEY2_3);
4fbfd7b206b1aa T Pratham 2025-10-22  209  
4fbfd7b206b1aa T Pratham 2025-10-22  210  		if (ctx->keylen > AES_KEYSIZE_128) {
4fbfd7b206b1aa T Pratham 2025-10-22  211  			writel_relaxed(ctx->key[key2_offset + 4], aes_base_reg + DTHE_P_AES_KEY2_4);
4fbfd7b206b1aa T Pratham 2025-10-22  212  			writel_relaxed(ctx->key[key2_offset + 5], aes_base_reg + DTHE_P_AES_KEY2_5);
4fbfd7b206b1aa T Pratham 2025-10-22  213  		}
4fbfd7b206b1aa T Pratham 2025-10-22  214  		if (ctx->keylen == AES_KEYSIZE_256) {
4fbfd7b206b1aa T Pratham 2025-10-22  215  			writel_relaxed(ctx->key[key2_offset + 6], aes_base_reg + DTHE_P_AES_KEY2_6);
4fbfd7b206b1aa T Pratham 2025-10-22  216  			writel_relaxed(ctx->key[key2_offset + 7], aes_base_reg + DTHE_P_AES_KEY2_7);
4fbfd7b206b1aa T Pratham 2025-10-22  217  		}
4fbfd7b206b1aa T Pratham 2025-10-22  218  	}
4fbfd7b206b1aa T Pratham 2025-10-22  219  
52f641bc63a466 T Pratham 2025-08-20  220  	if (rctx->enc)
52f641bc63a466 T Pratham 2025-08-20  221  		ctrl_val |= DTHE_AES_CTRL_DIR_ENC;
52f641bc63a466 T Pratham 2025-08-20  222  
52f641bc63a466 T Pratham 2025-08-20  223  	if (ctx->keylen == AES_KEYSIZE_128)
52f641bc63a466 T Pratham 2025-08-20  224  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_16B;
52f641bc63a466 T Pratham 2025-08-20  225  	else if (ctx->keylen == AES_KEYSIZE_192)
52f641bc63a466 T Pratham 2025-08-20  226  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_24B;
52f641bc63a466 T Pratham 2025-08-20  227  	else
52f641bc63a466 T Pratham 2025-08-20  228  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_32B;
52f641bc63a466 T Pratham 2025-08-20  229  
52f641bc63a466 T Pratham 2025-08-20  230  	// Write AES mode
52f641bc63a466 T Pratham 2025-08-20  231  	ctrl_val &= DTHE_AES_CTRL_MODE_CLEAR_MASK;
52f641bc63a466 T Pratham 2025-08-20  232  	switch (ctx->aes_mode) {
52f641bc63a466 T Pratham 2025-08-20  233  	case DTHE_AES_ECB:
52f641bc63a466 T Pratham 2025-08-20  234  		ctrl_val |= AES_CTRL_ECB_MASK;
52f641bc63a466 T Pratham 2025-08-20  235  		break;
52f641bc63a466 T Pratham 2025-08-20  236  	case DTHE_AES_CBC:
52f641bc63a466 T Pratham 2025-08-20  237  		ctrl_val |= AES_CTRL_CBC_MASK;
52f641bc63a466 T Pratham 2025-08-20  238  		break;
4fbfd7b206b1aa T Pratham 2025-10-22  239  	case DTHE_AES_XTS:
4fbfd7b206b1aa T Pratham 2025-10-22  240  		ctrl_val |= AES_CTRL_XTS_MASK;
4fbfd7b206b1aa T Pratham 2025-10-22  241  		break;
52f641bc63a466 T Pratham 2025-08-20  242  	}
52f641bc63a466 T Pratham 2025-08-20  243  
52f641bc63a466 T Pratham 2025-08-20  244  	if (iv_in) {
52f641bc63a466 T Pratham 2025-08-20  245  		ctrl_val |= DTHE_AES_CTRL_SAVE_CTX_SET;
52f641bc63a466 T Pratham 2025-08-20  246  		for (int i = 0; i < AES_IV_WORDS; ++i)
52f641bc63a466 T Pratham 2025-08-20  247  			writel_relaxed(iv_in[i],
52f641bc63a466 T Pratham 2025-08-20  248  				       aes_base_reg + DTHE_P_AES_IV_IN_0 + (DTHE_REG_SIZE * i));
52f641bc63a466 T Pratham 2025-08-20  249  	}
52f641bc63a466 T Pratham 2025-08-20  250  
52f641bc63a466 T Pratham 2025-08-20  251  	writel_relaxed(ctrl_val, aes_base_reg + DTHE_P_AES_CTRL);
52f641bc63a466 T Pratham 2025-08-20  252  }
52f641bc63a466 T Pratham 2025-08-20  253  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
