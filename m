Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2F20E5
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNReiR3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701919677; x=1733455677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLNsS1cnSWNPL6DdajERFi/ZgTngbMW2MoEFSlYQZZA=;
  b=nNReiR3BtXdf8iaRFuBvkXHA5N63dcDge01h0yfO39dFhHEe3+d5B/XE
   I7G4vAoiqdOpSs6vW4JrcpkKNPfaWlSQOTpjQlAyDKOJyR8hoHfgNy5mD
   Z7/pdy8z8rewKUvUXZoHwhSohA04x4i1MeiVC9AZCtr1JplKA4sfRWWks
   v1zyr5uwA1YjVTovcxqcPnHyF9HSJYVdwL/TdD51tRgacdN78A7gB8f/1
   oMrVzfhRIFCh5CItYiM70OhGt/JKCAPqLormnTZrvt9wvBxGq0CvUQ7dD
   S6YLRy0phSDjnuOTetMPv8oR3b+Li9SCFlhuF/2MTOBC0TIVcnOacBEl4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="398046578"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="398046578"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 19:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915416773"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915416773"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2023 19:27:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB53F-000Bnt-2r;
	Thu, 07 Dec 2023 03:27:49 +0000
Date: Thu, 7 Dec 2023 11:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
Message-ID: <202312071152.Kfcw1KlD-lkp@intel.com>
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
In-Reply-To: <20231204055650.788388-3-kcfeng0@nuvoton.com>
References: <20231204055650.788388-3-kcfeng0@nuvoton.com>
TO: baneric926@gmail.com
TO: jdelvare@suse.com
TO: linux@roeck-us.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: kwliu@nuvoton.com
CC: kcfeng0@nuvoton.com
CC: DELPHINE_CHIU@wiwynn.com
CC: Bonnie_Lo@wiwynn.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4 next-20231206]
[cannot apply to groeck-staging/hwmon-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baneric926-gmail-com/dt-bindings-hwmon-Add-nct736x-bindings/20231204-135942
base:   linus/master
patch link:    https://lore.kernel.org/r/20231204055650.788388-3-kcfeng0%40nuvoton.com
patch subject: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r071-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071152.Kfcw1KlD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071152.Kfcw1KlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312071152.Kfcw1KlD-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct736x.c:367 nct736x_init_chip() error: uninitialized symbol 'gpio0_3'.
drivers/hwmon/nct736x.c:370 nct736x_init_chip() error: uninitialized symbol 'gpio4_7'.
drivers/hwmon/nct736x.c:373 nct736x_init_chip() error: uninitialized symbol 'gpio10_13'.
drivers/hwmon/nct736x.c:376 nct736x_init_chip() error: uninitialized symbol 'gpio14_17'.

vim +/gpio0_3 +367 drivers/hwmon/nct736x.c

16e62bcf3c9b93 Ban Feng 2023-12-04  334  
16e62bcf3c9b93 Ban Feng 2023-12-04  335  static int nct736x_init_chip(struct i2c_client *client,
16e62bcf3c9b93 Ban Feng 2023-12-04  336  			     u32 pwm_mask, u32 fanin_mask, u32 wdt_cfg)
16e62bcf3c9b93 Ban Feng 2023-12-04  337  {
16e62bcf3c9b93 Ban Feng 2023-12-04  338  	const struct i2c_device_id *id = i2c_match_id(nct736x_id, client);
16e62bcf3c9b93 Ban Feng 2023-12-04  339  	u8 i, gpio0_3, gpio4_7, gpio10_13, gpio14_17;
16e62bcf3c9b93 Ban Feng 2023-12-04  340  	int ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  341  
16e62bcf3c9b93 Ban Feng 2023-12-04  342  	for (i = 0; i < NCT736X_PWM_COUNT; i++) {
16e62bcf3c9b93 Ban Feng 2023-12-04  343  		if (i < 4) {
16e62bcf3c9b93 Ban Feng 2023-12-04  344  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  345  				gpio0_3 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  346  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  347  				gpio10_13 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  348  		} else if (i < 8) {
16e62bcf3c9b93 Ban Feng 2023-12-04  349  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  350  				gpio4_7 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  351  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  352  				gpio14_17 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  353  		} else if (i < 12) {
16e62bcf3c9b93 Ban Feng 2023-12-04  354  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  355  				gpio10_13 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  356  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  357  				gpio0_3 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  358  		} else {
16e62bcf3c9b93 Ban Feng 2023-12-04  359  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  360  				gpio14_17 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  361  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  362  				gpio4_7 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  363  		}
16e62bcf3c9b93 Ban Feng 2023-12-04  364  	}
16e62bcf3c9b93 Ban Feng 2023-12-04  365  
16e62bcf3c9b93 Ban Feng 2023-12-04  366  	/* Pin Function Configuration */
16e62bcf3c9b93 Ban Feng 2023-12-04 @367  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_0_3, gpio0_3);
16e62bcf3c9b93 Ban Feng 2023-12-04  368  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  369  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @370  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_4_7, gpio4_7);
16e62bcf3c9b93 Ban Feng 2023-12-04  371  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  372  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @373  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_10_13, gpio10_13);
16e62bcf3c9b93 Ban Feng 2023-12-04  374  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  375  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @376  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_14_17, gpio14_17);
16e62bcf3c9b93 Ban Feng 2023-12-04  377  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  378  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  379  
16e62bcf3c9b93 Ban Feng 2023-12-04  380  	/* PWM and FANIN Monitoring Enable */
16e62bcf3c9b93 Ban Feng 2023-12-04  381  	ret = nct736x_write_reg(client, NCT736X_REG_PWMEN_0_7,
16e62bcf3c9b93 Ban Feng 2023-12-04  382  				pwm_mask & 0xff);
16e62bcf3c9b93 Ban Feng 2023-12-04  383  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  384  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  385  	ret = nct736x_write_reg(client,
16e62bcf3c9b93 Ban Feng 2023-12-04  386  				NCT736X_REG_PWMEN_8_15, (pwm_mask >> 8) & 0xff);
16e62bcf3c9b93 Ban Feng 2023-12-04  387  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  388  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  389  	ret = nct736x_write_reg(client, NCT736X_REG_FANINEN_0_7,
16e62bcf3c9b93 Ban Feng 2023-12-04  390  				fanin_mask & 0xff);
16e62bcf3c9b93 Ban Feng 2023-12-04  391  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  392  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  393  	ret = nct736x_write_reg(client, NCT736X_REG_FANINEN_8_15,
16e62bcf3c9b93 Ban Feng 2023-12-04  394  				(fanin_mask >> 8) & 0xff);
16e62bcf3c9b93 Ban Feng 2023-12-04  395  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  396  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  397  
16e62bcf3c9b93 Ban Feng 2023-12-04  398  	/* Watchdog Timer Configuration */
16e62bcf3c9b93 Ban Feng 2023-12-04  399  	if (wdt_cfg != 0xff && id->driver_data == nct7363) {
16e62bcf3c9b93 Ban Feng 2023-12-04  400  		ret = nct736x_write_reg(client, NCT7363_REG_WDT, wdt_cfg);
16e62bcf3c9b93 Ban Feng 2023-12-04  401  		if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  402  			return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  403  	}
16e62bcf3c9b93 Ban Feng 2023-12-04  404  
16e62bcf3c9b93 Ban Feng 2023-12-04  405  	return 0;
16e62bcf3c9b93 Ban Feng 2023-12-04  406  }
16e62bcf3c9b93 Ban Feng 2023-12-04  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
