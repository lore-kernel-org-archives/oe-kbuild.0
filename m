Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF92156C9
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683231353; x=1714767353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLznv326pM7/KgmLgjhLpeE22B0Afy6wEi5OiEEIbaA=;
  b=CDhf+BDJkprHBj9VVwwubPZc4ymba8aw1GYq9oZMizNC5zY801Jlj5Yz
   239oB3UhXITWGHqIYy7lVAlX9OMv/lfjQ0QihV8yXw8nXVQ70Mu/PcZaf
   FNXsU8md/rhqa8/x9RwVF2MmyfXOTC62j/Ep0dNRylT5ngXKW2Y9X2jXU
   OKQx4blHYRRHFv+l7fHcgVLvVLz8nOEzdS7K/ULF0A5LWV3pF/h/rbQS2
   Q4+cT6lnrbrfYVtqMZGBDht2VnEDjgipOhGAkKbTNQ0+W470gok09cMIl
   CBnpf359m0TNfAVcrII4jY8IBaPRbImUU+H8T2N47yVEhqlgUxJvNaUc3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414568504"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="414568504"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 13:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808898269"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="808898269"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 13:15:51 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pufMl-00007g-0L;
	Thu, 04 May 2023 20:15:51 +0000
Date: Fri, 5 May 2023 04:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpiolib-of.c:232 of_gpio_set_polarity_by_property()
 warn: we never enter this loop
Message-ID: <202305050458.oPqINm1R-lkp@intel.com>
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
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a5304fecee523060f26e2778d9d8e33c0562df3
commit: 34cb9352b62366038fd2d5b9d9f393f35d0be1e0 gpiolib: of: factor out quirk setting polarity via separate property
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230505/202305050458.oPqINm1R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305050458.oPqINm1R-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-of.c:232 of_gpio_set_polarity_by_property() warn: we never enter this loop

vim +232 drivers/gpio/gpiolib-of.c

99d18d42c94285 Dmitry Torokhov 2022-10-17  211  
a603a2b8d86ee9 Linus Walleij   2017-12-30  212  		/*
a603a2b8d86ee9 Linus Walleij   2017-12-30  213  		 * The regulator GPIO handles are specified such that the
a603a2b8d86ee9 Linus Walleij   2017-12-30  214  		 * presence or absence of "enable-active-high" solely controls
a603a2b8d86ee9 Linus Walleij   2017-12-30  215  		 * the polarity of the GPIO line. Any phandle flags must
a603a2b8d86ee9 Linus Walleij   2017-12-30  216  		 * be actively ignored.
a603a2b8d86ee9 Linus Walleij   2017-12-30  217  		 */
34cb9352b62366 Dmitry Torokhov 2022-10-29  218  #if IS_ENABLED(CONFIG_REGULATOR_FIXED_VOLTAGE)
34cb9352b62366 Dmitry Torokhov 2022-10-29  219  		{ "regulator-fixed",   "gpios",        "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  220  		{ "regulator-fixed",   "gpio",         "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  221  		{ "reg-fixed-voltage", "gpios",        "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  222  		{ "reg-fixed-voltage", "gpio",         "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  223  #endif
34cb9352b62366 Dmitry Torokhov 2022-10-29  224  #if IS_ENABLED(CONFIG_REGULATOR_GPIO)
34cb9352b62366 Dmitry Torokhov 2022-10-29  225  		{ "regulator-gpio",    "enable-gpio",  "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  226  		{ "regulator-gpio",    "enable-gpios", "enable-active-high" },
34cb9352b62366 Dmitry Torokhov 2022-10-29  227  #endif
34cb9352b62366 Dmitry Torokhov 2022-10-29  228  	};
34cb9352b62366 Dmitry Torokhov 2022-10-29  229  	unsigned int i;
34cb9352b62366 Dmitry Torokhov 2022-10-29  230  	bool active_high;
34cb9352b62366 Dmitry Torokhov 2022-10-29  231  
34cb9352b62366 Dmitry Torokhov 2022-10-29 @232  	for (i = 0; i < ARRAY_SIZE(gpios); i++) {
34cb9352b62366 Dmitry Torokhov 2022-10-29  233  		if (of_device_is_compatible(np, gpios[i].compatible) &&
34cb9352b62366 Dmitry Torokhov 2022-10-29  234  		    !strcmp(propname, gpios[i].gpio_propname)) {
34cb9352b62366 Dmitry Torokhov 2022-10-29  235  			active_high = of_property_read_bool(np,
34cb9352b62366 Dmitry Torokhov 2022-10-29  236  						gpios[i].polarity_propname);
e3186e36925fc1 Dmitry Torokhov 2022-10-17  237  			of_gpio_quirk_polarity(np, active_high, flags);
34cb9352b62366 Dmitry Torokhov 2022-10-29  238  			break;
34cb9352b62366 Dmitry Torokhov 2022-10-29  239  		}
34cb9352b62366 Dmitry Torokhov 2022-10-29  240  	}
a603a2b8d86ee9 Linus Walleij   2017-12-30  241  }
34cb9352b62366 Dmitry Torokhov 2022-10-29  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
