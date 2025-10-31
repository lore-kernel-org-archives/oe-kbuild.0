Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0086347BDE
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911630; cv=none; b=idQVMu2p47mEvU+GwL2U5Xo6fDzoq4f1pHOYTa29GWeNLkIkDFXGs81tQbyspDfhDLpeF1jhH8/ExfgYg0DA3rf1QcYtWfrRC6DdYaxyUj3aXeIleLt96Kq6z20a6Mhg3wFZ7Lc7xZzG8g4+9SddUYpuNhmViwVB/uubEDCUUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911630; c=relaxed/simple;
	bh=WbhVmWoe5zwoO1OCk1fthfGlN2QKBy1s1yDDly8rhMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSrYOtQlyZL+4g7jPNMC3bIlQu/SPOIYXqCuCSAvqmQzf6WJeskBcLP92pK2HgyAYYV47skpZwF+YoXjm5oSLSRTdUNiTBZ7E6AdS0afW+TSDsAoNmJSZOSlmTOUJBhkUjQ05cc7YT+DEJmWzhVp4V0l4cLOXKoknj2aFkr4q50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCy2Lh/+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCy2Lh/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761911628; x=1793447628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbhVmWoe5zwoO1OCk1fthfGlN2QKBy1s1yDDly8rhMY=;
  b=GCy2Lh/+KpKU7x7DVXlh1J37HEiAo4/Ep0HcQ6qukaPPRsXsGx3b86zs
   /ReggbgpD8txle9PNY6exmGqtLrQ/1V6ffWGpbdEfxHW48NKHr8vjs6Uw
   89l3Nv+KhAC5NiBYcwTzAZ3NKoo85pX6b/Iy/cEcUgsEwKEqQvKR9egIo
   G07KL77fAu2/h/YlzYvB0XMrcDlZN1OBesjfw0kduJiGJt2kDXTSFiyWl
   jCkL85/CJ9EotDZs2/cpXI62hgoaupo3bP+PjWRls+x93J8eNjMC39UeU
   R7Ltes60f88xi0+uLFZNpe2QkkIX/t27Ewn1BgEnvNZXm2UN4dJbPznDB
   g==;
X-CSE-ConnectionGUID: x748J1OBRpWH2IW/2uf1Pw==
X-CSE-MsgGUID: XQKwL4BETT6RvxMo/mkiQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64102851"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64102851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:53:47 -0700
X-CSE-ConnectionGUID: EcDmMgGaRXGPLHLYwvCD3w==
X-CSE-MsgGUID: npL9l8GGSk+t0lHA9sTCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186097128"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 04:53:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEnhC-000N48-27;
	Fri, 31 Oct 2025 11:53:41 +0000
Date: Fri, 31 Oct 2025 19:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/14] spi: rzv2h-rspi: add support for variable transfer
 clock
Message-ID: <202510311957.SRNglGAw-lkp@intel.com>
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
In-Reply-To: <20251028133151.1487327-10-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251028133151.1487327-10-cosmin-gabriel.tanislav.xa@renesas.com>
TO: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-spi@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-clk]
[also build test WARNING on next-20251030]
[cannot apply to broonie-spi/for-next geert-renesas-devel/next robh/for-next linus/master v6.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/clk-renesas-r9a09g077-add-SPI-module-clocks/20251028-213853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20251028133151.1487327-10-cosmin-gabriel.tanislav.xa%40renesas.com
patch subject: [PATCH 09/14] spi: rzv2h-rspi: add support for variable transfer clock
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311957.SRNglGAw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510311957.SRNglGAw-lkp@intel.com/

smatch warnings:
drivers/spi/spi-rzv2h-rspi.c:510 rzv2h_rspi_probe() warn: missing unwind goto?

vim +510 drivers/spi/spi-rzv2h-rspi.c

8b61c8919dff08 Fabrizio Castro 2025-07-04  427  
8b61c8919dff08 Fabrizio Castro 2025-07-04  428  static int rzv2h_rspi_probe(struct platform_device *pdev)
8b61c8919dff08 Fabrizio Castro 2025-07-04  429  {
8b61c8919dff08 Fabrizio Castro 2025-07-04  430  	struct spi_controller *controller;
8b61c8919dff08 Fabrizio Castro 2025-07-04  431  	struct device *dev = &pdev->dev;
8b61c8919dff08 Fabrizio Castro 2025-07-04  432  	struct rzv2h_rspi_priv *rspi;
8b61c8919dff08 Fabrizio Castro 2025-07-04  433  	struct clk_bulk_data *clks;
8b61c8919dff08 Fabrizio Castro 2025-07-04  434  	int irq_rx, ret, i;
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  435  	long tclk_rate;
8b61c8919dff08 Fabrizio Castro 2025-07-04  436  
8b61c8919dff08 Fabrizio Castro 2025-07-04  437  	controller = devm_spi_alloc_host(dev, sizeof(*rspi));
8b61c8919dff08 Fabrizio Castro 2025-07-04  438  	if (!controller)
8b61c8919dff08 Fabrizio Castro 2025-07-04  439  		return -ENOMEM;
8b61c8919dff08 Fabrizio Castro 2025-07-04  440  
8b61c8919dff08 Fabrizio Castro 2025-07-04  441  	rspi = spi_controller_get_devdata(controller);
8b61c8919dff08 Fabrizio Castro 2025-07-04  442  	platform_set_drvdata(pdev, rspi);
8b61c8919dff08 Fabrizio Castro 2025-07-04  443  
8b61c8919dff08 Fabrizio Castro 2025-07-04  444  	rspi->controller = controller;
8b61c8919dff08 Fabrizio Castro 2025-07-04  445  
a1ddc1bd04968e Cosmin Tanislav 2025-10-28  446  	rspi->info = device_get_match_data(dev);
a1ddc1bd04968e Cosmin Tanislav 2025-10-28  447  
8b61c8919dff08 Fabrizio Castro 2025-07-04  448  	rspi->base = devm_platform_ioremap_resource(pdev, 0);
8b61c8919dff08 Fabrizio Castro 2025-07-04  449  	if (IS_ERR(rspi->base))
8b61c8919dff08 Fabrizio Castro 2025-07-04  450  		return PTR_ERR(rspi->base);
8b61c8919dff08 Fabrizio Castro 2025-07-04  451  
8b61c8919dff08 Fabrizio Castro 2025-07-04  452  	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
2cfbd980e14a68 Cosmin Tanislav 2025-10-28  453  	if (ret != rspi->info->num_clks)
8b61c8919dff08 Fabrizio Castro 2025-07-04  454  		return dev_err_probe(dev, ret >= 0 ? -EINVAL : ret,
8b61c8919dff08 Fabrizio Castro 2025-07-04  455  				     "cannot get clocks\n");
2cfbd980e14a68 Cosmin Tanislav 2025-10-28  456  	for (i = 0; i < rspi->info->num_clks; i++) {
2cfbd980e14a68 Cosmin Tanislav 2025-10-28  457  		if (!strcmp(clks[i].id, rspi->info->tclk_name)) {
8b61c8919dff08 Fabrizio Castro 2025-07-04  458  			rspi->tclk = clks[i].clk;
92eb6cc239b9d2 Cosmin Tanislav 2025-10-28  459  		} else if (rspi->info->find_pclk_rate &&
92eb6cc239b9d2 Cosmin Tanislav 2025-10-28  460  			   !strcmp(clks[i].id, "pclk")) {
92eb6cc239b9d2 Cosmin Tanislav 2025-10-28  461  			rspi->pclk = clks[i].clk;
8b61c8919dff08 Fabrizio Castro 2025-07-04  462  		}
8b61c8919dff08 Fabrizio Castro 2025-07-04  463  	}
8b61c8919dff08 Fabrizio Castro 2025-07-04  464  
8b61c8919dff08 Fabrizio Castro 2025-07-04  465  	if (!rspi->tclk)
8b61c8919dff08 Fabrizio Castro 2025-07-04  466  		return dev_err_probe(dev, -EINVAL, "Failed to get tclk\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  467  
8b61c8919dff08 Fabrizio Castro 2025-07-04  468  	rspi->resets[0].id = "presetn";
8b61c8919dff08 Fabrizio Castro 2025-07-04  469  	rspi->resets[1].id = "tresetn";
c10c8eb75d9db8 Cosmin Tanislav 2025-10-28  470  	ret = devm_reset_control_bulk_get_optional_exclusive(dev, RSPI_RESET_NUM,
8b61c8919dff08 Fabrizio Castro 2025-07-04  471  							     rspi->resets);
8b61c8919dff08 Fabrizio Castro 2025-07-04  472  	if (ret)
8b61c8919dff08 Fabrizio Castro 2025-07-04  473  		return dev_err_probe(dev, ret, "cannot get resets\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  474  
8b61c8919dff08 Fabrizio Castro 2025-07-04  475  	irq_rx = platform_get_irq_byname(pdev, "rx");
8b61c8919dff08 Fabrizio Castro 2025-07-04  476  	if (irq_rx < 0)
8b61c8919dff08 Fabrizio Castro 2025-07-04  477  		return dev_err_probe(dev, irq_rx, "cannot get IRQ 'rx'\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  478  
8b61c8919dff08 Fabrizio Castro 2025-07-04  479  	ret = reset_control_bulk_deassert(RSPI_RESET_NUM, rspi->resets);
8b61c8919dff08 Fabrizio Castro 2025-07-04  480  	if (ret)
8b61c8919dff08 Fabrizio Castro 2025-07-04  481  		return dev_err_probe(dev, ret, "failed to deassert resets\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  482  
8b61c8919dff08 Fabrizio Castro 2025-07-04  483  	init_waitqueue_head(&rspi->wait);
8b61c8919dff08 Fabrizio Castro 2025-07-04  484  
8b61c8919dff08 Fabrizio Castro 2025-07-04  485  	ret = devm_request_irq(dev, irq_rx, rzv2h_rx_irq_handler, 0,
8b61c8919dff08 Fabrizio Castro 2025-07-04  486  			       dev_name(dev), rspi);
8b61c8919dff08 Fabrizio Castro 2025-07-04  487  	if (ret) {
8b61c8919dff08 Fabrizio Castro 2025-07-04  488  		dev_err(dev, "cannot request `rx` IRQ\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  489  		goto quit_resets;
8b61c8919dff08 Fabrizio Castro 2025-07-04  490  	}
8b61c8919dff08 Fabrizio Castro 2025-07-04  491  
8b61c8919dff08 Fabrizio Castro 2025-07-04  492  	controller->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH |
8b61c8919dff08 Fabrizio Castro 2025-07-04  493  				SPI_LSB_FIRST;
8b61c8919dff08 Fabrizio Castro 2025-07-04  494  	controller->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
8b61c8919dff08 Fabrizio Castro 2025-07-04  495  	controller->prepare_message = rzv2h_rspi_prepare_message;
8b61c8919dff08 Fabrizio Castro 2025-07-04  496  	controller->unprepare_message = rzv2h_rspi_unprepare_message;
8b61c8919dff08 Fabrizio Castro 2025-07-04  497  	controller->num_chipselect = 4;
8b61c8919dff08 Fabrizio Castro 2025-07-04  498  	controller->transfer_one = rzv2h_rspi_transfer_one;
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  499  
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  500  	tclk_rate = clk_round_rate(rspi->tclk, 0);
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  501  	if (tclk_rate < 0)
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  502  		return tclk_rate;
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  503  
8b61c8919dff08 Fabrizio Castro 2025-07-04  504  	controller->min_speed_hz = rzv2h_rspi_calc_bitrate(tclk_rate,
8b61c8919dff08 Fabrizio Castro 2025-07-04  505  							   RSPI_SPBR_SPR_MAX,
8b61c8919dff08 Fabrizio Castro 2025-07-04  506  							   RSPI_SPCMD_BRDV_MAX);
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  507  
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  508  	tclk_rate = clk_round_rate(rspi->tclk, ULONG_MAX);
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  509  	if (tclk_rate < 0)
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28 @510  		return tclk_rate;
c4e1a7fda7e52d Cosmin Tanislav 2025-10-28  511  
8b61c8919dff08 Fabrizio Castro 2025-07-04  512  	controller->max_speed_hz = rzv2h_rspi_calc_bitrate(tclk_rate,
8b61c8919dff08 Fabrizio Castro 2025-07-04  513  							   RSPI_SPBR_SPR_MIN,
8b61c8919dff08 Fabrizio Castro 2025-07-04  514  							   RSPI_SPCMD_BRDV_MIN);
8b61c8919dff08 Fabrizio Castro 2025-07-04  515  
8b61c8919dff08 Fabrizio Castro 2025-07-04  516  	device_set_node(&controller->dev, dev_fwnode(dev));
8b61c8919dff08 Fabrizio Castro 2025-07-04  517  
8b61c8919dff08 Fabrizio Castro 2025-07-04  518  	ret = spi_register_controller(controller);
8b61c8919dff08 Fabrizio Castro 2025-07-04  519  	if (ret) {
8b61c8919dff08 Fabrizio Castro 2025-07-04  520  		dev_err(dev, "register controller failed\n");
8b61c8919dff08 Fabrizio Castro 2025-07-04  521  		goto quit_resets;
8b61c8919dff08 Fabrizio Castro 2025-07-04  522  	}
8b61c8919dff08 Fabrizio Castro 2025-07-04  523  
8b61c8919dff08 Fabrizio Castro 2025-07-04  524  	return 0;
8b61c8919dff08 Fabrizio Castro 2025-07-04  525  
8b61c8919dff08 Fabrizio Castro 2025-07-04  526  quit_resets:
8b61c8919dff08 Fabrizio Castro 2025-07-04  527  	reset_control_bulk_assert(RSPI_RESET_NUM, rspi->resets);
8b61c8919dff08 Fabrizio Castro 2025-07-04  528  
8b61c8919dff08 Fabrizio Castro 2025-07-04  529  	return ret;
8b61c8919dff08 Fabrizio Castro 2025-07-04  530  }
8b61c8919dff08 Fabrizio Castro 2025-07-04  531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
