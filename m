Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36BF28726E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932717; cv=none; b=GXpE5IU3vKBr1fnQc32c5CLaeGQ3DVbux8yJ7LsltXnenWssuOYedHHwRkFCJPLKe4YCY4siZuCAtgtBO+nXTtNOYmwdHALnOoZryba79g+ogM2ydTEH5sGBTLKze70bHaWk1mX82q8QqyJF87+ivEX7NWwvaI0sd/b9MEW9z8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932717; c=relaxed/simple;
	bh=5DSgqOgV15C3M10Mp3fiNo/ylN4h8eR4lsA2WFt8Q8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJP4GZjout50UnYGMejEzWXzpKbx7w/k7J2Tta113kFFFr7DVAn+X20ya0opveE4ci1sgaSLXqRaDHxVg0Tkhkc3/UVaWCwVm15O5u0ZkmtX6gts0/CQzOvYk/lM2m9JgQ4YfeiMPpxHX07qU1ekdAwPEhaW8EXzUFZ4BpYECgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avhBA4ET; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avhBA4ET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773932716; x=1805468716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5DSgqOgV15C3M10Mp3fiNo/ylN4h8eR4lsA2WFt8Q8E=;
  b=avhBA4ET6enpSe6YVwjr++xTMDLSRe1aitFl59qKszTTDyjBOR8SzTVv
   kx2rBukKG7SR8XeILyr770cKO7iPzabdyBB8VYftkDJPqNM7E/s3qzofJ
   Vdg9tvxc+A7yvAxRUm0+cA0oP90q2f9ufoxNtcW5EzkpfL7F6PgqnvFKc
   XjJj4U7gKi2qhgrLBecReFGpZHingXxHwv9C3Zy0CXo911PtFqtDJNDM+
   Vq7Ukagh7MAfhZZ4xMzyzVhaJt7Y9N6TbeurZo8Pi1uQGb7/4Msswnp6k
   Z+20vTo1TJBvbwix88MNOGpmXatfiXtiX72EQN+psHOdKpUKmaaXWXxBp
   A==;
X-CSE-ConnectionGUID: 4L695HjwS1y+9gzb387lcg==
X-CSE-MsgGUID: nm1+i+/oR7OQ6ra1BwRGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74021376"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74021376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:05:15 -0700
X-CSE-ConnectionGUID: +pLaLUwiSFCp1bv7fx+8Fw==
X-CSE-MsgGUID: 5S89BE1WRNivH+nQeN/V9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222090126"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 08:05:13 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Evn-000000001C9-49WP;
	Thu, 19 Mar 2026 15:05:10 +0000
Date: Thu, 19 Mar 2026 23:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] leds: ltc3208: add driver
Message-ID: <202603192312.QLMHYKWa-lkp@intel.com>
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
In-Reply-To: <20260318-upstream-ltc3208-v1-2-015f1f1e9065@analog.com>
References: <20260318-upstream-ltc3208-v1-2-015f1f1e9065@analog.com>
TO: Jan Carlo Roleda <jancarlo.roleda@analog.com>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e68f95a51d1a8c1594b536c4d495cbea38d47561]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Carlo-Roleda/Add-Maintainers-to-LTC3208-LED-Driver/20260319-005902
base:   e68f95a51d1a8c1594b536c4d495cbea38d47561
patch link:    https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-2-015f1f1e9065%40analog.com
patch subject: [PATCH 2/3] leds: ltc3208: add driver
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192312.QLMHYKWa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603192312.QLMHYKWa-lkp@intel.com/

New smatch warnings:
drivers/leds/leds-ltc3208.c:222 ltc3208_probe() error: buffer overflow 'ltc3208_dt_aux_channels' 4 <= 4
drivers/leds/leds-ltc3208.c:227 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

Old smatch warnings:
drivers/leds/leds-ltc3208.c:229 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

vim +/ltc3208_dt_aux_channels +222 drivers/leds/leds-ltc3208.c

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  175  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  176  static int ltc3208_probe(struct i2c_client *client)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  177  {
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  178  	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  179  	struct ltc3208_dev *data;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  180  	struct ltc3208_led *leds;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  181  	struct regmap *map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  182  	int ret, i;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  183  	u32 val;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  184  	bool dropdis_rgb_aux4;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  185  	bool dis_camhl;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  186  	bool en_rgbs;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  187  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  188  	map = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  189  	if (IS_ERR(map))
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  190  		return dev_err_probe(&client->dev, PTR_ERR(map),
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  191  				     "Failed to initialize regmap\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  192  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  193  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  194  	if (!data)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  195  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  196  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  197  	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  198  			    sizeof(struct ltc3208_led), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  199  	if (!leds)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  200  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  201  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  202  	data->client = client;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  203  	data->map = map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  204  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  205  	/* initialize options from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  206  	dis_camhl = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  207  					      "adi,disable-camhl-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  208  	en_rgbs = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  209  					    "adi,cfg-enrgbs-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  210  	dropdis_rgb_aux4 = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  211  						     "adi,disable-rgb-aux4-dropout");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  212  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  213  	ret = ltc3208_update_options(data, en_rgbs, dis_camhl,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  214  				     dropdis_rgb_aux4);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  215  	if (ret)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  216  		return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  217  				     "error writing to options register\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  218  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  219  	/* initialize aux channel configurations from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  220  	for (i = 0; i <= LTC3208_NUM_AUX_LEDS; i++) {
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  221  		ret = device_property_match_property_string(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @222  							    ltc3208_dt_aux_channels[i],
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  223  							    ltc3208_aux_opt,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  224  							    LTC3208_NUM_AUX_OPT);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  225  		/* use default value if absent in devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  226  		if (ret == -EINVAL)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @227  			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  228  		else if (ret >= 0)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  229  			aux_channels[i] = ret;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  230  		else
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  231  			return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  232  					     "Failed getting aux-channel.\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  233  	}
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  234  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  235  	ret = ltc3208_update_aux_dac(data, aux_channels[0], aux_channels[1],
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  236  				     aux_channels[2], aux_channels[3]);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  237  	if (ret)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  238  		return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  239  				     "error writing to aux %u channel register.\n", i);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  240  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  241  	i2c_set_clientdata(client, data);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  242  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  243  	device_for_each_child_node_scoped(&client->dev, child) {
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  244  		struct ltc3208_led *led;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  245  		struct led_init_data init_data = {};
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  246  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  247  		ret = fwnode_property_read_u32(child, "reg", &val);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  248  		if (ret || val >= LTC3208_NUM_LED_GRPS)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  249  			return dev_err_probe(&client->dev, -EINVAL,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  250  					     "Invalid reg property for LED\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  251  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  252  		led = &leds[val];
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  253  		led->client = client;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  254  		led->channel = val;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  255  		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  256  		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  257  		if (val == LTC3208_CHAN_MAIN || val == LTC3208_CHAN_SUB)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  258  			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  259  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  260  		init_data.fwnode = child;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  261  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  262  		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  263  			&init_data);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  264  		if (ret)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  265  			return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  266  					     "Failed to register LED %u\n", val);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  267  	}
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  268  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  269  	data->leds = leds;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  270  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  271  	return 0;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  272  }
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  273  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
