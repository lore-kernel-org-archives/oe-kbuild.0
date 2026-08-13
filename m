Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16C31E828
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786583001; cv=none; b=LIf0tUh6XGXOtgyX7sLA/e837kKKsxN4aaUtMBs+CSDgVhjietvAlR8oRz44RRvBzE9QJ827Wf9HiwLp04IdcEILU8ztNAY2FZMGtxG6URS8I2zOAKO34QYfSRsTqUjyQ1AzZPBSTLzysX+o3rw3fRpl3FOGtt1GPDWeP9AVKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786583001; c=relaxed/simple;
	bh=2qVWeSYskpDJFlMxTGFYpNh1SB1e6wC6Mxye9Dy0LDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LH+aoGu68kjakYLPcBu02gICjNelwZcIvgJ63shhnwYLxTpxgfif/JcBAaENl6jDF98Y/peMB7ZKs/i6BqvSNG6kphy9SbHjqedHDICjsQ/hFMOlcrHv+XfXGBheMkQuPF8Wih87Hq959VTqMrqvfoU2U1FDKqtl3OhUTkaPVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LryC/3nu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LryC/3nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786582999; x=1818118999;
  h=date:from:to:cc:subject:message-id;
  bh=2qVWeSYskpDJFlMxTGFYpNh1SB1e6wC6Mxye9Dy0LDM=;
  b=LryC/3nu+DhjhEGr2wCV/sQx1RtT5sqmiPnbHxOKx1Rkn9RNvhsBF/WG
   n4xBtBS0FBStx6hxFbgSBnWsxgKxig7a+b4an1yFkt1keXJIyf7qQ90Pt
   5+2dfXba3LW8zouoZjBUHZgQuwZP2Gqkae67rqw7vJ/zBMPHDQeQl1Obt
   8CNbK267qgXrCWYVLpfv5awleYXiAMHbQEMkQOxRB3UzymGolf0FJHq6S
   AKx9P7O5yLJyUbGNwhV2z6zBACAJ5N1ULOxhjgpQqBUdkbNHkrtBcvzAc
   9RuT3kekf09EsvNjqWvUaTfdLmrZPAW/2B2KU+dmZHuborJB+aZD7PhbQ
   g==;
X-CSE-ConnectionGUID: U+OVz8ICTUC6nCusv+H0Ow==
X-CSE-MsgGUID: 8Q9U3KHiRJ23+tY4tYs7cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97815979"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97815979"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:03:18 -0700
X-CSE-ConnectionGUID: A+6DsFCcR32V2qYJELX+7g==
X-CSE-MsgGUID: Do/ln9UERBGmczG2FCEcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="262490030"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 18:03:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJql-00000000SLK-0ZMO;
	Thu, 13 Aug 2026 01:03:15 +0000
Date: Thu, 13 Aug 2026 09:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key()
 error: buffer overflow 'ctx->key' 16 <= u32max
Message-ID: <202608130858.rpjjU0F6-lkp@intel.com>
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
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: 4fbfd7b206b1aa3fedfe8e82a8d3b8daca007d57 crypto: ti - Add support for AES-XTS in DTHEv2 driver
date:   10 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 10 months ago
config: parisc-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130858.rpjjU0F6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbfd7b206b1 ("crypto: ti - Add support for AES-XTS in DTHEv2 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608130858.rpjjU0F6-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= u32max

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
