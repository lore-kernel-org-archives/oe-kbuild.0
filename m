Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57519047C
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104967; cv=none; b=f9hOJ7WenDrZrt3flxSWjeO1+0oHPsrEKyI3zkbGHpZjXJGqMOBBIqf78yDWKibsSHlaTHb2F1lSrolpnRqzvWHzh0O9+0aWO1SF676Gis/VvalurZ13hDgBPvYnsvWJaEXgwRsA7aX3Vu2Lj3olXO9VoWjDruihwt74H4WwXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104967; c=relaxed/simple;
	bh=GfwdOTWDMieICEre1eiMA1kYyJ8en4kqt/1MnFJZZrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9hLda49y3zivwihesCF/HZYCiN5KXLEMo7XPtRMs6QaU0vPkvOk2pP8wunHw7sPQHeo6KmYA8jLLFqy/CxELrrWQJtJipb4PiUmTaco1bDB4Rdr386ki5eXCsoEE79ayQNIJcgERDA4alPWEnW6uRucZQAVdVe/Y1weYP8jPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFPYjW9M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFPYjW9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730104965; x=1761640965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfwdOTWDMieICEre1eiMA1kYyJ8en4kqt/1MnFJZZrs=;
  b=fFPYjW9MJxLtUH1BlV14X1RQUmfshS8Djg4HLYTR+ENhRqGzJBf/UjBr
   fEj1pNbEWWVuHTgmLOYALHOXpNbwmqs/vPxT5Gqmqc3Sus3iZYFkfMdit
   hdVRAux8oaUbo+Rfz6vnrqZRbf+iM2SOkxFITwfZiTLjxhfoHb5hVG2Im
   MzyefrQ99HsnHLLkl6PyggbfURSCYP2Kf5KQz/Z9hyibQxY0SpA4wNmEJ
   gLiTYsvswPsxzyULYXQ0bholk2Gt7N2QQO9bqjavi4GP8yCaSvWC9QaX7
   LYMDyERbgb0xDFhVER97QxMEKVZcO+EN32Bdf1KDFjS4JkyUyKNEiVKiQ
   Q==;
X-CSE-ConnectionGUID: suo1XIjPSk25/UoqOy1waw==
X-CSE-MsgGUID: AYcVSaNpTeW8QVY14TETKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29467606"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29467606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 01:42:44 -0700
X-CSE-ConnectionGUID: wOcW2m2IR8yt/xbtiGfirA==
X-CSE-MsgGUID: SVc2TGoMSf+SRH+4r2rUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="82363724"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 01:42:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5LKj-000cDV-0O;
	Mon, 28 Oct 2024 08:42:41 +0000
Date: Mon, 28 Oct 2024 16:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/intel/iaa/iaa_crypto_main.c:1826
 iaa_crypto_init_module() warn: passing zero to 'PTR_ERR'
Message-ID: <202410281615.ubVWh99w-lkp@intel.com>
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
head:   81983758430957d9a5cb3333fe324fd70cf63e7e
commit: 2ec6761df889fdf896fde761abd447596dd8f8c2 crypto: iaa - Add support for deflate-iaa compression algorithm
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241028 (https://download.01.org/0day-ci/archive/20241028/202410281615.ubVWh99w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410281615.ubVWh99w-lkp@intel.com/

New smatch warnings:
drivers/crypto/intel/iaa/iaa_crypto_main.c:1826 iaa_crypto_init_module() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/crypto/intel/iaa/iaa_crypto_main.c:435 init_device_compression_mode() error: not allocating enough for = 'device_mode->aecs_decomp_table' 5352 vs 1600
drivers/crypto/intel/iaa/iaa_crypto_main.c:508 remove_device_compression_modes() error: double free of 'device_mode'

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
