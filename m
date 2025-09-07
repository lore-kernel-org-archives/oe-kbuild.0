Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF355315D3D
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757217071; cv=none; b=mN5eZqzC9rYaC47TtYVP618L1eaGqgJCyMUVIPT0A1uTzMf51+3mGMiaLZumdCqQD69YluJbb0SoSJF/XneNUeVhx7LuGY8FiD4wQz7O6sYn3aeSQiWZmlNd/3+uJ13XNfnpbziIBBa7K2mjZZKG7VN8T0IBGyIzwp5OhfnlaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757217071; c=relaxed/simple;
	bh=YImx/3hA0wYXDuZtOl6BuH8NqLXVsSn0wN029+Nzdzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0XHiO1cZPOLvt8CS86nFDnKX9CpjD3eq4Aeo9pixC7Oqz+Ym19hFc+c3FYSUwjIeOwe6lpDI4U08q1miN5GBw9muWV/4QA5t/cVYtcHpfH3tXrjUP61pGQLfVNlq+3S/6AaTAsZjficYjEb3P2qi0SaHd1JiZPnUgiK+/vWn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgsKVGGN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgsKVGGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757217070; x=1788753070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YImx/3hA0wYXDuZtOl6BuH8NqLXVsSn0wN029+Nzdzs=;
  b=hgsKVGGNOP7VyOuwixvQ/Esgv1SzlP+sWl9PUpxqqn7Qa8nVO23wG1HS
   94c2s2PsKHOPQGSPPDDGEH3HmU6Hpy3iiUYrSLCcDrafy0YyqVcNJI84b
   DAb+ZhgLujnEb6yuiOF3oVzRkE32cMPmkGhG4fH7wpsy5fcq11sirlmN9
   sruSHhLrONWzzeCHrb4GmmKqkEYgBsHZWZYymy1YIh3IKYUwLeyyAeFnf
   PWIK+Xqw6kvE6CzH4Ap5vpSUOwYpCU5UW/f030bya1msknoHBg9kdIYyy
   eMUaPZYrOupbI5/hf3VNtL7AecwDDSpuNtWx8tHCGatvRJRVVCESdH103
   Q==;
X-CSE-ConnectionGUID: f//D4q+2T3qFniF9p4xPVQ==
X-CSE-MsgGUID: j734YuPZRQeYarKaCAuMKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="59659092"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="59659092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 20:51:09 -0700
X-CSE-ConnectionGUID: kJrs24J2RdCeKjVfOERQ7A==
X-CSE-MsgGUID: ng4wuyh9RgCxPvklhaiQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172045200"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2025 20:51:08 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv6Qj-00020J-2w;
	Sun, 07 Sep 2025 03:51:05 +0000
Date: Sun, 7 Sep 2025 11:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
Message-ID: <202509071141.TSai6ltk-lkp@intel.com>
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
In-Reply-To: <20250906-sy7636-rsrc-v1-3-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-3-e2886a9763a7@kernel.org>
TO: Andreas Kemnade <akemnade@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alistair Francis <alistair@alistair23.me>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Andreas Kemnade <akemnade@kernel.org>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b237f190eb3d36f52dffe07a40b5eb210280e00]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-mfd-sy7636a-Add-missing-gpio-pins-and-supply/20250906-171133
base:   1b237f190eb3d36f52dffe07a40b5eb210280e00
patch link:    https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-3-e2886a9763a7%40kernel.org
patch subject: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071141.TSai6ltk-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509071141.TSai6ltk-lkp@intel.com/

smatch warnings:
drivers/regulator/sy7636a-regulator.c:121 sy7636a_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/regulator/sy7636a-regulator.c

8c485bedfb7852 Alistair Francis 2021-06-15   76  
8c485bedfb7852 Alistair Francis 2021-06-15   77  static int sy7636a_regulator_probe(struct platform_device *pdev)
8c485bedfb7852 Alistair Francis 2021-06-15   78  {
cb17820ef71ed7 Alistair Francis 2021-10-15   79  	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
8c485bedfb7852 Alistair Francis 2021-06-15   80  	struct regulator_config config = { };
8c485bedfb7852 Alistair Francis 2021-06-15   81  	struct regulator_dev *rdev;
8c485bedfb7852 Alistair Francis 2021-06-15   82  	struct gpio_desc *gdp;
d38d49b140043b Alistair Francis 2021-08-03   83  	struct sy7636a_data *data;
8c485bedfb7852 Alistair Francis 2021-06-15   84  	int ret;
8c485bedfb7852 Alistair Francis 2021-06-15   85  
27fdd3bbb7a138 Alistair Francis 2021-08-06   86  	if (!regmap)
8c485bedfb7852 Alistair Francis 2021-06-15   87  		return -EPROBE_DEFER;
8c485bedfb7852 Alistair Francis 2021-06-15   88  
07678e530d8eab Andreas Kemnade  2025-09-06   89  	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
07678e530d8eab Andreas Kemnade  2025-09-06   90  
07678e530d8eab Andreas Kemnade  2025-09-06   91  	gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
8c485bedfb7852 Alistair Francis 2021-06-15   92  	if (IS_ERR(gdp)) {
07678e530d8eab Andreas Kemnade  2025-09-06   93  		dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
8c485bedfb7852 Alistair Francis 2021-06-15   94  		return PTR_ERR(gdp);
8c485bedfb7852 Alistair Francis 2021-06-15   95  	}
8c485bedfb7852 Alistair Francis 2021-06-15   96  
d38d49b140043b Alistair Francis 2021-08-03   97  	data = devm_kzalloc(&pdev->dev, sizeof(struct sy7636a_data), GFP_KERNEL);
d38d49b140043b Alistair Francis 2021-08-03   98  	if (!data)
d38d49b140043b Alistair Francis 2021-08-03   99  		return -ENOMEM;
d38d49b140043b Alistair Francis 2021-08-03  100  
27fdd3bbb7a138 Alistair Francis 2021-08-06  101  	data->regmap = regmap;
d38d49b140043b Alistair Francis 2021-08-03  102  	data->pgood_gpio = gdp;
d38d49b140043b Alistair Francis 2021-08-03  103  
327603c2e83590 Andreas Kemnade  2025-09-06  104  	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
327603c2e83590 Andreas Kemnade  2025-09-06  105  	if (ret)
327603c2e83590 Andreas Kemnade  2025-09-06  106  		return dev_err_probe(&pdev->dev, ret,
327603c2e83590 Andreas Kemnade  2025-09-06  107  				     "failed to get vin regulator\n");
327603c2e83590 Andreas Kemnade  2025-09-06  108  
327603c2e83590 Andreas Kemnade  2025-09-06  109  	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "en",
327603c2e83590 Andreas Kemnade  2025-09-06  110  						GPIOD_OUT_HIGH);
327603c2e83590 Andreas Kemnade  2025-09-06  111  	if (IS_ERR(data->en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  112  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  113  				     PTR_ERR(data->en_gpio),
327603c2e83590 Andreas Kemnade  2025-09-06  114  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  115  
327603c2e83590 Andreas Kemnade  2025-09-06  116  	/* Let VCOM just follow the default power on sequence */
327603c2e83590 Andreas Kemnade  2025-09-06  117  	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  118  						     "vcom-en", GPIOD_OUT_LOW);
327603c2e83590 Andreas Kemnade  2025-09-06  119  	if (IS_ERR(data->vcom_en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  120  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06 @121  				     PTR_ERR(data->en_gpio),
327603c2e83590 Andreas Kemnade  2025-09-06  122  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  123  
327603c2e83590 Andreas Kemnade  2025-09-06  124  	if (data->en_gpio)
327603c2e83590 Andreas Kemnade  2025-09-06  125  		usleep_range(2500, 4000);
327603c2e83590 Andreas Kemnade  2025-09-06  126  
d38d49b140043b Alistair Francis 2021-08-03  127  	platform_set_drvdata(pdev, data);
8c485bedfb7852 Alistair Francis 2021-06-15  128  
27fdd3bbb7a138 Alistair Francis 2021-08-06  129  	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);
8c485bedfb7852 Alistair Francis 2021-06-15  130  	if (ret) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  131  		dev_err(pdev->dev.parent, "Failed to initialize regulator: %d\n", ret);
8c485bedfb7852 Alistair Francis 2021-06-15  132  		return ret;
8c485bedfb7852 Alistair Francis 2021-06-15  133  	}
8c485bedfb7852 Alistair Francis 2021-06-15  134  
8c485bedfb7852 Alistair Francis 2021-06-15  135  	config.dev = &pdev->dev;
27fdd3bbb7a138 Alistair Francis 2021-08-06  136  	config.regmap = regmap;
8c485bedfb7852 Alistair Francis 2021-06-15  137  
8c485bedfb7852 Alistair Francis 2021-06-15  138  	rdev = devm_regulator_register(&pdev->dev, &desc, &config);
8c485bedfb7852 Alistair Francis 2021-06-15  139  	if (IS_ERR(rdev)) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  140  		dev_err(pdev->dev.parent, "Failed to register %s regulator\n",
8c485bedfb7852 Alistair Francis 2021-06-15  141  			pdev->name);
8c485bedfb7852 Alistair Francis 2021-06-15  142  		return PTR_ERR(rdev);
8c485bedfb7852 Alistair Francis 2021-06-15  143  	}
8c485bedfb7852 Alistair Francis 2021-06-15  144  
8c485bedfb7852 Alistair Francis 2021-06-15  145  	return 0;
8c485bedfb7852 Alistair Francis 2021-06-15  146  }
8c485bedfb7852 Alistair Francis 2021-06-15  147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
