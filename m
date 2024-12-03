Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CE51E1A3C
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221531; cv=none; b=FkAc0gsvn3Z1lLr2HjpxYfLgnCbgLaftbef9emdBrcnGcn1vA3DEI6a3bAjYu/D4Gwjj08h7UN0EixGmK73o/FNzadejGu3+ORs1Z8GZ+5l5l/WEYwkmRb7ntqwZlFUaqFKOGn796KZpV88NPYJY4wXBAomckm3lkIk8/pIkghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221531; c=relaxed/simple;
	bh=wNSRs1xlzEJFuADPUbHKLiWB91WOaWpXYIX1DF5jp0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNi2Z/eneZG5a/MTQJAtBp6RIbZMEuNqd2apbCKgyhhWO5RJmQcUwjCEYAogOJaRFsZ/gOsqr+305+LYIUxot+R1EsYgrW0ccwXzkxV1gAwLJzcwaiPvpV0UO5M1ssL4rnNEec3hDHu6363Ww/sI/cATYDWplVeUwfx5Y7nNTa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFPLmV+R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFPLmV+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733221529; x=1764757529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNSRs1xlzEJFuADPUbHKLiWB91WOaWpXYIX1DF5jp0g=;
  b=XFPLmV+RrZOpDbQMYudG0OC50qZYCOvnblKegankoJy8Fdpe3x/fVkou
   uBCsWpPfuTBDd8gpfwW5gs2xA4fULpSNBvf4EvDtvpC8Mgbuu1jvtXTQB
   aC6YOiWeiPZXwY3zwUHNs7IblUXd70nrf6V2VEiYYYX8m14FvY9s9Ayk9
   zBAoVfQHo2tiGo3U4iFgmfXJpAARnErg69P7DkkjdOkhbSUcdz/jcKIia
   2bLCPm6prAyuQvmjyf6jjGmXI51LKr79JHhS60T7wkXRdlnBqYbQ4QqP3
   oCRkPQ5kQb8/Epl9+xjFtMEKqwn9QTm76NwLwZfPIvntGstCMbqwYWA15
   A==;
X-CSE-ConnectionGUID: OkbkJVLvQ2G//OPQ9yBrhA==
X-CSE-MsgGUID: VEnzjz5wShWEw04QLHHJDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37199042"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37199042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:25:29 -0800
X-CSE-ConnectionGUID: ndTBenFlQPuFDICsCN6+2Q==
X-CSE-MsgGUID: n+loSSRCQBSHwN4W4r5NXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="124224886"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2024 02:25:28 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIQ5t-0000XT-2S;
	Tue, 03 Dec 2024 10:25:25 +0000
Date: Tue, 3 Dec 2024 18:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
Message-ID: <202412031857.OWe09h5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
References: <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
TO: Jonas Rebmann <jre@pengutronix.de>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Schocher <hs@denx.de>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: David Jander <david@protonic.nl>
CC: kernel@pengutronix.de
CC: Jonas Rebmann <jre@pengutronix.de>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7af08b57bcb9ebf78675c50069c54125c0a8b795]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/mtd-mchp48l640-make-WEL-behaviour-configurable/20241203-033012
base:   7af08b57bcb9ebf78675c50069c54125c0a8b795
patch link:    https://lore.kernel.org/r/20241202-mb85rs128ty-v1-2-a660b6490dc8%40pengutronix.de
patch subject: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty compatible
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-052-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031857.OWe09h5w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031857.OWe09h5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412031857.OWe09h5w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/timer/fsl,imxgpt.yaml#
   arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
   	'fsl,imx7d-mipi-dsim' is not one of ['samsung,exynos3250-mipi-dsi', 'samsung,exynos4210-mipi-dsi', 'samsung,exynos5410-mipi-dsi', 'samsung,exynos5422-mipi-dsi', 'samsung,exynos5433-mipi-dsi', 'fsl,imx8mm-mipi-dsim', 'fsl,imx8mp-mipi-dsim']
   	'fsl,imx8mn-mipi-dsim' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
   arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: /soc/bus@30400000/dsi@30760000: failed to match any schema with compatible: ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim']
   arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: /soc/bus@30400000/pcie-phy@306d0000: failed to match any schema with compatible: ['fsl,imx7d-pcie-phy']
>> arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: sram@0: compatible: ['microchip,48l640'] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#
>> arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dtb: sram@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
