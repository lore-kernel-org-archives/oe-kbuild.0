Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3412CA7
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678127912; x=1709663912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCdVV9nyj7YJ+d0DCW9pVXY26A05+c3iYYV211fTNQc=;
  b=ky/dBGkQu/dv47i9gIAq0VR0LwFmLipaO+DF8WRDHOMcYU9vE8UewVVG
   T9YU/b2Y3DQm9WwPXPUZz2F/UKDgPTZ1Oc+BPEUa/+ivv2OtJylwmgx9m
   wEIIykFoIYiSBWzYaGADp6lbzL2ldkiN9VEiz6Ip2P0nFJ0zF530nZVcn
   36qhovoCR1DcsotTYjhqd6fSqT5mt2HiHBARWfoCL6rwFebrgFbUnnRYD
   HlnpRtNidtLeLDp6Oi54kQRSh7YibnEI/ZqvZDvtucbZTfI+OBE1NwRmb
   QJpdRXEAGW0KO9xy0Dc7oaGkMIixNJ1KbxhpXtVTzA6jiAnwKmrQdwQ3K
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315298349"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315298349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 10:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708757833"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="708757833"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2023 10:38:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZFjB-0000XP-21;
	Mon, 06 Mar 2023 18:38:29 +0000
Date: Tue, 7 Mar 2023 02:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/mediatek/clk-mt8173-apmixedsys.c:95
 clk_mt8173_apmixed_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202303070207.8wVd9MFI-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 4c02c9af3cb9449cd176300b288e8addb5083934 clk: mediatek: mt8173: Break down clock drivers and allow module build
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-m031-20230305 (https://download.01.org/0day-ci/archive/20230307/202303070207.8wVd9MFI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303070207.8wVd9MFI-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mt8173-apmixedsys.c:95 clk_mt8173_apmixed_probe() warn: passing zero to 'PTR_ERR'
drivers/clk/mediatek/clk-mt8173-apmixedsys.c:130 clk_mt8173_apmixed_probe() warn: 'base' from of_iomap() not released on lines: 99.

vim +/PTR_ERR +95 drivers/clk/mediatek/clk-mt8173-apmixedsys.c

4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   84  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   85  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   86  {
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   87  	struct device_node *node = pdev->dev.of_node;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   88  	struct clk_hw_onecell_data *clk_data;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   89  	void __iomem *base;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   90  	struct clk_hw *hw;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   91  	int r;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   92  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   93  	base = of_iomap(node, 0);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   94  	if (!base)
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  @95  		return PTR_ERR(base);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   96  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   97  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   98  	if (IS_ERR_OR_NULL(clk_data))
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20   99  		return -ENOMEM;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  100  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  101  	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  102  	if (r)
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  103  		goto free_clk_data;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  104  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  105  	hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  106  	if (IS_ERR(hw)) {
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  107  		r = PTR_ERR(hw);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  108  		dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  109  		goto unregister_plls;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  110  	}
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  111  	clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  112  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  113  	hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  114  					  base + REGOFF_HDMI_REF, 16, 3,
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  115  					  CLK_DIVIDER_POWER_OF_TWO, NULL);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  116  	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  117  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  118  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  119  	if (r)
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  120  		goto unregister_ref2usb;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  121  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  122  	return 0;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  123  
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  124  unregister_ref2usb:
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  125  	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  126  unregister_plls:
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  127  	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  128  free_clk_data:
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  129  	mtk_free_clk_data(clk_data);
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20 @130  	return r;
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  131  }
4c02c9af3cb944 AngeloGioacchino Del Regno 2023-01-20  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
