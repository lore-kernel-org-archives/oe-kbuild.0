Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803949;
	b=kw2DTTNusHQsR2AqBmHjj4FTBt6N4VwYBYdEfho42cfc+WMRRbn/krq70eI916xyBHT7
	 9s9GfBkUyVZ1NidJqo06vZpAs5OjcJQRkelLDmlSYL+SkZhipSGn9ygRHiQat6FBLTDp/
	 Oc8WYKVURx7nMUUwEXtoQT2q1OO+lDoqmxiNzj1G0o90PiBBoMrbXcy8qlkYoc+HUb23V
	 Xfb1VWu0Ktk4OmyOv9jsclGgtqZi4FkV/QUxSd53XZnMLo96ovrijV/6FT2Wkqvb+J+vV
	 OXIIcHE7BW0RWaUKR/6yRup5rfQQZ97yS5nfuGG2CRjgN+/L6bid3p1LHCTMikePhLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803949;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=3X44gu9A56oEMRetzK5CDs2azUzY7SDMC+i/fPCw2jQ=;
	b=ASefPTJVohw8jaD0y4VlXybcGZWAy78WPx0aQsaYiD5oFiJkJLApRomdvGHFOgf5cMHn
	 P5WdAqgls7jyEbQ/pcFTUrAEW/zCAvZ1w1rvDaUB+1HcHJ700tusP85KumM4Uav726I5J
	 BxYRjxv95Ydy+CKvtPPzjXrX50TC9jVHYYuEEp0AAuVvqn8ZNRfHFebI5VsNDZgAkblZx
	 H4oseUe3Ws5fuGCOIi6FqkvEV6Utd503iQFrVhInoMof0BCLyQE3JfH+gknr/kCrZH65J
	 Y77BGP5OVeZpSYloYoqBA8fvgLQ9ZbMfa9qubcdoGeA2nVmTYrbfvAjkCddvEao5k+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7V5VovB;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20F606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 18:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C20F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7V5VovB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795803948; x=1827339948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEIq7QJIwFEdcrQ60BGCbE5yGKCZaBucSy+3B+xXYCo=;
  b=d7V5VovBeD65EUY3INtq4SEyYamSz0RPIAbU+w8FhQvYkH0VOxw4tiRP
   BevmXt3kjL6nJjm56tYJmNYV9stwIdfDYTz7D+u9M2huuQF1lzYtpP7oq
   2DLrIRpTV1lNfVqLGde03fLfKCYbyvwCOAdq7bMQXHBLWyRfsL0VozFwm
   U39xJXC3nRkZzqmBxCNK/NOMYUw0mNin5IKziAh26M9Hu2FuyjJwU6Q6L
   j26/WDN5VwbGXqQ+boD0rZ5B1ldFhBommtX2K/0Z+mVugIS4sCPxAcTrJ
   sXnYk5AikGIjdOsBusmR8Nb4nj4s8fVi3yY66o5aa2dNcQovCqHffhSyL
   A==;
X-CSE-ConnectionGUID: uy69o/xGQpOF7cAt8/uVcA==
X-CSE-MsgGUID: VEZ/7tJqTUS2EeQ/LD3S0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4572383"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4572383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:25:48 -0800
X-CSE-ConnectionGUID: CViV1dVhQMmWXoSKnuieNQ==
X-CSE-MsgGUID: 4VEKqBqGTi61hHubxxOdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12231916"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 10:25:46 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX0dj-000000000IU-2cOe;
	Fri, 27 Nov 2026 18:25:43 +0000
Date: Fri, 27 Nov 2026 19:24:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 12/20] drm/bridge: analogix_dp: Use platform-specific
 HPD detection scheme
Message-ID: <20261127191930.YPrJQfCE-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125112141.1434903-13-damon.ding@rock-chips.com>
References: <20261125112141.1434903-13-damon.ding@rock-chips.com>
TO: Damon Ding <damon.ding@rock-chips.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Inki Dae <inki.dae@samsung.com>
TO: "Seung-Woo Kim" <sw0312.kim@samsung.com>
TO: Kyungmin Park <kyungmin.park@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Peter Griffin <peter.griffin@linaro.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Sandy Huang <hjc@rock-chips.com>
TO: Andy Yan <andyshrk@163.com>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: Damon Ding <damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next linus/master v7.4-rc4 next-20261127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-Select-VIDEOMODE_HELPERS-for-DRM_OF_DISPLAY_MODE_BRIDGE/20261125-192122
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261125112141.1434903-13-damon.ding%40rock-chips.com
patch subject: [PATCH v7 12/20] drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127191930.YPrJQfCE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261127191930.YPrJQfCE-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:163 analogix_dp_reset() error: we previously assumed 'dp->plat_data' could be null (see line 136)

vim +163 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c

e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  128  
3424e3a4f844c0a drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Yakir Yang     2016-03-29  129  void analogix_dp_reset(struct analogix_dp_device *dp)
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  130  {
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  131  	u32 reg;
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  132  
3424e3a4f844c0a drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Yakir Yang     2016-03-29  133  	analogix_dp_stop_video(dp);
3424e3a4f844c0a drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Yakir Yang     2016-03-29  134  	analogix_dp_enable_video_mute(dp, 0);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  135  
709445fb6fc57aa drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-06-01 @136  	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
4805b7ce5031381 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c zain wang      2018-04-23  137  		reg = RK_VID_CAP_FUNC_EN_N | RK_VID_FIFO_FUNC_EN_N |
4805b7ce5031381 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c zain wang      2018-04-23  138  			SW_FUNC_EN_N;
4805b7ce5031381 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c zain wang      2018-04-23  139  	else
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  140  		reg = MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N |
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  141  			AUD_FIFO_FUNC_EN_N | AUD_FUNC_EN_N |
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  142  			HDCP_FUNC_EN_N | SW_FUNC_EN_N;
4805b7ce5031381 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c zain wang      2018-04-23  143  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  144  	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  145  
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  146  	reg = SSC_FUNC_EN_N | AUX_FUNC_EN_N |
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  147  		SERDES_FIFO_FUNC_EN_N |
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  148  		LS_CLK_DOMAIN_FUNC_EN_N;
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  149  	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  150  
a2c81bc12c81189 drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-07-18  151  	usleep_range(20, 30);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  152  
bf63a72ea005d5e drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-08-28  153  	analogix_dp_lane_mapping(dp);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  154  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  155  	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  156  	writel(0x40, dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  157  	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  158  	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  159  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  160  	writel(0x0, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  161  	writel(0x0, dp->reg_base + ANALOGIX_DP_HDCP_CTL);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  162  
b02deccc10792c1 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-11-25 @163  	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
b02deccc10792c1 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-11-25  164  		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
b02deccc10792c1 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-11-25  165  		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
b02deccc10792c1 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-11-25  166  	} else {
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  167  		writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  168  		writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
b02deccc10792c1 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Damon Ding     2026-11-25  169  	}
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  170  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  171  	writel(0x10, dp->reg_base + ANALOGIX_DP_LINK_DEBUG_CTL);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  172  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  173  	writel(0x0, dp->reg_base + ANALOGIX_DP_PHY_TEST);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  174  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  175  	writel(0x0, dp->reg_base + ANALOGIX_DP_VIDEO_FIFO_THRD);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  176  	writel(0x20, dp->reg_base + ANALOGIX_DP_AUDIO_MARGIN);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  177  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  178  	writel(0x4, dp->reg_base + ANALOGIX_DP_M_VID_GEN_FILTER_TH);
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  179  	writel(0x2, dp->reg_base + ANALOGIX_DP_M_AUD_GEN_FILTER_TH);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  180  
092f899420c9e8c drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c Heiko Stuebner 2016-02-15  181  	writel(0x00000101, dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  182  }
e9474be4eb6918c drivers/video/exynos/exynos_dp_reg.c              Jingoo Han     2012-02-03  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
