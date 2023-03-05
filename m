Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555A3D60
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678057130; x=1709593130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLXguLzZAve5G2ZlHNXFy9ylsZ/jgtSC/39VN2FDQ40=;
  b=d6ypmvhvUl5tSHs9fADSq4k2ukL84D/Nht7pcycHHlRbZk6lnrpEwDVy
   umwzGw9qEbgClyxRol5jVpD7V1DtRlxATOfCM1KyCeLLi4G1fuonLiGUx
   OKSoClrkt/HXYOUWfgSQ20Wqa4Iu1rt9QVCUJy9wSHMObFYf6+miJvWKl
   dGfIkfcdexxA9kLljZHI5Ye2f3hDXxkEXknDXtUDP1qrDq+EBud6yYEsG
   eA7GI59tmBYqxWLZSaSNI/BaYDU5doIraw8HBVFK3OARz7hD5iJMKv9lP
   r91z+T4cdkkFLsTIfEXx1JXGspkIWUkBknzFjZLcrxOE6wSGV7TpzCkMh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="400253286"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="400253286"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 14:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="744852695"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="744852695"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Mar 2023 14:58:48 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYxJX-00038Q-1k;
	Sun, 05 Mar 2023 22:58:47 +0000
Date: Mon, 6 Mar 2023 06:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: pcie-idio-24: Migrate to the regmap API
Message-ID: <202303060606.ooBzB3pr-lkp@intel.com>
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
In-Reply-To: <278e328cd1689a4e331e7515050c12c29f2a4785.1678034378.git.william.gray@linaro.org>
References: <278e328cd1689a4e331e7515050c12c29f2a4785.1678034378.git.william.gray@linaro.org>
TO: William Breathitt Gray <william.gray@linaro.org>
TO: linus.walleij@linaro.org
TO: brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: broonie@kernel.org
CC: William Breathitt Gray <william.gray@linaro.org>
CC: Arnaud de Turckheim <quarium@gmail.com>
CC: John Hentges <jhentges@accesio.com>
CC: Jay Dolan <jay.dolan@accesio.com>

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 4827aae061337251bb91801b316157a78b845ec7]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Breathitt-Gray/regmap-Pass-irq_drv_data-as-a-parameter-for-set_type_config/20230306-010313
base:   4827aae061337251bb91801b316157a78b845ec7
patch link:    https://lore.kernel.org/r/278e328cd1689a4e331e7515050c12c29f2a4785.1678034378.git.william.gray%40linaro.org
patch subject: [PATCH v3 2/3] gpio: pcie-idio-24: Migrate to the regmap API
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230306/202303060606.ooBzB3pr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303060606.ooBzB3pr-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-pcie-idio-24.c:365 idio_24_probe() error: potentially dereferencing uninitialized 'idio24gpio'.

vim +/idio24gpio +365 drivers/gpio/gpio-pcie-idio-24.c

58556204662812 William Breathitt Gray 2018-01-09  329  
58556204662812 William Breathitt Gray 2018-01-09  330  static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
58556204662812 William Breathitt Gray 2018-01-09  331  {
58556204662812 William Breathitt Gray 2018-01-09  332  	struct device *const dev = &pdev->dev;
58556204662812 William Breathitt Gray 2018-01-09  333  	struct idio_24_gpio *idio24gpio;
58556204662812 William Breathitt Gray 2018-01-09  334  	int err;
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  335  	const size_t pci_plx_bar_index = 1;
58556204662812 William Breathitt Gray 2018-01-09  336  	const size_t pci_bar_index = 2;
58556204662812 William Breathitt Gray 2018-01-09  337  	const char *const name = pci_name(pdev);
e60d5c32ff098c William Breathitt Gray 2023-03-05  338  	struct gpio_regmap_config gpio_config = {};
e60d5c32ff098c William Breathitt Gray 2023-03-05  339  	void __iomem *pex8311_intcsr;
e60d5c32ff098c William Breathitt Gray 2023-03-05  340  	void __iomem *idio_24_regs;
e60d5c32ff098c William Breathitt Gray 2023-03-05  341  	struct regmap *pex8311_intcsr_map;
e60d5c32ff098c William Breathitt Gray 2023-03-05  342  	struct regmap_irq_chip *chip;
e60d5c32ff098c William Breathitt Gray 2023-03-05  343  	struct regmap_irq_chip_data *chip_data;
58556204662812 William Breathitt Gray 2018-01-09  344  
58556204662812 William Breathitt Gray 2018-01-09  345  	err = pcim_enable_device(pdev);
58556204662812 William Breathitt Gray 2018-01-09  346  	if (err) {
58556204662812 William Breathitt Gray 2018-01-09  347  		dev_err(dev, "Failed to enable PCI device (%d)\n", err);
58556204662812 William Breathitt Gray 2018-01-09  348  		return err;
58556204662812 William Breathitt Gray 2018-01-09  349  	}
58556204662812 William Breathitt Gray 2018-01-09  350  
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  351  	err = pcim_iomap_regions(pdev, BIT(pci_plx_bar_index) | BIT(pci_bar_index), name);
58556204662812 William Breathitt Gray 2018-01-09  352  	if (err) {
58556204662812 William Breathitt Gray 2018-01-09  353  		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
58556204662812 William Breathitt Gray 2018-01-09  354  		return err;
58556204662812 William Breathitt Gray 2018-01-09  355  	}
58556204662812 William Breathitt Gray 2018-01-09  356  
e60d5c32ff098c William Breathitt Gray 2023-03-05  357  	pex8311_intcsr = pcim_iomap_table(pdev)[pci_plx_bar_index] + PLX_PEX8311_PCI_LCS_INTCSR;
e60d5c32ff098c William Breathitt Gray 2023-03-05  358  	idio_24_regs = pcim_iomap_table(pdev)[pci_bar_index];
e60d5c32ff098c William Breathitt Gray 2023-03-05  359  
e60d5c32ff098c William Breathitt Gray 2023-03-05  360  	pex8311_intcsr_map = devm_regmap_init_mmio(dev, pex8311_intcsr,
e60d5c32ff098c William Breathitt Gray 2023-03-05  361  						   &pex8311_intcsr_regmap_config);
e60d5c32ff098c William Breathitt Gray 2023-03-05  362  	if (IS_ERR(pex8311_intcsr_map))
e60d5c32ff098c William Breathitt Gray 2023-03-05  363  		return dev_err_probe(dev, PTR_ERR(pex8311_intcsr_map),
e60d5c32ff098c William Breathitt Gray 2023-03-05  364  				     "Unable to initialize PEX8311 register map\n");
e60d5c32ff098c William Breathitt Gray 2023-03-05 @365  	idio24gpio->map = devm_regmap_init_mmio(dev, idio_24_regs,
e60d5c32ff098c William Breathitt Gray 2023-03-05  366  					    &idio_24_regmap_config);
e60d5c32ff098c William Breathitt Gray 2023-03-05  367  	if (IS_ERR(idio24gpio->map))
e60d5c32ff098c William Breathitt Gray 2023-03-05  368  		return dev_err_probe(dev, PTR_ERR(idio24gpio->map),
e60d5c32ff098c William Breathitt Gray 2023-03-05  369  				     "Unable to initialize register map\n");
e60d5c32ff098c William Breathitt Gray 2023-03-05  370  
e60d5c32ff098c William Breathitt Gray 2023-03-05  371  	idio24gpio = devm_kzalloc(dev, sizeof(*idio24gpio), GFP_KERNEL);
e60d5c32ff098c William Breathitt Gray 2023-03-05  372  	if (!idio24gpio)
e60d5c32ff098c William Breathitt Gray 2023-03-05  373  		return -ENOMEM;
e60d5c32ff098c William Breathitt Gray 2023-03-05  374  
e60d5c32ff098c William Breathitt Gray 2023-03-05  375  	mutex_init(&idio24gpio->lock);
e60d5c32ff098c William Breathitt Gray 2023-03-05  376  
e60d5c32ff098c William Breathitt Gray 2023-03-05  377  	/* Initialize all IRQ type configuration to IRQ_TYPE_EDGE_BOTH */
e60d5c32ff098c William Breathitt Gray 2023-03-05  378  	idio24gpio->irq_type = GENMASK(7, 0);
e60d5c32ff098c William Breathitt Gray 2023-03-05  379  
e60d5c32ff098c William Breathitt Gray 2023-03-05  380  	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
e60d5c32ff098c William Breathitt Gray 2023-03-05  381  	if (!chip)
e60d5c32ff098c William Breathitt Gray 2023-03-05  382  		return -ENOMEM;
e60d5c32ff098c William Breathitt Gray 2023-03-05  383  
e60d5c32ff098c William Breathitt Gray 2023-03-05  384  	chip->name = name;
e60d5c32ff098c William Breathitt Gray 2023-03-05  385  	chip->status_base = IDIO_24_COS_STATUS_BASE;
e60d5c32ff098c William Breathitt Gray 2023-03-05  386  	chip->mask_base = IDIO_24_COS_ENABLE;
e60d5c32ff098c William Breathitt Gray 2023-03-05  387  	chip->ack_base = IDIO_24_COS_STATUS_BASE;
e60d5c32ff098c William Breathitt Gray 2023-03-05  388  	chip->num_regs = 4;
e60d5c32ff098c William Breathitt Gray 2023-03-05  389  	chip->irqs = idio_24_regmap_irqs;
e60d5c32ff098c William Breathitt Gray 2023-03-05  390  	chip->num_irqs = ARRAY_SIZE(idio_24_regmap_irqs);
e60d5c32ff098c William Breathitt Gray 2023-03-05  391  	chip->handle_mask_sync = idio_24_handle_mask_sync;
e60d5c32ff098c William Breathitt Gray 2023-03-05  392  	chip->set_type_config = idio_24_set_type_config;
e60d5c32ff098c William Breathitt Gray 2023-03-05  393  	chip->irq_drv_data = idio24gpio;
58556204662812 William Breathitt Gray 2018-01-09  394  
58556204662812 William Breathitt Gray 2018-01-09  395  	/* Software board reset */
e60d5c32ff098c William Breathitt Gray 2023-03-05  396  	err = regmap_write(idio24gpio->map, IDIO_24_SOFT_RESET, 0);
e60d5c32ff098c William Breathitt Gray 2023-03-05  397  	if (err)
e60d5c32ff098c William Breathitt Gray 2023-03-05  398  		return err;
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  399  	/*
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  400  	 * enable PLX PEX8311 internal PCI wire interrupt and local interrupt
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  401  	 * input
10a2f11d3c9e48 Arnaud de Turckheim    2020-11-04  402  	 */
e60d5c32ff098c William Breathitt Gray 2023-03-05  403  	err = regmap_update_bits(pex8311_intcsr_map, 0x0, IDIO_24_ENABLE_IRQ,
e60d5c32ff098c William Breathitt Gray 2023-03-05  404  				 IDIO_24_ENABLE_IRQ);
e60d5c32ff098c William Breathitt Gray 2023-03-05  405  	if (err)
58556204662812 William Breathitt Gray 2018-01-09  406  		return err;
58556204662812 William Breathitt Gray 2018-01-09  407  
e60d5c32ff098c William Breathitt Gray 2023-03-05  408  	err = devm_regmap_add_irq_chip(dev, idio24gpio->map, pdev->irq, 0, 0,
e60d5c32ff098c William Breathitt Gray 2023-03-05  409  				       chip, &chip_data);
e60d5c32ff098c William Breathitt Gray 2023-03-05  410  	if (err)
e60d5c32ff098c William Breathitt Gray 2023-03-05  411  		return dev_err_probe(dev, err, "IRQ registration failed\n");
e60d5c32ff098c William Breathitt Gray 2023-03-05  412  
e60d5c32ff098c William Breathitt Gray 2023-03-05  413  	gpio_config.parent = dev;
e60d5c32ff098c William Breathitt Gray 2023-03-05  414  	gpio_config.regmap = idio24gpio->map;
e60d5c32ff098c William Breathitt Gray 2023-03-05  415  	gpio_config.ngpio = IDIO_24_NGPIO;
e60d5c32ff098c William Breathitt Gray 2023-03-05  416  	gpio_config.names = idio_24_names;
e60d5c32ff098c William Breathitt Gray 2023-03-05  417  	gpio_config.reg_dat_base = GPIO_REGMAP_ADDR(IDIO_24_OUT_BASE);
e60d5c32ff098c William Breathitt Gray 2023-03-05  418  	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_24_OUT_BASE);
e60d5c32ff098c William Breathitt Gray 2023-03-05  419  	gpio_config.reg_dir_out_base = GPIO_REGMAP_ADDR(IDIO_24_CONTROL_REG);
e60d5c32ff098c William Breathitt Gray 2023-03-05  420  	gpio_config.ngpio_per_reg = IDIO_24_NGPIO_PER_REG;
e60d5c32ff098c William Breathitt Gray 2023-03-05  421  	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
e60d5c32ff098c William Breathitt Gray 2023-03-05  422  	gpio_config.reg_mask_xlate = idio_24_reg_mask_xlate;
e60d5c32ff098c William Breathitt Gray 2023-03-05  423  	gpio_config.drvdata = idio24gpio->map;
e60d5c32ff098c William Breathitt Gray 2023-03-05  424  
e60d5c32ff098c William Breathitt Gray 2023-03-05  425  	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
58556204662812 William Breathitt Gray 2018-01-09  426  }
58556204662812 William Breathitt Gray 2018-01-09  427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
