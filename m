Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAC219DF4C
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731183604; cv=none; b=ra9OnDOMRXrnl+sRBJ3NZnXg7OTJyZtQ/u7YnDEaJ7JsXcLv/xLU0noyB0BBy8IYxC7FQc+TdQGf20ZBs2OCwOtv38OPZkR5q7fkX/038B666+Me6ZHzmBJpknezL8p5zyvjyCr+5HGFAisZqYEeGhJDblCBPBoysmQz0FJT3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731183604; c=relaxed/simple;
	bh=I3zhIaB9sgCVLlxN6tqPCMAylo3Q0p7aBlexIcsayCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eN3m48+/bjtUG8/4GICplBmKdd29Sm0ApZobLyI3VP1p6aYWqhsSTzMHsLFnpxkv4pRGEq2wYG/mD4gRUZ0/fwwrSLin79OWrtCZV88B0Qml7E+ZLeKf6EwN65Rqn1iUVT3dq0R+uZBUdnVMJiobuUaX+VIJWj8YHGXVjd12efQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFw67kg8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFw67kg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731183601; x=1762719601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3zhIaB9sgCVLlxN6tqPCMAylo3Q0p7aBlexIcsayCg=;
  b=nFw67kg8nwhfqwhwEm8SOKImsv08HP6seSuvZ0ghbSd6nOlO69mwuFuH
   D/B73q5tJ0FMZya+Vv+XaiOctwt1aVxb9rl8AZTeeRwxzqSTh9M4hX7nL
   5AzgpUutIum/gLctEVZWzGqlJ+W+fWdxpljDX3YaEVXd3uwB620qqhxql
   eQgD8twyqZpC1anCWyV+9CT0GldxoPbrzK3L5BoSFgIRoUdapgeZChkKH
   wMobFjOUayjsBUQkWyadbUZK3ZuadR6GE2Wbe7hLmzbaWQ1VM52yKZDoO
   H7ZWZoAa3csx1BKHcPPDUlEEgbNeeQbgmA/hhErCowwjpdYh/DXbbNwNf
   A==;
X-CSE-ConnectionGUID: O5uhO4EISzaeYu4UMFn3HQ==
X-CSE-MsgGUID: VMRaGYL/Sw61RdSVOhsSRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33901665"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="33901665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 12:19:59 -0800
X-CSE-ConnectionGUID: YLoR5ESVRr2M/MJH4u+HEw==
X-CSE-MsgGUID: OELBi0+VTpiYpstxJuVSAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86090497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 12:19:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9rw4-000sbc-07;
	Sat, 09 Nov 2024 20:19:56 +0000
Date: Sun, 10 Nov 2024 04:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5092/10559] drivers/gpio/gpio-grgpio.c:429:36-48:
 opportunity for str_on_off(priv -> domain)
Message-ID: <202411100434.eQN8KQ5v-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: bc40668def384256673bc18296865869c4a4187b [5092/10559] gpio: grgpio: drop Kconfig dependency on OF_GPIO
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r054-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100434.eQN8KQ5v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411100434.eQN8KQ5v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-grgpio.c:429:36-48: opportunity for str_on_off(priv -> domain)

vim +429 drivers/gpio/gpio-grgpio.c

08ffb2229fafc2 Andreas Larsson                  2013-04-17  327  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  328  static int grgpio_probe(struct platform_device *ofdev)
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  329  {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  330  	struct device_node *np = ofdev->dev.of_node;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  331  	void  __iomem *regs;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  332  	struct gpio_chip *gc;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  333  	struct grgpio_priv *priv;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  334  	int err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  335  	u32 prop;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  336  	s32 *irqmap;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  337  	int size;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  338  	int i;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  339  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  340  	priv = devm_kzalloc(&ofdev->dev, sizeof(*priv), GFP_KERNEL);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  341  	if (!priv)
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  342  		return -ENOMEM;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  343  
01d078aa9b90c1 Enrico Weigelt, metux IT consult 2019-06-17  344  	regs = devm_platform_ioremap_resource(ofdev, 0);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  345  	if (IS_ERR(regs))
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  346  		return PTR_ERR(regs);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  347  
0f4630f3720e7e Linus Walleij                    2015-12-04  348  	gc = &priv->gc;
0f4630f3720e7e Linus Walleij                    2015-12-04  349  	err = bgpio_init(gc, &ofdev->dev, 4, regs + GRGPIO_DATA,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  350  			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  351  			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  352  	if (err) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  353  		dev_err(&ofdev->dev, "bgpio_init() failed\n");
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  354  		return err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  355  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  356  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  357  	priv->regs = regs;
0f4630f3720e7e Linus Walleij                    2015-12-04  358  	priv->imask = gc->read_reg(regs + GRGPIO_IMASK);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  359  	priv->dev = &ofdev->dev;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  360  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  361  	gc->owner = THIS_MODULE;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  362  	gc->to_irq = grgpio_to_irq;
7eb6ce2f272336 Rob Herring                      2017-07-18  363  	gc->label = devm_kasprintf(&ofdev->dev, GFP_KERNEL, "%pOF", np);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  364  	gc->base = -1;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  365  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  366  	err = of_property_read_u32(np, "nbits", &prop);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  367  	if (err || prop <= 0 || prop > GRGPIO_MAX_NGPIO) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  368  		gc->ngpio = GRGPIO_MAX_NGPIO;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  369  		dev_dbg(&ofdev->dev,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  370  			"No or invalid nbits property: assume %d\n", gc->ngpio);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  371  	} else {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  372  		gc->ngpio = prop;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  373  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  374  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  375  	/*
08ffb2229fafc2 Andreas Larsson                  2013-04-17  376  	 * The irqmap contains the index values indicating which underlying irq,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  377  	 * if anyone, is connected to that line
08ffb2229fafc2 Andreas Larsson                  2013-04-17  378  	 */
08ffb2229fafc2 Andreas Larsson                  2013-04-17  379  	irqmap = (s32 *)of_get_property(np, "irqmap", &size);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  380  	if (irqmap) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  381  		if (size < gc->ngpio) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  382  			dev_err(&ofdev->dev,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  383  				"irqmap shorter than ngpio (%d < %d)\n",
08ffb2229fafc2 Andreas Larsson                  2013-04-17  384  				size, gc->ngpio);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  385  			return -EINVAL;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  386  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  387  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  388  		priv->domain = irq_domain_add_linear(np, gc->ngpio,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  389  						     &grgpio_irq_domain_ops,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  390  						     priv);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  391  		if (!priv->domain) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  392  			dev_err(&ofdev->dev, "Could not add irq domain\n");
08ffb2229fafc2 Andreas Larsson                  2013-04-17  393  			return -EINVAL;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  394  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  395  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  396  		for (i = 0; i < gc->ngpio; i++) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  397  			struct grgpio_lirq *lirq;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  398  			int ret;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  399  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  400  			lirq = &priv->lirqs[i];
08ffb2229fafc2 Andreas Larsson                  2013-04-17  401  			lirq->index = irqmap[i];
08ffb2229fafc2 Andreas Larsson                  2013-04-17  402  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  403  			if (lirq->index < 0)
08ffb2229fafc2 Andreas Larsson                  2013-04-17  404  				continue;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  405  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  406  			ret = platform_get_irq(ofdev, lirq->index);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  407  			if (ret <= 0) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  408  				/*
08ffb2229fafc2 Andreas Larsson                  2013-04-17  409  				 * Continue without irq functionality for that
08ffb2229fafc2 Andreas Larsson                  2013-04-17  410  				 * gpio line
08ffb2229fafc2 Andreas Larsson                  2013-04-17  411  				 */
08ffb2229fafc2 Andreas Larsson                  2013-04-17  412  				continue;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  413  			}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  414  			priv->uirqs[lirq->index].uirq = ret;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  415  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  416  	}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  417  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  418  	platform_set_drvdata(ofdev, priv);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  419  
0f4630f3720e7e Linus Walleij                    2015-12-04  420  	err = gpiochip_add_data(gc, priv);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  421  	if (err) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  422  		dev_err(&ofdev->dev, "Could not add gpiochip\n");
879828c6ade916 Axel Lin                         2014-12-20  423  		if (priv->domain)
65fdc966c012b6 Pramod Gurav                     2014-10-02  424  			irq_domain_remove(priv->domain);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  425  		return err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  426  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  427  
08ffb2229fafc2 Andreas Larsson                  2013-04-17  428  	dev_info(&ofdev->dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
08ffb2229fafc2 Andreas Larsson                  2013-04-17 @429  		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  430  
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  431  	return 0;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  432  }
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  433  

:::::: The code at line 429 was first introduced by commit
:::::: 08ffb2229fafc2c3a696b325a74bf4198d6b91d7 gpio: grgpio: Add irq support

:::::: TO: Andreas Larsson <andreas@gaisler.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
