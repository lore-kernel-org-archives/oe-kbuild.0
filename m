Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795668593;
	b=R39HJiLPe52Y3T0Jao9JzKPQ9Q5yfV2nt1xDuAwuQm81PCiDGivXyrBfr6Q1uMl0ct7q
	 /KuBxelBHkix8YU5K2s1waqkQF6HeqLuqc2PjOvLY5m+LdCi5EaNeCxIGYWNhnHy5WnOU
	 uXxyJKDcNgSTHybdwBf/zy0v9qbBJGYYMDW3rNC1FmMyFv/zvbY8WWQQkB0QxvEIkd5CZ
	 hPeE6PTLIP7iTRSpfzSG7zMq9zmxYJh3Ie7aIYaWFRuiPcu1hagsEaJkyBkbJN7wYg+wE
	 X/duOKYKOJY0efSUKnSQ3MyUy8Vcq9dat74i/I1rqECXp8qJkYi8UY/XItHVhttlE+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0yvjY3DLlMHNPnujBjUw1SnCnkmTF2L5cTfBdUbO5e0=;
	b=K5hKeLiXsflxYalDzVIJD19IoEhQeUl3jYDds4cL7TNwioTz6eelej75FzU0EvKQprZR
	 B4fnlDS438WahSDxQha4Zb4e/umfqev/JqUYG9zgNIwwrMF+hAhj+2Fmumir9eypscLa+
	 Z4DCBgb2gcvKrbiQUf4s2x3c6fGo73YcX1+wWTz7Ay1R33zRWWtCi/MXj0iAgZbP4YJjP
	 2PsQe2A9mbjmLIRJlRgnNCR8PcSECBJFNlUcFc8MpAb1jWCe37V6LZbjk8VisIGaYTg/8
	 9UGTM1G3Z583FhHCQprzvCWi7Pd4spxbmdpQcAPmgM2KaNsTwZnk757GPAFLAYdgg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLhgtAo7;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2372D606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 04:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2372D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLhgtAo7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795668593; x=1827204593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjbvM4J77anqqSNE/TpMNptkBBIOGdT4bFb1RLR7SzU=;
  b=nLhgtAo7KbrKbuVdep7TWa+wDSRS7vEMKRNYyF1q4bQVHXguDqPM3bYg
   Gwjdn3pUQz+BWWakewRRr91umHpv3FvFX4gLaXl6FJbLDaW58gPUCvKSk
   lAHx+rYpDJZacg57dOjTANg80YtVTmeV5YhLWoUno68OHm/z+PhWdTQeh
   +hgWGMiPxWToIJrLsqi1vxZyANxwEqmEAbOtkKZ8mvZ2W4bPNIcLF3lIA
   xJ75L4AnTjzW0jcH4E815m1xhVjl7yReOfUOwzlWetqp1v7r64lddSkos
   UEFL8Wg651NQrSYrPxTXrl065/nLhoDJpwQUIyQkyczGPZ7ps0H2Ztqcf
   w==;
X-CSE-ConnectionGUID: nQVGb2KTQrSP+AtUa/VHkg==
X-CSE-MsgGUID: Va0vizJER2uYGWzFBcKieg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4558742"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4558742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:49:52 -0800
X-CSE-ConnectionGUID: tbG28wt+T1SHAjj7YpqfAg==
X-CSE-MsgGUID: 8V1e+L7PTUuGz+BOSwQ/fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11950714"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 20:49:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWRQa-00000001TIQ-3YgU;
	Thu, 26 Nov 2026 04:49:48 +0000
Date: Thu, 26 Nov 2026 12:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
Message-ID: <20261126123709.ZqteGZZ6-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125123146.379057-4-hikmahgumelar@gmail.com>
References: <20261125123146.379057-4-hikmahgumelar@gmail.com>
TO: Hikmah Gumelar <hikmahgumelar@gmail.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abel Vesa <abelvesa@kernel.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Brian Masney <bmasney+clk@redhat.com>
TO: Jerome Brunet <jbrunet+clk@baylibre.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: u.kleine-koenig@baylibre.com
CC: Hikmah Gumelar <hikmahgumelar@gmail.com>

Hi Hikmah,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261124]
[cannot apply to robh/for-next linuxtv-media-pending/master media-tree/master linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hikmah-Gumelar/clk-qcom-gcc-msm8953-fix-csi_phytimer_clk_src-100MHz-parent/20261125-193140
base:   next-20261124
patch link:    https://lore.kernel.org/r/20261125123146.379057-4-hikmahgumelar%40gmail.com
patch subject: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-1003-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126123709.ZqteGZZ6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126123709.ZqteGZZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126123709.ZqteGZZ6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/thp7312.c: In function 'thp7312_probe':
>> drivers/media/i2c/thp7312.c:2097:20: error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean 'devm_ioremap_wc'? [-Werror=implicit-function-declaration]
     thp7312->regmap = devm_cci_regmap_init_i2c(client, 16);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
                       devm_ioremap_wc
>> drivers/media/i2c/thp7312.c:2097:18: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     thp7312->regmap = devm_cci_regmap_init_i2c(client, 16);
                     ^
   cc1: some warnings being treated as errors


vim +2097 drivers/media/i2c/thp7312.c

7a52ab415b43f3b Paul Elder       2023-11-24  2084  
7a52ab415b43f3b Paul Elder       2023-11-24  2085  static int thp7312_probe(struct i2c_client *client)
7a52ab415b43f3b Paul Elder       2023-11-24  2086  {
7a52ab415b43f3b Paul Elder       2023-11-24  2087  	struct device *dev = &client->dev;
7a52ab415b43f3b Paul Elder       2023-11-24  2088  	struct thp7312_device *thp7312;
7a52ab415b43f3b Paul Elder       2023-11-24  2089  	int ret;
7a52ab415b43f3b Paul Elder       2023-11-24  2090  
4dd10fbbeb9c337 Kees Cook        2026-10-28  2091  	thp7312 = devm_kzalloc_obj(dev, *thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2092  	if (!thp7312)
7a52ab415b43f3b Paul Elder       2023-11-24  2093  		return -ENOMEM;
7a52ab415b43f3b Paul Elder       2023-11-24  2094  
7a52ab415b43f3b Paul Elder       2023-11-24  2095  	thp7312->dev = dev;
7a52ab415b43f3b Paul Elder       2023-11-24  2096  
7a52ab415b43f3b Paul Elder       2023-11-24 @2097  	thp7312->regmap = devm_cci_regmap_init_i2c(client, 16);
7a52ab415b43f3b Paul Elder       2023-11-24  2098  	if (IS_ERR(thp7312->regmap))
7a52ab415b43f3b Paul Elder       2023-11-24  2099  		return dev_err_probe(dev, PTR_ERR(thp7312->regmap),
7a52ab415b43f3b Paul Elder       2023-11-24  2100  				     "Unable to initialize I2C\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2101  
7a52ab415b43f3b Paul Elder       2023-11-24  2102  	ret = thp7312_parse_dt(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2103  	if (ret < 0)
7a52ab415b43f3b Paul Elder       2023-11-24  2104  		return ret;
7a52ab415b43f3b Paul Elder       2023-11-24  2105  
7a52ab415b43f3b Paul Elder       2023-11-24  2106  	ret = thp7312_get_regulators(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2107  	if (ret)
7a52ab415b43f3b Paul Elder       2023-11-24  2108  		return dev_err_probe(dev, ret, "Failed to get regulators\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2109  
7a52ab415b43f3b Paul Elder       2023-11-24  2110  	thp7312->iclk = devm_clk_get(dev, NULL);
7a52ab415b43f3b Paul Elder       2023-11-24  2111  	if (IS_ERR(thp7312->iclk))
7a52ab415b43f3b Paul Elder       2023-11-24  2112  		return dev_err_probe(dev, PTR_ERR(thp7312->iclk),
7a52ab415b43f3b Paul Elder       2023-11-24  2113  				     "Failed to get iclk\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2114  
7a52ab415b43f3b Paul Elder       2023-11-24  2115  	thp7312->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
7a52ab415b43f3b Paul Elder       2023-11-24  2116  	if (IS_ERR(thp7312->reset_gpio))
7a52ab415b43f3b Paul Elder       2023-11-24  2117  		return dev_err_probe(dev, PTR_ERR(thp7312->reset_gpio),
7a52ab415b43f3b Paul Elder       2023-11-24  2118  				     "Failed to get reset gpio\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2119  
7a52ab415b43f3b Paul Elder       2023-11-24  2120  	if (thp7312->boot_mode == THP7312_BOOT_MODE_2WIRE_SLAVE)
7a52ab415b43f3b Paul Elder       2023-11-24  2121  		return thp7312_register_flash_mode(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2122  
7a52ab415b43f3b Paul Elder       2023-11-24  2123  	v4l2_i2c_subdev_init(&thp7312->sd, client, &thp7312_subdev_ops);
5755be5f15d9e65 Laurent Pinchart 2023-11-27  2124  	thp7312->sd.internal_ops = &thp7312_internal_ops;
17971a430ff90df Tommaso Merciai  2024-10-29  2125  	thp7312->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
7a52ab415b43f3b Paul Elder       2023-11-24  2126  	thp7312->pad.flags = MEDIA_PAD_FL_SOURCE;
7a52ab415b43f3b Paul Elder       2023-11-24  2127  	thp7312->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
7a52ab415b43f3b Paul Elder       2023-11-24  2128  
7a52ab415b43f3b Paul Elder       2023-11-24  2129  	ret = media_entity_pads_init(&thp7312->sd.entity, 1, &thp7312->pad);
7a52ab415b43f3b Paul Elder       2023-11-24  2130  	if (ret)
7a52ab415b43f3b Paul Elder       2023-11-24  2131  		return ret;
7a52ab415b43f3b Paul Elder       2023-11-24  2132  
7a52ab415b43f3b Paul Elder       2023-11-24  2133  	/*
7a52ab415b43f3b Paul Elder       2023-11-24  2134  	 * Enable power management. The driver supports runtime PM, but needs to
7a52ab415b43f3b Paul Elder       2023-11-24  2135  	 * work when runtime PM is disabled in the kernel. To that end, power
7a52ab415b43f3b Paul Elder       2023-11-24  2136  	 * the device manually here.
7a52ab415b43f3b Paul Elder       2023-11-24  2137  	 */
7a52ab415b43f3b Paul Elder       2023-11-24  2138  	ret = thp7312_power_on(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2139  	if (ret)
7a52ab415b43f3b Paul Elder       2023-11-24  2140  		goto err_entity_cleanup;
7a52ab415b43f3b Paul Elder       2023-11-24  2141  
7a52ab415b43f3b Paul Elder       2023-11-24  2142  	ret = thp7312_read_firmware_version(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2143  	if (ret < 0) {
7a52ab415b43f3b Paul Elder       2023-11-24  2144  		dev_err(dev, "Camera is not found\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2145  		goto err_power_off;
7a52ab415b43f3b Paul Elder       2023-11-24  2146  	}
7a52ab415b43f3b Paul Elder       2023-11-24  2147  
7a52ab415b43f3b Paul Elder       2023-11-24  2148  	ret = thp7312_init_controls(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2149  	if (ret) {
7a52ab415b43f3b Paul Elder       2023-11-24  2150  		dev_err(dev, "Failed to initialize controls\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2151  		goto err_power_off;
7a52ab415b43f3b Paul Elder       2023-11-24  2152  	}
7a52ab415b43f3b Paul Elder       2023-11-24  2153  
7a52ab415b43f3b Paul Elder       2023-11-24  2154  	thp7312->sd.ctrl_handler = &thp7312->ctrl_handler;
7a52ab415b43f3b Paul Elder       2023-11-24  2155  	thp7312->sd.state_lock = thp7312->ctrl_handler.lock;
7a52ab415b43f3b Paul Elder       2023-11-24  2156  
7a52ab415b43f3b Paul Elder       2023-11-24  2157  	ret = v4l2_subdev_init_finalize(&thp7312->sd);
7a52ab415b43f3b Paul Elder       2023-11-24  2158  	if (ret < 0) {
7a52ab415b43f3b Paul Elder       2023-11-24  2159  		dev_err(dev, "Subdev active state initialization failed\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2160  		goto err_free_ctrls;
7a52ab415b43f3b Paul Elder       2023-11-24  2161  	}
7a52ab415b43f3b Paul Elder       2023-11-24  2162  
7a52ab415b43f3b Paul Elder       2023-11-24  2163  	/*
7a52ab415b43f3b Paul Elder       2023-11-24  2164  	 * Enable runtime PM with autosuspend. As the device has been powered
7a52ab415b43f3b Paul Elder       2023-11-24  2165  	 * manually, mark it as active, and increase the usage count without
7a52ab415b43f3b Paul Elder       2023-11-24  2166  	 * resuming the device.
7a52ab415b43f3b Paul Elder       2023-11-24  2167  	 */
7a52ab415b43f3b Paul Elder       2023-11-24  2168  	pm_runtime_set_active(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2169  	pm_runtime_get_noresume(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2170  	pm_runtime_enable(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2171  	pm_runtime_set_autosuspend_delay(dev, 1000);
7a52ab415b43f3b Paul Elder       2023-11-24  2172  	pm_runtime_use_autosuspend(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2173  
7a52ab415b43f3b Paul Elder       2023-11-24  2174  	ret = v4l2_async_register_subdev(&thp7312->sd);
7a52ab415b43f3b Paul Elder       2023-11-24  2175  	if (ret < 0) {
7a52ab415b43f3b Paul Elder       2023-11-24  2176  		dev_err(dev, "Subdev registration failed\n");
7a52ab415b43f3b Paul Elder       2023-11-24  2177  		goto err_pm;
7a52ab415b43f3b Paul Elder       2023-11-24  2178  	}
7a52ab415b43f3b Paul Elder       2023-11-24  2179  
7a52ab415b43f3b Paul Elder       2023-11-24  2180  	/*
7a52ab415b43f3b Paul Elder       2023-11-24  2181  	 * Decrease the PM usage count. The device will get suspended after the
7a52ab415b43f3b Paul Elder       2023-11-24  2182  	 * autosuspend delay, turning the power off.
7a52ab415b43f3b Paul Elder       2023-11-24  2183  	 */
7a52ab415b43f3b Paul Elder       2023-11-24  2184  	pm_runtime_put_autosuspend(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2185  
7a52ab415b43f3b Paul Elder       2023-11-24  2186  	dev_info(dev, "THP7312 firmware version %02u.%02u\n",
7a52ab415b43f3b Paul Elder       2023-11-24  2187  		 THP7312_FW_VERSION_MAJOR(thp7312->fw_version),
7a52ab415b43f3b Paul Elder       2023-11-24  2188  		 THP7312_FW_VERSION_MINOR(thp7312->fw_version));
7a52ab415b43f3b Paul Elder       2023-11-24  2189  
7a52ab415b43f3b Paul Elder       2023-11-24  2190  	return 0;
7a52ab415b43f3b Paul Elder       2023-11-24  2191  
7a52ab415b43f3b Paul Elder       2023-11-24  2192  err_pm:
7a52ab415b43f3b Paul Elder       2023-11-24  2193  	pm_runtime_disable(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2194  	pm_runtime_put_noidle(dev);
7a52ab415b43f3b Paul Elder       2023-11-24  2195  	v4l2_subdev_cleanup(&thp7312->sd);
7a52ab415b43f3b Paul Elder       2023-11-24  2196  err_free_ctrls:
7a52ab415b43f3b Paul Elder       2023-11-24  2197  	v4l2_ctrl_handler_free(&thp7312->ctrl_handler);
7a52ab415b43f3b Paul Elder       2023-11-24  2198  err_power_off:
7a52ab415b43f3b Paul Elder       2023-11-24  2199  	thp7312_power_off(thp7312);
7a52ab415b43f3b Paul Elder       2023-11-24  2200  err_entity_cleanup:
7a52ab415b43f3b Paul Elder       2023-11-24  2201  	media_entity_cleanup(&thp7312->sd.entity);
7a52ab415b43f3b Paul Elder       2023-11-24  2202  	return ret;
7a52ab415b43f3b Paul Elder       2023-11-24  2203  }
7a52ab415b43f3b Paul Elder       2023-11-24  2204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
