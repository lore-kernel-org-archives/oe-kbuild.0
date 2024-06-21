Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D4197
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 00:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718931073; cv=none; b=Spdgq1a0zymLBI+eEoTjaVsV5/e64Gg6pQuXi7C6BKoOfBXW3oYKCBHwANJzAgl7SqSTbooWeXS+6WQ+Qpk+8bhps4vUmN/iXuEeAf+U0vZVsPfmrYbIEHlk9ALWOGAkvC3QtgxX8jOazUyWqMHxgKMvlQcesdVpFQ7dTr2Ol5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718931073; c=relaxed/simple;
	bh=Vl7E62tbZZbyxk00NAy8VgLauFMOsa3iSq8RP1nK9mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEVPQx8UJbFMjLAoZIGvRt4b9S4QkwYaetxRCPKhVarNi2IVOKoxd2FXKZshxK7BL3QvM+LGTuH2xtHxNJdSVGG20+HH7At8lRv6toXxTufhq49Gu1hb/CCwlvcAFf4g0PqiXGDoVgJN8qeUp9YSSYoYD0ofQ3eiecgb+aCtlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkwBFUaD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkwBFUaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718931071; x=1750467071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vl7E62tbZZbyxk00NAy8VgLauFMOsa3iSq8RP1nK9mw=;
  b=HkwBFUaDDK35s3Lw7kww3RJxFzFN0xPjCgYjrdwhltEUcs7yvnZF1H2n
   AcktVYmvt2r3o9cRccXiOZBMSfK3NFAPPDF6ZV7PuPVud2dT6muKSpy7H
   sIuMNkUEtgoyRaGvP8JIw32mbaQI3uCbenft8Y6Ou/upQVok20tn83DVN
   +KCRa58PwsFpgl7zuF8LwmvVvUpJkxyHrguR4I55c42sEHLCxuJTn9CUi
   xIZztxKD9LPna+Sy6U44YkL9Rz3Ze6cwhs4rSuEiMKkYsd0kTW2ogcmXE
   CS8itntkZihUGFowDTLe15aGJNb9+njUGBYkgQHZ87xEcDVVDAnEXDXCV
   g==;
X-CSE-ConnectionGUID: fYvOhVlIR9SbSCywfzft0g==
X-CSE-MsgGUID: O/Ow+nVCQxepDag8qv0UAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19723370"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="19723370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:51:10 -0700
X-CSE-ConnectionGUID: K032b/OQQlSYlUgGzAImcg==
X-CSE-MsgGUID: 4ih0RFoCSjatmrhPB6hvEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="47377616"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jun 2024 17:51:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKSUb-00084r-2v;
	Fri, 21 Jun 2024 00:51:05 +0000
Date: Fri, 21 Jun 2024 08:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for
 configuration
Message-ID: <202406210841.Q17G5ISz-lkp@intel.com>
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
In-Reply-To: <20240618081515.1215552-3-kikuchan98@gmail.com>
References: <20240618081515.1215552-3-kikuchan98@gmail.com>
TO: Hironori KIKUCHI <kikuchan98@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: Hironori KIKUCHI <kikuchan98@gmail.com>
CC: Jagan Teki <jagan@amarulasolutions.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org

Hi Hironori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc4 next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hironori-KIKUCHI/dt-bindings-display-st7701-Add-Anbernic-RG28XX-panel/20240618-161849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240618081515.1215552-3-kikuchan98%40gmail.com
patch subject: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for configuration
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210841.Q17G5ISz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406210841.Q17G5ISz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sitronix-st7701.c:1076 st7701_dsi_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1076 drivers/gpu/drm/panel/panel-sitronix-st7701.c

433b7d46874577 Hironori KIKUCHI 2024-06-18  1061  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1062  static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1063  {
433b7d46874577 Hironori KIKUCHI 2024-06-18  1064  	struct st7701 *st7701;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1065  	int err;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1066  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1067  	err = st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1068  	if (err)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1069  		return err;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1070  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1071  	st7701 = dev_get_drvdata(&dsi->dev);
849b2e3ff96982 Jagan Teki       2019-01-25  1072  	st7701->dsi = dsi;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1073  	st7701->write_command = st7701_dsi_write;
849b2e3ff96982 Jagan Teki       2019-01-25  1074  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1075  	if (!st7701->desc->lanes)
433b7d46874577 Hironori KIKUCHI 2024-06-18 @1076  		return dev_err_probe(&dsi->dev, err, "This panel is not for MIPI DSI\n");
433b7d46874577 Hironori KIKUCHI 2024-06-18  1077  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1078  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
433b7d46874577 Hironori KIKUCHI 2024-06-18  1079  			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1080  	dsi->format = st7701->desc->format;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1081  	dsi->lanes = st7701->desc->lanes;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1082  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1083  	mipi_dsi_set_drvdata(dsi, st7701);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1084  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1085  	err = mipi_dsi_attach(dsi);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1086  	if (err)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1087  		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
c62102165dd792 Marek Vasut      2022-10-15  1088  
c62102165dd792 Marek Vasut      2022-10-15  1089  	return 0;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1090  }
c62102165dd792 Marek Vasut      2022-10-15  1091  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
