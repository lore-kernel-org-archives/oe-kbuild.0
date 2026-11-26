Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681209;
	b=IbALGrJhU4KVCMlY0wwYrpZ1D/5y3a0TcyJdE6/L2JrCdRIRJyaEiVfpDuTR3sjTSkX2
	 nygvtyYZ+C9l8hK6uZNR+GqOnfmEpEfd/fEVU2hUIVFUxGmBMw8lJsgU3oXhKST5I8w1t
	 jyWlSqE7Woe/gvuMljKU5zNWduw1SscHniPBndwWugbaLjK8fAzEX80V4faVxO0+Tfec4
	 v6PGNoWUM1V50gLyvSD3Fye6ztLS+NitG3LUoJjEfmqNqJRZB0vy/raDiQg+f+F7HhpWy
	 Tc2elXTQ9nBhvLrvFHzIH8FPo1qXtpkNky+HqY6II/yyphM4Mvlu1auMIpO81EgwcEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681209;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Mu/LSd7G+9+5uB+hF1eKPbW51pcbNNFs/xATLRv8VxU=;
	b=de+/hrTcohhqtB1jxTRXItV4G6KRxNqdCkLcDRUnXu9sYAd9cFLUHX9FR2OdiZ5oqKa+
	 ULOn+RuMioWXWr7ewpeMSghOgNpk37xs95PEcouEs/pm60q5xYa6L+RcU7xYuYNq/i43o
	 rogvuhqsoFfyb8Fs8HCDbiqASt2KVdcBX+IDtu18/lc0a+2xd2G1tlVUdDb/1ucVeH6dI
	 PYlhDMXoktWf8JPsntrJKKTT1WoVxYli+Ad5acA9hdzO4DEIi+q6v74Xmz4VTP4FurigY
	 071NFJ3QHRMFrJnveomPzHPe1AEFTo4IhUFmMskISevRwvfgChMx214Th/1JWhAJilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UahGLAks;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E1C606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 08:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UahGLAks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795681208; x=1827217208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLKWvuFr5bprKy8dDdbSz6IM1TScoh6/5/OtXDrdXLM=;
  b=UahGLAksbsdRv1A3G/gErsy3np7J23g7NiuYVYGmLa/ajrs7X24U68CP
   uhZUjye6j9DHmCfaiJRATAXxs8Rz7i5DH4IyXsYa87cPunP0yYhmi2C3Q
   9V7Mj9I9lez0KNgHXnRG8MWsRPprtY+RNw7TImXP4L8kRgqfGa1B/24c1
   sNB1pzsRjgxgfnHcUj8kRPItArWECtj7zbJxGbBTDIXDN/JVF+JASZ47x
   /UyGAqKTH+kZgMVJYEFdWu41BlCZZ/fbIYjt8qQrxGnz3XSL1k8Kpuspj
   CbYV0p1i5Zx+bJpSQMS9CxZONDYNAaXmuGuqJLHXuMOmV3Qy7/tdyrWQQ
   g==;
X-CSE-ConnectionGUID: +q5pJ9M8RpOm7Vt/HX8Kmg==
X-CSE-MsgGUID: abIR/iPKSD+Dhz3vE3rtaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4473283"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4473283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:20:08 -0800
X-CSE-ConnectionGUID: TREFINjLTjOk0bXtu+jcWg==
X-CSE-MsgGUID: IOCsOzwQTSSstCEy5pcTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11986363"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2026 00:20:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWUi4-00000001TcQ-127j;
	Thu, 26 Nov 2026 08:20:04 +0000
Date: Thu, 26 Nov 2026 16:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 32/32] drm/mxsfb/lcdif: enable bridge hotplug
Message-ID: <20261126161109.o0xo4dqY-lkp@intel.com>
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

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>
TO: Luca Ceresoli <luca.ceresoli@bootlin.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Inki Dae <inki.dae@samsung.com>
TO: Jagan Teki <jagan@amarulasolutions.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Jessica Zhang <jesszhan0024@gmail.com>
TO: Douglas Anderson <dianders@chromium.org>
TO: Marek Vasut <marex@denx.de>
TO: Stefan Agner <stefan@agner.ch>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Hui Pu <Hui.Pu@gehealthcare.com>
CC: Ian Ray <ian.ray@gehealthcare.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 479e381e77dcde0dfcc9d51e89ff3273da199804]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-display-hdmi-cec-helper-use-drmm_-prefix-for-drmm-action/20261125-185014
base:   479e381e77dcde0dfcc9d51e89ff3273da199804
patch link:    https://lore.kernel.org/r/20261125-drm-bridge-hotplug-v4-32-822722850492%40bootlin.com
patch subject: [PATCH v4 32/32] drm/mxsfb/lcdif: enable bridge hotplug
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261126/20261126161109.o0xo4dqY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126161109.o0xo4dqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126161109.o0xo4dqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/display/drm_hotplug_helper.c:10:
   In file included from include/drm/drm_bridge.h:31:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:33:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/display/drm_hotplug_helper.c:235:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     235 |         }
         |         ^
   2 warnings generated.


vim +235 drivers/gpu/drm/display/drm_hotplug_helper.c

6ee877a9b7f826b Luca Ceresoli 2026-11-25  200  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  201  static int drm_hotplug_helper_handle_event(struct notifier_block *nb,
6ee877a9b7f826b Luca Ceresoli 2026-11-25  202  					   unsigned long event, void *data)
6ee877a9b7f826b Luca Ceresoli 2026-11-25  203  {
6ee877a9b7f826b Luca Ceresoli 2026-11-25  204  	struct drm_hotplug_helper *hotplug_helper =
6ee877a9b7f826b Luca Ceresoli 2026-11-25  205  		container_of(nb, struct drm_hotplug_helper, drm_event_nb);
6ee877a9b7f826b Luca Ceresoli 2026-11-25  206  	struct device *dev = hotplug_helper->encoder->dev->dev;
6ee877a9b7f826b Luca Ceresoli 2026-11-25  207  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  208  	guard(mutex)(&hotplug_helper->event_mutex);
6ee877a9b7f826b Luca Ceresoli 2026-11-25  209  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  210  	dev_dbg(dev, "received event %lu\n", event);
6ee877a9b7f826b Luca Ceresoli 2026-11-25  211  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  212  	switch (event) {
6ee877a9b7f826b Luca Ceresoli 2026-11-25  213  	case DRM_BRIDGE_ADDED:
6ee877a9b7f826b Luca Ceresoli 2026-11-25  214  	case DRM_MIPI_DSI_ATTACHED:
6ee877a9b7f826b Luca Ceresoli 2026-11-25  215  		/*
6ee877a9b7f826b Luca Ceresoli 2026-11-25  216  		 * A bridges hot-plugged, try adding the
6ee877a9b7f826b Luca Ceresoli 2026-11-25  217  		 * drm_bridge_connector
6ee877a9b7f826b Luca Ceresoli 2026-11-25  218  		 */
6ee877a9b7f826b Luca Ceresoli 2026-11-25  219  		drm_hotplug_helper_try_complete(hotplug_helper);
6ee877a9b7f826b Luca Ceresoli 2026-11-25  220  		break;
6ee877a9b7f826b Luca Ceresoli 2026-11-25  221  	case DRM_BRIDGE_DETACHED:
6ee877a9b7f826b Luca Ceresoli 2026-11-25  222  	{
6ee877a9b7f826b Luca Ceresoli 2026-11-25  223  		/*
6ee877a9b7f826b Luca Ceresoli 2026-11-25  224  		 * A bridge was unplugged, remove the drm_bridge_connector
6ee877a9b7f826b Luca Ceresoli 2026-11-25  225  		 * if it's part of the same pipeline
6ee877a9b7f826b Luca Ceresoli 2026-11-25  226  		 */
6ee877a9b7f826b Luca Ceresoli 2026-11-25  227  		struct drm_bridge *bridge = (struct drm_bridge *)data;
6ee877a9b7f826b Luca Ceresoli 2026-11-25  228  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  229  		if (hotplug_helper->connector &&
6ee877a9b7f826b Luca Ceresoli 2026-11-25  230  		    bridge->encoder == hotplug_helper->encoder)
6ee877a9b7f826b Luca Ceresoli 2026-11-25  231  			drm_hotplug_helper_connector_remove(hotplug_helper);
6ee877a9b7f826b Luca Ceresoli 2026-11-25  232  		break;
6ee877a9b7f826b Luca Ceresoli 2026-11-25  233  	}
6ee877a9b7f826b Luca Ceresoli 2026-11-25  234  	default:
6ee877a9b7f826b Luca Ceresoli 2026-11-25 @235  	}
6ee877a9b7f826b Luca Ceresoli 2026-11-25  236  
6ee877a9b7f826b Luca Ceresoli 2026-11-25  237  	return NOTIFY_DONE;
6ee877a9b7f826b Luca Ceresoli 2026-11-25  238  }
6ee877a9b7f826b Luca Ceresoli 2026-11-25  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
