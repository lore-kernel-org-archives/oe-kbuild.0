Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7C28382
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730018766; cv=none; b=jNGu4txIze+q/bJE8NTAzEWYDVpENxmE7LiheteIF0piDzYFsCaGO25IKU8z2lTAg1By60hmJOX0wNvUrm0ONyz847lTum6VBD+EJyjnp1cyqMusk3WMDtL1lkAn3SEPH34CLVvlPtKVc7vuxT6f6j5JeaD645vbKQ9mfIbY7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730018766; c=relaxed/simple;
	bh=U+WHa4DVg5dSq65cRJM86sCyNXZIxEDMLor73yANo74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQjLnj5WP5USCfD9c9aSMzvaVpRPzw36dswYWPbuwBXVFgn1oa7P4kXB+fzGAZGLR5DP6x8VSGyuTp1BG7z7u0pHKpm6stPYiikcG1gNCeiL3QDiAlP+3Yqtol7qbP52Om8VidO1O7ny1S1j2gejP2hThtxKz9NnH258mebqFy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlgd9ff4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlgd9ff4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730018761; x=1761554761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+WHa4DVg5dSq65cRJM86sCyNXZIxEDMLor73yANo74=;
  b=dlgd9ff4VRhC3nYMSrKgFrJTc6ApWfvwQrXSllvcBaWl4nItAviwFKpe
   gN2wECwHT8B3JcqFiOnt42l5kiRw8B0wtuydppADLFhtJEzh++a9mqvU/
   nnFI01he31S+2kFHo5k/ilHpseZ4Fr7UxvGu8J3J9f2TRaOCG140obqEg
   j8KG57SYNoI9mn7fB0Qe6UgAxXi2bh+OiUYWDnIsrr0ZGQG/PFtmevudk
   TDImNvCKEA1UAcIYlDEWTRJeSCqeprnF6Unnnv7LZzF77bFFkbqqGRv8C
   lbSjFgaH1lZUMZPc/CJCidOiVczGHTA1a3j08QfApI34DcNNwbux2DiqP
   A==;
X-CSE-ConnectionGUID: iNLkNi3yS4yYrozRYD6gKQ==
X-CSE-MsgGUID: muRJzdyATLqs2+YtI2bWGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47096893"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47096893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 01:46:01 -0700
X-CSE-ConnectionGUID: d2N6VNJpRZOGWzhHVdMzPA==
X-CSE-MsgGUID: 0Vs8DIuuQRCFsMCe4lV/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81443747"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2024 01:46:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4yuL-000aYJ-1U;
	Sun, 27 Oct 2024 08:45:57 +0000
Date: Sun, 27 Oct 2024 16:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
Message-ID: <202410271613.ZF6z2wGh-lkp@intel.com>
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
In-Reply-To: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>
References: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241025-221252
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241025141130.3179166-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271613.ZF6z2wGh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271613.ZF6z2wGh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-lxd-m9189a.c:173 lxd_m9189_probe() error: uninitialized symbol 'ret'.

vim +/ret +173 drivers/gpu/drm/panel/panel-lxd-m9189a.c

25cef47404912c Rouven Czerwinski 2024-10-25  160  
25cef47404912c Rouven Czerwinski 2024-10-25  161  static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
25cef47404912c Rouven Czerwinski 2024-10-25  162  {
25cef47404912c Rouven Czerwinski 2024-10-25  163  	struct device *dev = &dsi->dev;
25cef47404912c Rouven Czerwinski 2024-10-25  164  	struct m9189_panel *m9189;
25cef47404912c Rouven Czerwinski 2024-10-25  165  	int ret;
25cef47404912c Rouven Czerwinski 2024-10-25  166  
25cef47404912c Rouven Czerwinski 2024-10-25  167  	m9189 = devm_kzalloc(dev, sizeof(*m9189), GFP_KERNEL);
25cef47404912c Rouven Czerwinski 2024-10-25  168  	if (!m9189)
25cef47404912c Rouven Czerwinski 2024-10-25  169  		return -ENOMEM;
25cef47404912c Rouven Czerwinski 2024-10-25  170  
25cef47404912c Rouven Czerwinski 2024-10-25  171  	m9189->supply = devm_regulator_get(dev, "vdd");
25cef47404912c Rouven Czerwinski 2024-10-25  172  	if (IS_ERR(m9189->supply))
25cef47404912c Rouven Czerwinski 2024-10-25 @173  		return dev_err_probe(dev, ret, "Failed to get regulator\n");
25cef47404912c Rouven Czerwinski 2024-10-25  174  
25cef47404912c Rouven Czerwinski 2024-10-25  175  	m9189->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
25cef47404912c Rouven Czerwinski 2024-10-25  176  	if (IS_ERR(m9189->reset_gpio))
25cef47404912c Rouven Czerwinski 2024-10-25  177  		return dev_err_probe(dev, PTR_ERR(m9189->reset_gpio),
25cef47404912c Rouven Czerwinski 2024-10-25  178  				     "Failed to get reset-gpios\n");
25cef47404912c Rouven Czerwinski 2024-10-25  179  
25cef47404912c Rouven Czerwinski 2024-10-25  180  	m9189->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
25cef47404912c Rouven Czerwinski 2024-10-25  181  	if (IS_ERR(m9189->standby_gpio))
25cef47404912c Rouven Czerwinski 2024-10-25  182  		return dev_err_probe(dev, PTR_ERR(m9189->standby_gpio),
25cef47404912c Rouven Czerwinski 2024-10-25  183  				     "Failed to get standby-gpios\n");
25cef47404912c Rouven Czerwinski 2024-10-25  184  
25cef47404912c Rouven Czerwinski 2024-10-25  185  	m9189->dsi = dsi;
25cef47404912c Rouven Czerwinski 2024-10-25  186  	mipi_dsi_set_drvdata(dsi, m9189);
25cef47404912c Rouven Czerwinski 2024-10-25  187  
25cef47404912c Rouven Czerwinski 2024-10-25  188  	dsi->lanes = 4;
25cef47404912c Rouven Czerwinski 2024-10-25  189  	dsi->format = MIPI_DSI_FMT_RGB888;
25cef47404912c Rouven Czerwinski 2024-10-25  190  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
25cef47404912c Rouven Czerwinski 2024-10-25  191  
25cef47404912c Rouven Czerwinski 2024-10-25  192  	drm_panel_init(&m9189->panel, dev, &m9189_panel_funcs,
25cef47404912c Rouven Czerwinski 2024-10-25  193  		       DRM_MODE_CONNECTOR_DSI);
25cef47404912c Rouven Czerwinski 2024-10-25  194  	m9189->panel.prepare_prev_first = true;
25cef47404912c Rouven Czerwinski 2024-10-25  195  
25cef47404912c Rouven Czerwinski 2024-10-25  196  	ret = drm_panel_of_backlight(&m9189->panel);
25cef47404912c Rouven Czerwinski 2024-10-25  197  	if (ret)
25cef47404912c Rouven Czerwinski 2024-10-25  198  		return dev_err_probe(dev, ret, "Failed to get backlight\n");
25cef47404912c Rouven Czerwinski 2024-10-25  199  
25cef47404912c Rouven Czerwinski 2024-10-25  200  	drm_panel_add(&m9189->panel);
25cef47404912c Rouven Czerwinski 2024-10-25  201  
25cef47404912c Rouven Czerwinski 2024-10-25  202  	ret = mipi_dsi_attach(dsi);
25cef47404912c Rouven Czerwinski 2024-10-25  203  	if (ret < 0) {
25cef47404912c Rouven Czerwinski 2024-10-25  204  		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
25cef47404912c Rouven Czerwinski 2024-10-25  205  		drm_panel_remove(&m9189->panel);
25cef47404912c Rouven Czerwinski 2024-10-25  206  		return ret;
25cef47404912c Rouven Czerwinski 2024-10-25  207  	}
25cef47404912c Rouven Czerwinski 2024-10-25  208  
25cef47404912c Rouven Czerwinski 2024-10-25  209  	return 0;
25cef47404912c Rouven Czerwinski 2024-10-25  210  }
25cef47404912c Rouven Czerwinski 2024-10-25  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
