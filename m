Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4B3EDAD0
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190908; cv=none; b=q+wWj4U14RRLo1l2uChYrcmDFUZ6c7V76USM644Gim8lJdJtFft/q6BstJpFX8XC7px/ZgHMr6kdwCuGW+ZeqHwUAOZLandu4wlItioW8JSE5EYhfX4UKDuBrUCnz0QEdMDvlNNvD5UzYMz8QI1evKJ3hF9RivOzZv/VrvXeCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190908; c=relaxed/simple;
	bh=1FxZWAr1mOUx7Kz0m1pC4QX5zaWU6nkHhVG9XcKZANs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=elm1IwTuWPUK4rZ5fUpFXTPilmbK4x3w+F3ptvQKD2ZKHlMVWVO6TqjeVj3z+yu1cw+v45mQBwkzzvKwgkW3PI9ESxzw2RxR/04VBLzPjcgmSo9tL8bocncba460Bs+UDZoUZT/hz7Qq2OmlgkBmeo9LlmNzJvJnEDDMGVnoEME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFNNRW5Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFNNRW5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772190905; x=1803726905;
  h=date:from:to:cc:subject:message-id;
  bh=1FxZWAr1mOUx7Kz0m1pC4QX5zaWU6nkHhVG9XcKZANs=;
  b=nFNNRW5ZDrrSl30ncdYHujp0rVge79geNG5srYHSPTZXfsR2ME1AyNRX
   Nc8M17UQpPXz/UBHAZ8cN2JjbS8TP6ee7M2DKMUM73EtlAEzJa9C9XKCO
   Zj2LM7sgM4xDRYWiJbC6GAX8+tNEvEHGiKmmSZSnaL378lwqn4f6GcGsq
   K6n2su/2x/XSL17jxKkbpUG7Kb4fUiPQhiguqwX4UAm/L9mi0w7t4auEC
   09pEG+x6vgFxwpZadpPsSTak4vbPQV+7D7dUcIJLVIrwHtgQs9bbqHamj
   82hZnBSSxfnUmwWV8ETAby7HCiYUyi1X30k0yH8zRwbJ85s7ek1BXoui1
   g==;
X-CSE-ConnectionGUID: 8oJTo+/bQLu+JEdMIGUNSg==
X-CSE-MsgGUID: TaFdbjR8T+m+WLWaKLwxpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73238758"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73238758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:15:04 -0800
X-CSE-ConnectionGUID: Fz9NR28vTUm721/IJUVnWg==
X-CSE-MsgGUID: WyQh21rnQg66LCzZ52x8+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221871284"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2026 03:15:03 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvvkB-00000000AUb-1Gid;
	Fri, 27 Feb 2026 11:11:08 +0000
Date: Fri, 27 Feb 2026 18:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linusw-pinctrl:devel 16/22]
 drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing
 positive error code '1' to 'dev_err_probe'
Message-ID: <202602271847.vVWkqLBD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271847.vVWkqLBD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing positive error code '1' to 'dev_err_probe'

vim +1325 drivers/pinctrl/pinctrl-cy8c95x0.c

e6cbbe42944de9 Patrick Rudolph 2022-08-16  1308  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1309  static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1310  {
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1311  	struct gpio_irq_chip *girq = &chip->gpio_chip.irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1312  	DECLARE_BITMAP(pending_irqs, MAX_LINE);
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1313  	struct device *dev = chip->dev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1314  	int ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1315  
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1316  	ret = devm_mutex_init(chip->dev, &chip->irq_lock);
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1317  	if (ret)
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1318  		return ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1319  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1320  	bitmap_zero(pending_irqs, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1321  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1322  	/* Read IRQ status register to clear all pending interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1323  	ret = cy8c95x0_irq_pending(chip, pending_irqs);
014884732095b9 Andy Shevchenko 2026-02-23  1324  	if (ret)
014884732095b9 Andy Shevchenko 2026-02-23 @1325  		return dev_err_probe(dev, ret, "failed to clear irq status register\n");
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1326  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1327  	/* Mask all interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1328  	bitmap_fill(chip->irq_mask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1329  
f5d620254c9787 Andy Shevchenko 2022-09-02  1330  	gpio_irq_chip_set_chip(girq, &cy8c95x0_irqchip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1331  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1332  	/* This will let us handle the parent IRQ in the driver */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1333  	girq->parent_handler = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1334  	girq->num_parents = 0;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1335  	girq->parents = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1336  	girq->default_type = IRQ_TYPE_NONE;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1337  	girq->handler = handle_simple_irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1338  	girq->threaded = true;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1339  
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1340  	return devm_request_threaded_irq(dev, irq, NULL, cy8c95x0_irq_handler,
1ddee69108d305 Andy Shevchenko 2025-01-17  1341  					 IRQF_ONESHOT | IRQF_SHARED,
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1342  					 dev_name(chip->dev), chip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1343  }
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
