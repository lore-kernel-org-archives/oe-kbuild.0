Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1003AED9
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 02:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675391896; x=1706927896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKeKKzScGJCZT/FJQ05bSy1OJ/VYmkc/F4gZMRNEBBo=;
  b=ilwP0YqjXxMdNheZZCzZfvtX2/rxbLhWvRoUCL6MUvB/G+FViKjVK64P
   deJEDm9P5UnaybmcPSMxCkV4E5SPM6/87/E1I9jUkBEDvEzU/I4VQx1DS
   lAIaKsgrbh7k0oYWTvKCQ5DFXx5mRMSNI39L8bw5HcqzV/z+4sSGj1cmk
   Dnc7Y2WR7eJZzcIDDDLi779HYQHgBbafoIZ/ZDCV2Fc29AG2HK+dMQG0j
   RuAQCusMn6GW2raSTwyArpipnGb0dI93QbZo+EjOoaeaA+qkGU7oU90aB
   sSV7fcItBeEzDdZ5lwM0ZlFsErl7TzXxWnAcnxLcxy+VI5CCf91jgAoQv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316638920"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="316638920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 18:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="697913418"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="697913418"
Received: from lkp-server01.sh.intel.com (HELO 0572c01a5cf9) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Feb 2023 18:38:14 -0800
Received: from kbuild by 0572c01a5cf9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNlxt-00002m-1J;
	Fri, 03 Feb 2023 02:38:13 +0000
Date: Fri, 3 Feb 2023 10:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 10/23] clk: mediatek: mt8173: Break down clock drivers
 and allow module build
Message-ID: <202302031042.0Jaf7m4t-lkp@intel.com>
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
In-Reply-To: <20230120092053.182923-11-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-11-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.2-rc6]
[cannot apply to next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/clk-mediatek-mt8192-Correctly-unregister-and-free-clocks-on-failure/20230120-173005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230120092053.182923-11-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v4 10/23] clk: mediatek: mt8173: Break down clock drivers and allow module build
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: openrisc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031042.0Jaf7m4t-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/clk/mediatek/clk-mt8173-apmixedsys.c:95 clk_mt8173_apmixed_probe() warn: passing zero to 'PTR_ERR'
drivers/clk/mediatek/clk-mt8173-apmixedsys.c:130 clk_mt8173_apmixed_probe() warn: 'base' from of_iomap() not released on lines: 99.

vim +/PTR_ERR +95 drivers/clk/mediatek/clk-mt8173-apmixedsys.c

22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   84  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   85  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   86  {
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   87  	struct device_node *node = pdev->dev.of_node;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   88  	struct clk_hw_onecell_data *clk_data;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   89  	void __iomem *base;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   90  	struct clk_hw *hw;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   91  	int r;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   92  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   93  	base = of_iomap(node, 0);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   94  	if (!base)
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  @95  		return PTR_ERR(base);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   96  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   97  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   98  	if (IS_ERR_OR_NULL(clk_data))
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20   99  		return -ENOMEM;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  100  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  101  	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  102  	if (r)
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  103  		goto free_clk_data;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  104  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  105  	hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  106  	if (IS_ERR(hw)) {
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  107  		r = PTR_ERR(hw);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  108  		dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  109  		goto unregister_plls;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  110  	}
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  111  	clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  112  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  113  	hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  114  					  base + REGOFF_HDMI_REF, 16, 3,
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  115  					  CLK_DIVIDER_POWER_OF_TWO, NULL);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  116  	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  117  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  118  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  119  	if (r)
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  120  		goto unregister_ref2usb;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  121  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  122  	return 0;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  123  
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  124  unregister_ref2usb:
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  125  	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  126  unregister_plls:
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  127  	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  128  free_clk_data:
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  129  	mtk_free_clk_data(clk_data);
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20 @130  	return r;
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  131  }
22686e696741e8 AngeloGioacchino Del Regno 2023-01-20  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
