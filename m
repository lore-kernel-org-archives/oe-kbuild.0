Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3220F0
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681192558; x=1712728558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TauK+5FJjxMA4pRO6yTIlMtOi5LpDj9CEebph4Ziezs=;
  b=Gp6FuX6nW+3Ews/fJP22EHjMYaoTe+q0VRJ4TLVwjkdd+7939EEo5Hvi
   fUNKdjGthw4wdhiI3Sy1qsb22m2DsIM1PHjKz1WOh5c5TZMuqGwaj8Rl+
   /Q+3pdKx5nU/eNnIIOD2BlwIKWsfLiJ3YtJQhefIlQVMLPelWPBOo7VLW
   FqbMUiQ1JIREjHpW9UyzZLY3/A9B66bnxeiGFNPUOb1EGyZYS3789tPa5
   FnIIWRrQJww9WHEnds97TPh49GWiNvn3D5LfvvFO9lLhglJVDyAgd+2nV
   8oH4WYR+GDNl0fcSGCZfmNKr29GTnmXt7/CDjLRpnXNuWv9WP7RGSmfVP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327630382"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="327630382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 22:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799767409"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="799767409"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 22:55:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm6yx-000W0y-2Y;
	Tue, 11 Apr 2023 05:55:55 +0000
Date: Tue, 11 Apr 2023 13:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpiolib-of.c:232 of_gpio_set_polarity_by_property()
 warn: we never enter this loop
Message-ID: <202304111328.bZYE3htE-lkp@intel.com>
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
head:   0d3eb744aed40ffce820cded61d7eac515199165
commit: 34cb9352b62366038fd2d5b9d9f393f35d0be1e0 gpiolib: of: factor out quirk setting polarity via separate property
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-m031-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111328.bZYE3htE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304111328.bZYE3htE-lkp@intel.com/

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
