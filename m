Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C038F97
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866372; cv=none; b=IeNElqsEBg9TXPNbWYew8SWFBcy1zlE+Lhudcv9o2i1//Oq8e4P0RardCPkhAX9PsOJcRgclZWkuxklN2l4NpmlWyH7FZ38NlU6USl6LdzXZqwIBBH09VdBYSqAKQodjVOEULdUNSYDn9ILTe3YTYBWXVzNt26YtXN4ucr5tipY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866372; c=relaxed/simple;
	bh=VSMhmEZiUfI5gFISZXz6h8q6JlHRNayOHjJ1bLuqDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/bm44XJ/kid2E5pWzENHfik3LpCgAQZieqF4W3XDJf9rPc0pOg96Ym0YsiG4jNk/x0O3QcPP8ma+S2ffYGbiVCJKvUknNp5Gafr4jAOB9FpwEmgQ2X42TfSwpF3wRK7/QE16GPkhr7uTGu7mK3US6VC3WP0rHF5a7Ye6bNdsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRnkyj0i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRnkyj0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729866370; x=1761402370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSMhmEZiUfI5gFISZXz6h8q6JlHRNayOHjJ1bLuqDkc=;
  b=FRnkyj0icMZfQhpjH/2ph/fygqedJVzcWZQZ70LGb8XTENBeNF7Q3SiQ
   tU9rwwmy+f05fX6MV8d47hN6KPy+fmjd4yILVBcGWh5tS5xjvu9vShv69
   BvoxD6sLL96/Z8i8cE5fNabKpTJMNImB2qDkem2wwAuP5YklBDy93o6RI
   2rfNVpCfaR+hrC9hMrS5nuZubm2F3gfZXf3mEdkEjRAhJgo7MNpfCEynL
   KT0C4unfPtCTsmpvJ8UYU9VvDTiBCL+MB2qvszT42HOL8Y8eUWR2DxIK+
   lKVL5ITwRksyxjBMFAIw3MbZDA4wrGI8n9n2bDGdlG9FLdIqDSnEjF4Rp
   g==;
X-CSE-ConnectionGUID: KuVdCIDQTViIZwXEaQxsnQ==
X-CSE-MsgGUID: Rkl4Bu5gTe6Hb2QInscdHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40089135"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40089135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:26:09 -0700
X-CSE-ConnectionGUID: TMvoOsJgTCSKxMebMD47Cw==
X-CSE-MsgGUID: XL7776tTTyaftcyVJfrtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80523629"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2024 07:26:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4LGP-000YLw-1w;
	Fri, 25 Oct 2024 14:26:05 +0000
Date: Fri, 25 Oct 2024 22:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
Message-ID: <202410252201.QglvauIC-lkp@intel.com>
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
In-Reply-To: <20241023124411.1153552-3-r.czerwinski@pengutronix.de>
References: <20241023124411.1153552-3-r.czerwinski@pengutronix.de>
TO: Rouven Czerwinski <r.czerwinski@pengutronix.de>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: linux-kernel@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
CC: kernel@pengutronix.de
CC: Rouven Czerwinski <r.czerwinski@pengutronix.de>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>

Hi Rouven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c2ee9f594da826bea183ed14f2cc029c719bf4da]

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241023-204826
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241023124411.1153552-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r072-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252201.QglvauIC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410252201.QglvauIC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-lxd-m9189a.c:193 ek79007ad3_probe() error: uninitialized symbol 'ret'.

vim +/ret +193 drivers/gpu/drm/panel/panel-lxd-m9189a.c

a69b961abc36b3 Rouven Czerwinski 2024-10-23  180  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  181  static int ek79007ad3_probe(struct mipi_dsi_device *dsi)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  182  {
a69b961abc36b3 Rouven Czerwinski 2024-10-23  183  	struct device *dev = &dsi->dev;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  184  	struct ek79007ad3_panel *ctx;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  185  	int ret;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  186  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  187  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  188  	if (!ctx)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  189  		return -ENOMEM;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  190  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  191  	ctx->supply = devm_regulator_get(dev, "vdd");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  192  	if (IS_ERR(ctx->supply))
a69b961abc36b3 Rouven Czerwinski 2024-10-23 @193  		return dev_err_probe(dev, ret, "Failed to get regulator\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  194  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  195  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  196  	if (IS_ERR(ctx->reset_gpio))
a69b961abc36b3 Rouven Czerwinski 2024-10-23  197  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
a69b961abc36b3 Rouven Czerwinski 2024-10-23  198  				     "Failed to get reset-gpios\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  199  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  200  	ctx->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  201  	if (IS_ERR(ctx->standby_gpio))
a69b961abc36b3 Rouven Czerwinski 2024-10-23  202  		return dev_err_probe(dev, PTR_ERR(ctx->standby_gpio),
a69b961abc36b3 Rouven Czerwinski 2024-10-23  203  				     "Failed to get standby-gpios\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  204  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  205  	ctx->dsi = dsi;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  206  	mipi_dsi_set_drvdata(dsi, ctx);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  207  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  208  	dsi->lanes = 4;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  209  	dsi->format = MIPI_DSI_FMT_RGB888;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  210  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  211  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  212  	drm_panel_init(&ctx->panel, dev, &ek79007ad3_panel_funcs,
a69b961abc36b3 Rouven Czerwinski 2024-10-23  213  		       DRM_MODE_CONNECTOR_DSI);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  214  	ctx->panel.prepare_prev_first = true;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  215  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  216  	ret = drm_panel_of_backlight(&ctx->panel);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  217  	if (ret)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  218  		return dev_err_probe(dev, ret, "Failed to get backlight\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  219  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  220  	drm_panel_add(&ctx->panel);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  221  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  222  	ret = mipi_dsi_attach(dsi);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  223  	if (ret < 0) {
a69b961abc36b3 Rouven Czerwinski 2024-10-23  224  		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  225  		drm_panel_remove(&ctx->panel);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  226  		return ret;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  227  	}
a69b961abc36b3 Rouven Czerwinski 2024-10-23  228  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  229  	return 0;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  230  }
a69b961abc36b3 Rouven Czerwinski 2024-10-23  231  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
