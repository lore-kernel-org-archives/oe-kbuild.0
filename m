Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067420D500
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746915757; cv=none; b=YRWP1BdXSUZGoIoyywWHXNQmWeW+wnCxbEY75LOChSFo2mQDhAnqsV9NT2JC6NfzVCIQ+4b9vZvItqnWBSpJwY15kfO8iHk6d7TvAr3F84b6HGx9fa0yIszgRnnyTp8AnBgxY0VUnX+BskxHpPXL4y01uJxRdFySvZAq5k8y6Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746915757; c=relaxed/simple;
	bh=JqQF8EuG8eqCuIafslaoD6Jap3jskctqIYCLz+yd1u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiutEc/cUPL+ndAlGU3HKcBdRizCP1mgCS9np2PSI2tiCvIBZlSk0a66eDpN+pHBn2YvzybXnkwfhlO0pr7AdfEXEMjuGFx8pLj/6mxHnptQ4KrwIsJkG8URH31veRP4/lTVaQv7xPFHQQABCivIAq6ewkzoca6ET/36snPwRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOr3T49l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOr3T49l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746915752; x=1778451752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqQF8EuG8eqCuIafslaoD6Jap3jskctqIYCLz+yd1u8=;
  b=kOr3T49lx7H/aeRKy2GBtCkh1Kz3GYrz+guvWJXeFEcTzYjH+ktfuzC5
   0nN7OpnwI8FtXXta/55H98eIWvaBF1RbSdUIUVKrKj/nAV+DqENOe88XO
   eQk1Z7m8lH+i210YBt2odClpr8yUyHypHa6zTHdcINi1HvCyk7yYU7y+/
   yWV43SeIgM9TaVMO/STfHRrgeoxJ3ZGIpyq9eeYOgtuMpJ5F2Fzs7miL1
   a8vaLwtsIxNtTO7gJlOejmNUE0eJyaPMw+NWsXgiwLFxG0PRrC23Cbt0V
   TDiaefmOAww/of2+iOFbiz4rbLm+g2rSOnx2wQKWAeoEIpGV7CyYuB7Ya
   A==;
X-CSE-ConnectionGUID: wGP35DahQEi5rAC/+p9fNA==
X-CSE-MsgGUID: FPlcQMtpSdmL0XvMXk1zSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="66138905"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="66138905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 15:22:30 -0700
X-CSE-ConnectionGUID: LCrHjxqLQ3GwDeSBpKWwSw==
X-CSE-MsgGUID: NiHuMjHISk6oKBH3y3pEBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141728527"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2025 15:22:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDsaQ-000DR3-1t;
	Sat, 10 May 2025 22:22:26 +0000
Date: Sun, 11 May 2025 06:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/4] extcon: ptn5150: Support USB role switch via
 connector fwnode
Message-ID: <202505110610.dq4YadJk-lkp@intel.com>
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
In-Reply-To: <20250509064526.3767729-4-xu.yang_2@nxp.com>
References: <20250509064526.3767729-4-xu.yang_2@nxp.com>
TO: Xu Yang <xu.yang_2@nxp.com>
TO: krzk@kernel.org
TO: myungjoo.ham@samsung.com
TO: cw00.choi@samsung.com
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: gregkh@linuxfoundation.org
CC: swboyd@chromium.org
CC: heikki.krogerus@linux.intel.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: jun.li@nxp.com

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chanwoo-extcon/extcon-next]
[also build test WARNING on krzk-dt/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.15-rc5 next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/dt-bindings-extcon-ptn5150-Allow-connector-node-to-present/20250509-144735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
patch link:    https://lore.kernel.org/r/20250509064526.3767729-4-xu.yang_2%40nxp.com
patch subject: [PATCH v3 4/4] extcon: ptn5150: Support USB role switch via connector fwnode
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110610.dq4YadJk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505110610.dq4YadJk-lkp@intel.com/

smatch warnings:
drivers/extcon/extcon-ptn5150.c:355 ptn5150_i2c_probe() warn: 'info->role_sw' is an error pointer or valid

vim +355 drivers/extcon/extcon-ptn5150.c

782cd939cbe0f5 Li Jun                     2022-04-19  254  
0b0549b6ac72a0 Krzysztof Kozlowski        2020-08-17  255  static int ptn5150_i2c_probe(struct i2c_client *i2c)
4ed754de2d6608 Vijai Kumar K              2019-01-23  256  {
4ed754de2d6608 Vijai Kumar K              2019-01-23  257  	struct device *dev = &i2c->dev;
4ed754de2d6608 Vijai Kumar K              2019-01-23  258  	struct device_node *np = i2c->dev.of_node;
c2171d3b6f7fdd Xu Yang                    2025-05-09  259  	struct fwnode_handle *connector;
4ed754de2d6608 Vijai Kumar K              2019-01-23  260  	struct ptn5150_info *info;
4ed754de2d6608 Vijai Kumar K              2019-01-23  261  	int ret;
4ed754de2d6608 Vijai Kumar K              2019-01-23  262  
4ed754de2d6608 Vijai Kumar K              2019-01-23  263  	if (!np)
4ed754de2d6608 Vijai Kumar K              2019-01-23  264  		return -EINVAL;
4ed754de2d6608 Vijai Kumar K              2019-01-23  265  
4ed754de2d6608 Vijai Kumar K              2019-01-23  266  	info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
4ed754de2d6608 Vijai Kumar K              2019-01-23  267  	if (!info)
4ed754de2d6608 Vijai Kumar K              2019-01-23  268  		return -ENOMEM;
4ed754de2d6608 Vijai Kumar K              2019-01-23  269  	i2c_set_clientdata(i2c, info);
4ed754de2d6608 Vijai Kumar K              2019-01-23  270  
4ed754de2d6608 Vijai Kumar K              2019-01-23  271  	info->dev = &i2c->dev;
4ed754de2d6608 Vijai Kumar K              2019-01-23  272  	info->i2c = i2c;
e095882ee28a7b Krzysztof Kozlowski        2020-08-17  273  	info->vbus_gpiod = devm_gpiod_get(&i2c->dev, "vbus", GPIOD_OUT_LOW);
3dfed89512d3b6 Wei Yongjun                2019-01-25  274  	if (IS_ERR(info->vbus_gpiod)) {
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  275  		ret = PTR_ERR(info->vbus_gpiod);
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  276  		if (ret == -ENOENT) {
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  277  			dev_info(dev, "No VBUS GPIO, ignoring VBUS control\n");
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  278  			info->vbus_gpiod = NULL;
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  279  		} else {
611e92a0a3dc65 Andy Shevchenko            2020-08-26  280  			return dev_err_probe(dev, ret, "failed to get VBUS GPIO\n");
fbaf3b67d4d276 Krzysztof Kozlowski        2020-08-17  281  		}
4ed754de2d6608 Vijai Kumar K              2019-01-23  282  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  283  
4ed754de2d6608 Vijai Kumar K              2019-01-23  284  	mutex_init(&info->mutex);
4ed754de2d6608 Vijai Kumar K              2019-01-23  285  
4ed754de2d6608 Vijai Kumar K              2019-01-23  286  	INIT_WORK(&info->irq_work, ptn5150_irq_work);
4ed754de2d6608 Vijai Kumar K              2019-01-23  287  
4ed754de2d6608 Vijai Kumar K              2019-01-23  288  	info->regmap = devm_regmap_init_i2c(i2c, &ptn5150_regmap_config);
4ed754de2d6608 Vijai Kumar K              2019-01-23  289  	if (IS_ERR(info->regmap)) {
611e92a0a3dc65 Andy Shevchenko            2020-08-26  290  		return dev_err_probe(info->dev, PTR_ERR(info->regmap),
611e92a0a3dc65 Andy Shevchenko            2020-08-26  291  				     "failed to allocate register map\n");
4ed754de2d6608 Vijai Kumar K              2019-01-23  292  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  293  
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  294  	if (i2c->irq > 0) {
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  295  		info->irq = i2c->irq;
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  296  	} else {
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  297  		info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  298  		if (IS_ERR(info->int_gpiod)) {
611e92a0a3dc65 Andy Shevchenko            2020-08-26  299  			return dev_err_probe(dev, PTR_ERR(info->int_gpiod),
611e92a0a3dc65 Andy Shevchenko            2020-08-26  300  					     "failed to get INT GPIO\n");
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  301  		}
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  302  
4ed754de2d6608 Vijai Kumar K              2019-01-23  303  		info->irq = gpiod_to_irq(info->int_gpiod);
4ed754de2d6608 Vijai Kumar K              2019-01-23  304  		if (info->irq < 0) {
4ed754de2d6608 Vijai Kumar K              2019-01-23  305  			dev_err(dev, "failed to get INTB IRQ\n");
4ed754de2d6608 Vijai Kumar K              2019-01-23  306  			return info->irq;
4ed754de2d6608 Vijai Kumar K              2019-01-23  307  		}
45ce36f5d262d7 Krzysztof Kozlowski        2020-08-17  308  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  309  
4ed754de2d6608 Vijai Kumar K              2019-01-23  310  	ret = devm_request_threaded_irq(dev, info->irq, NULL,
4ed754de2d6608 Vijai Kumar K              2019-01-23  311  					ptn5150_irq_handler,
4ed754de2d6608 Vijai Kumar K              2019-01-23  312  					IRQF_TRIGGER_FALLING |
4ed754de2d6608 Vijai Kumar K              2019-01-23  313  					IRQF_ONESHOT,
4ed754de2d6608 Vijai Kumar K              2019-01-23  314  					i2c->name, info);
4ed754de2d6608 Vijai Kumar K              2019-01-23  315  	if (ret < 0) {
4ed754de2d6608 Vijai Kumar K              2019-01-23  316  		dev_err(dev, "failed to request handler for INTB IRQ\n");
4ed754de2d6608 Vijai Kumar K              2019-01-23  317  		return ret;
4ed754de2d6608 Vijai Kumar K              2019-01-23  318  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  319  
4ed754de2d6608 Vijai Kumar K              2019-01-23  320  	/* Allocate extcon device */
4ed754de2d6608 Vijai Kumar K              2019-01-23  321  	info->edev = devm_extcon_dev_allocate(info->dev, ptn5150_extcon_cable);
4ed754de2d6608 Vijai Kumar K              2019-01-23  322  	if (IS_ERR(info->edev)) {
4ed754de2d6608 Vijai Kumar K              2019-01-23  323  		dev_err(info->dev, "failed to allocate memory for extcon\n");
4ed754de2d6608 Vijai Kumar K              2019-01-23  324  		return -ENOMEM;
4ed754de2d6608 Vijai Kumar K              2019-01-23  325  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  326  
4ed754de2d6608 Vijai Kumar K              2019-01-23  327  	/* Register extcon device */
4ed754de2d6608 Vijai Kumar K              2019-01-23  328  	ret = devm_extcon_dev_register(info->dev, info->edev);
4ed754de2d6608 Vijai Kumar K              2019-01-23  329  	if (ret) {
4ed754de2d6608 Vijai Kumar K              2019-01-23  330  		dev_err(info->dev, "failed to register extcon device\n");
4ed754de2d6608 Vijai Kumar K              2019-01-23  331  		return ret;
4ed754de2d6608 Vijai Kumar K              2019-01-23  332  	}
4ed754de2d6608 Vijai Kumar K              2019-01-23  333  
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  334  	extcon_set_property_capability(info->edev, EXTCON_USB,
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  335  					EXTCON_PROP_USB_VBUS);
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  336  	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  337  					EXTCON_PROP_USB_VBUS);
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  338  	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  339  					EXTCON_PROP_USB_TYPEC_POLARITY);
ea6a95d09c1bd2 Ramuthevar Vadivel Murugan 2020-08-27  340  
4ed754de2d6608 Vijai Kumar K              2019-01-23  341  	/* Initialize PTN5150 device and print vendor id and version id */
4ed754de2d6608 Vijai Kumar K              2019-01-23  342  	ret = ptn5150_init_dev_type(info);
4ed754de2d6608 Vijai Kumar K              2019-01-23  343  	if (ret)
4ed754de2d6608 Vijai Kumar K              2019-01-23  344  		return -EINVAL;
4ed754de2d6608 Vijai Kumar K              2019-01-23  345  
c2171d3b6f7fdd Xu Yang                    2025-05-09  346  	connector = device_get_named_child_node(dev, "connector");
c2171d3b6f7fdd Xu Yang                    2025-05-09  347  	if (connector) {
c2171d3b6f7fdd Xu Yang                    2025-05-09  348  		info->orient_sw = fwnode_typec_switch_get(connector);
c2171d3b6f7fdd Xu Yang                    2025-05-09  349  		if (IS_ERR(info->orient_sw))
c2171d3b6f7fdd Xu Yang                    2025-05-09  350  			return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
c2171d3b6f7fdd Xu Yang                    2025-05-09  351  					"failed to get orientation switch\n");
c2171d3b6f7fdd Xu Yang                    2025-05-09  352  	}
c2171d3b6f7fdd Xu Yang                    2025-05-09  353  
1bfcaa57008111 Li Jun                     2022-04-19  354  	info->role_sw = usb_role_switch_get(info->dev);
bb7b9f2f9c87f5 Xu Yang                    2025-05-09 @355  	if (!info->role_sw && connector)
bb7b9f2f9c87f5 Xu Yang                    2025-05-09  356  		info->role_sw = fwnode_usb_role_switch_get(connector);
1bfcaa57008111 Li Jun                     2022-04-19  357  	if (IS_ERR(info->role_sw))
1bfcaa57008111 Li Jun                     2022-04-19  358  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
1bfcaa57008111 Li Jun                     2022-04-19  359  				     "failed to get role switch\n");
1bfcaa57008111 Li Jun                     2022-04-19  360  
782cd939cbe0f5 Li Jun                     2022-04-19  361  	ret = devm_add_action_or_reset(dev, ptn5150_work_sync_and_put, info);
782cd939cbe0f5 Li Jun                     2022-04-19  362  	if (ret)
782cd939cbe0f5 Li Jun                     2022-04-19  363  		return ret;
782cd939cbe0f5 Li Jun                     2022-04-19  364  
85256f611f664b Krzysztof Kozlowski        2020-08-17  365  	/*
85256f611f664b Krzysztof Kozlowski        2020-08-17  366  	 * Update current extcon state if for example OTG connection was there
85256f611f664b Krzysztof Kozlowski        2020-08-17  367  	 * before the probe
85256f611f664b Krzysztof Kozlowski        2020-08-17  368  	 */
85256f611f664b Krzysztof Kozlowski        2020-08-17  369  	mutex_lock(&info->mutex);
85256f611f664b Krzysztof Kozlowski        2020-08-17  370  	ptn5150_check_state(info);
85256f611f664b Krzysztof Kozlowski        2020-08-17  371  	mutex_unlock(&info->mutex);
85256f611f664b Krzysztof Kozlowski        2020-08-17  372  
4ed754de2d6608 Vijai Kumar K              2019-01-23  373  	return 0;
4ed754de2d6608 Vijai Kumar K              2019-01-23  374  }
4ed754de2d6608 Vijai Kumar K              2019-01-23  375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
