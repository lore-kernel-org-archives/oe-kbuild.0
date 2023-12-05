Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54A6E2CB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCDlUFZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701814797; x=1733350797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WN7jOqsOTMbjPCF+Lnwbu3Neb6/sRqthzrOVjD7CF5Q=;
  b=eCDlUFZAw6KChYbAgNqyl0Pqto7TcA5c3l55JhZWs1G0jnNoIue4Yk0o
   h+flTusHxhwleneuByHYQjcE0FKSTAx4JaHA8RWc0VRflACAXO6SJCsO6
   XGDPHww6jX4w+yb3EPCd+YTgmCMvVydwMTLOycpaY/m9eyowj0Cx+lN7M
   jNe+3LF7yT+921BmjWa5apOwLfYXK+bT6otFzic8YcCR9S+z7Z3J4CkBS
   r4coR/c0MCvInIKKxW0pOrw4nyXYtURO3ynGVz8sOQYdb8YMiYLh9o9fT
   8/aE3mc3++yCwYzdcHWWF2voKTq+PiAsKSLuGp6aYc6S5gvuhxet8yAyq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458286751"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="458286751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720867251"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="720867251"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 14:19:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdlh-0009no-09;
	Tue, 05 Dec 2023 22:19:53 +0000
Date: Wed, 6 Dec 2023 06:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next v7 1/3] bpf: make common crypto API for TC/XDP
 programs
Message-ID: <202312060647.2JfAE3rk-lkp@intel.com>
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
In-Reply-To: <20231202010604.1877561-1-vadfed@meta.com>
References: <20231202010604.1877561-1-vadfed@meta.com>
TO: Vadim Fedorenko <vadfed@meta.com>
TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Martin KaFai Lau <martin.lau@linux.dev>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Mykola Lysenko <mykolal@fb.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
CC: netdev@vger.kernel.org
CC: linux-crypto@vger.kernel.org
CC: bpf@vger.kernel.org

Hi Vadim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/bpf-crypto-add-skcipher-to-bpf-crypto/20231202-091254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231202010604.1877561-1-vadfed%40meta.com
patch subject: [PATCH bpf-next v7 1/3] bpf: make common crypto API for TC/XDP programs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060647.2JfAE3rk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060647.2JfAE3rk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060647.2JfAE3rk-lkp@intel.com/

smatch warnings:
kernel/bpf/crypto.c:192 bpf_crypto_ctx_create() error: we previously assumed 'ctx' could be null (see line 165)
kernel/bpf/crypto.c:192 bpf_crypto_ctx_create() error: potentially dereferencing uninitialized 'ctx'.

vim +/ctx +192 kernel/bpf/crypto.c

0c47cb96ac404e Vadim Fedorenko 2023-12-01  105  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  106  /**
0c47cb96ac404e Vadim Fedorenko 2023-12-01  107   * bpf_crypto_ctx_create() - Create a mutable BPF crypto context.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  108   *
0c47cb96ac404e Vadim Fedorenko 2023-12-01  109   * Allocates a crypto context that can be used, acquired, and released by
0c47cb96ac404e Vadim Fedorenko 2023-12-01  110   * a BPF program. The crypto context returned by this function must either
0c47cb96ac404e Vadim Fedorenko 2023-12-01  111   * be embedded in a map as a kptr, or freed with bpf_crypto_ctx_release().
0c47cb96ac404e Vadim Fedorenko 2023-12-01  112   * As crypto API functions use GFP_KERNEL allocations, this function can
0c47cb96ac404e Vadim Fedorenko 2023-12-01  113   * only be used in sleepable BPF programs.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  114   *
0c47cb96ac404e Vadim Fedorenko 2023-12-01  115   * bpf_crypto_ctx_create() allocates memory for crypto context.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  116   * It may return NULL if no memory is available.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  117   * @type__str: pointer to string representation of crypto type.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  118   * @algo__str: pointer to string representation of algorithm.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  119   * @pkey:      bpf_dynptr which holds cipher key to do crypto.
0c47cb96ac404e Vadim Fedorenko 2023-12-01  120   * @err:       integer to store error code when NULL is returned
0c47cb96ac404e Vadim Fedorenko 2023-12-01  121   */
0c47cb96ac404e Vadim Fedorenko 2023-12-01  122  __bpf_kfunc struct bpf_crypto_ctx *
0c47cb96ac404e Vadim Fedorenko 2023-12-01  123  bpf_crypto_ctx_create(const char *type__str, const char *algo__str,
0c47cb96ac404e Vadim Fedorenko 2023-12-01  124  		      const struct bpf_dynptr_kern *pkey,
0c47cb96ac404e Vadim Fedorenko 2023-12-01  125  		      unsigned int authsize, int *err)
0c47cb96ac404e Vadim Fedorenko 2023-12-01  126  {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  127  	const struct bpf_crypto_type *type = bpf_crypto_get_type(type__str);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  128  	struct bpf_crypto_ctx *ctx;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  129  	const u8 *key;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  130  	u32 key_len;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  131  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  132  	type = bpf_crypto_get_type(type__str);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  133  	if (IS_ERR(type)) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  134  		*err = PTR_ERR(type);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  135  		return NULL;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  136  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  137  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  138  	if (!type->has_algo(algo__str)) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  139  		*err = -EOPNOTSUPP;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  140  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  141  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  142  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  143  	if (!authsize && type->setauthsize) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  144  		*err = -EOPNOTSUPP;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  145  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  146  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  147  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  148  	if (authsize && !type->setauthsize) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  149  		*err = -EOPNOTSUPP;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  150  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  151  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  152  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  153  	key_len = __bpf_dynptr_size(pkey);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  154  	if (!key_len) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  155  		*err = -EINVAL;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  156  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  157  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  158  	key = __bpf_dynptr_data(pkey, key_len);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  159  	if (!key) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  160  		*err = -EINVAL;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  161  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  162  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  163  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  164  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
0c47cb96ac404e Vadim Fedorenko 2023-12-01 @165  	if (!ctx) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  166  		*err = -ENOMEM;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  167  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  168  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  169  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  170  	ctx->type = type;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  171  	ctx->tfm = type->alloc_tfm(algo__str);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  172  	if (IS_ERR(ctx->tfm)) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  173  		*err = PTR_ERR(ctx->tfm);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  174  		ctx->tfm = NULL;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  175  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  176  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  177  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  178  	if (authsize) {
0c47cb96ac404e Vadim Fedorenko 2023-12-01  179  		*err = type->setauthsize(ctx->tfm, authsize);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  180  		if (*err)
0c47cb96ac404e Vadim Fedorenko 2023-12-01  181  			goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  182  	}
0c47cb96ac404e Vadim Fedorenko 2023-12-01  183  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  184  	*err = type->setkey(ctx->tfm, key, key_len);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  185  	if (*err)
0c47cb96ac404e Vadim Fedorenko 2023-12-01  186  		goto err;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  187  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  188  	refcount_set(&ctx->usage, 1);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  189  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  190  	return ctx;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  191  err:
0c47cb96ac404e Vadim Fedorenko 2023-12-01 @192  	if (ctx->tfm)
0c47cb96ac404e Vadim Fedorenko 2023-12-01  193  		type->free_tfm(ctx->tfm);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  194  	kfree(ctx);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  195  	module_put(type->owner);
0c47cb96ac404e Vadim Fedorenko 2023-12-01  196  
0c47cb96ac404e Vadim Fedorenko 2023-12-01  197  	return NULL;
0c47cb96ac404e Vadim Fedorenko 2023-12-01  198  }
0c47cb96ac404e Vadim Fedorenko 2023-12-01  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
