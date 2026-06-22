Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB35D218EBA
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141375; cv=none; b=a+EHxWv2kYvYeUVbatoOwBZxXpMvnXBgWcfnHmJ9HUmHHFYCizIGxZkb1i/QB2lMEtwwGm8Hp1+5Ecvf0oqIAbQ/Mw1pLlomqXbX5cJsB0eGjaLHfggj4vnu6EBYg5yGn4tHvLICTgKZ6hYrMRYUbM5ayVbOk4RZx7IXLkk1LDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141375; c=relaxed/simple;
	bh=GasNcUyvWFjEBczSwIToQqItiydanRwxKcQPPIlXlWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUIBG4Ze52jiYtRdocgdA66CRDUVA2Y9ahitXDDz6Sdim3/BPCqxbq0XLtvQ+Hr0jsrelU2uBpK+T85G5N6ybC86rjQR++j46a5T2s+kL8Nh909+UgPvH9W6F7sYloF3W5qr4uI7JW50tkKuhc8Y78V9KYLcWi83egtCJIgtv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTuytv1R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTuytv1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782141374; x=1813677374;
  h=date:from:to:cc:subject:message-id;
  bh=GasNcUyvWFjEBczSwIToQqItiydanRwxKcQPPIlXlWQ=;
  b=YTuytv1RdTD4pnzyD0C/eylogA7odyq5eO8Ue7R/P4lSrFuFx82h1yWp
   DAIrgHVPQoowE+Y1q7mmEb8MhlDlqfEhNUS3nezj1vxXnn7+4zOyWiwF6
   iUeWIMKp6c3CtvUqBP8FsGuyQ5QIP1npP4nwmIhHVGfc0zhAYbefA5s7H
   HBBz+l1rjGZdBI6vHXDAqBS9SI5Zc8pOM9mAruNoRYIEJF6sIQKJR6GYc
   Rf/cTRmCr/K6w9agRxBhV3+Yd9mD0RJietiSkV+4FOPdfjnoyOwrwhl3I
   bEHzepJIzXcwPHvo8K4GVZkUo1kuQtuYl0NhxYhgefp8GkJ5HQ44ZnQMk
   g==;
X-CSE-ConnectionGUID: jSJxPncqRguL79JecZpVqg==
X-CSE-MsgGUID: XrsiSgD9S0O9umnRV2RNOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93468998"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93468998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:16:13 -0700
X-CSE-ConnectionGUID: pCKPHqOkQfOWtcuQFKiWtg==
X-CSE-MsgGUID: MJZ3BL6RQ9K6KDV+MG4a9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="272953556"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 08:16:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbgNe-000000001Ng-0WTM;
	Mon, 22 Jun 2026 15:16:10 +0000
Date: Mon, 22 Jun 2026 23:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202606222348.XRvMKN2E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r111-20260618 (https://download.01.org/0day-ci/archive/20260622/202606222348.XRvMKN2E-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222348.XRvMKN2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0244539f9a4f ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606222348.XRvMKN2E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/bridge/inno-hdmi.c:818:35: sparse: signed value source

vim +833 drivers/gpu/drm/bridge/inno-hdmi.c

412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang       2016-02-03  805  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  806  static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  807  							const struct drm_display_info *info,
26d6fd81916e62 drivers/gpu/drm/rockchip/inno_hdmi.c Dmitry Baryshkov 2024-12-14  808  							const struct drm_display_mode *mode)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  809  {
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  810  	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  811  	unsigned long mpixelclk, max_tolerance;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  812  	long rounded_refclk;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  813  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  814  	/* No support for double-clock modes */
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  815  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  816  		return MODE_BAD;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  817  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  818  	mpixelclk = mode->clock * 1000;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  819  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  820  	if (mpixelclk < INNO_HDMI_MIN_TMDS_CLOCK)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  821  		return MODE_CLOCK_LOW;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  822  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  823  	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  824  		return MODE_CLOCK_HIGH;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  825  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  826  	if (hdmi->refclk) {
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  827  		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  828  		if (rounded_refclk < 0)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  829  			return MODE_BAD;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  830  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  831  		/* Vesa DMT standard mentions +/- 0.5% max tolerance */
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  832  		max_tolerance = mpixelclk / 200;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22 @833  		if (abs_diff((unsigned long)rounded_refclk, mpixelclk) > max_tolerance)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  834  			return MODE_NOCLOCK;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  835  	}
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  836  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  837  	return MODE_OK;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  838  }
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  839  

:::::: The code at line 833 was first introduced by commit
:::::: 701029621d4141d0c9f8b81a88a37b95ec84ce65 drm/rockchip: inno_hdmi: Add basic mode validation

:::::: TO: Alex Bee <knaerzche@gmail.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
