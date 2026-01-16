Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61662137930
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563300; cv=none; b=XaouZa8C/BSowOgNS3TQ10jiT8s6l+EKtntS09O/he923ep4BKRZMtZl8jOnjJjyV9jzUdceNyQL+AMOdH8AfWGOVOHLlFgv9D3BAv8z1dVG8wfs6h/k/R/MwWt6eFKpLvK5R5bk8XDtFfL/ktbd46iy9NeJ9JpUg0ihyKsUsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563300; c=relaxed/simple;
	bh=QiZi9Xk4J/5/NRt8NtLETbJnJttdFSfk9z4xm5mum7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uw6wUMsOI4H6yyc/J5IJZmkxddw6pnfYqHyUsVW6clH3dEcCzMDkTBJqr42MOKyC837nyH79c+lRmu6OarK998PifN+RoCzm0pxcN/goP+kSquo/CMUDHRG2OTqX0Ny3HRj0obC4aFd4lhBfxe6hYZtGUcI+u+TR9Ad0Jm5bBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCgYsD6B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCgYsD6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768563298; x=1800099298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiZi9Xk4J/5/NRt8NtLETbJnJttdFSfk9z4xm5mum7g=;
  b=gCgYsD6B+tWk541085EAX8dHID7E/Z48/arZ+AItEyNFFSPPl2m2sNRe
   6tGpKNDgySQQ9CgARfEK6tz0VoVAvBU9ifYK9oCZBX54rU+YsggGBl5GU
   lP67WjHMko8ktI5GES4qzZueJE9Q8skvYAQK5FpRO4WkiRFVSozKS1DV2
   MkZNN/FaNNuks01GxjQhVSqEsccWfs/4d+S5/co5VcqlvhddU7FRUdlbq
   nywdwQs+TfHNUOcdoVg2FeK7QjvZG+DJu/pZV+JEM5jAxv1bPDec1RI1Y
   L4NICHAVeFa9730iIQ83fD8jgBqSKBrRxLPcVe6YLIfhaeoeEBY+dXhGi
   Q==;
X-CSE-ConnectionGUID: tGWYEzZxRxyRQ3I2FAdzMg==
X-CSE-MsgGUID: jyep/PLRSv+VGEbK0dLriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80519793"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="80519793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:34:57 -0800
X-CSE-ConnectionGUID: K/oOiuBwQdKhrk2z6jOenQ==
X-CSE-MsgGUID: cyFkZoJ3T56rwnbwPGAgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204430431"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2026 03:34:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgi6P-00000000Km4-3lOt;
	Fri, 16 Jan 2026 11:34:53 +0000
Date: Fri, 16 Jan 2026 19:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <202601161924.VK7E8f5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/imx/imx93-pdfc.c:224:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-2-2c5051e4b144@pengutronix.de>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-2-2c5051e4b144@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Peng Fan <peng.fan@nxp.com>
TO: Liu Ying <victor.liu@nxp.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: luca.ceresoli@bootlin.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: Marco Felsch <m.felsch@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/dt-bindings-soc-imx93-media-blk-ctrl-Add-PDFC-subnode-to-schema-and-example/20260115-232607
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260115-v6-18-topic-imx93-parallel-display-v9-2-2c5051e4b144%40pengutronix.de
patch subject: [PATCH v9 2/3] drm/bridge: imx: Add i.MX93 parallel display format configuration support
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc64-randconfig-r133-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161924.VK7E8f5i-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161924.VK7E8f5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601161924.VK7E8f5i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/imx/imx93-pdfc.c:224:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:224:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:225:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:225:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:226:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:226:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:226:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:226:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +224 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

b6d3ebb5b43dbe Liu Ying 2026-01-15  223  
b6d3ebb5b43dbe Liu Ying 2026-01-15 @224  MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
