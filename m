Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60272622
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 01:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682990902; x=1714526902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lusc7DowdV66J5MDe7xvtHwDVnMdXw6qDsnr5QE5KdI=;
  b=deEQuJ2fJWNbgimHm/EqTdNtQYNDyZO+VqNbbTNUu8c8XR3pa1y1T62V
   QOt0vKqtLvNAoGx/YiFCVwtILtVHzfP9DUUzapyo5iMUIslhodEnb2Vkm
   bhk0bfS4GNLAKdaAkp/Ng7LAjwEHkLDqQijwaV6CZHmxsKgPreS/dnSVi
   T1E1esY9x59RYQmMvC+5F4zDSGBMTK6lIi4OLJ+EriQB3lA2N+wkxlXre
   9/Nu6gRsO3VagBfUlPmXFnQMKSojThzUKPEk7JrdVWZ5eBh+Vc2UgfNQc
   VeBsONORk6ils0T8KoAtf4B93El5NNTUPiec6hH2JM2t2pEPx4j7lLEZK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332628878"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="332628878"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 18:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765564742"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="765564742"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 May 2023 18:28:20 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pteoV-0000jw-1e;
	Tue, 02 May 2023 01:28:19 +0000
Date: Tue, 2 May 2023 09:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lunn:leds-offload-support-reduced-auto-netdev 15/21]
 drivers/leds/led-class.c:362 led_classdev_register_ext() warn: curly braces
 intended?
Message-ID: <202305020950.QBbVMspm-lkp@intel.com>
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
TO: Andrew Lunn <andrew@lunn.ch>

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   c60ee6ed7e664a425ce612fc68bcbc0a79d75aa5
commit: 1b3bca97ae847a2c323567950f7b7334703992c2 [15/21] drivers: leds: led-class: Keep fwnode from init_data for triggers
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230502/202305020950.QBbVMspm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305020950.QBbVMspm-lkp@intel.com/

smatch warnings:
drivers/leds/led-class.c:362 led_classdev_register_ext() warn: curly braces intended?

vim +362 drivers/leds/led-class.c

a96aa64cb5723d Ricardo Ribalda             2015-03-30  326  
c72a1d608dd0eb Richard Purdie              2006-03-31  327  /**
b2b998c0f94499 Jacek Anaszewski            2019-06-09  328   * led_classdev_register_ext - register a new object of led_classdev class
b2b998c0f94499 Jacek Anaszewski            2019-06-09  329   *			       with init data.
442c609830e989 Rafał Miłecki               2017-03-06  330   *
442c609830e989 Rafał Miłecki               2017-03-06  331   * @parent: parent of LED device
c72a1d608dd0eb Richard Purdie              2006-03-31  332   * @led_cdev: the led_classdev structure for this device.
b2b998c0f94499 Jacek Anaszewski            2019-06-09  333   * @init_data: LED class device initialization data
c72a1d608dd0eb Richard Purdie              2006-03-31  334   */
b2b998c0f94499 Jacek Anaszewski            2019-06-09  335  int led_classdev_register_ext(struct device *parent,
b2b998c0f94499 Jacek Anaszewski            2019-06-09  336  			      struct led_classdev *led_cdev,
b2b998c0f94499 Jacek Anaszewski            2019-06-09  337  			      struct led_init_data *init_data)
c72a1d608dd0eb Richard Purdie              2006-03-31  338  {
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  339  	char composed_name[LED_MAX_NAME_SIZE];
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  340  	char final_name[LED_MAX_NAME_SIZE];
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  341  	const char *proposed_name = composed_name;
a96aa64cb5723d Ricardo Ribalda             2015-03-30  342  	int ret;
a96aa64cb5723d Ricardo Ribalda             2015-03-30  343  
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  344  	if (init_data) {
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  345  		if (init_data->devname_mandatory && !init_data->devicename) {
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  346  			dev_err(parent, "Mandatory device name is missing");
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  347  			return -EINVAL;
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  348  		}
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  349  		ret = led_compose_name(parent, init_data, composed_name);
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  350  		if (ret < 0)
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  351  			return ret;
c49d6cab0d7fde Marek Behún                 2020-09-19  352  
419066324e19a4 Eddie James                 2021-07-16  353  		if (init_data->fwnode) {
c49d6cab0d7fde Marek Behún                 2020-09-19  354  			fwnode_property_read_string(init_data->fwnode,
c49d6cab0d7fde Marek Behún                 2020-09-19  355  				"linux,default-trigger",
c49d6cab0d7fde Marek Behún                 2020-09-19  356  				&led_cdev->default_trigger);
419066324e19a4 Eddie James                 2021-07-16  357  
419066324e19a4 Eddie James                 2021-07-16  358  			if (fwnode_property_present(init_data->fwnode,
419066324e19a4 Eddie James                 2021-07-16  359  						    "retain-state-shutdown"))
419066324e19a4 Eddie James                 2021-07-16  360  				led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
1b3bca97ae847a Andrew Lunn                 2023-04-30  361  #ifdef CONFIG_LEDS_TRIGGERS
1b3bca97ae847a Andrew Lunn                 2023-04-30 @362  				led_cdev->fwnode = init_data->fwnode;
1b3bca97ae847a Andrew Lunn                 2023-04-30  363  #endif
419066324e19a4 Eddie James                 2021-07-16  364  		}
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  365  	} else {
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  366  		proposed_name = led_cdev->name;
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  367  	}
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  368  
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  369  	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
a96aa64cb5723d Ricardo Ribalda             2015-03-30  370  	if (ret < 0)
a96aa64cb5723d Ricardo Ribalda             2015-03-30  371  		return ret;
a96aa64cb5723d Ricardo Ribalda             2015-03-30  372  
6d71021ab3b0bd Luis Henriques              2018-05-23  373  	mutex_init(&led_cdev->led_access);
6d71021ab3b0bd Luis Henriques              2018-05-23  374  	mutex_lock(&led_cdev->led_access);
d0d480cce8f522 Johan Hovold                2014-06-25  375  	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
bb4e9af0348dfe Jacek Anaszewski            2019-06-09  376  				led_cdev, led_cdev->groups, "%s", final_name);
6d71021ab3b0bd Luis Henriques              2018-05-23  377  	if (IS_ERR(led_cdev->dev)) {
6d71021ab3b0bd Luis Henriques              2018-05-23  378  		mutex_unlock(&led_cdev->led_access);
f8a7c6fe14f556 Richard Purdie              2007-07-08  379  		return PTR_ERR(led_cdev->dev);
6d71021ab3b0bd Luis Henriques              2018-05-23  380  	}
495b8966f7ad92 Sander Vanheule             2021-11-13  381  	if (init_data && init_data->fwnode)
495b8966f7ad92 Sander Vanheule             2021-11-13  382  		device_set_node(led_cdev->dev, init_data->fwnode);
c72a1d608dd0eb Richard Purdie              2006-03-31  383  
a96aa64cb5723d Ricardo Ribalda             2015-03-30  384  	if (ret)
6f06c7f87cf54f Sakari Ailus                2015-03-26  385  		dev_warn(parent, "Led %s renamed to %s due to name collision",
64ed6588c2ea61 Ricardo Ribalda             2020-04-01  386  				proposed_name, dev_name(led_cdev->dev));
a96aa64cb5723d Ricardo Ribalda             2015-03-30  387  
0cb8eb30d425d2 Hans de Goede               2017-01-29  388  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
0cb8eb30d425d2 Hans de Goede               2017-01-29  389  		ret = led_add_brightness_hw_changed(led_cdev);
0cb8eb30d425d2 Hans de Goede               2017-01-29  390  		if (ret) {
0cb8eb30d425d2 Hans de Goede               2017-01-29  391  			device_unregister(led_cdev->dev);
1dbb9fb4082ce2 Andy Shevchenko             2019-08-16  392  			led_cdev->dev = NULL;
6d71021ab3b0bd Luis Henriques              2018-05-23  393  			mutex_unlock(&led_cdev->led_access);
0cb8eb30d425d2 Hans de Goede               2017-01-29  394  			return ret;
0cb8eb30d425d2 Hans de Goede               2017-01-29  395  		}
0cb8eb30d425d2 Hans de Goede               2017-01-29  396  	}
0cb8eb30d425d2 Hans de Goede               2017-01-29  397  
a9c6ce57ec2f13 Hans de Goede               2016-11-08  398  	led_cdev->work_flags = 0;
270c3957dbc5be Richard Purdie              2008-10-20  399  #ifdef CONFIG_LEDS_TRIGGERS
270c3957dbc5be Richard Purdie              2008-10-20  400  	init_rwsem(&led_cdev->trigger_lock);
0cb8eb30d425d2 Hans de Goede               2017-01-29  401  #endif
0cb8eb30d425d2 Hans de Goede               2017-01-29  402  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
0cb8eb30d425d2 Hans de Goede               2017-01-29  403  	led_cdev->brightness_hw_changed = -1;
270c3957dbc5be Richard Purdie              2008-10-20  404  #endif
c72a1d608dd0eb Richard Purdie              2006-03-31  405  	/* add to the list of leds */
72f8da329e07ad Richard Purdie              2007-12-31  406  	down_write(&leds_list_lock);
c72a1d608dd0eb Richard Purdie              2006-03-31  407  	list_add_tail(&led_cdev->node, &leds_list);
72f8da329e07ad Richard Purdie              2007-12-31  408  	up_write(&leds_list_lock);
c72a1d608dd0eb Richard Purdie              2006-03-31  409  
1bd465e6b0e2b5 Guennadi Liakhovetski       2009-01-10  410  	if (!led_cdev->max_brightness)
1bd465e6b0e2b5 Guennadi Liakhovetski       2009-01-10  411  		led_cdev->max_brightness = LED_FULL;
1bd465e6b0e2b5 Guennadi Liakhovetski       2009-01-10  412  
29d76dfa29fe22 Henrique de Moraes Holschuh 2008-03-18  413  	led_update_brightness(led_cdev);
29d76dfa29fe22 Henrique de Moraes Holschuh 2008-03-18  414  
757b06ae04b3b6 Jacek Anaszewski            2015-09-28  415  	led_init_core(led_cdev);
5ada28bf76752e Johannes Berg               2010-11-11  416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
