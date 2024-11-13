Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58F18A6D8
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731541436; cv=none; b=IToXzQ+51Mlgeg/9KbOBAvty9KSXJaq/aBe3qaIpIasdwIJr30HORicn97qtuD1IizwbLPhEdcwNv7ZojiDedoPHoMf35oZWFc3J1hOhVfiQbHo3pcU8KfRUzJD10HozbHz5aK1ogTkKzwbnQBwvUEelK3W3HU7JAw3bAztyYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731541436; c=relaxed/simple;
	bh=Q0L0WfYqPNtepRmhFWBIxw2ycnoZqvGKsKe5wAUx91k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJtnmkt7ry2E0pZJHuP/iGldkzUSE+4ZL6hjEEEBk2uKjFcHDxoh9OSqNfBUN2igKnZhFCfsfzoJxNbSDZf51WFZVWZS9V6I14KKZgDs62kb3H4GDiv4IQ++u58EqIZxjA2MsZwacjlSbh4NNnVqds4u9jektHDUmHk8tlz9/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk5jmPHl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk5jmPHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731541434; x=1763077434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0L0WfYqPNtepRmhFWBIxw2ycnoZqvGKsKe5wAUx91k=;
  b=Rk5jmPHl/eynvQS8zA+yD3hC0eIch3zIaAcz9OWQXachHcbyTMHqBqY6
   gPvWodc30prOdTXM0SeXtWFaxp2Yo3fCJFwhVnda5mD/huahFxcGNHNSu
   c5GbE3iFSK504Pf4ywxawvZtlwFEl4KYksmvsrpc3y/HltYjn2dg5T3NW
   RlSaH4lg0Nd5SKnmCMrXOtnusXFDOUNByB4pXNUx19/6wXwYDZ+t9G2ir
   w1FcYFeLRXHGz6/QYNp6i/SiuM2YzBfaskXK6F5K2gfYZNJmzIzM0rUZU
   2OFvA510vLsO53Fw3IXuKLAY8l+fePo6HcDNMGKy9tckyks0IpDh8xOm4
   Q==;
X-CSE-ConnectionGUID: /vZP1lzQQoax/dS2UhIQTA==
X-CSE-MsgGUID: PHG1eJqJTSmhbtTloGUPDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42874673"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42874673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:43:54 -0800
X-CSE-ConnectionGUID: UQi/5ldCQnietJ87YPQGfw==
X-CSE-MsgGUID: VlSWYxQcR1+FxjffsAuorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="118843809"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 15:43:52 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBN1Z-0000s9-0h;
	Wed, 13 Nov 2024 23:43:49 +0000
Date: Thu, 14 Nov 2024 07:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
Message-ID: <202411140735.mQv5EJqy-lkp@intel.com>
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
In-Reply-To: <20241112015920.22564-4-ansuelsmth@gmail.com>
References: <20241112015920.22564-4-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Antoine Tenart <atenart@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Will Deacon <will@kernel.org>
TO: Waiman Long <longman@redhat.com>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: linux-crypto@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: llvm@lists.linux.dev
TO: upstream@airoha.com
CC: Richard van Schagen <vschagen@icloud.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master tip/locking/core linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/spinlock-extend-guard-with-spinlock_bh-variants/20241112-100439
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241112015920.22564-4-ansuelsmth%40gmail.com
patch subject: [PATCH v7 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto engine support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r073-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140735.mQv5EJqy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411140735.mQv5EJqy-lkp@intel.com/

New smatch warnings:
drivers/crypto/inside-secure/eip93/eip93-hash.c:197 __eip93_hash_init() error: uninitialized symbol 'sa_record_hmac'.

Old smatch warnings:
drivers/crypto/inside-secure/eip93/eip93-hash.c:330 eip93_send_hash_req() error: uninitialized symbol 'crypto_async_idr'.

vim +/sa_record_hmac +197 drivers/crypto/inside-secure/eip93/eip93-hash.c

7cd8d75e204549 Christian Marangi 2024-11-12  143  
7cd8d75e204549 Christian Marangi 2024-11-12  144  static int __eip93_hash_init(struct ahash_request *req, struct sa_state *sa_state,
7cd8d75e204549 Christian Marangi 2024-11-12  145  			     dma_addr_t sa_state_base)
7cd8d75e204549 Christian Marangi 2024-11-12  146  {
7cd8d75e204549 Christian Marangi 2024-11-12  147  	struct eip93_hash_reqctx *rctx = ahash_request_ctx(req);
7cd8d75e204549 Christian Marangi 2024-11-12  148  	struct crypto_ahash *ahash = crypto_ahash_reqtfm(req);
7cd8d75e204549 Christian Marangi 2024-11-12  149  	struct eip93_hash_ctx *ctx = crypto_ahash_ctx(ahash);
7cd8d75e204549 Christian Marangi 2024-11-12  150  	struct sa_record *sa_record, *sa_record_hmac;
7cd8d75e204549 Christian Marangi 2024-11-12  151  	struct eip93_device *mtk = ctx->mtk;
7cd8d75e204549 Christian Marangi 2024-11-12  152  	int digestsize;
7cd8d75e204549 Christian Marangi 2024-11-12  153  	int ret;
7cd8d75e204549 Christian Marangi 2024-11-12  154  
7cd8d75e204549 Christian Marangi 2024-11-12  155  	/* Set sa_state and mtk for rctx to handle error case later */
7cd8d75e204549 Christian Marangi 2024-11-12  156  	rctx->mtk = mtk;
7cd8d75e204549 Christian Marangi 2024-11-12  157  	rctx->sa_state = sa_state;
7cd8d75e204549 Christian Marangi 2024-11-12  158  	rctx->sa_state_base = sa_state_base;
7cd8d75e204549 Christian Marangi 2024-11-12  159  
7cd8d75e204549 Christian Marangi 2024-11-12  160  	sa_record = kzalloc(sizeof(*sa_record), GFP_KERNEL);
7cd8d75e204549 Christian Marangi 2024-11-12  161  	if (!sa_record)
7cd8d75e204549 Christian Marangi 2024-11-12  162  		return -ENOMEM;
7cd8d75e204549 Christian Marangi 2024-11-12  163  
7cd8d75e204549 Christian Marangi 2024-11-12  164  	if (IS_HMAC(ctx->flags)) {
7cd8d75e204549 Christian Marangi 2024-11-12  165  		sa_record_hmac = kzalloc(sizeof(*sa_record_hmac), GFP_KERNEL);
7cd8d75e204549 Christian Marangi 2024-11-12  166  		if (!sa_record_hmac) {
7cd8d75e204549 Christian Marangi 2024-11-12  167  			ret = -ENOMEM;
7cd8d75e204549 Christian Marangi 2024-11-12  168  			goto free_sa_record;
7cd8d75e204549 Christian Marangi 2024-11-12  169  		}
7cd8d75e204549 Christian Marangi 2024-11-12  170  	}
7cd8d75e204549 Christian Marangi 2024-11-12  171  
7cd8d75e204549 Christian Marangi 2024-11-12  172  	digestsize = crypto_ahash_digestsize(ahash);
7cd8d75e204549 Christian Marangi 2024-11-12  173  
7cd8d75e204549 Christian Marangi 2024-11-12  174  	eip93_set_sa_record(sa_record, 0, ctx->flags);
7cd8d75e204549 Christian Marangi 2024-11-12  175  	sa_record->sa_cmd0_word |= EIP93_SA_CMD_HASH_FROM_STATE;
7cd8d75e204549 Christian Marangi 2024-11-12  176  	sa_record->sa_cmd0_word |= EIP93_SA_CMD_SAVE_HASH;
7cd8d75e204549 Christian Marangi 2024-11-12  177  	sa_record->sa_cmd0_word &= ~EIP93_SA_CMD_OPCODE;
7cd8d75e204549 Christian Marangi 2024-11-12  178  	sa_record->sa_cmd0_word |= FIELD_PREP(EIP93_SA_CMD_OPCODE,
7cd8d75e204549 Christian Marangi 2024-11-12  179  					      EIP93_SA_CMD_OPCODE_BASIC_OUT_HASH);
7cd8d75e204549 Christian Marangi 2024-11-12  180  	sa_record->sa_cmd0_word &= ~EIP93_SA_CMD_DIGEST_LENGTH;
7cd8d75e204549 Christian Marangi 2024-11-12  181  	sa_record->sa_cmd0_word |= FIELD_PREP(EIP93_SA_CMD_DIGEST_LENGTH,
7cd8d75e204549 Christian Marangi 2024-11-12  182  					      digestsize / sizeof(u32));
7cd8d75e204549 Christian Marangi 2024-11-12  183  
7cd8d75e204549 Christian Marangi 2024-11-12  184  	/*
7cd8d75e204549 Christian Marangi 2024-11-12  185  	 * HMAC special handling
7cd8d75e204549 Christian Marangi 2024-11-12  186  	 * Enabling CMD_HMAC force the inner hash to be always finalized.
7cd8d75e204549 Christian Marangi 2024-11-12  187  	 * This cause problems on handling message > 64 byte as we
7cd8d75e204549 Christian Marangi 2024-11-12  188  	 * need to produce intermediate inner hash on sending intermediate
7cd8d75e204549 Christian Marangi 2024-11-12  189  	 * 64 bytes blocks.
7cd8d75e204549 Christian Marangi 2024-11-12  190  	 *
7cd8d75e204549 Christian Marangi 2024-11-12  191  	 * To handle this, enable CMD_HMAC only on the last block.
7cd8d75e204549 Christian Marangi 2024-11-12  192  	 * We make a duplicate of sa_record and on the last descriptor,
7cd8d75e204549 Christian Marangi 2024-11-12  193  	 * we pass a dedicated sa_record with CMD_HMAC enabled to make
7cd8d75e204549 Christian Marangi 2024-11-12  194  	 * EIP93 apply the outer hash.
7cd8d75e204549 Christian Marangi 2024-11-12  195  	 */
7cd8d75e204549 Christian Marangi 2024-11-12  196  	if (IS_HMAC(ctx->flags)) {
7cd8d75e204549 Christian Marangi 2024-11-12 @197  		memcpy(sa_record_hmac, sa_record, sizeof(*sa_record));
7cd8d75e204549 Christian Marangi 2024-11-12  198  		/* Copy pre-hashed opad for HMAC */
7cd8d75e204549 Christian Marangi 2024-11-12  199  		memcpy(sa_record_hmac->sa_o_digest, ctx->opad, SHA256_DIGEST_SIZE);
7cd8d75e204549 Christian Marangi 2024-11-12  200  
7cd8d75e204549 Christian Marangi 2024-11-12  201  		/* Disable HMAC for hash normal sa_record */
7cd8d75e204549 Christian Marangi 2024-11-12  202  		sa_record->sa_cmd1_word &= ~EIP93_SA_CMD_HMAC;
7cd8d75e204549 Christian Marangi 2024-11-12  203  	}
7cd8d75e204549 Christian Marangi 2024-11-12  204  
7cd8d75e204549 Christian Marangi 2024-11-12  205  	rctx->sa_record = sa_record;
7cd8d75e204549 Christian Marangi 2024-11-12  206  	rctx->sa_record_base = dma_map_single(mtk->dev, rctx->sa_record,
7cd8d75e204549 Christian Marangi 2024-11-12  207  					      sizeof(*rctx->sa_record),
7cd8d75e204549 Christian Marangi 2024-11-12  208  					      DMA_TO_DEVICE);
7cd8d75e204549 Christian Marangi 2024-11-12  209  	ret = dma_mapping_error(mtk->dev, rctx->sa_record_base);
7cd8d75e204549 Christian Marangi 2024-11-12  210  	if (ret)
7cd8d75e204549 Christian Marangi 2024-11-12  211  		goto free_sa_record;
7cd8d75e204549 Christian Marangi 2024-11-12  212  
7cd8d75e204549 Christian Marangi 2024-11-12  213  	if (IS_HMAC(ctx->flags)) {
7cd8d75e204549 Christian Marangi 2024-11-12  214  		rctx->sa_record_hmac = sa_record_hmac;
7cd8d75e204549 Christian Marangi 2024-11-12  215  		rctx->sa_record_hmac_base = dma_map_single(mtk->dev,
7cd8d75e204549 Christian Marangi 2024-11-12  216  							   rctx->sa_record_hmac,
7cd8d75e204549 Christian Marangi 2024-11-12  217  							   sizeof(*rctx->sa_record_hmac),
7cd8d75e204549 Christian Marangi 2024-11-12  218  							   DMA_TO_DEVICE);
7cd8d75e204549 Christian Marangi 2024-11-12  219  		ret = dma_mapping_error(mtk->dev, rctx->sa_record_hmac_base);
7cd8d75e204549 Christian Marangi 2024-11-12  220  		if (ret)
7cd8d75e204549 Christian Marangi 2024-11-12  221  			goto free_sa_record_base;
7cd8d75e204549 Christian Marangi 2024-11-12  222  	}
7cd8d75e204549 Christian Marangi 2024-11-12  223  
7cd8d75e204549 Christian Marangi 2024-11-12  224  	rctx->len = 0;
7cd8d75e204549 Christian Marangi 2024-11-12  225  	rctx->left_last = 0;
7cd8d75e204549 Christian Marangi 2024-11-12  226  	rctx->partial_hash = false;
7cd8d75e204549 Christian Marangi 2024-11-12  227  	rctx->export_state = false;
7cd8d75e204549 Christian Marangi 2024-11-12  228  	rctx->state = NULL;
7cd8d75e204549 Christian Marangi 2024-11-12  229  	INIT_LIST_HEAD(&rctx->blocks);
7cd8d75e204549 Christian Marangi 2024-11-12  230  
7cd8d75e204549 Christian Marangi 2024-11-12  231  	return 0;
7cd8d75e204549 Christian Marangi 2024-11-12  232  
7cd8d75e204549 Christian Marangi 2024-11-12  233  free_sa_record_base:
7cd8d75e204549 Christian Marangi 2024-11-12  234  	dma_unmap_single(mtk->dev, rctx->sa_record_base, sizeof(*rctx->sa_record),
7cd8d75e204549 Christian Marangi 2024-11-12  235  			 DMA_TO_DEVICE);
7cd8d75e204549 Christian Marangi 2024-11-12  236  free_sa_record:
7cd8d75e204549 Christian Marangi 2024-11-12  237  	kfree(sa_record);
7cd8d75e204549 Christian Marangi 2024-11-12  238  	return ret;
7cd8d75e204549 Christian Marangi 2024-11-12  239  }
7cd8d75e204549 Christian Marangi 2024-11-12  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
