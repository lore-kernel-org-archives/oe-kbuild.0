Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDC20FAC
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691694319; x=1723230319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=upG1DSAguLJRJpstTvlensctGECwfq6tJCpm9oBEXbE=;
  b=Izq0ezUOx6MBwCsWGC7DQrloNz5hrigHvn90eEsTPJ/2kw1bOaCi5NBC
   /T13MEkiG/hKhXDwG+cgLJUm/0xSNOTSj7Oc5KzKtP1E4+HJkL38YFGH8
   5qKoJTBG4fnS7AYIOPwbdhZJF57ZtBFoVx8SDPNSPAv/gaoN2g1CR4aX+
   sOrbWtqZgDQcYI6nx6kzjaQ8BhymoArIS55HGatQENeUpJI7hphEjinT/
   FRSgg4M6HHzt5AdE9/7K2+jqW+z6ZsDB2CtPcGMYusd94aGfzSilyNtem
   pGewUWxtJmd6sk46m66k9xdirzCGaGpIyVsjy4nMi/9BwWQucfukQ6D4s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371503596"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="371503596"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 12:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822369423"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="822369423"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2023 12:05:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUAyD-0007CG-19;
	Thu, 10 Aug 2023 19:05:17 +0000
Date: Fri, 11 Aug 2023 03:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
Message-ID: <202308110253.R2TUMfFr-lkp@intel.com>
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
In-Reply-To: <20230809131442.25524-2-brgl@bgdev.pl>
References: <20230809131442.25524-2-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Kent Gibson <warthog618@gmail.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-sim-simplify-code-with-cleanup-helpers/20230809-211601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230809131442.25524-2-brgl%40bgdev.pl
patch subject: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-m021-20230809 (https://download.01.org/0day-ci/archive/20230811/202308110253.R2TUMfFr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110253.R2TUMfFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308110253.R2TUMfFr-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-sim.c:1472 gpio_sim_config_make_device_group() warn: possible memory leak of 'dev'

vim +/dev +1472 drivers/gpio/gpio-sim.c

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1459  
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1460  static struct config_group *
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1461  gpio_sim_config_make_device_group(struct config_group *group, const char *name)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1462  {
c7a663cdcfc698 Bartosz Golaszewski 2023-08-09  1463  	struct gpio_sim_device *dev __free(kfree) = NULL;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1464  	int id;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1465  
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1466  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1467  	if (!dev)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1468  		return ERR_PTR(-ENOMEM);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1469  
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1470  	id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
c7a663cdcfc698 Bartosz Golaszewski 2023-08-09  1471  	if (id < 0)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @1472  		return ERR_PTR(id);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1473  
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1474  	config_group_init_type_name(&dev->group, name,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1475  				    &gpio_sim_device_config_group_type);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1476  	dev->id = id;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1477  	mutex_init(&dev->lock);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1478  	INIT_LIST_HEAD(&dev->bank_list);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1479  
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1480  	dev->bus_notifier.notifier_call = gpio_sim_bus_notifier_call;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1481  	init_completion(&dev->probe_completion);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1482  
c7a663cdcfc698 Bartosz Golaszewski 2023-08-09  1483  	return &no_free_ptr(dev)->group;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1484  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  1485  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
