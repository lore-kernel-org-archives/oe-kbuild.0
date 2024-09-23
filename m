Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11BE184
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 01:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727053667; cv=none; b=rEKxAVTF4+NJckrI+aQx5zz7+rfyjtorHJDZtDjvHuXN69jLnlQVOwi++AZ/B1JUrPbCkx89fNqR9k3VUi8arbQe8m7IxS5o2PrvFdjZ7aTuHkYRMCzaDliyhk6auUB1+ycsArnSLuooG4AQrOzBBDVbu7EHeyrb1Ibq7kNyYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727053667; c=relaxed/simple;
	bh=L/DMsn9CSBYxC9Ed4wxObfMm0o0WUaOjjA32J8eAUqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gab7WX+QdtodqK5kz2EKNDFH23CfWLVJT+usZ5B5aV7JUyF7FkOkyk6tzBGeyLXamO+4z9PbJc1BQOKb5a3Kbpv+aaYbV43Szu73yDBAejncF9/Qp7CkFiJ40SB+fg1La0hbdH8j3I0ZGkSpNXuM8gd8vZpdBkWnjg3xJMYy5Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg5mzeJ7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lg5mzeJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727053665; x=1758589665;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L/DMsn9CSBYxC9Ed4wxObfMm0o0WUaOjjA32J8eAUqc=;
  b=lg5mzeJ7U0DjqkODAhsxfpFM+6JBVtGHvQupYmU04ErKRKI57uYex2Sm
   RlNeGv01I7U67a3Xje3gFT3YisiEFJrIM8ou3/WrJt4RNcTj58nXS40Sj
   2dlKcupqKqtdBmvams0U+zNCFM82XNah+k1W1cOCM/1khfLoWYoj+vxV2
   5VEHbZX8WPpGRiZ/dx19rLU9mDATDS4WotOSLVJVGxOPZ559Ygml5qoqQ
   Nq1z7FbA/7Sj99JcX0fD8lyebDQIVGL4qapfQExc9KFbPsPbTxso73RyO
   ArAwbNBxBA6+u9YgCkQDohCd5LBejJ5L1f4SRpe+F2Wwpn+/OOasJjY8c
   w==;
X-CSE-ConnectionGUID: SA3LKcUtQDe7FNNtti/UMQ==
X-CSE-MsgGUID: t0LtxvZiT3WgqGSPJPKFhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29774842"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="29774842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 18:07:44 -0700
X-CSE-ConnectionGUID: Y6AiCGPgRGCRMT5aLIgKZA==
X-CSE-MsgGUID: Si8WAVewRNmVDWIjdngxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="108342602"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2024 18:07:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssXYC-000Gn0-1q;
	Mon, 23 Sep 2024 01:07:40 +0000
Date: Mon, 23 Sep 2024 09:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] leds: bcmbca: Add new driver for Broadcom BCMBCA
Message-ID: <202409230821.u6DnFRWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org>
References: <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: William Zhang <william.zhang@broadcom.com>
TO: Anand Gore <anand.gore@broadcom.com>
TO: Kursad Oney <kursad.oney@broadcom.com>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: "Rafał Miłecki" <rafal@milecki.pl>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/dt-bindings-leds-bcmbca-Add-bindings-for-BRCMBCA-LEDs/20240920-191550
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20240920-bcmbca-leds-v1-2-5f70e692c6ff%40linaro.org
patch subject: [PATCH 2/2] leds: bcmbca: Add new driver for Broadcom BCMBCA
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230821.u6DnFRWT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230821.u6DnFRWT-lkp@intel.com/

smatch warnings:
drivers/leds/leds-bcmbca.c:335 bcmbca_leds_probe() error: uninitialized symbol 'val'.

vim +/val +335 drivers/leds/leds-bcmbca.c

901eeb6fc4dc75 Linus Walleij 2024-09-20  272  
901eeb6fc4dc75 Linus Walleij 2024-09-20  273  static int bcmbca_leds_probe(struct platform_device *pdev)
901eeb6fc4dc75 Linus Walleij 2024-09-20  274  {
901eeb6fc4dc75 Linus Walleij 2024-09-20  275  	unsigned int max_leds = BCMBCA_LED_MAX_COUNT;
901eeb6fc4dc75 Linus Walleij 2024-09-20  276  	struct device *dev = &pdev->dev;
901eeb6fc4dc75 Linus Walleij 2024-09-20  277  	struct device_node *np = dev_of_node(&pdev->dev);
901eeb6fc4dc75 Linus Walleij 2024-09-20  278  	enum bcmbca_led_type led_type;
901eeb6fc4dc75 Linus Walleij 2024-09-20  279  	void __iomem *base;
901eeb6fc4dc75 Linus Walleij 2024-09-20  280  	spinlock_t *lock; /* memory lock */
901eeb6fc4dc75 Linus Walleij 2024-09-20  281  	u32 num_shifters;
901eeb6fc4dc75 Linus Walleij 2024-09-20  282  	u32 val;
901eeb6fc4dc75 Linus Walleij 2024-09-20  283  	int ret;
901eeb6fc4dc75 Linus Walleij 2024-09-20  284  	int i;
901eeb6fc4dc75 Linus Walleij 2024-09-20  285  
901eeb6fc4dc75 Linus Walleij 2024-09-20  286  	base = devm_platform_ioremap_resource(pdev, 0);
901eeb6fc4dc75 Linus Walleij 2024-09-20  287  	if (IS_ERR(base))
901eeb6fc4dc75 Linus Walleij 2024-09-20  288  		return PTR_ERR(base);
901eeb6fc4dc75 Linus Walleij 2024-09-20  289  
901eeb6fc4dc75 Linus Walleij 2024-09-20  290  	lock = devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
901eeb6fc4dc75 Linus Walleij 2024-09-20  291  	if (!lock)
901eeb6fc4dc75 Linus Walleij 2024-09-20  292  		return -ENOMEM;
901eeb6fc4dc75 Linus Walleij 2024-09-20  293  
901eeb6fc4dc75 Linus Walleij 2024-09-20  294  	ret = of_property_read_u32(np, "brcm,serial-shifters", &num_shifters);
901eeb6fc4dc75 Linus Walleij 2024-09-20  295  	if (!ret) {
901eeb6fc4dc75 Linus Walleij 2024-09-20  296  		/* Serial LEDs */
901eeb6fc4dc75 Linus Walleij 2024-09-20  297  		dev_dbg(dev, "serial LEDs, %d shift registers used\n", num_shifters);
901eeb6fc4dc75 Linus Walleij 2024-09-20  298  		led_type = BCMBCA_LED_SERIAL;
901eeb6fc4dc75 Linus Walleij 2024-09-20  299  		/*
901eeb6fc4dc75 Linus Walleij 2024-09-20  300  		 * Each shifter can handle maximum 8 LEDs so we cap the
901eeb6fc4dc75 Linus Walleij 2024-09-20  301  		 * maximum LEDs we can handle at that.
901eeb6fc4dc75 Linus Walleij 2024-09-20  302  		 */
901eeb6fc4dc75 Linus Walleij 2024-09-20  303  		max_leds = num_shifters * 8;
901eeb6fc4dc75 Linus Walleij 2024-09-20  304  	} else {
901eeb6fc4dc75 Linus Walleij 2024-09-20  305  		/* Parallel LEDs */
901eeb6fc4dc75 Linus Walleij 2024-09-20  306  		led_type = BCMBCA_LED_PARALLEL;
901eeb6fc4dc75 Linus Walleij 2024-09-20  307  		dev_info(dev, "parallel LEDs requested, this is untested\n");
901eeb6fc4dc75 Linus Walleij 2024-09-20  308  	}
901eeb6fc4dc75 Linus Walleij 2024-09-20  309  
901eeb6fc4dc75 Linus Walleij 2024-09-20  310  	spin_lock_init(lock);
901eeb6fc4dc75 Linus Walleij 2024-09-20  311  
901eeb6fc4dc75 Linus Walleij 2024-09-20  312  	/* Turn off all LEDs and let the driver deal with them */
901eeb6fc4dc75 Linus Walleij 2024-09-20  313  	writel(0, base + BCMBCA_HW_EN);
901eeb6fc4dc75 Linus Walleij 2024-09-20  314  	writel(0, base + BCMBCA_SERIAL_POLARITY);
901eeb6fc4dc75 Linus Walleij 2024-09-20  315  	writel(0, base + BCMBCA_PARALLEL_POLARITY);
901eeb6fc4dc75 Linus Walleij 2024-09-20  316  
901eeb6fc4dc75 Linus Walleij 2024-09-20  317  	/* Set up serial shift register */
901eeb6fc4dc75 Linus Walleij 2024-09-20  318  	switch (num_shifters) {
901eeb6fc4dc75 Linus Walleij 2024-09-20  319  	case 0:
901eeb6fc4dc75 Linus Walleij 2024-09-20  320  		val = 0;
901eeb6fc4dc75 Linus Walleij 2024-09-20  321  		break;
901eeb6fc4dc75 Linus Walleij 2024-09-20  322  	case 1:
901eeb6fc4dc75 Linus Walleij 2024-09-20  323  		val = 0x000000ff;
901eeb6fc4dc75 Linus Walleij 2024-09-20  324  		break;
901eeb6fc4dc75 Linus Walleij 2024-09-20  325  	case 2:
901eeb6fc4dc75 Linus Walleij 2024-09-20  326  		val = 0x0000ffff;
901eeb6fc4dc75 Linus Walleij 2024-09-20  327  		break;
901eeb6fc4dc75 Linus Walleij 2024-09-20  328  	case 3:
901eeb6fc4dc75 Linus Walleij 2024-09-20  329  		val = 0x00ffffff;
901eeb6fc4dc75 Linus Walleij 2024-09-20  330  		break;
901eeb6fc4dc75 Linus Walleij 2024-09-20  331  	case 4:
901eeb6fc4dc75 Linus Walleij 2024-09-20  332  		val = 0xffffffff;
901eeb6fc4dc75 Linus Walleij 2024-09-20  333  		break;
901eeb6fc4dc75 Linus Walleij 2024-09-20  334  	}
901eeb6fc4dc75 Linus Walleij 2024-09-20 @335  	writel(val, base + BCMBCA_SERIAL_SHIFT_SEL);
901eeb6fc4dc75 Linus Walleij 2024-09-20  336  
901eeb6fc4dc75 Linus Walleij 2024-09-20  337  	/* ??? */
901eeb6fc4dc75 Linus Walleij 2024-09-20  338  	writel(0xc0000000, base + BCMBCA_HW_POLARITY);
901eeb6fc4dc75 Linus Walleij 2024-09-20  339  	/* Initialize to max brightness */
901eeb6fc4dc75 Linus Walleij 2024-09-20  340  	for (i = 0; i < BCMBCA_LED_MAX_COUNT/8; i++) {
901eeb6fc4dc75 Linus Walleij 2024-09-20  341  		writel(0x88888888, base + BCMBCA_BRIGHTNESS + 4*i);
901eeb6fc4dc75 Linus Walleij 2024-09-20  342  		writel(0, base + BCMBCA_BRIGHTNESS + BCMBCA_FLASH_RATE + 4*i);
901eeb6fc4dc75 Linus Walleij 2024-09-20  343  	}
901eeb6fc4dc75 Linus Walleij 2024-09-20  344  
901eeb6fc4dc75 Linus Walleij 2024-09-20  345  	for_each_available_child_of_node_scoped(np, child) {
901eeb6fc4dc75 Linus Walleij 2024-09-20  346  		u32 reg;
901eeb6fc4dc75 Linus Walleij 2024-09-20  347  
901eeb6fc4dc75 Linus Walleij 2024-09-20  348  		if (of_property_read_u32(child, "reg", &reg))
901eeb6fc4dc75 Linus Walleij 2024-09-20  349  			continue;
901eeb6fc4dc75 Linus Walleij 2024-09-20  350  
901eeb6fc4dc75 Linus Walleij 2024-09-20  351  		if (reg >= max_leds) {
901eeb6fc4dc75 Linus Walleij 2024-09-20  352  			dev_err(dev, "invalid LED (%u >= %d)\n", reg,
901eeb6fc4dc75 Linus Walleij 2024-09-20  353  				max_leds);
901eeb6fc4dc75 Linus Walleij 2024-09-20  354  			continue;
901eeb6fc4dc75 Linus Walleij 2024-09-20  355  		}
901eeb6fc4dc75 Linus Walleij 2024-09-20  356  
901eeb6fc4dc75 Linus Walleij 2024-09-20  357  		ret = bcmbca_led_probe(dev, child, reg, base, lock,
901eeb6fc4dc75 Linus Walleij 2024-09-20  358  				       num_shifters, led_type);
901eeb6fc4dc75 Linus Walleij 2024-09-20  359  		if (ret < 0)
901eeb6fc4dc75 Linus Walleij 2024-09-20  360  			return ret;
901eeb6fc4dc75 Linus Walleij 2024-09-20  361  	}
901eeb6fc4dc75 Linus Walleij 2024-09-20  362  
901eeb6fc4dc75 Linus Walleij 2024-09-20  363  	/* Enable the LEDs */
901eeb6fc4dc75 Linus Walleij 2024-09-20  364  	val = BCMBCA_CTRL_ENABLE | BCMBCA_CTRL_SERIAL_POL_HIGH;
901eeb6fc4dc75 Linus Walleij 2024-09-20  365  	if (of_property_read_bool(np, "brcm,serial-active-low"))
901eeb6fc4dc75 Linus Walleij 2024-09-20  366  		val &= ~BCMBCA_CTRL_SERIAL_POL_HIGH;
901eeb6fc4dc75 Linus Walleij 2024-09-20  367  	writel(val, base + BCMBCA_CTRL);
901eeb6fc4dc75 Linus Walleij 2024-09-20  368  
901eeb6fc4dc75 Linus Walleij 2024-09-20  369  	return 0;
901eeb6fc4dc75 Linus Walleij 2024-09-20  370  }
901eeb6fc4dc75 Linus Walleij 2024-09-20  371  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
