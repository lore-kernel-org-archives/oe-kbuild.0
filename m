Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF388F69
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678808684; x=1710344684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ai/1e+l6ZIoZBKTwRFaG0YZU7rIBTVugOZQXgnUxcRA=;
  b=I6+yWNat/VCtyz16LQCv10bdeg6SUVU0QJ1T1dtwzGBNXpG+kHydeuYl
   xMr/xHoLJ8xooUufJ5ol7RduDPPJqEaepIuBK4o4qjHDNuXy5ivwe8h1s
   hzxiT5CmdRwyy0z3FSM5Be3RNq+fzNJiKkE5SRdGFnlDuEERg6fPo4IqT
   7Cl+bDD+pK9kYJX1icedR6/o05Q5soXCZCfPX+cgeI6KL2Oik9ANPyLVS
   ZcMXWnUpOcEv1ppTOhZpTsDRvxM3wq342/Y4I+xL05GGJ+F5bi0kkWz6U
   JiFiHP+6M/C1IMWwc/SqmfQByoMgAct21ghTnhgtLNo5VME7kaGy7QDuY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339827496"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="339827496"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768141024"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="768141024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 08:44:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc6pN-000704-0b;
	Tue, 14 Mar 2023 15:44:41 +0000
Date: Tue, 14 Mar 2023 23:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/mediatek/clk-mtk.c:575 mtk_clk_simple_probe() warn:
 'base' from of_iomap() not released on lines: 496.
Message-ID: <202303142331.mAJDR88r-lkp@intel.com>
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
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 7b6183108c8ccf0dc295f39cdf78bd8078455636 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
date:   6 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 weeks ago
config: openrisc-randconfig-m031-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142331.mAJDR88r-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303142331.mAJDR88r-lkp@intel.com/

New smatch warnings:
drivers/clk/mediatek/clk-mtk.c:575 mtk_clk_simple_probe() warn: 'base' from of_iomap() not released on lines: 496.

Old smatch warnings:
drivers/clk/mediatek/clk-mtk.c:573 mtk_clk_simple_probe() error: uninitialized symbol 'base'.

vim +/base +575 drivers/clk/mediatek/clk-mtk.c

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
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  573  	if (mcd->shared_io && base)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  574  		iounmap(base);
6203815bf97eea Chun-Jie Chen              2021-09-14 @575  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  576  }
7cbe5cb291fa3c AngeloGioacchino Del Regno 2022-09-21  577  EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
32b028fb1d09a0 Miles Chen                 2021-09-02  578  

:::::: The code at line 575 was first introduced by commit
:::::: 6203815bf97eeaa78ca2e47758f0232043e69ba7 clk: mediatek: Fix resource leak in mtk_clk_simple_probe

:::::: TO: Chun-Jie Chen <chun-jie.chen@mediatek.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
