Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D459E56
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjPA0IIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701794962; x=1733330962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytTPHV54DZXtzc2jU5F6IlLSHMZdAUcXZTggD24pp3w=;
  b=hjPA0IIh/JWPIYTUGsdW1vylOMfAdMlN3BTB6JNmrcR92OeAjopyHXky
   3wv2oQyTSUWINpX0O9nQOvyY+DPl8QNvY9cY8LmHfYx9TkgB6FfQE7RI6
   NcYdPg3WM06aLS6qnrjjaVNVwEA/4sf3w+MC3sf6dgeEhAiOpTmbkLlRT
   VVNYIjOeTUALxFIhL1u30sG7PmsaP97tDwJ2kpCBlgNsWB5fJ9xY3Rw/+
   kRwS0FcA/dBdYpQk883tnDavmPotrK2oFneQNjt6qS0ZyquAxOnLf87kE
   WhNYjpUe+IromveUCV8KcupX1wqpKOls8y8fz1/x+siGApclfsEDjAyBK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378947449"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="378947449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747301110"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="747301110"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 08:49:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYbU-0009OB-1O;
	Tue, 05 Dec 2023 16:49:00 +0000
Date: Wed, 6 Dec 2023 00:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202312060005.g7mE2x1L-lkp@intel.com>
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
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: f2ba47e65f3b5642488802a60cb7dd068f425edc Input: add support for Azoteq IQS7210A/7211A/E
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-102-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060005.g7mE2x1L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060005.g7mE2x1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060005.g7mE2x1L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +2547 drivers/input/touchscreen/iqs7211.c

f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2444  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2445  static int iqs7211_probe(struct i2c_client *client)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2446  {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2447  	struct iqs7211_private *iqs7211;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2448  	enum iqs7211_reg_grp_id reg_grp;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2449  	enum iqs7211_dev_id dev_id;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2450  	unsigned long irq_flags;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2451  	bool shared_irq;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2452  	int error, irq;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2453  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2454  	iqs7211 = devm_kzalloc(&client->dev, sizeof(*iqs7211), GFP_KERNEL);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2455  	if (!iqs7211)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2456  		return -ENOMEM;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2457  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2458  	i2c_set_clientdata(client, iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2459  	iqs7211->client = client;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2460  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2461  	INIT_LIST_HEAD(&iqs7211->reg_field_head);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2462  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2463  	if (client->dev.of_node)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2464  		dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2465  	else
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2466  		dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2467  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2468  	shared_irq = iqs7211_devs[dev_id].num_ctx == IQS7211_MAX_CTX;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2469  	iqs7211->dev_desc = &iqs7211_devs[dev_id];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2470  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2471  	/*
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2472  	 * The RDY pin behaves as an interrupt, but must also be polled ahead
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2473  	 * of unsolicited I2C communication. As such, it is first opened as a
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2474  	 * GPIO and then passed to gpiod_to_irq() to register the interrupt.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2475  	 *
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2476  	 * If an extra CTx pin is present, the RDY and MCLR pins are combined
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2477  	 * into a single bidirectional pin. In that case, the platform's GPIO
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2478  	 * must be configured as an open-drain output.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2479  	 */
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2480  	iqs7211->irq_gpio = devm_gpiod_get(&client->dev, "irq",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2481  					   shared_irq ? GPIOD_OUT_LOW
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2482  						      : GPIOD_IN);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2483  	if (IS_ERR(iqs7211->irq_gpio)) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2484  		error = PTR_ERR(iqs7211->irq_gpio);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2485  		dev_err(&client->dev, "Failed to request IRQ GPIO: %d\n",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2486  			error);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2487  		return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2488  	}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2489  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2490  	if (shared_irq) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2491  		iqs7211->reset_gpio = iqs7211->irq_gpio;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2492  	} else {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2493  		iqs7211->reset_gpio = devm_gpiod_get_optional(&client->dev,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2494  							      "reset",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2495  							      GPIOD_OUT_HIGH);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2496  		if (IS_ERR(iqs7211->reset_gpio)) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2497  			error = PTR_ERR(iqs7211->reset_gpio);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2498  			dev_err(&client->dev,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2499  				"Failed to request reset GPIO: %d\n", error);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2500  			return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2501  		}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2502  	}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2503  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2504  	error = iqs7211_start_comms(iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2505  	if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2506  		return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2507  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2508  	for (reg_grp = 0; reg_grp < IQS7211_NUM_REG_GRPS; reg_grp++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2509  		const char *reg_grp_name = iqs7211_reg_grp_names[reg_grp];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2510  		struct fwnode_handle *reg_grp_node;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2511  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2512  		if (reg_grp_name)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2513  			reg_grp_node = device_get_named_child_node(&client->dev,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2514  								   reg_grp_name);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2515  		else
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2516  			reg_grp_node = fwnode_handle_get(dev_fwnode(&client->dev));
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2517  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2518  		if (!reg_grp_node)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2519  			continue;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2520  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2521  		error = iqs7211_parse_reg_grp(iqs7211, reg_grp_node, reg_grp);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2522  		fwnode_handle_put(reg_grp_node);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2523  		if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2524  			return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2525  	}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2526  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2527  	error = iqs7211_register_kp(iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2528  	if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2529  		return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2530  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2531  	error = iqs7211_register_tp(iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2532  	if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2533  		return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2534  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2535  	error = iqs7211_init_device(iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2536  	if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2537  		return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2538  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2539  	irq = gpiod_to_irq(iqs7211->irq_gpio);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2540  	if (irq < 0)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2541  		return irq;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2542  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2543  	irq_flags = gpiod_is_active_low(iqs7211->irq_gpio) ? IRQF_TRIGGER_LOW
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2544  							   : IRQF_TRIGGER_HIGH;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2545  	irq_flags |= IRQF_ONESHOT;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2546  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29 @2547  	error = devm_request_threaded_irq(&client->dev, irq, NULL, iqs7211_irq,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2548  					  irq_flags, client->name, iqs7211);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2549  	if (error)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2550  		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2551  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2552  	return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2553  }
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  2554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
