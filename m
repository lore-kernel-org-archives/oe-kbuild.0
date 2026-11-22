Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360174;
	b=UBxNcDcGky1cd/ub3LF3b4Z4S9Bsu5+Q8+1BezIafxNOeKIUNTLzS2mgeH+vdx/RtlU0
	 eSJgxd2eHqSwY+ou8sXDFHAcmAT0SJ1liqqznFcfgpZHb/5KloFsoQcE4lrd90oGd87FP
	 3SMROf1D9tOopbK8nXWDpkOLXzFOqc1e8C8612v4rxDyELiCx+NpVzl8qednErDqRy3XI
	 XJVHwMz4rAj2DAA7sXAYab94oARbES2ctZ+bKPvaURqI8AyjOqF9/bIYZS7Wva3680mwm
	 YsCspBhUXu+ZziOTnPqUkax1NxzFT3XjP36T8WCnwiZ6PZf5hEwZCpQXt0czAL0O5mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0dlTd6sPZblpaxn6lkQO5AQbx/PpiaLoXognXe3z8Ks=;
	b=LYkJAzgn/Ypuj/XPQ4Xe6/T/FU+GM+iqxBxERk2uuTZ+7ALinzmN4/vAZDOmSNshGJYb
	 YsvvGBfoHnyjBkAjvRAqwcg1UgUkJwHnTbvj7viAGo5cPn0Wp45JTwg7b2j1gU0ChkwBv
	 9cO6qpMijJWxX5dhHDQbc1XW3lQtx1mhx9UWzqzS4FTGwukJR6WrKt07eM8ysfbPhhbS4
	 O0inNa9DF6YnYPMr1BVF2OzyggFY01M/XIgO0YOJM7ItHP9HZ0rQYNYF0PsZNUZmtIg8X
	 jwUdm1JR9pt83MkkiqoUEH8QCc0jxc2nOfxXa3tTh9MnxNd99DlrdH0IiLyN1LP5bEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1NI8H2X;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97F606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 15:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD97F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1NI8H2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795360173; x=1826896173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSPNkgrd33f/hLlreW6c8Sx3AfxRO4iYVLPkViGKLTg=;
  b=l1NI8H2XKJNtm6JQlftKkOlVLSX8SOHR7JOIJBk+/3Yqe+lWeoznU+HY
   5KcuYvAigY2qtK7tfAY08dJjBcJDjO3+ySUBDIN438a9KksrtKcdfBIfV
   Sym0fdCHnsSUgBlWrzVAz45Yo9HM5dvXr36yUIiDtKq+z3oGzHrBjFl+9
   qKD8vnJRorU5ogTxB1tFSNweUyBnxpmbze1oTzCZNnF0oU+ym3/i6aE31
   bDKjvpq7wWjnWQKFeqU6gKcrhaC9JARfkAK0xM6KU5bzop+JfBkHDNL67
   Wbyt43UlXrsc+M24LUwzgBIa49LR1DNXYFTuc8DS7YUtidoYS5Y3b3J0j
   w==;
X-CSE-ConnectionGUID: scTYO+CkQqCBIm62yotKcw==
X-CSE-MsgGUID: XJaxUpmRSzCQ8iYbeLSVRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4068408"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4068408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 07:09:33 -0800
X-CSE-ConnectionGUID: U0+eCaqWR2ypGNIHsX112A==
X-CSE-MsgGUID: wGioyLLyTFSM9SXEkXm7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11673154"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2026 07:09:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV9C6-00000001LdU-08Xu;
	Sun, 22 Nov 2026 15:09:30 +0000
Date: Sun, 22 Nov 2026 23:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
Message-ID: <202611222214.32wErpfA-lkp@intel.com>
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
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261115090520.102216-3-clamor95@gmail.com>
References: <20261115090520.102216-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: "Griffin Kroah-Hartman" <griffin@kroah.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: mfd@lists.linux.dev

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Svyatoslav-Ryhel/regulator-dt-bindings-maxim-max8907-Convert-to-DT-schema/20261027-134631]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/regulator-dt-bindings-maxim-max8907-Document-LED-support/20261115-110518
base:   https://github.com/intel-lab-lkp/linux Svyatoslav-Ryhel/regulator-dt-bindings-maxim-max8907-Convert-to-DT-schema/20261027-134631
patch link:    https://lore.kernel.org/r/20261115090520.102216-3-clamor95%40gmail.com
patch subject: [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611222214.32wErpfA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611222214.32wErpfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611222214.32wErpfA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-max8907.c:68:10: error: call to undeclared function 'devm_kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
         |                 ^
   drivers/leds/leds-max8907.c:68:10: note: did you mean 'devm_kzalloc'?
   include/linux/device/devres.h:48:21: note: 'devm_kzalloc' declared here
      48 | static inline void *devm_kzalloc(struct device *dev, size_t size, gfp_t gfp)
         |                     ^
>> drivers/leds/leds-max8907.c:68:32: error: expected expression
      68 |         ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
         |                                       ^
   2 errors generated.


vim +/devm_kzalloc_obj +68 drivers/leds/leds-max8907.c

7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  55  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  56  static int max8907_led_probe(struct platform_device *pdev)
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  57  {
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  58  	struct device *dev = &pdev->dev;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  59  	struct device_node *led_np __free(device_node) =
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  60  		of_get_available_child_by_name(dev_of_node(dev->parent), "led");
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  61  	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  62  	struct led_init_data init_data = { };
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  63  	struct max8907_led_data *ddata;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  64  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  65  	if (!led_np)
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  66  		return -ENODEV;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  67  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15 @68  	ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  69  	if (!ddata)
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  70  		return -ENOMEM;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  71  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  72  	ddata->regmap = max8907->regmap_gen;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  73  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  74  	init_data.fwnode = of_fwnode_handle(led_np);
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  75  	init_data.devicename = "max8907";
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  76  	init_data.default_label = ":wled";
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  77  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  78  	ddata->cdev.brightness = LED_OFF;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  79  	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  80  	ddata->cdev.max_brightness = LED_FULL;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  81  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  82  	ddata->cdev.brightness_get = max8907_led_get_brightness;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  83  	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  84  
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  85  	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  86  }
7b85b7d8f42900 Svyatoslav Ryhel 2026-11-15  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
