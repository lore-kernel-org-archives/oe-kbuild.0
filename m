Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5D3D3306
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787121767; cv=none; b=uq0HpdT0jw+iRDFjvhgOHiULtXQ+B/3i7G6wOldFtlDEZO8z9K+rhand0kU7vpGrDVxIB5TI71Vb9oR/lgUbCri1JvAb6Nr50i6SReHyycoPJGsz6DS+xgq3XCa1JPQyx1GrVEjxtml2tY/WVbkstraWTNSXtpC9U5HL68gDR/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787121767; c=relaxed/simple;
	bh=r4Q1Nm4pWv3zULUx/6FmbiKsKl8TCMMk0a2VAw9QNJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PMO8Bv603G33esvFWS2JeaAPSpmcJYAROdy4H/9xwlW0ZWHntPerGBoBA0GnPVck/U2mkgibZ198m1cVqYT+IZBiKhF/gEBOmk/SizgL4FVLWX2aHwLFU6Tyb4gf7M4LoCXsv2mzAAbgZ6iQ8HIHeeVk52wF70YppWygI/dyx6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNHJG83h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNHJG83h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787121765; x=1818657765;
  h=date:from:to:cc:subject:message-id;
  bh=r4Q1Nm4pWv3zULUx/6FmbiKsKl8TCMMk0a2VAw9QNJ4=;
  b=DNHJG83hSH/KnmDOQCxhxO70vXEwEJww/psjvxrHN4VKk5TuEuulmHfz
   09norsGTuBs9z7K+tfCS+D0UzAvn1j8TA5NWfHLW1mtYxBPlphyTtnzZn
   f2GUNMHj1rcRM21E7QrdDWudpijTuaJKndPUVloQzkHxcJ8Uued/auaz/
   9leIBCqJOyLMDlxVkK2eZKC/iinbn01nB7Jopw3Ysw+DNdhmUCbnlQYeY
   b9ixgcLWjdDzdqwb+XVf1eXnKsrv9cJe1UayCTnhA4Dy7Cs+Ib1YoV7b5
   QYPdVt2ZWlNFRghi2lxILUu0ncTmqQ7y17LvCSFFaocRzJD+3mwP9ZoT+
   w==;
X-CSE-ConnectionGUID: mq4LV8FtR2KjHLqziYMVZA==
X-CSE-MsgGUID: qDIW4mjIQJu4kcSfDtkb5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99150384"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99150384"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:42:41 -0700
X-CSE-ConnectionGUID: YNEyqPFqRhyW+BY1I5pleQ==
X-CSE-MsgGUID: O6Ca8KklQiKCNibZEM9iAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="261696361"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 23:42:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwa0R-00000000ex0-2pjw;
	Wed, 19 Aug 2026 06:42:35 +0000
Date: Wed, 19 Aug 2026 14:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [soc:board-remove 200/200]
 drivers/mmc/host/sdhci-pxav2.c:318 sdhci_pxav2_probe() error: we previously
 assumed 'variant' could be null (see line 305)
Message-ID: <202608191405.jP6epa63-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: c12d647b0229f4d75a2973c9b4e79f9b53406426 [200/200] remaining pdata removal
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: parisc-randconfig-r073-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191405.jP6epa63-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608191405.jP6epa63-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-pxav2.c:318 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null (see line 305)

vim +/variant +318 drivers/mmc/host/sdhci-pxav2.c

b650352dd3df36 Chris Ball            2012-04-10  269  
c3be1efd41a97f Bill Pemberton        2012-11-19  270  static int sdhci_pxav2_probe(struct platform_device *pdev)
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  271  {
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  272  	struct sdhci_pltfm_host *pltfm_host;
c12d647b0229f4 Arnd Bergmann         2026-08-07  273  	struct sdhci_pxa_platdata *pdata;
f35ca223882aa6 Doug Brown            2023-01-16  274  	struct sdhci_pxav2_host *pxav2_host;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  275  	struct device *dev = &pdev->dev;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  276  	struct sdhci_host *host = NULL;
dfe9746aed2d12 Doug Brown            2023-01-16  277  	const struct sdhci_pxa_variant *variant;
b650352dd3df36 Chris Ball            2012-04-10  278  
e41c48b4bcb3ce Doug Brown            2023-01-16  279  	struct clk *clk, *clk_core;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  280  
f35ca223882aa6 Doug Brown            2023-01-16  281  	host = sdhci_pltfm_init(pdev, NULL, sizeof(*pxav2_host));
6a686c31324c9e Sebastian Hesselbarth 2014-10-21  282  	if (IS_ERR(host))
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  283  		return PTR_ERR(host);
6a686c31324c9e Sebastian Hesselbarth 2014-10-21  284  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  285  	pltfm_host = sdhci_priv(host);
f35ca223882aa6 Doug Brown            2023-01-16  286  	pxav2_host = sdhci_pltfm_priv(pltfm_host);
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  287  
c21f1b0dc6418e Adrian Hunter         2023-08-11  288  	clk = devm_clk_get_optional_enabled(dev, "io");
c21f1b0dc6418e Adrian Hunter         2023-08-11  289  	if (!clk)
c21f1b0dc6418e Adrian Hunter         2023-08-11  290  		clk = devm_clk_get_enabled(dev, NULL);
072f5e2c34a95b Binbin Zhou           2025-06-07  291  	if (IS_ERR(clk))
072f5e2c34a95b Binbin Zhou           2025-06-07  292  		return dev_err_probe(dev, PTR_ERR(clk), "failed to get io clock\n");
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  293  	pltfm_host->clk = clk;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  294  
e41c48b4bcb3ce Doug Brown            2023-01-16  295  	clk_core = devm_clk_get_optional_enabled(dev, "core");
072f5e2c34a95b Binbin Zhou           2025-06-07  296  	if (IS_ERR(clk_core))
072f5e2c34a95b Binbin Zhou           2025-06-07  297  		return dev_err_probe(dev, PTR_ERR(clk_core),
072f5e2c34a95b Binbin Zhou           2025-06-07  298  				     "failed to enable core clock\n");
e41c48b4bcb3ce Doug Brown            2023-01-16  299  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  300  	host->quirks = SDHCI_QUIRK_BROKEN_ADMA
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  301  		| SDHCI_QUIRK_BROKEN_TIMEOUT_VAL
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  302  		| SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  303  
dfe9746aed2d12 Doug Brown            2023-01-16  304  	variant = of_device_get_match_data(dev);
dfe9746aed2d12 Doug Brown            2023-01-16 @305  	if (variant)
b650352dd3df36 Chris Ball            2012-04-10  306  		pdata = pxav2_get_mmc_pdata(dev);
dfe9746aed2d12 Doug Brown            2023-01-16  307  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  308  	if (pdata->flags & PXA_FLAG_CARD_PERMANENT) {
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  309  		/* on-chip device */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  310  		host->quirks |= SDHCI_QUIRK_BROKEN_CARD_DETECTION;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  311  		host->mmc->caps |= MMC_CAP_NONREMOVABLE;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  312  	}
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  313  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  314  	/* If slot design supports 8 bit data, indicate this to MMC. */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  315  	if (pdata->flags & PXA_FLAG_SD_8_BIT_CAPABLE_SLOT)
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  316  		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  317  
dfe9746aed2d12 Doug Brown            2023-01-16 @318  	host->quirks |= variant->extra_quirks;
dfe9746aed2d12 Doug Brown            2023-01-16  319  	host->ops = variant->ops;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  320  
f35ca223882aa6 Doug Brown            2023-01-16  321  	/* Set up optional pinctrl for PXA168 SDIO IRQ fix */
f35ca223882aa6 Doug Brown            2023-01-16  322  	pxav2_host->pinctrl = devm_pinctrl_get(dev);
f35ca223882aa6 Doug Brown            2023-01-16  323  	if (!IS_ERR(pxav2_host->pinctrl)) {
f35ca223882aa6 Doug Brown            2023-01-16  324  		pxav2_host->pins_cmd_gpio = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6 Doug Brown            2023-01-16  325  								 "state_cmd_gpio");
f35ca223882aa6 Doug Brown            2023-01-16  326  		if (IS_ERR(pxav2_host->pins_cmd_gpio))
f35ca223882aa6 Doug Brown            2023-01-16  327  			pxav2_host->pins_cmd_gpio = NULL;
f35ca223882aa6 Doug Brown            2023-01-16  328  		pxav2_host->pins_default = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6 Doug Brown            2023-01-16  329  								"default");
f35ca223882aa6 Doug Brown            2023-01-16  330  		if (IS_ERR(pxav2_host->pins_default))
f35ca223882aa6 Doug Brown            2023-01-16  331  			pxav2_host->pins_default = NULL;
f35ca223882aa6 Doug Brown            2023-01-16  332  	} else {
f35ca223882aa6 Doug Brown            2023-01-16  333  		pxav2_host->pinctrl = NULL;
f35ca223882aa6 Doug Brown            2023-01-16  334  	}
f35ca223882aa6 Doug Brown            2023-01-16  335  
072f5e2c34a95b Binbin Zhou           2025-06-07  336  	return sdhci_add_host(host);
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  337  }
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  338  

:::::: The code at line 318 was first introduced by commit
:::::: dfe9746aed2d1267f00b880ae232170d7d9e4202 mmc: sdhci-pxav2: add initial support for PXA168 V1 controller

:::::: TO: Doug Brown <doug@schmorgal.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
