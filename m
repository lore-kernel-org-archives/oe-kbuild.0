Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE378F36
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592511; cv=none; b=OlSKn00Ai9OQlRyVRq2HWzM890Fro9F3f6cIECIImJaQinfCUKp+KQUWCero2a4fJdy0XjPr7UX7/wPhAcV5JAdF3cud1s3zmBGHO4gsHcueSuA4g5zDukT5bQxQ4/apOJCU2RuobtvRi7WBRUWK66l8npztdFEjpKi1P3Da3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592511; c=relaxed/simple;
	bh=ESMooSztdzriXC1F4iNeYbOfcA/xTJ5ZY6DOOjVmeW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKSr6ReYGuCXA/jWzAmtSWqCYwZ1dWVn4VXa3+9KWcI5T21STVKnOIQ2X560JwiScg4xUIJifM8Mp8zs5DRStb4y0cy7aO/iKoN/No40AxJQAZDEuEUKHTesUX3KUl++58FIzmQbJNdJi03OPJbVMKazJR7IMN9fzkzkRygIJMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdI15/lQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdI15/lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755592508; x=1787128508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESMooSztdzriXC1F4iNeYbOfcA/xTJ5ZY6DOOjVmeW0=;
  b=hdI15/lQW9Qc/Iges+F7gbAbXuECD1ZjBBWTwAjRviKud51Ez9RxQKOR
   U7Cfg3rIK6jaYeQfI8HerTdDBdZKwXksKz7sSnJSDfpg3V2u/r2Zs8ZIA
   XWt9ykx1MPQoy89HSgiO2eTAuN/Orug5nai8k+AZlLhpRc/sP1CYQPuXr
   VHQ12zZy9mdH0PgRnOBDvxIVoiKjiSaqMRqV6jHd9eUZ+zbMeXanpO5VG
   4z5C4u+2NGBqjPVkO/kgVQQrLCR7VTyknEtEG3GQTBk6rpkp2JuctUc1N
   Lr8UwXw/rcDZpVfPBB9cOorc/5FR9Vg/fElyC1DPaJp6RcP9do9B9Yx/d
   g==;
X-CSE-ConnectionGUID: J7GzxuiOScS6siZgm15s3Q==
X-CSE-MsgGUID: FjLtuJgIQZW/GBl0HoL+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68926072"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68926072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:35:09 -0700
X-CSE-ConnectionGUID: t1y6Wr3BTuWdHiC0ivuRag==
X-CSE-MsgGUID: cv6SFek+TqeraOOtCtRhaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167030905"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2025 01:35:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoHnl-000GfP-1s;
	Tue, 19 Aug 2025 08:34:46 +0000
Date: Tue, 19 Aug 2025 16:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <202508191519.uT5io1jk-lkp@intel.com>
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
In-Reply-To: <1809103a948545df93b7b439df46ca6393995aa1.1754999365.git.zhoubinbin@loongson.cn>
References: <1809103a948545df93b7b439df46ca6393995aa1.1754999365.git.zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubb.aaron@gmail.com>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Lee Jones <lee@kernel.org>
TO: Corey Minyard <minyard@acm.org>
CC: Xuerui Wang <kernel@xen0n.name>
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: openipmi-developer@lists.sourceforge.net
CC: jeffbai@aosc.io
CC: kexybiscuit@aosc.io
CC: wangyao@lemote.com
CC: Chong Qiao <qiaochong@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 006aa8f57f55dd5bf68c4ada1e0d3f4e59027d71]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250812-200258
base:   006aa8f57f55dd5bf68c4ada1e0d3f4e59027d71
patch link:    https://lore.kernel.org/r/1809103a948545df93b7b439df46ca6393995aa1.1754999365.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v9 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191519.uT5io1jk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508191519.uT5io1jk-lkp@intel.com/

smatch warnings:
drivers/mfd/ls2k-bmc-core.c:389 ls2k_bmc_pdata_initial() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +389 drivers/mfd/ls2k-bmc-core.c

71ff6b050ad788 Binbin Zhou 2025-08-12  359  
71ff6b050ad788 Binbin Zhou 2025-08-12  360  static int ls2k_bmc_pdata_initial(struct ls2k_bmc_pdata *ddata)
71ff6b050ad788 Binbin Zhou 2025-08-12  361  {
71ff6b050ad788 Binbin Zhou 2025-08-12  362  	struct pci_dev *pdev = to_pci_dev(ddata->dev);
71ff6b050ad788 Binbin Zhou 2025-08-12  363  	int gsi = 16 + (LS2K_BMC_RESET_GPIO & 7);
71ff6b050ad788 Binbin Zhou 2025-08-12  364  	void __iomem *gpio_base;
71ff6b050ad788 Binbin Zhou 2025-08-12  365  	int irq, ret, val;
71ff6b050ad788 Binbin Zhou 2025-08-12  366  
71ff6b050ad788 Binbin Zhou 2025-08-12  367  	ls2k_bmc_save_pci_data(pdev, ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  368  
71ff6b050ad788 Binbin Zhou 2025-08-12  369  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
71ff6b050ad788 Binbin Zhou 2025-08-12  370  
71ff6b050ad788 Binbin Zhou 2025-08-12  371  	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
71ff6b050ad788 Binbin Zhou 2025-08-12  372  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  373  	if (ret) {
71ff6b050ad788 Binbin Zhou 2025-08-12  374  		dev_err(ddata->dev, "Failed to request LS2KBMC PCI-E IRQ %d.\n", pdev->irq);
71ff6b050ad788 Binbin Zhou 2025-08-12  375  		return ret;
71ff6b050ad788 Binbin Zhou 2025-08-12  376  	}
71ff6b050ad788 Binbin Zhou 2025-08-12  377  
71ff6b050ad788 Binbin Zhou 2025-08-12  378  	/*
71ff6b050ad788 Binbin Zhou 2025-08-12  379  	 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
71ff6b050ad788 Binbin Zhou 2025-08-12  380  	 * acpi_register_gsi() is used to obtain the GPIO IRQ. The GPIO interrupt is a
71ff6b050ad788 Binbin Zhou 2025-08-12  381  	 * watchdog interrupt that is triggered when the BMC resets.
71ff6b050ad788 Binbin Zhou 2025-08-12  382  	 */
71ff6b050ad788 Binbin Zhou 2025-08-12  383  	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
71ff6b050ad788 Binbin Zhou 2025-08-12  384  	if (irq < 0)
71ff6b050ad788 Binbin Zhou 2025-08-12  385  		return irq;
71ff6b050ad788 Binbin Zhou 2025-08-12  386  
71ff6b050ad788 Binbin Zhou 2025-08-12  387  	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
71ff6b050ad788 Binbin Zhou 2025-08-12  388  	if (!gpio_base) {
71ff6b050ad788 Binbin Zhou 2025-08-12 @389  		ret = PTR_ERR(gpio_base);
71ff6b050ad788 Binbin Zhou 2025-08-12  390  		goto acpi_failed;
71ff6b050ad788 Binbin Zhou 2025-08-12  391  	}
71ff6b050ad788 Binbin Zhou 2025-08-12  392  
71ff6b050ad788 Binbin Zhou 2025-08-12  393  	/* Disable GPIO output */
71ff6b050ad788 Binbin Zhou 2025-08-12  394  	val = readl(gpio_base + LOONGSON_GPIO_OEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  395  	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  396  
71ff6b050ad788 Binbin Zhou 2025-08-12  397  	/* Enable GPIO functionality */
71ff6b050ad788 Binbin Zhou 2025-08-12  398  	val = readl(gpio_base + LOONGSON_GPIO_FUNC);
71ff6b050ad788 Binbin Zhou 2025-08-12  399  	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_FUNC);
71ff6b050ad788 Binbin Zhou 2025-08-12  400  
71ff6b050ad788 Binbin Zhou 2025-08-12  401  	/* Set GPIO interrupts to low-level active */
71ff6b050ad788 Binbin Zhou 2025-08-12  402  	val = readl(gpio_base + LOONGSON_GPIO_INTPOL);
71ff6b050ad788 Binbin Zhou 2025-08-12  403  	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTPOL);
71ff6b050ad788 Binbin Zhou 2025-08-12  404  
71ff6b050ad788 Binbin Zhou 2025-08-12  405  	/* Enable GPIO interrupts */
71ff6b050ad788 Binbin Zhou 2025-08-12  406  	val = readl(gpio_base + LOONGSON_GPIO_INTEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  407  	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  408  
71ff6b050ad788 Binbin Zhou 2025-08-12  409  	ret = devm_request_irq(ddata->dev, irq, ls2k_bmc_interrupt,
71ff6b050ad788 Binbin Zhou 2025-08-12  410  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  411  	if (ret)
71ff6b050ad788 Binbin Zhou 2025-08-12  412  		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", irq);
71ff6b050ad788 Binbin Zhou 2025-08-12  413  
71ff6b050ad788 Binbin Zhou 2025-08-12  414  	iounmap(gpio_base);
71ff6b050ad788 Binbin Zhou 2025-08-12  415  
71ff6b050ad788 Binbin Zhou 2025-08-12  416  acpi_failed:
71ff6b050ad788 Binbin Zhou 2025-08-12  417  	acpi_unregister_gsi(gsi);
71ff6b050ad788 Binbin Zhou 2025-08-12  418  	return ret;
71ff6b050ad788 Binbin Zhou 2025-08-12  419  }
71ff6b050ad788 Binbin Zhou 2025-08-12  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
