Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794710277;
	b=5nJFPhE5GiK1Z2YgWJBkWQgDzklHSumSCtjZ8eUdiYpsilx8GDh+WW5fg32VBqEuN1Db
	 EGwv9AYu+fW5BZJqjZfR0kVa5N3MCBP5rRwNQyKe1Ajpjog2WbPJBiO02vaiJREkBBadA
	 Hlg0dfkBLSKnmwmoRBti2stCGEFGQYEz8Ro8YB9dXQ/eSdzZ27VvNFFdkV6CLtz9Aoe/j
	 dFfzGI0Np2CrM7Vq7SibB8tJVDaQEBzHW/lbwOr8ndqAh4mw2BLntSCUD083sGUzox8sy
	 apE/oasVNiQPEnuZWi6G/8RrPGbm7UBJFeGniQz3dFV4i1sb1wQkIr2VP1xgZf0odfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710277;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PWnnakoJq95zkENTbNdcgPScTLphTjKg3Z+CefNACMY=;
	b=ltjSmwguvZwKaxriq0cUbuym+zbGNJy+khbRsxoBNsNSOsWYT72diPcCN5IS62yUNXbh
	 ShSHVnppWnrEndVRaXEtVcQ7SnRBl84QVr4gLXMBhhfYDM+TBIFJYfgbgv0ipl4JDjR/i
	 y7vi0rDZ9onm/8G+FLeZ0Osbh4SWEDvkJGFBii31dLHT0BiPOC8F3Dkg2Lj8bcrGPzhDh
	 E9ZYltIUqcl7qs8A7VmACn8RKks0NeZZPLlAhVoX0hTZ3WMYqm70xznxKn6UWFTIR/mpv
	 LnKJy8UO4mrzp30TnfHZpmeSot9uGGsHF+Bd+SmR1FBW10sX3sdWMsdZI1jJA/KbpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djCfNCWq;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEA8606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 02:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djCfNCWq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794710277; x=1826246277;
  h=date:from:to:cc:subject:message-id;
  bh=eZbxXFtIZfN27+Y/N5vkUADLNv37rHY8aqZF/ER4ot8=;
  b=djCfNCWq1cOJQBmnj0/kBD08FBeyAaCJApMbLvn3uJI6Q6e5aK4igcJG
   OGDUpmYIxIxFjfVO/wRuULBTl250uzXQ4/RpBZNzACDMseA4IhlI1PvDo
   Oe9seSnEvmv9p6XYMpXSU+vapgKWXtzGW+E8dPsIAZEf/UqELq29OoQkG
   hHqm+03j8elkx//8jxU8WCkZtIMGHivv+RcNKdDhDaxiKnB2zBf3Ulllm
   Zv0DUbeDs1uCx7pzfK2GprOtFEMKZwN8Pgs9Fu51UDgaFyl8ELbbu8piA
   0h4RKjhND2yphWize3tcbPGw+0YtVmUC+bH8b+d3tnyvHfMdVOjDt/D7U
   Q==;
X-CSE-ConnectionGUID: QjRbqjlJScKVw1uaeD58XQ==
X-CSE-MsgGUID: 47dtQtldRYyMXtdkYRo5Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3477565"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3477565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 18:37:56 -0800
X-CSE-ConnectionGUID: 4hpmGoC9RCKvWQUIqYgL5g==
X-CSE-MsgGUID: YU4kH0clSkC2M7xnVgY0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9245134"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2026 18:37:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSQ7r-000000001z8-2DHl;
	Sun, 15 Nov 2026 02:37:51 +0000
Date: Sun, 15 Nov 2026 03:37:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 282/283]
 drivers/iio/adc/ti-ads112c14.c:412 ads112c14_gpio_get_direction() warn:
 subtract is higher precedence than shift
Message-ID: <202611150351.IEyI2faZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Lechner (TI)" <dlechner@baylibre.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   3188a89c2608538435bba0d32a472422291c4792
commit: 9c53dce4b5e9b9b5b44393729c7867582a92132d [282/283] iio: adc: ti-ads112c14: add gpio support
:::::: branch date: 3 hours ago
:::::: commit date: 4 hours ago
config: m68k-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261115/202611150351.IEyI2faZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611150351.IEyI2faZ-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ti-ads112c14.c:412 ads112c14_gpio_get_direction() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:412 ads112c14_gpio_get_direction() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:412 ads112c14_gpio_get_direction() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:412 ads112c14_gpio_get_direction() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:431 ads112c14_gpio_direction_input() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:431 ads112c14_gpio_direction_input() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:431 ads112c14_gpio_direction_input() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:431 ads112c14_gpio_direction_input() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:450 ads112c14_gpio_direction_output() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:450 ads112c14_gpio_direction_output() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:450 ads112c14_gpio_direction_output() warn: subtract is higher precedence than shift
drivers/iio/adc/ti-ads112c14.c:450 ads112c14_gpio_direction_output() warn: subtract is higher precedence than shift

Old smatch warnings:
include/linux/iio/iio.h:788 class___priv__iio_dev_mode_lock_try_direct_constructor() warn: passing zero to 'ERR_PTR'

vim +412 drivers/iio/adc/ti-ads112c14.c

9c53dce4b5e9b9 David Lechner (TI  2026-11-06  400) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  401) static int ads112c14_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  402) {
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  403) 	struct iio_dev *indio_dev = gpiochip_get_data(gc);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  404) 	struct ads112c14_data *data = iio_priv(indio_dev);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  405) 	unsigned int reg_val;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  406) 	int ret;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  407) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  408) 	ret = regmap_read(data->regmap, ADS112C14_REG_GPIO_CFG, &reg_val);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  409) 	if (ret)
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  410) 		return ret;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  411) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06 @412) 	switch (field_get(ADS112C14_GPIO_CFG_GPIO_CFG(offset), reg_val)) {
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  413) 	case ADS112C14_GPIO_CFG_GPIO_CFG_INPUT:
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  414) 		return GPIO_LINE_DIRECTION_IN;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  415) 	case ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL:
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  416) 	case ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_OPEN_DRAIN:
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  417) 		return GPIO_LINE_DIRECTION_OUT;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  418) 	default:
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  419) 		return -EINVAL;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  420) 	}
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  421) }
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  422) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  423) static int ads112c14_gpio_direction_input(struct gpio_chip *gc,
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  424) 					  unsigned int offset)
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  425) {
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  426) 	struct iio_dev *indio_dev = gpiochip_get_data(gc);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  427) 	struct ads112c14_data *data = iio_priv(indio_dev);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  428) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  429) 	return regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  430) 				  ADS112C14_GPIO_CFG_GPIO_CFG(offset),
9c53dce4b5e9b9 David Lechner (TI  2026-11-06 @431) 				  field_prep(ADS112C14_GPIO_CFG_GPIO_CFG(offset),
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  432) 					     ADS112C14_GPIO_CFG_GPIO_CFG_INPUT));
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  433) }
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  434) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  435) static int ads112c14_gpio_direction_output(struct gpio_chip *gc,
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  436) 					   unsigned int offset, int value)
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  437) {
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  438) 	struct iio_dev *indio_dev = gpiochip_get_data(gc);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  439) 	struct ads112c14_data *data = iio_priv(indio_dev);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  440) 	int ret;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  441) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  442) 	ret = regmap_assign_bits(data->regmap, ADS112C14_REG_GPIO_DATA_OUTPUT,
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  443) 				 ADS112C14_GPIO_DATA_OUTPUT_GPIO_DAT_OUT(offset),
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  444) 				 value);
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  445) 	if (ret)
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  446) 		return ret;
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  447) 
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  448) 	return regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  449) 				  ADS112C14_GPIO_CFG_GPIO_CFG(offset),
9c53dce4b5e9b9 David Lechner (TI  2026-11-06 @450) 				  field_prep(ADS112C14_GPIO_CFG_GPIO_CFG(offset),
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  451) 					     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL));
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  452) }
9c53dce4b5e9b9 David Lechner (TI  2026-11-06  453) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
