Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD61DF75B
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122333; cv=none; b=qGbSaIxbNKj3SBj0QcyT0oxHBYm6eXRXnsczy4JZDJP+Rx/79N9L4q54gUh/GWkXm+me0F57d1zf8foXzFREuHyb7nTo0PZkH8y3x/Y7x0ydEEGVlbpzN/Pjtzc6RbfNw+2jWRwOaW+IXnolbZJaarKkifbjniAu0DLNGJGDHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122333; c=relaxed/simple;
	bh=5sE/WBgL3EJVFY7XkMNu7XY3ObW1eaQKq7ON5+d0CwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyLJ7ceguFXGKeVVqL77cWsS+2Fy3QsH4+E/bIAFLnXjNTrRH525vjUGv+suDFVHhInhbYVNH3xrdBD0rzHmKIFpM/PuXs5bU427C7xULtoV439K/27n8OVVfN7AqSwygqxuP1wK6M8mlD3Za/OrZOdicTMAFa3ViD8KDEhNMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpL5AjzX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpL5AjzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122330; x=1793658330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5sE/WBgL3EJVFY7XkMNu7XY3ObW1eaQKq7ON5+d0CwU=;
  b=IpL5AjzX62EndIK7WV1C/4/fJ9B+W+ecsvi2n60AcXAAzvsC59ksMhCc
   mTYvWydd6EmmOJgbSYysW9PLKazE+NvPpZ1X6i8pSq1cBezeHJCsHgRjx
   9wm17IuFrMsjBdaJGX/BgE/hozcubd8hXff39zFZ5N1hPZMNo+qZKlC64
   564854B2RCv3f8aZGuztq/+d6D2hDjbogNrMU5FAEw667gtJL12SiiGdp
   7goisNV4TceUGHED+qOyXoziyussQHtnqkfDXpACCJsCL5UhG5afXANDy
   ur/0Kcl3BJEtIJsFzZV4c/MMsneYhQmnq1vh2lTQI3yW9WOxLd2/xPtHX
   A==;
X-CSE-ConnectionGUID: 5NLcvlPCRSOl+EFk7HCOnA==
X-CSE-MsgGUID: phlvwy0CTMGyrqQ00OolxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="67855469"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="67855469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:25:30 -0800
X-CSE-ConnectionGUID: aoPf6rvuRmSkWoQzDNmmXQ==
X-CSE-MsgGUID: krXtZkjOS86HBIWg8NbhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="190802855"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2025 14:25:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFgVq-000PcA-1l;
	Sun, 02 Nov 2025 22:25:26 +0000
Date: Mon, 3 Nov 2025 06:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <202511030642.UsJeXIxq-lkp@intel.com>
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
In-Reply-To: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
TO: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Mikko Perttunen <mperttunen@nvidia.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/drm-tegra-Enable-cmu-for-Tegra186-and-Tegra194/20251102-071726
base:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
patch link:    https://lore.kernel.org/r/20251101-tegra-drm-cmu-v1-1-211799755ab8%40gmail.com
patch subject: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-r071-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030642.UsJeXIxq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511030642.UsJeXIxq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/sor.c:2757 tegra_sor_hdmi_enable() warn: right shifting more than type allows 32 vs 32

vim +2757 drivers/gpu/drm/tegra/sor.c

e1335e2f0cfcd36 Thierry Reding 2017-10-12  2590  
61417aaa11402f8 Thierry Reding 2019-07-24  2591  	/* switch the SOR clock to the pad clock */
e1335e2f0cfcd36 Thierry Reding 2017-10-12  2592  	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
e1335e2f0cfcd36 Thierry Reding 2017-10-12  2593  	if (err < 0) {
61417aaa11402f8 Thierry Reding 2019-07-24  2594  		dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
61417aaa11402f8 Thierry Reding 2019-07-24  2595  			err);
61417aaa11402f8 Thierry Reding 2019-07-24  2596  		return;
61417aaa11402f8 Thierry Reding 2019-07-24  2597  	}
61417aaa11402f8 Thierry Reding 2019-07-24  2598  
61417aaa11402f8 Thierry Reding 2019-07-24  2599  	/* switch the output clock to the parent pixel clock */
61417aaa11402f8 Thierry Reding 2019-07-24  2600  	err = clk_set_parent(sor->clk, sor->clk_parent);
61417aaa11402f8 Thierry Reding 2019-07-24  2601  	if (err < 0) {
61417aaa11402f8 Thierry Reding 2019-07-24  2602  		dev_err(sor->dev, "failed to select output parent clock: %d\n",
61417aaa11402f8 Thierry Reding 2019-07-24  2603  			err);
e1335e2f0cfcd36 Thierry Reding 2017-10-12  2604  		return;
e1335e2f0cfcd36 Thierry Reding 2017-10-12  2605  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2606  
36e90221acf37dd Thierry Reding 2017-10-12  2607  	/* adjust clock rate for HDMI 2.0 modes */
36e90221acf37dd Thierry Reding 2017-10-12  2608  	rate = clk_get_rate(sor->clk_parent);
36e90221acf37dd Thierry Reding 2017-10-12  2609  
36e90221acf37dd Thierry Reding 2017-10-12  2610  	if (mode->clock >= 340000)
36e90221acf37dd Thierry Reding 2017-10-12  2611  		rate /= 2;
36e90221acf37dd Thierry Reding 2017-10-12  2612  
36e90221acf37dd Thierry Reding 2017-10-12  2613  	DRM_DEBUG_KMS("setting clock to %lu Hz, mode: %lu Hz\n", rate, pclk);
36e90221acf37dd Thierry Reding 2017-10-12  2614  
36e90221acf37dd Thierry Reding 2017-10-12  2615  	clk_set_rate(sor->clk, rate);
c57997bce423fb7 Thierry Reding 2017-10-12  2616  
c57997bce423fb7 Thierry Reding 2017-10-12  2617  	if (!sor->soc->has_nvdisplay) {
459cc2c6800b545 Thierry Reding 2015-07-30  2618  		value = SOR_INPUT_CONTROL_HDMI_SRC_SELECT(dc->pipe);
459cc2c6800b545 Thierry Reding 2015-07-30  2619  
459cc2c6800b545 Thierry Reding 2015-07-30  2620  		/* XXX is this the proper check? */
459cc2c6800b545 Thierry Reding 2015-07-30  2621  		if (mode->clock < 75000)
459cc2c6800b545 Thierry Reding 2015-07-30  2622  			value |= SOR_INPUT_CONTROL_ARM_VIDEO_RANGE_LIMITED;
459cc2c6800b545 Thierry Reding 2015-07-30  2623  
459cc2c6800b545 Thierry Reding 2015-07-30  2624  		tegra_sor_writel(sor, value, SOR_INPUT_CONTROL);
c57997bce423fb7 Thierry Reding 2017-10-12  2625  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2626  
459cc2c6800b545 Thierry Reding 2015-07-30  2627  	max_ac = ((mode->htotal - mode->hdisplay) - SOR_REKEY - 18) / 32;
459cc2c6800b545 Thierry Reding 2015-07-30  2628  
459cc2c6800b545 Thierry Reding 2015-07-30  2629  	value = SOR_HDMI_CTRL_ENABLE | SOR_HDMI_CTRL_MAX_AC_PACKET(max_ac) |
459cc2c6800b545 Thierry Reding 2015-07-30  2630  		SOR_HDMI_CTRL_AUDIO_LAYOUT | SOR_HDMI_CTRL_REKEY(SOR_REKEY);
459cc2c6800b545 Thierry Reding 2015-07-30  2631  	tegra_sor_writel(sor, value, SOR_HDMI_CTRL);
459cc2c6800b545 Thierry Reding 2015-07-30  2632  
c57997bce423fb7 Thierry Reding 2017-10-12  2633  	if (!dc->soc->has_nvdisplay) {
459cc2c6800b545 Thierry Reding 2015-07-30  2634  		/* H_PULSE2 setup */
c57997bce423fb7 Thierry Reding 2017-10-12  2635  		pulse_start = h_ref_to_sync +
c57997bce423fb7 Thierry Reding 2017-10-12  2636  			      (mode->hsync_end - mode->hsync_start) +
459cc2c6800b545 Thierry Reding 2015-07-30  2637  			      (mode->htotal - mode->hsync_end) - 10;
459cc2c6800b545 Thierry Reding 2015-07-30  2638  
459cc2c6800b545 Thierry Reding 2015-07-30  2639  		value = PULSE_LAST_END_A | PULSE_QUAL_VACTIVE |
459cc2c6800b545 Thierry Reding 2015-07-30  2640  			PULSE_POLARITY_HIGH | PULSE_MODE_NORMAL;
459cc2c6800b545 Thierry Reding 2015-07-30  2641  		tegra_dc_writel(dc, value, DC_DISP_H_PULSE2_CONTROL);
459cc2c6800b545 Thierry Reding 2015-07-30  2642  
459cc2c6800b545 Thierry Reding 2015-07-30  2643  		value = PULSE_END(pulse_start + 8) | PULSE_START(pulse_start);
459cc2c6800b545 Thierry Reding 2015-07-30  2644  		tegra_dc_writel(dc, value, DC_DISP_H_PULSE2_POSITION_A);
459cc2c6800b545 Thierry Reding 2015-07-30  2645  
459cc2c6800b545 Thierry Reding 2015-07-30  2646  		value = tegra_dc_readl(dc, DC_DISP_DISP_SIGNAL_OPTIONS0);
459cc2c6800b545 Thierry Reding 2015-07-30  2647  		value |= H_PULSE2_ENABLE;
459cc2c6800b545 Thierry Reding 2015-07-30  2648  		tegra_dc_writel(dc, value, DC_DISP_DISP_SIGNAL_OPTIONS0);
c57997bce423fb7 Thierry Reding 2017-10-12  2649  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2650  
459cc2c6800b545 Thierry Reding 2015-07-30  2651  	/* infoframe setup */
459cc2c6800b545 Thierry Reding 2015-07-30  2652  	err = tegra_sor_hdmi_setup_avi_infoframe(sor, mode);
459cc2c6800b545 Thierry Reding 2015-07-30  2653  	if (err < 0)
459cc2c6800b545 Thierry Reding 2015-07-30  2654  		dev_err(sor->dev, "failed to setup AVI infoframe: %d\n", err);
459cc2c6800b545 Thierry Reding 2015-07-30  2655  
459cc2c6800b545 Thierry Reding 2015-07-30  2656  	/* XXX HDMI audio support not implemented yet */
459cc2c6800b545 Thierry Reding 2015-07-30  2657  	tegra_sor_hdmi_disable_audio_infoframe(sor);
459cc2c6800b545 Thierry Reding 2015-07-30  2658  
459cc2c6800b545 Thierry Reding 2015-07-30  2659  	/* use single TMDS protocol */
459cc2c6800b545 Thierry Reding 2015-07-30  2660  	value = tegra_sor_readl(sor, SOR_STATE1);
459cc2c6800b545 Thierry Reding 2015-07-30  2661  	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2662  	value |= SOR_STATE_ASY_PROTOCOL_SINGLE_TMDS_A;
459cc2c6800b545 Thierry Reding 2015-07-30  2663  	tegra_sor_writel(sor, value, SOR_STATE1);
459cc2c6800b545 Thierry Reding 2015-07-30  2664  
459cc2c6800b545 Thierry Reding 2015-07-30  2665  	/* power up pad calibration */
880cee0b7ff379e Thierry Reding 2017-10-12  2666  	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2667  	value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
880cee0b7ff379e Thierry Reding 2017-10-12  2668  	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2669  
459cc2c6800b545 Thierry Reding 2015-07-30  2670  	/* production settings */
459cc2c6800b545 Thierry Reding 2015-07-30  2671  	settings = tegra_sor_hdmi_find_settings(sor, mode->clock * 1000);
db8b42fbfc6f778 Dan Carpenter  2015-08-17  2672  	if (!settings) {
db8b42fbfc6f778 Dan Carpenter  2015-08-17  2673  		dev_err(sor->dev, "no settings for pixel clock %d Hz\n",
db8b42fbfc6f778 Dan Carpenter  2015-08-17  2674  			mode->clock * 1000);
459cc2c6800b545 Thierry Reding 2015-07-30  2675  		return;
459cc2c6800b545 Thierry Reding 2015-07-30  2676  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2677  
880cee0b7ff379e Thierry Reding 2017-10-12  2678  	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
459cc2c6800b545 Thierry Reding 2015-07-30  2679  	value &= ~SOR_PLL0_ICHPMP_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2680  	value &= ~SOR_PLL0_FILTER_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2681  	value &= ~SOR_PLL0_VCOCAP_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2682  	value |= SOR_PLL0_ICHPMP(settings->ichpmp);
c57997bce423fb7 Thierry Reding 2017-10-12  2683  	value |= SOR_PLL0_FILTER(settings->filter);
459cc2c6800b545 Thierry Reding 2015-07-30  2684  	value |= SOR_PLL0_VCOCAP(settings->vcocap);
880cee0b7ff379e Thierry Reding 2017-10-12  2685  	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
459cc2c6800b545 Thierry Reding 2015-07-30  2686  
c57997bce423fb7 Thierry Reding 2017-10-12  2687  	/* XXX not in TRM */
880cee0b7ff379e Thierry Reding 2017-10-12  2688  	value = tegra_sor_readl(sor, sor->soc->regs->pll1);
459cc2c6800b545 Thierry Reding 2015-07-30  2689  	value &= ~SOR_PLL1_LOADADJ_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2690  	value &= ~SOR_PLL1_TMDS_TERMADJ_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2691  	value |= SOR_PLL1_LOADADJ(settings->loadadj);
c57997bce423fb7 Thierry Reding 2017-10-12  2692  	value |= SOR_PLL1_TMDS_TERMADJ(settings->tmds_termadj);
c57997bce423fb7 Thierry Reding 2017-10-12  2693  	value |= SOR_PLL1_TMDS_TERM;
880cee0b7ff379e Thierry Reding 2017-10-12  2694  	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
459cc2c6800b545 Thierry Reding 2015-07-30  2695  
880cee0b7ff379e Thierry Reding 2017-10-12  2696  	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
c57997bce423fb7 Thierry Reding 2017-10-12  2697  	value &= ~SOR_PLL3_BG_TEMP_COEF_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2698  	value &= ~SOR_PLL3_BG_VREF_LEVEL_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2699  	value &= ~SOR_PLL3_AVDD10_LEVEL_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2700  	value &= ~SOR_PLL3_AVDD14_LEVEL_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2701  	value |= SOR_PLL3_BG_TEMP_COEF(settings->bg_temp_coef);
c57997bce423fb7 Thierry Reding 2017-10-12  2702  	value |= SOR_PLL3_BG_VREF_LEVEL(settings->bg_vref_level);
c57997bce423fb7 Thierry Reding 2017-10-12  2703  	value |= SOR_PLL3_AVDD10_LEVEL(settings->avdd10_level);
c57997bce423fb7 Thierry Reding 2017-10-12  2704  	value |= SOR_PLL3_AVDD14_LEVEL(settings->avdd14_level);
880cee0b7ff379e Thierry Reding 2017-10-12  2705  	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
459cc2c6800b545 Thierry Reding 2015-07-30  2706  
c57997bce423fb7 Thierry Reding 2017-10-12  2707  	value = settings->drive_current[3] << 24 |
c57997bce423fb7 Thierry Reding 2017-10-12  2708  		settings->drive_current[2] << 16 |
c57997bce423fb7 Thierry Reding 2017-10-12  2709  		settings->drive_current[1] <<  8 |
c57997bce423fb7 Thierry Reding 2017-10-12  2710  		settings->drive_current[0] <<  0;
459cc2c6800b545 Thierry Reding 2015-07-30  2711  	tegra_sor_writel(sor, value, SOR_LANE_DRIVE_CURRENT0);
459cc2c6800b545 Thierry Reding 2015-07-30  2712  
c57997bce423fb7 Thierry Reding 2017-10-12  2713  	value = settings->preemphasis[3] << 24 |
c57997bce423fb7 Thierry Reding 2017-10-12  2714  		settings->preemphasis[2] << 16 |
c57997bce423fb7 Thierry Reding 2017-10-12  2715  		settings->preemphasis[1] <<  8 |
c57997bce423fb7 Thierry Reding 2017-10-12  2716  		settings->preemphasis[0] <<  0;
459cc2c6800b545 Thierry Reding 2015-07-30  2717  	tegra_sor_writel(sor, value, SOR_LANE_PREEMPHASIS0);
459cc2c6800b545 Thierry Reding 2015-07-30  2718  
880cee0b7ff379e Thierry Reding 2017-10-12  2719  	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2720  	value &= ~SOR_DP_PADCTL_TX_PU_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2721  	value |= SOR_DP_PADCTL_TX_PU_ENABLE;
c57997bce423fb7 Thierry Reding 2017-10-12  2722  	value |= SOR_DP_PADCTL_TX_PU(settings->tx_pu_value);
880cee0b7ff379e Thierry Reding 2017-10-12  2723  	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2724  
c57997bce423fb7 Thierry Reding 2017-10-12  2725  	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl2);
c57997bce423fb7 Thierry Reding 2017-10-12  2726  	value &= ~SOR_DP_PADCTL_SPAREPLL_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2727  	value |= SOR_DP_PADCTL_SPAREPLL(settings->sparepll);
c57997bce423fb7 Thierry Reding 2017-10-12  2728  	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl2);
c57997bce423fb7 Thierry Reding 2017-10-12  2729  
459cc2c6800b545 Thierry Reding 2015-07-30  2730  	/* power down pad calibration */
880cee0b7ff379e Thierry Reding 2017-10-12  2731  	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2732  	value |= SOR_DP_PADCTL_PAD_CAL_PD;
880cee0b7ff379e Thierry Reding 2017-10-12  2733  	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
459cc2c6800b545 Thierry Reding 2015-07-30  2734  
c57997bce423fb7 Thierry Reding 2017-10-12  2735  	if (!dc->soc->has_nvdisplay) {
459cc2c6800b545 Thierry Reding 2015-07-30  2736  		/* miscellaneous display controller settings */
459cc2c6800b545 Thierry Reding 2015-07-30  2737  		value = VSYNC_H_POSITION(1);
459cc2c6800b545 Thierry Reding 2015-07-30  2738  		tegra_dc_writel(dc, value, DC_DISP_DISP_TIMING_OPTIONS);
c57997bce423fb7 Thierry Reding 2017-10-12  2739  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2740  
459cc2c6800b545 Thierry Reding 2015-07-30  2741  	value = tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
459cc2c6800b545 Thierry Reding 2015-07-30  2742  	value &= ~DITHER_CONTROL_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2743  	value &= ~BASE_COLOR_SIZE_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2744  
258c1ce075c4bc9 Aaron Kling    2025-11-01  2745  	if (dc->soc->has_nvdisplay) {
258c1ce075c4bc9 Aaron Kling    2025-11-01  2746  		sor->cmu_output_lut =
258c1ce075c4bc9 Aaron Kling    2025-11-01  2747  			dma_alloc_coherent(dc->dev, ARRAY_SIZE(default_srgb_lut) * sizeof(u64),
258c1ce075c4bc9 Aaron Kling    2025-11-01  2748  					   &sor->cmu_output_phys, GFP_KERNEL);
258c1ce075c4bc9 Aaron Kling    2025-11-01  2749  
258c1ce075c4bc9 Aaron Kling    2025-11-01  2750  		for (i = 0; i < ARRAY_SIZE(default_srgb_lut); i++) {
258c1ce075c4bc9 Aaron Kling    2025-11-01  2751  			r = default_srgb_lut[i];
258c1ce075c4bc9 Aaron Kling    2025-11-01  2752  			sor->cmu_output_lut[i] = (r << 32) | (r << 16) | r;
258c1ce075c4bc9 Aaron Kling    2025-11-01  2753  		}
258c1ce075c4bc9 Aaron Kling    2025-11-01  2754  
258c1ce075c4bc9 Aaron Kling    2025-11-01  2755  		tegra_dc_writel(dc, (u32)(sor->cmu_output_phys & 0xffffffff),
258c1ce075c4bc9 Aaron Kling    2025-11-01  2756  				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE);
258c1ce075c4bc9 Aaron Kling    2025-11-01 @2757  		tegra_dc_writel(dc, (u32)(sor->cmu_output_phys >> 32),
258c1ce075c4bc9 Aaron Kling    2025-11-01  2758  				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI);
258c1ce075c4bc9 Aaron Kling    2025-11-01  2759  
258c1ce075c4bc9 Aaron Kling    2025-11-01  2760  		tegra_dc_writel(dc, OUTPUT_LUT_MODE_INTERPOLATE | OUTPUT_LUT_SIZE_SIZE_1025,
258c1ce075c4bc9 Aaron Kling    2025-11-01  2761  				DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT);
258c1ce075c4bc9 Aaron Kling    2025-11-01  2762  
258c1ce075c4bc9 Aaron Kling    2025-11-01  2763  		value |= CMU_ENABLE_ENABLE;
258c1ce075c4bc9 Aaron Kling    2025-11-01  2764  	}
258c1ce075c4bc9 Aaron Kling    2025-11-01  2765  
c31efa7a30ed04c Thierry Reding 2015-09-08  2766  	switch (state->bpc) {
459cc2c6800b545 Thierry Reding 2015-07-30  2767  	case 6:
459cc2c6800b545 Thierry Reding 2015-07-30  2768  		value |= BASE_COLOR_SIZE_666;
459cc2c6800b545 Thierry Reding 2015-07-30  2769  		break;
459cc2c6800b545 Thierry Reding 2015-07-30  2770  
459cc2c6800b545 Thierry Reding 2015-07-30  2771  	case 8:
459cc2c6800b545 Thierry Reding 2015-07-30  2772  		value |= BASE_COLOR_SIZE_888;
459cc2c6800b545 Thierry Reding 2015-07-30  2773  		break;
459cc2c6800b545 Thierry Reding 2015-07-30  2774  
c57997bce423fb7 Thierry Reding 2017-10-12  2775  	case 10:
c57997bce423fb7 Thierry Reding 2017-10-12  2776  		value |= BASE_COLOR_SIZE_101010;
c57997bce423fb7 Thierry Reding 2017-10-12  2777  		break;
c57997bce423fb7 Thierry Reding 2017-10-12  2778  
c57997bce423fb7 Thierry Reding 2017-10-12  2779  	case 12:
c57997bce423fb7 Thierry Reding 2017-10-12  2780  		value |= BASE_COLOR_SIZE_121212;
c57997bce423fb7 Thierry Reding 2017-10-12  2781  		break;
c57997bce423fb7 Thierry Reding 2017-10-12  2782  
459cc2c6800b545 Thierry Reding 2015-07-30  2783  	default:
c31efa7a30ed04c Thierry Reding 2015-09-08  2784  		WARN(1, "%u bits-per-color not supported\n", state->bpc);
c31efa7a30ed04c Thierry Reding 2015-09-08  2785  		value |= BASE_COLOR_SIZE_888;
459cc2c6800b545 Thierry Reding 2015-07-30  2786  		break;
459cc2c6800b545 Thierry Reding 2015-07-30  2787  	}
459cc2c6800b545 Thierry Reding 2015-07-30  2788  
459cc2c6800b545 Thierry Reding 2015-07-30  2789  	tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
459cc2c6800b545 Thierry Reding 2015-07-30  2790  
c57997bce423fb7 Thierry Reding 2017-10-12  2791  	/* XXX set display head owner */
c57997bce423fb7 Thierry Reding 2017-10-12  2792  	value = tegra_sor_readl(sor, SOR_STATE1);
c57997bce423fb7 Thierry Reding 2017-10-12  2793  	value &= ~SOR_STATE_ASY_OWNER_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2794  	value |= SOR_STATE_ASY_OWNER(1 + dc->pipe);
c57997bce423fb7 Thierry Reding 2017-10-12  2795  	tegra_sor_writel(sor, value, SOR_STATE1);
c57997bce423fb7 Thierry Reding 2017-10-12  2796  
459cc2c6800b545 Thierry Reding 2015-07-30  2797  	err = tegra_sor_power_up(sor, 250);
459cc2c6800b545 Thierry Reding 2015-07-30  2798  	if (err < 0)
459cc2c6800b545 Thierry Reding 2015-07-30  2799  		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
459cc2c6800b545 Thierry Reding 2015-07-30  2800  
2bd1dd399fcd2e2 Thierry Reding 2015-08-03  2801  	/* configure dynamic range of output */
880cee0b7ff379e Thierry Reding 2017-10-12  2802  	value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
459cc2c6800b545 Thierry Reding 2015-07-30  2803  	value &= ~SOR_HEAD_STATE_RANGECOMPRESS_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2804  	value &= ~SOR_HEAD_STATE_DYNRANGE_MASK;
880cee0b7ff379e Thierry Reding 2017-10-12  2805  	tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
459cc2c6800b545 Thierry Reding 2015-07-30  2806  
2bd1dd399fcd2e2 Thierry Reding 2015-08-03  2807  	/* configure colorspace */
880cee0b7ff379e Thierry Reding 2017-10-12  2808  	value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
459cc2c6800b545 Thierry Reding 2015-07-30  2809  	value &= ~SOR_HEAD_STATE_COLORSPACE_MASK;
459cc2c6800b545 Thierry Reding 2015-07-30  2810  	value |= SOR_HEAD_STATE_COLORSPACE_RGB;
880cee0b7ff379e Thierry Reding 2017-10-12  2811  	tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
459cc2c6800b545 Thierry Reding 2015-07-30  2812  
c31efa7a30ed04c Thierry Reding 2015-09-08  2813  	tegra_sor_mode_set(sor, mode, state);
459cc2c6800b545 Thierry Reding 2015-07-30  2814  
459cc2c6800b545 Thierry Reding 2015-07-30  2815  	tegra_sor_update(sor);
459cc2c6800b545 Thierry Reding 2015-07-30  2816  
c57997bce423fb7 Thierry Reding 2017-10-12  2817  	/* program preamble timing in SOR (XXX) */
c57997bce423fb7 Thierry Reding 2017-10-12  2818  	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
c57997bce423fb7 Thierry Reding 2017-10-12  2819  	value &= ~SOR_DP_SPARE_DISP_VIDEO_PREAMBLE;
c57997bce423fb7 Thierry Reding 2017-10-12  2820  	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
c57997bce423fb7 Thierry Reding 2017-10-12  2821  
459cc2c6800b545 Thierry Reding 2015-07-30  2822  	err = tegra_sor_attach(sor);
459cc2c6800b545 Thierry Reding 2015-07-30  2823  	if (err < 0)
459cc2c6800b545 Thierry Reding 2015-07-30  2824  		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
459cc2c6800b545 Thierry Reding 2015-07-30  2825  
459cc2c6800b545 Thierry Reding 2015-07-30  2826  	/* enable display to SOR clock and generate HDMI preamble */
459cc2c6800b545 Thierry Reding 2015-07-30  2827  	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
c57997bce423fb7 Thierry Reding 2017-10-12  2828  
c57997bce423fb7 Thierry Reding 2017-10-12  2829  	if (!sor->soc->has_nvdisplay)
d278e4a9714d9c5 Thierry Reding 2019-06-27  2830  		value |= SOR1_TIMING_CYA;
d278e4a9714d9c5 Thierry Reding 2019-06-27  2831  
c57997bce423fb7 Thierry Reding 2017-10-12  2832  	value |= SOR_ENABLE(sor->index);
c57997bce423fb7 Thierry Reding 2017-10-12  2833  
459cc2c6800b545 Thierry Reding 2015-07-30  2834  	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
459cc2c6800b545 Thierry Reding 2015-07-30  2835  
c57997bce423fb7 Thierry Reding 2017-10-12  2836  	if (dc->soc->has_nvdisplay) {
c57997bce423fb7 Thierry Reding 2017-10-12  2837  		value = tegra_dc_readl(dc, DC_DISP_CORE_SOR_SET_CONTROL(sor->index));
c57997bce423fb7 Thierry Reding 2017-10-12  2838  		value &= ~PROTOCOL_MASK;
c57997bce423fb7 Thierry Reding 2017-10-12  2839  		value |= PROTOCOL_SINGLE_TMDS_A;
c57997bce423fb7 Thierry Reding 2017-10-12  2840  		tegra_dc_writel(dc, value, DC_DISP_CORE_SOR_SET_CONTROL(sor->index));
c57997bce423fb7 Thierry Reding 2017-10-12  2841  	}
c57997bce423fb7 Thierry Reding 2017-10-12  2842  
459cc2c6800b545 Thierry Reding 2015-07-30  2843  	tegra_dc_commit(dc);
459cc2c6800b545 Thierry Reding 2015-07-30  2844  
459cc2c6800b545 Thierry Reding 2015-07-30  2845  	err = tegra_sor_wakeup(sor);
459cc2c6800b545 Thierry Reding 2015-07-30  2846  	if (err < 0)
459cc2c6800b545 Thierry Reding 2015-07-30  2847  		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
36e90221acf37dd Thierry Reding 2017-10-12  2848  
36e90221acf37dd Thierry Reding 2017-10-12  2849  	tegra_sor_hdmi_scdc_start(sor);
8e2988a76c26f25 Thierry Reding 2018-12-03  2850  	tegra_sor_audio_prepare(sor);
459cc2c6800b545 Thierry Reding 2015-07-30  2851  }
459cc2c6800b545 Thierry Reding 2015-07-30  2852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
