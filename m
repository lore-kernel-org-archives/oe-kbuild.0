Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4CD81720
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756069437; cv=none; b=PWzk21iK1GZsZKX0S46R0aaOl/+uwhvuSeplZ3X7AUgoovvnvD+xU23Vl7P8rGfkq7WPHDOsVrgcENLWMbpgNpOkU3nnx7XzTpyF+TL8LqTGGoT1lFvrLtSNKdIe6utiOI+klg/jUq13XRTts6dOPrCHJKlxD/Q6k40+Ww7ulqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756069437; c=relaxed/simple;
	bh=6nySE6dhhimXiRGWe2t4DhJ012TC0ez22Bo1pA4d3MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiyrYdvEQtCuFbcEZUnNSLSCzqqff9JrbbfZtfb3l+e5oLziPvoX8Gidz8LfvYmopHLuQVuLnWROojCYzLin0fca1PnfCJNi6r17foJqXOOo26wx1NBdFIT3nRhqOll6UFxcqi2fNKN2pgES32g9hzLkfB3e1YK1Qhm5sueyAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLcpd/Xr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLcpd/Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756069435; x=1787605435;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6nySE6dhhimXiRGWe2t4DhJ012TC0ez22Bo1pA4d3MY=;
  b=iLcpd/Xr8Y7hc3S+YCZ1gQhg5LzjQqE0AGBiEDMK3uBTJBtLGzQLbGdX
   M8zDwIn6+hgVryjbpwtDDgTaH9p92BfLZB63f3TFe5fgigCRBxlNLe51s
   uMhE0sn48hmr42PppW3yP7grV0Z53VzK8mb2za7NESN66ogj48HjsjiiT
   6MDKktZoC4yuBalnCxO/rvdimfV4y3wvf4MVTiciSfNvV0hzgqoRzHxw/
   NWd3aKw74L1QctyfsUyf57VSmQU5Gg7stAJ3wIxY4n6y1aaoSNDlgoPkg
   SF5QYEtRayrpCJwp92b2eWKiXoG76757kwurs4crDJNU8gP0SD61fQs+m
   g==;
X-CSE-ConnectionGUID: RE4za8goQua9+kTGErTy6A==
X-CSE-MsgGUID: nGqBDkI7QC6XDfWm7hTrZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58429652"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58429652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 14:03:55 -0700
X-CSE-ConnectionGUID: 3uXau6DRSL2x28yI46f8jw==
X-CSE-MsgGUID: XVvg3eA9TZeLOB6WJh0LCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173542851"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2025 14:03:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqHsL-000NDP-0H;
	Sun, 24 Aug 2025 21:03:45 +0000
Date: Mon, 25 Aug 2025 05:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 08/13] drm/stm: ltdc: handle lvds pixel clock
Message-ID: <202508250449.oAIDCFbM-lkp@intel.com>
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
In-Reply-To: <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
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
patch link:    https://lore.kernel.org/r/20250822-drm-misc-next-v5-8-9c825e28f733%40foss.st.com
patch subject: [PATCH v5 08/13] drm/stm: ltdc: handle lvds pixel clock
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250449.oAIDCFbM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508250449.oAIDCFbM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1918 ltdc_resume() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 1918.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:944 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success
drivers/gpu/drm/stm/ltdc.c:1918 ltdc_resume() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1908,1918.
drivers/gpu/drm/stm/ltdc.c:2097 ltdc_load() warn: 'ldev->bus_clk' from clk_prepare_enable() not released on lines: 2097.
drivers/gpu/drm/stm/ltdc.c:2097 ltdc_load() warn: 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1963.

vim +1918 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertré 2019-03-21  1890  
df61c776657fa5 Yannick Fertré 2019-03-21  1891  int ltdc_resume(struct drm_device *ddev)
df61c776657fa5 Yannick Fertré 2019-03-21  1892  {
df61c776657fa5 Yannick Fertré 2019-03-21  1893  	struct ltdc_device *ldev = ddev->dev_private;
df61c776657fa5 Yannick Fertré 2019-03-21  1894  	int ret;
df61c776657fa5 Yannick Fertré 2019-03-21  1895  
df61c776657fa5 Yannick Fertré 2019-03-21  1896  	DRM_DEBUG_DRIVER("\n");
df61c776657fa5 Yannick Fertré 2019-03-21  1897  
df61c776657fa5 Yannick Fertré 2019-03-21  1898  	ret = clk_prepare_enable(ldev->pixel_clk);
df61c776657fa5 Yannick Fertré 2019-03-21  1899  	if (ret) {
df61c776657fa5 Yannick Fertré 2019-03-21  1900  		DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
df61c776657fa5 Yannick Fertré 2019-03-21  1901  		return ret;
df61c776657fa5 Yannick Fertré 2019-03-21  1902  	}
df61c776657fa5 Yannick Fertré 2019-03-21  1903  
4bc19104512f12 Yannick Fertre 2025-08-22  1904  	if (ldev->bus_clk) {
4bc19104512f12 Yannick Fertre 2025-08-22  1905  		ret = clk_prepare_enable(ldev->bus_clk);
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1906  		if (ret) {
4bc19104512f12 Yannick Fertre 2025-08-22  1907  			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1908  			return ret;
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1909  		}
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1910  	}
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1911  
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1912  	if (ldev->lvds_clk) {
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1913  		ret = clk_prepare_enable(ldev->lvds_clk);
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1914  		if (ret)
8ed2dad23c5fb4 Yannick Fertre 2025-08-22  1915  			drm_err(ddev, "failed to prepare lvds clock\n");
4bc19104512f12 Yannick Fertre 2025-08-22  1916  	}
4bc19104512f12 Yannick Fertre 2025-08-22  1917  
4bc19104512f12 Yannick Fertre 2025-08-22 @1918  	return ret;
df61c776657fa5 Yannick Fertré 2019-03-21  1919  }
df61c776657fa5 Yannick Fertré 2019-03-21  1920  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
