Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C91DC9A3
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706622; cv=none; b=ZoeiYGZZjia+fZIEalRylxANB0c2vDcwj61rFXeDg8JukyD1izLJ/J584jfY9Tqi5L7N+mM88U+VC7elr4JbHT85olmIgzAJoVWYvTepHzpC3qWIU4a9eBngwXmso1MeJBt6gqP3HxTgeASWXrLyH2pdbhll5Cju3PU1fOGMuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706622; c=relaxed/simple;
	bh=tDV3tLce2E4R4L9cZ3KH3ym1kGZYJrY6XAMSNLyBdE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uED+LGptk5osEGXREBDpfYXl2HohPN/kPLxDulbEZeaBXl0OWZOUb/PDnIFVf0JCaWMfD1fYlAKOjpmrLUedZetdCcvRnPXQGNTU26NbowczpsSpCzE5W+JBvW9yCItd/+k/73W2BY+dErYbG8FZaE7UOcYi/vwT5TXDYYgOOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTp5Okxh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTp5Okxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747706618; x=1779242618;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tDV3tLce2E4R4L9cZ3KH3ym1kGZYJrY6XAMSNLyBdE4=;
  b=hTp5OkxhSkDy1m+6BUcQWZyBvPrrCW/op4LM+fCMC6sn5jOv8udf7cCf
   oE55N0/kPmSwBAySS+XMr2IJijhEyequ41W16bretbIyO9XG1rVXdhxXz
   c3WQF8e/GG937YCO7GiiywdjlWQaHcynmen1uDZQnP4exUxV/8Q+XuKSw
   wS2tPiMcXJR4SlcE3BCdu/i08NUzEjq2WA1Y+hzIrqbgZhcMTxGMEDW3Q
   /pzvv38B6ByODUhvbiMl3KTK/5HgFM/yC7PlwAdIIIZMnugT/X/9CSuTS
   bTDFlYOz3LA0lfOjIdOZutA+XWczQLa3Li6sfGL5moVQ+/TB0QYdh2c1c
   w==;
X-CSE-ConnectionGUID: myW8ClfsS+WRq+afs/M9uw==
X-CSE-MsgGUID: AN1pd/G4Sv6zQUSbN6I3nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59854311"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="59854311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 19:03:37 -0700
X-CSE-ConnectionGUID: IYgW6koeT3aohIjO9zabnA==
X-CSE-MsgGUID: JX4OP6v7SsmwhLsl4UB3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144292502"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2025 19:03:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHCKL-000M5I-1T;
	Tue, 20 May 2025 02:03:33 +0000
Date: Tue, 20 May 2025 10:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8918/11779]
 drivers/gpio/gpio-max77759.c:494:7-32: WARNING: Threaded IRQ with no primary
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202505201003.o1SZIvkd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "André Draszik" <andre.draszik@linaro.org>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 89a796b950edfa290ebd9f7d9b6a837093c9005e [8918/11779] gpio: max77759: Add Maxim MAX77759 gpio driver
:::::: branch date: 4 days ago
:::::: commit date: 11 days ago
config: mips-randconfig-r053-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201003.o1SZIvkd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505201003.o1SZIvkd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-max77759.c:494:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +494 drivers/gpio/gpio-max77759.c

89a796b950edfa André Draszik 2025-05-09  431  
89a796b950edfa André Draszik 2025-05-09  432  static int max77759_gpio_probe(struct platform_device *pdev)
89a796b950edfa André Draszik 2025-05-09  433  {
89a796b950edfa André Draszik 2025-05-09  434  	struct max77759_gpio_chip *chip;
89a796b950edfa André Draszik 2025-05-09  435  	int irq;
89a796b950edfa André Draszik 2025-05-09  436  	struct gpio_irq_chip *girq;
89a796b950edfa André Draszik 2025-05-09  437  	int ret;
89a796b950edfa André Draszik 2025-05-09  438  	unsigned long irq_flags;
89a796b950edfa André Draszik 2025-05-09  439  	struct irq_data *irqd;
89a796b950edfa André Draszik 2025-05-09  440  
89a796b950edfa André Draszik 2025-05-09  441  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
89a796b950edfa André Draszik 2025-05-09  442  	if (!chip)
89a796b950edfa André Draszik 2025-05-09  443  		return -ENOMEM;
89a796b950edfa André Draszik 2025-05-09  444  
89a796b950edfa André Draszik 2025-05-09  445  	chip->map = dev_get_regmap(pdev->dev.parent, "maxq");
89a796b950edfa André Draszik 2025-05-09  446  	if (!chip->map)
89a796b950edfa André Draszik 2025-05-09  447  		return dev_err_probe(&pdev->dev, -ENODEV, "Missing regmap\n");
89a796b950edfa André Draszik 2025-05-09  448  
89a796b950edfa André Draszik 2025-05-09  449  	irq = platform_get_irq_byname(pdev, "GPI");
89a796b950edfa André Draszik 2025-05-09  450  	if (irq < 0)
89a796b950edfa André Draszik 2025-05-09  451  		return dev_err_probe(&pdev->dev, irq, "Failed to get IRQ\n");
89a796b950edfa André Draszik 2025-05-09  452  
89a796b950edfa André Draszik 2025-05-09  453  	chip->max77759 = dev_get_drvdata(pdev->dev.parent);
89a796b950edfa André Draszik 2025-05-09  454  	ret = devm_mutex_init(&pdev->dev, &chip->maxq_lock);
89a796b950edfa André Draszik 2025-05-09  455  	if (ret)
89a796b950edfa André Draszik 2025-05-09  456  		return ret;
89a796b950edfa André Draszik 2025-05-09  457  	ret = devm_mutex_init(&pdev->dev, &chip->irq_lock);
89a796b950edfa André Draszik 2025-05-09  458  	if (ret)
89a796b950edfa André Draszik 2025-05-09  459  		return ret;
89a796b950edfa André Draszik 2025-05-09  460  
89a796b950edfa André Draszik 2025-05-09  461  	chip->gc.base = -1;
89a796b950edfa André Draszik 2025-05-09  462  	chip->gc.label = dev_name(&pdev->dev);
89a796b950edfa André Draszik 2025-05-09  463  	chip->gc.parent = &pdev->dev;
89a796b950edfa André Draszik 2025-05-09  464  	chip->gc.can_sleep = true;
89a796b950edfa André Draszik 2025-05-09  465  
89a796b950edfa André Draszik 2025-05-09  466  	chip->gc.names = max77759_gpio_line_names;
89a796b950edfa André Draszik 2025-05-09  467  	chip->gc.ngpio = MAX77759_N_GPIOS;
89a796b950edfa André Draszik 2025-05-09  468  	chip->gc.get_direction = max77759_gpio_get_direction;
89a796b950edfa André Draszik 2025-05-09  469  	chip->gc.direction_input = max77759_gpio_direction_input;
89a796b950edfa André Draszik 2025-05-09  470  	chip->gc.direction_output = max77759_gpio_direction_output;
89a796b950edfa André Draszik 2025-05-09  471  	chip->gc.get = max77759_gpio_get_value;
89a796b950edfa André Draszik 2025-05-09  472  	chip->gc.set_rv = max77759_gpio_set_value;
89a796b950edfa André Draszik 2025-05-09  473  
89a796b950edfa André Draszik 2025-05-09  474  	girq = &chip->gc.irq;
89a796b950edfa André Draszik 2025-05-09  475  	gpio_irq_chip_set_chip(girq, &max77759_gpio_irq_chip);
89a796b950edfa André Draszik 2025-05-09  476  	/* This will let us handle the parent IRQ in the driver */
89a796b950edfa André Draszik 2025-05-09  477  	girq->parent_handler = NULL;
89a796b950edfa André Draszik 2025-05-09  478  	girq->num_parents = 0;
89a796b950edfa André Draszik 2025-05-09  479  	girq->parents = NULL;
89a796b950edfa André Draszik 2025-05-09  480  	girq->default_type = IRQ_TYPE_NONE;
89a796b950edfa André Draszik 2025-05-09  481  	girq->handler = handle_simple_irq;
89a796b950edfa André Draszik 2025-05-09  482  	girq->threaded = true;
89a796b950edfa André Draszik 2025-05-09  483  
89a796b950edfa André Draszik 2025-05-09  484  	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
89a796b950edfa André Draszik 2025-05-09  485  	if (ret < 0)
89a796b950edfa André Draszik 2025-05-09  486  		return dev_err_probe(&pdev->dev, ret,
89a796b950edfa André Draszik 2025-05-09  487  				     "Failed to add GPIO chip\n");
89a796b950edfa André Draszik 2025-05-09  488  
89a796b950edfa André Draszik 2025-05-09  489  	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
89a796b950edfa André Draszik 2025-05-09  490  	irqd = irq_get_irq_data(irq);
89a796b950edfa André Draszik 2025-05-09  491  	if (irqd)
89a796b950edfa André Draszik 2025-05-09  492  		irq_flags |= irqd_get_trigger_type(irqd);
89a796b950edfa André Draszik 2025-05-09  493  
89a796b950edfa André Draszik 2025-05-09 @494  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
89a796b950edfa André Draszik 2025-05-09  495  					max77759_gpio_irqhandler, irq_flags,
89a796b950edfa André Draszik 2025-05-09  496  					dev_name(&pdev->dev), chip);
89a796b950edfa André Draszik 2025-05-09  497  	if (ret < 0)
89a796b950edfa André Draszik 2025-05-09  498  		return dev_err_probe(&pdev->dev, ret,
89a796b950edfa André Draszik 2025-05-09  499  				     "Failed to request IRQ\n");
89a796b950edfa André Draszik 2025-05-09  500  
89a796b950edfa André Draszik 2025-05-09  501  	return ret;
89a796b950edfa André Draszik 2025-05-09  502  }
89a796b950edfa André Draszik 2025-05-09  503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
