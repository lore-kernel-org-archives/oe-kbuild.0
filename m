Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE5944E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742177891; cv=none; b=iPdBYPwlcx/l+Fns0JXpwDQ8L5nGpXUHnaV/2EHrsvJQwgNABSzCeS7Ho/VFu7YCtzmyH5DcbGvQgL/nwvbBxJlJVUnuAiibXd7JY1V4mMdJcXrKKVNGrsbIatzigfWuMFrAqpo0SP+sdnR7sJYv5XFZwQCLyoOPSZkkG7dvOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742177891; c=relaxed/simple;
	bh=6yywcN9emV7pP6stUmCNi/2btA5cUHNq7ZH+iuSf3VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TPOYHCPkIeZti1B595YTohWv3nJ06fjJpE5lsWk7kTWyXGdCdiE2k6L3Ipf0QVdQR8VmOAZ/QjtCZ+HbuihfhlCaFxEN3FJjswQq2dpgRFotz/E4Sia0lrknmsouFL732GL18gGuze7uTVsTHSRpkdxwteL357Ebs96XiJ4IRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lz4TKwZo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz4TKwZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742177889; x=1773713889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yywcN9emV7pP6stUmCNi/2btA5cUHNq7ZH+iuSf3VA=;
  b=Lz4TKwZoaOaQKd/PnurDjkgAzWRxSM6aqXRRVWySCQMGTnbiFQaJ9LNz
   cLtP1+VqmjoyAJteGn6XEvyKGBPki0yDIbkSk1fS4Gq+WeQc3cSBHSHyc
   IRV0YA8Wo1fJonZc9/ryyytKzPg0KwcS6EZFUzPokUT11cE6zMjvILTZh
   Gen2daW8YiM4gCGVkQEckI8b5854UjuelaWlQqOFJ+Qj6QDIaGB3Bpa/C
   0qR1gRLNJ5Ni3/86XQmJ8Dtmp/IHBQEWsKI4z2racSVzA4HMo+W+RhLUJ
   xuCQJv7iQidZaOX3lWLeNIwRUwylOaW5YGg8AgAOlZ4enMBBL1xxwTGWR
   g==;
X-CSE-ConnectionGUID: NrK5IuqbTgK8g8ixJTBybg==
X-CSE-MsgGUID: 0JvzUoQ6ROSAy9ocukj5xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="47156574"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="47156574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 19:18:08 -0700
X-CSE-ConnectionGUID: 930/a7kKQZGv16z4LK5xKg==
X-CSE-MsgGUID: GXxcwaDuTy2CG/FLdFU/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="126664845"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2025 19:18:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu03I-000CNT-1f;
	Mon, 17 Mar 2025 02:18:04 +0000
Date: Mon, 17 Mar 2025 10:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/crypto.c:160 bpf_crypto_ctx_create() warn: passing
 positive error code '(-2)' to 'PTR_ERR'
Message-ID: <202503171022.0ppeu0Qt-lkp@intel.com>
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
head:   4701f33a10702d5fc577c32434eb62adde0a1ae1
commit: 3e1c6f35409f9e447bf37f64840f5b65576bfb78 bpf: make common crypto API for TC/XDP programs
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250317/202503171022.0ppeu0Qt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503171022.0ppeu0Qt-lkp@intel.com/

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
