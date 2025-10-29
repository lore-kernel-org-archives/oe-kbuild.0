Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57534F49B
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752859; cv=none; b=eszVE5TrFvdkPDSOgDc3hHYTOpNuO64rn/mG6ozZbhNqf9mPFtZqPPRRy3PHOXqyjihC1TFSlTPcEQocP3kof0NPzHiOcllrKkikts+ljNH6meG4d6XjO04RfNdMHqJGcHyQGdxqHw/QDa9BW3IZUK86xYy7S1nEi4+dZZ6cA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752859; c=relaxed/simple;
	bh=3SAJoo/fq64UN6qloIymXSGUdZA3le8c1xNNggUwMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwgDls0LpEn6EOZSIbeuJTceQZs/QoZEdUS6gEycsVGmfJujvrzdl9Tcpyz4L+TCiECS0v3r9Y1G815gFS16qoJP/39IuQEx0epsUzUNLvfNVGwaYUq5aJXtZ5Ert7Iq5OVKmZ/7kTVh1rd1nYT0jZtvtNc347AG9K6+yOe21xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2heytLT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2heytLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761752857; x=1793288857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3SAJoo/fq64UN6qloIymXSGUdZA3le8c1xNNggUwMuU=;
  b=T2heytLTdv3x24JqL4r+XvOvPX3nlBRXpls4Wwkuef3sqGb+jEDFRrF2
   SVhBFojBe6/K41TbqQ5TIJp8xH6FTMyoji1X+Hvn5m3H+ITYm1HYSdTdU
   1XAqePRgafPw+rBtK/xOMW29USaLWWwuxscsOeR2SqyN4AV0E8QL3sPIq
   H5e/mog9UqtwP5r1Y5i5QaXsvBTNtokLvJsFpUJNvrQrW9cgYcudyhaVo
   E8fihwyqj7fTYq951l//kHUWYstSP+5LOvNRV01VFUJm2VzitJgwjWN2p
   G3MP1SE0UiE9yOQUJsqJJjjS6NC8ryrJrIpNMaZH93n0kSTCYJqzta1Df
   A==;
X-CSE-ConnectionGUID: 2vxoY8ItTLSflfoy9tVbKQ==
X-CSE-MsgGUID: A0g+2ryeS0eKfVk4SbHUNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74997134"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="74997134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:47:36 -0700
X-CSE-ConnectionGUID: gMCD9CiAS329O5W4i5Ckxg==
X-CSE-MsgGUID: T0jSm1MyT+SNeCCqMELEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186447717"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 08:47:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8OZ-000KkB-1s;
	Wed, 29 Oct 2025 15:47:31 +0000
Date: Wed, 29 Oct 2025 23:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpio/gpio-davinci.c:471:49-56: WARNING: Consider using %pe
 to print PTR_ERR()
Message-ID: <202510292330.hzkyypWa-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 56d6ff4b8faf1c2d5c850ed8b4e5dfa6cd81413b gpio: davinci: allow building the module with COMPILE_TEST=y
date:   1 year ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292330.hzkyypWa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510292330.hzkyypWa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-davinci.c:471:49-56: WARNING: Consider using %pe to print PTR_ERR()

vim +471 drivers/gpio/gpio-davinci.c

0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  436  
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  437  /*
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  438   * NOTE:  for suspend/resume, probably best to make a platform_device with
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  439   * suspend_late/resume_resume calls hooking into results of the set_wake()
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  440   * calls ... so if no gpios are wakeup events the clock can be disabled,
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  441   * with outputs left at previously set levels, and so that VDD3P3V.IOPWDN0
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  442   * (dm6446) can be set appropriately for GPIOV33 pins.
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  443   */
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  444  
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  445  static int davinci_gpio_irq_setup(struct platform_device *pdev)
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  446  {
58c0f5aa124534a drivers/gpio/gpio-davinci.c  Alexander Shiyan    2014-02-15  447  	unsigned	gpio, bank;
58c0f5aa124534a drivers/gpio/gpio-davinci.c  Alexander Shiyan    2014-02-15  448  	int		irq;
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  449  	struct clk	*clk;
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  450  	u32		binten = 0;
c1d013a70f557e0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  451  	unsigned	ngpio;
118150f22d6b443 drivers/gpio/gpio-davinci.c  KV Sujith           2013-08-18  452  	struct device *dev = &pdev->dev;
118150f22d6b443 drivers/gpio/gpio-davinci.c  KV Sujith           2013-08-18  453  	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
99e9e52de635728 arch/arm/mach-davinci/gpio.c Cyril Chemparathy   2010-05-01  454  	struct davinci_gpio_regs __iomem *g;
6075a8b2b6c32dd drivers/gpio/gpio-davinci.c  Grygorii Strashko   2013-12-18  455  	struct irq_domain	*irq_domain = NULL;
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  456  	struct irq_chip *irq_chip;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  457  	struct davinci_gpio_irq_data *irqdata;
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  458  	gpio_get_irq_chip_cb_t gpio_get_irq_chip;
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  459  
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  460  	/*
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  461  	 * Use davinci_gpio_get_irq_chip by default to handle non DT cases
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  462  	 */
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  463  	gpio_get_irq_chip = davinci_gpio_get_irq_chip;
03a975cbcfcd0b3 drivers/gpio/gpio-davinci.c  Rob Herring         2023-10-06  464  	if (dev->of_node)
03a975cbcfcd0b3 drivers/gpio/gpio-davinci.c  Rob Herring         2023-10-06  465  		gpio_get_irq_chip = (gpio_get_irq_chip_cb_t)device_get_match_data(dev);
a994955cc091a8a arch/arm/mach-davinci/gpio.c Mark A. Greer       2009-04-15  466  
d29e741cad3f8f4 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  467  	ngpio = chips->chip.ngpio;
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  468  
d14f6f405fc7b66 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  469  	clk = devm_clk_get_enabled(dev, "gpio");
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  470  	if (IS_ERR(clk)) {
1a9ef909acc1d2e drivers/gpio/gpio-davinci.c  Keerthy             2017-07-20 @471  		dev_err(dev, "Error %ld getting gpio clock\n", PTR_ERR(clk));
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  472  		return PTR_ERR(clk);
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  473  	}
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  474  
5a431e50e9d4189 drivers/gpio/gpio-davinci.c  Vignesh Raghavendra 2024-10-02  475  	if (!chips->gpio_unbanked) {
a1a3c2d55179274 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2017-03-04  476  		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  477  		if (irq < 0) {
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  478  			dev_err(dev, "Couldn't allocate IRQ numbers\n");
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  479  			return irq;
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  480  		}
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  481  
310a7e60435151c drivers/gpio/gpio-davinci.c  Keerthy             2016-01-28  482  		irq_domain = irq_domain_add_legacy(dev->of_node, ngpio, irq, 0,
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  483  							&davinci_gpio_irq_ops,
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  484  							chips);
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  485  		if (!irq_domain) {
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  486  			dev_err(dev, "Couldn't register an IRQ domain\n");
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  487  			return -ENODEV;
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  488  		}
6075a8b2b6c32dd drivers/gpio/gpio-davinci.c  Grygorii Strashko   2013-12-18  489  	}
9211ff3140f24f6 drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-11-21  490  
131a10a39545cce drivers/gpio/gpio-davinci.c  Philip Avinash      2013-08-18  491  	/*
029d14e900e7766 drivers/gpio/gpio-davinci.c  Andy Shevchenko     2023-01-12  492  	 * Arrange gpiod_to_irq() support, handling either direct IRQs or
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  493  	 * banked IRQs.  Having GPIOs in the first GPIO bank use direct
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  494  	 * IRQs, while the others use banked IRQs, would need some setup
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  495  	 * tweaks to recognize hardware which can do that.
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  496  	 */
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  497  	chips->chip.to_irq = gpio_to_irq_banked;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  498  	chips->irq_domain = irq_domain;
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  499  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  500  	/*
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  501  	 * AINTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  502  	 * controller only handling trigger modes.  We currently assume no
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  503  	 * IRQ mux conflicts; gpio_irq_type_unbanked() is only for GPIOs.
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  504  	 */
d29e741cad3f8f4 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  505  	if (chips->gpio_unbanked) {
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  506  		/* pass "bank 0" GPIO IRQs to AINTC */
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  507  		chips->chip.to_irq = gpio_to_irq_unbanked;
d29e741cad3f8f4 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  508  
d29e741cad3f8f4 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  509  		binten = GENMASK(chips->gpio_unbanked / 16, 0);
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  510  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  511  		/* AINTC handles mask/unmask; GPIO handles triggering */
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  512  		irq = chips->irqs[0];
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  513  		irq_chip = gpio_get_irq_chip(irq);
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  514  		irq_chip->name = "GPIO-AINTC";
0c6feb0796ea640 drivers/gpio/gpio-davinci.c  Grygorii Strashko   2014-02-13  515  		irq_chip->irq_set_type = gpio_irq_type_unbanked;
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  516  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  517  		/* default trigger: both edges */
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  518  		g = chips->regs[0];
388291c3a1eb6fe drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-12-11  519  		writel_relaxed(~0, &g->set_falling);
388291c3a1eb6fe drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-12-11  520  		writel_relaxed(~0, &g->set_rising);
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  521  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  522  		/* set the direct IRQs up to use that irqchip */
d29e741cad3f8f4 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  523  		for (gpio = 0; gpio < chips->gpio_unbanked; gpio++) {
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  524  			irq_set_chip(chips->irqs[gpio], irq_chip);
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  525  			irq_set_handler_data(chips->irqs[gpio], chips);
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  526  			irq_set_status_flags(chips->irqs[gpio],
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  527  					     IRQ_TYPE_EDGE_BOTH);
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  528  		}
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  529  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  530  		goto done;
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  531  	}
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  532  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  533  	/*
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  534  	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  535  	 * then chain through our own handler.
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  536  	 */
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  537  	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 16) {
8f7cf8c65746d94 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-17  538  		/* disabled by default, enabled only as needed
8f7cf8c65746d94 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-17  539  		 * There are register sets for 32 GPIOs. 2 banks of 16
8f7cf8c65746d94 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-17  540  		 * GPIOs are covered by each set of registers hence divide by 2
8f7cf8c65746d94 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-17  541  		 */
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  542  		g = chips->regs[bank / 2];
388291c3a1eb6fe drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-12-11  543  		writel_relaxed(~0, &g->clr_falling);
388291c3a1eb6fe drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-12-11  544  		writel_relaxed(~0, &g->clr_rising);
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  545  
f299bb9527abfa6 arch/arm/mach-davinci/gpio.c Ido Yariv           2011-07-12  546  		/*
f299bb9527abfa6 arch/arm/mach-davinci/gpio.c Ido Yariv           2011-07-12  547  		 * Each chip handles 32 gpios, and each irq bank consists of 16
f299bb9527abfa6 arch/arm/mach-davinci/gpio.c Ido Yariv           2011-07-12  548  		 * gpio irqs. Pass the irq bank's corresponding controller to
f299bb9527abfa6 arch/arm/mach-davinci/gpio.c Ido Yariv           2011-07-12  549  		 * the chained irq handler.
f299bb9527abfa6 arch/arm/mach-davinci/gpio.c Ido Yariv           2011-07-12  550  		 */
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  551  		irqdata = devm_kzalloc(&pdev->dev,
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  552  				       sizeof(struct
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  553  					      davinci_gpio_irq_data),
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  554  					      GFP_KERNEL);
d14f6f405fc7b66 drivers/gpio/gpio-davinci.c  Bartosz Golaszewski 2024-08-19  555  		if (!irqdata)
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  556  			return -ENOMEM;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  557  
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  558  		irqdata->regs = g;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  559  		irqdata->bank_num = bank;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  560  		irqdata->chip = chips;
b5cf3fd827d2e11 drivers/gpio/gpio-davinci.c  Keerthy             2017-01-13  561  
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  562  		irq_set_chained_handler_and_data(chips->irqs[bank],
eb3744a2dd01cb0 drivers/gpio/gpio-davinci.c  Keerthy             2018-06-13  563  						 gpio_irq_handler, irqdata);
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  564  
474dad54baee8f8 arch/arm/mach-davinci/gpio.c David Brownell      2008-12-07  565  		binten |= BIT(bank);
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  566  	}
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  567  
7a36071e7954836 arch/arm/mach-davinci/gpio.c David Brownell      2009-06-25  568  done:
131a10a39545cce drivers/gpio/gpio-davinci.c  Philip Avinash      2013-08-18  569  	/*
131a10a39545cce drivers/gpio/gpio-davinci.c  Philip Avinash      2013-08-18  570  	 * BINTEN -- per-bank interrupt enable. genirq would also let these
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  571  	 * bits be set/cleared dynamically.
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  572  	 */
388291c3a1eb6fe drivers/gpio/gpio-davinci.c  Lad, Prabhakar      2013-12-11  573  	writel_relaxed(binten, gpio_base + BINTEN);
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  574  
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  575  	return 0;
3d9edf09d4525da arch/arm/mach-davinci/gpio.c Vladimir Barinov    2007-07-10  576  }
118150f22d6b443 drivers/gpio/gpio-davinci.c  KV Sujith           2013-08-18  577  

:::::: The code at line 471 was first introduced by commit
:::::: 1a9ef909acc1d2e4ded41465e4ced22291ee999a gpio: davinci: Convert prinkt to dev_err

:::::: TO: Keerthy <j-keerthy@ti.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
