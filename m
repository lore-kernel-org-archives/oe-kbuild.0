Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A5365A15
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453496; cv=none; b=hhCSPAReIKYKA6MwsS/xnh6S7+tJgHtr2BVk9OHU+PuLv4GCJodRb9BgSKxIrtv7cvKHvO/76mYKfY7P0aeImPG3Bcu6v6LcmcfktxjYG2n5aiPmKG67z5qXZqHdGhwBlQ/FO47dK+HXI4THfsa+w32CHVawBugPzQva4dukrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453496; c=relaxed/simple;
	bh=gt0R/Pg9wVKnMqgC5kovW+mI8rh2lzf5BlwXP14UT6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M4iZ9ewmwkOi4p2bpi8CuCYD+ocJkm8LO5jHDcQ1OEjS4tyDOGsOFROBLZo1ZGwt9B3krH1A9d6aWzlMkl+qKwrGmivgG38C9amsXc7O36dvUmmAs+CUYIyPqMb0WLN9d4NzAJ43DePu1EPV+TNvSsv7yxxkPF/8qpLvx7OsGxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRj9kFxW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRj9kFxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772453495; x=1803989495;
  h=date:from:to:cc:subject:message-id;
  bh=gt0R/Pg9wVKnMqgC5kovW+mI8rh2lzf5BlwXP14UT6M=;
  b=jRj9kFxW0n2rn+MOadsIj0UOiXuuV1eXI7wW/GPZrbzVj0gbhqm9yJkz
   VGhBcQTO9vrdBy/1z+npUXoovTQWiOi6MLeHR8uF0Iqm8c6eOL3jTjSPM
   ZOFqoCQy6VVQ+MdfZivjn7cx50uT2F02mpaK5CpXTB0KlmW50w1sKrx1M
   PX4hAShCP3ylTmSrzjoVv8wuylLCCYfpctSbyXO61SzCdBxSXYyGfL87K
   lIAXCYqCRxyibe4obqkPz30S4C/Zj0YLG0sCqq+TzxQdmxRcpCPckzktr
   wjnTBQdtVHREELB50C4S3s9mx0KfDYERPsVsymXxr1sYPcTHOr35Nfn4q
   g==;
X-CSE-ConnectionGUID: 0wOQ3O3+RHKgWfUoRPbvdQ==
X-CSE-MsgGUID: pLqYDJJ1TCCqQSs4gULxjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72486201"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="72486201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:11:34 -0800
X-CSE-ConnectionGUID: gxOcgz0TT6OjwulX1M4wGg==
X-CSE-MsgGUID: TRTdqHtJQViaKAMcS1P92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="244706514"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2026 04:11:33 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx27X-000000000pp-0dsX;
	Mon, 02 Mar 2026 12:11:31 +0000
Date: Mon, 02 Mar 2026 20:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202603022010.X4p93BCU-lkp@intel.com>
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
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: um-randconfig-r121-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022010.X4p93BCU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022010.X4p93BCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603022010.X4p93BCU-lkp@intel.com/

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
