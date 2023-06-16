Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF5E624
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686899775; x=1718435775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhBBDCc5FgDPziO9FgQDtSrx/49oLvmJJVhZsLmp51o=;
  b=B9rDYHCY25WxjYNpCJmKWrFXUORK/MdMeXHHqp1JLGtf30Avg8LN3yff
   485x3Ck/i45q7eJW/66CoJwBZ9tF4hXv1mX9dXY2n74Trrn8V3QNyANjb
   EBh75V/VjpPmUbbtMsmyK61GiDAWDEyQIdODlN7mKbzjVVgZ/ARqJSAwe
   FbNiTJ/r6Zfp8Z82L7cNitL4bc30qZ3DQue78MXf+vLq4gZkK6VoQcJt/
   MJbVExh/B6ZAX1sWi2U+v7M0GtUfPaimgw9kDl9RupZbFV8VmxO4nqcbD
   C9am3+9XJeLdkIKLu5mHHG9E/XfFSzKWv1bjjl8UApT7ZXenEQvyOJsmp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425083498"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="425083498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 00:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="836919981"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="836919981"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2023 00:16:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA3gq-0000uS-29;
	Fri, 16 Jun 2023 07:16:12 +0000
Date: Fri, 16 Jun 2023 15:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8294/10546] drivers/clk/imx/clk-imx93.c:294
 imx93_clocks_probe() error: uninitialized symbol 'base'.
Message-ID: <202306161533.4YDmL22b-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Zhanhao Hu <zero12113@hust.edu.cn>
CC: Abel Vesa <abel.vesa@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: e02ba11b457647050cb16e7cad16cec3c252fade [8294/10546] clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
:::::: branch date: 26 hours ago
:::::: commit date: 4 days ago
config: arm-randconfig-m031-20230611 (https://download.01.org/0day-ci/archive/20230616/202306161533.4YDmL22b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306161533.4YDmL22b-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx93.c:294 imx93_clocks_probe() error: uninitialized symbol 'base'.

vim +/base +294 drivers/clk/imx/clk-imx93.c

24defbe194b650 Peng Fan       2022-02-28  257  
24defbe194b650 Peng Fan       2022-02-28  258  static int imx93_clocks_probe(struct platform_device *pdev)
24defbe194b650 Peng Fan       2022-02-28  259  {
24defbe194b650 Peng Fan       2022-02-28  260  	struct device *dev = &pdev->dev;
24defbe194b650 Peng Fan       2022-02-28  261  	struct device_node *np = dev->of_node;
24defbe194b650 Peng Fan       2022-02-28  262  	const struct imx93_clk_root *root;
24defbe194b650 Peng Fan       2022-02-28  263  	const struct imx93_clk_ccgr *ccgr;
bda7b7f396f94d Peng Fan       2022-10-28  264  	void __iomem *base, *anatop_base;
24defbe194b650 Peng Fan       2022-02-28  265  	int i, ret;
24defbe194b650 Peng Fan       2022-02-28  266  
e02ba11b457647 Zhanhao Hu     2023-06-01  267  	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
24defbe194b650 Peng Fan       2022-02-28  268  					  IMX93_CLK_END), GFP_KERNEL);
24defbe194b650 Peng Fan       2022-02-28  269  	if (!clk_hw_data)
24defbe194b650 Peng Fan       2022-02-28  270  		return -ENOMEM;
24defbe194b650 Peng Fan       2022-02-28  271  
24defbe194b650 Peng Fan       2022-02-28  272  	clk_hw_data->num = IMX93_CLK_END;
24defbe194b650 Peng Fan       2022-02-28  273  	clks = clk_hw_data->hws;
24defbe194b650 Peng Fan       2022-02-28  274  
24defbe194b650 Peng Fan       2022-02-28  275  	clks[IMX93_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
8178e245fa953f Dario Binacchi 2022-11-13  276  	clks[IMX93_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
8178e245fa953f Dario Binacchi 2022-11-13  277  	clks[IMX93_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
8178e245fa953f Dario Binacchi 2022-11-13  278  	clks[IMX93_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
24defbe194b650 Peng Fan       2022-02-28  279  
24defbe194b650 Peng Fan       2022-02-28  280  	clks[IMX93_CLK_SYS_PLL_PFD0] = imx_clk_hw_fixed("sys_pll_pfd0", 1000000000);
24defbe194b650 Peng Fan       2022-02-28  281  	clks[IMX93_CLK_SYS_PLL_PFD0_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd0_div2",
24defbe194b650 Peng Fan       2022-02-28  282  								    "sys_pll_pfd0", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  283  	clks[IMX93_CLK_SYS_PLL_PFD1] = imx_clk_hw_fixed("sys_pll_pfd1", 800000000);
24defbe194b650 Peng Fan       2022-02-28  284  	clks[IMX93_CLK_SYS_PLL_PFD1_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd1_div2",
24defbe194b650 Peng Fan       2022-02-28  285  								    "sys_pll_pfd1", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  286  	clks[IMX93_CLK_SYS_PLL_PFD2] = imx_clk_hw_fixed("sys_pll_pfd2", 625000000);
24defbe194b650 Peng Fan       2022-02-28  287  	clks[IMX93_CLK_SYS_PLL_PFD2_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd2_div2",
24defbe194b650 Peng Fan       2022-02-28  288  								    "sys_pll_pfd2", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  289  
24defbe194b650 Peng Fan       2022-02-28  290  	np = of_find_compatible_node(NULL, NULL, "fsl,imx93-anatop");
e02ba11b457647 Zhanhao Hu     2023-06-01  291  	anatop_base = devm_of_iomap(dev, np, 0, NULL);
24defbe194b650 Peng Fan       2022-02-28  292  	of_node_put(np);
e02ba11b457647 Zhanhao Hu     2023-06-01  293  	if (WARN_ON(IS_ERR(anatop_base))) {
e02ba11b457647 Zhanhao Hu     2023-06-01 @294  		ret = PTR_ERR(base);
e02ba11b457647 Zhanhao Hu     2023-06-01  295  		goto unregister_hws;
e02ba11b457647 Zhanhao Hu     2023-06-01  296  	}
24defbe194b650 Peng Fan       2022-02-28  297  
6b60c3ae3e98d0 Peng Fan       2023-04-03  298  	clks[IMX93_CLK_ARM_PLL] = imx_clk_fracn_gppll_integer("arm_pll", "osc_24m",
6b60c3ae3e98d0 Peng Fan       2023-04-03  299  							      anatop_base + 0x1000,
6b60c3ae3e98d0 Peng Fan       2023-04-03  300  							      &imx_fracn_gppll_integer);
bda7b7f396f94d Peng Fan       2022-10-28  301  	clks[IMX93_CLK_AUDIO_PLL] = imx_clk_fracn_gppll("audio_pll", "osc_24m", anatop_base + 0x1200,
24defbe194b650 Peng Fan       2022-02-28  302  							&imx_fracn_gppll);
bda7b7f396f94d Peng Fan       2022-10-28  303  	clks[IMX93_CLK_VIDEO_PLL] = imx_clk_fracn_gppll("video_pll", "osc_24m", anatop_base + 0x1400,
24defbe194b650 Peng Fan       2022-02-28  304  							&imx_fracn_gppll);
24defbe194b650 Peng Fan       2022-02-28  305  
24defbe194b650 Peng Fan       2022-02-28  306  	np = dev->of_node;
24defbe194b650 Peng Fan       2022-02-28  307  	base = devm_platform_ioremap_resource(pdev, 0);
bda7b7f396f94d Peng Fan       2022-10-28  308  	if (WARN_ON(IS_ERR(base))) {
e02ba11b457647 Zhanhao Hu     2023-06-01  309  		ret = PTR_ERR(base);
e02ba11b457647 Zhanhao Hu     2023-06-01  310  		goto unregister_hws;
bda7b7f396f94d Peng Fan       2022-10-28  311  	}
24defbe194b650 Peng Fan       2022-02-28  312  
24defbe194b650 Peng Fan       2022-02-28  313  	for (i = 0; i < ARRAY_SIZE(root_array); i++) {
24defbe194b650 Peng Fan       2022-02-28  314  		root = &root_array[i];
24defbe194b650 Peng Fan       2022-02-28  315  		clks[root->clk] = imx93_clk_composite_flags(root->name,
24defbe194b650 Peng Fan       2022-02-28  316  							    parent_names[root->sel],
2b66f02e2de174 Peng Fan       2022-08-30  317  							    4, base + root->off, 3,
24defbe194b650 Peng Fan       2022-02-28  318  							    root->flags);
24defbe194b650 Peng Fan       2022-02-28  319  	}
24defbe194b650 Peng Fan       2022-02-28  320  
24defbe194b650 Peng Fan       2022-02-28  321  	for (i = 0; i < ARRAY_SIZE(ccgr_array); i++) {
24defbe194b650 Peng Fan       2022-02-28  322  		ccgr = &ccgr_array[i];
d91012fa0058a7 Peng Fan       2022-08-30  323  		clks[ccgr->clk] = imx93_clk_gate(NULL, ccgr->name, ccgr->parent_name,
d91012fa0058a7 Peng Fan       2022-08-30  324  						 ccgr->flags, base + ccgr->off, 0, 1, 1, 3,
d91012fa0058a7 Peng Fan       2022-08-30  325  						 ccgr->shared_count);
24defbe194b650 Peng Fan       2022-02-28  326  	}
24defbe194b650 Peng Fan       2022-02-28  327  
6b60c3ae3e98d0 Peng Fan       2023-04-03  328  	clks[IMX93_CLK_A55_SEL] = imx_clk_hw_mux2("a55_sel", base + 0x4820, 0, 1, a55_core_sels,
6b60c3ae3e98d0 Peng Fan       2023-04-03  329  						  ARRAY_SIZE(a55_core_sels));
6b60c3ae3e98d0 Peng Fan       2023-04-03  330  	clks[IMX93_CLK_A55_CORE] = imx_clk_hw_cpu("a55_core", "a55_sel",
6b60c3ae3e98d0 Peng Fan       2023-04-03  331  						  clks[IMX93_CLK_A55_SEL]->clk,
6b60c3ae3e98d0 Peng Fan       2023-04-03  332  						  clks[IMX93_CLK_A55_SEL]->clk,
6b60c3ae3e98d0 Peng Fan       2023-04-03  333  						  clks[IMX93_CLK_ARM_PLL]->clk,
6b60c3ae3e98d0 Peng Fan       2023-04-03  334  						  clks[IMX93_CLK_A55_GATE]->clk);
6b60c3ae3e98d0 Peng Fan       2023-04-03  335  
24defbe194b650 Peng Fan       2022-02-28  336  	imx_check_clk_hws(clks, IMX93_CLK_END);
24defbe194b650 Peng Fan       2022-02-28  337  
24defbe194b650 Peng Fan       2022-02-28  338  	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
24defbe194b650 Peng Fan       2022-02-28  339  	if (ret < 0) {
24defbe194b650 Peng Fan       2022-02-28  340  		dev_err(dev, "failed to register clks for i.MX93\n");
24defbe194b650 Peng Fan       2022-02-28  341  		goto unregister_hws;
24defbe194b650 Peng Fan       2022-02-28  342  	}
24defbe194b650 Peng Fan       2022-02-28  343  
8cdaad718f1af2 Peng Fan       2023-01-04  344  	imx_register_uart_clocks();
8cdaad718f1af2 Peng Fan       2023-01-04  345  
24defbe194b650 Peng Fan       2022-02-28  346  	return 0;
24defbe194b650 Peng Fan       2022-02-28  347  
24defbe194b650 Peng Fan       2022-02-28  348  unregister_hws:
24defbe194b650 Peng Fan       2022-02-28  349  	imx_unregister_hw_clocks(clks, IMX93_CLK_END);
24defbe194b650 Peng Fan       2022-02-28  350  
24defbe194b650 Peng Fan       2022-02-28  351  	return ret;
24defbe194b650 Peng Fan       2022-02-28  352  }
24defbe194b650 Peng Fan       2022-02-28  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
