Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E67081E
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765674939; cv=none; b=BCUPueGsG92qfKCi1vdlMozpH2rj47xIZgripoVpn+RaBC5ClFcVKHoB5qVO2+MkW+wIdZ97HxtT9MxzqCddd2HTMjXVF6C0opE1NPRQ8tI1i1ziRq7bRGa7TNpCYKdj4MraTcZtaN9FRy6J080AslqzX9R1SiULSWjuIwXiMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765674939; c=relaxed/simple;
	bh=Djlsol7DkXsUKUdem1Dv/FGtCC9MqaA2UqXvqb6h4S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2o5PFw7t/H4up6KzD8Z6gXkf/kx8sF8yZUjnlsHcNuqZ/tFY4/X4csHwlsRBJNz42jc3Y8OtKgCMStae3+DbN0jR/3kjAUgql/UMDjkTc1H8TRfoFkkmYzJHNitHb2JeB1/fmJvSNC3OvLxzjJ400JXGvtpDM1N2c6ZSLXDNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+qoLwzA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+qoLwzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765674937; x=1797210937;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Djlsol7DkXsUKUdem1Dv/FGtCC9MqaA2UqXvqb6h4S4=;
  b=m+qoLwzAqBpbGUKJhQ92lZ3wAc0H7bHWL4jAjo1AL+zqlzE8c523kVMC
   j2M/R/REg/1GU9rnOAKrD87nPIR0AOcOBX0OBPe7oyQgQ5nTnji770QR5
   m3ApViFgkM5bGgqkgsArFiwmhwPo8xIVjt266M70HVck/qwPfcJaKkjnh
   TukuxpoXcVGDY4I5QuRbFojKbGx5N2X6qxLc2zrwKgqNra14DMVtgjHzZ
   YdU7EkueZtJhmJQkgjbvfcvV47EH2Rg8wj7LvVYliknHlPZjG7P/+qZz0
   61NEprH8Jh81n9Fkx11lyxkySQOglxkIBWLQI6OfuxsLgk5Sr94PVN065
   w==;
X-CSE-ConnectionGUID: htRKBlOXTeKOgS2Cwk4RrA==
X-CSE-MsgGUID: pp9jjqonRJS3Ky4ZG/YaOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77941574"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="77941574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:15:37 -0800
X-CSE-ConnectionGUID: sKkAkoXHRSyOTbZaxoe8Xg==
X-CSE-MsgGUID: CoaqLmf+QTuxx/Al7pkbXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201838421"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 17:15:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUahx-000000008PY-0zQx;
	Sun, 14 Dec 2025 01:15:33 +0000
Date: Sun, 14 Dec 2025 09:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/stm/ltdc.c:1903 ltdc_resume() warn:
 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1903.
Message-ID: <202512140924.7fwW7iFd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yannick Fertre <yannick.fertre@foss.st.com>
CC: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: d80667642b0f43580efd489d627dd24aa10ab98f drm/stm: ltdc: support new hardware version for STM32MP25 SoC
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140924.7fwW7iFd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140924.7fwW7iFd-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1903 ltdc_resume() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1903.
drivers/gpu/drm/stm/ltdc.c:2078 ltdc_load() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 2078.
drivers/gpu/drm/stm/ltdc.c:2078 ltdc_load() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1948.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:939 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success

vim +1903 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertré      2019-03-21  1883  
df61c776657fa5 Yannick Fertré      2019-03-21  1884  int ltdc_resume(struct drm_device *ddev)
df61c776657fa5 Yannick Fertré      2019-03-21  1885  {
df61c776657fa5 Yannick Fertré      2019-03-21  1886  	struct ltdc_device *ldev = ddev->dev_private;
df61c776657fa5 Yannick Fertré      2019-03-21  1887  	int ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1888  
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1889  	drm_dbg_driver(ddev, "\n");
df61c776657fa5 Yannick Fertré      2019-03-21  1890  
df61c776657fa5 Yannick Fertré      2019-03-21  1891  	ret = clk_prepare_enable(ldev->pixel_clk);
df61c776657fa5 Yannick Fertré      2019-03-21  1892  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1893  		drm_err(ddev, "failed to enable pixel clock (%d)\n", ret);
df61c776657fa5 Yannick Fertré      2019-03-21  1894  		return ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1895  	}
df61c776657fa5 Yannick Fertré      2019-03-21  1896  
d80667642b0f43 Yannick Fertre      2025-08-22  1897  	if (ldev->bus_clk) {
d80667642b0f43 Yannick Fertre      2025-08-22  1898  		ret = clk_prepare_enable(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  1899  		if (ret)
d80667642b0f43 Yannick Fertre      2025-08-22  1900  			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
d80667642b0f43 Yannick Fertre      2025-08-22  1901  	}
d80667642b0f43 Yannick Fertre      2025-08-22  1902  
d80667642b0f43 Yannick Fertre      2025-08-22 @1903  	return ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1904  }
df61c776657fa5 Yannick Fertré      2019-03-21  1905  
b759012c5fa761 Yannick Fertre      2017-04-14  1906  int ltdc_load(struct drm_device *ddev)
b759012c5fa761 Yannick Fertre      2017-04-14  1907  {
b759012c5fa761 Yannick Fertre      2017-04-14  1908  	struct platform_device *pdev = to_platform_device(ddev->dev);
b759012c5fa761 Yannick Fertre      2017-04-14  1909  	struct ltdc_device *ldev = ddev->dev_private;
b759012c5fa761 Yannick Fertre      2017-04-14  1910  	struct device *dev = ddev->dev;
b759012c5fa761 Yannick Fertre      2017-04-14  1911  	struct device_node *np = dev->of_node;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1912  	struct drm_bridge *bridge;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1913  	struct drm_panel *panel;
b759012c5fa761 Yannick Fertre      2017-04-14  1914  	struct drm_crtc *crtc;
b759012c5fa761 Yannick Fertre      2017-04-14  1915  	struct reset_control *rstc;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1916  	int irq, i, nb_endpoints;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1917  	int ret = -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1918  
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1919  	drm_dbg_driver(ddev, "\n");
b759012c5fa761 Yannick Fertre      2017-04-14  1920  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1921  	/* Get number of endpoints */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1922  	nb_endpoints = of_graph_get_endpoint_count(np);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1923  	if (!nb_endpoints)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1924  		return -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1925  
b759012c5fa761 Yannick Fertre      2017-04-14  1926  	ldev->pixel_clk = devm_clk_get(dev, "lcd");
b759012c5fa761 Yannick Fertre      2017-04-14  1927  	if (IS_ERR(ldev->pixel_clk)) {
1f358bc6f272b9 Fabien Dessenne     2019-04-24  1928  		if (PTR_ERR(ldev->pixel_clk) != -EPROBE_DEFER)
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1929  			drm_err(ddev, "Unable to get lcd clock\n");
1f358bc6f272b9 Fabien Dessenne     2019-04-24  1930  		return PTR_ERR(ldev->pixel_clk);
b759012c5fa761 Yannick Fertre      2017-04-14  1931  	}
b759012c5fa761 Yannick Fertre      2017-04-14  1932  
b759012c5fa761 Yannick Fertre      2017-04-14  1933  	if (clk_prepare_enable(ldev->pixel_clk)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1934  		drm_err(ddev, "Unable to prepare pixel clock\n");
b759012c5fa761 Yannick Fertre      2017-04-14  1935  		return -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1936  	}
b759012c5fa761 Yannick Fertre      2017-04-14  1937  
d80667642b0f43 Yannick Fertre      2025-08-22  1938  	if (of_device_is_compatible(np, "st,stm32mp251-ltdc") ||
d80667642b0f43 Yannick Fertre      2025-08-22  1939  	    of_device_is_compatible(np, "st,stm32mp255-ltdc")) {
d80667642b0f43 Yannick Fertre      2025-08-22  1940  		ldev->bus_clk = devm_clk_get(dev, "bus");
d80667642b0f43 Yannick Fertre      2025-08-22  1941  		if (IS_ERR(ldev->bus_clk))
d80667642b0f43 Yannick Fertre      2025-08-22  1942  			return dev_err_probe(dev, PTR_ERR(ldev->bus_clk),
d80667642b0f43 Yannick Fertre      2025-08-22  1943  					     "Unable to get bus clock\n");
d80667642b0f43 Yannick Fertre      2025-08-22  1944  
d80667642b0f43 Yannick Fertre      2025-08-22  1945  		ret = clk_prepare_enable(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  1946  		if (ret) {
d80667642b0f43 Yannick Fertre      2025-08-22  1947  			drm_err(ddev, "Unable to prepare bus clock\n");
d80667642b0f43 Yannick Fertre      2025-08-22  1948  			return ret;
d80667642b0f43 Yannick Fertre      2025-08-22  1949  		}
d80667642b0f43 Yannick Fertre      2025-08-22  1950  	}
d80667642b0f43 Yannick Fertre      2025-08-22  1951  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1952  	/* Get endpoints if any */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1953  	for (i = 0; i < nb_endpoints; i++) {
b430ff7ef8b016 Yannick Fertre      2020-02-28  1954  		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel, &bridge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1955  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1956  		/*
b430ff7ef8b016 Yannick Fertre      2020-02-28  1957  		 * If at least one endpoint is -ENODEV, continue probing,
b430ff7ef8b016 Yannick Fertre      2020-02-28  1958  		 * else if at least one endpoint returned an error
b430ff7ef8b016 Yannick Fertre      2020-02-28  1959  		 * (ie -EPROBE_DEFER) then stop probing.
b430ff7ef8b016 Yannick Fertre      2020-02-28  1960  		 */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1961  		if (ret == -ENODEV)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1962  			continue;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1963  		else if (ret)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1964  			goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1965  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1966  		if (panel) {
19dd9780b7ac67 Katya Orlova        2024-02-16  1967  			bridge = drmm_panel_bridge_add(ddev, panel);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1968  			if (IS_ERR(bridge)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1969  				drm_err(ddev, "panel-bridge endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1970  				ret = PTR_ERR(bridge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1971  				goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1972  			}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1973  		}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1974  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1975  		if (bridge) {
b430ff7ef8b016 Yannick Fertre      2020-02-28  1976  			ret = ltdc_encoder_init(ddev, bridge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1977  			if (ret) {
648ce7fd186cfb Jagan Teki          2021-07-04  1978  				if (ret != -EPROBE_DEFER)
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1979  					drm_err(ddev, "init encoder endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1980  				goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1981  			}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1982  		}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1983  	}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1984  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1985  	rstc = devm_reset_control_get_exclusive(dev, NULL);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1986  
b430ff7ef8b016 Yannick Fertre      2020-02-28  1987  	mutex_init(&ldev->err_lock);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1988  
f42f540b9d0c16 Yannick Fertré      2019-04-03  1989  	if (!IS_ERR(rstc)) {
f42f540b9d0c16 Yannick Fertré      2019-04-03  1990  		reset_control_assert(rstc);
f42f540b9d0c16 Yannick Fertré      2019-04-03  1991  		usleep_range(10, 20);
f42f540b9d0c16 Yannick Fertré      2019-04-03  1992  		reset_control_deassert(rstc);
f42f540b9d0c16 Yannick Fertré      2019-04-03  1993  	}
f42f540b9d0c16 Yannick Fertré      2019-04-03  1994  
50cc9a322b5f4f Anusha Srivatsa     2025-02-25  1995  	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
b759012c5fa761 Yannick Fertre      2017-04-14  1996  	if (IS_ERR(ldev->regs)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1997  		drm_err(ddev, "Unable to get ltdc registers\n");
cea3a330ee20e9 Philippe CORNU      2017-07-17  1998  		ret = PTR_ERR(ldev->regs);
cea3a330ee20e9 Philippe CORNU      2017-07-17  1999  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2000  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2001  
734c26450aefaa Yannick Fertre      2021-12-15  2002  	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
734c26450aefaa Yannick Fertre      2021-12-15  2003  	if (IS_ERR(ldev->regmap)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2004  		drm_err(ddev, "Unable to regmap ltdc registers\n");
734c26450aefaa Yannick Fertre      2021-12-15  2005  		ret = PTR_ERR(ldev->regmap);
734c26450aefaa Yannick Fertre      2021-12-15  2006  		goto err;
734c26450aefaa Yannick Fertre      2021-12-15  2007  	}
734c26450aefaa Yannick Fertre      2021-12-15  2008  
544aa6cefb24d7 Yannick Fertre      2020-01-21  2009  	ret = ltdc_get_caps(ddev);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2010  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2011  		drm_err(ddev, "hardware identifier (0x%08x) not supported!\n",
544aa6cefb24d7 Yannick Fertre      2020-01-21  2012  			ldev->caps.hw_version);
9e759fc7dcd6d4 Fabien Dessenne     2019-04-24  2013  		goto err;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2014  	}
9e759fc7dcd6d4 Fabien Dessenne     2019-04-24  2015  
ef824286128edd Yannick Fertre      2024-07-12  2016  	/* Disable all interrupts */
ef824286128edd Yannick Fertre      2024-07-12  2017  	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_MASK);
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2018  
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2019  	drm_dbg_driver(ddev, "ltdc hw version 0x%08x\n", ldev->caps.hw_version);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2020  
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2021  	/* initialize default value for fifo underrun threshold & clear interrupt error counters */
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2022  	ldev->transfer_err = 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2023  	ldev->fifo_err = 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2024  	ldev->fifo_warn = 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2025  	ldev->fifo_threshold = FUT_DFT;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2026  
544aa6cefb24d7 Yannick Fertre      2020-01-21  2027  	for (i = 0; i < ldev->caps.nb_irq; i++) {
544aa6cefb24d7 Yannick Fertre      2020-01-21  2028  		irq = platform_get_irq(pdev, i);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2029  		if (irq < 0) {
544aa6cefb24d7 Yannick Fertre      2020-01-21  2030  			ret = irq;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2031  			goto err;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2032  		}
b759012c5fa761 Yannick Fertre      2017-04-14  2033  
b759012c5fa761 Yannick Fertre      2017-04-14  2034  		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
b759012c5fa761 Yannick Fertre      2017-04-14  2035  						ltdc_irq_thread, IRQF_ONESHOT,
b759012c5fa761 Yannick Fertre      2017-04-14  2036  						dev_name(dev), ddev);
b759012c5fa761 Yannick Fertre      2017-04-14  2037  		if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2038  			drm_err(ddev, "Failed to register LTDC interrupt\n");
cea3a330ee20e9 Philippe CORNU      2017-07-17  2039  			goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2040  		}
c188d7ebbebd0b Philippe CORNU      2017-10-26  2041  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2042  
19dd9780b7ac67 Katya Orlova        2024-02-16  2043  	crtc = drmm_kzalloc(ddev, sizeof(*crtc), GFP_KERNEL);
b759012c5fa761 Yannick Fertre      2017-04-14  2044  	if (!crtc) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2045  		drm_err(ddev, "Failed to allocate crtc\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2046  		ret = -ENOMEM;
b759012c5fa761 Yannick Fertre      2017-04-14  2047  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2048  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2049  
b759012c5fa761 Yannick Fertre      2017-04-14  2050  	ret = ltdc_crtc_init(ddev, crtc);
b759012c5fa761 Yannick Fertre      2017-04-14  2051  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2052  		drm_err(ddev, "Failed to init crtc\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2053  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2054  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2055  
b759012c5fa761 Yannick Fertre      2017-04-14  2056  	ret = drm_vblank_init(ddev, NB_CRTC);
b759012c5fa761 Yannick Fertre      2017-04-14  2057  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2058  		drm_err(ddev, "Failed calling drm_vblank_init()\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2059  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2060  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2061  
35ab6cfbf21178 Yannick Fertré      2019-06-03  2062  	clk_disable_unprepare(ldev->pixel_clk);
35ab6cfbf21178 Yannick Fertré      2019-06-03  2063  
d80667642b0f43 Yannick Fertre      2025-08-22  2064  	if (ldev->bus_clk)
d80667642b0f43 Yannick Fertre      2025-08-22  2065  		clk_disable_unprepare(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  2066  
92a57b3fb500e2 Yannick Fertré      2019-09-06  2067  	pinctrl_pm_select_sleep_state(ddev->dev);
92a57b3fb500e2 Yannick Fertré      2019-09-06  2068  
35ab6cfbf21178 Yannick Fertré      2019-06-03  2069  	pm_runtime_enable(ddev->dev);
bdf31bcf3d84ef Philippe CORNU      2017-07-17  2070  
35ab6cfbf21178 Yannick Fertré      2019-06-03  2071  	return 0;
b759012c5fa761 Yannick Fertre      2017-04-14  2072  err:
b759012c5fa761 Yannick Fertre      2017-04-14  2073  	clk_disable_unprepare(ldev->pixel_clk);
b759012c5fa761 Yannick Fertre      2017-04-14  2074  
d80667642b0f43 Yannick Fertre      2025-08-22  2075  	if (ldev->bus_clk)
d80667642b0f43 Yannick Fertre      2025-08-22  2076  		clk_disable_unprepare(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  2077  
b759012c5fa761 Yannick Fertre      2017-04-14 @2078  	return ret;
b759012c5fa761 Yannick Fertre      2017-04-14  2079  }
b759012c5fa761 Yannick Fertre      2017-04-14  2080  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
