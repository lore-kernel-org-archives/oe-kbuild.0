Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068510E6
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 01:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683337235; x=1714873235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXHkbbsqkmdy39H11RqDiIC+JeCaeBQos5XgmwjwWFk=;
  b=lO6xzniW8XbzmxublihdO6GQ8bbJtPE1BtizQhLhYx0JVUPpP7FFusJG
   IKWvDeeuAxaAyIwezDSmdnsglZpsQHcfXDQrIp+JsyF0ioOqS9LXvvLmP
   2c2nSFqSkTCMiX97J5f4AmcArLbnOq6u8j+2ATHqYKL3HtPgDzdEE5Pea
   Ys5NlOcinYROa3DvHBQO0y57p1hUwaLWKc2sqlOWS4YKA80li9ybrM+tW
   vYw9DfPy4BgCnav0O/qHl7R7Zo+LDasYx0Dk2mQ18kD2etLX+BgM5EqJg
   NE1cwbDc7+q9A68nzpf6Omkr3QBtIwM7mPvpSa+vLdlRFMUxw8kk2lZxX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="348154007"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="348154007"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944118961"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="944118961"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 18:40:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6uX-00012L-0r;
	Sat, 06 May 2023 01:40:33 +0000
Date: Sat, 6 May 2023 09:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/mediatek/clk-mtk.c:588 __mtk_clk_simple_probe() error:
 uninitialized symbol 'base'.
Message-ID: <202305060920.yjRhTxrD-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   418d5c98319f67b9ae651babea031b5394425c18
commit: 252091242404aa7cee131a827a04b8e3d9b88daa clk: mediatek: clk-mtk: Introduce clk_mtk_pdev_{probe,remove}()
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: microblaze-randconfig-m041-20230430 (https://download.01.org/0day-ci/archive/20230506/202305060920.yjRhTxrD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305060920.yjRhTxrD-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mtk.c:588 __mtk_clk_simple_probe() error: uninitialized symbol 'base'.

vim +/base +588 drivers/clk/mediatek/clk-mtk.c

b87385eb5a8ed2 Chen-Yu Tsai               2022-02-08  464  
252091242404aa AngeloGioacchino Del Regno 2023-03-06  465  static int __mtk_clk_simple_probe(struct platform_device *pdev,
252091242404aa AngeloGioacchino Del Regno 2023-03-06  466  				  struct device_node *node)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  467  {
252091242404aa AngeloGioacchino Del Regno 2023-03-06  468  	const struct platform_device_id *id;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  469  	const struct mtk_clk_desc *mcd;
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  470  	struct clk_hw_onecell_data *clk_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  471  	void __iomem *base;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  472  	int num_clks, r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  473  
4b476b0f453431 AngeloGioacchino Del Regno 2023-03-06  474  	mcd = device_get_match_data(&pdev->dev);
252091242404aa AngeloGioacchino Del Regno 2023-03-06  475  	if (!mcd) {
252091242404aa AngeloGioacchino Del Regno 2023-03-06  476  		/* Clock driver wasn't registered from devicetree */
252091242404aa AngeloGioacchino Del Regno 2023-03-06  477  		id = platform_get_device_id(pdev);
252091242404aa AngeloGioacchino Del Regno 2023-03-06  478  		if (id)
252091242404aa AngeloGioacchino Del Regno 2023-03-06  479  			mcd = (const struct mtk_clk_desc *)id->driver_data;
252091242404aa AngeloGioacchino Del Regno 2023-03-06  480  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  481  		if (!mcd)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  482  			return -EINVAL;
252091242404aa AngeloGioacchino Del Regno 2023-03-06  483  	}
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  484  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  485  	/* Composite clocks needs us to pass iomem pointer */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  486  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  487  		if (!mcd->shared_io)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  488  			base = devm_platform_ioremap_resource(pdev, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  489  		else
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  490  			base = of_iomap(node, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  491  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  492  		if (IS_ERR_OR_NULL(base))
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  493  			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  494  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  495  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  496  	/* Calculate how many clk_hw_onecell_data entries to allocate */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  497  	num_clks = mcd->num_clks + mcd->num_composite_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  498  	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  499  	num_clks += mcd->num_mux_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  500  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  501  	clk_data = mtk_alloc_clk_data(num_clks);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  502  	if (!clk_data)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  503  		return -ENOMEM;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  504  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  505  	if (mcd->fixed_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  506  		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  507  						mcd->num_fixed_clks, clk_data);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  508  		if (r)
6203815bf97eea Chun-Jie Chen              2021-09-14  509  			goto free_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  510  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  511  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  512  	if (mcd->factor_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  513  		r = mtk_clk_register_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  514  					     mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  515  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  516  			goto unregister_fixed_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  517  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  518  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  519  	if (mcd->mux_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  520  		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  521  					   mcd->num_mux_clks, node,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  522  					   mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  523  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  524  			goto unregister_factors;
b30a027779a501 Yang Li                    2023-02-02  525  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  526  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  527  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  528  		/* We don't check composite_lock because it's optional */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  529  		r = mtk_clk_register_composites(&pdev->dev,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  530  						mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  531  						mcd->num_composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  532  						base, mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  533  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  534  			goto unregister_muxes;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  535  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  536  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  537  	if (mcd->clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  538  		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  539  					   mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  540  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  541  			goto unregister_composites;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  542  	}
6203815bf97eea Chun-Jie Chen              2021-09-14  543  
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  544  	if (mcd->clk_notifier_func) {
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  545  		struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  546  
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  547  		r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  548  		if (r)
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  549  			goto unregister_clks;
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  550  	}
fd9fe654f41c02 AngeloGioacchino Del Regno 2023-01-20  551  
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  552  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  553  	if (r)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  554  		goto unregister_clks;
6203815bf97eea Chun-Jie Chen              2021-09-14  555  
2204d96b191912 Chen-Yu Tsai               2022-02-08  556  	platform_set_drvdata(pdev, clk_data);
2204d96b191912 Chen-Yu Tsai               2022-02-08  557  
b27a604a579310 Rex-BC Chen                2022-05-23  558  	if (mcd->rst_desc) {
b27a604a579310 Rex-BC Chen                2022-05-23  559  		r = mtk_register_reset_controller_with_dev(&pdev->dev,
b27a604a579310 Rex-BC Chen                2022-05-23  560  							   mcd->rst_desc);
b27a604a579310 Rex-BC Chen                2022-05-23  561  		if (r)
b27a604a579310 Rex-BC Chen                2022-05-23  562  			goto unregister_clks;
b27a604a579310 Rex-BC Chen                2022-05-23  563  	}
b27a604a579310 Rex-BC Chen                2022-05-23  564  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  565  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  566  
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  567  unregister_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  568  	if (mcd->clks)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  569  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  570  unregister_composites:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  571  	if (mcd->composite_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  572  		mtk_clk_unregister_composites(mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  573  					      mcd->num_composite_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  574  unregister_muxes:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  575  	if (mcd->mux_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  576  		mtk_clk_unregister_muxes(mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  577  					 mcd->num_mux_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  578  unregister_factors:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  579  	if (mcd->factor_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  580  		mtk_clk_unregister_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  581  					   mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  582  unregister_fixed_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  583  	if (mcd->fixed_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  584  		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  585  					      mcd->num_fixed_clks, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  586  free_data:
6203815bf97eea Chun-Jie Chen              2021-09-14  587  	mtk_free_clk_data(clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20 @588  	if (mcd->shared_io && base)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  589  		iounmap(base);
6203815bf97eea Chun-Jie Chen              2021-09-14  590  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  591  }
32b028fb1d09a0 Miles Chen                 2021-09-02  592  

:::::: The code at line 588 was first introduced by commit
:::::: 7b6183108c8ccf0dc295f39cdf78bd8078455636 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
