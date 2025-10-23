Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6250E224AEB
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194271; cv=none; b=IpfI3m0/60yNeSueDOc7fEhGqOYlXV2Z+r2AE251Wh4mqyRsvUILA04ywNBQ+aTvLRd0VIsyxq6eEZoFEVoN8LwKBk5qCEH1E84kyVkaLe4ACN4Q+s6I4vCVHhcO/tKH0C71xXq33dORHtD3LDiBIIKis0N3FIlXd/1WEbEgOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194271; c=relaxed/simple;
	bh=iemEM8RKh3yytGnb6pmSodzD9uomrOlhYOFFL5p6Oyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xeu+x2KEjhV4INN6UtL1ricY6RyMCvMhFj8l6eU5snvA5iJlTjj9ufpXdh3muVdhxPkOroyJzSK+wcEZw0K4BckJv0N8XbU6gPghR24FZzBdn6rjKf4SVxXBaI0oO6zvnJiBOUw1Wy/Fxj6+Mlux3cu5EMDcnS9FJp2RQZsIC2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=figQjFeb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="figQjFeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761194269; x=1792730269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iemEM8RKh3yytGnb6pmSodzD9uomrOlhYOFFL5p6Oyk=;
  b=figQjFeb1iohR9lnGXbMforuMU45dLPUWmQ9r9nRwAcBFkOzjRE/amVw
   9VK6uQGFWjUTDtISU/jufUwLEbfyviBWf6F6hof+yJ4qD55poJODPFRQL
   8U8MyNTU7z2Qa60ft13CspFkWgV5gDHufBguDzoycSDmn4WntdfLc1okM
   PfIDoS5YY4QJq+EHDSV5QqPdcPcaV2hAaLg5Bg6KQXU/EcXrNIVIfQsVH
   ThT5dgGQEzqLyH0OqxyFwwH/IaNMtFKf9oE+XuqPWV4hM/SM8cw+1HqZf
   s9EIhdPff2GVQ9POS1aRKQSNQs42fLW2q1hthhhgVK/Ne5lzq1RTmNKuP
   g==;
X-CSE-ConnectionGUID: P+zwOpOITD+LyLz2lnegkQ==
X-CSE-MsgGUID: sRZUwLAETymrfUMfEhQxtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80790834"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="80790834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:37:49 -0700
X-CSE-ConnectionGUID: mJJp7i9zTjOVEKFCsrycEg==
X-CSE-MsgGUID: tXrQI/uIRAaPc/WYAtpsTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188100888"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2025 21:37:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBn4z-000D27-1B;
	Thu, 23 Oct 2025 04:37:39 +0000
Date: Thu, 23 Oct 2025 12:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/xilinx/xilinx-trng.c:336:54-61: WARNING: Consider
 using %pe to print PTR_ERR()
Message-ID: <202510231229.Z6TduqZy-lkp@intel.com>
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
TO: Harsh Jain <h.jain@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Mounika Botcha <mounika.botcha@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43e9ad0c55a369ecc84a4788d06a8a6bfa634f1c
commit: 8979744aca8096ee5072798dfc1181606919b35d crypto: xilinx - Add TRNG driver for Versal
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: powerpc64-randconfig-r064-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231229.Z6TduqZy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510231229.Z6TduqZy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/xilinx/xilinx-trng.c:336:54-61: WARNING: Consider using %pe to print PTR_ERR()

vim +336 drivers/crypto/xilinx/xilinx-trng.c

8979744aca8096 Harsh Jain 2025-08-25  323  
8979744aca8096 Harsh Jain 2025-08-25  324  static int xtrng_probe(struct platform_device *pdev)
8979744aca8096 Harsh Jain 2025-08-25  325  {
8979744aca8096 Harsh Jain 2025-08-25  326  	struct xilinx_rng *rng;
8979744aca8096 Harsh Jain 2025-08-25  327  	int ret;
8979744aca8096 Harsh Jain 2025-08-25  328  
8979744aca8096 Harsh Jain 2025-08-25  329  	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
8979744aca8096 Harsh Jain 2025-08-25  330  	if (!rng)
8979744aca8096 Harsh Jain 2025-08-25  331  		return -ENOMEM;
8979744aca8096 Harsh Jain 2025-08-25  332  
8979744aca8096 Harsh Jain 2025-08-25  333  	rng->dev = &pdev->dev;
8979744aca8096 Harsh Jain 2025-08-25  334  	rng->rng_base = devm_platform_ioremap_resource(pdev, 0);
8979744aca8096 Harsh Jain 2025-08-25  335  	if (IS_ERR(rng->rng_base)) {
8979744aca8096 Harsh Jain 2025-08-25 @336  		dev_err(&pdev->dev, "Failed to map resource %ld\n", PTR_ERR(rng->rng_base));
8979744aca8096 Harsh Jain 2025-08-25  337  		return PTR_ERR(rng->rng_base);
8979744aca8096 Harsh Jain 2025-08-25  338  	}
8979744aca8096 Harsh Jain 2025-08-25  339  
8979744aca8096 Harsh Jain 2025-08-25  340  	xtrng_trng_reset(rng->rng_base);
8979744aca8096 Harsh Jain 2025-08-25  341  	ret = xtrng_reseed_internal(rng);
8979744aca8096 Harsh Jain 2025-08-25  342  	if (ret) {
8979744aca8096 Harsh Jain 2025-08-25  343  		dev_err(&pdev->dev, "TRNG Seed fail\n");
8979744aca8096 Harsh Jain 2025-08-25  344  		return ret;
8979744aca8096 Harsh Jain 2025-08-25  345  	}
8979744aca8096 Harsh Jain 2025-08-25  346  
8979744aca8096 Harsh Jain 2025-08-25  347  	xilinx_rng_dev = rng;
8979744aca8096 Harsh Jain 2025-08-25  348  	mutex_init(&rng->lock);
8979744aca8096 Harsh Jain 2025-08-25  349  	ret = crypto_register_rng(&xtrng_trng_alg);
8979744aca8096 Harsh Jain 2025-08-25  350  	if (ret) {
8979744aca8096 Harsh Jain 2025-08-25  351  		dev_err(&pdev->dev, "Crypto Random device registration failed: %d\n", ret);
8979744aca8096 Harsh Jain 2025-08-25  352  		return ret;
8979744aca8096 Harsh Jain 2025-08-25  353  	}
8979744aca8096 Harsh Jain 2025-08-25  354  	ret = xtrng_hwrng_register(&rng->trng);
8979744aca8096 Harsh Jain 2025-08-25  355  	if (ret) {
8979744aca8096 Harsh Jain 2025-08-25  356  		dev_err(&pdev->dev, "HWRNG device registration failed: %d\n", ret);
8979744aca8096 Harsh Jain 2025-08-25  357  		goto crypto_rng_free;
8979744aca8096 Harsh Jain 2025-08-25  358  	}
8979744aca8096 Harsh Jain 2025-08-25  359  	platform_set_drvdata(pdev, rng);
8979744aca8096 Harsh Jain 2025-08-25  360  
8979744aca8096 Harsh Jain 2025-08-25  361  	return 0;
8979744aca8096 Harsh Jain 2025-08-25  362  
8979744aca8096 Harsh Jain 2025-08-25  363  crypto_rng_free:
8979744aca8096 Harsh Jain 2025-08-25  364  	crypto_unregister_rng(&xtrng_trng_alg);
8979744aca8096 Harsh Jain 2025-08-25  365  
8979744aca8096 Harsh Jain 2025-08-25  366  	return ret;
8979744aca8096 Harsh Jain 2025-08-25  367  }
8979744aca8096 Harsh Jain 2025-08-25  368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
