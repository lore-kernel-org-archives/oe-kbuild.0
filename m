Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8D20E02A
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384791; cv=none; b=GyEY0LPTDSqeQJM3pXPbiOm1QFKThbtS20Hg+Rbt1NttoGHleH95N2PTAi/AYcLklk/IwAdrLzbt43aTkQpaPZu6nsTQJSIVY5KxCDsuojvIdu+Zj0qM2nBihg3wIF/beIUCEUvZvGTGYMbGVlNmakav+2XDytR3E73CO2BhccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384791; c=relaxed/simple;
	bh=LfJBkCcuQ6jho7B1lFsndzkZGaQr6Y9Cn/69zqKEEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aD6vlK4/NbpE7+ffKrezcuXBUbsly86+FqP1lR7pzpsN8OMPIlMXO7U8NBehI0miUlRmqzRW6w4QCEbGBnQT4R+TGI4jwq7KM6UYiUe3m49l3pOBOXEmq2LIXOH37EY6w2+1uKT+nGfQHZP/8lbzOr/6znfwzJmNCEWrhB+CY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzQxMoG0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzQxMoG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739384789; x=1770920789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LfJBkCcuQ6jho7B1lFsndzkZGaQr6Y9Cn/69zqKEEcQ=;
  b=KzQxMoG0vLQZxucjJyYyKwdtuufj99q09fB5Y0ssJwAbKUGbQM9lAC1R
   bNisNEeg9D7Jehkgtzfp5HrFR6Ero7AErRO2Lc/pWrE9TR72fUdPUzPUo
   6rYSqUlV4z3OeHYYXuiAj804r2MxgBmVA7fbkOP1nz2Dp7cIG8LdfozD0
   gL8G4gqtvW1/t3GDDTsoBs1uUKn9UZXCywUnwpBSaiJHuJpD2v2OKiEte
   DE+/w6HqHBUUNPkIqlu6V+iWT2hQeO4gtQ904EI+G454kjN+5/0yEQUfc
   tbpum1ZbQzXDlV0/3E/2pQnLQfY7t6ld8LZQvxFqB23p1wycI9C6qrq5q
   A==;
X-CSE-ConnectionGUID: iYWAUV6RS+a3UTWBxFUvHg==
X-CSE-MsgGUID: swPuFngxQuG1YbvcPA7vXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39759681"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39759681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 10:26:29 -0800
X-CSE-ConnectionGUID: 56OY6qgHRj+6G29Z0Wszww==
X-CSE-MsgGUID: Cmk8aEZ5RpGGiKAsxB+OlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117906756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 10:26:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiHRJ-0015zL-0k;
	Wed, 12 Feb 2025 18:26:25 +0000
Date: Thu, 13 Feb 2025 02:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
Message-ID: <202502130238.ZKgfRr8U-lkp@intel.com>
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
In-Reply-To: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>
References: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>
TO: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: "Celine Joy A. Capua" <celinejoy.capua@analog.com>

Hi Celine,

kernel test robot noticed the following build errors:

[auto build test ERROR on fff64b15e3d1e9bd9246db1f5e0b84e7e561b79f]

url:    https://github.com/intel-lab-lkp/linux/commits/Celine-Joy-A-Capua/regulator-ltc7871-Add-driver-for-LTC7871/20250210-103432
base:   fff64b15e3d1e9bd9246db1f5e0b84e7e561b79f
patch link:    https://lore.kernel.org/r/20250210-staging-ltc7871-v1-1-c593ad86aab2%40analog.com
patch subject: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r073-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130238.ZKgfRr8U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130238.ZKgfRr8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502130238.ZKgfRr8U-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/head.o: in function `__mmap_switched':
>> (.init.text+0x20): relocation truncated to fit: R_ARM_PC24 against symbol `__memset' defined in .text section in arch/arm/lib/memset.o
   arch/arm/kernel/entry-armv.o: in function `__irq_svc':
>> (.entry.text+0x138): relocation truncated to fit: R_ARM_PC24 against symbol `generic_handle_arch_irq' defined in .noinstr.text section in kernel/irq/handle.o
>> (.entry.text+0x144): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/entry-armv.o: in function `svc_preempt':
>> (.entry.text+0x184): relocation truncated to fit: R_ARM_PC24 against symbol `preempt_schedule_irq' defined in .sched.text section in kernel/sched/core.o
   arch/arm/kernel/entry-armv.o: in function `__irq_usr':
   (.entry.text+0x480): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/traps.o: in function `dump_backtrace_stm':
   traps.c:(.text+0x60): relocation truncated to fit: R_ARM_PC24 against symbol `sprintf' defined in .text section in lib/vsprintf.o
   arch/arm/kernel/traps.o: in function `die':
   traps.c:(.text+0x148): relocation truncated to fit: R_ARM_PC24 against symbol `report_bug' defined in .text section in lib/bug.o
   traps.c:(.text+0x308): relocation truncated to fit: R_ARM_PC24 against symbol `warn_bogus_irq_restore' defined in .noinstr.text section in kernel/locking/irqflag-debug.o
   arch/arm/kernel/traps.o: in function `register_undef_hook':
   traps.c:(.text+0x50c): relocation truncated to fit: R_ARM_PC24 against symbol `preempt_schedule' defined in .sched.text section in kernel/sched/core.o
   traps.c:(.text+0x534): relocation truncated to fit: R_ARM_PC24 against symbol `warn_bogus_irq_restore' defined in .noinstr.text section in kernel/locking/irqflag-debug.o
   arch/arm/kernel/traps.o: in function `unregister_undef_hook':
   traps.c:(.text+0x5dc): additional relocation overflows omitted from the output

smatch warnings:
drivers/regulator/ltc7871-regulator.c:328 ltc7871_parse_fw() error: uninitialized symbol 'val2'.

vim +/val2 +328 drivers/regulator/ltc7871-regulator.c

180a2b5be6459f Celine Joy A. Capua 2025-02-10  221  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  222  static int ltc7871_parse_fw(struct ltc7871 *chip)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  223  {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  224  	int reg, ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  225  	int val1, val2;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  226  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  227  	/* Setting default values based on datasheet and DC2886A Schematic */
180a2b5be6459f Celine Joy A. Capua 2025-02-10  228  	chip->idac_setcur_uA = 0;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  229  	chip->freq_spread_percentage = "+-12%";
180a2b5be6459f Celine Joy A. Capua 2025-02-10  230  	chip->switching_freq_divider = 512;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  231  	chip->enable_chip_ctrl_wp = 0;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  232  	chip->ra_ext = 10000;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  233  	chip->rb_ext = 107000;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  234  	chip->rc_ext = 12700;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  235  	chip->rd_ext = 499000;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  236  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  237  	ret = device_property_read_u32(&chip->spi->dev, "adi,ra-external-ohms",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  238  				 &chip->ra_ext);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  239  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  240  		if (!chip->ra_ext)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  241  			return -EINVAL;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  242  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  243  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  244  	ret = device_property_read_u32(&chip->spi->dev, "adi,rb-external-ohms",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  245  				 &chip->rb_ext);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  246  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  247  		if (!chip->rb_ext)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  248  			return -EINVAL;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  249  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  250  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  251  	ret = device_property_read_u32(&chip->spi->dev, "adi,rc-external-ohms",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  252  				 &chip->rc_ext);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  253  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  254  		if (!chip->rc_ext)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  255  			return -EINVAL;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  256  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  257  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  258  	ret = device_property_read_u32(&chip->spi->dev, "adi,rd-external-ohms",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  259  				 &chip->rd_ext);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  260  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  261  		if (!chip->rd_ext)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  262  			return -EINVAL;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  263  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  264  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  265  	ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CONFIG2, &reg);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  266  	if (ret < 0)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  267  		return ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  268  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  269  	chip->regulator_mode = FIELD_GET(LTC7871_MASK_CONFIG2_BUCK_BOOST, reg);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  270  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  271  	if (chip->regulator_mode) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  272  		chip->r1 = chip->ra_ext;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  273  		chip->r2 = chip->rb_ext;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  274  	} else {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  275  		chip->r1 = chip->rc_ext;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  276  		chip->r2 = chip->rd_ext;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  277  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  278  	chip->min_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MAX);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  279  	chip->max_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MIN);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  280  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  281  	ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CHIP_CTRL, &reg);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  282  	if (ret < 0)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  283  		return ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  284  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  285  	chip->enable_chip_ctrl_wp = device_property_read_bool(&chip->spi->dev,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  286  						"adi,enable-chip-ctrl-wp");
180a2b5be6459f Celine Joy A. Capua 2025-02-10  287  	val1 = FIELD_PREP(LTC7871_MASK_CHIP_CTRL_WP, chip->enable_chip_ctrl_wp) | reg;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  288  	ret = ltc7871_reg_write(chip->spi, LTC7871_REG_CHIP_CTRL, val1);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  289  	if (ret)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  290  		return ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  291  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  292  	ret = device_property_read_u32(&chip->spi->dev, "adi,idac-setcur-microamp",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  293  				 &chip->idac_setcur_uA);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  294  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  295  		if (chip->idac_setcur_uA < LTC7871_IDAC_MIN ||
180a2b5be6459f Celine Joy A. Capua 2025-02-10  296  		    chip->idac_setcur_uA > LTC7871_IDAC_MAX) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  297  			return -EINVAL;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  298  		}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  299  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  300  		ret = ltc7871_reg_write(chip->spi, LTC7871_REG_SETCUR,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  301  					chip->idac_setcur_uA);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  302  		if (ret)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  303  			return ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  304  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  305  	ret = device_property_match_property_string(&chip->spi->dev,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  306  			"adi,freq-spread-percentage",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  307  			ltc7871_freq_spread_percentage,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  308  			ARRAY_SIZE(ltc7871_freq_spread_percentage));
180a2b5be6459f Celine Joy A. Capua 2025-02-10  309  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  310  	if (ret >= 0)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  311  		val1 = FIELD_PREP(LTC7871_MASK_SSFM_FREQ_SPREAD, ret);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  312  	else
180a2b5be6459f Celine Joy A. Capua 2025-02-10  313  		val1 = 0;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  314  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  315  	ret = device_property_read_u32(&chip->spi->dev,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  316  				       "adi,switching-freq-divider",
180a2b5be6459f Celine Joy A. Capua 2025-02-10  317  				       &chip->switching_freq_divider);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  318  	if (!ret) {
180a2b5be6459f Celine Joy A. Capua 2025-02-10  319  		ret = ltc7871_get_prop_index(ltc7871_switching_freq_divider,
180a2b5be6459f Celine Joy A. Capua 2025-02-10  320  					     ARRAY_SIZE(ltc7871_switching_freq_divider),
180a2b5be6459f Celine Joy A. Capua 2025-02-10  321  					     chip->switching_freq_divider);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  322  		if (ret < 0)
180a2b5be6459f Celine Joy A. Capua 2025-02-10  323  			return ret;
180a2b5be6459f Celine Joy A. Capua 2025-02-10  324  
180a2b5be6459f Celine Joy A. Capua 2025-02-10  325  		val2 = FIELD_PREP(LTC7871_MASK_SSFM_MOD_SIG_FREQ, ret);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  326  	}
180a2b5be6459f Celine Joy A. Capua 2025-02-10  327  
180a2b5be6459f Celine Joy A. Capua 2025-02-10 @328  	return ltc7871_reg_write(chip->spi, LTC7871_REG_SSFM, val1 | val2);
180a2b5be6459f Celine Joy A. Capua 2025-02-10  329  }
180a2b5be6459f Celine Joy A. Capua 2025-02-10  330  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
