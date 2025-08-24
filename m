Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36FAD4B
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756063621; cv=none; b=buNDJAz9iUWz9ZSGhHtyw4cW3QUdmP21m67CHIFdKSIARuj1KguL+bAFsZcXrYUCS88k0puCFrSxJKw39Q7C52P0MMJfroAr/7YKQHJLwDC0dsQJzAYEbYZYIl7LtvHo2rPgzmuoumPoYEr2ogaHoHQziOKRid2XKxUFTzHduZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756063621; c=relaxed/simple;
	bh=7z4lcWQqXqNpOBF/AVZLPELbbrF4/tYrIMoJ6zsGZuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMFXZ4viQ3rhtLMqutPu+qYMPCDsW8bvzb6toMyNThUpR7L0A/EAt48fujvZewHq++qlLq+h0gY0o/ewCanwJYmex/gsA1uv4G3i8z1XA8I02zPV6fB299nD2EdYAcEI+UtLSKCdJMqr398SZHFRKfgXLYvXu7q3Pn6spZoAYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJqJctCN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJqJctCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756063618; x=1787599618;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7z4lcWQqXqNpOBF/AVZLPELbbrF4/tYrIMoJ6zsGZuc=;
  b=bJqJctCNFUbAYIxKmpl+nLCD83hp15Lp2dOjCXL5+C8nprzJk3KYMjir
   bDiA53QwG0ffpZBcCs2Wmt4wnZWH8lGX2+fDw1v96D8yi2n8IXGuQ9ZVz
   Z3ruRh901fkWupEbhIAZmqjhBlobyDk/VQvN5nRx5C9MYJQeE/XrXiusU
   SGsUVVCKfgogJ1qRqdrHzNyOuMceBqcKhtDbY9YftF7rS+vdl/xCeToa4
   W+KzCe56rdaPU2UhoviRRSScEU7uLbuitaLFLau3w1Tn9tmVkzN/wrNgg
   xCJ12SeHbP/NhqRJPBLTXG7MOj4tnlOJqTBCtHqaOfr5+y00XQqoRTX7x
   Q==;
X-CSE-ConnectionGUID: d3Q4QgpwQ+aCMMlYxZEQDQ==
X-CSE-MsgGUID: FQMKqsDrSHWQpe5/9g2Imw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="68879690"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68879690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 12:26:58 -0700
X-CSE-ConnectionGUID: DZpzlaR6Re2gs5wfUlfX8Q==
X-CSE-MsgGUID: uGSLPpOiSs+rxvULEwiz5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169504380"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Aug 2025 12:26:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqGMg-000NBD-1x;
	Sun, 24 Aug 2025 19:26:54 +0000
Date: Mon, 25 Aug 2025 03:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 07/13] drm/stm: ltdc: support new hardware version for
 STM32MP25 SoC
Message-ID: <202508250323.E10FG5CI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250822-drm-misc-next-v5-7-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-7-9c825e28f733@foss.st.com>
TO: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>
TO: Yannick Fertre <yannick.fertre@foss.st.com>
TO: Philippe Cornu <philippe.cornu@foss.st.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Christophe Roullier <christophe.roullier@foss.st.com>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c8cea4371e5eca30cda8660aabb337747dabc51d]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/dt-bindings-display-st-add-two-new-compatibles-to-LTDC-device/20250822-224549
base:   c8cea4371e5eca30cda8660aabb337747dabc51d
patch link:    https://lore.kernel.org/r/20250822-drm-misc-next-v5-7-9c825e28f733%40foss.st.com
patch subject: [PATCH v5 07/13] drm/stm: ltdc: support new hardware version for STM32MP25 SoC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250323.E10FG5CI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508250323.E10FG5CI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1902 ltdc_resume() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1902.
drivers/gpu/drm/stm/ltdc.c:2077 ltdc_load() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 2077.
drivers/gpu/drm/stm/ltdc.c:2077 ltdc_load() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1947.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:938 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success

vim +1902 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertré  2019-03-21  1882  
df61c776657fa5 Yannick Fertré  2019-03-21  1883  int ltdc_resume(struct drm_device *ddev)
df61c776657fa5 Yannick Fertré  2019-03-21  1884  {
df61c776657fa5 Yannick Fertré  2019-03-21  1885  	struct ltdc_device *ldev = ddev->dev_private;
df61c776657fa5 Yannick Fertré  2019-03-21  1886  	int ret;
df61c776657fa5 Yannick Fertré  2019-03-21  1887  
df61c776657fa5 Yannick Fertré  2019-03-21  1888  	DRM_DEBUG_DRIVER("\n");
df61c776657fa5 Yannick Fertré  2019-03-21  1889  
df61c776657fa5 Yannick Fertré  2019-03-21  1890  	ret = clk_prepare_enable(ldev->pixel_clk);
df61c776657fa5 Yannick Fertré  2019-03-21  1891  	if (ret) {
df61c776657fa5 Yannick Fertré  2019-03-21  1892  		DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
df61c776657fa5 Yannick Fertré  2019-03-21  1893  		return ret;
df61c776657fa5 Yannick Fertré  2019-03-21  1894  	}
df61c776657fa5 Yannick Fertré  2019-03-21  1895  
4bc19104512f12 Yannick Fertre  2025-08-22  1896  	if (ldev->bus_clk) {
4bc19104512f12 Yannick Fertre  2025-08-22  1897  		ret = clk_prepare_enable(ldev->bus_clk);
4bc19104512f12 Yannick Fertre  2025-08-22  1898  		if (ret)
4bc19104512f12 Yannick Fertre  2025-08-22  1899  			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
4bc19104512f12 Yannick Fertre  2025-08-22  1900  	}
4bc19104512f12 Yannick Fertre  2025-08-22  1901  
4bc19104512f12 Yannick Fertre  2025-08-22 @1902  	return ret;
df61c776657fa5 Yannick Fertré  2019-03-21  1903  }
df61c776657fa5 Yannick Fertré  2019-03-21  1904  
b759012c5fa761 Yannick Fertre  2017-04-14  1905  int ltdc_load(struct drm_device *ddev)
b759012c5fa761 Yannick Fertre  2017-04-14  1906  {
b759012c5fa761 Yannick Fertre  2017-04-14  1907  	struct platform_device *pdev = to_platform_device(ddev->dev);
b759012c5fa761 Yannick Fertre  2017-04-14  1908  	struct ltdc_device *ldev = ddev->dev_private;
b759012c5fa761 Yannick Fertre  2017-04-14  1909  	struct device *dev = ddev->dev;
b759012c5fa761 Yannick Fertre  2017-04-14  1910  	struct device_node *np = dev->of_node;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1911  	struct drm_bridge *bridge;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1912  	struct drm_panel *panel;
b759012c5fa761 Yannick Fertre  2017-04-14  1913  	struct drm_crtc *crtc;
b759012c5fa761 Yannick Fertre  2017-04-14  1914  	struct reset_control *rstc;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1915  	int irq, i, nb_endpoints;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1916  	int ret = -ENODEV;
b759012c5fa761 Yannick Fertre  2017-04-14  1917  
b759012c5fa761 Yannick Fertre  2017-04-14  1918  	DRM_DEBUG_DRIVER("\n");
b759012c5fa761 Yannick Fertre  2017-04-14  1919  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1920  	/* Get number of endpoints */
b430ff7ef8b016 Yannick Fertre  2020-02-28  1921  	nb_endpoints = of_graph_get_endpoint_count(np);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1922  	if (!nb_endpoints)
b430ff7ef8b016 Yannick Fertre  2020-02-28  1923  		return -ENODEV;
b759012c5fa761 Yannick Fertre  2017-04-14  1924  
b759012c5fa761 Yannick Fertre  2017-04-14  1925  	ldev->pixel_clk = devm_clk_get(dev, "lcd");
b759012c5fa761 Yannick Fertre  2017-04-14  1926  	if (IS_ERR(ldev->pixel_clk)) {
1f358bc6f272b9 Fabien Dessenne 2019-04-24  1927  		if (PTR_ERR(ldev->pixel_clk) != -EPROBE_DEFER)
b759012c5fa761 Yannick Fertre  2017-04-14  1928  			DRM_ERROR("Unable to get lcd clock\n");
1f358bc6f272b9 Fabien Dessenne 2019-04-24  1929  		return PTR_ERR(ldev->pixel_clk);
b759012c5fa761 Yannick Fertre  2017-04-14  1930  	}
b759012c5fa761 Yannick Fertre  2017-04-14  1931  
b759012c5fa761 Yannick Fertre  2017-04-14  1932  	if (clk_prepare_enable(ldev->pixel_clk)) {
b759012c5fa761 Yannick Fertre  2017-04-14  1933  		DRM_ERROR("Unable to prepare pixel clock\n");
b759012c5fa761 Yannick Fertre  2017-04-14  1934  		return -ENODEV;
b759012c5fa761 Yannick Fertre  2017-04-14  1935  	}
b759012c5fa761 Yannick Fertre  2017-04-14  1936  
4bc19104512f12 Yannick Fertre  2025-08-22  1937  	if (of_device_is_compatible(np, "st,stm32mp251-ltdc") ||
4bc19104512f12 Yannick Fertre  2025-08-22  1938  	    of_device_is_compatible(np, "st,stm32mp255-ltdc")) {
4bc19104512f12 Yannick Fertre  2025-08-22  1939  		ldev->bus_clk = devm_clk_get(dev, "bus");
4bc19104512f12 Yannick Fertre  2025-08-22  1940  		if (IS_ERR(ldev->bus_clk))
4bc19104512f12 Yannick Fertre  2025-08-22  1941  			return dev_err_probe(dev, PTR_ERR(ldev->bus_clk),
4bc19104512f12 Yannick Fertre  2025-08-22  1942  					     "Unable to get bus clock\n");
4bc19104512f12 Yannick Fertre  2025-08-22  1943  
4bc19104512f12 Yannick Fertre  2025-08-22  1944  		ret = clk_prepare_enable(ldev->bus_clk);
4bc19104512f12 Yannick Fertre  2025-08-22  1945  		if (ret) {
4bc19104512f12 Yannick Fertre  2025-08-22  1946  			drm_err(ddev, "Unable to prepare bus clock\n");
4bc19104512f12 Yannick Fertre  2025-08-22  1947  			return ret;
4bc19104512f12 Yannick Fertre  2025-08-22  1948  		}
4bc19104512f12 Yannick Fertre  2025-08-22  1949  	}
4bc19104512f12 Yannick Fertre  2025-08-22  1950  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1951  	/* Get endpoints if any */
b430ff7ef8b016 Yannick Fertre  2020-02-28  1952  	for (i = 0; i < nb_endpoints; i++) {
b430ff7ef8b016 Yannick Fertre  2020-02-28  1953  		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel, &bridge);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1954  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1955  		/*
b430ff7ef8b016 Yannick Fertre  2020-02-28  1956  		 * If at least one endpoint is -ENODEV, continue probing,
b430ff7ef8b016 Yannick Fertre  2020-02-28  1957  		 * else if at least one endpoint returned an error
b430ff7ef8b016 Yannick Fertre  2020-02-28  1958  		 * (ie -EPROBE_DEFER) then stop probing.
b430ff7ef8b016 Yannick Fertre  2020-02-28  1959  		 */
b430ff7ef8b016 Yannick Fertre  2020-02-28  1960  		if (ret == -ENODEV)
b430ff7ef8b016 Yannick Fertre  2020-02-28  1961  			continue;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1962  		else if (ret)
b430ff7ef8b016 Yannick Fertre  2020-02-28  1963  			goto err;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1964  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1965  		if (panel) {
19dd9780b7ac67 Katya Orlova    2024-02-16  1966  			bridge = drmm_panel_bridge_add(ddev, panel);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1967  			if (IS_ERR(bridge)) {
b430ff7ef8b016 Yannick Fertre  2020-02-28  1968  				DRM_ERROR("panel-bridge endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1969  				ret = PTR_ERR(bridge);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1970  				goto err;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1971  			}
b430ff7ef8b016 Yannick Fertre  2020-02-28  1972  		}
b430ff7ef8b016 Yannick Fertre  2020-02-28  1973  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1974  		if (bridge) {
b430ff7ef8b016 Yannick Fertre  2020-02-28  1975  			ret = ltdc_encoder_init(ddev, bridge);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1976  			if (ret) {
648ce7fd186cfb Jagan Teki      2021-07-04  1977  				if (ret != -EPROBE_DEFER)
b430ff7ef8b016 Yannick Fertre  2020-02-28  1978  					DRM_ERROR("init encoder endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1979  				goto err;
b430ff7ef8b016 Yannick Fertre  2020-02-28  1980  			}
b430ff7ef8b016 Yannick Fertre  2020-02-28  1981  		}
b430ff7ef8b016 Yannick Fertre  2020-02-28  1982  	}
b430ff7ef8b016 Yannick Fertre  2020-02-28  1983  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1984  	rstc = devm_reset_control_get_exclusive(dev, NULL);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1985  
b430ff7ef8b016 Yannick Fertre  2020-02-28  1986  	mutex_init(&ldev->err_lock);
b430ff7ef8b016 Yannick Fertre  2020-02-28  1987  
f42f540b9d0c16 Yannick Fertré  2019-04-03  1988  	if (!IS_ERR(rstc)) {
f42f540b9d0c16 Yannick Fertré  2019-04-03  1989  		reset_control_assert(rstc);
f42f540b9d0c16 Yannick Fertré  2019-04-03  1990  		usleep_range(10, 20);
f42f540b9d0c16 Yannick Fertré  2019-04-03  1991  		reset_control_deassert(rstc);
f42f540b9d0c16 Yannick Fertré  2019-04-03  1992  	}
f42f540b9d0c16 Yannick Fertré  2019-04-03  1993  
50cc9a322b5f4f Anusha Srivatsa 2025-02-25  1994  	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
b759012c5fa761 Yannick Fertre  2017-04-14  1995  	if (IS_ERR(ldev->regs)) {
b759012c5fa761 Yannick Fertre  2017-04-14  1996  		DRM_ERROR("Unable to get ltdc registers\n");
cea3a330ee20e9 Philippe CORNU  2017-07-17  1997  		ret = PTR_ERR(ldev->regs);
cea3a330ee20e9 Philippe CORNU  2017-07-17  1998  		goto err;
b759012c5fa761 Yannick Fertre  2017-04-14  1999  	}
b759012c5fa761 Yannick Fertre  2017-04-14  2000  
734c26450aefaa Yannick Fertre  2021-12-15  2001  	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
734c26450aefaa Yannick Fertre  2021-12-15  2002  	if (IS_ERR(ldev->regmap)) {
734c26450aefaa Yannick Fertre  2021-12-15  2003  		DRM_ERROR("Unable to regmap ltdc registers\n");
734c26450aefaa Yannick Fertre  2021-12-15  2004  		ret = PTR_ERR(ldev->regmap);
734c26450aefaa Yannick Fertre  2021-12-15  2005  		goto err;
734c26450aefaa Yannick Fertre  2021-12-15  2006  	}
734c26450aefaa Yannick Fertre  2021-12-15  2007  
544aa6cefb24d7 Yannick Fertre  2020-01-21  2008  	ret = ltdc_get_caps(ddev);
544aa6cefb24d7 Yannick Fertre  2020-01-21  2009  	if (ret) {
544aa6cefb24d7 Yannick Fertre  2020-01-21  2010  		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
544aa6cefb24d7 Yannick Fertre  2020-01-21  2011  			  ldev->caps.hw_version);
9e759fc7dcd6d4 Fabien Dessenne 2019-04-24  2012  		goto err;
544aa6cefb24d7 Yannick Fertre  2020-01-21  2013  	}
9e759fc7dcd6d4 Fabien Dessenne 2019-04-24  2014  
ef824286128edd Yannick Fertre  2024-07-12  2015  	/* Disable all interrupts */
ef824286128edd Yannick Fertre  2024-07-12  2016  	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_MASK);
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2017  
544aa6cefb24d7 Yannick Fertre  2020-01-21  2018  	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
544aa6cefb24d7 Yannick Fertre  2020-01-21  2019  
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2020  	/* initialize default value for fifo underrun threshold & clear interrupt error counters */
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2021  	ldev->transfer_err = 0;
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2022  	ldev->fifo_err = 0;
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2023  	ldev->fifo_warn = 0;
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2024  	ldev->fifo_threshold = FUT_DFT;
7d008eecb0cfc2 Yannick Fertre  2022-06-03  2025  
544aa6cefb24d7 Yannick Fertre  2020-01-21  2026  	for (i = 0; i < ldev->caps.nb_irq; i++) {
544aa6cefb24d7 Yannick Fertre  2020-01-21  2027  		irq = platform_get_irq(pdev, i);
544aa6cefb24d7 Yannick Fertre  2020-01-21  2028  		if (irq < 0) {
544aa6cefb24d7 Yannick Fertre  2020-01-21  2029  			ret = irq;
544aa6cefb24d7 Yannick Fertre  2020-01-21  2030  			goto err;
544aa6cefb24d7 Yannick Fertre  2020-01-21  2031  		}
b759012c5fa761 Yannick Fertre  2017-04-14  2032  
b759012c5fa761 Yannick Fertre  2017-04-14  2033  		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
b759012c5fa761 Yannick Fertre  2017-04-14  2034  						ltdc_irq_thread, IRQF_ONESHOT,
b759012c5fa761 Yannick Fertre  2017-04-14  2035  						dev_name(dev), ddev);
b759012c5fa761 Yannick Fertre  2017-04-14  2036  		if (ret) {
b759012c5fa761 Yannick Fertre  2017-04-14  2037  			DRM_ERROR("Failed to register LTDC interrupt\n");
cea3a330ee20e9 Philippe CORNU  2017-07-17  2038  			goto err;
b759012c5fa761 Yannick Fertre  2017-04-14  2039  		}
c188d7ebbebd0b Philippe CORNU  2017-10-26  2040  	}
b759012c5fa761 Yannick Fertre  2017-04-14  2041  
19dd9780b7ac67 Katya Orlova    2024-02-16  2042  	crtc = drmm_kzalloc(ddev, sizeof(*crtc), GFP_KERNEL);
b759012c5fa761 Yannick Fertre  2017-04-14  2043  	if (!crtc) {
b759012c5fa761 Yannick Fertre  2017-04-14  2044  		DRM_ERROR("Failed to allocate crtc\n");
b759012c5fa761 Yannick Fertre  2017-04-14  2045  		ret = -ENOMEM;
b759012c5fa761 Yannick Fertre  2017-04-14  2046  		goto err;
b759012c5fa761 Yannick Fertre  2017-04-14  2047  	}
b759012c5fa761 Yannick Fertre  2017-04-14  2048  
b759012c5fa761 Yannick Fertre  2017-04-14  2049  	ret = ltdc_crtc_init(ddev, crtc);
b759012c5fa761 Yannick Fertre  2017-04-14  2050  	if (ret) {
b759012c5fa761 Yannick Fertre  2017-04-14  2051  		DRM_ERROR("Failed to init crtc\n");
b759012c5fa761 Yannick Fertre  2017-04-14  2052  		goto err;
b759012c5fa761 Yannick Fertre  2017-04-14  2053  	}
b759012c5fa761 Yannick Fertre  2017-04-14  2054  
b759012c5fa761 Yannick Fertre  2017-04-14  2055  	ret = drm_vblank_init(ddev, NB_CRTC);
b759012c5fa761 Yannick Fertre  2017-04-14  2056  	if (ret) {
b759012c5fa761 Yannick Fertre  2017-04-14  2057  		DRM_ERROR("Failed calling drm_vblank_init()\n");
b759012c5fa761 Yannick Fertre  2017-04-14  2058  		goto err;
b759012c5fa761 Yannick Fertre  2017-04-14  2059  	}
b759012c5fa761 Yannick Fertre  2017-04-14  2060  
35ab6cfbf21178 Yannick Fertré  2019-06-03  2061  	clk_disable_unprepare(ldev->pixel_clk);
35ab6cfbf21178 Yannick Fertré  2019-06-03  2062  
4bc19104512f12 Yannick Fertre  2025-08-22  2063  	if (ldev->bus_clk)
4bc19104512f12 Yannick Fertre  2025-08-22  2064  		clk_disable_unprepare(ldev->bus_clk);
4bc19104512f12 Yannick Fertre  2025-08-22  2065  
92a57b3fb500e2 Yannick Fertré  2019-09-06  2066  	pinctrl_pm_select_sleep_state(ddev->dev);
92a57b3fb500e2 Yannick Fertré  2019-09-06  2067  
35ab6cfbf21178 Yannick Fertré  2019-06-03  2068  	pm_runtime_enable(ddev->dev);
bdf31bcf3d84ef Philippe CORNU  2017-07-17  2069  
35ab6cfbf21178 Yannick Fertré  2019-06-03  2070  	return 0;
b759012c5fa761 Yannick Fertre  2017-04-14  2071  err:
b759012c5fa761 Yannick Fertre  2017-04-14  2072  	clk_disable_unprepare(ldev->pixel_clk);
b759012c5fa761 Yannick Fertre  2017-04-14  2073  
4bc19104512f12 Yannick Fertre  2025-08-22  2074  	if (ldev->bus_clk)
4bc19104512f12 Yannick Fertre  2025-08-22  2075  		clk_disable_unprepare(ldev->bus_clk);
4bc19104512f12 Yannick Fertre  2025-08-22  2076  
b759012c5fa761 Yannick Fertre  2017-04-14 @2077  	return ret;
b759012c5fa761 Yannick Fertre  2017-04-14  2078  }
b759012c5fa761 Yannick Fertre  2017-04-14  2079  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
