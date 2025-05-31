Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0C54652
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668718; cv=none; b=qExVRPqLPj4LurNJLfmpJWtdA+tKQGUwSaW28vpabUupIj5GpFeSyUtNd9GlrPCpL29afK0EDle3pbdrmrUibCC85T+JG145A4o4of9jYvDTVD0eq/BvlC4PlYXafAG4O0bvzycpeKkLMbRuTi+DkWebG3o4s01ZscX3fOYuuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668718; c=relaxed/simple;
	bh=OmgWrY45YBs1j0MxzuhdAuNO0dR+/qjEUqVUUtDp48M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0Y8t5DBAIhgnzDKOQ2TZy2tWAuQEecaU2ymsfdVf+N2q0lX8xt6NkN3gnT8occckWJDmhBXq1DTx4w197tx1lHwb59fVVdIbNED75hPrbVpzSrHZRzCLzOkSdH2FVO+sBseoJ8RV+0IyJo+4p/7zOmuMH/uWuOWVXF6gxMxK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YA3g1NxI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YA3g1NxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668716; x=1780204716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmgWrY45YBs1j0MxzuhdAuNO0dR+/qjEUqVUUtDp48M=;
  b=YA3g1NxITYWmPhL9Uh658rcm3feJbsB9H0M6K3Yx//25LZnvok9RsE3x
   /dbk3QkCNLNgjtkf9srb4HLgd8HZB1aHWwunL1D1UiQSHQ3Voz4u0K/r4
   +SXO5Nccdt4V4WTOGS8ea0PNJ+0fqnRJUgg0CUTKgcDsn+izE98agR4v3
   w0KWWHH6zI+gtwt3ezL24ubJss02X89VWR9JEvSxOFeudII0+ASZkC9tL
   2Cv6S6BQiasrYdvFF03Z/j/baYsLdA9Ej1Ny0Yir0+CcI2ke8lKgRsxmg
   b903wRAF7Ys3zdOmaRrMvryLxlN+bpmmhGkTdArlL/cGTnG4CahgASOSc
   w==;
X-CSE-ConnectionGUID: DdVCN32FTvKomwWJH+lnuw==
X-CSE-MsgGUID: x4uhQyoMRA2WIjRvfsL5iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50454767"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50454767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:18:36 -0700
X-CSE-ConnectionGUID: DzhTwRhzQtW1sU9oqYBdUw==
X-CSE-MsgGUID: ppY00UBITnqWb+vDNeZ/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="145033662"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 22:18:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLEc4-000YCm-0m;
	Sat, 31 May 2025 05:18:32 +0000
Date: Sat, 31 May 2025 13:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] crypto: drbg: Export CTR DRBG DF functions
Message-ID: <202505311325.22fIOcCt-lkp@intel.com>
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
In-Reply-To: <20250529113116.669667-4-h.jain@amd.com>
References: <20250529113116.669667-4-h.jain@amd.com>
TO: Harsh Jain <h.jain@amd.com>
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: linux-crypto@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: mounika.botcha@amd.com
TO: sarat.chand.savitala@amd.com
TO: mohan.dhanawade@amd.com
TO: michal.simek@amd.com
CC: Harsh Jain <h.jain@amd.com>

Hi Harsh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.15 next-20250530]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harsh-Jain/dt-bindings-crypto-Add-node-for-True-Random-Number-Generator/20250529-193255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250529113116.669667-4-h.jain%40amd.com
patch subject: [PATCH 3/3] crypto: drbg: Export CTR DRBG DF functions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311325.22fIOcCt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505311325.22fIOcCt-lkp@intel.com/

smatch warnings:
drivers/crypto/xilinx/xilinx-trng.c:368 xtrng_probe() warn: missing unwind goto?

vim +368 drivers/crypto/xilinx/xilinx-trng.c

940a39f34689c6 Harsh Jain 2025-05-29  333  
940a39f34689c6 Harsh Jain 2025-05-29  334  static int xtrng_probe(struct platform_device *pdev)
940a39f34689c6 Harsh Jain 2025-05-29  335  {
940a39f34689c6 Harsh Jain 2025-05-29  336  	struct xilinx_rng *rng;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  337  	size_t sb_size;
940a39f34689c6 Harsh Jain 2025-05-29  338  	int ret;
940a39f34689c6 Harsh Jain 2025-05-29  339  
940a39f34689c6 Harsh Jain 2025-05-29  340  	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
940a39f34689c6 Harsh Jain 2025-05-29  341  	if (!rng)
940a39f34689c6 Harsh Jain 2025-05-29  342  		return -ENOMEM;
940a39f34689c6 Harsh Jain 2025-05-29  343  
940a39f34689c6 Harsh Jain 2025-05-29  344  	rng->dev = &pdev->dev;
940a39f34689c6 Harsh Jain 2025-05-29  345  	rng->rng_base = devm_platform_ioremap_resource(pdev, 0);
940a39f34689c6 Harsh Jain 2025-05-29  346  	if (IS_ERR(rng->rng_base)) {
940a39f34689c6 Harsh Jain 2025-05-29  347  		dev_err(&pdev->dev, "Failed to map resource %ld\n", PTR_ERR(rng->rng_base));
940a39f34689c6 Harsh Jain 2025-05-29  348  		return PTR_ERR(rng->rng_base);
940a39f34689c6 Harsh Jain 2025-05-29  349  	}
940a39f34689c6 Harsh Jain 2025-05-29  350  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  351  	rng->tfm = crypto_alloc_cipher("aes", 0, 0);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  352  	if (IS_ERR(rng->tfm)) {
bf8ac5fe42abd6 Harsh Jain 2025-05-29  353  		pr_info("DRBG: could not allocate cipher TFM handle:\n");
bf8ac5fe42abd6 Harsh Jain 2025-05-29  354  		return PTR_ERR(rng->tfm);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  355  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  356  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  357  	sb_size = crypto_drbg_ctr_df_datalen(TRNG_SEED_LEN_BYTES, AES_BLOCK_SIZE);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  358  	rng->scratchpadbuf = devm_kzalloc(&pdev->dev, sb_size, GFP_KERNEL);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  359  	if (!rng->scratchpadbuf) {
bf8ac5fe42abd6 Harsh Jain 2025-05-29  360  		ret = -ENOMEM;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  361  		goto cipher_cleanup;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  362  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  363  
940a39f34689c6 Harsh Jain 2025-05-29  364  	xtrng_trng_reset(rng->rng_base);
940a39f34689c6 Harsh Jain 2025-05-29  365  	ret = xtrng_reseed_internal(rng);
940a39f34689c6 Harsh Jain 2025-05-29  366  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  367  		dev_err(&pdev->dev, "TRNG Seed fail\n");
940a39f34689c6 Harsh Jain 2025-05-29 @368  		return ret;
940a39f34689c6 Harsh Jain 2025-05-29  369  	}
940a39f34689c6 Harsh Jain 2025-05-29  370  
940a39f34689c6 Harsh Jain 2025-05-29  371  	xilinx_rng_dev = rng;
940a39f34689c6 Harsh Jain 2025-05-29  372  	mutex_init(&rng->lock);
940a39f34689c6 Harsh Jain 2025-05-29  373  	ret = crypto_register_rng(&xtrng_trng_alg);
940a39f34689c6 Harsh Jain 2025-05-29  374  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  375  		dev_err(&pdev->dev, "Crypto Random device registration failed: %d\n", ret);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  376  		goto cipher_cleanup;
940a39f34689c6 Harsh Jain 2025-05-29  377  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  378  
940a39f34689c6 Harsh Jain 2025-05-29  379  	ret = xtrng_hwrng_register(&rng->trng);
940a39f34689c6 Harsh Jain 2025-05-29  380  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  381  		dev_err(&pdev->dev, "HWRNG device registration failed: %d\n", ret);
940a39f34689c6 Harsh Jain 2025-05-29  382  		goto crypto_rng_free;
940a39f34689c6 Harsh Jain 2025-05-29  383  	}
940a39f34689c6 Harsh Jain 2025-05-29  384  	platform_set_drvdata(pdev, rng);
940a39f34689c6 Harsh Jain 2025-05-29  385  
940a39f34689c6 Harsh Jain 2025-05-29  386  	return 0;
940a39f34689c6 Harsh Jain 2025-05-29  387  
940a39f34689c6 Harsh Jain 2025-05-29  388  crypto_rng_free:
940a39f34689c6 Harsh Jain 2025-05-29  389  	crypto_unregister_rng(&xtrng_trng_alg);
940a39f34689c6 Harsh Jain 2025-05-29  390  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  391  cipher_cleanup:
bf8ac5fe42abd6 Harsh Jain 2025-05-29  392  	crypto_free_cipher(rng->tfm);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  393  
940a39f34689c6 Harsh Jain 2025-05-29  394  	return ret;
940a39f34689c6 Harsh Jain 2025-05-29  395  }
940a39f34689c6 Harsh Jain 2025-05-29  396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
