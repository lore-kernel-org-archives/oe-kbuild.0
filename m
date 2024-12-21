Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E601F2C47
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734787122; cv=none; b=s424C90/BlOcg6aF1TirxHWiAwreVaAxo7Z48DtSJ53trOn4f5RGIN0DYp8HUWpYK+a4jX5Z8TyfrcHgkdRuyZZwIaEsRPA2/2ll8nRxupXFbNgKMP8JRgxf31cDM4bEcZy3gbsPi0IGAyfst4YxckRRfZeZRf++6PzrW7Wtahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734787122; c=relaxed/simple;
	bh=wlwuzy8q156KRmvKnPL+x++k4+gfZqk81GEFcbwKgb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsDPx+gKO+RT/J5Tc2rCBXri8Do8UkAoEI2Q0m5Biu9nhcqCgBAUBkmbkMyp2XKN7j8N2XubMwY6pFH+Ft1glCZpxdjOFKdDkuO0L3n/lyRN/Cl4XsWPxnaAX/mTsLVTOw5X35ogt5My+6yIkDXD08VglEpmdGQPWANxR9ckiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YabM4jMp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YabM4jMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734787121; x=1766323121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlwuzy8q156KRmvKnPL+x++k4+gfZqk81GEFcbwKgb4=;
  b=YabM4jMplQ6OeRIbsF4CpLefM4r/UQkFb4F3qUiHepQB/8ngO+dYWZpU
   fCnVJLRA6sIOF31741yoo1kPS1vgPO/pZKXyOZmWIFh5S8kD4pGQKEolP
   Sntp/rEifHs/J/GyFJbLocnQySwsC7YYg0Jlw/RJqQnNC+hX8MRn/NdKB
   oYUDW2d/DA9hZeMsObbj9ix3eRSmoLlxnZNDur5QqniqSmGQLQ8g2NO4Z
   jcL8saEDEvz8NgsE//arP1gAiTqt0ID5mmZ7ijGEHA2Tm3Y+sx1oHLa58
   jpf1MOMTk9d458l5ToaKAd42PuQKwN6tJGThAqUnOP19+qWC9j2GmN7mZ
   Q==;
X-CSE-ConnectionGUID: bj8Ngst9ShGQPDL0is6Krg==
X-CSE-MsgGUID: T1TWjI6oTvawniAezvo7/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35031360"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35031360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 05:18:38 -0800
X-CSE-ConnectionGUID: zhzL5VUWTDSGIofyq1LP5A==
X-CSE-MsgGUID: XmSm9KKfSmiNym3HC/js5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99619656"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2024 05:18:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOzNJ-0002Bh-2o;
	Sat, 21 Dec 2024 13:18:33 +0000
Date: Sat, 21 Dec 2024 21:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/intel/iaa/iaa_crypto_main.c:1826
 iaa_crypto_init_module() warn: passing zero to 'PTR_ERR'
Message-ID: <202412212125.eMiLtccg-lkp@intel.com>
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
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: 2ec6761df889fdf896fde761abd447596dd8f8c2 crypto: iaa - Add support for deflate-iaa compression algorithm
date:   1 year ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212125.eMiLtccg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412212125.eMiLtccg-lkp@intel.com/

New smatch warnings:
drivers/crypto/intel/iaa/iaa_crypto_main.c:1826 iaa_crypto_init_module() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/crypto/intel/iaa/iaa_crypto_main.c:435 init_device_compression_mode() error: not allocating enough for = 'device_mode->aecs_decomp_table' 5352 vs 1600
drivers/crypto/intel/iaa/iaa_crypto_main.c:508 remove_device_compression_modes() error: double free of 'device_mode' (line 505)

vim +/PTR_ERR +1826 drivers/crypto/intel/iaa/iaa_crypto_main.c

ea7a5cbb43696c Tom Zanussi 2023-12-05  1813  
ea7a5cbb43696c Tom Zanussi 2023-12-05  1814  static int __init iaa_crypto_init_module(void)
ea7a5cbb43696c Tom Zanussi 2023-12-05  1815  {
ea7a5cbb43696c Tom Zanussi 2023-12-05  1816  	int ret = 0;
ea7a5cbb43696c Tom Zanussi 2023-12-05  1817  
f57bf3f78377d6 Tom Zanussi 2023-12-05  1818  	nr_cpus = num_online_cpus();
f57bf3f78377d6 Tom Zanussi 2023-12-05  1819  	nr_nodes = num_online_nodes();
f57bf3f78377d6 Tom Zanussi 2023-12-05  1820  	nr_cpus_per_node = nr_cpus / nr_nodes;
f57bf3f78377d6 Tom Zanussi 2023-12-05  1821  
2ec6761df889fd Tom Zanussi 2023-12-05  1822  	if (crypto_has_comp("deflate-generic", 0, 0))
2ec6761df889fd Tom Zanussi 2023-12-05  1823  		deflate_generic_tfm = crypto_alloc_comp("deflate-generic", 0, 0);
2ec6761df889fd Tom Zanussi 2023-12-05  1824  
2ec6761df889fd Tom Zanussi 2023-12-05  1825  	if (IS_ERR_OR_NULL(deflate_generic_tfm)) {
2ec6761df889fd Tom Zanussi 2023-12-05 @1826  		pr_err("IAA could not alloc %s tfm: errcode = %ld\n",
2ec6761df889fd Tom Zanussi 2023-12-05  1827  		       "deflate-generic", PTR_ERR(deflate_generic_tfm));
2ec6761df889fd Tom Zanussi 2023-12-05  1828  		return -ENOMEM;
2ec6761df889fd Tom Zanussi 2023-12-05  1829  	}
2ec6761df889fd Tom Zanussi 2023-12-05  1830  
b190447e0fa3ef Tom Zanussi 2023-12-05  1831  	ret = iaa_aecs_init_fixed();
b190447e0fa3ef Tom Zanussi 2023-12-05  1832  	if (ret < 0) {
b190447e0fa3ef Tom Zanussi 2023-12-05  1833  		pr_debug("IAA fixed compression mode init failed\n");
2ec6761df889fd Tom Zanussi 2023-12-05  1834  		goto err_aecs_init;
b190447e0fa3ef Tom Zanussi 2023-12-05  1835  	}
b190447e0fa3ef Tom Zanussi 2023-12-05  1836  
ea7a5cbb43696c Tom Zanussi 2023-12-05  1837  	ret = idxd_driver_register(&iaa_crypto_driver);
ea7a5cbb43696c Tom Zanussi 2023-12-05  1838  	if (ret) {
ea7a5cbb43696c Tom Zanussi 2023-12-05  1839  		pr_debug("IAA wq sub-driver registration failed\n");
b190447e0fa3ef Tom Zanussi 2023-12-05  1840  		goto err_driver_reg;
ea7a5cbb43696c Tom Zanussi 2023-12-05  1841  	}
ea7a5cbb43696c Tom Zanussi 2023-12-05  1842  
2ec6761df889fd Tom Zanussi 2023-12-05  1843  	ret = driver_create_file(&iaa_crypto_driver.drv,
2ec6761df889fd Tom Zanussi 2023-12-05  1844  				 &driver_attr_verify_compress);
2ec6761df889fd Tom Zanussi 2023-12-05  1845  	if (ret) {
2ec6761df889fd Tom Zanussi 2023-12-05  1846  		pr_debug("IAA verify_compress attr creation failed\n");
2ec6761df889fd Tom Zanussi 2023-12-05  1847  		goto err_verify_attr_create;
2ec6761df889fd Tom Zanussi 2023-12-05  1848  	}
2ec6761df889fd Tom Zanussi 2023-12-05  1849  
ea7a5cbb43696c Tom Zanussi 2023-12-05  1850  	pr_debug("initialized\n");
ea7a5cbb43696c Tom Zanussi 2023-12-05  1851  out:
ea7a5cbb43696c Tom Zanussi 2023-12-05  1852  	return ret;
b190447e0fa3ef Tom Zanussi 2023-12-05  1853  
2ec6761df889fd Tom Zanussi 2023-12-05  1854  err_verify_attr_create:
2ec6761df889fd Tom Zanussi 2023-12-05  1855  	idxd_driver_unregister(&iaa_crypto_driver);
b190447e0fa3ef Tom Zanussi 2023-12-05  1856  err_driver_reg:
b190447e0fa3ef Tom Zanussi 2023-12-05  1857  	iaa_aecs_cleanup_fixed();
2ec6761df889fd Tom Zanussi 2023-12-05  1858  err_aecs_init:
2ec6761df889fd Tom Zanussi 2023-12-05  1859  	crypto_free_comp(deflate_generic_tfm);
b190447e0fa3ef Tom Zanussi 2023-12-05  1860  
b190447e0fa3ef Tom Zanussi 2023-12-05  1861  	goto out;
ea7a5cbb43696c Tom Zanussi 2023-12-05  1862  }
ea7a5cbb43696c Tom Zanussi 2023-12-05  1863  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
