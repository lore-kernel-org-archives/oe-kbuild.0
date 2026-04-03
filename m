Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E29B1D6DB5
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205720; cv=none; b=VJCGHqueXqClCdq0K69znleCtUtgIKtwMqGLvx7mKk+n3dtErjxTW3PoITiuoDwUFEDrn15h2mVhiF7nQsNO60H7xKFB2LY407fXotmSpf4hY4DIOJ92ngSga2JCpJw4UbfwdXffrYZGR1vixJTRe6AkUIsz3z3HGkyFeynJw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205720; c=relaxed/simple;
	bh=3Zw9BmSiDGcev3MwIan0E1aDM9czrYccWXgMqOcf3So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HK5BhbAs3wBWCiuIxiObBS1NrEwEByMwCp+SOxGTI9TEAGYoL5S6s/TK2iwEjg66Wf5wec3Er3TMo/9IadxZVrQwtQg1JVpMU+lr2lO0BSTLNOfHweAap+loAGkoR+H3H0iyowyCrDTDAxMPtwgOiWAygp6PQb7N4s5ullNPUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhEpgtW2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhEpgtW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205719; x=1806741719;
  h=date:from:to:cc:subject:message-id;
  bh=3Zw9BmSiDGcev3MwIan0E1aDM9czrYccWXgMqOcf3So=;
  b=lhEpgtW2qFoCDlM3zHAiL53fRFdhtKnble66/w7NECeoh4+RfooLUGVH
   bW3iNOrhu0QRoCyFzH99Hep+f8vqd8z5EGwu+HJswIegfGa9D9Zp+2j7L
   TM2lf4dhPcLyp40BP3+KpwkjPZBIEy8VTbguAOEB8iSK/CIq6H/z+NHV/
   XRBDl8HVwU9robQTqFpV0DXIaLUeBjtvggQPrPyoABcDW3dpMRKTOtwZr
   J40EJfMxuMsacgw3s/e7grZ8/R0n0wL5g14alVLkbp1qGk6nOorJnmeV6
   Nq6ZzojYgms1gjfP8bmA7UJJVJi5FKHdZASOdNO9CBZkf9XjsEkdA08or
   w==;
X-CSE-ConnectionGUID: GSypqsbHSIG95UFtV7NBsw==
X-CSE-MsgGUID: lpWCNcIdR3CWRUgGlbSjXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973951"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973951"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: quaw6iy0QGanAvDvjQ1KsA==
X-CSE-MsgGUID: gNILsRq+TPa7uX5wWkJmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834234"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-00000000139-38ou;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202604022112.HuUam6IX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: 969325a2597ebc4cb001a92992f06f698ab2b467 drm/rockchip: inno-hdmi: Convert to drm bridge
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: sparc64-randconfig-r131-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022112.HuUam6IX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022112.HuUam6IX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604022112.HuUam6IX-lkp@intel.com/

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
