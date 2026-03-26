Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF633ADA9
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506081; cv=none; b=JwFmqW8U2w1qNhfK11OmEu4QGrvtgdpQtm8LuH97Qr8zSeZaPbyD8g/DTsfZ0Rvs/SadiWhcyj6j1sAwZfgKGGtM8OPTEOCxp76i4Gf0ojh5OCNYrb81Xurt26HzSPz+I5eMHqu3LS+TnJiMHGjAeGSXpi3BdbwjcAtAh2J1vho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506081; c=relaxed/simple;
	bh=2V9QorUKNQaJlbTvagTkywVGsQpvvYrUbHcRKa+uvMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dP2YoEm9kDZGBKTUZc19a5T81GLIoYySKpJtZNb77nAmsP4Cgeced9XJXAsK1U+rAOhQVLZgseRjZJfzBw0MF1U+KgepGL+ekHfqu85RmXC3pHmfwAic/Q1AxA00nlziZCz/fMbFSn2huTLKNQwym8KVt590A9nu39bncuWEZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGJ6KQp2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGJ6KQp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774506080; x=1806042080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2V9QorUKNQaJlbTvagTkywVGsQpvvYrUbHcRKa+uvMk=;
  b=lGJ6KQp2ajdabGpIoayTikqJd+ddvV86f8lLNxyetJgiY6GLJYwYN+5g
   jF7VMzbz6tgzpSLrWmgUtFf1bhcmiDUPE8Eimn7F11Eg9LWVwqtlVlTVv
   owfkaSlK1eav9g1GlGwjUITcdF0c4Aw8+WQKjC5ivCflc6haAnQQ61bih
   YrwDzykbg3Q+Ib9Y3emQLupgUXTY1Irq9lZ8tRC6uFc71Olum6t7g8irq
   qE4MIcb4Klu5VIhxpd7xwH5bLTS16oqhgXX8slbBa3VFJKxBMLUY/DUHP
   iBeLjmm8aWpkFiLRAG5QeqeVgE5c6vswX8HHU3CpzRMl9vInXxqvnqZl8
   Q==;
X-CSE-ConnectionGUID: 8AGhkbbrShSZlGMsycJqfA==
X-CSE-MsgGUID: AQNNZ09WQQu+3yg3swpkuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75439393"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75439393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 23:21:20 -0700
X-CSE-ConnectionGUID: n+M+erpuRt6/7pq2DP5W+A==
X-CSE-MsgGUID: fz16SwhDSQmkTskRw575kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229366595"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 23:21:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5e5j-000000008Kp-3EB5;
	Thu, 26 Mar 2026 06:21:15 +0000
Date: Thu, 26 Mar 2026 14:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <202603261444.jANdMbNC-lkp@intel.com>
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
In-Reply-To: <20260325071951.544031-3-wenst@chromium.org>
References: <20260325071951.544031-3-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Frank Binns <frank.binns@imgtec.com>
TO: Matt Coster <matt.coster@imgtec.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-mediatek@lists.infradead.org
CC: dri-devel@lists.freedesktop.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next drm-misc/drm-misc-next linus/master v7.0-rc5 next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20260325-202618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260325071951.544031-3-wenst%40chromium.org
patch subject: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: csky-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261444.jANdMbNC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261444.jANdMbNC-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mt8173-mfgtop.c:163 clk_mt8173_mfgtop_probe() warn: missing error code 'ret'

vim +/ret +163 drivers/clk/mediatek/clk-mt8173-mfgtop.c

edc2074329e271 Chen-Yu Tsai 2026-03-25  112  
edc2074329e271 Chen-Yu Tsai 2026-03-25  113  static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
edc2074329e271 Chen-Yu Tsai 2026-03-25  114  {
edc2074329e271 Chen-Yu Tsai 2026-03-25  115  	struct device *dev = &pdev->dev;
edc2074329e271 Chen-Yu Tsai 2026-03-25  116  	struct device_node *node = dev->of_node;
edc2074329e271 Chen-Yu Tsai 2026-03-25  117  	struct mt8173_mfgtop_data *data;
edc2074329e271 Chen-Yu Tsai 2026-03-25  118  	int ret;
edc2074329e271 Chen-Yu Tsai 2026-03-25  119  
edc2074329e271 Chen-Yu Tsai 2026-03-25  120  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
edc2074329e271 Chen-Yu Tsai 2026-03-25  121  	if (!data)
edc2074329e271 Chen-Yu Tsai 2026-03-25  122  		return -ENOMEM;
edc2074329e271 Chen-Yu Tsai 2026-03-25  123  
edc2074329e271 Chen-Yu Tsai 2026-03-25  124  	platform_set_drvdata(pdev, data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  125  
edc2074329e271 Chen-Yu Tsai 2026-03-25  126  	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
edc2074329e271 Chen-Yu Tsai 2026-03-25  127  	if (!data->clk_data)
edc2074329e271 Chen-Yu Tsai 2026-03-25  128  		return -ENOMEM;
edc2074329e271 Chen-Yu Tsai 2026-03-25  129  
edc2074329e271 Chen-Yu Tsai 2026-03-25  130  	/* MTK clock gates also uses regmap */
edc2074329e271 Chen-Yu Tsai 2026-03-25  131  	data->regmap = device_node_to_regmap(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  132  	if (IS_ERR(data->regmap))
edc2074329e271 Chen-Yu Tsai 2026-03-25  133  		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  134  
edc2074329e271 Chen-Yu Tsai 2026-03-25  135  	data->child_pd.np = node;
edc2074329e271 Chen-Yu Tsai 2026-03-25  136  	data->child_pd.args_count = 0;
edc2074329e271 Chen-Yu Tsai 2026-03-25  137  	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
edc2074329e271 Chen-Yu Tsai 2026-03-25  138  					 &data->parent_pd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  139  	if (ret)
edc2074329e271 Chen-Yu Tsai 2026-03-25  140  		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  141  
edc2074329e271 Chen-Yu Tsai 2026-03-25  142  	devm_pm_runtime_enable(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  143  	/*
edc2074329e271 Chen-Yu Tsai 2026-03-25  144  	 * Do a pm_runtime_resume_and_get() to workaround a possible
edc2074329e271 Chen-Yu Tsai 2026-03-25  145  	 * deadlock between clk_register() and the genpd framework.
edc2074329e271 Chen-Yu Tsai 2026-03-25  146  	 */
edc2074329e271 Chen-Yu Tsai 2026-03-25  147  	ret = pm_runtime_resume_and_get(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  148  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  149  		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  150  		goto put_of_node;
edc2074329e271 Chen-Yu Tsai 2026-03-25  151  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  152  
edc2074329e271 Chen-Yu Tsai 2026-03-25  153  	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
edc2074329e271 Chen-Yu Tsai 2026-03-25  154  				     data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  155  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  156  		dev_err_probe(dev, ret, "Failed to register clock gates\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  157  		goto put_pm_runtime;
edc2074329e271 Chen-Yu Tsai 2026-03-25  158  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  159  
edc2074329e271 Chen-Yu Tsai 2026-03-25  160  	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
edc2074329e271 Chen-Yu Tsai 2026-03-25  161  	if (IS_ERR(data->clk_26m)) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  162  		dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25 @163  		goto unregister_clks;
edc2074329e271 Chen-Yu Tsai 2026-03-25  164  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  165  
edc2074329e271 Chen-Yu Tsai 2026-03-25  166  	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  167  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  168  		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  169  		goto put_26m_clk;
edc2074329e271 Chen-Yu Tsai 2026-03-25  170  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  171  
edc2074329e271 Chen-Yu Tsai 2026-03-25  172  	data->genpd.name = "mfg-top";
edc2074329e271 Chen-Yu Tsai 2026-03-25  173  	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
edc2074329e271 Chen-Yu Tsai 2026-03-25  174  	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
edc2074329e271 Chen-Yu Tsai 2026-03-25  175  	ret = pm_genpd_init(&data->genpd, NULL, true);
edc2074329e271 Chen-Yu Tsai 2026-03-25  176  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  177  		dev_err_probe(dev, ret, "Failed to add power domain\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  178  		goto del_clk_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  179  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  180  
edc2074329e271 Chen-Yu Tsai 2026-03-25  181  	ret = of_genpd_add_provider_simple(node, &data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  182  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  183  		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  184  		goto remove_pd;
edc2074329e271 Chen-Yu Tsai 2026-03-25  185  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  186  
edc2074329e271 Chen-Yu Tsai 2026-03-25  187  	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  188  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  189  		dev_err_probe(dev, ret, "Failed to link PM domains\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  190  		goto del_pd_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  191  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  192  
edc2074329e271 Chen-Yu Tsai 2026-03-25  193  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  194  	return 0;
edc2074329e271 Chen-Yu Tsai 2026-03-25  195  
edc2074329e271 Chen-Yu Tsai 2026-03-25  196  del_pd_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  197  	of_genpd_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  198  remove_pd:
edc2074329e271 Chen-Yu Tsai 2026-03-25  199  	pm_genpd_remove(&data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  200  del_clk_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  201  	of_clk_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  202  put_26m_clk:
edc2074329e271 Chen-Yu Tsai 2026-03-25  203  	clk_put(data->clk_26m);
edc2074329e271 Chen-Yu Tsai 2026-03-25  204  unregister_clks:
edc2074329e271 Chen-Yu Tsai 2026-03-25  205  	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  206  put_pm_runtime:
edc2074329e271 Chen-Yu Tsai 2026-03-25  207  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  208  put_of_node:
edc2074329e271 Chen-Yu Tsai 2026-03-25  209  	of_node_put(data->parent_pd.np);
edc2074329e271 Chen-Yu Tsai 2026-03-25  210  	return ret;
edc2074329e271 Chen-Yu Tsai 2026-03-25  211  }
edc2074329e271 Chen-Yu Tsai 2026-03-25  212  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
