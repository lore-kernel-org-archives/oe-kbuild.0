Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476525D203
	for <oe-kbuild@lists.linux.dev>; Mon,  5 May 2025 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459540; cv=none; b=qeSOsnqMosyDaJlq2+InCDUhw7zrRH7dPFI8crI0lt4Uj/iVZgsDBt10X8f3ytb2y07q6Gpp7X+hC3v4IthHcAsyvffP/pkpEDaOZuDWyOAO5ILNfHXIb6QWzvcqtsWx9pxIQFFixFlLpho18iqDuaWkOLqX3BxkLfI/cJ56i04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459540; c=relaxed/simple;
	bh=wOoHMO1eJ0UC4FDxHmkbrVwgQUQ1G/HppY9fMyCJ0tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEoNxRVr8MbLWOMDiG9twZfLQJUCtp13YjkRsueAIFrCkMIQVebhZd20M0F2WeBgpkqw4AV5kx2kKl5+jacZU0oOfWjFbw/LXkW79bQUu6ubN9UTCYxeZC+RsB/+WJzcqc9Zf/MetiPH4thOfiwGzKHBjhh7p7N35G9TVk0iU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgLVDoFL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgLVDoFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746459539; x=1777995539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wOoHMO1eJ0UC4FDxHmkbrVwgQUQ1G/HppY9fMyCJ0tg=;
  b=ZgLVDoFLjxxUzjgkQ5/0HH2i3bKmkT8mweKyIFJdCqK2XujlE94c8CVh
   dGE6jTzcdT6X2j3fm4ZQ/+Wh8Lpl8t0VPLV1x9Rg26oGT3IW3/AFSsx28
   dbWNSRTT3MLoq+36WQYW1lbogF7BnU0OYcUsCvjOxWZDK07wahU/a2CcH
   txsJlqXudbwSVs01hx8BAaE2MEGFkHeO8yCqx4VGlRVh54aVNp7v4WWev
   7ne53FnHQ5dRuIgIoEYRxobjVWm/lQWcpFA2UcHzCYJ3UWbu/J8T4T3wr
   IFxr8DsTPYmMwMeRL3AekIt041YGTUtUyWGVJxVpuNorq/FJM2rBjssD5
   Q==;
X-CSE-ConnectionGUID: 992zo/mxRXSBQ3HtXutUpA==
X-CSE-MsgGUID: SnpMmCX9SfGd8Tciouew7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48218791"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="48218791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:38:57 -0700
X-CSE-ConnectionGUID: 6QVDZOfbRvWtWYxJsrCBLw==
X-CSE-MsgGUID: RUsopXKmTVKxMFlbPEnwfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135792059"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2025 08:38:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBxu9-0005sh-0I;
	Mon, 05 May 2025 15:38:53 +0000
Date: Mon, 5 May 2025 23:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6836/8712]
 drivers/pinctrl/pinctrl-at91.c:1829:23: sparse: sparse: invalid access below
 'gpio_chips' (-712 40)
Message-ID: <202505052343.UHF1Zo93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pinctrl/pinctrl-at91.c:1829:23: sparse: sparse: invalid access below 'gpio_chips' (-712 40)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   407f60a151df3c44397e5afc0111eb9b026c38d3
commit: 8e86af65f39df6a8f1c1f033b90a5f7d5457ee7a [6836/8712] pinctrl: at91: allow building the module with COMPILE_TEST=y
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: mips-randconfig-r133-20250503 (https://download.01.org/0day-ci/archive/20250505/202505052343.UHF1Zo93-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250505/202505052343.UHF1Zo93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505052343.UHF1Zo93-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-at91.c:1829:23: sparse: sparse: invalid access below 'gpio_chips' (-712 40)

vim +/gpio_chips +1829 drivers/pinctrl/pinctrl-at91.c

6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1814  
150632b09aadf1 Greg Kroah-Hartman               2012-12-21  1815  static int at91_gpio_probe(struct platform_device *pdev)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1816  {
f494c1913cbb34 Andy Shevchenko                  2023-02-15  1817  	struct device *dev = &pdev->dev;
f494c1913cbb34 Andy Shevchenko                  2023-02-15  1818  	struct device_node *np = dev->of_node;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1819  	struct at91_gpio_chip *at91_chip = NULL;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1820  	struct gpio_chip *chip;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1821  	struct pinctrl_gpio_range *range;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1822  	int ret = 0;
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1823  	int irq, i;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1824  	int alias_idx = of_alias_get_id(np, "gpio");
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1825  	uint32_t ngpio;
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1826  	char **names;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1827  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1828  	BUG_ON(alias_idx >= ARRAY_SIZE(gpio_chips));
472bbb2cfd6384 Andy Shevchenko                  2023-02-15 @1829  	if (gpio_chips[alias_idx])
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1830  		return dev_err_probe(dev, -EBUSY, "%d slot is occupied.\n", alias_idx);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1831  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1832  	irq = platform_get_irq(pdev, 0);
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1833  	if (irq < 0)
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1834  		return irq;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1835  
00408f28c344fd Andy Shevchenko                  2023-02-15  1836  	at91_chip = devm_kzalloc(dev, sizeof(*at91_chip), GFP_KERNEL);
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1837  	if (!at91_chip)
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1838  		return -ENOMEM;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1839  
4b024225c4a824 YueHaibing                       2019-11-04  1840  	at91_chip->regbase = devm_platform_ioremap_resource(pdev, 0);
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1841  	if (IS_ERR(at91_chip->regbase))
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1842  		return PTR_ERR(at91_chip->regbase);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1843  
63bffc2d3a99ea Rob Herring                      2023-10-09  1844  	at91_chip->ops = device_get_match_data(dev);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1845  	at91_chip->pioc_virq = irq;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1846  
00408f28c344fd Andy Shevchenko                  2023-02-15  1847  	at91_chip->clock = devm_clk_get_enabled(dev, NULL);
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1848  	if (IS_ERR(at91_chip->clock))
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1849  		return dev_err_probe(dev, PTR_ERR(at91_chip->clock), "failed to get clock, ignoring.\n");
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1850  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1851  	at91_chip->chip = at91_gpio_template;
a5752075836762 Claudiu Beznea                   2022-08-31  1852  	at91_chip->id = alias_idx;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1853  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1854  	chip = &at91_chip->chip;
00408f28c344fd Andy Shevchenko                  2023-02-15  1855  	chip->label = dev_name(dev);
00408f28c344fd Andy Shevchenko                  2023-02-15  1856  	chip->parent = dev;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1857  	chip->owner = THIS_MODULE;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1858  	chip->base = alias_idx * MAX_NB_GPIO_PER_BANK;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1859  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1860  	if (!of_property_read_u32(np, "#gpio-lines", &ngpio)) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1861  		if (ngpio >= MAX_NB_GPIO_PER_BANK)
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1862  			dev_err(dev, "at91_gpio.%d, gpio-nb >= %d failback to %d\n",
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1863  				alias_idx, MAX_NB_GPIO_PER_BANK, MAX_NB_GPIO_PER_BANK);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1864  		else
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1865  			chip->ngpio = ngpio;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1866  	}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1867  
f494c1913cbb34 Andy Shevchenko                  2023-02-15  1868  	names = devm_kasprintf_strarray(dev, "pio", chip->ngpio);
35216718c9ac2a Dan Carpenter                    2023-05-22  1869  	if (IS_ERR(names))
35216718c9ac2a Dan Carpenter                    2023-05-22  1870  		return PTR_ERR(names);
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1871  
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1872  	for (i = 0; i < chip->ngpio; i++)
f494c1913cbb34 Andy Shevchenko                  2023-02-15  1873  		strreplace(names[i], '-', alias_idx + 'A');
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1874  
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1875  	chip->names = (const char *const *)names;
32b01a366eb5d7 Jean-Christophe PLAGNIOL-VILLARD 2012-11-07  1876  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1877  	range = &at91_chip->range;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1878  	range->name = chip->label;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1879  	range->id = alias_idx;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1880  	range->pin_base = range->base = range->id * MAX_NB_GPIO_PER_BANK;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1881  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1882  	range->npins = chip->ngpio;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1883  	range->gc = chip;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1884  
35dea5d746b2ba Linus Walleij                    2019-10-01  1885  	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
35dea5d746b2ba Linus Walleij                    2019-10-01  1886  	if (ret)
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1887  		return ret;
35dea5d746b2ba Linus Walleij                    2019-10-01  1888  
370ea61134e9d1 Linus Walleij                    2015-12-08  1889  	ret = gpiochip_add_data(chip, at91_chip);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1890  	if (ret)
472bbb2cfd6384 Andy Shevchenko                  2023-02-15  1891  		return ret;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1892  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1893  	gpio_chips[alias_idx] = at91_chip;
a5752075836762 Claudiu Beznea                   2022-08-31  1894  	platform_set_drvdata(pdev, at91_chip);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1895  	gpio_banks = max(gpio_banks, alias_idx + 1);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1896  
00408f28c344fd Andy Shevchenko                  2023-02-15  1897  	dev_info(dev, "at address %p\n", at91_chip->regbase);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1898  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1899  	return 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1900  }
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1901  

:::::: The code at line 1829 was first introduced by commit
:::::: 472bbb2cfd6384fe4c4b956af2170c1225fe2a92 pinctrl: at91: Use dev_err_probe() instead of custom messaging

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
