Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7CC10A11
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716030663; cv=none; b=p+hrBmhB6+GwWyxEEYnKbYTQlhiPKEPRBsipO0+aArQF8ZejKSCUlWVw82RKjZAB8qazf6e26oGfD6SY9NB8LiLaDuS0pQMLWQaZGfvtvfzCy69U7PlBCLRMZneZ5sGUbWwqm0XTMueXjjZj/DwRKnIKLV0TJXYgc/gZIqzL7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716030663; c=relaxed/simple;
	bh=YSClO0eNNuiz8YV8ixdj8r5+JSx+pzSdEY76ln1akZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDsLysyRPgR5E6SG1R1c6I3Coi0SY543Q91X/2F9cXgaLPdHL5gBPKTZw+LjuJS6w/0Th0cCotlct3j6X2eD6LKb7+iOvVBDivvFGr6yGWeHPz+ds7IF//UfzS6nsaUDgEmmVStsUZ0tXZEcMswwM92TIAC4cBILsQwfayhO2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY5QBZ1P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY5QBZ1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716030661; x=1747566661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSClO0eNNuiz8YV8ixdj8r5+JSx+pzSdEY76ln1akZo=;
  b=YY5QBZ1PZNJOk2rgTSfgPE317XaJeP1fXnIqZje8+UlqZHYH2lCPl2X0
   sREqRJQoaTp2i1iQE7ymGm1Q66LpB4wcs+v086AfgZiequNq2XAjT71gR
   ncUlD7Oyrkq+gwXGepNXGDSK14KNVV6hmSrPHNOUPhIrEaidk9l40p5MG
   vJjW9avsC7QkDSBj0UjAAGlpAYWUfi1iDzUNQPpXQ1w+Oj/SSPx/gQY75
   9/GCL+WUS/5DlzUFPp8a28xKJhIYmjxB1am3c1/T5axoaWgIoTtsqRQo6
   XBsQimMOd/hhz9eBL+ly+UEplIysxDTAbG4jmuUHtibxJ/P0bBxifIL1h
   w==;
X-CSE-ConnectionGUID: GGBAt6aYSt+jhxTQAoZxBA==
X-CSE-MsgGUID: p44bsZRKSg2MUnJkITyflg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12386001"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12386001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 04:11:01 -0700
X-CSE-ConnectionGUID: RJaLnPufRqisySw2kfXVXg==
X-CSE-MsgGUID: yT1/6y1XQtWTmIPZPfKL9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36865607"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2024 04:10:59 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Hxo-00027s-2t;
	Sat, 18 May 2024 11:10:56 +0000
Date: Sat, 18 May 2024 19:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/mediatek/clk-mtk.c:622 __mtk_clk_simple_probe() warn:
 'base' from of_iomap() not released on lines: 506.
Message-ID: <202405181935.AEIJsSyG-lkp@intel.com>
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
TO: "Pin-yen Lin" <treapking@chromium.org>
CC: Stephen Boyd <sboyd@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b377b4868ef17b040065bd468668c707d2477a5
commit: 2f7b1d8b5505efb0057cd1ab85fca206063ea4c3 clk: mediatek: Do a runtime PM get on controllers during probe
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: csky-randconfig-r081-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181935.AEIJsSyG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405181935.AEIJsSyG-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mtk.c:622 __mtk_clk_simple_probe() warn: 'base' from of_iomap() not released on lines: 506.

vim +/base +622 drivers/clk/mediatek/clk-mtk.c

b87385eb5a8ed2 Chen-Yu Tsai               2022-02-08  466  
252091242404aa AngeloGioacchino Del Regno 2023-03-06  467  static int __mtk_clk_simple_probe(struct platform_device *pdev,
252091242404aa AngeloGioacchino Del Regno 2023-03-06  468  				  struct device_node *node)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  469  {
252091242404aa AngeloGioacchino Del Regno 2023-03-06  470  	const struct platform_device_id *id;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  471  	const struct mtk_clk_desc *mcd;
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  472  	struct clk_hw_onecell_data *clk_data;
51821765e89906 AngeloGioacchino Del Regno 2023-06-15  473  	void __iomem *base = NULL;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  474  	int num_clks, r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  475  
4b476b0f453431 AngeloGioacchino Del Regno 2023-03-06  476  	mcd = device_get_match_data(&pdev->dev);
252091242404aa AngeloGioacchino Del Regno 2023-03-06  477  	if (!mcd) {
252091242404aa AngeloGioacchino Del Regno 2023-03-06  478  		/* Clock driver wasn't registered from devicetree */
252091242404aa AngeloGioacchino Del Regno 2023-03-06  479  		id = platform_get_device_id(pdev);
252091242404aa AngeloGioacchino Del Regno 2023-03-06  480  		if (id)
252091242404aa AngeloGioacchino Del Regno 2023-03-06  481  			mcd = (const struct mtk_clk_desc *)id->driver_data;
252091242404aa AngeloGioacchino Del Regno 2023-03-06  482  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  483  		if (!mcd)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  484  			return -EINVAL;
252091242404aa AngeloGioacchino Del Regno 2023-03-06  485  	}
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  486  
51821765e89906 AngeloGioacchino Del Regno 2023-06-15  487  	/* Composite and divider clocks needs us to pass iomem pointer */
51821765e89906 AngeloGioacchino Del Regno 2023-06-15  488  	if (mcd->composite_clks || mcd->divider_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  489  		if (!mcd->shared_io)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  490  			base = devm_platform_ioremap_resource(pdev, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  491  		else
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  492  			base = of_iomap(node, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  493  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  494  		if (IS_ERR_OR_NULL(base))
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  495  			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  496  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  497  
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  498  
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  499  	devm_pm_runtime_enable(&pdev->dev);
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  500  	/*
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  501  	 * Do a pm_runtime_resume_and_get() to workaround a possible
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  502  	 * deadlock between clk_register() and the genpd framework.
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  503  	 */
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  504  	r = pm_runtime_resume_and_get(&pdev->dev);
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  505  	if (r)
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  506  		return r;
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  507  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  508  	/* Calculate how many clk_hw_onecell_data entries to allocate */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  509  	num_clks = mcd->num_clks + mcd->num_composite_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  510  	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  511  	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  512  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  513  	clk_data = mtk_alloc_clk_data(num_clks);
3db7285e044144 Bosi Zhang                 2023-04-22  514  	if (!clk_data) {
3db7285e044144 Bosi Zhang                 2023-04-22  515  		r = -ENOMEM;
3db7285e044144 Bosi Zhang                 2023-04-22  516  		goto free_base;
3db7285e044144 Bosi Zhang                 2023-04-22  517  	}
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  518  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  519  	if (mcd->fixed_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  520  		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  521  						mcd->num_fixed_clks, clk_data);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  522  		if (r)
6203815bf97eea Chun-Jie Chen              2021-09-14  523  			goto free_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  524  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  525  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  526  	if (mcd->factor_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  527  		r = mtk_clk_register_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  528  					     mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  529  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  530  			goto unregister_fixed_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  531  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  532  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  533  	if (mcd->mux_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  534  		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  535  					   mcd->num_mux_clks, node,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  536  					   mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  537  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  538  			goto unregister_factors;
b30a027779a501 Yang Li                    2023-02-02  539  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  540  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  541  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  542  		/* We don't check composite_lock because it's optional */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  543  		r = mtk_clk_register_composites(&pdev->dev,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  544  						mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  545  						mcd->num_composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  546  						base, mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  547  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  548  			goto unregister_muxes;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  549  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  550  
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  551  	if (mcd->divider_clks) {
6b7daeaa7e6415 AngeloGioacchino Del Regno 2023-03-06  552  		r = mtk_clk_register_dividers(&pdev->dev,
6b7daeaa7e6415 AngeloGioacchino Del Regno 2023-03-06  553  					      mcd->divider_clks,
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  554  					      mcd->num_divider_clks,
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  555  					      base, mcd->clk_lock, clk_data);
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  556  		if (r)
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  557  			goto unregister_composites;
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  558  	}
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  559  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  560  	if (mcd->clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  561  		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  562  					   mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  563  		if (r)
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  564  			goto unregister_dividers;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  565  	}
6203815bf97eea Chun-Jie Chen              2021-09-14  566  
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  567  	if (mcd->clk_notifier_func) {
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  568  		struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  569  
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  570  		r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  571  		if (r)
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  572  			goto unregister_clks;
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  573  	}
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  574  
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  575  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  576  	if (r)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  577  		goto unregister_clks;
6203815bf97eea Chun-Jie Chen              2021-09-14  578  
2204d96b191912 Chen-Yu Tsai               2022-02-08  579  	platform_set_drvdata(pdev, clk_data);
2204d96b191912 Chen-Yu Tsai               2022-02-08  580  
b27a604a579310 Rex-BC Chen                2022-05-23  581  	if (mcd->rst_desc) {
b27a604a579310 Rex-BC Chen                2022-05-23  582  		r = mtk_register_reset_controller_with_dev(&pdev->dev,
b27a604a579310 Rex-BC Chen                2022-05-23  583  							   mcd->rst_desc);
b27a604a579310 Rex-BC Chen                2022-05-23  584  		if (r)
b27a604a579310 Rex-BC Chen                2022-05-23  585  			goto unregister_clks;
b27a604a579310 Rex-BC Chen                2022-05-23  586  	}
b27a604a579310 Rex-BC Chen                2022-05-23  587  
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  588  	pm_runtime_put(&pdev->dev);
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  589  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  590  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  591  
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  592  unregister_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  593  	if (mcd->clks)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  594  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  595  unregister_dividers:
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  596  	if (mcd->divider_clks)
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  597  		mtk_clk_unregister_dividers(mcd->divider_clks,
1fe074b1f112dc AngeloGioacchino Del Regno 2023-03-06  598  					    mcd->num_divider_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  599  unregister_composites:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  600  	if (mcd->composite_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  601  		mtk_clk_unregister_composites(mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  602  					      mcd->num_composite_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  603  unregister_muxes:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  604  	if (mcd->mux_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  605  		mtk_clk_unregister_muxes(mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  606  					 mcd->num_mux_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  607  unregister_factors:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  608  	if (mcd->factor_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  609  		mtk_clk_unregister_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  610  					   mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  611  unregister_fixed_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  612  	if (mcd->fixed_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  613  		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  614  					      mcd->num_fixed_clks, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  615  free_data:
6203815bf97eea Chun-Jie Chen              2021-09-14  616  	mtk_free_clk_data(clk_data);
3db7285e044144 Bosi Zhang                 2023-04-22  617  free_base:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  618  	if (mcd->shared_io && base)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  619  		iounmap(base);
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  620  
2f7b1d8b5505ef Pin-yen Lin                2024-03-12  621  	pm_runtime_put(&pdev->dev);
6203815bf97eea Chun-Jie Chen              2021-09-14 @622  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  623  }
32b028fb1d09a0 Miles Chen                 2021-09-02  624  

:::::: The code at line 622 was first introduced by commit
:::::: 6203815bf97eeaa78ca2e47758f0232043e69ba7 clk: mediatek: Fix resource leak in mtk_clk_simple_probe

:::::: TO: Chun-Jie Chen <chun-jie.chen@mediatek.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
