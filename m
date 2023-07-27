Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB617AC4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690493160; x=1722029160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mb8Y7cCQcBl7zk4Zg+ZS5SJRNqGiuMHY3S/7Cw0Vopk=;
  b=aXGrdNh8stn/IuA3q6Z4zCEIefHpU2ugC2UxjRKF+4akcaMxDrHyb8hL
   5HqmoxgXKiX+tRz0SsNsdUEO/+MzP0bwdPhYbqhWrz69Wq2z2vNyzT8oV
   5brHdi15bTBs/yC4wXGA1AUiGpzbVReHNcSjDfss+FKPt3PCIlVAmFYk8
   cuSOqGTxXkJBCtckqhiKp4HH6ePjXkM2U3+x57Pg0LvugNP6JtSE79b0W
   H8PitOl7R242vDwrsDIlQsw0XfI6J6OSlVU3ANk1pJLlAPuobbh1hxVHy
   R34rBQ9s8uqtDsroOPi3KceAsY7TcFfqtF50/UsFm0NdCvrmWcLFptSVn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432249067"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432249067"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 14:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817241354"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817241354"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 14:25:56 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP8UZ-0002c7-0P;
	Thu, 27 Jul 2023 21:25:52 +0000
Date: Fri, 28 Jul 2023 05:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-sun6i-p2wi.c:253 p2wi_probe() error:
 uninitialized symbol 'ret'.
Message-ID: <202307280529.CoPajtme-lkp@intel.com>
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
TO: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57012c57536f8814dec92e74197ee96c3498d24e
commit: 75ff8a340a81252b71611ca3a60c03cf86310955 i2c: sun6i-p2wi: Use devm_clk_get_enabled()
date:   5 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280529.CoPajtme-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280529.CoPajtme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280529.CoPajtme-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-sun6i-p2wi.c:253 p2wi_probe() error: uninitialized symbol 'ret'.

vim +/ret +253 drivers/i2c/busses/i2c-sun6i-p2wi.c

3e833490fae556 Boris Brezillon 2014-06-11  182  
3e833490fae556 Boris Brezillon 2014-06-11  183  static int p2wi_probe(struct platform_device *pdev)
3e833490fae556 Boris Brezillon 2014-06-11  184  {
3e833490fae556 Boris Brezillon 2014-06-11  185  	struct device *dev = &pdev->dev;
3e833490fae556 Boris Brezillon 2014-06-11  186  	struct device_node *np = dev->of_node;
3e833490fae556 Boris Brezillon 2014-06-11  187  	struct device_node *childnp;
3e833490fae556 Boris Brezillon 2014-06-11  188  	unsigned long parent_clk_freq;
90224e6468e15d Andy Shevchenko 2020-03-24  189  	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
3e833490fae556 Boris Brezillon 2014-06-11  190  	struct p2wi *p2wi;
3e833490fae556 Boris Brezillon 2014-06-11  191  	u32 slave_addr;
3e833490fae556 Boris Brezillon 2014-06-11  192  	int clk_div;
3e833490fae556 Boris Brezillon 2014-06-11  193  	int irq;
3e833490fae556 Boris Brezillon 2014-06-11  194  	int ret;
3e833490fae556 Boris Brezillon 2014-06-11  195  
3e833490fae556 Boris Brezillon 2014-06-11  196  	of_property_read_u32(np, "clock-frequency", &clk_freq);
3e833490fae556 Boris Brezillon 2014-06-11  197  	if (clk_freq > P2WI_MAX_FREQ) {
3e833490fae556 Boris Brezillon 2014-06-11  198  		dev_err(dev,
3e833490fae556 Boris Brezillon 2014-06-11  199  			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
3e833490fae556 Boris Brezillon 2014-06-11  200  			clk_freq);
3e833490fae556 Boris Brezillon 2014-06-11  201  		return -EINVAL;
3e833490fae556 Boris Brezillon 2014-06-11  202  	}
3e833490fae556 Boris Brezillon 2014-06-11  203  
3e833490fae556 Boris Brezillon 2014-06-11  204  	if (of_get_child_count(np) > 1) {
3e833490fae556 Boris Brezillon 2014-06-11  205  		dev_err(dev, "P2WI only supports one slave device\n");
3e833490fae556 Boris Brezillon 2014-06-11  206  		return -EINVAL;
3e833490fae556 Boris Brezillon 2014-06-11  207  	}
3e833490fae556 Boris Brezillon 2014-06-11  208  
3e833490fae556 Boris Brezillon 2014-06-11  209  	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
3e833490fae556 Boris Brezillon 2014-06-11  210  	if (!p2wi)
3e833490fae556 Boris Brezillon 2014-06-11  211  		return -ENOMEM;
3e833490fae556 Boris Brezillon 2014-06-11  212  
3e833490fae556 Boris Brezillon 2014-06-11  213  	p2wi->slave_addr = -1;
3e833490fae556 Boris Brezillon 2014-06-11  214  
3e833490fae556 Boris Brezillon 2014-06-11  215  	/*
3e833490fae556 Boris Brezillon 2014-06-11  216  	 * Authorize a p2wi node without any children to be able to use an
3e833490fae556 Boris Brezillon 2014-06-11  217  	 * i2c-dev from userpace.
3e833490fae556 Boris Brezillon 2014-06-11  218  	 * In this case the slave_addr is set to -1 and won't be checked when
3e833490fae556 Boris Brezillon 2014-06-11  219  	 * launching a P2WI transfer.
3e833490fae556 Boris Brezillon 2014-06-11  220  	 */
3e833490fae556 Boris Brezillon 2014-06-11  221  	childnp = of_get_next_available_child(np, NULL);
3e833490fae556 Boris Brezillon 2014-06-11  222  	if (childnp) {
3e833490fae556 Boris Brezillon 2014-06-11  223  		ret = of_property_read_u32(childnp, "reg", &slave_addr);
3e833490fae556 Boris Brezillon 2014-06-11  224  		if (ret) {
453a237ccffad8 Rob Herring     2017-07-18  225  			dev_err(dev, "invalid slave address on node %pOF\n",
453a237ccffad8 Rob Herring     2017-07-18  226  				childnp);
3e833490fae556 Boris Brezillon 2014-06-11  227  			return -EINVAL;
3e833490fae556 Boris Brezillon 2014-06-11  228  		}
3e833490fae556 Boris Brezillon 2014-06-11  229  
3e833490fae556 Boris Brezillon 2014-06-11  230  		p2wi->slave_addr = slave_addr;
3e833490fae556 Boris Brezillon 2014-06-11  231  	}
3e833490fae556 Boris Brezillon 2014-06-11  232  
e0442d76213981 Dejin Zheng     2020-04-09  233  	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
3e833490fae556 Boris Brezillon 2014-06-11  234  	if (IS_ERR(p2wi->regs))
3e833490fae556 Boris Brezillon 2014-06-11  235  		return PTR_ERR(p2wi->regs);
3e833490fae556 Boris Brezillon 2014-06-11  236  
e47a0ced40472c Len Baker       2021-08-17  237  	strscpy(p2wi->adapter.name, pdev->name, sizeof(p2wi->adapter.name));
3e833490fae556 Boris Brezillon 2014-06-11  238  	irq = platform_get_irq(pdev, 0);
e42688ed5cf593 Dejin Zheng     2020-04-16  239  	if (irq < 0)
3e833490fae556 Boris Brezillon 2014-06-11  240  		return irq;
3e833490fae556 Boris Brezillon 2014-06-11  241  
75ff8a340a8125 Andi Shyti      2023-06-12  242  	p2wi->clk = devm_clk_get_enabled(dev, NULL);
3e833490fae556 Boris Brezillon 2014-06-11  243  	if (IS_ERR(p2wi->clk)) {
3e833490fae556 Boris Brezillon 2014-06-11  244  		ret = PTR_ERR(p2wi->clk);
3e833490fae556 Boris Brezillon 2014-06-11  245  		dev_err(dev, "failed to enable clk: %d\n", ret);
3e833490fae556 Boris Brezillon 2014-06-11  246  		return ret;
3e833490fae556 Boris Brezillon 2014-06-11  247  	}
3e833490fae556 Boris Brezillon 2014-06-11  248  
3e833490fae556 Boris Brezillon 2014-06-11  249  	parent_clk_freq = clk_get_rate(p2wi->clk);
3e833490fae556 Boris Brezillon 2014-06-11  250  
96ae9eab03b5d5 Philipp Zabel   2017-07-19  251  	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
3e833490fae556 Boris Brezillon 2014-06-11  252  	if (IS_ERR(p2wi->rstc)) {
3e833490fae556 Boris Brezillon 2014-06-11 @253  		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
75ff8a340a8125 Andi Shyti      2023-06-12  254  		return PTR_ERR(p2wi->rstc);
3e833490fae556 Boris Brezillon 2014-06-11  255  	}
3e833490fae556 Boris Brezillon 2014-06-11  256  
3e833490fae556 Boris Brezillon 2014-06-11  257  	ret = reset_control_deassert(p2wi->rstc);
3e833490fae556 Boris Brezillon 2014-06-11  258  	if (ret) {
3e833490fae556 Boris Brezillon 2014-06-11  259  		dev_err(dev, "failed to deassert reset line: %d\n", ret);
75ff8a340a8125 Andi Shyti      2023-06-12  260  		return ret;
3e833490fae556 Boris Brezillon 2014-06-11  261  	}
3e833490fae556 Boris Brezillon 2014-06-11  262  
3e833490fae556 Boris Brezillon 2014-06-11  263  	init_completion(&p2wi->complete);
3e833490fae556 Boris Brezillon 2014-06-11  264  	p2wi->adapter.dev.parent = dev;
3e833490fae556 Boris Brezillon 2014-06-11  265  	p2wi->adapter.algo = &p2wi_algo;
3e833490fae556 Boris Brezillon 2014-06-11  266  	p2wi->adapter.owner = THIS_MODULE;
3e833490fae556 Boris Brezillon 2014-06-11  267  	p2wi->adapter.dev.of_node = pdev->dev.of_node;
3e833490fae556 Boris Brezillon 2014-06-11  268  	platform_set_drvdata(pdev, p2wi);
3e833490fae556 Boris Brezillon 2014-06-11  269  	i2c_set_adapdata(&p2wi->adapter, p2wi);
3e833490fae556 Boris Brezillon 2014-06-11  270  
3e833490fae556 Boris Brezillon 2014-06-11  271  	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
3e833490fae556 Boris Brezillon 2014-06-11  272  	if (ret) {
3e833490fae556 Boris Brezillon 2014-06-11  273  		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
3e833490fae556 Boris Brezillon 2014-06-11  274  			irq, ret);
3e833490fae556 Boris Brezillon 2014-06-11  275  		goto err_reset_assert;
3e833490fae556 Boris Brezillon 2014-06-11  276  	}
3e833490fae556 Boris Brezillon 2014-06-11  277  
3e833490fae556 Boris Brezillon 2014-06-11  278  	writel(P2WI_CTRL_SOFT_RST, p2wi->regs + P2WI_CTRL);
3e833490fae556 Boris Brezillon 2014-06-11  279  
3e833490fae556 Boris Brezillon 2014-06-11  280  	clk_div = parent_clk_freq / clk_freq;
3e833490fae556 Boris Brezillon 2014-06-11  281  	if (!clk_div) {
3e833490fae556 Boris Brezillon 2014-06-11  282  		dev_warn(dev,
3e833490fae556 Boris Brezillon 2014-06-11  283  			 "clock-frequency is too high, setting it to %lu Hz\n",
3e833490fae556 Boris Brezillon 2014-06-11  284  			 parent_clk_freq);
3e833490fae556 Boris Brezillon 2014-06-11  285  		clk_div = 1;
3e833490fae556 Boris Brezillon 2014-06-11  286  	} else if (clk_div > P2WI_CCR_MAX_CLK_DIV) {
3e833490fae556 Boris Brezillon 2014-06-11  287  		dev_warn(dev,
3e833490fae556 Boris Brezillon 2014-06-11  288  			 "clock-frequency is too low, setting it to %lu Hz\n",
3e833490fae556 Boris Brezillon 2014-06-11  289  			 parent_clk_freq / P2WI_CCR_MAX_CLK_DIV);
3e833490fae556 Boris Brezillon 2014-06-11  290  		clk_div = P2WI_CCR_MAX_CLK_DIV;
3e833490fae556 Boris Brezillon 2014-06-11  291  	}
3e833490fae556 Boris Brezillon 2014-06-11  292  
3e833490fae556 Boris Brezillon 2014-06-11  293  	writel(P2WI_CCR_SDA_OUT_DELAY(1) | P2WI_CCR_CLK_DIV(clk_div),
3e833490fae556 Boris Brezillon 2014-06-11  294  	       p2wi->regs + P2WI_CCR);
3e833490fae556 Boris Brezillon 2014-06-11  295  
3e833490fae556 Boris Brezillon 2014-06-11  296  	ret = i2c_add_adapter(&p2wi->adapter);
3e833490fae556 Boris Brezillon 2014-06-11  297  	if (!ret)
3e833490fae556 Boris Brezillon 2014-06-11  298  		return 0;
3e833490fae556 Boris Brezillon 2014-06-11  299  
3e833490fae556 Boris Brezillon 2014-06-11  300  err_reset_assert:
3e833490fae556 Boris Brezillon 2014-06-11  301  	reset_control_assert(p2wi->rstc);
3e833490fae556 Boris Brezillon 2014-06-11  302  
3e833490fae556 Boris Brezillon 2014-06-11  303  	return ret;
3e833490fae556 Boris Brezillon 2014-06-11  304  }
3e833490fae556 Boris Brezillon 2014-06-11  305  

:::::: The code at line 253 was first introduced by commit
:::::: 3e833490fae55633f6adc03a5e6172d47c01f3e4 i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support

:::::: TO: Boris BREZILLON <boris.brezillon@free-electrons.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
