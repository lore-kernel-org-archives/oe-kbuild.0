Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346369;
	b=OC+o5+5rI7k9ExyNFjj6IDmCNZlCWo8Rd64a2Mfwnced1EIhj3U3iC2Jlpyff3kjNsgF
	 x+0dE9bQAlpBf7PI4cDTNTNXNXCvVtmfiPEkY0KQVfJwkpkSPpwfN3y8aZaBy9H8cSuh1
	 2Fg2CO9MZrKN2yIm7cebTBvNFEb/nKDYJB3POS5kTOKzOS0vPddwORpiaLoMAN35HLjwT
	 yG5UKWnikqqNqK5qBPNqxaZzr6Vff9p0yCdfCz+v1TvoOY56cXDNMZKXlLkmRXbqkk4vM
	 kKx9xq1LrMhsH3oOTC84zaKFW+9fziEJHkRgRHdpIAqZ4XZqpwYBEZlVFjCNrTulslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346369;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=n5ZHDUEPA25NalRolai9jMtQpiXe4kMlfSRk9plbu98=;
	b=UJ6Pqu2MX9Elre9jPSEgZwwq1KCz2B5gyHgX5PFL7C06VdoRSRIL+sfGFE5WuGH3MJA1
	 IS6+VzE2PZlK5WigkEbY5TN9al3ewWkrT4Gl3eBoA2lBJR59uoDfNY2R7fRULG3DiA02u
	 /ajbW8I56qYzgRwrchV8YWfneTWwdXfPIkeN5EK02GxHC7KmGOhqmhNgWgO34PRhvpKz/
	 BGGKD6jZym00/Jvv2c1+vi8O6V96ILYqXOVYK7SM5XrpxV0pKNmKRfvsHeS7uQ4nOOzPU
	 EkU4ciImtVuAhf0UPLHijjv3YlR1fkHL8buXkTTgOblNZasBAAcLBqpsYUWa9ffunRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q4l2Yhz9;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE96606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 11:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE96606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q4l2Yhz9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795346368; x=1826882368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRtggBT84bGdVVwxBwBuStOnphNqij3Hkzt6oApSXzk=;
  b=Q4l2Yhz9bG8fn2YSF8R8s6epccuB5iIdHaeXs4vFduYuV3ywC83n2zdw
   Mt7sG6+wlyUFveylPNauWb79WS7wajboObkPiZOn26nzew+noWcdFWLNO
   kjteBw4Kyjs/iXBRGclvgUVlsMyQvlHCNew0hS6hS1Pdoud2I5eAkCrRS
   2ScwzdAZ/ePHLyYkek2jS6OrFeSVu//JRcCKZ1Oit016dbuN0gvQyrLi2
   kfv4fWHIXMM5lg9LpLj1mAfQGy7VU02gYut+DjDtVh2V+7Pe1To8iVLIy
   zG0gTvt3XrSoMMD7bo6c3Pugxi6mcNmE9P4XCubPgdu+yEmlZn5y5sRQS
   A==;
X-CSE-ConnectionGUID: 2zX51FX9SXW6O4WpbNUpAg==
X-CSE-MsgGUID: BXXv32rHSn2FbzjHAnGjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4183289"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4183289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:19:27 -0800
X-CSE-ConnectionGUID: vDxK17UQSwiUudPXyfLFyg==
X-CSE-MsgGUID: E1lAVCLzT56mJEV58I9/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11273488"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2026 03:18:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV5aO-00000001LOk-3Tbe;
	Sun, 22 Nov 2026 11:18:20 +0000
Date: Sun, 22 Nov 2026 19:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
Message-ID: <202611221902.rkRrBSnk-lkp@intel.com>
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611221902.rkRrBSnk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221902.rkRrBSnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611221902.rkRrBSnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-max8907.c: In function 'max8907_led_probe':
>> drivers/leds/leds-max8907.c:68:17: error: implicit declaration of function 'devm_kzalloc_obj'; did you mean 'devm_kzalloc'? [-Werror=implicit-function-declaration]
      68 |         ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
         |                 ^~~~~~~~~~~~~~~~
         |                 devm_kzalloc
>> drivers/leds/leds-max8907.c:68:39: error: expected expression before 'struct'
      68 |         ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
         |                                       ^~~~~~
   cc1: some warnings being treated as errors


vim +68 drivers/leds/leds-max8907.c

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
