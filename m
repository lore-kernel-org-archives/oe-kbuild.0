Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19013E47B
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 03:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742614438; cv=none; b=X4MQJAKVhilCNGUrW5L+0cjZmvJuF5YnQmePlUSfEVQoxkfN9ZPy9h4a4pK3lrApDMhnZRrs02X07rUE8N9ZNUw8wfmsTilx7IXUTghnx+jO+QcWMSWAMMQNaTdfcjWSEcAiIpihMg6LlhjL+JdH+E7lzyIfT0o5Coe55THeffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742614438; c=relaxed/simple;
	bh=DxBRx425dl6vgD2XwlATeRcibP8n7LbB3EN8G3Sm4js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkQwVSv4DYIa4wpr6PuvuAvupP1i0djoRLYECBVby1ui1BkIUB2UahF4XOGo5gXxmqQmK/pPeAb27m2CDWRWHVJ1mwI7QNA0Wqw0VRIVESgG4DVpIbbCdZIKV25u7X7TFF2wYAdvYqtx2mnm1lLfy3cKpFK+x9iyhN/qTLY0zGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiDhEPJE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiDhEPJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742614436; x=1774150436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DxBRx425dl6vgD2XwlATeRcibP8n7LbB3EN8G3Sm4js=;
  b=SiDhEPJEn5pZC4x4Ec+AIN8A3P39C5BQmFlOnSw5KK4X6UIBpWRmGNyr
   9WJVdRrH8vR+Rh2zdBPPWouWdnRyu983xFY2ANVGC//bQWvromrsX2GEG
   jvn3N9FCmqdi4DAnvSe/zjLsR0R+lswCXKNUa6GVPywdK72e2uMYzxcTb
   b47XYWyjJLbwoys7lfJlTSXo/mtGSzpp+/4jpMewcjnLTIxBexXdQjkK3
   3fXh7Pmz8IxxuKSNv2/PPRL7GmIy9SII+qTOC3EkshaTYA7+P1XU4ddgs
   HR1vXEmGGtqT0nwi1Kkx+IDLjXIFv5/KGz0O8/rmHKLId0P92gSRBWHUg
   g==;
X-CSE-ConnectionGUID: 0HU8GVwDS3+J/myWBvC/Jg==
X-CSE-MsgGUID: SGl2sb/6RTKC65K0T7x+Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66351849"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66351849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 20:33:55 -0700
X-CSE-ConnectionGUID: jq0b9rbGRxOn4ke7ZsUAVA==
X-CSE-MsgGUID: 6vay4Y0bTZSPX2dHPMpdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128389961"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2025 20:33:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvpcN-0001uJ-1l;
	Sat, 22 Mar 2025 03:33:51 +0000
Date: Sat, 22 Mar 2025 11:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <202503221153.G9HPVANn-lkp@intel.com>
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
In-Reply-To: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
References: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
TO: Matthias Fend <matthias.fend@emfend.at>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Matthias Fend <matthias.fend@emfend.at>
CC: bsp-development.geo@leica-geosystems.com

Hi Matthias,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/dt-bindings-leds-add-Texas-Instruments-TPS6131x-flash-LED-driver/20250318-154318
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250318-leds-tps6131x-v2-2-bc09c7a50b2e%40emfend.at
patch subject: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503221153.G9HPVANn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503221153.G9HPVANn-lkp@intel.com/

smatch warnings:
drivers/leds/flash/leds-tps6131x.c:534 tps6131x_parse_node() warn: 'num_channels' unsigned <= 0

vim +/num_channels +534 drivers/leds/flash/leds-tps6131x.c

02e7ee00455be1 Matthias Fend 2025-03-18  511  
02e7ee00455be1 Matthias Fend 2025-03-18  512  static int tps6131x_parse_node(struct tps6131x *tps6131x)
02e7ee00455be1 Matthias Fend 2025-03-18  513  {
02e7ee00455be1 Matthias Fend 2025-03-18  514  	const struct tps6131x_timer_config *timer_config;
02e7ee00455be1 Matthias Fend 2025-03-18  515  	struct device *dev = tps6131x->dev;
02e7ee00455be1 Matthias Fend 2025-03-18  516  	u32 channels[TPS6131X_MAX_CHANNELS];
02e7ee00455be1 Matthias Fend 2025-03-18  517  	u32 current_step_multiplier;
02e7ee00455be1 Matthias Fend 2025-03-18  518  	u32 current_ua;
02e7ee00455be1 Matthias Fend 2025-03-18  519  	u32 max_current_flash_ma, max_current_torch_ma;
02e7ee00455be1 Matthias Fend 2025-03-18  520  	u32 num_channels;
02e7ee00455be1 Matthias Fend 2025-03-18  521  	u32 timeout_us;
02e7ee00455be1 Matthias Fend 2025-03-18  522  	int i;
02e7ee00455be1 Matthias Fend 2025-03-18  523  	int ret;
02e7ee00455be1 Matthias Fend 2025-03-18  524  
02e7ee00455be1 Matthias Fend 2025-03-18  525  	tps6131x->valley_current_limit = device_property_read_bool(dev, "ti,valley-current-limit");
02e7ee00455be1 Matthias Fend 2025-03-18  526  
02e7ee00455be1 Matthias Fend 2025-03-18  527  	tps6131x->led_node = fwnode_get_next_available_child_node(dev->fwnode, NULL);
02e7ee00455be1 Matthias Fend 2025-03-18  528  	if (!tps6131x->led_node) {
02e7ee00455be1 Matthias Fend 2025-03-18  529  		dev_err(dev, "Missing LED node\n");
02e7ee00455be1 Matthias Fend 2025-03-18  530  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  531  	}
02e7ee00455be1 Matthias Fend 2025-03-18  532  
02e7ee00455be1 Matthias Fend 2025-03-18  533  	num_channels = fwnode_property_count_u32(tps6131x->led_node, "led-sources");
02e7ee00455be1 Matthias Fend 2025-03-18 @534  	if (num_channels <= 0) {
02e7ee00455be1 Matthias Fend 2025-03-18  535  		dev_err(dev, "Failed to read led-sources property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  536  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  537  	}
02e7ee00455be1 Matthias Fend 2025-03-18  538  
02e7ee00455be1 Matthias Fend 2025-03-18  539  	if (num_channels > TPS6131X_MAX_CHANNELS) {
02e7ee00455be1 Matthias Fend 2025-03-18  540  		dev_err(dev, "led-sources count %u exceeds maximum channel count %u\n",
02e7ee00455be1 Matthias Fend 2025-03-18  541  			num_channels, TPS6131X_MAX_CHANNELS);
02e7ee00455be1 Matthias Fend 2025-03-18  542  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  543  	}
02e7ee00455be1 Matthias Fend 2025-03-18  544  
02e7ee00455be1 Matthias Fend 2025-03-18  545  	ret = fwnode_property_read_u32_array(tps6131x->led_node, "led-sources", channels,
02e7ee00455be1 Matthias Fend 2025-03-18  546  					     num_channels);
02e7ee00455be1 Matthias Fend 2025-03-18  547  	if (ret < 0) {
02e7ee00455be1 Matthias Fend 2025-03-18  548  		dev_err(dev, "Failed to read led-sources property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  549  		return ret;
02e7ee00455be1 Matthias Fend 2025-03-18  550  	}
02e7ee00455be1 Matthias Fend 2025-03-18  551  
02e7ee00455be1 Matthias Fend 2025-03-18  552  	max_current_flash_ma = 0;
02e7ee00455be1 Matthias Fend 2025-03-18  553  	max_current_torch_ma = 0;
02e7ee00455be1 Matthias Fend 2025-03-18  554  	for (i = 0; i < num_channels; i++) {
02e7ee00455be1 Matthias Fend 2025-03-18  555  		switch (channels[i]) {
02e7ee00455be1 Matthias Fend 2025-03-18  556  		case 1:
02e7ee00455be1 Matthias Fend 2025-03-18  557  			tps6131x->chan1_en = true;
02e7ee00455be1 Matthias Fend 2025-03-18  558  			max_current_flash_ma += TPS6131X_FLASH_MAX_I_CHAN13_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  559  			max_current_torch_ma += TPS6131X_TORCH_MAX_I_CHAN13_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  560  			break;
02e7ee00455be1 Matthias Fend 2025-03-18  561  		case 2:
02e7ee00455be1 Matthias Fend 2025-03-18  562  			tps6131x->chan2_en = true;
02e7ee00455be1 Matthias Fend 2025-03-18  563  			max_current_flash_ma += TPS6131X_FLASH_MAX_I_CHAN2_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  564  			max_current_torch_ma += TPS6131X_TORCH_MAX_I_CHAN2_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  565  			break;
02e7ee00455be1 Matthias Fend 2025-03-18  566  		case 3:
02e7ee00455be1 Matthias Fend 2025-03-18  567  			tps6131x->chan3_en = true;
02e7ee00455be1 Matthias Fend 2025-03-18  568  			max_current_flash_ma += TPS6131X_FLASH_MAX_I_CHAN13_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  569  			max_current_torch_ma += TPS6131X_TORCH_MAX_I_CHAN13_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  570  			break;
02e7ee00455be1 Matthias Fend 2025-03-18  571  		default:
02e7ee00455be1 Matthias Fend 2025-03-18  572  			dev_err(dev, "led-source out of range [1-3]\n");
02e7ee00455be1 Matthias Fend 2025-03-18  573  			return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  574  		}
02e7ee00455be1 Matthias Fend 2025-03-18  575  	}
02e7ee00455be1 Matthias Fend 2025-03-18  576  
02e7ee00455be1 Matthias Fend 2025-03-18  577  	/*
02e7ee00455be1 Matthias Fend 2025-03-18  578  	 * If only channels 1 and 3 are used, the step size is doubled because the two channels
02e7ee00455be1 Matthias Fend 2025-03-18  579  	 * share the same current control register.
02e7ee00455be1 Matthias Fend 2025-03-18  580  	 */
02e7ee00455be1 Matthias Fend 2025-03-18  581  	current_step_multiplier =
02e7ee00455be1 Matthias Fend 2025-03-18  582  		(tps6131x->chan1_en && tps6131x->chan3_en && !tps6131x->chan2_en) ? 2 : 1;
02e7ee00455be1 Matthias Fend 2025-03-18  583  	tps6131x->step_flash_current_ma = current_step_multiplier * TPS6131X_FLASH_STEP_I_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  584  	tps6131x->step_torch_current_ma = current_step_multiplier * TPS6131X_TORCH_STEP_I_MA;
02e7ee00455be1 Matthias Fend 2025-03-18  585  
02e7ee00455be1 Matthias Fend 2025-03-18  586  	ret = fwnode_property_read_u32(tps6131x->led_node, "led-max-microamp", &current_ua);
02e7ee00455be1 Matthias Fend 2025-03-18  587  	if (ret < 0) {
02e7ee00455be1 Matthias Fend 2025-03-18  588  		dev_err(dev, "Failed to read led-max-microamp property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  589  		return ret;
02e7ee00455be1 Matthias Fend 2025-03-18  590  	}
02e7ee00455be1 Matthias Fend 2025-03-18  591  
02e7ee00455be1 Matthias Fend 2025-03-18  592  	tps6131x->max_torch_current_ma = UA_TO_MA(current_ua);
02e7ee00455be1 Matthias Fend 2025-03-18  593  
02e7ee00455be1 Matthias Fend 2025-03-18  594  	if (!tps6131x->max_torch_current_ma ||
02e7ee00455be1 Matthias Fend 2025-03-18  595  	    tps6131x->max_torch_current_ma > max_current_torch_ma ||
02e7ee00455be1 Matthias Fend 2025-03-18  596  	    (tps6131x->max_torch_current_ma % tps6131x->step_torch_current_ma)) {
02e7ee00455be1 Matthias Fend 2025-03-18  597  		dev_err(dev, "led-max-microamp out of range or not a multiple of %u\n",
02e7ee00455be1 Matthias Fend 2025-03-18  598  			tps6131x->step_torch_current_ma);
02e7ee00455be1 Matthias Fend 2025-03-18  599  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  600  	}
02e7ee00455be1 Matthias Fend 2025-03-18  601  
02e7ee00455be1 Matthias Fend 2025-03-18  602  	ret = fwnode_property_read_u32(tps6131x->led_node, "flash-max-microamp", &current_ua);
02e7ee00455be1 Matthias Fend 2025-03-18  603  	if (ret < 0) {
02e7ee00455be1 Matthias Fend 2025-03-18  604  		dev_err(dev, "Failed to read flash-max-microamp property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  605  		return ret;
02e7ee00455be1 Matthias Fend 2025-03-18  606  	}
02e7ee00455be1 Matthias Fend 2025-03-18  607  
02e7ee00455be1 Matthias Fend 2025-03-18  608  	tps6131x->max_flash_current_ma = UA_TO_MA(current_ua);
02e7ee00455be1 Matthias Fend 2025-03-18  609  
02e7ee00455be1 Matthias Fend 2025-03-18  610  	if (!tps6131x->max_flash_current_ma ||
02e7ee00455be1 Matthias Fend 2025-03-18  611  	    tps6131x->max_flash_current_ma > max_current_flash_ma ||
02e7ee00455be1 Matthias Fend 2025-03-18  612  	    (tps6131x->max_flash_current_ma % tps6131x->step_flash_current_ma)) {
02e7ee00455be1 Matthias Fend 2025-03-18  613  		dev_err(dev, "flash-max-microamp out of range or not a multiple of %u\n",
02e7ee00455be1 Matthias Fend 2025-03-18  614  			tps6131x->step_flash_current_ma);
02e7ee00455be1 Matthias Fend 2025-03-18  615  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  616  	}
02e7ee00455be1 Matthias Fend 2025-03-18  617  
02e7ee00455be1 Matthias Fend 2025-03-18  618  	ret = fwnode_property_read_u32(tps6131x->led_node, "flash-max-timeout-us", &timeout_us);
02e7ee00455be1 Matthias Fend 2025-03-18  619  	if (ret < 0) {
02e7ee00455be1 Matthias Fend 2025-03-18  620  		dev_err(dev, "Failed to read flash-max-timeout-us property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  621  		return ret;
02e7ee00455be1 Matthias Fend 2025-03-18  622  	}
02e7ee00455be1 Matthias Fend 2025-03-18  623  
02e7ee00455be1 Matthias Fend 2025-03-18  624  	timer_config = tps6131x_find_closest_timer_config(timeout_us);
02e7ee00455be1 Matthias Fend 2025-03-18  625  	tps6131x->max_timeout_us = timer_config->time_us;
02e7ee00455be1 Matthias Fend 2025-03-18  626  
02e7ee00455be1 Matthias Fend 2025-03-18  627  	if (tps6131x->max_timeout_us != timeout_us)
02e7ee00455be1 Matthias Fend 2025-03-18  628  		dev_warn(dev, "flash-max-timeout-us %u not supported (using %u)\n", timeout_us,
02e7ee00455be1 Matthias Fend 2025-03-18  629  			 tps6131x->max_timeout_us);
02e7ee00455be1 Matthias Fend 2025-03-18  630  
02e7ee00455be1 Matthias Fend 2025-03-18  631  	return 0;
02e7ee00455be1 Matthias Fend 2025-03-18  632  }
02e7ee00455be1 Matthias Fend 2025-03-18  633  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
