Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66721DE885
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109682; cv=none; b=MaiZCoto3BVDhCztr1Ub7yQIdKn9hBZsziOVE0/f2YXdtOYd9xUCxD6bkFSuBBnwou0OdXfYlZEg+davCSpfDrsj8dzqiwiA5MCOvBnS0h+mRtPrNUSFq21NuiVaipgrmK1JBoaLPmv5KXYGAkVjzeCt27a5K5tmEvud2nlEZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109682; c=relaxed/simple;
	bh=/xflU8uwHaNqXDXt8GEQj7ckqm3zluVm9JBOXVThjSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gD/wePW1dLN+VfVKBaqxhlTvgqyoo80iHCPw+4MVHLMwALH3H38+HYquxJ8//Bpu3I9t7SdtXm6Ns+Li9NazalQhd+wG2eIWt7sLLfRPuqk3fExwKnCXqkd8szaFmsnFWt5faYYyQNzKkGb14byeYfirwrPG6JOTMbIPDIoSPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3/9HVsS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3/9HVsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770109680; x=1801645680;
  h=date:from:to:cc:subject:message-id;
  bh=/xflU8uwHaNqXDXt8GEQj7ckqm3zluVm9JBOXVThjSM=;
  b=k3/9HVsSv6vhom1k1EIsEUfveTTX8ndVLgSPSb3Xb/IDbMUIH4IrU6JA
   ez+y7weknM5ag4XG2f0hRn7+VNIc0LPyIB8UKSWJEnyB3RgndDRiVYF7a
   2ckweDX0YSttrnYF0IizvF6uv9bsuxZO+nagpnsW2EGy25zFpgU2VIg1O
   HsxNNyKbY3Xdo9WTkrN5jK5mRKi0YWIzs7csBinoC+u9lohaMUwvf7Myh
   Kus6mJnk4aWZ2sm9YrZQu5gKGdSsJ9wOIgslP4GofcQdPwICz4Y3UjjiL
   NhX8tBqHR2b2Hb4EFM3GZ6OJwUe97ygMtLUwTfJie1BXQUPBL5WL7+ig9
   w==;
X-CSE-ConnectionGUID: pTC7jhj2SaerjS5RSpgo4g==
X-CSE-MsgGUID: x1gmezQhRDGUGBi6t1cG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81591549"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="81591549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:07:59 -0800
X-CSE-ConnectionGUID: 2XPnf4zHST2/fYkQ0YJOqg==
X-CSE-MsgGUID: LyaIvno/R0C1v7z/UmGpdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209081554"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 01:07:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCO3-00000000gU2-0rg1;
	Tue, 03 Feb 2026 09:07:55 +0000
Date: Tue, 03 Feb 2026 17:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/s390/crypto/phmac_s390.c:318:17-18: WARNING: Unsigned
 expression compared with zero: k > 0
Message-ID: <202602031756.k2FJhKuR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Harald Freudenberger <freude@linux.ibm.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Holger Dengler <dengler@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
commit: cbbc675506cc4cd93e6f895e7c1f693156f9a95c crypto: s390 - New s390 specific protected key hash phmac
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-r054-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031756.k2FJhKuR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602031756.k2FJhKuR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/crypto/phmac_s390.c:318:17-18: WARNING: Unsigned expression compared with zero: k > 0
   arch/s390/crypto/phmac_s390.c:355:14-15: WARNING: Unsigned expression compared with zero: k > 0
   arch/s390/crypto/phmac_s390.c:416:15-16: WARNING: Unsigned expression compared with zero: k > 0

vim +318 arch/s390/crypto/phmac_s390.c

cbbc675506cc4c Harald Freudenberger 2025-06-17  284  
cbbc675506cc4c Harald Freudenberger 2025-06-17  285  static int phmac_kmac_update(struct ahash_request *req, bool maysleep)
cbbc675506cc4c Harald Freudenberger 2025-06-17  286  {
cbbc675506cc4c Harald Freudenberger 2025-06-17  287  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
cbbc675506cc4c Harald Freudenberger 2025-06-17  288  	struct phmac_tfm_ctx *tfm_ctx = crypto_ahash_ctx(tfm);
cbbc675506cc4c Harald Freudenberger 2025-06-17  289  	struct phmac_req_ctx *req_ctx = ahash_request_ctx(req);
cbbc675506cc4c Harald Freudenberger 2025-06-17  290  	struct kmac_sha2_ctx *ctx = &req_ctx->kmac_ctx;
cbbc675506cc4c Harald Freudenberger 2025-06-17  291  	struct hash_walk_helper *hwh = &req_ctx->hwh;
cbbc675506cc4c Harald Freudenberger 2025-06-17  292  	unsigned int bs = crypto_ahash_blocksize(tfm);
cbbc675506cc4c Harald Freudenberger 2025-06-17  293  	unsigned int offset, k, n;
cbbc675506cc4c Harald Freudenberger 2025-06-17  294  	int rc = 0;
cbbc675506cc4c Harald Freudenberger 2025-06-17  295  
cbbc675506cc4c Harald Freudenberger 2025-06-17  296  	/*
cbbc675506cc4c Harald Freudenberger 2025-06-17  297  	 * The walk is always mapped when this function is called.
cbbc675506cc4c Harald Freudenberger 2025-06-17  298  	 * Note that in case of partial processing or failure the walk
cbbc675506cc4c Harald Freudenberger 2025-06-17  299  	 * is NOT unmapped here. So a follow up task may reuse the walk
cbbc675506cc4c Harald Freudenberger 2025-06-17  300  	 * or in case of unrecoverable failure needs to unmap it.
cbbc675506cc4c Harald Freudenberger 2025-06-17  301  	 */
cbbc675506cc4c Harald Freudenberger 2025-06-17  302  
cbbc675506cc4c Harald Freudenberger 2025-06-17  303  	while (hwh->walkbytes > 0) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  304  		/* check sha2 context buffer */
cbbc675506cc4c Harald Freudenberger 2025-06-17  305  		offset = ctx->buflen[0] % bs;
cbbc675506cc4c Harald Freudenberger 2025-06-17  306  		if (offset + hwh->walkbytes < bs)
cbbc675506cc4c Harald Freudenberger 2025-06-17  307  			goto store;
cbbc675506cc4c Harald Freudenberger 2025-06-17  308  
cbbc675506cc4c Harald Freudenberger 2025-06-17  309  		if (offset) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  310  			/* fill ctx buffer up to blocksize and process this block */
cbbc675506cc4c Harald Freudenberger 2025-06-17  311  			n = bs - offset;
cbbc675506cc4c Harald Freudenberger 2025-06-17  312  			memcpy(ctx->buf + offset, hwh->walkaddr, n);
cbbc675506cc4c Harald Freudenberger 2025-06-17  313  			ctx->gr0.iimp = 1;
cbbc675506cc4c Harald Freudenberger 2025-06-17  314  			for (;;) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  315  				k = _cpacf_kmac(&ctx->gr0.reg, ctx->param, ctx->buf, bs);
cbbc675506cc4c Harald Freudenberger 2025-06-17  316  				if (likely(k == bs))
cbbc675506cc4c Harald Freudenberger 2025-06-17  317  					break;
cbbc675506cc4c Harald Freudenberger 2025-06-17 @318  				if (unlikely(k > 0)) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  319  					/*
cbbc675506cc4c Harald Freudenberger 2025-06-17  320  					 * Can't deal with hunks smaller than blocksize.
cbbc675506cc4c Harald Freudenberger 2025-06-17  321  					 * And kmac should always return the nr of
cbbc675506cc4c Harald Freudenberger 2025-06-17  322  					 * processed bytes as 0 or a multiple of the
cbbc675506cc4c Harald Freudenberger 2025-06-17  323  					 * blocksize.
cbbc675506cc4c Harald Freudenberger 2025-06-17  324  					 */
cbbc675506cc4c Harald Freudenberger 2025-06-17  325  					rc = -EIO;
cbbc675506cc4c Harald Freudenberger 2025-06-17  326  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  327  				}
cbbc675506cc4c Harald Freudenberger 2025-06-17  328  				/* protected key is invalid and needs re-conversion */
cbbc675506cc4c Harald Freudenberger 2025-06-17  329  				if (!maysleep) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  330  					rc = -EKEYEXPIRED;
cbbc675506cc4c Harald Freudenberger 2025-06-17  331  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  332  				}
cbbc675506cc4c Harald Freudenberger 2025-06-17  333  				rc = phmac_convert_key(tfm_ctx);
cbbc675506cc4c Harald Freudenberger 2025-06-17  334  				if (rc)
cbbc675506cc4c Harald Freudenberger 2025-06-17  335  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  336  				spin_lock_bh(&tfm_ctx->pk_lock);
cbbc675506cc4c Harald Freudenberger 2025-06-17  337  				memcpy(ctx->param + SHA2_KEY_OFFSET(bs),
cbbc675506cc4c Harald Freudenberger 2025-06-17  338  				       tfm_ctx->pk.protkey, tfm_ctx->pk.len);
cbbc675506cc4c Harald Freudenberger 2025-06-17  339  				spin_unlock_bh(&tfm_ctx->pk_lock);
cbbc675506cc4c Harald Freudenberger 2025-06-17  340  			}
cbbc675506cc4c Harald Freudenberger 2025-06-17  341  			ctx->buflen[0] += n;
cbbc675506cc4c Harald Freudenberger 2025-06-17  342  			if (ctx->buflen[0] < n)
cbbc675506cc4c Harald Freudenberger 2025-06-17  343  				ctx->buflen[1]++;
cbbc675506cc4c Harald Freudenberger 2025-06-17  344  			rc = hwh_advance(hwh, n);
cbbc675506cc4c Harald Freudenberger 2025-06-17  345  			if (unlikely(rc))
cbbc675506cc4c Harald Freudenberger 2025-06-17  346  				goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  347  			offset = 0;
cbbc675506cc4c Harald Freudenberger 2025-06-17  348  		}
cbbc675506cc4c Harald Freudenberger 2025-06-17  349  
cbbc675506cc4c Harald Freudenberger 2025-06-17  350  		/* process as many blocks as possible from the walk */
cbbc675506cc4c Harald Freudenberger 2025-06-17  351  		while (hwh->walkbytes >= bs) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  352  			n = (hwh->walkbytes / bs) * bs;
cbbc675506cc4c Harald Freudenberger 2025-06-17  353  			ctx->gr0.iimp = 1;
cbbc675506cc4c Harald Freudenberger 2025-06-17  354  			k = _cpacf_kmac(&ctx->gr0.reg, ctx->param, hwh->walkaddr, n);
cbbc675506cc4c Harald Freudenberger 2025-06-17  355  			if (likely(k > 0)) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  356  				ctx->buflen[0] += k;
cbbc675506cc4c Harald Freudenberger 2025-06-17  357  				if (ctx->buflen[0] < k)
cbbc675506cc4c Harald Freudenberger 2025-06-17  358  					ctx->buflen[1]++;
cbbc675506cc4c Harald Freudenberger 2025-06-17  359  				rc = hwh_advance(hwh, k);
cbbc675506cc4c Harald Freudenberger 2025-06-17  360  				if (unlikely(rc))
cbbc675506cc4c Harald Freudenberger 2025-06-17  361  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  362  			}
cbbc675506cc4c Harald Freudenberger 2025-06-17  363  			if (unlikely(k < n)) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  364  				/* protected key is invalid and needs re-conversion */
cbbc675506cc4c Harald Freudenberger 2025-06-17  365  				if (!maysleep) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  366  					rc = -EKEYEXPIRED;
cbbc675506cc4c Harald Freudenberger 2025-06-17  367  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  368  				}
cbbc675506cc4c Harald Freudenberger 2025-06-17  369  				rc = phmac_convert_key(tfm_ctx);
cbbc675506cc4c Harald Freudenberger 2025-06-17  370  				if (rc)
cbbc675506cc4c Harald Freudenberger 2025-06-17  371  					goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  372  				spin_lock_bh(&tfm_ctx->pk_lock);
cbbc675506cc4c Harald Freudenberger 2025-06-17  373  				memcpy(ctx->param + SHA2_KEY_OFFSET(bs),
cbbc675506cc4c Harald Freudenberger 2025-06-17  374  				       tfm_ctx->pk.protkey, tfm_ctx->pk.len);
cbbc675506cc4c Harald Freudenberger 2025-06-17  375  				spin_unlock_bh(&tfm_ctx->pk_lock);
cbbc675506cc4c Harald Freudenberger 2025-06-17  376  			}
cbbc675506cc4c Harald Freudenberger 2025-06-17  377  		}
cbbc675506cc4c Harald Freudenberger 2025-06-17  378  
cbbc675506cc4c Harald Freudenberger 2025-06-17  379  store:
cbbc675506cc4c Harald Freudenberger 2025-06-17  380  		/* store incomplete block in context buffer */
cbbc675506cc4c Harald Freudenberger 2025-06-17  381  		if (hwh->walkbytes) {
cbbc675506cc4c Harald Freudenberger 2025-06-17  382  			memcpy(ctx->buf + offset, hwh->walkaddr, hwh->walkbytes);
cbbc675506cc4c Harald Freudenberger 2025-06-17  383  			ctx->buflen[0] += hwh->walkbytes;
cbbc675506cc4c Harald Freudenberger 2025-06-17  384  			if (ctx->buflen[0] < hwh->walkbytes)
cbbc675506cc4c Harald Freudenberger 2025-06-17  385  				ctx->buflen[1]++;
cbbc675506cc4c Harald Freudenberger 2025-06-17  386  			rc = hwh_advance(hwh, hwh->walkbytes);
cbbc675506cc4c Harald Freudenberger 2025-06-17  387  			if (unlikely(rc))
cbbc675506cc4c Harald Freudenberger 2025-06-17  388  				goto out;
cbbc675506cc4c Harald Freudenberger 2025-06-17  389  		}
cbbc675506cc4c Harald Freudenberger 2025-06-17  390  
cbbc675506cc4c Harald Freudenberger 2025-06-17  391  	} /* end of while (hwh->walkbytes > 0) */
cbbc675506cc4c Harald Freudenberger 2025-06-17  392  
cbbc675506cc4c Harald Freudenberger 2025-06-17  393  out:
cbbc675506cc4c Harald Freudenberger 2025-06-17  394  	pr_debug("rc=%d\n", rc);
cbbc675506cc4c Harald Freudenberger 2025-06-17  395  	return rc;
cbbc675506cc4c Harald Freudenberger 2025-06-17  396  }
cbbc675506cc4c Harald Freudenberger 2025-06-17  397  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
