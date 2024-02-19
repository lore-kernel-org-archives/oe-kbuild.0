Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9399535C6
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708380923; cv=none; b=HStgpkY2wNJm9laTvEeopXs7ipCbOBgPSzFw7mi5ggaqvdZnUBxt9LgM8QkqJxWGGcd8WPeFpCnnvJOP7+TOlkgJQOSVQh1jgGZ9AccQdXElFx6IZpzgLV2CBFGzCO+NvtsD3sh3YbHls1Fau4IpVjw81CVESK/SzH6afhUVi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708380923; c=relaxed/simple;
	bh=AQ/QGnYcEmaie1ra8T/bxDRJKxF9l5uWnL9LXzZWZ3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxKIUF2rXPi64WodpOv1JtSPrpM9ucJUbIhWmXVZHpfKt9VVUYKhaWACGL79DpovPeuvom29ZUCytDjjIfogK3bIAeUOI9x5/vOYbNkhisJqHDh21AqJX1EuctJyNcFXdr7grVPZBrpAHM0WtAgqJtZmDAvxEft1gMmwLNXQryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZVS0zI/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZVS0zI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708380922; x=1739916922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQ/QGnYcEmaie1ra8T/bxDRJKxF9l5uWnL9LXzZWZ3s=;
  b=cZVS0zI/fV4PRAztKkmYHvvc/iQBipUXOPVK/tRilyMz9qWW8NKFMr+k
   YT/jojIf8/llNkPAYvrzZP9r+r7It3WHukrJMcZJoEqA5yf6uFnitI1qB
   N2Vsg4kcUOB/SV4jm6cRAwTR+ztf2wNCXMqn+fjsVfudZZp9bohMExTOi
   gZ4VYjG1jeaZ9QFP5QYgp08DqlvkMwd2baJqso1YcgMREbUlxgKSd/y2W
   MzgEtM4VkMKPm7fabCjdtlEOHraiZlbVxVNef7mCfS7ypfHeTIylUo6tH
   FjGYiS//gYVCpl2RkEITaBE9sYtDkkXDRo5L7MdFwoBADn/qwTF/Mx457
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="27915471"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="27915471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 14:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4499102"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2024 14:15:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcBuv-00046Y-1t;
	Mon, 19 Feb 2024 22:15:17 +0000
Date: Tue, 20 Feb 2024 06:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linusw-gpio:b4/descriptors-regulators 3/6]
 drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error:
 uninitialized symbol 'ret'.
Message-ID: <202402200604.tilWhpaa-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-regulators
head:   70f1ac1c0e32e3d7fb546eac70f113bd57b659fa
commit: db93c3de09384ee1d48a99bb103a49938f80e046 [3/6] regulator: da9055: Fully convert to GPIO descriptors
:::::: branch date: 22 hours ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200604.tilWhpaa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402200604.tilWhpaa-lkp@intel.com/

smatch warnings:
drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error: uninitialized symbol 'ret'.

vim +/ret +481 drivers/regulator/da9055-regulator.c

f6130be652d0b4 Ashish Jangam 2012-11-01  409  
f6130be652d0b4 Ashish Jangam 2012-11-01  410  /*
f6130be652d0b4 Ashish Jangam 2012-11-01  411   * Configures regulator to be controlled either through GPIO 1 or 2.
f6130be652d0b4 Ashish Jangam 2012-11-01  412   * GPIO can control regulator state and/or select the regulator register
f6130be652d0b4 Ashish Jangam 2012-11-01  413   * set A/B for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  414   */
db93c3de09384e Linus Walleij 2024-02-15  415  static int da9055_gpio_init(struct device *dev,
db93c3de09384e Linus Walleij 2024-02-15  416  			    struct da9055_regulator *regulator,
f6130be652d0b4 Ashish Jangam 2012-11-01  417  			    struct regulator_config *config,
f6130be652d0b4 Ashish Jangam 2012-11-01  418  			    struct da9055_pdata *pdata, int id)
f6130be652d0b4 Ashish Jangam 2012-11-01  419  {
f6130be652d0b4 Ashish Jangam 2012-11-01  420  	struct da9055_regulator_info *info = regulator->info;
db93c3de09384e Linus Walleij 2024-02-15  421  	struct gpio_desc *ren;
db93c3de09384e Linus Walleij 2024-02-15  422  	struct gpio_desc *ena;
db93c3de09384e Linus Walleij 2024-02-15  423  	struct gpio_desc *rsel;
db93c3de09384e Linus Walleij 2024-02-15  424  	int ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  425  
db93c3de09384e Linus Walleij 2024-02-15  426  	/* Look for "regulator-enable-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  427  	ren = devm_gpiod_get_optional(dev, "regulator-enable", GPIOD_IN);
db93c3de09384e Linus Walleij 2024-02-15  428  	if (IS_ERR(ren))
db93c3de09384e Linus Walleij 2024-02-15  429  		return PTR_ERR(ren);
8b61a28d616a34 Adam Thomson  2014-02-06  430  
db93c3de09384e Linus Walleij 2024-02-15  431  	if (ren) {
db93c3de09384e Linus Walleij 2024-02-15  432  		/* This GPIO is not optional at this point */
db93c3de09384e Linus Walleij 2024-02-15  433  		ena = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
db93c3de09384e Linus Walleij 2024-02-15  434  		if (IS_ERR(ena))
db93c3de09384e Linus Walleij 2024-02-15  435  			return PTR_ERR(ena);
f6130be652d0b4 Ashish Jangam 2012-11-01  436  
db93c3de09384e Linus Walleij 2024-02-15  437  		config->ena_gpiod = ena;
f6130be652d0b4 Ashish Jangam 2012-11-01  438  
f6130be652d0b4 Ashish Jangam 2012-11-01  439  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  440  		 * GPI pin is muxed with regulator to control the
f6130be652d0b4 Ashish Jangam 2012-11-01  441  		 * regulator state.
f6130be652d0b4 Ashish Jangam 2012-11-01  442  		 */
db93c3de09384e Linus Walleij 2024-02-15  443  		gpiod_set_consumer_name(ren, "DA9055 ren GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  444  
f6130be652d0b4 Ashish Jangam 2012-11-01  445  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  446  		 * Let the regulator know that its state is controlled
f6130be652d0b4 Ashish Jangam 2012-11-01  447  		 * through GPI.
f6130be652d0b4 Ashish Jangam 2012-11-01  448  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  449  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  450  					DA9055_E_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  451  					pdata->reg_ren[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  452  					<< DA9055_E_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  453  		if (ret < 0)
db93c3de09384e Linus Walleij 2024-02-15  454  			return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  455  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  456  
db93c3de09384e Linus Walleij 2024-02-15  457  	/* Look for "regulator-select-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  458  	rsel = devm_gpiod_get_optional(dev, "regulator-select", GPIOD_IN);
db93c3de09384e Linus Walleij 2024-02-15  459  	if (IS_ERR(rsel))
db93c3de09384e Linus Walleij 2024-02-15  460  		return PTR_ERR(rsel);
f6130be652d0b4 Ashish Jangam 2012-11-01  461  
db93c3de09384e Linus Walleij 2024-02-15  462  	if (rsel) {
f6130be652d0b4 Ashish Jangam 2012-11-01  463  		regulator->reg_rselect = pdata->reg_rsel[id];
f6130be652d0b4 Ashish Jangam 2012-11-01  464  
f6130be652d0b4 Ashish Jangam 2012-11-01  465  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  466  		 * GPI pin is muxed with regulator to select the
f6130be652d0b4 Ashish Jangam 2012-11-01  467  		 * regulator register set A/B for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  468  		 */
db93c3de09384e Linus Walleij 2024-02-15  469  		gpiod_set_consumer_name(rsel, "DA9055 rsel GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  470  
f6130be652d0b4 Ashish Jangam 2012-11-01  471  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  472  		 * Let the regulator know that its register set A/B
f6130be652d0b4 Ashish Jangam 2012-11-01  473  		 * will be selected through GPI for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  474  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  475  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  476  					DA9055_V_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  477  					pdata->reg_rsel[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  478  					<< DA9055_V_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  479  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  480  
f6130be652d0b4 Ashish Jangam 2012-11-01 @481  	return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  482  }
f6130be652d0b4 Ashish Jangam 2012-11-01  483  

:::::: The code at line 481 was first introduced by commit
:::::: f6130be652d0b4fbf710d83a816298c007e59ed1 regulator: DA9055 regulator driver

:::::: TO: Ashish Jangam <ashish.jangam@kpitcummins.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
