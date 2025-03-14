Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168D1DDA33
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 23:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741996047; cv=none; b=eqDNf9UayyakzkkP/tYeSf6/L9k6XyX49qnec6HgbW7HNSIIxVLd8y6iP2exkAZOR09M8XBzITrAyMpAYkAb+uYEjolqX7uTc+JL7eoy/1Q3AcscppL9ca5js1NxRzcV0J0wa1WR3sLkPgPMdOxlFFHyQfiUjCtZlftejWigmSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741996047; c=relaxed/simple;
	bh=8IkjML8DW0IFeS0uNXWmu1iTqXRvcAwn97KKZ+CHYjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gK+mkHe3YGuS4QSgqL93QR4Ef7bBB2jNfXRi7c+sbffTYyrlkOVouW/lLFwWRxqa1uAIQ4QBC1vUJwmoRpAcLV4bF2E5NyTRjflZX4fFhErewHV7DkAswr7T/e3vtJ2LC2/x8Hq1vYdzEKGF8eI8jgfPN4dQmLzd+IZouuFFXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOw5637H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOw5637H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741996045; x=1773532045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IkjML8DW0IFeS0uNXWmu1iTqXRvcAwn97KKZ+CHYjU=;
  b=nOw5637H0N2MPOP1HTiV4BWPVuu2CuRQ6+c+ivBnPk20rhNgDd7OyxhY
   XHAdRz2Fg6s4ABKFtYteCp3Axo5r5tS32fpPBGOsbj/9VwNOR5YUcd83Z
   1eSfqyIe3gKrPeyybzIaoyxvehhF2HroZgLeOJDuHVyCZd3YWABbQOBIV
   Kes7DhYJt6yxYDOK0nVk4b+f3wuxdZC84w7uRBtgwiwYYQkP7q5fWv1Td
   ux1dXc3L7ETsu+N8DiRc8GqMKwZTRTEcjRIE9E1perUSbJVEn/q6thxPv
   Wkbd/UnVUOl01FNeH8po5T62f7sd5E2kzJSLNQtmnMW209Gr+tqnWBZg5
   Q==;
X-CSE-ConnectionGUID: je7ynfO7TAeKemVwPlUHGQ==
X-CSE-MsgGUID: Lev9KEwlSna/1k0kqighkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43071300"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43071300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 16:47:25 -0700
X-CSE-ConnectionGUID: 7zhLoW1GRnCbVIOaxAyJSg==
X-CSE-MsgGUID: Ih63GzKpSuq5LUxa5KuRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="158566677"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2025 16:47:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttEkL-000AwB-2m;
	Fri, 14 Mar 2025 23:47:21 +0000
Date: Sat, 15 Mar 2025 07:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/crypto.c:160 bpf_crypto_ctx_create() warn: passing
 positive error code '(-2)' to 'PTR_ERR'
Message-ID: <202503150709.UHnhrifw-lkp@intel.com>
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
TO: Vadim Fedorenko <vadfed@meta.com>
CC: Martin KaFai Lau <martin.lau@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eaca8a09e55a30e8f2df8d13d4071f8f856b716
commit: 3e1c6f35409f9e447bf37f64840f5b65576bfb78 bpf: make common crypto API for TC/XDP programs
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150709.UHnhrifw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150709.UHnhrifw-lkp@intel.com/

smatch warnings:
kernel/bpf/crypto.c:160 bpf_crypto_ctx_create() warn: passing positive error code '(-2)' to 'PTR_ERR'

vim +160 kernel/bpf/crypto.c

3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  128  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  129  /**
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  130   * bpf_crypto_ctx_create() - Create a mutable BPF crypto context.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  131   *
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  132   * Allocates a crypto context that can be used, acquired, and released by
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  133   * a BPF program. The crypto context returned by this function must either
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  134   * be embedded in a map as a kptr, or freed with bpf_crypto_ctx_release().
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  135   * As crypto API functions use GFP_KERNEL allocations, this function can
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  136   * only be used in sleepable BPF programs.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  137   *
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  138   * bpf_crypto_ctx_create() allocates memory for crypto context.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  139   * It may return NULL if no memory is available.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  140   * @params:	pointer to struct bpf_crypto_params which contains all the
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  141   *		details needed to initialise crypto context.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  142   * @params__sz:	size of steuct bpf_crypto_params usef by bpf program
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  143   * @err:	integer to store error code when NULL is returned.
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  144   */
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  145  __bpf_kfunc struct bpf_crypto_ctx *
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  146  bpf_crypto_ctx_create(const struct bpf_crypto_params *params, u32 params__sz,
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  147  		      int *err)
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  148  {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  149  	const struct bpf_crypto_type *type;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  150  	struct bpf_crypto_ctx *ctx;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  151  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  152  	if (!params || params->reserved[0] || params->reserved[1] ||
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  153  	    params__sz != sizeof(struct bpf_crypto_params)) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  154  		*err = -EINVAL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  155  		return NULL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  156  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  157  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  158  	type = bpf_crypto_get_type(params->type);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  159  	if (IS_ERR(type)) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22 @160  		*err = PTR_ERR(type);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  161  		return NULL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  162  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  163  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  164  	if (!type->has_algo(params->algo)) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  165  		*err = -EOPNOTSUPP;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  166  		goto err_module_put;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  167  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  168  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  169  	if (!!params->authsize ^ !!type->setauthsize) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  170  		*err = -EOPNOTSUPP;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  171  		goto err_module_put;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  172  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  173  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  174  	if (!params->key_len || params->key_len > sizeof(params->key)) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  175  		*err = -EINVAL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  176  		goto err_module_put;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  177  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  178  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  179  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  180  	if (!ctx) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  181  		*err = -ENOMEM;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  182  		goto err_module_put;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  183  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  184  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  185  	ctx->type = type;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  186  	ctx->tfm = type->alloc_tfm(params->algo);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  187  	if (IS_ERR(ctx->tfm)) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  188  		*err = PTR_ERR(ctx->tfm);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  189  		goto err_free_ctx;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  190  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  191  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  192  	if (params->authsize) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  193  		*err = type->setauthsize(ctx->tfm, params->authsize);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  194  		if (*err)
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  195  			goto err_free_tfm;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  196  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  197  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  198  	*err = type->setkey(ctx->tfm, params->key, params->key_len);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  199  	if (*err)
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  200  		goto err_free_tfm;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  201  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  202  	if (type->get_flags(ctx->tfm) & CRYPTO_TFM_NEED_KEY) {
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  203  		*err = -EINVAL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  204  		goto err_free_tfm;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  205  	}
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  206  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  207  	ctx->siv_len = type->ivsize(ctx->tfm) + type->statesize(ctx->tfm);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  208  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  209  	refcount_set(&ctx->usage, 1);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  210  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  211  	return ctx;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  212  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  213  err_free_tfm:
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  214  	type->free_tfm(ctx->tfm);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  215  err_free_ctx:
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  216  	kfree(ctx);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  217  err_module_put:
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  218  	module_put(type->owner);
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  219  
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  220  	return NULL;
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  221  }
3e1c6f35409f9e4 Vadim Fedorenko 2024-04-22  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
