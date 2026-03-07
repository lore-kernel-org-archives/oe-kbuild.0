Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C22270EC1
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 01:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772847849; cv=none; b=M1cyNy9u66a82MQGGbI+HEbmDi3PBb1Eicg2aHgT8k8jPbG9rEC8Ztt09B3OQllFZn5Urqs7ZkkvGk48mHmH/avZ83KCihmjla3trYHTXcJYnxfuPrx4/T7/N6hAuqPi4o8cibySbD9JKW4c+QjJkk5fL3dqStWXEXC7jsuAA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772847849; c=relaxed/simple;
	bh=QIRVYT30gAeV0/oABxFtfEbBBlEJ5ecVAHWk2N0DAG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PesoImO3YmJS9YXgTOP1nrKZvprAGXlN/6/Dnr0bvnpr1PiBCMhPh2mEdNpMjs6g0M2kLqoywTUZbcp4tiDYfgI0ZpggIDhy36NERjWzBuOg19n19mch4vKBroux0YHdMVGvuYN6dDRKjWpC2++fxBzdt+3FTJr9Hm2tf4eAoVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkjREsst; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkjREsst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772847847; x=1804383847;
  h=date:from:to:cc:subject:message-id;
  bh=QIRVYT30gAeV0/oABxFtfEbBBlEJ5ecVAHWk2N0DAG4=;
  b=CkjREsstdjnVuzZJpw3kkKBKIiVGpjVB0sO2ey13qTFLbno5ML2KzZGS
   rc/TJlADVXLwMprZN025lkMME3YHqzzBjxtLSeGcIaVPeoV1UZ8VDMIdl
   YyWkwQVFki8KGf5usQTOMTK3tANDWaW33xq4I0x4rhqNjfhmMJEO3bub6
   s9pIIdgltQjSxi24vRUKOLI9Q6907+AQRCuhtHjNgDN9YoqUDQQg35pNt
   RRNtPv7mGXtBNl3ZbBoTdSpO++tRt8OX8o4w4k9v4wzCZEcgAQrOt2JLL
   q+uj8rcwjnWQkIXrbi5abSPPKnyA3wiL7PRXgJ57mHg0L17tJ3Rcu52MZ
   w==;
X-CSE-ConnectionGUID: XZ87SEHvQ1e2U7feFi2d4Q==
X-CSE-MsgGUID: BdGM7x/sRIejOzns0vCi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74073345"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="74073345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 17:44:06 -0800
X-CSE-ConnectionGUID: +LG2UDR9SvefUZCKuJ3mRw==
X-CSE-MsgGUID: MWc+TzLgTz6Pgaqgs6swrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219117920"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2026 17:44:04 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vygi2-000000002On-0wDa;
	Sat, 07 Mar 2026 01:44:02 +0000
Date: Sat, 07 Mar 2026 02:43:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 9/47]
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: system-controller@4ac10000
 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202603070252.mvuuNJ1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marco Felsch <m.felsch@pengutronix.de>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   455842162c230a6310e3cf9d9a14de9239d6763c
commit: 43eeae2b00013460193ae44fb71cf005098e16a1 [9/47] arm64: dts: imx93: Add parallel display output nodes
:::::: branch date: 8 hours ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2052-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070252.mvuuNJ1g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070252.mvuuNJ1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603070252.mvuuNJ1g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']
--
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
