Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9C6FC5
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678132836; x=1709668836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpPFqotH5kavjw3fnjeK+JXWkm81EWUsLJyFl2lZ2Ak=;
  b=g+4k54bNj85txysMPOuITHmEF34+bvyzgv95esf6lMxejON9iL1rjp/x
   4KsPBbmphXvBjGsjvEDHwLnm1eZTHMSq1wpXyRsr/gNJmeWuG1Dw+4kD0
   E9lJ08o2/EATY8WuH98rDxKTUaLN+QAVmvY2QpaaJQjnVsfD9AkavKzQ+
   Ame/KyCL6s/HMRaJRL4dEgl8IuY5C6Gq71yIOeDK7c7khGg2gewJ5AFGJ
   WA+nATxZ2cur9eU4lz3dEd2RVLNftfLNXvNOsx8fuzLm43lyRpgaGS5yy
   kj/b3lK6pEy4RzyfTsRFXKG0GeERPR+XSEcrpnB7BRQ0yz8zFmhMmwc6b
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400485133"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="400485133"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 12:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800115379"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="800115379"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 12:00:32 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZH0Z-0000b2-1s;
	Mon, 06 Mar 2023 20:00:31 +0000
Date: Tue, 7 Mar 2023 04:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/mediatek/clk-mtk.c:573 mtk_clk_simple_probe() error:
 uninitialized symbol 'base'.
Message-ID: <202303070308.4CPgt9yI-lkp@intel.com>
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
CC: Miles Chen <miles.chen@mediatek.com>
CC: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 7b6183108c8ccf0dc295f39cdf78bd8078455636 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-m031-20230305 (https://download.01.org/0day-ci/archive/20230307/202303070308.4CPgt9yI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303070308.4CPgt9yI-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mtk.c:573 mtk_clk_simple_probe() error: uninitialized symbol 'base'.

vim +/base +573 drivers/clk/mediatek/clk-mtk.c

b87385eb5a8ed2 Chen-Yu Tsai               2022-02-08  465  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  466  int mtk_clk_simple_probe(struct platform_device *pdev)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  467  {
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  468  	const struct mtk_clk_desc *mcd;
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  469  	struct clk_hw_onecell_data *clk_data;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  470  	struct device_node *node = pdev->dev.of_node;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  471  	void __iomem *base;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  472  	int num_clks, r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  473  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  474  	mcd = of_device_get_match_data(&pdev->dev);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  475  	if (!mcd)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  476  		return -EINVAL;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  477  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  478  	/* Composite clocks needs us to pass iomem pointer */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  479  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  480  		if (!mcd->shared_io)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  481  			base = devm_platform_ioremap_resource(pdev, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  482  		else
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  483  			base = of_iomap(node, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  484  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  485  		if (IS_ERR_OR_NULL(base))
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  486  			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  487  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  488  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  489  	/* Calculate how many clk_hw_onecell_data entries to allocate */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  490  	num_clks = mcd->num_clks + mcd->num_composite_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  491  	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  492  	num_clks += mcd->num_mux_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  493  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  494  	clk_data = mtk_alloc_clk_data(num_clks);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  495  	if (!clk_data)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  496  		return -ENOMEM;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  497  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  498  	if (mcd->fixed_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  499  		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  500  						mcd->num_fixed_clks, clk_data);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  501  		if (r)
6203815bf97eea Chun-Jie Chen              2021-09-14  502  			goto free_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  503  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  504  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  505  	if (mcd->factor_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  506  		r = mtk_clk_register_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  507  					     mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  508  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  509  			goto unregister_fixed_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  510  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  511  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  512  	if (mcd->mux_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  513  		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  514  					   mcd->num_mux_clks, node,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  515  					   mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  516  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  517  			goto unregister_factors;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  518  	};
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  519  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  520  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  521  		/* We don't check composite_lock because it's optional */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  522  		r = mtk_clk_register_composites(&pdev->dev,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  523  						mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  524  						mcd->num_composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  525  						base, mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  526  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  527  			goto unregister_muxes;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  528  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  529  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  530  	if (mcd->clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  531  		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  532  					   mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  533  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  534  			goto unregister_composites;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  535  	}
6203815bf97eea Chun-Jie Chen              2021-09-14  536  
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  537  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  538  	if (r)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  539  		goto unregister_clks;
6203815bf97eea Chun-Jie Chen              2021-09-14  540  
2204d96b191912 Chen-Yu Tsai               2022-02-08  541  	platform_set_drvdata(pdev, clk_data);
2204d96b191912 Chen-Yu Tsai               2022-02-08  542  
b27a604a579310 Rex-BC Chen                2022-05-23  543  	if (mcd->rst_desc) {
b27a604a579310 Rex-BC Chen                2022-05-23  544  		r = mtk_register_reset_controller_with_dev(&pdev->dev,
b27a604a579310 Rex-BC Chen                2022-05-23  545  							   mcd->rst_desc);
b27a604a579310 Rex-BC Chen                2022-05-23  546  		if (r)
b27a604a579310 Rex-BC Chen                2022-05-23  547  			goto unregister_clks;
b27a604a579310 Rex-BC Chen                2022-05-23  548  	}
b27a604a579310 Rex-BC Chen                2022-05-23  549  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  550  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  551  
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  552  unregister_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  553  	if (mcd->clks)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  554  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  555  unregister_composites:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  556  	if (mcd->composite_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  557  		mtk_clk_unregister_composites(mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  558  					      mcd->num_composite_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  559  unregister_muxes:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  560  	if (mcd->mux_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  561  		mtk_clk_unregister_muxes(mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  562  					 mcd->num_mux_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  563  unregister_factors:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  564  	if (mcd->factor_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  565  		mtk_clk_unregister_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  566  					   mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  567  unregister_fixed_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  568  	if (mcd->fixed_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  569  		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  570  					      mcd->num_fixed_clks, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  571  free_data:
6203815bf97eea Chun-Jie Chen              2021-09-14  572  	mtk_free_clk_data(clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20 @573  	if (mcd->shared_io && base)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  574  		iounmap(base);
6203815bf97eea Chun-Jie Chen              2021-09-14  575  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  576  }
7cbe5cb291fa3c AngeloGioacchino Del Regno 2022-09-21  577  EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
32b028fb1d09a0 Miles Chen                 2021-09-02  578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
