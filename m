Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BC17EF
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Apr 2023 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682061433; x=1713597433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20bdSr+Hu9jtHkaYyZouujSb7GormZQpW8Hi5BSc0HA=;
  b=nQ3lPuELTNhgBagdKillwNHHnLfb6y2wtj6xCRKXpm8n6xRdgO1GZ83k
   UHoICzjAlyMvdWrGYYEzpE7S2a4yqwk6WEfJZvjJlKuF/gZKejBtUoAe1
   5XDLhY4NPiIZzydt0Ox4xFUT3Q7yb+IKzbt8W5JKwa8cTKaF3LlDQJYJv
   Q0y0/1aUxumQ54GX7SIgMptuGzdGWgXxWNWBA9mc4LmYdMdJdRhvqg/rw
   EgbzGtoCWFKetFLB7CHjxLb91WsWuw4kVcAZsZiZWAT8AE8QGZqFLYws1
   ghQgJzmnZj+/t2Emt7lc4PkodA+RAsVZoNQ6BRJ67TNEWnq9OGXh/uvh0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325535467"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325535467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 00:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724713820"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="724713820"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Apr 2023 00:17:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppl10-000gPp-0c;
	Fri, 21 Apr 2023 07:17:06 +0000
Date: Fri, 21 Apr 2023 15:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <202304211427.AoG9GhQ1-lkp@intel.com>
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
In-Reply-To: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
References: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
TO: devicetree@vger.kernel.org
CC: git@amd.com
CC: linux-clk@vger.kernel.org
CC: robh+dt@kernel.org
CC: sboyd@kernel.org
CC: mturquette@baylibre.com
CC: krzysztof.kozlowski+dt@linaro.org
CC: michal.simek@xilinx.com

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20230420]
[cannot apply to xilinx-xlnx/master robh/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230418102855.6791-3-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230421/202304211427.AoG9GhQ1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304211427.AoG9GhQ1-lkp@intel.com/

New smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1075 clk_wzrd_probe() warn: 'clk_wzrd->axi_clk' from clk_prepare_enable() not released on lines: 897.

Old smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:264 clk_wzrd_dynamic_reconfig() error: uninitialized symbol 'value'.

vim +1075 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   831  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   832  static int clk_wzrd_probe(struct platform_device *pdev)
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   833  {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   834  	const char *clkout_name, *clk_name, *clk_mul_name;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   835  	u32 regl, regh, edge, regld, reghd, edged, div;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   836  	const struct versal_clk_data *data;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   837  	const struct of_device_id *match;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   838  	int i, ret;
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   839  	u32 reg, reg_f, mult;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   840  	unsigned long rate;
87a40bfb09f213 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   841  	void __iomem *ctrl_reg;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   842  	struct clk_wzrd *clk_wzrd;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   843  	struct device_node *np = pdev->dev.of_node;
92a7590427d666 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   844  	int nr_outputs;
87a40bfb09f213 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   845  	unsigned long flags = 0;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   846  	bool is_versal = 0;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   847  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   848  	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   849  	if (!clk_wzrd)
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   850  		return -ENOMEM;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   851  	platform_set_drvdata(pdev, clk_wzrd);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   852  
f595f03bfdfc3c drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c YueHaibing         2019-10-09   853  	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   854  	if (IS_ERR(clk_wzrd->base))
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   855  		return PTR_ERR(clk_wzrd->base);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   856  
17aa33ff569980 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   857  	ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   858  	if (!ret) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   859  		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   860  			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   861  				 clk_wzrd->speed_grade);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   862  			clk_wzrd->speed_grade = 0;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   863  		}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   864  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   865  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   866  	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   867  	if (IS_ERR(clk_wzrd->clk_in1))
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   868  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   869  				     "clk_in1 not found\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   870  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   871  	clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   872  	if (IS_ERR(clk_wzrd->axi_clk))
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   873  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
fd30ac84f3022e drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Yang Yingliang     2022-09-13   874  				     "s_axi_aclk not found\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   875  	ret = clk_prepare_enable(clk_wzrd->axi_clk);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   876  	if (ret) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   877  		dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   878  		return ret;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   879  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   880  	rate = clk_get_rate(clk_wzrd->axi_clk);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   881  	if (rate > WZRD_ACLK_MAX_FREQ) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   882  		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   883  			rate);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   884  		ret = -EINVAL;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   885  		goto err_disable_clk;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   886  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   887  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   888  	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   889  	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   890  		ret = -EINVAL;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   891  		goto err_disable_clk;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   892  	}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   893  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   894  	match = of_match_node(clk_wzrd_ids, np);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   895  	if (!match) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   896  		dev_err(&pdev->dev, "of_match_node failed\n");
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   897  		return -ENODEV;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   898  	}
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   899  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   900  	data = match->data;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   901  	if (data)
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   902  		is_versal = data->is_versal;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   903  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   904  	clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   905  	if (nr_outputs == 1) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   906  		clk_wzrd->clkout[0] = clk_wzrd_register_divider
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   907  				(&pdev->dev, clkout_name,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   908  				__clk_get_name(clk_wzrd->clk_in1), 0,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   909  				clk_wzrd->base, WZRD_CLK_CFG_REG(is_versal, 3),
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   910  				WZRD_CLKOUT_DIVIDE_SHIFT,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   911  				WZRD_CLKOUT_DIVIDE_WIDTH,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   912  				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   913  				DIV_ALL, is_versal, &clkwzrd_lock);
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   914  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   915  		goto out;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   916  	}
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   917  	if (is_versal) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   918  		/* register multiplier */
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   919  		edge = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   920  				BIT(8));
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   921  		regl = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 1)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   922  			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   923  		regh = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 1)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   924  			     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   925  		mult = regl + regh + edge;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   926  		if (!mult)
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   927  			mult = 1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   928  		mult = mult * WZRD_FRAC_GRADIENT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   929  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   930  		regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 51)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   931  			     WZRD_CLKFBOUT_FRAC_EN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   932  		if (regl) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   933  			regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 48)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   934  				WZRD_VERSAL_FRAC_MASK;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   935  			mult = mult + regl;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   936  		}
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   937  	} else {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   938  		reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0));
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   939  		reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   940  		reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   941  
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   942  		reg = reg & WZRD_CLKFBOUT_MULT_MASK;
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   943  		reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   944  		mult = (reg * 1000) + reg_f;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   945  	}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   946  	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   947  	if (!clk_name) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   948  		ret = -ENOMEM;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   949  		goto err_disable_clk;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   950  	}
d5213236151ba6 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ioannis Valasakis  2018-10-04   951  	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
d5213236151ba6 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ioannis Valasakis  2018-10-04   952  			(&pdev->dev, clk_name,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   953  			 __clk_get_name(clk_wzrd->clk_in1),
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   954  			0, mult, 1000);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   955  	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   956  		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   957  		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   958  		goto err_disable_clk;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   959  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   960  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   961  	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
5f18611038f9c9 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Devendra Naga      2014-11-29   962  	if (!clk_name) {
5f18611038f9c9 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Devendra Naga      2014-11-29   963  		ret = -ENOMEM;
5f18611038f9c9 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Devendra Naga      2014-11-29   964  		goto err_rm_int_clk;
5f18611038f9c9 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Devendra Naga      2014-11-29   965  	}
5f18611038f9c9 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Devendra Naga      2014-11-29   966  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   967  	if (is_versal) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   968  		edged = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 20)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   969  			     BIT(10));
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   970  		regld = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 21)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   971  			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   972  		reghd = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 21)) &
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   973  		     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   974  		div = (regld  + reghd + edged);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   975  		if (!div)
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   976  			div = 1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   977  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   978  		clk_mul_name = __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   979  		clk_wzrd->clks_internal[wzrd_clk_mul_div] =
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   980  			clk_register_fixed_factor(&pdev->dev, clk_name,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   981  						  clk_mul_name, 0, 1, div);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   982  	} else {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   983  		ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0);
87a40bfb09f213 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   984  		clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
d5213236151ba6 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ioannis Valasakis  2018-10-04   985  			(&pdev->dev, clk_name,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   986  			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
87a40bfb09f213 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   987  			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
87a40bfb09f213 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   988  			CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18   989  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   990  	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   991  		dev_err(&pdev->dev, "unable to register divider clock\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   992  		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   993  		goto err_rm_int_clk;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   994  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   995  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02   996  	/* register div per output */
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24   997  	for (i = nr_outputs - 1; i >= 0 ; i--) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   998  		clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27   999  					     "%s_out%d", dev_name(&pdev->dev), i);
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1000  		if (!clkout_name) {
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1001  			ret = -ENOMEM;
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1002  			goto err_rm_int_clk;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1003  		}
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1004  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1005  		if (is_versal) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1006  			clk_wzrd->clkout[i] = clk_wzrd_register_divider
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1007  						(&pdev->dev,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1008  						 clkout_name, clk_name, 0,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1009  						 clk_wzrd->base,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1010  						 (WZRD_CLK_CFG_REG(is_versal, 3) + i * 8),
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1011  						 WZRD_CLKOUT_DIVIDE_SHIFT,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1012  						 WZRD_CLKOUT_DIVIDE_WIDTH,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1013  						 CLK_DIVIDER_ONE_BASED |
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1014  						 CLK_DIVIDER_ALLOW_ZERO,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1015  						 DIV_O, true, &clkwzrd_lock);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1016  		} else {
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1017  			if (!i)
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1018  				clk_wzrd->clkout[i] = clk_wzrd_register_divf
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1019  					(&pdev->dev, clkout_name, clk_name, flags, clk_wzrd->base,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1020  					(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1021  					WZRD_CLKOUT_DIVIDE_SHIFT,
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1022  					WZRD_CLKOUT_DIVIDE_WIDTH,
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1023  					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  1024  					DIV_O, &clkwzrd_lock);
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1025  			else
91d695d71841ab drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1026  				clk_wzrd->clkout[i] = clk_wzrd_register_divider
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1027  					(&pdev->dev, clkout_name, clk_name, 0, clk_wzrd->base,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1028  					(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1029  					WZRD_CLKOUT_DIVIDE_SHIFT,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1030  					WZRD_CLKOUT_DIVIDE_WIDTH,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1031  					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1032  					DIV_O, false,  &clkwzrd_lock);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  1033  		}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1034  		if (IS_ERR(clk_wzrd->clkout[i])) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1035  			int j;
e66f7a27521119 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Athira Sharikkal   2014-11-30  1036  
a0d1a3864cad08 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  1037  			for (j = i + 1; j < nr_outputs; j++)
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1038  				clk_unregister(clk_wzrd->clkout[j]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1039  			dev_err(&pdev->dev,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1040  				"unable to register divider clock\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1041  			ret = PTR_ERR(clk_wzrd->clkout[i]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1042  			goto err_rm_int_clks;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1043  		}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1044  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1045  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  1046  out:
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1047  	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1048  	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1049  	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1050  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1051  	if (clk_wzrd->speed_grade) {
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1052  		clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1053  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1054  		ret = clk_notifier_register(clk_wzrd->clk_in1,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1055  					    &clk_wzrd->nb);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1056  		if (ret)
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1057  			dev_warn(&pdev->dev,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1058  				 "unable to register clock notifier\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1059  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1060  		ret = clk_notifier_register(clk_wzrd->axi_clk, &clk_wzrd->nb);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1061  		if (ret)
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1062  			dev_warn(&pdev->dev,
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1063  				 "unable to register clock notifier\n");
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1064  	}
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1065  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1066  	return 0;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1067  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1068  err_rm_int_clks:
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1069  	clk_unregister(clk_wzrd->clks_internal[1]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1070  err_rm_int_clk:
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1071  	clk_unregister(clk_wzrd->clks_internal[0]);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1072  err_disable_clk:
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1073  	clk_disable_unprepare(clk_wzrd->axi_clk);
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1074  
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02 @1075  	return ret;
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1076  }
812283cd546376 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Soren Brinkmann    2014-10-02  1077  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
