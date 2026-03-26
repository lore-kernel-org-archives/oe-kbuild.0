Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD2B1DDC1D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489554; cv=none; b=CtvJiHCbWFYTWdYm+k5dGgTPFrH9L/qItErOFuOEnJ4+hBs4Ob8ThGavAbEpQ1bEG1jzZ4CtoYN7uAYHX6WqaRCYUf8bH1kxSbWS7oBzcIg6IyLmxv63Uq7CkamefB4YA09QZCKnvHLv5XIXcHhkvPmaEeLF7PYvuYWlp/j2RFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489554; c=relaxed/simple;
	bh=AHt89KrYHD6sT/W+zawDltWN3sf7C0ok3lWr77xMKGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t042MkHNtMohs7hPXnN/OHolWjuTqwBqBc8RjGMvGYoPIfTYLQGgXggCRJrMLYknqxWU4G6emkFmV6A1/sq8yDl7HCCy8LtdGA3L73fBXp/Oi799myRZKYFZhIb0lkiF+WUM/NgNI75LWRNxgWsYpTRMXHK0oPkLl0oWYIm4wKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7KHzAmE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7KHzAmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774489552; x=1806025552;
  h=date:from:to:cc:subject:message-id;
  bh=AHt89KrYHD6sT/W+zawDltWN3sf7C0ok3lWr77xMKGg=;
  b=Q7KHzAmESdHY4dx/8yzaEK+s9Q4E40QqDXbDwYJgKPCBLWt2DQ+6+CoO
   NSfQD4lMvbm1VVWmlXcJnqzkhI7zhhVndEKPiGVwn7fcrdX/ikFm7GxLV
   5I2nKxnhw8Rr5TtNMCI8EEzvDVM+r4k1+3NxAprOCncK7UFzBXSFMgehz
   QyqsUVGBC0XK/6utaVKdFxvw/BpXaEYVY4AMTfZ8lJaWMZx7/TTIZxsbf
   p6YTG9WXJiSbXBUEZ8WmaPyzC0zbWdB96iZRiOXsiC1XY/Ikxe7HW+Gmx
   HF5jp1/bCkX0as3VU9ItmqFZUdFFERcWKkCZ/8tcfzX3dDPKEUUSHAu8w
   w==;
X-CSE-ConnectionGUID: IT9rUtaJTY68120tks5biw==
X-CSE-MsgGUID: EH+A8XfHRMeHAvOxVxMA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85847045"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="85847045"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 18:45:52 -0700
X-CSE-ConnectionGUID: VwOcZ18hTjOXDqaZM4Ye0Q==
X-CSE-MsgGUID: 3WNyx8DDQIybmZw9tEmSbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="248305493"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 18:45:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ZnA-000000007zt-3BOv;
	Thu, 26 Mar 2026 01:45:48 +0000
Date: Thu, 26 Mar 2026 09:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6345/9273]
 drivers/extcon/extcon-ptn5150.c:355 ptn5150_i2c_probe() warn: 'info->role_sw'
 is an error pointer or valid
Message-ID: <202603260956.RGX4dhHh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xu Yang <xu.yang_2@nxp.com>
CC: Chanwoo Choi <cw00.choi@samsung.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66ba480978ce390e631e870b740a3406e3eb6b01
commit: 9c98fdec70ec15c46610464366d414df1d6a0bee [6345/9273] extcon: ptn5150: Support USB role switch via connector fwnode
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: powerpc64-randconfig-r072-20260326 (https://download.01.org/0day-ci/archive/20260326/202603260956.RGX4dhHh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260956.RGX4dhHh-lkp@intel.com/

smatch warnings:
drivers/extcon/extcon-ptn5150.c:355 ptn5150_i2c_probe() warn: 'info->role_sw' is an error pointer or valid

vim +355 drivers/extcon/extcon-ptn5150.c

782cd939cbe0f56 Li Jun                     2022-04-19  254  
0b0549b6ac72a0f Krzysztof Kozlowski        2020-08-17  255  static int ptn5150_i2c_probe(struct i2c_client *i2c)
4ed754de2d66084 Vijai Kumar K              2019-01-23  256  {
4ed754de2d66084 Vijai Kumar K              2019-01-23  257  	struct device *dev = &i2c->dev;
4ed754de2d66084 Vijai Kumar K              2019-01-23  258  	struct device_node *np = i2c->dev.of_node;
842546c56345eeb Xu Yang                    2025-09-26  259  	struct fwnode_handle *connector;
4ed754de2d66084 Vijai Kumar K              2019-01-23  260  	struct ptn5150_info *info;
4ed754de2d66084 Vijai Kumar K              2019-01-23  261  	int ret;
4ed754de2d66084 Vijai Kumar K              2019-01-23  262  
4ed754de2d66084 Vijai Kumar K              2019-01-23  263  	if (!np)
4ed754de2d66084 Vijai Kumar K              2019-01-23  264  		return -EINVAL;
4ed754de2d66084 Vijai Kumar K              2019-01-23  265  
4ed754de2d66084 Vijai Kumar K              2019-01-23  266  	info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
4ed754de2d66084 Vijai Kumar K              2019-01-23  267  	if (!info)
4ed754de2d66084 Vijai Kumar K              2019-01-23  268  		return -ENOMEM;
4ed754de2d66084 Vijai Kumar K              2019-01-23  269  	i2c_set_clientdata(i2c, info);
4ed754de2d66084 Vijai Kumar K              2019-01-23  270  
4ed754de2d66084 Vijai Kumar K              2019-01-23  271  	info->dev = &i2c->dev;
4ed754de2d66084 Vijai Kumar K              2019-01-23  272  	info->i2c = i2c;
e095882ee28a7b1 Krzysztof Kozlowski        2020-08-17  273  	info->vbus_gpiod = devm_gpiod_get(&i2c->dev, "vbus", GPIOD_OUT_LOW);
3dfed89512d3b65 Wei Yongjun                2019-01-25  274  	if (IS_ERR(info->vbus_gpiod)) {
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  275  		ret = PTR_ERR(info->vbus_gpiod);
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  276  		if (ret == -ENOENT) {
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  277  			dev_info(dev, "No VBUS GPIO, ignoring VBUS control\n");
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  278  			info->vbus_gpiod = NULL;
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  279  		} else {
611e92a0a3dc654 Andy Shevchenko            2020-08-26  280  			return dev_err_probe(dev, ret, "failed to get VBUS GPIO\n");
fbaf3b67d4d2764 Krzysztof Kozlowski        2020-08-17  281  		}
4ed754de2d66084 Vijai Kumar K              2019-01-23  282  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  283  
4ed754de2d66084 Vijai Kumar K              2019-01-23  284  	mutex_init(&info->mutex);
4ed754de2d66084 Vijai Kumar K              2019-01-23  285  
4ed754de2d66084 Vijai Kumar K              2019-01-23  286  	INIT_WORK(&info->irq_work, ptn5150_irq_work);
4ed754de2d66084 Vijai Kumar K              2019-01-23  287  
4ed754de2d66084 Vijai Kumar K              2019-01-23  288  	info->regmap = devm_regmap_init_i2c(i2c, &ptn5150_regmap_config);
4ed754de2d66084 Vijai Kumar K              2019-01-23  289  	if (IS_ERR(info->regmap)) {
611e92a0a3dc654 Andy Shevchenko            2020-08-26  290  		return dev_err_probe(info->dev, PTR_ERR(info->regmap),
611e92a0a3dc654 Andy Shevchenko            2020-08-26  291  				     "failed to allocate register map\n");
4ed754de2d66084 Vijai Kumar K              2019-01-23  292  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  293  
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  294  	if (i2c->irq > 0) {
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  295  		info->irq = i2c->irq;
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  296  	} else {
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  297  		info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  298  		if (IS_ERR(info->int_gpiod)) {
611e92a0a3dc654 Andy Shevchenko            2020-08-26  299  			return dev_err_probe(dev, PTR_ERR(info->int_gpiod),
611e92a0a3dc654 Andy Shevchenko            2020-08-26  300  					     "failed to get INT GPIO\n");
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  301  		}
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  302  
4ed754de2d66084 Vijai Kumar K              2019-01-23  303  		info->irq = gpiod_to_irq(info->int_gpiod);
4ed754de2d66084 Vijai Kumar K              2019-01-23  304  		if (info->irq < 0) {
4ed754de2d66084 Vijai Kumar K              2019-01-23  305  			dev_err(dev, "failed to get INTB IRQ\n");
4ed754de2d66084 Vijai Kumar K              2019-01-23  306  			return info->irq;
4ed754de2d66084 Vijai Kumar K              2019-01-23  307  		}
45ce36f5d262d73 Krzysztof Kozlowski        2020-08-17  308  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  309  
4ed754de2d66084 Vijai Kumar K              2019-01-23  310  	ret = devm_request_threaded_irq(dev, info->irq, NULL,
4ed754de2d66084 Vijai Kumar K              2019-01-23  311  					ptn5150_irq_handler,
4ed754de2d66084 Vijai Kumar K              2019-01-23  312  					IRQF_TRIGGER_FALLING |
4ed754de2d66084 Vijai Kumar K              2019-01-23  313  					IRQF_ONESHOT,
4ed754de2d66084 Vijai Kumar K              2019-01-23  314  					i2c->name, info);
4ed754de2d66084 Vijai Kumar K              2019-01-23  315  	if (ret < 0) {
4ed754de2d66084 Vijai Kumar K              2019-01-23  316  		dev_err(dev, "failed to request handler for INTB IRQ\n");
4ed754de2d66084 Vijai Kumar K              2019-01-23  317  		return ret;
4ed754de2d66084 Vijai Kumar K              2019-01-23  318  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  319  
4ed754de2d66084 Vijai Kumar K              2019-01-23  320  	/* Allocate extcon device */
4ed754de2d66084 Vijai Kumar K              2019-01-23  321  	info->edev = devm_extcon_dev_allocate(info->dev, ptn5150_extcon_cable);
4ed754de2d66084 Vijai Kumar K              2019-01-23  322  	if (IS_ERR(info->edev)) {
4ed754de2d66084 Vijai Kumar K              2019-01-23  323  		dev_err(info->dev, "failed to allocate memory for extcon\n");
4ed754de2d66084 Vijai Kumar K              2019-01-23  324  		return -ENOMEM;
4ed754de2d66084 Vijai Kumar K              2019-01-23  325  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  326  
4ed754de2d66084 Vijai Kumar K              2019-01-23  327  	/* Register extcon device */
4ed754de2d66084 Vijai Kumar K              2019-01-23  328  	ret = devm_extcon_dev_register(info->dev, info->edev);
4ed754de2d66084 Vijai Kumar K              2019-01-23  329  	if (ret) {
4ed754de2d66084 Vijai Kumar K              2019-01-23  330  		dev_err(info->dev, "failed to register extcon device\n");
4ed754de2d66084 Vijai Kumar K              2019-01-23  331  		return ret;
4ed754de2d66084 Vijai Kumar K              2019-01-23  332  	}
4ed754de2d66084 Vijai Kumar K              2019-01-23  333  
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  334  	extcon_set_property_capability(info->edev, EXTCON_USB,
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  335  					EXTCON_PROP_USB_VBUS);
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  336  	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  337  					EXTCON_PROP_USB_VBUS);
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  338  	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  339  					EXTCON_PROP_USB_TYPEC_POLARITY);
ea6a95d09c1bd28 Ramuthevar Vadivel Murugan 2020-08-27  340  
4ed754de2d66084 Vijai Kumar K              2019-01-23  341  	/* Initialize PTN5150 device and print vendor id and version id */
4ed754de2d66084 Vijai Kumar K              2019-01-23  342  	ret = ptn5150_init_dev_type(info);
4ed754de2d66084 Vijai Kumar K              2019-01-23  343  	if (ret)
4ed754de2d66084 Vijai Kumar K              2019-01-23  344  		return -EINVAL;
4ed754de2d66084 Vijai Kumar K              2019-01-23  345  
842546c56345eeb Xu Yang                    2025-09-26  346  	connector = device_get_named_child_node(dev, "connector");
842546c56345eeb Xu Yang                    2025-09-26  347  	if (connector) {
842546c56345eeb Xu Yang                    2025-09-26  348  		info->orient_sw = fwnode_typec_switch_get(connector);
842546c56345eeb Xu Yang                    2025-09-26  349  		if (IS_ERR(info->orient_sw))
842546c56345eeb Xu Yang                    2025-09-26  350  			return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
842546c56345eeb Xu Yang                    2025-09-26  351  					"failed to get orientation switch\n");
842546c56345eeb Xu Yang                    2025-09-26  352  	}
842546c56345eeb Xu Yang                    2025-09-26  353  
1bfcaa570081111 Li Jun                     2022-04-19  354  	info->role_sw = usb_role_switch_get(info->dev);
9c98fdec70ec15c Xu Yang                    2025-09-26 @355  	if (!info->role_sw && connector)
9c98fdec70ec15c Xu Yang                    2025-09-26  356  		info->role_sw = fwnode_usb_role_switch_get(connector);
1bfcaa570081111 Li Jun                     2022-04-19  357  	if (IS_ERR(info->role_sw))
1bfcaa570081111 Li Jun                     2022-04-19  358  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
1bfcaa570081111 Li Jun                     2022-04-19  359  				     "failed to get role switch\n");
1bfcaa570081111 Li Jun                     2022-04-19  360  
782cd939cbe0f56 Li Jun                     2022-04-19  361  	ret = devm_add_action_or_reset(dev, ptn5150_work_sync_and_put, info);
782cd939cbe0f56 Li Jun                     2022-04-19  362  	if (ret)
782cd939cbe0f56 Li Jun                     2022-04-19  363  		return ret;
782cd939cbe0f56 Li Jun                     2022-04-19  364  
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  365  	/*
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  366  	 * Update current extcon state if for example OTG connection was there
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  367  	 * before the probe
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  368  	 */
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  369  	mutex_lock(&info->mutex);
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  370  	ptn5150_check_state(info);
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  371  	mutex_unlock(&info->mutex);
85256f611f664b0 Krzysztof Kozlowski        2020-08-17  372  
4ed754de2d66084 Vijai Kumar K              2019-01-23  373  	return 0;
4ed754de2d66084 Vijai Kumar K              2019-01-23  374  }
4ed754de2d66084 Vijai Kumar K              2019-01-23  375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
