Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCD156872
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717651; cv=none; b=oqKV0LpJOX187yHHPmVj0TdeF91PYLn/rx8+9k/d+imfJd+NSOG21+7Tp4w7d8twDgJUqfDLlS+Rhx42pytK5rBBAZwOEaYHFYJykkr/qrnNCHDOsYODEO6r98Ng09Ag/1D5ggzkqvvPZGnvsgbCumRsUqSlvMQKO9x7ArrgNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717651; c=relaxed/simple;
	bh=wbPduD6OZ9A3+d4Azg/LcNCtK4LKkvuDAkGFaQGmCKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KhVh9aoYCbBYlmUKQPyjJ2Nnr5JNFTA8UzZKamNNkbBrKs4cG0pVEU6nye3WRYO1uRnU7ovrICu+TSFs0++TbQQHlve6qhkuPtZJyYMDTfX37q9aSY8mkuqLCfToT15P15jhCwTjqibdTl0/5iwnHZCGYAEtG3g9J/SnzM7sr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPY77PJt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPY77PJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717650; x=1765253650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbPduD6OZ9A3+d4Azg/LcNCtK4LKkvuDAkGFaQGmCKo=;
  b=XPY77PJtSNuhkRLKiKEuO8GOeTnHX34mtBoTbASFuHkZN+d90qd80St0
   9g9XQZqTdXV7tTKY1xW0hSPvIOJBzRSqHakYa+XWsR1p24T0FJCUYHZDa
   BlMONTdyfKCucWriS/+1FkYvoovY5kWC1eKEhE0o8o08puc8jy40dRgQU
   ZruGVn6yz9naK5rv9p6WIc9o82di7WIAeV8Y3HJBrdIrSiFKgWLQdW1Bm
   ptcFGX/kz2WS6JCPeDzF2FRKzq/Xp3z9fzjvuLI5jxCASY8bwqo7xZR9b
   kAR9P1wnflK5B32UAuan9LP+oqP8H2GnCo+YEGTxPQQK3aWnE+7y7N4sC
   w==;
X-CSE-ConnectionGUID: OI7sHPgASCKRIKggJieqlQ==
X-CSE-MsgGUID: DuPk4b1WQbayBGxelUeq9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34122103"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34122103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:14:10 -0800
X-CSE-ConnectionGUID: to9qeBlVSxOE+zqM6FjP+A==
X-CSE-MsgGUID: +tpWAdeQTwK5J37m31BO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99401330"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:14:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV9q-0003of-04;
	Mon, 09 Dec 2024 04:14:06 +0000
Date: Mon, 9 Dec 2024 12:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/tegra/tegra-se-aes.c:1596 tegra_cmac_do_one_req()
 error: uninitialized symbol 'ret'.
Message-ID: <202412071747.flPux4oB-lkp@intel.com>
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
TO: Akhil R <akhilrajeev@nvidia.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 0880bb3b00c855fc244b7177ffdaafef4d0aa1e0 crypto: tegra - Add Tegra Security Engine driver
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: nios2-randconfig-r073-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071747.flPux4oB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071747.flPux4oB-lkp@intel.com/

smatch warnings:
drivers/crypto/tegra/tegra-se-aes.c:1596 tegra_cmac_do_one_req() error: uninitialized symbol 'ret'.

vim +/ret +1596 drivers/crypto/tegra/tegra-se-aes.c

0880bb3b00c855f Akhil R 2024-04-03  1576  
0880bb3b00c855f Akhil R 2024-04-03  1577  static int tegra_cmac_do_one_req(struct crypto_engine *engine, void *areq)
0880bb3b00c855f Akhil R 2024-04-03  1578  {
0880bb3b00c855f Akhil R 2024-04-03  1579  	struct ahash_request *req = ahash_request_cast(areq);
0880bb3b00c855f Akhil R 2024-04-03  1580  	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
0880bb3b00c855f Akhil R 2024-04-03  1581  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
0880bb3b00c855f Akhil R 2024-04-03  1582  	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
0880bb3b00c855f Akhil R 2024-04-03  1583  	struct tegra_se *se = ctx->se;
0880bb3b00c855f Akhil R 2024-04-03  1584  	int ret;
0880bb3b00c855f Akhil R 2024-04-03  1585  
0880bb3b00c855f Akhil R 2024-04-03  1586  	if (rctx->task & SHA_UPDATE) {
0880bb3b00c855f Akhil R 2024-04-03  1587  		ret = tegra_cmac_do_update(req);
0880bb3b00c855f Akhil R 2024-04-03  1588  		rctx->task &= ~SHA_UPDATE;
0880bb3b00c855f Akhil R 2024-04-03  1589  	}
0880bb3b00c855f Akhil R 2024-04-03  1590  
0880bb3b00c855f Akhil R 2024-04-03  1591  	if (rctx->task & SHA_FINAL) {
0880bb3b00c855f Akhil R 2024-04-03  1592  		ret = tegra_cmac_do_final(req);
0880bb3b00c855f Akhil R 2024-04-03  1593  		rctx->task &= ~SHA_FINAL;
0880bb3b00c855f Akhil R 2024-04-03  1594  	}
0880bb3b00c855f Akhil R 2024-04-03  1595  
0880bb3b00c855f Akhil R 2024-04-03 @1596  	crypto_finalize_hash_request(se->engine, req, ret);
0880bb3b00c855f Akhil R 2024-04-03  1597  
0880bb3b00c855f Akhil R 2024-04-03  1598  	return 0;
0880bb3b00c855f Akhil R 2024-04-03  1599  }
0880bb3b00c855f Akhil R 2024-04-03  1600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
