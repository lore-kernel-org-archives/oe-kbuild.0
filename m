Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F922068F
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834361; cv=none; b=UpnFUton+lisHrYWV3GNTleU3LrzIA73diERLBPnjLOJ9zslEGEkHq56rOIhCmdR84ESGukUOmXcdkifkqg+WyogviCYLlmOd5wL93yFbPF3iOWaUz4fUnLQLqUlzJieEn6vC0Nbd4JJDqwQ5sQYG4C6ntsbXhvl8+xn6KXvrOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834361; c=relaxed/simple;
	bh=3RbHL7y+GV3XGzDyXXGMqJ4SjGc5djQywZAB1Q14nGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkqleVQNdJfAGVacPRquuOXhfuUP+i4qapNo3BjB7C4uH305eEux2j6wl5v+5+kZA8IrXXgw0bDiaS6b+TG9qJ58+OTN7CyRaq38JYaEYvOGNK0adfoXvAPvhzgKWfMeW87Z/vxnB1Vn6AO2CFInQSZTCk1L4o4Cs19TFA5s1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjQM2lJS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjQM2lJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749834359; x=1781370359;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3RbHL7y+GV3XGzDyXXGMqJ4SjGc5djQywZAB1Q14nGY=;
  b=TjQM2lJSEsJ6bTjOBU15dpswPS0U/GJrQjI+hrGJD1q8yRfixArtVNUV
   3Rz9+CfbdxVt7hoUQhtY7kgqYQ3TUIkq+xIeDFHhLtK1G5q63J7eHntMH
   Ti6BsyuveBmWytZzu9sy5PxZvMXmaSoGHWx4sS87KsyTiFOBUF0Zmf3bD
   VhNrB5rOzYw66gVIZXGDXT4DM67wkkpUB2xMg6SLufJ1OlEuNaEqTa93D
   fudG2QCloRE7hu1XWUZmgd6aAemD/XEBoqos9xw5Z3k1SI3tzdRedPpBw
   7W9kipb8XHqgtiYlWHSA/i+B85aPMM0Q/7EvkwdiINSxGa46/CcymwvwQ
   w==;
X-CSE-ConnectionGUID: vGgX8a3DSWGY9YPbPNt5Rg==
X-CSE-MsgGUID: Su9GKH7gTC2mfsF6z2dbyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69635043"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="69635043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:05:59 -0700
X-CSE-ConnectionGUID: ADuD7fGSRF+0H54wjkA44Q==
X-CSE-MsgGUID: CVYrdtDiQEiozeoYpOxg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="153035840"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2025 10:05:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ7ql-000CqU-1i;
	Fri, 13 Jun 2025 17:05:55 +0000
Date: Sat, 14 Jun 2025 01:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <202506140034.iXbhyNCx-lkp@intel.com>
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
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
TO: "Tomáš Juřena" <jurenatomas@gmail.com>
TO: dmitry.torokhov@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tomas Jurena <jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250614/202506140034.iXbhyNCx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506140034.iXbhyNCx-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/tca6416-keypad.c:263 tca6416_keypad_probe() error: we previously assumed 'pdata' could be null (see line 253)

vim +/pdata +263 drivers/input/keyboard/tca6416-keypad.c

c4c4a926acb6b1c Tomas Jurena                 2025-06-10  235  
3da11976b80c663 Uwe Kleine-König             2022-11-18  236  static int tca6416_keypad_probe(struct i2c_client *client)
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  237  {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  238  	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  239  	struct tca6416_keys_platform_data *pdata;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  240  	struct tca6416_keypad_chip *chip;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  241  	struct input_dev *input;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  242  	int error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  243  	int i;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  244  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  245  	/* Check functionality */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  246  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  247  		dev_err(&client->dev, "%s adapter not supported\n",
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  248  			dev_driver_string(&client->adapter->dev));
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  249  		return -ENODEV;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  250  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  251  
c838cb3d477f797 Jingoo Han                   2013-12-05  252  	pdata = dev_get_platdata(&client->dev);
c4c4a926acb6b1c Tomas Jurena                 2025-06-10 @253  	if (!pdata && dev_fwnode(&client->dev)) {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  254  		pdata = tca6416_parse_properties(&client->dev, io_size);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  255  		if (!pdata) {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  256  			dev_err(&client->dev,
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  257  				"Failed to parse device configuration from properties\n");
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  258  			return -EINVAL;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  259  		}
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  260  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  261  
91a4c69052bb660 Yangtao Li                   2023-07-23  262  	chip = devm_kzalloc(&client->dev,
91a4c69052bb660 Yangtao Li                   2023-07-23 @263  			    struct_size(chip, buttons, pdata->nbuttons),
91a4c69052bb660 Yangtao Li                   2023-07-23  264  			    GFP_KERNEL);
91a4c69052bb660 Yangtao Li                   2023-07-23  265  	if (!chip)
91a4c69052bb660 Yangtao Li                   2023-07-23  266  		return -ENOMEM;
91a4c69052bb660 Yangtao Li                   2023-07-23  267  
91a4c69052bb660 Yangtao Li                   2023-07-23  268  	input = devm_input_allocate_device(&client->dev);
91a4c69052bb660 Yangtao Li                   2023-07-23  269  	if (!input)
91a4c69052bb660 Yangtao Li                   2023-07-23  270  		return -ENOMEM;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  271  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  272  	chip->client = client;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  273  	chip->input = input;
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  274  	chip->io_size = io_size;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  275  	chip->pinmask = pdata->pinmask;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  276  	chip->use_polling = pdata->use_polling;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  277  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  278  	input->phys = "tca6416-keys/input0";
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  279  	input->name = client->name;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  280  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  281  	input->open = tca6416_keys_open;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  282  	input->close = tca6416_keys_close;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  283  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  284  	input->id.bustype = BUS_HOST;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  285  	input->id.vendor = 0x0001;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  286  	input->id.product = 0x0001;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  287  	input->id.version = 0x0100;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  288  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  289  	/* Enable auto repeat feature of Linux input subsystem */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  290  	if (pdata->rep)
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  291  		__set_bit(EV_REP, input->evbit);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  292  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  293  	for (i = 0; i < pdata->nbuttons; i++) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  294  		unsigned int type;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  295  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  296  		chip->buttons[i] = pdata->buttons[i];
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  297  		type = (pdata->buttons[i].type) ?: EV_KEY;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  298  		input_set_capability(input, type, pdata->buttons[i].code);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  299  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  300  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  301  	input_set_drvdata(input, chip);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  302  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  303  	/*
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  304  	 * Initialize cached registers from their original values.
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  305  	 * we can't share this chip with another i2c master.
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  306  	 */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  307  	error = tca6416_setup_registers(chip);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  308  	if (error)
91a4c69052bb660 Yangtao Li                   2023-07-23  309  		return error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  310  
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  311  	if (chip->use_polling) {
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  312  		error = input_setup_polling(input, tca6416_keys_scan);
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  313  		if (error) {
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  314  			dev_err(&client->dev, "Failed to setup polling\n");
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  315  			return error;
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  316  		}
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  317  
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  318  		input_set_poll_interval(input, TCA6416_POLL_INTERVAL);
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  319  	} else {
91a4c69052bb660 Yangtao Li                   2023-07-23  320  		error = devm_request_threaded_irq(&client->dev, client->irq,
91a4c69052bb660 Yangtao Li                   2023-07-23  321  						  NULL, tca6416_keys_isr,
9b7e31bbf4bb58b Lars-Peter Clausen           2012-07-04  322  						  IRQF_TRIGGER_FALLING |
91a4c69052bb660 Yangtao Li                   2023-07-23  323  							IRQF_ONESHOT |
91a4c69052bb660 Yangtao Li                   2023-07-23  324  							IRQF_NO_AUTOEN,
57b0c96f1e34f55 Dmitry Torokhov              2023-07-23  325  						  "tca6416-keypad", input);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  326  		if (error) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  327  			dev_dbg(&client->dev,
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  328  				"Unable to claim irq %d; error %d\n",
687fe7dfb736b03 Dmitry Torokhov              2023-07-23  329  				client->irq, error);
91a4c69052bb660 Yangtao Li                   2023-07-23  330  			return error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  331  		}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  332  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  333  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  334  	error = input_register_device(input);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  335  	if (error) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  336  		dev_dbg(&client->dev,
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  337  			"Unable to register input device, error: %d\n", error);
91a4c69052bb660 Yangtao Li                   2023-07-23  338  		return error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  339  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  340  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  341  	i2c_set_clientdata(client, chip);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  342  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  343  	return 0;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  344  }
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  345  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
