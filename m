Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340E11183
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Feb 2024 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706985023; cv=none; b=loWUDdAXaF6JbgWCX6whVCi521/6kvvbGUtw7MN8qBaySu0pbs13grTL84tv8Kn6s++6btaB2UC+axbo6n+RDSrfYlAkxk7M+sH4avlZBbxPTO8HbZjne4O9vSBfkjXNG+1UMtYTYrF0q2DzC3mF588RQm8CMZOU32r7gxZ5tNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706985023; c=relaxed/simple;
	bh=S21FxzT4TfFcAIiwJv3j3SSUvRj0BerFNM+xPUdkmtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/t4mdm3+563ATT10WqtwM97d9Ho/HoKpyCYUrmMxyTjFfSlMBnj6Vszdf/oR/plUUKU1wCfwRfwvniARCj4W+hZPsHbXGycYhNbcmc4PSjFh/T7fagkNjFAAns3BTwlvb4Gw/WCTT3PnrJ/agh3w1PQql9UxybY4ujjSn7N+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=natBAKcx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="natBAKcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706985022; x=1738521022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S21FxzT4TfFcAIiwJv3j3SSUvRj0BerFNM+xPUdkmtI=;
  b=natBAKcxqLwrna0yxJTr0JFMrZfPTZDkJsOB48Lctf5tj3rUfDGa584e
   sUnA/7nhEcnfPanklXKOb00s0l1SulVCOszGAx7kSNZLYQ7zhSeuNzZII
   YHf9joHFcdSAI1yMATM9kUrynCTzxrd6qZGnDZur3DlRy7KmWxZ/qr/ub
   TJef90CeDPxotJSVAnn9WXgu73nqXoOwJRhinlbQhzxfZQfLwCZIwf4U5
   Ct2MFxgjF6im8ZzYHNhIzPxSoPI8rRdE5mxqGDFsN92PzBG53qYWBZ1qx
   Y+qh/OGGLLyq2SeyPKsQ625Q15gmTwj8EokLzQrp0MO+qp413/0Nu9XKF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="506040"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="506040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 10:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="357350"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2024 10:30:20 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWKmP-0005Sq-23;
	Sat, 03 Feb 2024 18:30:17 +0000
Date: Sun, 4 Feb 2024 02:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tobetter:odroid-6.6.y 42/51] drivers/char/aml-gpiomem.c:242
 aml_gpiomem_probe() error: we previously assumed 'inst' could be null (see
 line 164)
Message-ID: <202402040226.dWKVclcB-lkp@intel.com>
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
TO: Steve Jeong <how2soft@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: 7d68a4b7edc4029f164a974f900a2eb2f1fc2919 [42/51] ODROID-N2/C4: char: Add /dev/gpiomem device
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040226.dWKVclcB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402040226.dWKVclcB-lkp@intel.com/

smatch warnings:
drivers/char/aml-gpiomem.c:242 aml_gpiomem_probe() error: we previously assumed 'inst' could be null (see line 164)

vim +/inst +242 drivers/char/aml-gpiomem.c

7d68a4b7edc402 Steve Jeong 2023-04-04  152  
7d68a4b7edc402 Steve Jeong 2023-04-04  153  static int aml_gpiomem_probe(struct platform_device *pdev)
7d68a4b7edc402 Steve Jeong 2023-04-04  154  {
7d68a4b7edc402 Steve Jeong 2023-04-04  155  	int err = 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  156  	struct device *dev = &pdev->dev;
7d68a4b7edc402 Steve Jeong 2023-04-04  157  	struct device_node *np = dev->of_node;
7d68a4b7edc402 Steve Jeong 2023-04-04  158  	struct resource *res = NULL;
7d68a4b7edc402 Steve Jeong 2023-04-04  159  	int i = 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  160  
7d68a4b7edc402 Steve Jeong 2023-04-04  161  	/* Allocate buffers and instance data */
7d68a4b7edc402 Steve Jeong 2023-04-04  162  	inst = kzalloc(sizeof(struct aml_gpiomem_instance), GFP_KERNEL);
7d68a4b7edc402 Steve Jeong 2023-04-04  163  
7d68a4b7edc402 Steve Jeong 2023-04-04 @164  	if (!inst) {
7d68a4b7edc402 Steve Jeong 2023-04-04  165  		err = -ENOMEM;
7d68a4b7edc402 Steve Jeong 2023-04-04  166  		goto failed_inst_alloc;
7d68a4b7edc402 Steve Jeong 2023-04-04  167  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  168  
7d68a4b7edc402 Steve Jeong 2023-04-04  169  	inst->dev = dev;
7d68a4b7edc402 Steve Jeong 2023-04-04  170  	inst->gpio_area_count = of_property_count_elems_of_size(np, "reg",
7d68a4b7edc402 Steve Jeong 2023-04-04  171  				sizeof(u32)) / 4;
7d68a4b7edc402 Steve Jeong 2023-04-04  172  
7d68a4b7edc402 Steve Jeong 2023-04-04  173  	if (inst->gpio_area_count > 32 || inst->gpio_area_count <= 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  174  		dev_err(inst->dev, "failed to get gpio register area.");
7d68a4b7edc402 Steve Jeong 2023-04-04  175  		err = -EINVAL;
7d68a4b7edc402 Steve Jeong 2023-04-04  176  		goto failed_inst_alloc;
7d68a4b7edc402 Steve Jeong 2023-04-04  177  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  178  
7d68a4b7edc402 Steve Jeong 2023-04-04  179  	dev_info(inst->dev, "Initialised: GPIO register area is %d",
7d68a4b7edc402 Steve Jeong 2023-04-04  180  			inst->gpio_area_count);
7d68a4b7edc402 Steve Jeong 2023-04-04  181  
7d68a4b7edc402 Steve Jeong 2023-04-04  182  	for (i = 0; i < inst->gpio_area_count; ++i) {
7d68a4b7edc402 Steve Jeong 2023-04-04  183  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
7d68a4b7edc402 Steve Jeong 2023-04-04  184  		if (res) {
7d68a4b7edc402 Steve Jeong 2023-04-04  185  			inst->gpio_regs_phys[i].start = res->start;
7d68a4b7edc402 Steve Jeong 2023-04-04  186  			inst->gpio_regs_phys[i].end   = res->end;
7d68a4b7edc402 Steve Jeong 2023-04-04  187  		} else {
7d68a4b7edc402 Steve Jeong 2023-04-04  188  			dev_err(inst->dev, "failed to get IO resource area %d", i);
7d68a4b7edc402 Steve Jeong 2023-04-04  189  			err = -ENOENT;
7d68a4b7edc402 Steve Jeong 2023-04-04  190  			goto failed_get_resource;
7d68a4b7edc402 Steve Jeong 2023-04-04  191  		}
7d68a4b7edc402 Steve Jeong 2023-04-04  192  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  193  
7d68a4b7edc402 Steve Jeong 2023-04-04  194  	/* Create character device entries */
7d68a4b7edc402 Steve Jeong 2023-04-04  195  	err = alloc_chrdev_region(&aml_gpiomem_devid,
7d68a4b7edc402 Steve Jeong 2023-04-04  196  				  DEVICE_MINOR, 1, DEVICE_NAME);
7d68a4b7edc402 Steve Jeong 2023-04-04  197  	if (err != 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  198  		dev_err(inst->dev, "unable to allocate device number");
7d68a4b7edc402 Steve Jeong 2023-04-04  199  		goto failed_alloc_chrdev;
7d68a4b7edc402 Steve Jeong 2023-04-04  200  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  201  	cdev_init(&aml_gpiomem_cdev, &aml_gpiomem_fops);
7d68a4b7edc402 Steve Jeong 2023-04-04  202  	aml_gpiomem_cdev.owner = THIS_MODULE;
7d68a4b7edc402 Steve Jeong 2023-04-04  203  	err = cdev_add(&aml_gpiomem_cdev, aml_gpiomem_devid, 1);
7d68a4b7edc402 Steve Jeong 2023-04-04  204  	if (err != 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  205  		dev_err(inst->dev, "unable to register device");
7d68a4b7edc402 Steve Jeong 2023-04-04  206  		goto failed_cdev_add;
7d68a4b7edc402 Steve Jeong 2023-04-04  207  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  208  
7d68a4b7edc402 Steve Jeong 2023-04-04  209  	/* Create sysfs entries */
7d68a4b7edc402 Steve Jeong 2023-04-04  210  	aml_gpiomem_class = class_create(DEVICE_NAME);
7d68a4b7edc402 Steve Jeong 2023-04-04  211  	err = IS_ERR(aml_gpiomem_class);
7d68a4b7edc402 Steve Jeong 2023-04-04  212  	if (err)
7d68a4b7edc402 Steve Jeong 2023-04-04  213  		goto failed_class_create;
7d68a4b7edc402 Steve Jeong 2023-04-04  214  
7d68a4b7edc402 Steve Jeong 2023-04-04  215  	aml_gpiomem_dev = device_create(aml_gpiomem_class, NULL,
7d68a4b7edc402 Steve Jeong 2023-04-04  216  					aml_gpiomem_devid, NULL,
7d68a4b7edc402 Steve Jeong 2023-04-04  217  					"gpiomem");
7d68a4b7edc402 Steve Jeong 2023-04-04  218  	err = IS_ERR(aml_gpiomem_dev);
7d68a4b7edc402 Steve Jeong 2023-04-04  219  	if (err)
7d68a4b7edc402 Steve Jeong 2023-04-04  220  		goto failed_device_create;
7d68a4b7edc402 Steve Jeong 2023-04-04  221  
7d68a4b7edc402 Steve Jeong 2023-04-04  222  	for (i = 0; i < inst->gpio_area_count; ++i) {
7d68a4b7edc402 Steve Jeong 2023-04-04  223  		dev_info(inst->dev,
7d68a4b7edc402 Steve Jeong 2023-04-04  224  			"Initialised: Registers at start:0x%08lx end:0x%08lx size:0x%08lx",
7d68a4b7edc402 Steve Jeong 2023-04-04  225  			inst->gpio_regs_phys[i].start,
7d68a4b7edc402 Steve Jeong 2023-04-04  226  			inst->gpio_regs_phys[i].end,
7d68a4b7edc402 Steve Jeong 2023-04-04  227  			inst->gpio_regs_phys[i].end - inst->gpio_regs_phys[i].start);
7d68a4b7edc402 Steve Jeong 2023-04-04  228  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  229  
7d68a4b7edc402 Steve Jeong 2023-04-04  230  	return 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  231  
7d68a4b7edc402 Steve Jeong 2023-04-04  232  failed_device_create:
7d68a4b7edc402 Steve Jeong 2023-04-04  233  	class_destroy(aml_gpiomem_class);
7d68a4b7edc402 Steve Jeong 2023-04-04  234  failed_class_create:
7d68a4b7edc402 Steve Jeong 2023-04-04  235  	cdev_del(&aml_gpiomem_cdev);
7d68a4b7edc402 Steve Jeong 2023-04-04  236  failed_cdev_add:
7d68a4b7edc402 Steve Jeong 2023-04-04  237  	unregister_chrdev_region(aml_gpiomem_devid, 1);
7d68a4b7edc402 Steve Jeong 2023-04-04  238  failed_alloc_chrdev:
7d68a4b7edc402 Steve Jeong 2023-04-04  239  failed_get_resource:
7d68a4b7edc402 Steve Jeong 2023-04-04  240  	kfree(inst);
7d68a4b7edc402 Steve Jeong 2023-04-04  241  failed_inst_alloc:
7d68a4b7edc402 Steve Jeong 2023-04-04 @242  	dev_err(inst->dev, "could not load aml_gpiomem");
7d68a4b7edc402 Steve Jeong 2023-04-04  243  	return err;
7d68a4b7edc402 Steve Jeong 2023-04-04  244  }
7d68a4b7edc402 Steve Jeong 2023-04-04  245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
