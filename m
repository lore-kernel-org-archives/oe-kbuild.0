Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A28205E17
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511375; cv=none; b=YuohXYIJy9G0uPDVqqzmIRtrMiqS3fMIegwbcQkbsP15WncpIBhoG8Ta0dqMdIRgyNmBEiXGszm8409EhrqQ+6PSAbuzUZ24LAjYHGisoFovrBvtYbAULH04y8Y56SOE1UTJnhd0MpoByQGIzvzmumY4S1aCyqZ+cgXzI9rekqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511375; c=relaxed/simple;
	bh=GWyTCVH+qE3Frrt0uxRDSp8LJsGY5pm+Y6fdnACmm7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3fOFayrgDbGlY+ljkOvh4f5ra5Fhb2e+YK3tFYNoJ10dy5k6Cik6BanU0q8vnYCcIem5O/rHX1rt4lEz/hEgCucByTzi6ETTwbY0zK/hMdD67jFmcrfXjX8JgwAB832iFAcZp1snyDmwmvBcLDK1KLGSr7Oe6/3tH7YKL6TTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt1n3boW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt1n3boW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511373; x=1768047373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GWyTCVH+qE3Frrt0uxRDSp8LJsGY5pm+Y6fdnACmm7s=;
  b=Qt1n3boWs2SqZ3sCVzPfgt/J8OcjD5a9pSRjgS2CwX64exzlN4SsnhVA
   3L5ijwFnpIg385r2D0keGW/nkByraT/YD0GsjXZiujsCyQyXn51XHOfC0
   RgywP+W4HKxQoQOS+/iEWuu/7sMSjCA1dPfOCLDZ6bLPjOy/LmiC1sZAC
   DbmdthTqUotET7iYPcWI0zfK1zhBKhqI2rHXbk2lzuLfiByUfvuy5fw2u
   FON3plO6rmSC2VZJkclJZQkwSz0JR9CSYLFLjEoNqinHXlfnNqMhI9xAl
   9uT7kxlgwoJvoLELzbmQ8EjFsjoI3iWlK/HLjPKX/RA4tVimOS9MTiPRR
   A==;
X-CSE-ConnectionGUID: WkdxjSZ1T/e4fOTts22RfQ==
X-CSE-MsgGUID: vcFI9yO1RJyD2YN5iO4jHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="24407849"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="24407849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:16:12 -0800
X-CSE-ConnectionGUID: Mk6akapnTQ2dpIGL53q2dg==
X-CSE-MsgGUID: 1VL4Ph7UR5C1HmuxZwl4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103603788"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jan 2025 04:16:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWDvs-000JCg-0N;
	Fri, 10 Jan 2025 12:16:08 +0000
Date: Fri, 10 Jan 2025 20:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Message-ID: <202501101919.vwVyD24s-lkp@intel.com>
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
In-Reply-To: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Liu Ying <victor.liu@nxp.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: dri-devel@lists.freedesktop.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-bridge-imx8qxp-pxl2dpi-Use-dev_err_probe/20250107-224125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250107143900.988567-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r073-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101919.vwVyD24s-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501101919.vwVyD24s-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:402 imx8qxp_pxl2dpi_bridge_probe() error: uninitialized symbol 'ret'.

vim +/ret +402 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

96988a526c97cf Liu Ying        2022-06-11  388  
96988a526c97cf Liu Ying        2022-06-11  389  static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
96988a526c97cf Liu Ying        2022-06-11  390  {
96988a526c97cf Liu Ying        2022-06-11  391  	struct imx8qxp_pxl2dpi *p2d;
96988a526c97cf Liu Ying        2022-06-11  392  	struct device *dev = &pdev->dev;
96988a526c97cf Liu Ying        2022-06-11  393  	struct device_node *np = dev->of_node;
96988a526c97cf Liu Ying        2022-06-11  394  	int ret;
96988a526c97cf Liu Ying        2022-06-11  395  
96988a526c97cf Liu Ying        2022-06-11  396  	p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
96988a526c97cf Liu Ying        2022-06-11  397  	if (!p2d)
96988a526c97cf Liu Ying        2022-06-11  398  		return -ENOMEM;
96988a526c97cf Liu Ying        2022-06-11  399  
96988a526c97cf Liu Ying        2022-06-11  400  	p2d->regmap = syscon_node_to_regmap(np->parent);
84004de3c9dc63 Alexander Stein 2025-01-07  401  	if (IS_ERR(p2d->regmap))
84004de3c9dc63 Alexander Stein 2025-01-07 @402  		return dev_err_probe(dev, ret, "failed to get regmap\n");
96988a526c97cf Liu Ying        2022-06-11  403  
96988a526c97cf Liu Ying        2022-06-11  404  	ret = imx_scu_get_handle(&p2d->ipc_handle);
84004de3c9dc63 Alexander Stein 2025-01-07  405  	if (ret)
84004de3c9dc63 Alexander Stein 2025-01-07  406  		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
96988a526c97cf Liu Ying        2022-06-11  407  
96988a526c97cf Liu Ying        2022-06-11  408  	p2d->dev = dev;
96988a526c97cf Liu Ying        2022-06-11  409  
96988a526c97cf Liu Ying        2022-06-11  410  	ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
96988a526c97cf Liu Ying        2022-06-11  411  	if (ret) {
96988a526c97cf Liu Ying        2022-06-11  412  		DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
96988a526c97cf Liu Ying        2022-06-11  413  		return ret;
96988a526c97cf Liu Ying        2022-06-11  414  	}
96988a526c97cf Liu Ying        2022-06-11  415  
96988a526c97cf Liu Ying        2022-06-11  416  	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
84004de3c9dc63 Alexander Stein 2025-01-07  417  	if (IS_ERR(p2d->next_bridge))
84004de3c9dc63 Alexander Stein 2025-01-07  418  		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
84004de3c9dc63 Alexander Stein 2025-01-07  419  				     "failed to find next bridge\n");
96988a526c97cf Liu Ying        2022-06-11  420  
96988a526c97cf Liu Ying        2022-06-11  421  	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
96988a526c97cf Liu Ying        2022-06-11  422  	if (ret)
96988a526c97cf Liu Ying        2022-06-11  423  		return ret;
96988a526c97cf Liu Ying        2022-06-11  424  
96988a526c97cf Liu Ying        2022-06-11  425  	ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
96988a526c97cf Liu Ying        2022-06-11  426  	if (ret)
96988a526c97cf Liu Ying        2022-06-11  427  		return ret;
96988a526c97cf Liu Ying        2022-06-11  428  
96988a526c97cf Liu Ying        2022-06-11  429  	platform_set_drvdata(pdev, p2d);
96988a526c97cf Liu Ying        2022-06-11  430  	pm_runtime_enable(dev);
96988a526c97cf Liu Ying        2022-06-11  431  
96988a526c97cf Liu Ying        2022-06-11  432  	p2d->bridge.driver_private = p2d;
96988a526c97cf Liu Ying        2022-06-11  433  	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
96988a526c97cf Liu Ying        2022-06-11  434  	p2d->bridge.of_node = np;
96988a526c97cf Liu Ying        2022-06-11  435  
96988a526c97cf Liu Ying        2022-06-11  436  	drm_bridge_add(&p2d->bridge);
96988a526c97cf Liu Ying        2022-06-11  437  
96988a526c97cf Liu Ying        2022-06-11  438  	return ret;
96988a526c97cf Liu Ying        2022-06-11  439  }
96988a526c97cf Liu Ying        2022-06-11  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
