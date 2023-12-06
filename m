Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CFD70969
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HstNXvmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701900906; x=1733436906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EPhg2msNqES4qgnCTUGYNztVa93Dc8Gtph0r2RhHED4=;
  b=HstNXvmA5nPz34x2QUlZtxahLM6H9ZDp5CYwCMwOR1FHu1TfyD88uX5w
   qDGqQedHUFYKGqbdL7k0RDuFN85F8K6OEIGh6rJglLBNqMHAqEJItxoBd
   uhoY9u2VvUUsNg8oBblFhA6hez43XUfgYOSwQw3Ygzu/7T+pwDv29oQNA
   D5LM7x1VyFiPxPWJzzI7NYQM3YWxSQfP/rLcFhrmJ7evsfrXgaAyezVRU
   Tn13y/9rBuX6WAxWNZI1dowMxciNzdrE5dpCUxzQTPRxtd8HSBMc/Oc9n
   qLlCwkd8R/Pd93rz8zh3Vtc0DMaxjaTB34Rvabze2R4IsWrhL0HyN7z5L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374308119"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="374308119"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 14:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837470012"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837470012"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2023 14:15:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB0AY-000BU8-1z;
	Wed, 06 Dec 2023 22:15:02 +0000
Date: Thu, 7 Dec 2023 06:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
Message-ID: <202312070608.vxtNAYhk-lkp@intel.com>
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
In-Reply-To: <20231204140505.2838916-4-kamel.bouhara@bootlin.com>
References: <20231204140505.2838916-4-kamel.bouhara@bootlin.com>
TO: Kamel Bouhara <kamel.bouhara@bootlin.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Henrik Rydberg <rydberg@bitmath.org>
TO: linux-input@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: Marco Felsch <m.felsch@pengutronix.de>
TO: Jeff LaBundy <jeff@labundy.com>
CC: catalin.popescu@leica-geosystems.com
CC: mark.satterthwaite@touchnetix.com
CC: bartp@baasheep.co.uk
CC: hannah.rossiter@touchnetix.com
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Gregory Clement <gregory.clement@bootlin.com>
CC: bsp-development.geo@leica-geosystems.com
CC: Kamel Bouhara <kamel.bouhara@bootlin.com>

Hi Kamel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next linus/master krzk-dt/for-next v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamel-Bouhara/dt-bindings-vendor-prefixes-Add-TouchNetix-AS/20231204-222017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231204140505.2838916-4-kamel.bouhara%40bootlin.com
patch subject: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312070608.vxtNAYhk-lkp@intel.com/

smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:565 axiom_i2c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +565 drivers/input/touchscreen/touchnetix_axiom.c

a9f3450f06a026 Kamel Bouhara 2023-12-04  535  
a9f3450f06a026 Kamel Bouhara 2023-12-04  536  static int axiom_i2c_probe(struct i2c_client *client)
a9f3450f06a026 Kamel Bouhara 2023-12-04  537  {
a9f3450f06a026 Kamel Bouhara 2023-12-04  538  	struct device *dev = &client->dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  539  	struct input_dev *input_dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  540  	struct axiom_data *ts;
a9f3450f06a026 Kamel Bouhara 2023-12-04  541  	u32 startup_delay_ms;
a9f3450f06a026 Kamel Bouhara 2023-12-04  542  	u32 poll_interval;
a9f3450f06a026 Kamel Bouhara 2023-12-04  543  	int target;
a9f3450f06a026 Kamel Bouhara 2023-12-04  544  	int error;
a9f3450f06a026 Kamel Bouhara 2023-12-04  545  
a9f3450f06a026 Kamel Bouhara 2023-12-04  546  	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
a9f3450f06a026 Kamel Bouhara 2023-12-04  547  	if (!ts)
a9f3450f06a026 Kamel Bouhara 2023-12-04  548  		return -ENOMEM;
a9f3450f06a026 Kamel Bouhara 2023-12-04  549  
a9f3450f06a026 Kamel Bouhara 2023-12-04  550  	ts->client = client;
a9f3450f06a026 Kamel Bouhara 2023-12-04  551  	i2c_set_clientdata(client, ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  552  	ts->dev = dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  553  
a9f3450f06a026 Kamel Bouhara 2023-12-04  554  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
a9f3450f06a026 Kamel Bouhara 2023-12-04  555  	if (IS_ERR(ts->reset_gpio))
a9f3450f06a026 Kamel Bouhara 2023-12-04  556  		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get reset GPIO\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  557  
a9f3450f06a026 Kamel Bouhara 2023-12-04  558  	if (ts->reset_gpio)
a9f3450f06a026 Kamel Bouhara 2023-12-04  559  		axiom_reset(ts->reset_gpio);
a9f3450f06a026 Kamel Bouhara 2023-12-04  560  
a9f3450f06a026 Kamel Bouhara 2023-12-04  561  	ts->vddi = devm_regulator_get_optional(dev, "VDDI");
a9f3450f06a026 Kamel Bouhara 2023-12-04  562  	if (!IS_ERR(ts->vddi)) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  563  		error = regulator_enable(ts->vddi);
a9f3450f06a026 Kamel Bouhara 2023-12-04  564  		if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04 @565  			return dev_err_probe(&client->dev, PTR_ERR(ts->vddi),
a9f3450f06a026 Kamel Bouhara 2023-12-04  566  					     "Failed to enable VDDI regulator\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  567  	}
a9f3450f06a026 Kamel Bouhara 2023-12-04  568  
a9f3450f06a026 Kamel Bouhara 2023-12-04  569  	ts->vdda = devm_regulator_get_optional(dev, "VDDA");
a9f3450f06a026 Kamel Bouhara 2023-12-04  570  	if (!IS_ERR(ts->vdda)) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  571  		error = regulator_enable(ts->vdda);
a9f3450f06a026 Kamel Bouhara 2023-12-04  572  		if (error) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  573  			dev_err(dev, "Failed to get VDDA regulator\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  574  			regulator_disable(ts->vddi);
a9f3450f06a026 Kamel Bouhara 2023-12-04  575  			return error;
a9f3450f06a026 Kamel Bouhara 2023-12-04  576  		}
a9f3450f06a026 Kamel Bouhara 2023-12-04  577  		if (!device_property_read_u32(dev, "startup-time-ms", &startup_delay_ms))
a9f3450f06a026 Kamel Bouhara 2023-12-04  578  			msleep(startup_delay_ms);
a9f3450f06a026 Kamel Bouhara 2023-12-04  579  	}
a9f3450f06a026 Kamel Bouhara 2023-12-04  580  
a9f3450f06a026 Kamel Bouhara 2023-12-04  581  	error = axiom_discover(ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  582  	if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04  583  		return dev_err_probe(dev, error, "Failed touchscreen discover\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  584  
a9f3450f06a026 Kamel Bouhara 2023-12-04  585  	input_dev = devm_input_allocate_device(ts->dev);
a9f3450f06a026 Kamel Bouhara 2023-12-04  586  	if (!input_dev)
a9f3450f06a026 Kamel Bouhara 2023-12-04  587  		return -ENOMEM;
a9f3450f06a026 Kamel Bouhara 2023-12-04  588  
a9f3450f06a026 Kamel Bouhara 2023-12-04  589  	input_dev->name = "TouchNetix axiom Touchscreen";
a9f3450f06a026 Kamel Bouhara 2023-12-04  590  	input_dev->phys = "input/axiom_ts";
a9f3450f06a026 Kamel Bouhara 2023-12-04  591  
a9f3450f06a026 Kamel Bouhara 2023-12-04  592  	/* Single Touch */
a9f3450f06a026 Kamel Bouhara 2023-12-04  593  	input_set_abs_params(input_dev, ABS_X, 0, 65535, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  594  	input_set_abs_params(input_dev, ABS_Y, 0, 65535, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  595  
a9f3450f06a026 Kamel Bouhara 2023-12-04  596  	/* Multi Touch */
a9f3450f06a026 Kamel Bouhara 2023-12-04  597  	/* Min, Max, Fuzz (expected noise in px, try 4?) and Flat */
a9f3450f06a026 Kamel Bouhara 2023-12-04  598  	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 65535, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  599  	/* Min, Max, Fuzz (expected noise in px, try 4?) and Flat */
a9f3450f06a026 Kamel Bouhara 2023-12-04  600  	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 65535, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  601  	input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  602  	input_set_abs_params(input_dev, ABS_MT_DISTANCE, 0, 127, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  603  	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 127, 0, 0);
a9f3450f06a026 Kamel Bouhara 2023-12-04  604  
a9f3450f06a026 Kamel Bouhara 2023-12-04  605  	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
a9f3450f06a026 Kamel Bouhara 2023-12-04  606  
a9f3450f06a026 Kamel Bouhara 2023-12-04  607  	/* Registers the axiom device as a touchscreen instead of a mouse pointer */
a9f3450f06a026 Kamel Bouhara 2023-12-04  608  	error = input_mt_init_slots(input_dev, AXIOM_U41_MAX_TARGETS, INPUT_MT_DIRECT);
a9f3450f06a026 Kamel Bouhara 2023-12-04  609  	if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04  610  		return error;
a9f3450f06a026 Kamel Bouhara 2023-12-04  611  
a9f3450f06a026 Kamel Bouhara 2023-12-04  612  	/* Enables the raw data for up to 4 force channels to be sent to the input subsystem */
a9f3450f06a026 Kamel Bouhara 2023-12-04  613  	set_bit(EV_REL, input_dev->evbit);
a9f3450f06a026 Kamel Bouhara 2023-12-04  614  	set_bit(EV_MSC, input_dev->evbit);
a9f3450f06a026 Kamel Bouhara 2023-12-04  615  	/* Declare that we support "RAW" Miscellaneous events */
a9f3450f06a026 Kamel Bouhara 2023-12-04  616  	set_bit(MSC_RAW, input_dev->mscbit);
a9f3450f06a026 Kamel Bouhara 2023-12-04  617  
a9f3450f06a026 Kamel Bouhara 2023-12-04  618  	ts->input_dev = input_dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  619  	input_set_drvdata(ts->input_dev, ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  620  
a9f3450f06a026 Kamel Bouhara 2023-12-04  621  	/* Ensure that all reports are initialised to not be present. */
a9f3450f06a026 Kamel Bouhara 2023-12-04  622  	for (target = 0; target < AXIOM_U41_MAX_TARGETS; target++)
a9f3450f06a026 Kamel Bouhara 2023-12-04  623  		ts->targets[target].state = AXIOM_TARGET_STATE_NOT_PRESENT;
a9f3450f06a026 Kamel Bouhara 2023-12-04  624  
a9f3450f06a026 Kamel Bouhara 2023-12-04  625  	error = input_register_device(input_dev);
a9f3450f06a026 Kamel Bouhara 2023-12-04  626  	if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04  627  		return dev_err_probe(ts->dev, error,
a9f3450f06a026 Kamel Bouhara 2023-12-04  628  				     "Could not register with Input Sub-system.\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  629  
a9f3450f06a026 Kamel Bouhara 2023-12-04  630  	error = devm_request_threaded_irq(dev, client->irq, NULL,
a9f3450f06a026 Kamel Bouhara 2023-12-04  631  					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  632  	if (error < 0) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  633  		dev_warn(dev, "Request irq failed, falling back to polling mode");
a9f3450f06a026 Kamel Bouhara 2023-12-04  634  
a9f3450f06a026 Kamel Bouhara 2023-12-04  635  		error = input_setup_polling(input_dev, axiom_i2c_poll);
a9f3450f06a026 Kamel Bouhara 2023-12-04  636  		if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04  637  			return dev_err_probe(ts->dev, error, "Unable to set up polling mode\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  638  
a9f3450f06a026 Kamel Bouhara 2023-12-04  639  		if (!device_property_read_u32(ts->dev, "poll-interval", &poll_interval))
a9f3450f06a026 Kamel Bouhara 2023-12-04  640  			input_set_poll_interval(input_dev, poll_interval);
a9f3450f06a026 Kamel Bouhara 2023-12-04  641  		else
a9f3450f06a026 Kamel Bouhara 2023-12-04  642  			input_set_poll_interval(input_dev, POLL_INTERVAL_DEFAULT_MS);
a9f3450f06a026 Kamel Bouhara 2023-12-04  643  	}
a9f3450f06a026 Kamel Bouhara 2023-12-04  644  
a9f3450f06a026 Kamel Bouhara 2023-12-04  645  	return 0;
a9f3450f06a026 Kamel Bouhara 2023-12-04  646  }
a9f3450f06a026 Kamel Bouhara 2023-12-04  647  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
