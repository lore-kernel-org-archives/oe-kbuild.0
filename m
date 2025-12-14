Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785315746F
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765681063; cv=none; b=bMWsSpY6mfhhqfPB6LDCuuHGa/FRrLEFXRiLa+Qc/E8kBGZV5vYzpngJwenlmkPslzvV3mRaltmMyWzG8X2meydjI8ZHAY3Rs9Xf8cWwljzHgu4eCuvLS59NEI7CmymvS5riAddfWULaJxl2+2qeRiQXvl/J+p0M4BShwVtsfow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765681063; c=relaxed/simple;
	bh=Td52bjpvXxTDpBQFYYvMPW7J7TaN77HD0bew7wsTq8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHy3kGbantZCkwJ/o0ghDY/fQejMT43icW5avGZ/Cwgq3IDQKdDYaOaSHefrD2aqf+5e2LKl192uvIVANwc2KbOgCPB5cDdnp3gc9vJPqUxH8EhS571hFDXgRNgYknEv8v/lD+hn5WoKdZymFg3zVQ0drW7HSwBnM9Q/wPtFuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wwti/IU/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wwti/IU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765681062; x=1797217062;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Td52bjpvXxTDpBQFYYvMPW7J7TaN77HD0bew7wsTq8M=;
  b=Wwti/IU/JYE8DLC6lHsSuBany56dV8GOiWUEAl6aDbcoignbruD+Cq9m
   GaGG8ecV4wkeENJ3VvdNyCAcaG2rom7dI2m2fh2CYtkL1/e+4b8qorDK2
   7oaaGcGyWSicPMPWE6OOuPtxwxQAL2WPC1rkboyqtX4izrORR0HLL6usa
   1J5z8V8xbF9DO43zrrKk4cTp5emqepGBo9cT5LCC5YiNOsYub1gL07Ea2
   /sqbO/7KtRqNeKo8K0n18zBk23C6JNGvzHz99l39ihR20lFf+piQJk8so
   d2a43Nw+bFIOUdpibIQ0a6ldoKoY8SW+ZVttnrzWTuWt6+pmhAraj9c2F
   w==;
X-CSE-ConnectionGUID: hJGH39OGT5GTFTSxqH7J6w==
X-CSE-MsgGUID: L71TnNkzRLGwNLKb7ZrT6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67379636"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67379636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:57:42 -0800
X-CSE-ConnectionGUID: CBAleXX0QMmdGhKdYBV9yA==
X-CSE-MsgGUID: eRGULubxQ5yi8XuIEiJi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197187806"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 18:57:41 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUcIk-000000008UJ-0sqU;
	Sun, 14 Dec 2025 02:57:38 +0000
Date: Sun, 14 Dec 2025 10:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/stm/ltdc.c:1919 ltdc_resume() warn: 'ldev->bus_clk'
 from clk_prepare_enable() not released on lines: 1919.
Message-ID: <202512141021.BQJ7qXik-lkp@intel.com>
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
commit: b7243862f82a088d6fb7e22a25c7c024818e631d drm/stm: ltdc: handle lvds pixel clock
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141021.BQJ7qXik-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141021.BQJ7qXik-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1919 ltdc_resume() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 1919.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:945 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success
drivers/gpu/drm/stm/ltdc.c:1919 ltdc_resume() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1909,1919.
drivers/gpu/drm/stm/ltdc.c:2098 ltdc_load() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 2098.
drivers/gpu/drm/stm/ltdc.c:2098 ltdc_load() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1964.

vim +1919 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertré      2019-03-21  1891  
df61c776657fa5 Yannick Fertré      2019-03-21  1892  int ltdc_resume(struct drm_device *ddev)
df61c776657fa5 Yannick Fertré      2019-03-21  1893  {
df61c776657fa5 Yannick Fertré      2019-03-21  1894  	struct ltdc_device *ldev = ddev->dev_private;
df61c776657fa5 Yannick Fertré      2019-03-21  1895  	int ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1896  
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1897  	drm_dbg_driver(ddev, "\n");
df61c776657fa5 Yannick Fertré      2019-03-21  1898  
df61c776657fa5 Yannick Fertré      2019-03-21  1899  	ret = clk_prepare_enable(ldev->pixel_clk);
df61c776657fa5 Yannick Fertré      2019-03-21  1900  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1901  		drm_err(ddev, "failed to enable pixel clock (%d)\n", ret);
df61c776657fa5 Yannick Fertré      2019-03-21  1902  		return ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1903  	}
df61c776657fa5 Yannick Fertré      2019-03-21  1904  
d80667642b0f43 Yannick Fertre      2025-08-22  1905  	if (ldev->bus_clk) {
d80667642b0f43 Yannick Fertre      2025-08-22  1906  		ret = clk_prepare_enable(ldev->bus_clk);
b7243862f82a08 Yannick Fertre      2025-08-22  1907  		if (ret) {
d80667642b0f43 Yannick Fertre      2025-08-22  1908  			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
b7243862f82a08 Yannick Fertre      2025-08-22  1909  			return ret;
b7243862f82a08 Yannick Fertre      2025-08-22  1910  		}
b7243862f82a08 Yannick Fertre      2025-08-22  1911  	}
b7243862f82a08 Yannick Fertre      2025-08-22  1912  
b7243862f82a08 Yannick Fertre      2025-08-22  1913  	if (ldev->lvds_clk) {
b7243862f82a08 Yannick Fertre      2025-08-22  1914  		ret = clk_prepare_enable(ldev->lvds_clk);
b7243862f82a08 Yannick Fertre      2025-08-22  1915  		if (ret)
b7243862f82a08 Yannick Fertre      2025-08-22  1916  			drm_err(ddev, "failed to prepare lvds clock\n");
d80667642b0f43 Yannick Fertre      2025-08-22  1917  	}
d80667642b0f43 Yannick Fertre      2025-08-22  1918  
d80667642b0f43 Yannick Fertre      2025-08-22 @1919  	return ret;
df61c776657fa5 Yannick Fertré      2019-03-21  1920  }
df61c776657fa5 Yannick Fertré      2019-03-21  1921  

:::::: The code at line 1919 was first introduced by commit
:::::: d80667642b0f43580efd489d627dd24aa10ab98f drm/stm: ltdc: support new hardware version for STM32MP25 SoC

:::::: TO: Yannick Fertre <yannick.fertre@foss.st.com>
:::::: CC: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
