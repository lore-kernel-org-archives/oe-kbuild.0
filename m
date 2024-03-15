Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64786635
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Mar 2024 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710461877; cv=none; b=OGj3Sqafge480QhDcW51N5F2Q3abfGj3CANkGrNaM3PXLh8X0EW8pnF7XZUiDtHXudopIcEGNYufCbwphN5OO8ser0AMBl1WmNTh/+/T0HoMcNR4yji9sQ54ZhIffJxW7EpJFKia2NC7gzY8e202c8jLhr7VIFBCxHKE0qCqEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710461877; c=relaxed/simple;
	bh=eROvsIExXEHU0Zukeq8cO1OmxeNzrcmSHThzInMWris=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVQaJmA7vKRhWniaG9uN2JX7fd9ElHzJNoIWr+Fm4Mdf4DU51a8Zav2/RnK/FPF1LsFN3wtSdi7NrVHpPitqXJhpVNpZgJKlnVLHnfBdVaTkdYE8Q4kjHdUjWkppIZ5gkjIyCbnwOD0QEOyNcxIK3nCbgNRWv7T0Znk9BLGkdgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HejJvZJQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HejJvZJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710461873; x=1741997873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eROvsIExXEHU0Zukeq8cO1OmxeNzrcmSHThzInMWris=;
  b=HejJvZJQ30dq1iOq5+UqfmcL0gffjIfWmiUYk4cMkd/1R6K2ytG6xWLP
   ini1uo+VY1+9ghd0CnhFTqEWLFb3PtvBgDNMXVpObA/zw50M+E0VOfucW
   Q+/52/bTGjTbyhAdMz2gNvlj7+hLFI1TTCY4P1T0IQHH3VAUD/gqsrY4P
   roVYERyzs1xXa33O96yGv4fFxSyCdpWDOkmXUD2r4we3aFY9hBsk6ytEw
   z3xT1yLsCWTjOlJk8GDgx/RH3cdIFwZc0tY+E7+8bBPsIIZgPWRCD4m4+
   OHvF2qnvC6x4eV4Vm4/ybPUKb+TTNHGZKaiysOpF8b5bpow6a+wIVa1UX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5448293"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5448293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 17:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="17208517"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2024 17:17:50 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkvGd-000Dvx-1y;
	Fri, 15 Mar 2024 00:17:47 +0000
Date: Fri, 15 Mar 2024 08:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tobetter:odroid-6.8.y 41/50] drivers/char/aml-gpiomem.c:242:15-18:
 ERROR: inst is NULL but dereferenced.
Message-ID: <202403150813.o0pk6aZb-lkp@intel.com>
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

tree:   https://github.com/tobetter/linux odroid-6.8.y
head:   acad72b08e300e6aef1322a1bfd2d7b2c42cd860
commit: e393996c2ac91678267128462c92f08f28f14993 [41/50] ODROID-N2/C4: char: Add /dev/gpiomem device
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-103-20240314 (https://download.01.org/0day-ci/archive/20240315/202403150813.o0pk6aZb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403150813.o0pk6aZb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/aml-gpiomem.c:242:15-18: ERROR: inst is NULL but dereferenced.
--
>> drivers/char/aml-gpiomem.c:242:9-13: ERROR: reference preceded by free on line 240
--
>> drivers/char/aml-gpiomem.c:269:3-8: No need to set .owner here. The core will do it.

vim +242 drivers/char/aml-gpiomem.c

e393996c2ac9167 Steve Jeong 2023-04-04  152  
e393996c2ac9167 Steve Jeong 2023-04-04  153  static int aml_gpiomem_probe(struct platform_device *pdev)
e393996c2ac9167 Steve Jeong 2023-04-04  154  {
e393996c2ac9167 Steve Jeong 2023-04-04  155  	int err = 0;
e393996c2ac9167 Steve Jeong 2023-04-04  156  	struct device *dev = &pdev->dev;
e393996c2ac9167 Steve Jeong 2023-04-04  157  	struct device_node *np = dev->of_node;
e393996c2ac9167 Steve Jeong 2023-04-04  158  	struct resource *res = NULL;
e393996c2ac9167 Steve Jeong 2023-04-04  159  	int i = 0;
e393996c2ac9167 Steve Jeong 2023-04-04  160  
e393996c2ac9167 Steve Jeong 2023-04-04  161  	/* Allocate buffers and instance data */
e393996c2ac9167 Steve Jeong 2023-04-04  162  	inst = kzalloc(sizeof(struct aml_gpiomem_instance), GFP_KERNEL);
e393996c2ac9167 Steve Jeong 2023-04-04  163  
e393996c2ac9167 Steve Jeong 2023-04-04  164  	if (!inst) {
e393996c2ac9167 Steve Jeong 2023-04-04  165  		err = -ENOMEM;
e393996c2ac9167 Steve Jeong 2023-04-04  166  		goto failed_inst_alloc;
e393996c2ac9167 Steve Jeong 2023-04-04  167  	}
e393996c2ac9167 Steve Jeong 2023-04-04  168  
e393996c2ac9167 Steve Jeong 2023-04-04  169  	inst->dev = dev;
e393996c2ac9167 Steve Jeong 2023-04-04  170  	inst->gpio_area_count = of_property_count_elems_of_size(np, "reg",
e393996c2ac9167 Steve Jeong 2023-04-04  171  				sizeof(u32)) / 4;
e393996c2ac9167 Steve Jeong 2023-04-04  172  
e393996c2ac9167 Steve Jeong 2023-04-04  173  	if (inst->gpio_area_count > 32 || inst->gpio_area_count <= 0) {
e393996c2ac9167 Steve Jeong 2023-04-04  174  		dev_err(inst->dev, "failed to get gpio register area.");
e393996c2ac9167 Steve Jeong 2023-04-04  175  		err = -EINVAL;
e393996c2ac9167 Steve Jeong 2023-04-04  176  		goto failed_inst_alloc;
e393996c2ac9167 Steve Jeong 2023-04-04  177  	}
e393996c2ac9167 Steve Jeong 2023-04-04  178  
e393996c2ac9167 Steve Jeong 2023-04-04  179  	dev_info(inst->dev, "Initialised: GPIO register area is %d",
e393996c2ac9167 Steve Jeong 2023-04-04  180  			inst->gpio_area_count);
e393996c2ac9167 Steve Jeong 2023-04-04  181  
e393996c2ac9167 Steve Jeong 2023-04-04  182  	for (i = 0; i < inst->gpio_area_count; ++i) {
e393996c2ac9167 Steve Jeong 2023-04-04  183  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
e393996c2ac9167 Steve Jeong 2023-04-04  184  		if (res) {
e393996c2ac9167 Steve Jeong 2023-04-04  185  			inst->gpio_regs_phys[i].start = res->start;
e393996c2ac9167 Steve Jeong 2023-04-04  186  			inst->gpio_regs_phys[i].end   = res->end;
e393996c2ac9167 Steve Jeong 2023-04-04  187  		} else {
e393996c2ac9167 Steve Jeong 2023-04-04  188  			dev_err(inst->dev, "failed to get IO resource area %d", i);
e393996c2ac9167 Steve Jeong 2023-04-04  189  			err = -ENOENT;
e393996c2ac9167 Steve Jeong 2023-04-04  190  			goto failed_get_resource;
e393996c2ac9167 Steve Jeong 2023-04-04  191  		}
e393996c2ac9167 Steve Jeong 2023-04-04  192  	}
e393996c2ac9167 Steve Jeong 2023-04-04  193  
e393996c2ac9167 Steve Jeong 2023-04-04  194  	/* Create character device entries */
e393996c2ac9167 Steve Jeong 2023-04-04  195  	err = alloc_chrdev_region(&aml_gpiomem_devid,
e393996c2ac9167 Steve Jeong 2023-04-04  196  				  DEVICE_MINOR, 1, DEVICE_NAME);
e393996c2ac9167 Steve Jeong 2023-04-04  197  	if (err != 0) {
e393996c2ac9167 Steve Jeong 2023-04-04  198  		dev_err(inst->dev, "unable to allocate device number");
e393996c2ac9167 Steve Jeong 2023-04-04  199  		goto failed_alloc_chrdev;
e393996c2ac9167 Steve Jeong 2023-04-04  200  	}
e393996c2ac9167 Steve Jeong 2023-04-04  201  	cdev_init(&aml_gpiomem_cdev, &aml_gpiomem_fops);
e393996c2ac9167 Steve Jeong 2023-04-04  202  	aml_gpiomem_cdev.owner = THIS_MODULE;
e393996c2ac9167 Steve Jeong 2023-04-04  203  	err = cdev_add(&aml_gpiomem_cdev, aml_gpiomem_devid, 1);
e393996c2ac9167 Steve Jeong 2023-04-04  204  	if (err != 0) {
e393996c2ac9167 Steve Jeong 2023-04-04  205  		dev_err(inst->dev, "unable to register device");
e393996c2ac9167 Steve Jeong 2023-04-04  206  		goto failed_cdev_add;
e393996c2ac9167 Steve Jeong 2023-04-04  207  	}
e393996c2ac9167 Steve Jeong 2023-04-04  208  
e393996c2ac9167 Steve Jeong 2023-04-04  209  	/* Create sysfs entries */
e393996c2ac9167 Steve Jeong 2023-04-04  210  	aml_gpiomem_class = class_create(DEVICE_NAME);
e393996c2ac9167 Steve Jeong 2023-04-04  211  	err = IS_ERR(aml_gpiomem_class);
e393996c2ac9167 Steve Jeong 2023-04-04  212  	if (err)
e393996c2ac9167 Steve Jeong 2023-04-04  213  		goto failed_class_create;
e393996c2ac9167 Steve Jeong 2023-04-04  214  
e393996c2ac9167 Steve Jeong 2023-04-04  215  	aml_gpiomem_dev = device_create(aml_gpiomem_class, NULL,
e393996c2ac9167 Steve Jeong 2023-04-04  216  					aml_gpiomem_devid, NULL,
e393996c2ac9167 Steve Jeong 2023-04-04  217  					"gpiomem");
e393996c2ac9167 Steve Jeong 2023-04-04  218  	err = IS_ERR(aml_gpiomem_dev);
e393996c2ac9167 Steve Jeong 2023-04-04  219  	if (err)
e393996c2ac9167 Steve Jeong 2023-04-04  220  		goto failed_device_create;
e393996c2ac9167 Steve Jeong 2023-04-04  221  
e393996c2ac9167 Steve Jeong 2023-04-04  222  	for (i = 0; i < inst->gpio_area_count; ++i) {
e393996c2ac9167 Steve Jeong 2023-04-04  223  		dev_info(inst->dev,
e393996c2ac9167 Steve Jeong 2023-04-04  224  			"Initialised: Registers at start:0x%08lx end:0x%08lx size:0x%08lx",
e393996c2ac9167 Steve Jeong 2023-04-04  225  			inst->gpio_regs_phys[i].start,
e393996c2ac9167 Steve Jeong 2023-04-04  226  			inst->gpio_regs_phys[i].end,
e393996c2ac9167 Steve Jeong 2023-04-04  227  			inst->gpio_regs_phys[i].end - inst->gpio_regs_phys[i].start);
e393996c2ac9167 Steve Jeong 2023-04-04  228  	}
e393996c2ac9167 Steve Jeong 2023-04-04  229  
e393996c2ac9167 Steve Jeong 2023-04-04  230  	return 0;
e393996c2ac9167 Steve Jeong 2023-04-04  231  
e393996c2ac9167 Steve Jeong 2023-04-04  232  failed_device_create:
e393996c2ac9167 Steve Jeong 2023-04-04  233  	class_destroy(aml_gpiomem_class);
e393996c2ac9167 Steve Jeong 2023-04-04  234  failed_class_create:
e393996c2ac9167 Steve Jeong 2023-04-04  235  	cdev_del(&aml_gpiomem_cdev);
e393996c2ac9167 Steve Jeong 2023-04-04  236  failed_cdev_add:
e393996c2ac9167 Steve Jeong 2023-04-04  237  	unregister_chrdev_region(aml_gpiomem_devid, 1);
e393996c2ac9167 Steve Jeong 2023-04-04  238  failed_alloc_chrdev:
e393996c2ac9167 Steve Jeong 2023-04-04  239  failed_get_resource:
e393996c2ac9167 Steve Jeong 2023-04-04 @240  	kfree(inst);
e393996c2ac9167 Steve Jeong 2023-04-04  241  failed_inst_alloc:
e393996c2ac9167 Steve Jeong 2023-04-04 @242  	dev_err(inst->dev, "could not load aml_gpiomem");
e393996c2ac9167 Steve Jeong 2023-04-04  243  	return err;
e393996c2ac9167 Steve Jeong 2023-04-04  244  }
e393996c2ac9167 Steve Jeong 2023-04-04  245  
e393996c2ac9167 Steve Jeong 2023-04-04  246  static int aml_gpiomem_remove(struct platform_device *pdev)
e393996c2ac9167 Steve Jeong 2023-04-04  247  {
e393996c2ac9167 Steve Jeong 2023-04-04  248  	struct device *dev = inst->dev;
e393996c2ac9167 Steve Jeong 2023-04-04  249  
e393996c2ac9167 Steve Jeong 2023-04-04  250  	kfree(inst);
e393996c2ac9167 Steve Jeong 2023-04-04  251  	device_destroy(aml_gpiomem_class, aml_gpiomem_devid);
e393996c2ac9167 Steve Jeong 2023-04-04  252  	class_destroy(aml_gpiomem_class);
e393996c2ac9167 Steve Jeong 2023-04-04  253  	cdev_del(&aml_gpiomem_cdev);
e393996c2ac9167 Steve Jeong 2023-04-04  254  	unregister_chrdev_region(aml_gpiomem_devid, 1);
e393996c2ac9167 Steve Jeong 2023-04-04  255  
e393996c2ac9167 Steve Jeong 2023-04-04  256  	dev_info(dev, "GPIO mem driver removed - OK");
e393996c2ac9167 Steve Jeong 2023-04-04  257  	return 0;
e393996c2ac9167 Steve Jeong 2023-04-04  258  }
e393996c2ac9167 Steve Jeong 2023-04-04  259  
e393996c2ac9167 Steve Jeong 2023-04-04  260  static const struct of_device_id aml_gpiomem_of_match[] = {
e393996c2ac9167 Steve Jeong 2023-04-04  261  	{.compatible = "amlogic, gpiomem",},
e393996c2ac9167 Steve Jeong 2023-04-04  262  	{ },
e393996c2ac9167 Steve Jeong 2023-04-04  263  };
e393996c2ac9167 Steve Jeong 2023-04-04  264  MODULE_DEVICE_TABLE(of, aml_gpiomem_of_match);
e393996c2ac9167 Steve Jeong 2023-04-04  265  
e393996c2ac9167 Steve Jeong 2023-04-04  266  static struct platform_driver aml_gpiomem_driver = {
e393996c2ac9167 Steve Jeong 2023-04-04  267  	.driver			= {
e393996c2ac9167 Steve Jeong 2023-04-04  268  		.name		= DRIVER_NAME,
e393996c2ac9167 Steve Jeong 2023-04-04 @269  		.owner		= THIS_MODULE,
e393996c2ac9167 Steve Jeong 2023-04-04  270  		.of_match_table	= aml_gpiomem_of_match,
e393996c2ac9167 Steve Jeong 2023-04-04  271  	},
e393996c2ac9167 Steve Jeong 2023-04-04  272  	.probe			= aml_gpiomem_probe,
e393996c2ac9167 Steve Jeong 2023-04-04  273  	.remove			= aml_gpiomem_remove,
e393996c2ac9167 Steve Jeong 2023-04-04  274  };
e393996c2ac9167 Steve Jeong 2023-04-04  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
