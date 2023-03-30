Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77A7C2E2
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 07:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680161981; x=1711697981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R87z6Iyt6KFKlEWS6NYOm6brWXUfYsioDabws1YN3BU=;
  b=V9OUledOVsr4UhIZb9eFcD4IZB2mCu/71afo1MQ2Yy32gLyxxkge/ldR
   UzxXOx/XBvlXBq21fQFNdLuHssgXU/xYZg86j7v1fMA7rtTV34Fo81Wfe
   HH9ReeGodfRWOIHH45CycWBdF63pFllz5qQATE5nop/MrObHfg/59n0IF
   TTK1v785x3fSM74GAEabsbbRAn/2A3rDQzbXvG5Dy71qoAJ7+deHoUCQU
   hKfstTIwDIZn+UFSzWKFGxG315oskw2rgI9igTHqSpS3kM0Taq/jN4e/O
   bYe/sXTOXAv9ECNIIDEkffqlit9cNCK8PeeapWnuuNXDxV/DqnHro+Ee7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320745709"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="320745709"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 00:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014339991"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="1014339991"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 00:39:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phmsl-000KYC-0R;
	Thu, 30 Mar 2023 07:39:39 +0000
Date: Thu, 30 Mar 2023 15:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cpufreq/mediatek-cpufreq.c:405 mtk_cpu_dvfs_info_init()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202303301536.QrtLXIcz-lkp@intel.com>
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
TO: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Kevin Hilman <khilman@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: 0daa47325baee6bb1412498462fd0a0477c32cc6 cpufreq: mediatek: Link CCI device to CPU
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301536.QrtLXIcz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303301536.QrtLXIcz-lkp@intel.com/

New smatch warnings:
drivers/cpufreq/mediatek-cpufreq.c:405 mtk_cpu_dvfs_info_init() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/cpufreq/mediatek-cpufreq.c:479 mtk_cpu_dvfs_info_init() warn: missing error code 'ret'

vim +/PTR_ERR +405 drivers/cpufreq/mediatek-cpufreq.c

0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  386  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  387  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  388  {
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  389  	struct device *cpu_dev;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  390  	struct dev_pm_opp *opp;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  391  	unsigned long rate;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  392  	int ret;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  393  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  394  	cpu_dev = get_cpu_device(cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  395  	if (!cpu_dev) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  396  		dev_err(cpu_dev, "failed to get cpu%d device\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  397  		return -ENODEV;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  398  	}
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  399  	info->cpu_dev = cpu_dev;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  400  
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  401  	info->ccifreq_bound = false;
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  402  	if (info->soc_data->ccifreq_supported) {
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  403  		info->cci_dev = of_get_cci(info->cpu_dev);
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  404  		if (IS_ERR_OR_NULL(info->cci_dev)) {
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 @405  			ret = PTR_ERR(info->cci_dev);
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  406  			dev_err(cpu_dev, "cpu%d: failed to get cci device\n", cpu);
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  407  			return -ENODEV;
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  408  		}
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  409  	}
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  410  
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  411  	info->cpu_clk = clk_get(cpu_dev, "cpu");
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  412  	if (IS_ERR(info->cpu_clk)) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  413  		ret = PTR_ERR(info->cpu_clk);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  414  		return dev_err_probe(cpu_dev, ret,
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  415  				     "cpu%d: failed to get cpu clk\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  416  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  417  
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  418  	info->inter_clk = clk_get(cpu_dev, "intermediate");
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  419  	if (IS_ERR(info->inter_clk)) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  420  		ret = PTR_ERR(info->inter_clk);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  421  		dev_err_probe(cpu_dev, ret,
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  422  			      "cpu%d: failed to get intermediate clk\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  423  		goto out_free_resources;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  424  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  425  
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  426  	info->proc_reg = regulator_get_optional(cpu_dev, "proc");
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  427  	if (IS_ERR(info->proc_reg)) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  428  		ret = PTR_ERR(info->proc_reg);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  429  		dev_err_probe(cpu_dev, ret,
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  430  			      "cpu%d: failed to get proc regulator\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  431  		goto out_free_resources;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  432  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  433  
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  434  	ret = regulator_enable(info->proc_reg);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  435  	if (ret) {
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  436  		dev_warn(cpu_dev, "cpu%d: failed to enable vproc\n", cpu);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  437  		goto out_free_resources;
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  438  	}
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  439  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  440  	/* Both presence and absence of sram regulator are valid cases. */
ffa7bdf7f344477 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22  441  	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  442  	if (IS_ERR(info->sram_reg))
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  443  		info->sram_reg = NULL;
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  444  	else {
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  445  		ret = regulator_enable(info->sram_reg);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  446  		if (ret) {
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  447  			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  448  			goto out_free_resources;
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  449  		}
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  450  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  451  
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  452  	/* Get OPP-sharing information from "operating-points-v2" bindings */
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  453  	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  454  	if (ret) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  455  		dev_err(cpu_dev,
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  456  			"cpu%d: failed to get OPP-sharing information\n", cpu);
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  457  		goto out_free_resources;
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  458  	}
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  459  
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  460  	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  461  	if (ret) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  462  		dev_warn(cpu_dev, "cpu%d: no OPP table\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  463  		goto out_free_resources;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  464  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  465  
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  466  	ret = clk_prepare_enable(info->cpu_clk);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  467  	if (ret)
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  468  		goto out_free_opp_table;
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  469  
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  470  	ret = clk_prepare_enable(info->inter_clk);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  471  	if (ret)
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  472  		goto out_disable_mux_clock;
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  473  
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  474  	if (info->soc_data->ccifreq_supported) {
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  475  		info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  476  		if (info->vproc_on_boot < 0) {
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  477  			dev_err(info->cpu_dev,
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  478  				"invalid Vproc value: %d\n", info->vproc_on_boot);
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  479  			goto out_disable_inter_clock;
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  480  		}
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  481  	}
0daa47325baee6b drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  482  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  483  	/* Search a safe voltage for intermediate frequency. */
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  484  	rate = clk_get_rate(info->inter_clk);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  485  	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  486  	if (IS_ERR(opp)) {
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  487  		dev_err(cpu_dev, "cpu%d: failed to get intermediate opp\n", cpu);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  488  		ret = PTR_ERR(opp);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  489  		goto out_disable_inter_clock;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  490  	}
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  491  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
8a31d9d94297b1e drivers/cpufreq/mt8173-cpufreq.c   Viresh Kumar  2017-01-23  492  	dev_pm_opp_put(opp);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  493  
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  494  	mutex_init(&info->reg_lock);
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  495  	info->current_freq = clk_get_rate(info->cpu_clk);
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  496  
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  497  	info->opp_cpu = cpu;
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  498  	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  499  	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  500  	if (ret) {
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  501  		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  502  		goto out_disable_inter_clock;
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  503  	}
c210063b40acab7 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  504  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  505  	/*
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  506  	 * If SRAM regulator is present, software "voltage tracking" is needed
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  507  	 * for this CPU power domain.
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  508  	 */
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  509  	info->need_voltage_tracking = (info->sram_reg != NULL);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  510  
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  511  	/*
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  512  	 * We assume min voltage is 0 and tracking target voltage using
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  513  	 * min_volt_shift for each iteration.
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  514  	 * The vtrack_max is 3 times of expeted iteration count.
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  515  	 */
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  516  	info->vtrack_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  517  						info->soc_data->proc_max_volt),
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  518  					    info->soc_data->min_volt_shift);
6a17b3876bc8303 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05  519  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  520  	return 0;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  521  
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  522  out_disable_inter_clock:
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  523  	clk_disable_unprepare(info->inter_clk);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  524  
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  525  out_disable_mux_clock:
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  526  	clk_disable_unprepare(info->cpu_clk);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  527  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  528  out_free_opp_table:
a889331d759453f drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-12-27  529  	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  530  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  531  out_free_resources:
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  532  	if (regulator_is_enabled(info->proc_reg))
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  533  		regulator_disable(info->proc_reg);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  534  	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  535  		regulator_disable(info->sram_reg);
4b9ceb757bbb4e8 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  536  
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  537  	if (!IS_ERR(info->proc_reg))
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  538  		regulator_put(info->proc_reg);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  539  	if (!IS_ERR(info->sram_reg))
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  540  		regulator_put(info->sram_reg);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  541  	if (!IS_ERR(info->cpu_clk))
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  542  		clk_put(info->cpu_clk);
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  543  	if (!IS_ERR(info->inter_clk))
396dee972a1c616 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-08  544  		clk_put(info->inter_clk);
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  545  
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  546  	return ret;
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  547  }
1453863fb02a189 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
