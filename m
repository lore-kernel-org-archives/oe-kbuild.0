Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3034F14D70E
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952332; cv=none; b=tnqclyyfQLBKZXK4pIhm9PLkQAlY+qohenbGohDXpS0ODMEfvSpNnp15bjntVSuaV6/6KktIAnSsmBCiBE5C2gYFF8qb2NMlDaiNApT1mYdrcGE0o6uRt0ZZPaCB1T7iKddVkQHsusimcrrS6upJ1IW/iwqCIc/f0z2pLU4Bahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952332; c=relaxed/simple;
	bh=CpakMGBjVArJKEohlvyKPx8MWVCmNQuSsutsRiluHbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=I4keAJ5mi6aXjaCkLzQq4JFSQPfoBDEJBiPGcmgfw9ghc320oyDEkoCSfx/kZwGRX2nFBasB3zVsIn1LuaG4miFRL81HAPqWYJPv3yJjcpIJ5cZYd7l1cjdHiDLqw9TXXawaBV7unNFVSWYD9zz7iauNAfmWqn3YE2ORjS5i/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPOvWivc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPOvWivc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f04afcce1so191498266b.2
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718952328; x=1719557128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LOYpscBQcVLtcb6ya8dy1caHHgeSBmzhIDNmZBhcMlI=;
        b=TPOvWivc9d8BTvUEdrKpfreU46ulsEsUuidGGhtuD+MO/ITmcz2o1IQ1WkmJnS17Sf
         ipyj8cdblPLWBhRwrZzB7dkHZlHvJ3VciFNzX4zonmgd/wwrhYReX5602p2AdbrO3sw6
         7KQd58wEYqf60QKcpzPUl072uZsDg1nZL2qr9CLe78JWLD4eljdKVuTlfond4XreNcUU
         yYmQl5DFYDEtTgq0M8B1+ps6HvWBEwIvkbbbOAQJ71bijTVRvBDaok9E3JQBweaEir3+
         9mFdlo6SQ3KDpqtN+cEF/Y1uawmSaroh1ezr1SIc2iqygvmIG4+Uh3MpHd7dv2GAQz1v
         o6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952328; x=1719557128;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOYpscBQcVLtcb6ya8dy1caHHgeSBmzhIDNmZBhcMlI=;
        b=pH9M1Qjppj5i99w1anzN8UOxPJxj/GdUkOrPaq+47eAC2Y4NTRHhwLMukgHrWu8+DE
         6l8XgCzRnKPHX/iOgKYxHsuhXTQ8/MRWh8HNoxaaSAgifrL4osEnxABrTl5bp4wiFoyL
         Xj4XMd+D33Wf3AA4vRwCghSfpHaKgpOVArBzC1LqVCFJRsmJD6bcYK0m5l5s2y8Tzsf/
         Ny/oRflD6S1Z+WSJb88TNIWG0Fx7pK8ayLSWwOlHiP5skunToVFH2uWTLSsj19Smx+f9
         SqVNfnAiXmgxVuG93pL8Fshx97F8EQ7CCW9oKHIpBvseE/B1AWG32Cgi2QUG2oVlqYHB
         nVzQ==
X-Gm-Message-State: AOJu0Ywu48KiYPCUOZRxkrDabHaCAcbyHHnbC55LgRfy2t9J6pQ6xmZ4
	/sEae7M7Vj2+TyMP3TgqtfjDONukilBjj/yobS7E7V9NdUD/uzUcpgnBlubMtFne3V//Cu9FWhc
	t
X-Google-Smtp-Source: AGHT+IE/RW1qpDBHJvcW0UivXwa6iqk3KIN1A0ymm7K1Pe8/Mtu6FQAOmwoZl7dSUg6M4QXhNlB/5A==
X-Received: by 2002:a17:907:874e:b0:a6f:ab9c:7779 with SMTP id a640c23a62f3a-a6fab9c7942mr627533266b.9.1718952328231;
        Thu, 20 Jun 2024 23:45:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560908sm48090766b.184.2024.06.20.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:45:27 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:45:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hironori KIKUCHI <kikuchan98@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for
 configuration
Message-ID: <dceac1a6-25bf-4d04-a049-4c67846027f2@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618081515.1215552-3-kikuchan98@gmail.com>

Hi Hironori,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hironori-KIKUCHI/dt-bindings-display-st7701-Add-Anbernic-RG28XX-panel/20240618-161849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240618081515.1215552-3-kikuchan98%40gmail.com
patch subject: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for configuration
config: i386-randconfig-141-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210841.Q17G5ISz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406210841.Q17G5ISz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sitronix-st7701.c:1076 st7701_dsi_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1076 drivers/gpu/drm/panel/panel-sitronix-st7701.c

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
                                                                                                ^^^
-EINVAL?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

