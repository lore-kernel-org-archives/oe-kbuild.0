Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329801624E9
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802078; cv=none; b=HNMs7oFVwFVvKZeSmaNfS2PKNncrYgqluucJxQEPmfa23ksSwlngaX+LlVTKewm0CPZFI9RDCsTl7K26Z3KYa3pp42DAWAI0rRZaHdnmWijZg0sYWUJpuMMmkxenUl6Dqk1amJXpbqU93RDQ0YpXE1brrjCyRTCw+qonECv9R5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802078; c=relaxed/simple;
	bh=RxEDlq1TMbeJ3dht2C8dsdSVIrErL8ZBF7L/0EVBRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxZ60LzwO7vFOH9gJGgT6l+KCoxkFOzIbuwMf07KmMBlZVGLmOOQJiDCbUk+dKKif00hRYv1MAFUE/CHa7xypqBI+O7Wu2XfC+G7iO3gtRnInEBFguVfw4iNIB+qD1ozjBJEC3aB5IvFpoI0Hte7RFgi6pJU7taKIpIq7R6+HCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGETRbhj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGETRbhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765802076; x=1797338076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RxEDlq1TMbeJ3dht2C8dsdSVIrErL8ZBF7L/0EVBRQw=;
  b=mGETRbhjsDAhW/IZ3Hvcf5Li/cpOC7Vp26r6cxdByf+bBnEi8mkWq8uY
   N+erxLe4AQOcmZPvr3GLjnQ6wGDaBSdtzWoixBm1eF5hS4kMgI48twsXr
   LMeEUAM5BuD02SwLaf7L3uXa/+OR4UnssSYSlwjvmNkP8/sjrQsbwd+FC
   sGAhEhUW4/+baRXe4YDLkxNnGJv52Wx9FaoR4gTP4+Y+cGZEzEcWuEPfA
   G/E07ArIBXb4gnY131TlHRScrul7dutg89Qgs9/84eOP3i39DNeCC2SPg
   cLOPsKbZ9ZxHkVDCCHA7d34R5qlAeixUyy+T6oLGzh2x/TDwJu88MVzjs
   Q==;
X-CSE-ConnectionGUID: QfqUtqHnSt21kWlXU9wNkA==
X-CSE-MsgGUID: 9Uazkm59QXCuD8WhohwqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67638756"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67638756"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 04:34:33 -0800
X-CSE-ConnectionGUID: f23xnVgRTRich6rf3LnZxg==
X-CSE-MsgGUID: wPoF3g4mQ5aUWfMqOFW39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="221092068"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Dec 2025 04:34:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV7mT-000000000Hz-2AtB;
	Mon, 15 Dec 2025 12:34:26 +0000
Date: Mon, 15 Dec 2025 20:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202512152051.VxP5zPbh-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174 drm/rockchip: Add RK3588 DPTX output support
date:   4 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r071-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152051.VxP5zPbh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512152051.VxP5zPbh-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:1152 dw_dp_video_need_vsc_sdp() warn: signedness bug returning '(-22)'

vim +/ERR_PTR +2080 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  1968  
86eecc3a9c2e06 Andy Yan 2025-08-22  1969  struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
86eecc3a9c2e06 Andy Yan 2025-08-22  1970  			 const struct dw_dp_plat_data *plat_data)
86eecc3a9c2e06 Andy Yan 2025-08-22  1971  {
86eecc3a9c2e06 Andy Yan 2025-08-22  1972  	struct platform_device *pdev = to_platform_device(dev);
86eecc3a9c2e06 Andy Yan 2025-08-22  1973  	struct dw_dp *dp;
86eecc3a9c2e06 Andy Yan 2025-08-22  1974  	struct drm_bridge *bridge;
86eecc3a9c2e06 Andy Yan 2025-08-22  1975  	void __iomem *res;
86eecc3a9c2e06 Andy Yan 2025-08-22  1976  	int ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  1977  
86eecc3a9c2e06 Andy Yan 2025-08-22  1978  	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
86eecc3a9c2e06 Andy Yan 2025-08-22  1979  	if (!dp)
86eecc3a9c2e06 Andy Yan 2025-08-22  1980  		return ERR_PTR(-ENOMEM);
86eecc3a9c2e06 Andy Yan 2025-08-22  1981  
86eecc3a9c2e06 Andy Yan 2025-08-22  1982  	dp = devm_drm_bridge_alloc(dev, struct dw_dp, bridge, &dw_dp_bridge_funcs);
86eecc3a9c2e06 Andy Yan 2025-08-22  1983  	if (IS_ERR(dp))
86eecc3a9c2e06 Andy Yan 2025-08-22  1984  		return ERR_CAST(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  1985  
86eecc3a9c2e06 Andy Yan 2025-08-22  1986  	dp->dev = dev;
86eecc3a9c2e06 Andy Yan 2025-08-22  1987  	dp->pixel_mode = DW_DP_MP_QUAD_PIXEL;
86eecc3a9c2e06 Andy Yan 2025-08-22  1988  
86eecc3a9c2e06 Andy Yan 2025-08-22  1989  	dp->plat_data.max_link_rate = plat_data->max_link_rate;
86eecc3a9c2e06 Andy Yan 2025-08-22  1990  	bridge = &dp->bridge;
86eecc3a9c2e06 Andy Yan 2025-08-22  1991  	mutex_init(&dp->irq_lock);
86eecc3a9c2e06 Andy Yan 2025-08-22  1992  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
86eecc3a9c2e06 Andy Yan 2025-08-22  1993  	init_completion(&dp->complete);
86eecc3a9c2e06 Andy Yan 2025-08-22  1994  
86eecc3a9c2e06 Andy Yan 2025-08-22  1995  	res = devm_platform_ioremap_resource(pdev, 0);
86eecc3a9c2e06 Andy Yan 2025-08-22  1996  	if (IS_ERR(res))
86eecc3a9c2e06 Andy Yan 2025-08-22  1997  		return ERR_CAST(res);
86eecc3a9c2e06 Andy Yan 2025-08-22  1998  
86eecc3a9c2e06 Andy Yan 2025-08-22  1999  	dp->regmap = devm_regmap_init_mmio(dev, res, &dw_dp_regmap_config);
86eecc3a9c2e06 Andy Yan 2025-08-22  2000  	if (IS_ERR(dp->regmap)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2001  		dev_err_probe(dev, PTR_ERR(dp->regmap), "failed to create regmap\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2002  		return ERR_CAST(dp->regmap);
86eecc3a9c2e06 Andy Yan 2025-08-22  2003  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2004  
86eecc3a9c2e06 Andy Yan 2025-08-22  2005  	dp->phy = devm_of_phy_get(dev, dev->of_node, NULL);
86eecc3a9c2e06 Andy Yan 2025-08-22  2006  	if (IS_ERR(dp->phy)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2007  		dev_err_probe(dev, PTR_ERR(dp->phy), "failed to get phy\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2008  		return ERR_CAST(dp->phy);
86eecc3a9c2e06 Andy Yan 2025-08-22  2009  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2010  
86eecc3a9c2e06 Andy Yan 2025-08-22  2011  	dp->apb_clk = devm_clk_get_enabled(dev, "apb");
86eecc3a9c2e06 Andy Yan 2025-08-22  2012  	if (IS_ERR(dp->apb_clk)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2013  		dev_err_probe(dev, PTR_ERR(dp->apb_clk), "failed to get apb clock\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2014  		return ERR_CAST(dp->apb_clk);
86eecc3a9c2e06 Andy Yan 2025-08-22  2015  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2016  
86eecc3a9c2e06 Andy Yan 2025-08-22  2017  	dp->aux_clk = devm_clk_get_enabled(dev, "aux");
86eecc3a9c2e06 Andy Yan 2025-08-22  2018  	if (IS_ERR(dp->aux_clk)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2019  		dev_err_probe(dev, PTR_ERR(dp->aux_clk), "failed to get aux clock\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2020  		return ERR_CAST(dp->aux_clk);
86eecc3a9c2e06 Andy Yan 2025-08-22  2021  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2022  
86eecc3a9c2e06 Andy Yan 2025-08-22  2023  	dp->i2s_clk = devm_clk_get(dev, "i2s");
86eecc3a9c2e06 Andy Yan 2025-08-22  2024  	if (IS_ERR(dp->i2s_clk)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2025  		dev_err_probe(dev, PTR_ERR(dp->i2s_clk), "failed to get i2s clock\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2026  		return ERR_CAST(dp->i2s_clk);
86eecc3a9c2e06 Andy Yan 2025-08-22  2027  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2028  
86eecc3a9c2e06 Andy Yan 2025-08-22  2029  	dp->spdif_clk = devm_clk_get(dev, "spdif");
86eecc3a9c2e06 Andy Yan 2025-08-22  2030  	if (IS_ERR(dp->spdif_clk)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2031  		dev_err_probe(dev, PTR_ERR(dp->spdif_clk), "failed to get spdif clock\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2032  		return ERR_CAST(dp->spdif_clk);
86eecc3a9c2e06 Andy Yan 2025-08-22  2033  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2034  
86eecc3a9c2e06 Andy Yan 2025-08-22  2035  	dp->hdcp_clk = devm_clk_get(dev, "hdcp");
86eecc3a9c2e06 Andy Yan 2025-08-22  2036  	if (IS_ERR(dp->hdcp_clk)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2037  		dev_err_probe(dev, PTR_ERR(dp->hdcp_clk), "failed to get hdcp clock\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2038  		return ERR_CAST(dp->hdcp_clk);
86eecc3a9c2e06 Andy Yan 2025-08-22  2039  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2040  
86eecc3a9c2e06 Andy Yan 2025-08-22  2041  	dp->rstc = devm_reset_control_get(dev, NULL);
86eecc3a9c2e06 Andy Yan 2025-08-22  2042  	if (IS_ERR(dp->rstc)) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2043  		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2044  		return ERR_CAST(dp->rstc);
86eecc3a9c2e06 Andy Yan 2025-08-22  2045  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2046  
86eecc3a9c2e06 Andy Yan 2025-08-22  2047  	bridge->of_node = dev->of_node;
86eecc3a9c2e06 Andy Yan 2025-08-22  2048  	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
86eecc3a9c2e06 Andy Yan 2025-08-22  2049  	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
86eecc3a9c2e06 Andy Yan 2025-08-22  2050  	bridge->ycbcr_420_allowed = true;
86eecc3a9c2e06 Andy Yan 2025-08-22  2051  
86eecc3a9c2e06 Andy Yan 2025-08-22  2052  	dp->aux.dev = dev;
86eecc3a9c2e06 Andy Yan 2025-08-22  2053  	dp->aux.drm_dev = encoder->dev;
86eecc3a9c2e06 Andy Yan 2025-08-22  2054  	dp->aux.name = dev_name(dev);
86eecc3a9c2e06 Andy Yan 2025-08-22  2055  	dp->aux.transfer = dw_dp_aux_transfer;
86eecc3a9c2e06 Andy Yan 2025-08-22  2056  	ret = drm_dp_aux_register(&dp->aux);
86eecc3a9c2e06 Andy Yan 2025-08-22  2057  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2058  		dev_err_probe(dev, ret, "Aux register failed\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2059  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2060  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2061  
86eecc3a9c2e06 Andy Yan 2025-08-22  2062  	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
86eecc3a9c2e06 Andy Yan 2025-08-22  2063  	if (ret)
86eecc3a9c2e06 Andy Yan 2025-08-22  2064  		dev_err_probe(dev, ret, "Failed to attach bridge\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2065  
86eecc3a9c2e06 Andy Yan 2025-08-22  2066  	dw_dp_init_hw(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2067  
86eecc3a9c2e06 Andy Yan 2025-08-22  2068  	ret = phy_init(dp->phy);
86eecc3a9c2e06 Andy Yan 2025-08-22  2069  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2070  		dev_err_probe(dev, ret, "phy init failed\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2071  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2072  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2073  
86eecc3a9c2e06 Andy Yan 2025-08-22  2074  	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2075  	if (ret)
86eecc3a9c2e06 Andy Yan 2025-08-22  2076  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2077  
86eecc3a9c2e06 Andy Yan 2025-08-22  2078  	dp->irq = platform_get_irq(pdev, 0);
86eecc3a9c2e06 Andy Yan 2025-08-22  2079  	if (dp->irq < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22 @2080  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2081  
86eecc3a9c2e06 Andy Yan 2025-08-22  2082  	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
86eecc3a9c2e06 Andy Yan 2025-08-22  2083  					IRQF_ONESHOT, dev_name(dev), dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2084  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2085  		dev_err_probe(dev, ret, "failed to request irq\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2086  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2087  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2088  
86eecc3a9c2e06 Andy Yan 2025-08-22  2089  	return dp;
86eecc3a9c2e06 Andy Yan 2025-08-22  2090  }
86eecc3a9c2e06 Andy Yan 2025-08-22  2091  EXPORT_SYMBOL_GPL(dw_dp_bind);
86eecc3a9c2e06 Andy Yan 2025-08-22  2092  

:::::: The code at line 2080 was first introduced by commit
:::::: 86eecc3a9c2e06462f6a273fcd24150b6da787de drm/bridge: synopsys: Add DW DPTX Controller support library

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
