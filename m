Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015717F0
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713228581; cv=none; b=CXoWBzgqfPBtWqpprr2azzqz+m+sRPmhGVXHg6Uq9zEWmS7BRxQkyLyQZlUFscVj7ain2nLeFygptcaZcE+4f/kfkBMuUdIAcpxNRuwdO6xVhVWloHiZX10jxZrNmDS4MrPqwjKP2GSveFbzJqhIptz9qFqbcir57osbnZpMW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713228581; c=relaxed/simple;
	bh=UMN+UOH79zKHZYju7w6SBGJDu7IeJa++kcRGi9er9OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFZ7z+wYeP+eGZrd8bxD0UHPt69gISLmhractB42ZJaJJPfD3zX0/rapxtWyuxwOCHWud6jJKTtjqn/zRAWpBjWWr0+NOurWw4aYyUHVSlx7CJXSRQbVL+znX/eufVjB20Gj7a1s9PbBhihv30Us0RQjFIQrlhcrd/sFVLl6dVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ju3XenKC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ju3XenKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713228580; x=1744764580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMN+UOH79zKHZYju7w6SBGJDu7IeJa++kcRGi9er9OM=;
  b=Ju3XenKCKKrQpjxHOX1cNjMXRq4W71fMUHBopvRfHmvFp6lvFUw3w3nt
   lJiZkstrCDlX2PymuHBa+XOMbTbsMNj96kgePsHPv9I/lcYNmuheDNONG
   FhLz5NKPPQpi5I+OZwferBTyE4kvlHBdVgMyhP2O9VQ6StG/0W/gCK1s6
   sWkEDUnF6pMsWXT058fD2mylOSKQlxSHWWhL0Yi+n2EXER6Xzr++AttP7
   n18l9aKfyisUO0SeAQyjvaBZn+JQ1MdhQxpfRVXyapcm0xJlAaiWCTKfD
   qOZF2rcDZA7CyinX83Fo9v8xH4xaP0pmNEN+xW/lqLvcAdXRcQvymZSOj
   w==;
X-CSE-ConnectionGUID: Tk+Q9mJCQDuAflRthuYgYw==
X-CSE-MsgGUID: mt/Lh8N4Sb+SsOV0zWK7Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8813168"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8813168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:49:39 -0700
X-CSE-ConnectionGUID: s03Bh+DKQHWEFW5tvjb0fA==
X-CSE-MsgGUID: 3X6IQkUbTBSlSqLX6ISwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22102418"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2024 17:49:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwX0x-0004mu-1c;
	Tue, 16 Apr 2024 00:49:35 +0000
Date: Tue, 16 Apr 2024 08:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tobetter:odroid-5.15.y 21/204] drivers/char/exynos-gpiomem.c:231
 exynos_gpiomem_probe() error: we previously assumed 'inst' could be null
 (see line 156)
Message-ID: <202404160800.qLr46RNZ-lkp@intel.com>
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
TO: Brian Kim <brian.kim@hardkernel.com>
CC: Dongjin Kim <tobetter@gmail.com>
CC: memeka <mihailescu2m@gmail.com>
CC: Yang Deokgyu <secugyu@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   28a16e1ab36472a36cac8b10003b29f322f458ff
commit: 61f45d975621becb00c0aef303769f10428b9cd8 [21/204] ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 5 months ago
config: i386-randconfig-141-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160800.qLr46RNZ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404160800.qLr46RNZ-lkp@intel.com/

smatch warnings:
drivers/char/exynos-gpiomem.c:231 exynos_gpiomem_probe() error: we previously assumed 'inst' could be null (see line 156)

vim +/inst +231 drivers/char/exynos-gpiomem.c

61f45d975621be Brian Kim 2017-01-10  144  
61f45d975621be Brian Kim 2017-01-10  145  static int exynos_gpiomem_probe(struct platform_device *pdev)
61f45d975621be Brian Kim 2017-01-10  146  {
61f45d975621be Brian Kim 2017-01-10  147  	int err = 0;
61f45d975621be Brian Kim 2017-01-10  148  	struct device *dev = &pdev->dev;
61f45d975621be Brian Kim 2017-01-10  149  	struct device_node *np = dev->of_node;
61f45d975621be Brian Kim 2017-01-10  150  	struct resource *res = NULL;
61f45d975621be Brian Kim 2017-01-10  151  	int i = 0;
61f45d975621be Brian Kim 2017-01-10  152  
61f45d975621be Brian Kim 2017-01-10  153  	/* Allocate buffers and instance data */
61f45d975621be Brian Kim 2017-01-10  154  	inst = kzalloc(sizeof(struct exynos_gpiomem_instance), GFP_KERNEL);
61f45d975621be Brian Kim 2017-01-10  155  
61f45d975621be Brian Kim 2017-01-10 @156  	if (!inst) {
61f45d975621be Brian Kim 2017-01-10  157  		err = -ENOMEM;
61f45d975621be Brian Kim 2017-01-10  158  		goto failed_inst_alloc;
61f45d975621be Brian Kim 2017-01-10  159  	}
61f45d975621be Brian Kim 2017-01-10  160  
61f45d975621be Brian Kim 2017-01-10  161  	inst->dev = dev;
61f45d975621be Brian Kim 2017-01-10  162  
61f45d975621be Brian Kim 2017-01-10  163  	inst->gpio_area_count = of_property_count_elems_of_size(np, "reg",
61f45d975621be Brian Kim 2017-01-10  164  				sizeof(u32)) / 2;
61f45d975621be Brian Kim 2017-01-10  165  
61f45d975621be Brian Kim 2017-01-10  166  	if (inst->gpio_area_count > 32 || inst->gpio_area_count <= 0) {
61f45d975621be Brian Kim 2017-01-10  167  		dev_err(inst->dev, "failed to get gpio register area.");
61f45d975621be Brian Kim 2017-01-10  168  		err = -EINVAL;
61f45d975621be Brian Kim 2017-01-10  169  		goto failed_inst_alloc;
61f45d975621be Brian Kim 2017-01-10  170  	}
61f45d975621be Brian Kim 2017-01-10  171  
61f45d975621be Brian Kim 2017-01-10  172  	dev_info(inst->dev, "Initialised: GPIO register area is %d",
61f45d975621be Brian Kim 2017-01-10  173  			inst->gpio_area_count);
61f45d975621be Brian Kim 2017-01-10  174  
61f45d975621be Brian Kim 2017-01-10  175  	for (i = 0; i < inst->gpio_area_count; ++i) {
61f45d975621be Brian Kim 2017-01-10  176  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
61f45d975621be Brian Kim 2017-01-10  177  		if (res) {
61f45d975621be Brian Kim 2017-01-10  178  			inst->gpio_regs_phys[i] = res->start;
61f45d975621be Brian Kim 2017-01-10  179  		} else {
61f45d975621be Brian Kim 2017-01-10  180  			dev_err(inst->dev, "failed to get IO resource");
61f45d975621be Brian Kim 2017-01-10  181  			err = -ENOENT;
61f45d975621be Brian Kim 2017-01-10  182  			goto failed_get_resource;
61f45d975621be Brian Kim 2017-01-10  183  		}
61f45d975621be Brian Kim 2017-01-10  184  	}
61f45d975621be Brian Kim 2017-01-10  185  
61f45d975621be Brian Kim 2017-01-10  186  	/* Create character device entries */
61f45d975621be Brian Kim 2017-01-10  187  	err = alloc_chrdev_region(&exynos_gpiomem_devid,
61f45d975621be Brian Kim 2017-01-10  188  				  DEVICE_MINOR, 1, DEVICE_NAME);
61f45d975621be Brian Kim 2017-01-10  189  	if (err != 0) {
61f45d975621be Brian Kim 2017-01-10  190  		dev_err(inst->dev, "unable to allocate device number");
61f45d975621be Brian Kim 2017-01-10  191  		goto failed_alloc_chrdev;
61f45d975621be Brian Kim 2017-01-10  192  	}
61f45d975621be Brian Kim 2017-01-10  193  	cdev_init(&exynos_gpiomem_cdev, &exynos_gpiomem_fops);
61f45d975621be Brian Kim 2017-01-10  194  	exynos_gpiomem_cdev.owner = THIS_MODULE;
61f45d975621be Brian Kim 2017-01-10  195  	err = cdev_add(&exynos_gpiomem_cdev, exynos_gpiomem_devid, 1);
61f45d975621be Brian Kim 2017-01-10  196  	if (err != 0) {
61f45d975621be Brian Kim 2017-01-10  197  		dev_err(inst->dev, "unable to register device");
61f45d975621be Brian Kim 2017-01-10  198  		goto failed_cdev_add;
61f45d975621be Brian Kim 2017-01-10  199  	}
61f45d975621be Brian Kim 2017-01-10  200  
61f45d975621be Brian Kim 2017-01-10  201  	/* Create sysfs entries */
61f45d975621be Brian Kim 2017-01-10  202  	exynos_gpiomem_class = class_create(THIS_MODULE, DEVICE_NAME);
61f45d975621be Brian Kim 2017-01-10  203  	err = IS_ERR(exynos_gpiomem_class);
61f45d975621be Brian Kim 2017-01-10  204  	if (err)
61f45d975621be Brian Kim 2017-01-10  205  		goto failed_class_create;
61f45d975621be Brian Kim 2017-01-10  206  
61f45d975621be Brian Kim 2017-01-10  207  	exynos_gpiomem_dev = device_create(exynos_gpiomem_class, NULL,
61f45d975621be Brian Kim 2017-01-10  208  					exynos_gpiomem_devid, NULL,
61f45d975621be Brian Kim 2017-01-10  209  					"gpiomem");
61f45d975621be Brian Kim 2017-01-10  210  	err = IS_ERR(exynos_gpiomem_dev);
61f45d975621be Brian Kim 2017-01-10  211  	if (err)
61f45d975621be Brian Kim 2017-01-10  212  		goto failed_device_create;
61f45d975621be Brian Kim 2017-01-10  213  
61f45d975621be Brian Kim 2017-01-10  214  	for (i = 0; i < inst->gpio_area_count; ++i) {
61f45d975621be Brian Kim 2017-01-10  215  		dev_info(inst->dev, "Initialised: Registers at 0x%08lx",
61f45d975621be Brian Kim 2017-01-10  216  				inst->gpio_regs_phys[i]);
61f45d975621be Brian Kim 2017-01-10  217  	}
61f45d975621be Brian Kim 2017-01-10  218  
61f45d975621be Brian Kim 2017-01-10  219  	return 0;
61f45d975621be Brian Kim 2017-01-10  220  
61f45d975621be Brian Kim 2017-01-10  221  failed_device_create:
61f45d975621be Brian Kim 2017-01-10  222  	class_destroy(exynos_gpiomem_class);
61f45d975621be Brian Kim 2017-01-10  223  failed_class_create:
61f45d975621be Brian Kim 2017-01-10  224  	cdev_del(&exynos_gpiomem_cdev);
61f45d975621be Brian Kim 2017-01-10  225  failed_cdev_add:
61f45d975621be Brian Kim 2017-01-10  226  	unregister_chrdev_region(exynos_gpiomem_devid, 1);
61f45d975621be Brian Kim 2017-01-10  227  failed_alloc_chrdev:
61f45d975621be Brian Kim 2017-01-10  228  failed_get_resource:
61f45d975621be Brian Kim 2017-01-10  229  	kfree(inst);
61f45d975621be Brian Kim 2017-01-10  230  failed_inst_alloc:
61f45d975621be Brian Kim 2017-01-10 @231  	dev_err(inst->dev, "could not load exynos_gpiomem");
61f45d975621be Brian Kim 2017-01-10  232  	return err;
61f45d975621be Brian Kim 2017-01-10  233  }
61f45d975621be Brian Kim 2017-01-10  234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
