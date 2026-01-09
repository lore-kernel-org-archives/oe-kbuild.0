Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14A346A1E
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 22:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767999547; cv=none; b=lm9Bc2palaqrKZFRQ7o8anL9sT3eBA1lUw8mV91+DAcejifVUS9RQ9ZvTPh2vBBbtNffhimNjZ5S6dcEwhX4w0a7mbmLKTzA3ePRE3AfgP/6ef1KTU+NPUMHKT6gpXSAsJ0lE+t/LNQXhfCTJnUDrFgbA0c2WZ+Zqb+zCWmohoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767999547; c=relaxed/simple;
	bh=fNkDRZCryfF4kwKXKBum1pqUTbWQLj4cjbFeUMOBNOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gOZ3efK0PF12CDIk4M98OiZjR316lJpnOnvcClxX0df9fwDkz7dJLmP505MA0UPYSN1voMCIUqV10TsHoRNTsw3Ohr7RuzshM3MR9v+g6DUwmm8BBWd4Fm6EjQwxPdukPA3A7CQNIl0OZQTgGW9V1S5z6mH+X3s+veLxYc9u7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkGOcikv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkGOcikv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767999541; x=1799535541;
  h=date:from:to:cc:subject:message-id;
  bh=fNkDRZCryfF4kwKXKBum1pqUTbWQLj4cjbFeUMOBNOc=;
  b=UkGOcikvXKBYyx8SoSyv7U9vLjYVC3op6PrIF3hBdLEEhvhd5oKd/vkp
   1P5ctC3mIPA10vc4Cl1RRSe5R+YPPP6i1fE1Y+gMiVI2voxA9TdGyYwMU
   b4S5NnJjecYHzherj7CJBBexSzAIp94HWMCbzz7KmDN9Po01Uq0Zp6YYN
   o94Cp4huFEiuQbHDgc+NNfUm/PU3HhlwpTlguwO9YuU5YSUbrftqrsY9i
   mNbFKz7A9+BCbs9cDnN0kW8s0tRuu6OrN6MI30U+lRolrhVfMqfVxoW5P
   jUZrptf45IvEIQP9fABJVtmw+vzizui1qWvxluwNrWv+zvcZwXIH//Ua7
   A==;
X-CSE-ConnectionGUID: 1o0O27M6QzehSPJIZdSpcQ==
X-CSE-MsgGUID: HvVLYib0SAqpGFT7utSxgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94854959"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="94854959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 14:58:57 -0800
X-CSE-ConnectionGUID: 2I1DDvElTAaJ2UltjNj5JQ==
X-CSE-MsgGUID: xbYzVt6zQluGxcMsHnr1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208410188"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2026 14:58:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veLRV-000000007p4-2r0Z;
	Fri, 09 Jan 2026 22:58:53 +0000
Date: Sat, 10 Jan 2026 06:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4]
 drivers/leds/leds-lp50xx.c:503 lp50xx_probe_dt() warn: missing unwind goto?
Message-ID: <202601100636.DdfDM5g5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ab8dd06cde55677f939e0642df31f06126d507d4
commit: 01c412e31d9838cbc71c66dc03569e66ab00bb53 [4/4] leds: leds-lp50xx: Handle reg to get correct multi_index
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100636.DdfDM5g5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601100636.DdfDM5g5-lkp@intel.com/

smatch warnings:
drivers/leds/leds-lp50xx.c:503 lp50xx_probe_dt() warn: missing unwind goto?

vim +503 drivers/leds/leds-lp50xx.c

242b81170fb8a4 Dan Murphy         2020-08-12  439  
242b81170fb8a4 Dan Murphy         2020-08-12  440  static int lp50xx_probe_dt(struct lp50xx *priv)
242b81170fb8a4 Dan Murphy         2020-08-12  441  {
242b81170fb8a4 Dan Murphy         2020-08-12  442  	struct fwnode_handle *child = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  443  	struct fwnode_handle *led_node = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  444  	struct led_init_data init_data = {};
242b81170fb8a4 Dan Murphy         2020-08-12  445  	struct led_classdev *led_cdev;
242b81170fb8a4 Dan Murphy         2020-08-12  446  	struct mc_subled *mc_led_info;
242b81170fb8a4 Dan Murphy         2020-08-12  447  	struct lp50xx_led *led;
242b81170fb8a4 Dan Murphy         2020-08-12  448  	int ret = -EINVAL;
242b81170fb8a4 Dan Murphy         2020-08-12  449  	int num_colors;
242b81170fb8a4 Dan Murphy         2020-08-12  450  	u32 color_id;
242b81170fb8a4 Dan Murphy         2020-08-12  451  	int i = 0;
242b81170fb8a4 Dan Murphy         2020-08-12  452  
242b81170fb8a4 Dan Murphy         2020-08-12  453  	priv->enable_gpio = devm_gpiod_get_optional(priv->dev, "enable", GPIOD_OUT_LOW);
9a10def9ceb5fa Andy Shevchenko    2021-02-16  454  	if (IS_ERR(priv->enable_gpio))
9a10def9ceb5fa Andy Shevchenko    2021-02-16  455  		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
9a10def9ceb5fa Andy Shevchenko    2021-02-16  456  				     "Failed to get enable GPIO\n");
242b81170fb8a4 Dan Murphy         2020-08-12  457  
242b81170fb8a4 Dan Murphy         2020-08-12  458  	priv->regulator = devm_regulator_get(priv->dev, "vled");
242b81170fb8a4 Dan Murphy         2020-08-12  459  	if (IS_ERR(priv->regulator))
242b81170fb8a4 Dan Murphy         2020-08-12  460  		priv->regulator = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  461  
242b81170fb8a4 Dan Murphy         2020-08-12  462  	device_for_each_child_node(priv->dev, child) {
242b81170fb8a4 Dan Murphy         2020-08-12  463  		led = &priv->leds[i];
242b81170fb8a4 Dan Murphy         2020-08-12  464  		ret = fwnode_property_count_u32(child, "reg");
242b81170fb8a4 Dan Murphy         2020-08-12  465  		if (ret < 0) {
556f15fe023ec1 Andy Shevchenko    2021-02-16  466  			dev_err(priv->dev, "reg property is invalid\n");
242b81170fb8a4 Dan Murphy         2020-08-12  467  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  468  		}
242b81170fb8a4 Dan Murphy         2020-08-12  469  
242b81170fb8a4 Dan Murphy         2020-08-12  470  		ret = lp50xx_probe_leds(child, priv, led, ret);
242b81170fb8a4 Dan Murphy         2020-08-12  471  		if (ret)
242b81170fb8a4 Dan Murphy         2020-08-12  472  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  473  
242b81170fb8a4 Dan Murphy         2020-08-12  474  		init_data.fwnode = child;
242b81170fb8a4 Dan Murphy         2020-08-12  475  		num_colors = 0;
242b81170fb8a4 Dan Murphy         2020-08-12  476  
242b81170fb8a4 Dan Murphy         2020-08-12  477  		/*
242b81170fb8a4 Dan Murphy         2020-08-12  478  		 * There are only 3 LEDs per module otherwise they should be
242b81170fb8a4 Dan Murphy         2020-08-12  479  		 * banked which also is presented as 3 LEDs.
242b81170fb8a4 Dan Murphy         2020-08-12  480  		 */
242b81170fb8a4 Dan Murphy         2020-08-12  481  		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
242b81170fb8a4 Dan Murphy         2020-08-12  482  					   sizeof(*mc_led_info), GFP_KERNEL);
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  483  		if (!mc_led_info) {
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  484  			ret = -ENOMEM;
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  485  			goto child_out;
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  486  		}
242b81170fb8a4 Dan Murphy         2020-08-12  487  
242b81170fb8a4 Dan Murphy         2020-08-12  488  		fwnode_for_each_child_node(child, led_node) {
01c412e31d9838 Johan Adolfsson    2025-06-17  489  			int multi_index;
242b81170fb8a4 Dan Murphy         2020-08-12  490  			ret = fwnode_property_read_u32(led_node, "color",
242b81170fb8a4 Dan Murphy         2020-08-12  491  						       &color_id);
242b81170fb8a4 Dan Murphy         2020-08-12  492  			if (ret) {
f1e1d532da7e6e Andy Shevchenko    2021-05-10  493  				fwnode_handle_put(led_node);
242b81170fb8a4 Dan Murphy         2020-08-12  494  				dev_err(priv->dev, "Cannot read color\n");
242b81170fb8a4 Dan Murphy         2020-08-12  495  				goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  496  			}
01c412e31d9838 Johan Adolfsson    2025-06-17  497  			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
01c412e31d9838 Johan Adolfsson    2025-06-17  498  			if (ret != 0) {
01c412e31d9838 Johan Adolfsson    2025-06-17  499  				dev_err(priv->dev, "reg must be set\n");
01c412e31d9838 Johan Adolfsson    2025-06-17  500  				return -EINVAL;
01c412e31d9838 Johan Adolfsson    2025-06-17  501  			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
01c412e31d9838 Johan Adolfsson    2025-06-17  502  				dev_err(priv->dev, "reg %i out of range\n", multi_index);
01c412e31d9838 Johan Adolfsson    2025-06-17 @503  				return -EINVAL;
01c412e31d9838 Johan Adolfsson    2025-06-17  504  			}
242b81170fb8a4 Dan Murphy         2020-08-12  505  
01c412e31d9838 Johan Adolfsson    2025-06-17  506  			mc_led_info[multi_index].color_index = color_id;
242b81170fb8a4 Dan Murphy         2020-08-12  507  			num_colors++;
242b81170fb8a4 Dan Murphy         2020-08-12  508  		}
242b81170fb8a4 Dan Murphy         2020-08-12  509  
242b81170fb8a4 Dan Murphy         2020-08-12  510  		led->priv = priv;
242b81170fb8a4 Dan Murphy         2020-08-12  511  		led->mc_cdev.num_colors = num_colors;
242b81170fb8a4 Dan Murphy         2020-08-12  512  		led->mc_cdev.subled_info = mc_led_info;
242b81170fb8a4 Dan Murphy         2020-08-12  513  		led_cdev = &led->mc_cdev.led_cdev;
242b81170fb8a4 Dan Murphy         2020-08-12  514  		led_cdev->brightness_set_blocking = lp50xx_brightness_set;
242b81170fb8a4 Dan Murphy         2020-08-12  515  
556f15fe023ec1 Andy Shevchenko    2021-02-16  516  		ret = devm_led_classdev_multicolor_register_ext(priv->dev,
242b81170fb8a4 Dan Murphy         2020-08-12  517  						       &led->mc_cdev,
242b81170fb8a4 Dan Murphy         2020-08-12  518  						       &init_data);
242b81170fb8a4 Dan Murphy         2020-08-12  519  		if (ret) {
556f15fe023ec1 Andy Shevchenko    2021-02-16  520  			dev_err(priv->dev, "led register err: %d\n", ret);
242b81170fb8a4 Dan Murphy         2020-08-12  521  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  522  		}
242b81170fb8a4 Dan Murphy         2020-08-12  523  		i++;
242b81170fb8a4 Dan Murphy         2020-08-12  524  	}
242b81170fb8a4 Dan Murphy         2020-08-12  525  
242b81170fb8a4 Dan Murphy         2020-08-12  526  	return 0;
242b81170fb8a4 Dan Murphy         2020-08-12  527  
242b81170fb8a4 Dan Murphy         2020-08-12  528  child_out:
242b81170fb8a4 Dan Murphy         2020-08-12  529  	fwnode_handle_put(child);
242b81170fb8a4 Dan Murphy         2020-08-12  530  	return ret;
242b81170fb8a4 Dan Murphy         2020-08-12  531  }
242b81170fb8a4 Dan Murphy         2020-08-12  532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
