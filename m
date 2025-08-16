Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC771F8724
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755324532; cv=none; b=QCE2pS/ZlPEXuEGxgSRCEPhszsH629k7NykanwPtVX/lZgroHjLWVd3HHMXWUXdLXegdFTGBxV5jUhxCL68KDv1n39UwCmtovZT31uO+Nil0g3Qoo5WSxhHdFhXDyQF0u/sBammG8ott8IsqQz//RmlwWYuYzC/r7ZCCb23yzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755324532; c=relaxed/simple;
	bh=7sXlRacyYltM3VKhICWjGg9o06DfmUEMQRHJ+QJAqE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1TxTY2QEsFdbw4D5C1gNW0XCGr1Sohs7sKfVDggKKN+a75RyOQ+XhSkdSCZ+xczlE1O9fNFeM7NDn2slLGQ7Wi8x4nsZBjR7OQ6wZtCC3vM+FRU9WhI8xkA4su0C/L6OOnSGp8Vqj6W0JdLaey8C+rN+exxPpLhSCS0UUMFZPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhMbErcy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhMbErcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755324530; x=1786860530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7sXlRacyYltM3VKhICWjGg9o06DfmUEMQRHJ+QJAqE4=;
  b=BhMbErcyXti5gAmyjNVjxOSaWGDU9Y14PzTxlkZPUMd2PoXFV7mpGBIh
   BklkQV8OaLLeq+1vmsKWgk1cwqxOW4foNB+Vxe5TWvyqWOPVMVVMMppXQ
   1sxnO05Ml5rXd6lNZH4f/ObbPFt1qvEdbuuq3PsfJUvFoO0/Zw4KFEqJI
   9vthb71c/+6OSra0Go8ggZ8ARfc6bomPNwnMX/6pW9VPsMstx+jn273TK
   +JGKJNCRqB6TVt16aGd59wyNyZ8n42zOTsjEKJYvq4w/DreQI12BnV6AT
   UkTv3sfTqW/3DsBJCDmHQayPctJPtsVyCnNegavuSftzk4LAgmadcMa7v
   w==;
X-CSE-ConnectionGUID: VHLSW8OZQ6GrRGs6fFJztQ==
X-CSE-MsgGUID: 8n37pF9QT2qZx1UA3WbGzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57706086"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57706086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 23:08:49 -0700
X-CSE-ConnectionGUID: I8G3FFRESU+lQqRPJkMhlA==
X-CSE-MsgGUID: EY0Yi2A+So+uAqZFAnclvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198019138"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2025 23:08:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unA5u-000CdC-0q;
	Sat, 16 Aug 2025 06:08:46 +0000
Date: Sat, 16 Aug 2025 14:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <202508161345.sfsLHzY7-lkp@intel.com>
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
In-Reply-To: <20250814104753.195255-14-damon.ding@rock-chips.com>
References: <20250814104753.195255-14-damon.ding@rock-chips.com>
TO: Damon Ding <damon.ding@rock-chips.com>
TO: andrzej.hajda@intel.com
TO: neil.armstrong@linaro.org
TO: rfoss@kernel.org
CC: Laurent.pinchart@ideasonboard.com
CC: jonas@kwiboo.se
CC: jernej.skrabec@gmail.com
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: jingoohan1@gmail.com
CC: inki.dae@samsung.com
CC: sw0312.kim@samsung.com
CC: kyungmin.park@samsung.com
CC: krzk@kernel.org
CC: alim.akhtar@samsung.com
CC: hjc@rock-chips.com
CC: heiko@sntech.de
CC: andy.yan@rock-chips.com
CC: dmitry.baryshkov@oss.qualcomm.com
CC: l.stach@pengutronix.de
CC: dianders@chromium.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: Damon Ding <damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on rockchip/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-14-damon.ding%40rock-chips.com
patch subject: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508161345.sfsLHzY7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508161345.sfsLHzY7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1595 analogix_dp_bind() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1595 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

f37952339cc234e Lucas Stach      2024-06-19  1559  
152cce0006abf7e Marek Szyprowski 2020-03-10  1560  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
152cce0006abf7e Marek Szyprowski 2020-03-10  1561  {
41dc71b87962d41 Damon Ding       2025-08-14  1562  	struct drm_bridge *bridge = &dp->bridge;
152cce0006abf7e Marek Szyprowski 2020-03-10  1563  	int ret;
152cce0006abf7e Marek Szyprowski 2020-03-10  1564  
3424e3a4f844c0a Yakir Yang       2016-03-29  1565  	dp->drm_dev = drm_dev;
3424e3a4f844c0a Yakir Yang       2016-03-29  1566  	dp->encoder = dp->plat_data->encoder;
3424e3a4f844c0a Yakir Yang       2016-03-29  1567  
6cba3fe433415b2 Lyude Paul       2021-04-23  1568  	dp->aux.drm_dev = drm_dev;
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1569  
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1570  	ret = drm_dp_aux_register(&dp->aux);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1571  	if (ret) {
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1572  		DRM_ERROR("failed to register AUX (%d)\n", ret);
c71db051142a74b Damon Ding       2025-03-10  1573  		return ret;
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1574  	}
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1575  
41dc71b87962d41 Damon Ding       2025-08-14  1576  	bridge->ops = DRM_BRIDGE_OP_DETECT |
41dc71b87962d41 Damon Ding       2025-08-14  1577  		      DRM_BRIDGE_OP_EDID |
41dc71b87962d41 Damon Ding       2025-08-14  1578  		      DRM_BRIDGE_OP_MODES;
41dc71b87962d41 Damon Ding       2025-08-14  1579  	bridge->of_node = dp->dev->of_node;
41dc71b87962d41 Damon Ding       2025-08-14  1580  	bridge->type = DRM_MODE_CONNECTOR_eDP;
41dc71b87962d41 Damon Ding       2025-08-14  1581  	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
41dc71b87962d41 Damon Ding       2025-08-14  1582  	if (ret)
41dc71b87962d41 Damon Ding       2025-08-14  1583  		goto err_unregister_aux;
41dc71b87962d41 Damon Ding       2025-08-14  1584  
41dc71b87962d41 Damon Ding       2025-08-14  1585  	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
3424e3a4f844c0a Yakir Yang       2016-03-29  1586  	if (ret) {
3424e3a4f844c0a Yakir Yang       2016-03-29  1587  		DRM_ERROR("failed to create bridge (%d)\n", ret);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1588  		goto err_unregister_aux;
3424e3a4f844c0a Yakir Yang       2016-03-29  1589  	}
3424e3a4f844c0a Yakir Yang       2016-03-29  1590  
dbd8040a6d0dedc Damon Ding       2025-08-14  1591  	if (dp->plat_data->panel) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1592  		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
dbd8040a6d0dedc Damon Ding       2025-08-14  1593  								       dp->plat_data->panel);
dbd8040a6d0dedc Damon Ding       2025-08-14  1594  		if (IS_ERR(dp->plat_data->next_bridge)) {
dbd8040a6d0dedc Damon Ding       2025-08-14 @1595  			ret = PTR_ERR(bridge);
dbd8040a6d0dedc Damon Ding       2025-08-14  1596  			goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1597  		}
dbd8040a6d0dedc Damon Ding       2025-08-14  1598  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1599  
dbd8040a6d0dedc Damon Ding       2025-08-14  1600  	ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
dbd8040a6d0dedc Damon Ding       2025-08-14  1601  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
dbd8040a6d0dedc Damon Ding       2025-08-14  1602  	if (ret) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1603  		dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
dbd8040a6d0dedc Damon Ding       2025-08-14  1604  		goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1605  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1606  
152cce0006abf7e Marek Szyprowski 2020-03-10  1607  	return 0;
3424e3a4f844c0a Yakir Yang       2016-03-29  1608  
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1609  err_unregister_aux:
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1610  	drm_dp_aux_unregister(&dp->aux);
f0a8b49c03d22a5 Marek Szyprowski 2016-12-30  1611  
152cce0006abf7e Marek Szyprowski 2020-03-10  1612  	return ret;
3424e3a4f844c0a Yakir Yang       2016-03-29  1613  }
3424e3a4f844c0a Yakir Yang       2016-03-29  1614  EXPORT_SYMBOL_GPL(analogix_dp_bind);
3424e3a4f844c0a Yakir Yang       2016-03-29  1615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
