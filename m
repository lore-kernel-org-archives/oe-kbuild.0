Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636C21CC45
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741360716; cv=none; b=bPiBZjPqycgW3YAyDdVealC4KqHmSp5oAOjOrmyIvPB/jR2OWx/kot8f/vTeOgxgvThs4afqeTx+gdoS9Z6GsMVGlW36+e5DyHjTZHceMvKChpMUXoMk163+ZSwZt/FZeDbR1cLKm/EuD1giK9BBGkmb2W9SNk46Exw9hgH711Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741360716; c=relaxed/simple;
	bh=t3tXsBdwrSGz46j4iYUE8NPRbB5w4jpjq4ZVCcEQ7Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhrRNFrUXwE+Cj2iUAsIftT7A4zbdt+F/kmkh/Y6UiHqIrS5Zu4wdQhH+2wKUL9pB3CibNS+aqEgOeLCehoXBAFTATq6UBjnUo7t1XU7Uy9kEeliY8tF6iGDToKOc9dRnkAkE7Bm8nwbEvOa9LvH10m/SBVre9B4oLWxPqAgQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUDvHwFG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUDvHwFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741360714; x=1772896714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3tXsBdwrSGz46j4iYUE8NPRbB5w4jpjq4ZVCcEQ7Lc=;
  b=YUDvHwFGtVddnJ8Fd+lCfX5A4ohLrrT8RK4lqi/4e/wjiKrgvuT8ntO0
   6rKWbGhOZD18Q4glJ6YuzDf62nutno1zTP3JlQOBP3xe4fX0fMpaA1ZHM
   /Elkvon9jPOoVyu9xe7YoO7WrIsZpynWhw+rCeoKlMjgtF+wMd5RQa9JQ
   xinXr/BszgfxLmkiw8YbFJGRxR/LFHdqW89VXk5zBE4ccm037GkC/ZUnk
   lezNiZCwh7I6gFrZbwbqZaNUJQQUVN8B+qQe7a1jgJM6X5ucqurubLxf2
   5M/BCEA/Ie8A1PAetwUHWBJ/g9b7o5N2p5m6c0G1N28JNxTvEzk5R+Ee9
   Q==;
X-CSE-ConnectionGUID: hjK2yikjQ86VTV/Ir/xzXg==
X-CSE-MsgGUID: adqefivJSB+BmW6UoCDSfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64851633"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="64851633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 07:18:34 -0800
X-CSE-ConnectionGUID: VjoZKbVpQvuf5/RT0uCieQ==
X-CSE-MsgGUID: YcwbIh6OTY+UtENDxsrUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156561897"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 07:18:32 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqZT4-0000dN-0r;
	Fri, 07 Mar 2025 15:18:30 +0000
Date: Fri, 7 Mar 2025 23:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
Message-ID: <202503072305.Osodtcnk-lkp@intel.com>
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
In-Reply-To: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Abel Vesa <abel.vesa@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-phy-rename-qcom-snps-eusb2-phy-binding-to-snps-eusb2-phy/20250223-202709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223122227.725233-5-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072305.Osodtcnk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503072305.Osodtcnk-lkp@intel.com/

smatch warnings:
drivers/phy/phy-snps-eusb2.c:452 snps_eusb2_hsphy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +452 drivers/phy/phy-snps-eusb2.c

15a1981f608b0f Ivaylo Ivanov 2025-02-23  398  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  399  static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  400  {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  401  	struct device *dev = &pdev->dev;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  402  	struct device_node *np = dev->of_node;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  403  	struct snps_eusb2_hsphy *phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  404  	struct phy_provider *phy_provider;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  405  	struct phy *generic_phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  406  	const struct snps_eusb2_phy_drvdata *drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  407  	int ret, i;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  408  	int num;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  409  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  410  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  411  	if (!phy)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  412  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  413  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  414  	drv_data = of_device_get_match_data(dev);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  415  	if (!drv_data)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  416  		return -EINVAL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  417  	phy->data = drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  418  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  419  	phy->base = devm_platform_ioremap_resource(pdev, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  420  	if (IS_ERR(phy->base))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  421  		return PTR_ERR(phy->base);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  422  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  423  	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  424  	if (IS_ERR(phy->phy_reset))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  425  		return PTR_ERR(phy->phy_reset);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  426  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  427  	phy->clks = devm_kcalloc(dev,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  428  				 phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  429  				 sizeof(*phy->clks),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  430  				 GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  431  	if (!phy->clks)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  432  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  433  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  434  	for (int i = 0; i < phy->data->num_clks; ++i)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  435  		phy->clks[i].id = phy->data->clk_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  436  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  437  	ret = devm_clk_bulk_get(dev, phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  438  				phy->clks);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  439  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  440  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  441  				     "failed to get phy clock(s)\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  442  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  443  	phy->ref_clk = NULL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  444  	for (int i = 0; i < phy->data->num_clks; ++i) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  445  		if (!strcmp(phy->clks[i].id, "ref")) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  446  			phy->ref_clk = phy->clks[i].clk;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  447  			break;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  448  		}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  449  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  450  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  451  	if (IS_ERR_OR_NULL(phy->ref_clk))
15a1981f608b0f Ivaylo Ivanov 2025-02-23 @452  		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  453  				     "failed to get ref clk\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  454  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  455  	num = ARRAY_SIZE(phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  456  	for (i = 0; i < num; i++)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  457  		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  458  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  459  	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  460  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  461  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  462  				     "failed to get regulator supplies\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  463  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  464  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  465  	if (IS_ERR(phy->repeater))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  466  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  467  				     "failed to get repeater\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  468  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  469  	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  470  	if (IS_ERR(generic_phy)) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  471  		dev_err(dev, "failed to create phy %d\n", ret);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  472  		return PTR_ERR(generic_phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  473  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  474  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  475  	dev_set_drvdata(dev, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  476  	phy_set_drvdata(generic_phy, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  477  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  478  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  479  	if (IS_ERR(phy_provider))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  480  		return PTR_ERR(phy_provider);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  481  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  482  	dev_info(dev, "Registered Snps-eUSB2 phy\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  483  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  484  	return 0;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  485  }
15a1981f608b0f Ivaylo Ivanov 2025-02-23  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
