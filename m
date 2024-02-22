Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210B10E6
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Feb 2024 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708577079; cv=none; b=r/itaeYdmWf3ogzdfFrUZphwjHUODPasFikPpKpPfry7QHHwmP8eob6Ux1KXBwBiK38Ka9zt2Xx2hM/bsgznw4wIow+n3Jc2Zl/UFEPQhLDCYJni3BUVyp1nX9XqgAVtgmbSjDtMi18B4vhpKW+w3gwnLzMLcCbvO2FGCkij8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708577079; c=relaxed/simple;
	bh=Wlfq7Dyk+ejLfHwa+MTVjUs9ocTd3Fz6vHo+OQS3Ngc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KszORZrrTd71uSCRo/V2c/peVBRvv0PUM9Cg2wIXyjRD0L9LMXB858BhqdC1XJ+Y7JrxD9qkpYol7mCYso3Krgar7XPR4zaCAOQlQsCxHAYXTJT+B86H4oB2pjrotGR2vLv/Z8N0I9EhIELbO9RlCdQA+B9WbxskflBeWUAM3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKBN6pop; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKBN6pop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708577078; x=1740113078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wlfq7Dyk+ejLfHwa+MTVjUs9ocTd3Fz6vHo+OQS3Ngc=;
  b=mKBN6popSU/go3O1IiQQy/CgLLWfH7MdFyfXiTs7BlZ3Wwf1G+2ijQ8L
   ftyMe5z5dvE58Ho90nFZLiud1579dTMQGbC4fRTKdaAfwdwgF1ZaZ0iMv
   GDAtbnGDkFnpgSEnce4W+9Ma2REyj5mHjzHynZgNfJYY96AsR2wK71g1J
   txTmkJfdry1Z3NFJfJYq9/Hyp9U4rU+JR1owgCCpoNAmJpisvOyRvmwyq
   ltAQNKrbHfZv3/w321DtHLpDj9aEdRihnMZ7mF5NgW1+jAj6t3wnoeMx8
   rpNs2g2GQzRy/M+ELlofGv0lXKYdMVWQ2YXQWsG0iIWvq2hsZ8XjfuVUR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13340467"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13340467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 20:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10052726"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 20:44:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd0wL-0005zk-2K;
	Thu, 22 Feb 2024 04:44:24 +0000
Date: Thu, 22 Feb 2024 12:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-lts:6.6/linux 19/34]
 drivers/gpio/gpio-ehl-pse-plat.c:380:5-8: WARNING: Unsigned expression
 compared with zero: irq < 0
Message-ID: <202402221258.5WPAWKAH-lkp@intel.com>
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
TO: Hao Li <hao3.li@intel.com>
CC: "sys_oak" <sys_oak@intel.com>
CC: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Hi Hao,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   1a83b00b8d0643b2e6dfe0e5879ad1a92f241de9
commit: c40bf6203170ce95be3243561ea8e0c434334654 [19/34] tgpio: Fix compilation errors for PSE TGPIO
:::::: branch date: 13 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r062-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221258.5WPAWKAH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402221258.5WPAWKAH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-ehl-pse-plat.c:380:5-8: WARNING: Unsigned expression compared with zero: irq < 0

vim +380 drivers/gpio/gpio-ehl-pse-plat.c

98f388dc83f17d Raymond Tan 2020-04-27  358  
98f388dc83f17d Raymond Tan 2020-04-27  359  static int ehl_pse_gpio_probe(struct platform_device *pdev)
98f388dc83f17d Raymond Tan 2020-04-27  360  {
98f388dc83f17d Raymond Tan 2020-04-27  361  	struct gpio_irq_chip *girq;
98f388dc83f17d Raymond Tan 2020-04-27  362  	struct ehl_pse_gpio *priv;
98f388dc83f17d Raymond Tan 2020-04-27  363  	struct resource *res;
98f388dc83f17d Raymond Tan 2020-04-27  364  	u32 irq;
98f388dc83f17d Raymond Tan 2020-04-27  365  	int ret;
98f388dc83f17d Raymond Tan 2020-04-27  366  
98f388dc83f17d Raymond Tan 2020-04-27  367  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
98f388dc83f17d Raymond Tan 2020-04-27  368  	if (!priv)
98f388dc83f17d Raymond Tan 2020-04-27  369  		return -ENOMEM;
98f388dc83f17d Raymond Tan 2020-04-27  370  
98f388dc83f17d Raymond Tan 2020-04-27  371  	priv->ctx = devm_kzalloc(&pdev->dev, sizeof(*priv->ctx), GFP_KERNEL);
98f388dc83f17d Raymond Tan 2020-04-27  372  	if (!priv->ctx)
98f388dc83f17d Raymond Tan 2020-04-27  373  		return -ENOMEM;
98f388dc83f17d Raymond Tan 2020-04-27  374  
98f388dc83f17d Raymond Tan 2020-04-27  375  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
98f388dc83f17d Raymond Tan 2020-04-27  376  	if (!res)
c40bf6203170ce Hao Li      2021-09-26  377  		return -EINVAL;
98f388dc83f17d Raymond Tan 2020-04-27  378  
98f388dc83f17d Raymond Tan 2020-04-27  379  	irq = platform_get_irq(pdev, 0);
98f388dc83f17d Raymond Tan 2020-04-27 @380  	if (irq < 0)
c40bf6203170ce Hao Li      2021-09-26  381  		return irq ? irq : -EINVAL;
98f388dc83f17d Raymond Tan 2020-04-27  382  
98f388dc83f17d Raymond Tan 2020-04-27  383  	priv->dev = &pdev->dev;
98f388dc83f17d Raymond Tan 2020-04-27  384  	priv->reg_base = devm_ioremap_resource(&pdev->dev, res);
98f388dc83f17d Raymond Tan 2020-04-27  385  
98f388dc83f17d Raymond Tan 2020-04-27  386  	priv->chip.label = dev_name(&pdev->dev);
98f388dc83f17d Raymond Tan 2020-04-27  387  	priv->chip.parent = &pdev->dev;
98f388dc83f17d Raymond Tan 2020-04-27  388  	priv->chip.request = ehl_pse_gpio_request;
98f388dc83f17d Raymond Tan 2020-04-27  389  	priv->chip.free = ehl_pse_gpio_free;
98f388dc83f17d Raymond Tan 2020-04-27  390  	priv->chip.direction_input = ehl_pse_gpio_direction_input;
98f388dc83f17d Raymond Tan 2020-04-27  391  	priv->chip.direction_output = ehl_pse_gpio_direction_output;
98f388dc83f17d Raymond Tan 2020-04-27  392  	priv->chip.get = ehl_pse_gpio_get;
98f388dc83f17d Raymond Tan 2020-04-27  393  	priv->chip.set = ehl_pse_gpio_set;
98f388dc83f17d Raymond Tan 2020-04-27  394  	priv->chip.get_direction = ehl_pse_gpio_get_direction;
98f388dc83f17d Raymond Tan 2020-04-27  395  	priv->chip.base = -1;
98f388dc83f17d Raymond Tan 2020-04-27  396  	/* 30 pins only per instance according to spec */
98f388dc83f17d Raymond Tan 2020-04-27  397  	priv->chip.ngpio = EHL_PSE_NGPIO;
98f388dc83f17d Raymond Tan 2020-04-27  398  	priv->chip.can_sleep = false;
98f388dc83f17d Raymond Tan 2020-04-27  399  	priv->chip.add_pin_ranges = NULL;
98f388dc83f17d Raymond Tan 2020-04-27  400  
98f388dc83f17d Raymond Tan 2020-04-27  401  	raw_spin_lock_init(&priv->lock);
98f388dc83f17d Raymond Tan 2020-04-27  402  
98f388dc83f17d Raymond Tan 2020-04-27  403  	girq = &priv->chip.irq;
98f388dc83f17d Raymond Tan 2020-04-27  404  	girq->chip = &ehl_pse_irqchip;
98f388dc83f17d Raymond Tan 2020-04-27  405  	girq->init_hw = ehl_pse_irq_init_hw;
98f388dc83f17d Raymond Tan 2020-04-27  406  	girq->parent_handler = ehl_pse_irq_handler;
98f388dc83f17d Raymond Tan 2020-04-27  407  	girq->num_parents = 1;
98f388dc83f17d Raymond Tan 2020-04-27  408  	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
98f388dc83f17d Raymond Tan 2020-04-27  409  				sizeof(*girq->parents), GFP_KERNEL);
98f388dc83f17d Raymond Tan 2020-04-27  410  	if (!girq->parents)
98f388dc83f17d Raymond Tan 2020-04-27  411  		return -ENOMEM;
98f388dc83f17d Raymond Tan 2020-04-27  412  
98f388dc83f17d Raymond Tan 2020-04-27  413  	girq->parents[0] = irq;
98f388dc83f17d Raymond Tan 2020-04-27  414  	girq->first = 0;
98f388dc83f17d Raymond Tan 2020-04-27  415  	girq->default_type = IRQ_TYPE_NONE;
98f388dc83f17d Raymond Tan 2020-04-27  416  	girq->handler = handle_bad_irq;
98f388dc83f17d Raymond Tan 2020-04-27  417  
98f388dc83f17d Raymond Tan 2020-04-27  418  	platform_set_drvdata(pdev, priv);
98f388dc83f17d Raymond Tan 2020-04-27  419  
98f388dc83f17d Raymond Tan 2020-04-27  420  	ret = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
98f388dc83f17d Raymond Tan 2020-04-27  421  	if (ret) {
98f388dc83f17d Raymond Tan 2020-04-27  422  		dev_err(&pdev->dev, "gpiochip_add error %d\n", ret);
98f388dc83f17d Raymond Tan 2020-04-27  423  		return ret;
98f388dc83f17d Raymond Tan 2020-04-27  424  	}
98f388dc83f17d Raymond Tan 2020-04-27  425  
98f388dc83f17d Raymond Tan 2020-04-27  426  	return 0;
98f388dc83f17d Raymond Tan 2020-04-27  427  }
98f388dc83f17d Raymond Tan 2020-04-27  428  

:::::: The code at line 380 was first introduced by commit
:::::: 98f388dc83f17d579f5684c021040f02269a7ebe mfd: intel-ehl-gpio: Introduce MFD framework to PSE GPIO/TGPIO

:::::: TO: Raymond Tan <raymond.tan@intel.com>
:::::: CC: sys_oak <sys_oak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
