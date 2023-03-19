Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A7EC6
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679207705; x=1710743705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NhBBJceCbz6H18f0Oaz8pn6guNQIEbKxgfSbjrjOZPs=;
  b=EZ/bnBWvNpeh7zV1roLMYT649D6c/h9spdXtj2nKS1QhZDxSaE4Fo6Rb
   XhHa+AtnfiwlJSMaLTs9oausf8QZf8z4b65mik+MeqwTSivSehKAgdM6h
   eLo03QSWjEEkOaoO5mLWWv5Y3lIS/4D9lGMIUWXkMHu4uag78vnH4SDsr
   i83GXUYvmwVmKAozil3ln+OsuL3fOa2cbjrRmu2YwWdcC2fhQJgKpHCMS
   3QO6/5CCRA4wW7wHxEdK+mzJHCL/eSacqm2mq4WJvRSo3V7Ek+4F5vNQl
   HwWEMiNYM8MawbtWaeipJD9UnFU7hVOAgHWIaApDE0jBez6jrt4QB/YzQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318139077"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318139077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 23:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="658006264"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="658006264"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 23:35:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdmdC-000AR4-0w;
	Sun, 19 Mar 2023 06:35:02 +0000
Date: Sun, 19 Mar 2023 14:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/i2c/ov5670.c:2501 ov5670_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202303191458.6UOLZlwc-lkp@intel.com>
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
TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 8004c91e20959c241fcc7c87f6f7bc880dc25a27 media: i2c: ov5670: Use common clock framework
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: nios2-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191458.6UOLZlwc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191458.6UOLZlwc-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov5670.c:2501 ov5670_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2501 drivers/media/i2c/ov5670.c

5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2478  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2479  static int ov5670_probe(struct i2c_client *client)
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2480  {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2481  	struct ov5670 *ov5670;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2482  	const char *err_msg;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2483  	u32 input_clk = 0;
1e583b56e5e746 Sakari Ailus       2021-12-15  2484  	bool full_power;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2485  	int ret;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2486  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2487  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2488  	if (!ov5670) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2489  		ret = -ENOMEM;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2490  		err_msg = "devm_kzalloc() error";
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2491  		goto error_print;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2492  	}
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2493  
8004c91e20959c Jacopo Mondi       2023-01-26  2494  	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
8004c91e20959c Jacopo Mondi       2023-01-26  2495  	if (!IS_ERR_OR_NULL(ov5670->xvclk))
8004c91e20959c Jacopo Mondi       2023-01-26  2496  		input_clk = clk_get_rate(ov5670->xvclk);
8004c91e20959c Jacopo Mondi       2023-01-26  2497  	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
8004c91e20959c Jacopo Mondi       2023-01-26  2498  		device_property_read_u32(&client->dev, "clock-frequency",
8004c91e20959c Jacopo Mondi       2023-01-26  2499  					 &input_clk);
8004c91e20959c Jacopo Mondi       2023-01-26  2500  	else
8004c91e20959c Jacopo Mondi       2023-01-26 @2501  		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
8004c91e20959c Jacopo Mondi       2023-01-26  2502  				     "error getting clock\n");
8004c91e20959c Jacopo Mondi       2023-01-26  2503  
8004c91e20959c Jacopo Mondi       2023-01-26  2504  	if (input_clk != OV5670_XVCLK_FREQ) {
8004c91e20959c Jacopo Mondi       2023-01-26  2505  		dev_err(&client->dev,
8004c91e20959c Jacopo Mondi       2023-01-26  2506  			"Unsupported clock frequency %u\n", input_clk);
8004c91e20959c Jacopo Mondi       2023-01-26  2507  		return -EINVAL;
8004c91e20959c Jacopo Mondi       2023-01-26  2508  	}
8004c91e20959c Jacopo Mondi       2023-01-26  2509  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2510  	/* Initialize subdev */
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2511  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2512  
1e583b56e5e746 Sakari Ailus       2021-12-15  2513  	full_power = acpi_dev_state_d0(&client->dev);
1e583b56e5e746 Sakari Ailus       2021-12-15  2514  	if (full_power) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2515  		/* Check module identity */
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2516  		ret = ov5670_identify_module(ov5670);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2517  		if (ret) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2518  			err_msg = "ov5670_identify_module() error";
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2519  			goto error_print;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2520  		}
1e583b56e5e746 Sakari Ailus       2021-12-15  2521  	}
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2522  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2523  	mutex_init(&ov5670->mutex);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2524  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2525  	/* Set default mode to max resolution */
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2526  	ov5670->cur_mode = &supported_modes[0];
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2527  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2528  	ret = ov5670_init_controls(ov5670);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2529  	if (ret) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2530  		err_msg = "ov5670_init_controls() error";
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2531  		goto error_mutex_destroy;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2532  	}
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2533  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2534  	ov5670->sd.internal_ops = &ov5670_internal_ops;
dce6dd4493d613 Ricardo Ribalda    2021-10-07  2535  	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
dce6dd4493d613 Ricardo Ribalda    2021-10-07  2536  			    V4L2_SUBDEV_FL_HAS_EVENTS;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2537  	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2538  	ov5670->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2539  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2540  	/* Source pad initialization */
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2541  	ov5670->pad.flags = MEDIA_PAD_FL_SOURCE;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2542  	ret = media_entity_pads_init(&ov5670->sd.entity, 1, &ov5670->pad);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2543  	if (ret) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2544  		err_msg = "media_entity_pads_init() error";
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2545  		goto error_handler_free;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2546  	}
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2547  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2548  	/* Async register for subdev */
15786f7b564eff Sakari Ailus       2021-03-05  2549  	ret = v4l2_async_register_subdev_sensor(&ov5670->sd);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2550  	if (ret < 0) {
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2551  		err_msg = "v4l2_async_register_subdev() error";
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2552  		goto error_entity_cleanup;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2553  	}
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2554  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2555  	ov5670->streaming = false;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2556  
1e583b56e5e746 Sakari Ailus       2021-12-15  2557  	/* Set the device's state to active if it's in D0 state. */
1e583b56e5e746 Sakari Ailus       2021-12-15  2558  	if (full_power)
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2559  		pm_runtime_set_active(&client->dev);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2560  	pm_runtime_enable(&client->dev);
d508fffb92d9b8 Sakari Ailus       2018-07-20  2561  	pm_runtime_idle(&client->dev);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2562  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2563  	return 0;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2564  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2565  error_entity_cleanup:
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2566  	media_entity_cleanup(&ov5670->sd.entity);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2567  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2568  error_handler_free:
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2569  	v4l2_ctrl_handler_free(ov5670->sd.ctrl_handler);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2570  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2571  error_mutex_destroy:
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2572  	mutex_destroy(&ov5670->mutex);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2573  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2574  error_print:
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2575  	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2576  
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2577  	return ret;
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2578  }
5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
