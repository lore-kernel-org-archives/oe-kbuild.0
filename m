Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3B28C869
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 21:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746447; cv=none; b=aoIHFaoZQ3Pm/uiJ/9BoqNXy7E9BxkPBxo/a6ul6vMGHZLev2DUpmdI4mZBbXjcvTA7/VGvfTaZMPsoQywRNCMdS0+vdMwnVUbi6bsTGzL5McRK/LkhTZRbyb3Pk+spIifSyZQEsZldPbLqxQOhSo6pSXdPrmsfVyv1gVZ+Ir0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746447; c=relaxed/simple;
	bh=Ueq2h+3M9WW4ZWZHsbguRDaEhCjOE6uXYQL0yuRoK70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7hrXunTXMQ7wb50Xg/xyS5KHJMlxZSfa8MpJTxRdTXRcZFGNN+tJXSx7ZgFn5qfDzeAsEjo0wsPZTnMORrXLXWYC6lwY9smf24iqwGG5Tzpdvoe09PWXLIdXbHu/Hrl2T1ThypSxfvBueLCzZlrmvB/5lZVP6DWumQPKBi5gvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kECbf4fR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kECbf4fR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746446; x=1804282446;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ueq2h+3M9WW4ZWZHsbguRDaEhCjOE6uXYQL0yuRoK70=;
  b=kECbf4fRfSamU0BOpRwfT/pErdIFyAaU/4hiF8QjKfkTZ97MoxOxc7yR
   J40z/zYaVvkmUO9s3Z2uKu7SOT74jzOHrX6y51XEjva7LwscWsF4mAs0N
   nqG2jJV4cySBH8A2g1G10Iz5reZEsWkURzqPoMuqwmPxc3fqBAqls+OXr
   MdP/s3EGOgJu5td4UqYrj/IBHN1WlpCG2kEB+H2+RhorEjaCq0TKlbk8M
   P9O1vP3OYVXBBbxarT1WjnzapgqDdWdKfR5ZA7oYtM9a0UBd2XaZofw/E
   DNtymdGcZr0EsBiAbGFG7UMLGIIve1YLkFO5zVXhddIBaWn+kkZToDf4h
   w==;
X-CSE-ConnectionGUID: RxLzHpKoRASL0mpvXtZSUQ==
X-CSE-MsgGUID: HfrHx7xhS4ursigaGA6NUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73548611"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73548611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:34:05 -0800
X-CSE-ConnectionGUID: I5EwKufXQXWlZY9fYLjnpg==
X-CSE-MsgGUID: hHjfLncfRj6skDtpcWBl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="217949913"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2026 13:34:04 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyGKW-000000001F4-2mDY;
	Thu, 05 Mar 2026 21:34:00 +0000
Date: Fri, 6 Mar 2026 05:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <202603060519.yhjmNHBu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260303-ltc4283-support-v6-3-efe11502fad2@analog.com>
References: <20260303-ltc4283-support-v6-3-efe11502fad2@analog.com>
TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
TO: linux-gpio@vger.kernel.org
TO: linux-hwmon@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bindings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
base:   78558965440b27814592ec82d8f3668395953b1b
patch link:    https://lore.kernel.org/r/20260303-ltc4283-support-v6-3-efe11502fad2%40analog.com
patch subject: [PATCH v6 3/3] gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-r073-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060519.yhjmNHBu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603060519.yhjmNHBu-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract is higher precedence than shift

vim +46 drivers/gpio/gpio-ltc4283.c

4b9a9341c8ecd8 Nuno Sá 2026-03-03  36  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  37  static int ltc4283_pgio_get_direction(const struct ltc4283_gpio *st, unsigned int off)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  38  {
4b9a9341c8ecd8 Nuno Sá 2026-03-03  39  	unsigned int val;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  40  	int ret;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  41  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  42  	ret = regmap_read(st->regmap, LTC4283_PGIO_CONFIG, &val);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  43  	if (ret)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  44  		return ret;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  45  
4b9a9341c8ecd8 Nuno Sá 2026-03-03 @46  	val = field_get(LTC4283_PGIO_CFG_MASK(off), val);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  47  	if (val == LTC4283_PGIO_DIR_IN)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  48  		return GPIO_LINE_DIRECTION_IN;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  49  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  50  	return GPIO_LINE_DIRECTION_OUT;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  51  }
4b9a9341c8ecd8 Nuno Sá 2026-03-03  52  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  53  static int ltc4283_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  54  {
4b9a9341c8ecd8 Nuno Sá 2026-03-03  55  	struct ltc4283_gpio *st = gpiochip_get_data(gc);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  56  	unsigned int val;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  57  	int ret;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  58  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  59  	if (off >= LTC4283_PGIOX_START_NR)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  60  		return ltc4283_pgio_get_direction(st, off);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  61  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  62  	ret = regmap_read(st->regmap, LTC4283_ADIO_CONFIG, &val);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  63  	if (ret)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  64  		return ret;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  65  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  66  	if (val & LTC4283_ADIOX_CONFIG_MASK(off))
4b9a9341c8ecd8 Nuno Sá 2026-03-03  67  		return GPIO_LINE_DIRECTION_IN;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  68  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  69  	return GPIO_LINE_DIRECTION_OUT;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  70  }
4b9a9341c8ecd8 Nuno Sá 2026-03-03  71  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  72  static int ltc4283_gpio_direction_set(const struct ltc4283_gpio *st,
4b9a9341c8ecd8 Nuno Sá 2026-03-03  73  				      unsigned int off, bool input)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  74  {
4b9a9341c8ecd8 Nuno Sá 2026-03-03  75  	if (off >= LTC4283_PGIOX_START_NR) {
4b9a9341c8ecd8 Nuno Sá 2026-03-03  76  		unsigned int val = LTC4283_PGIO_DIR_OUT;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  77  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  78  		if (input)
4b9a9341c8ecd8 Nuno Sá 2026-03-03  79  			val = LTC4283_PGIO_DIR_IN;
4b9a9341c8ecd8 Nuno Sá 2026-03-03  80  
4b9a9341c8ecd8 Nuno Sá 2026-03-03 @81  		val = field_prep(LTC4283_PGIO_CFG_MASK(off), val);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  82  		return regmap_update_bits(st->regmap, LTC4283_PGIO_CONFIG,
4b9a9341c8ecd8 Nuno Sá 2026-03-03  83  					  LTC4283_PGIO_CFG_MASK(off), val);
4b9a9341c8ecd8 Nuno Sá 2026-03-03  84  	}
4b9a9341c8ecd8 Nuno Sá 2026-03-03  85  
4b9a9341c8ecd8 Nuno Sá 2026-03-03  86  	return regmap_update_bits(st->regmap, LTC4283_ADIO_CONFIG,
4b9a9341c8ecd8 Nuno Sá 2026-03-03  87  				  LTC4283_ADIOX_CONFIG_MASK(off),
4b9a9341c8ecd8 Nuno Sá 2026-03-03  88  				  field_prep(LTC4283_ADIOX_CONFIG_MASK(off), input));
4b9a9341c8ecd8 Nuno Sá 2026-03-03  89  }
4b9a9341c8ecd8 Nuno Sá 2026-03-03  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
