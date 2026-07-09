Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790A344029
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 23:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783638612; cv=none; b=LAaH1n2yExHuKfeTEDg4LKYPkz44XLrJtai5a9zWuFXOdiABtqqFIOIUmnJbmu4nLGXHgdN4CWh/IfDoGOPiR/Jm6LB7LIUcdNspSegg1X//7HvoYYxVAVZDdu1qs6pZaqNXKUtXJKqXWHnSF76uCpF/XsuHOOpR4CRMIzPTK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783638612; c=relaxed/simple;
	bh=UYr50x6mb03EZajfs7LZFt8NLW4cOFjxMFqkQWsfwI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BuzpFW106dxBpGBM2oKUp9jV9wzRwJoAQZFdCRLsmIeinUXMgnu4JOK6e9xkR0V073w66OpfJT+TWPS4z4RS3yYqliCsN3yR3Zwi7hpQI7LPzfl+BIUoyEVk349iUv/cCniIq5fOe6qqv1LUbXbCUCSn5OebKrDnE9JYR6nua2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FO6uHYhq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FO6uHYhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783638610; x=1815174610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UYr50x6mb03EZajfs7LZFt8NLW4cOFjxMFqkQWsfwI0=;
  b=FO6uHYhq2cAmBapfZiqSlk4IwnhneP09gtK81kMtY4z0xs/3UUKdoXxr
   3gHV47aCxTnGt7VtktoL/gxUwWdAoLh01/FVhvbI9k/fRLBXs/p977CCq
   kKI14cflwmL4GDmXWTMwjBFaDNbA64oLJ5smJoCS+C7Evxc88RlYEts9F
   EW9PQU2UEJlyY3ahwsv6uOPW+atKxnFblfivZ7dHS66dmJY5mfGQlYqwY
   QZTj5op0ajhZ32PwPDajQ7kU6hLZ8BRlJ6VhR+ONngO/p8P0x7toyrPa1
   ebkEvDvXBC3Hjw5LZPrKZ+u8ywB5YF5OuQZeFPVKdY5oPM0NG5BSMGMOT
   Q==;
X-CSE-ConnectionGUID: 9V5e9xZOT0ecwrf/MPvXug==
X-CSE-MsgGUID: 5GxoQqBNRMCQ4OZlwyGewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84358988"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84358988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 16:10:08 -0700
X-CSE-ConnectionGUID: XGorls6TT+a1mh8b8laRXQ==
X-CSE-MsgGUID: ult43KzUTR6JoQQpHhA1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258609739"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 16:10:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whxsZ-00000000IE1-3LfM;
	Thu, 09 Jul 2026 23:10:03 +0000
Date: Fri, 10 Jul 2026 07:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/stm/ltdc.c:2078 ltdc_load() warn:
 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1948.
Message-ID: <202607100649.dwynnTu6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yannick Fertre <yannick.fertre@foss.st.com>
CC: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: d80667642b0f43580efd489d627dd24aa10ab98f drm/stm: ltdc: support new=
 hardware version for STM32MP25 SoC
date:   11 months ago
:::::: branch date: 3 days ago
:::::: commit date: 11 months ago
config: microblaze-randconfig-r071-20260710 (https://download.01.org/0day-c=
i/archive/20260710/202607100649.dwynnTu6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d80667642b0f ("drm/stm: ltdc: support new hardware version for STM=
32MP25 SoC")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607100649.dwynnTu6-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:2078 ltdc_load() warn: 'ldev->pixel_clk' from cl=
k_prepare_enable() not released on lines: 1948.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:939 ltdc_crtc_mode_set_nofb() warn: pm_runtime_g=
et_sync() also returns 1 on success
drivers/gpu/drm/stm/ltdc.c:1903 ltdc_resume() warn: 'ldev->pixel_clk' from =
clk_prepare_enable() not released on lines: 1903.

vim +2078 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1905 =20
b759012c5fa761 Yannick Fertre      2017-04-14  1906  int ltdc_load(struct d=
rm_device *ddev)
b759012c5fa761 Yannick Fertre      2017-04-14  1907  {
b759012c5fa761 Yannick Fertre      2017-04-14  1908  	struct platform_devic=
e *pdev =3D to_platform_device(ddev->dev);
b759012c5fa761 Yannick Fertre      2017-04-14  1909  	struct ltdc_device *l=
dev =3D ddev->dev_private;
b759012c5fa761 Yannick Fertre      2017-04-14  1910  	struct device *dev =
=3D ddev->dev;
b759012c5fa761 Yannick Fertre      2017-04-14  1911  	struct device_node *n=
p =3D dev->of_node;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1912  	struct drm_bridge *br=
idge;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1913  	struct drm_panel *pan=
el;
b759012c5fa761 Yannick Fertre      2017-04-14  1914  	struct drm_crtc *crtc;
b759012c5fa761 Yannick Fertre      2017-04-14  1915  	struct reset_control =
*rstc;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1916  	int irq, i, nb_endpoi=
nts;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1917  	int ret =3D -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1918 =20
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1919  	drm_dbg_driver(ddev, =
"\n");
b759012c5fa761 Yannick Fertre      2017-04-14  1920 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1921  	/* Get number of endp=
oints */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1922  	nb_endpoints =3D of_g=
raph_get_endpoint_count(np);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1923  	if (!nb_endpoints)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1924  		return -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1925 =20
b759012c5fa761 Yannick Fertre      2017-04-14  1926  	ldev->pixel_clk =3D d=
evm_clk_get(dev, "lcd");
b759012c5fa761 Yannick Fertre      2017-04-14  1927  	if (IS_ERR(ldev->pixe=
l_clk)) {
1f358bc6f272b9 Fabien Dessenne     2019-04-24  1928  		if (PTR_ERR(ldev->pi=
xel_clk) !=3D -EPROBE_DEFER)
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1929  			drm_err(ddev, "Unab=
le to get lcd clock\n");
1f358bc6f272b9 Fabien Dessenne     2019-04-24  1930  		return PTR_ERR(ldev-=
>pixel_clk);
b759012c5fa761 Yannick Fertre      2017-04-14  1931  	}
b759012c5fa761 Yannick Fertre      2017-04-14  1932 =20
b759012c5fa761 Yannick Fertre      2017-04-14  1933  	if (clk_prepare_enabl=
e(ldev->pixel_clk)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1934  		drm_err(ddev, "Unabl=
e to prepare pixel clock\n");
b759012c5fa761 Yannick Fertre      2017-04-14  1935  		return -ENODEV;
b759012c5fa761 Yannick Fertre      2017-04-14  1936  	}
b759012c5fa761 Yannick Fertre      2017-04-14  1937 =20
d80667642b0f43 Yannick Fertre      2025-08-22  1938  	if (of_device_is_comp=
atible(np, "st,stm32mp251-ltdc") ||
d80667642b0f43 Yannick Fertre      2025-08-22  1939  	    of_device_is_comp=
atible(np, "st,stm32mp255-ltdc")) {
d80667642b0f43 Yannick Fertre      2025-08-22  1940  		ldev->bus_clk =3D de=
vm_clk_get(dev, "bus");
d80667642b0f43 Yannick Fertre      2025-08-22  1941  		if (IS_ERR(ldev->bus=
_clk))
d80667642b0f43 Yannick Fertre      2025-08-22  1942  			return dev_err_prob=
e(dev, PTR_ERR(ldev->bus_clk),
d80667642b0f43 Yannick Fertre      2025-08-22  1943  					     "Unable to g=
et bus clock\n");
d80667642b0f43 Yannick Fertre      2025-08-22  1944 =20
d80667642b0f43 Yannick Fertre      2025-08-22  1945  		ret =3D clk_prepare_=
enable(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  1946  		if (ret) {
d80667642b0f43 Yannick Fertre      2025-08-22  1947  			drm_err(ddev, "Unab=
le to prepare bus clock\n");
d80667642b0f43 Yannick Fertre      2025-08-22  1948  			return ret;
d80667642b0f43 Yannick Fertre      2025-08-22  1949  		}
d80667642b0f43 Yannick Fertre      2025-08-22  1950  	}
d80667642b0f43 Yannick Fertre      2025-08-22  1951 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1952  	/* Get endpoints if a=
ny */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1953  	for (i =3D 0; i < nb_=
endpoints; i++) {
b430ff7ef8b016 Yannick Fertre      2020-02-28  1954  		ret =3D drm_of_find_=
panel_or_bridge(np, 0, i, &panel, &bridge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1955 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1956  		/*
b430ff7ef8b016 Yannick Fertre      2020-02-28  1957  		 * If at least one e=
ndpoint is -ENODEV, continue probing,
b430ff7ef8b016 Yannick Fertre      2020-02-28  1958  		 * else if at least =
one endpoint returned an error
b430ff7ef8b016 Yannick Fertre      2020-02-28  1959  		 * (ie -EPROBE_DEFER=
) then stop probing.
b430ff7ef8b016 Yannick Fertre      2020-02-28  1960  		 */
b430ff7ef8b016 Yannick Fertre      2020-02-28  1961  		if (ret =3D=3D -ENOD=
EV)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1962  			continue;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1963  		else if (ret)
b430ff7ef8b016 Yannick Fertre      2020-02-28  1964  			goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1965 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1966  		if (panel) {
19dd9780b7ac67 Katya Orlova        2024-02-16  1967  			bridge =3D drmm_pan=
el_bridge_add(ddev, panel);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1968  			if (IS_ERR(bridge))=
 {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1969  				drm_err(ddev, "pan=
el-bridge endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1970  				ret =3D PTR_ERR(br=
idge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1971  				goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1972  			}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1973  		}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1974 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1975  		if (bridge) {
b430ff7ef8b016 Yannick Fertre      2020-02-28  1976  			ret =3D ltdc_encode=
r_init(ddev, bridge);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1977  			if (ret) {
648ce7fd186cfb Jagan Teki          2021-07-04  1978  				if (ret !=3D -EPRO=
BE_DEFER)
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1979  					drm_err(ddev, "in=
it encoder endpoint %d\n", i);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1980  				goto err;
b430ff7ef8b016 Yannick Fertre      2020-02-28  1981  			}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1982  		}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1983  	}
b430ff7ef8b016 Yannick Fertre      2020-02-28  1984 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1985  	rstc =3D devm_reset_c=
ontrol_get_exclusive(dev, NULL);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1986 =20
b430ff7ef8b016 Yannick Fertre      2020-02-28  1987  	mutex_init(&ldev->err=
_lock);
b430ff7ef8b016 Yannick Fertre      2020-02-28  1988 =20
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1989  	if (!IS_ERR(rstc=
)) {
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1990  		reset_control_a=
ssert(rstc);
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1991  		usleep_range(10=
, 20);
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1992  		reset_control_d=
eassert(rstc);
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1993  	}
f42f540b9d0c16 Yannick Fertr=C3=A9      2019-04-03  1994 =20
50cc9a322b5f4f Anusha Srivatsa     2025-02-25  1995  	ldev->regs =3D devm_p=
latform_ioremap_resource(pdev, 0);
b759012c5fa761 Yannick Fertre      2017-04-14  1996  	if (IS_ERR(ldev->regs=
)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1997  		drm_err(ddev, "Unabl=
e to get ltdc registers\n");
cea3a330ee20e9 Philippe CORNU      2017-07-17  1998  		ret =3D PTR_ERR(ldev=
->regs);
cea3a330ee20e9 Philippe CORNU      2017-07-17  1999  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2000  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2001 =20
734c26450aefaa Yannick Fertre      2021-12-15  2002  	ldev->regmap =3D devm=
_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
734c26450aefaa Yannick Fertre      2021-12-15  2003  	if (IS_ERR(ldev->regm=
ap)) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2004  		drm_err(ddev, "Unabl=
e to regmap ltdc registers\n");
734c26450aefaa Yannick Fertre      2021-12-15  2005  		ret =3D PTR_ERR(ldev=
->regmap);
734c26450aefaa Yannick Fertre      2021-12-15  2006  		goto err;
734c26450aefaa Yannick Fertre      2021-12-15  2007  	}
734c26450aefaa Yannick Fertre      2021-12-15  2008 =20
544aa6cefb24d7 Yannick Fertre      2020-01-21  2009  	ret =3D ltdc_get_caps=
(ddev);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2010  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2011  		drm_err(ddev, "hardw=
are identifier (0x%08x) not supported!\n",
544aa6cefb24d7 Yannick Fertre      2020-01-21  2012  			ldev->caps.hw_versi=
on);
9e759fc7dcd6d4 Fabien Dessenne     2019-04-24  2013  		goto err;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2014  	}
9e759fc7dcd6d4 Fabien Dessenne     2019-04-24  2015 =20
ef824286128edd Yannick Fertre      2024-07-12  2016  	/* Disable all interr=
upts */
ef824286128edd Yannick Fertre      2024-07-12  2017  	regmap_clear_bits(lde=
v->regmap, LTDC_IER, IER_MASK);
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2018 =20
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2019  	drm_dbg_driver(ddev, =
"ltdc hw version 0x%08x\n", ldev->caps.hw_version);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2020 =20
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2021  	/* initialize default=
 value for fifo underrun threshold & clear interrupt error counters */
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2022  	ldev->transfer_err =
=3D 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2023  	ldev->fifo_err =3D 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2024  	ldev->fifo_warn =3D 0;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2025  	ldev->fifo_threshold =
=3D FUT_DFT;
7d008eecb0cfc2 Yannick Fertre      2022-06-03  2026 =20
544aa6cefb24d7 Yannick Fertre      2020-01-21  2027  	for (i =3D 0; i < lde=
v->caps.nb_irq; i++) {
544aa6cefb24d7 Yannick Fertre      2020-01-21  2028  		irq =3D platform_get=
_irq(pdev, i);
544aa6cefb24d7 Yannick Fertre      2020-01-21  2029  		if (irq < 0) {
544aa6cefb24d7 Yannick Fertre      2020-01-21  2030  			ret =3D irq;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2031  			goto err;
544aa6cefb24d7 Yannick Fertre      2020-01-21  2032  		}
b759012c5fa761 Yannick Fertre      2017-04-14  2033 =20
b759012c5fa761 Yannick Fertre      2017-04-14  2034  		ret =3D devm_request=
_threaded_irq(dev, irq, ltdc_irq,
b759012c5fa761 Yannick Fertre      2017-04-14  2035  						ltdc_irq_thread,=
 IRQF_ONESHOT,
b759012c5fa761 Yannick Fertre      2017-04-14  2036  						dev_name(dev), d=
dev);
b759012c5fa761 Yannick Fertre      2017-04-14  2037  		if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2038  			drm_err(ddev, "Fail=
ed to register LTDC interrupt\n");
cea3a330ee20e9 Philippe CORNU      2017-07-17  2039  			goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2040  		}
c188d7ebbebd0b Philippe CORNU      2017-10-26  2041  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2042 =20
19dd9780b7ac67 Katya Orlova        2024-02-16  2043  	crtc =3D drmm_kzalloc=
(ddev, sizeof(*crtc), GFP_KERNEL);
b759012c5fa761 Yannick Fertre      2017-04-14  2044  	if (!crtc) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2045  		drm_err(ddev, "Faile=
d to allocate crtc\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2046  		ret =3D -ENOMEM;
b759012c5fa761 Yannick Fertre      2017-04-14  2047  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2048  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2049 =20
b759012c5fa761 Yannick Fertre      2017-04-14  2050  	ret =3D ltdc_crtc_ini=
t(ddev, crtc);
b759012c5fa761 Yannick Fertre      2017-04-14  2051  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2052  		drm_err(ddev, "Faile=
d to init crtc\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2053  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2054  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2055 =20
b759012c5fa761 Yannick Fertre      2017-04-14  2056  	ret =3D drm_vblank_in=
it(ddev, NB_CRTC);
b759012c5fa761 Yannick Fertre      2017-04-14  2057  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  2058  		drm_err(ddev, "Faile=
d calling drm_vblank_init()\n");
b759012c5fa761 Yannick Fertre      2017-04-14  2059  		goto err;
b759012c5fa761 Yannick Fertre      2017-04-14  2060  	}
b759012c5fa761 Yannick Fertre      2017-04-14  2061 =20
35ab6cfbf21178 Yannick Fertr=C3=A9      2019-06-03  2062  	clk_disable_unpr=
epare(ldev->pixel_clk);
35ab6cfbf21178 Yannick Fertr=C3=A9      2019-06-03  2063 =20
d80667642b0f43 Yannick Fertre      2025-08-22  2064  	if (ldev->bus_clk)
d80667642b0f43 Yannick Fertre      2025-08-22  2065  		clk_disable_unprepar=
e(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  2066 =20
92a57b3fb500e2 Yannick Fertr=C3=A9      2019-09-06  2067  	pinctrl_pm_selec=
t_sleep_state(ddev->dev);
92a57b3fb500e2 Yannick Fertr=C3=A9      2019-09-06  2068 =20
35ab6cfbf21178 Yannick Fertr=C3=A9      2019-06-03  2069  	pm_runtime_enabl=
e(ddev->dev);
bdf31bcf3d84ef Philippe CORNU      2017-07-17  2070 =20
35ab6cfbf21178 Yannick Fertr=C3=A9      2019-06-03  2071  	return 0;
b759012c5fa761 Yannick Fertre      2017-04-14  2072  err:
b759012c5fa761 Yannick Fertre      2017-04-14  2073  	clk_disable_unprepare=
(ldev->pixel_clk);
b759012c5fa761 Yannick Fertre      2017-04-14  2074 =20
d80667642b0f43 Yannick Fertre      2025-08-22  2075  	if (ldev->bus_clk)
d80667642b0f43 Yannick Fertre      2025-08-22  2076  		clk_disable_unprepar=
e(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  2077 =20
b759012c5fa761 Yannick Fertre      2017-04-14 @2078  	return ret;
b759012c5fa761 Yannick Fertre      2017-04-14  2079  }
b759012c5fa761 Yannick Fertre      2017-04-14  2080 =20

:::::: The code at line 2078 was first introduced by commit
:::::: b759012c5fa761ee08998c80fc4ad6343c258487 drm/stm: Add STM32 LTDC dri=
ver

:::::: TO: Yannick Fertre <yannick.fertre@st.com>
:::::: CC: Eric Anholt <eric@anholt.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
