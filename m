Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496C38B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723165881; cv=none; b=G2BD8X0CgVr6bBfQaMlOL3SrKbl3Icx51k5o6lWXOI2gTvQYO+qoOQiPYER7OMXRDhWWw3+5xijpHUD0jf7vKxxfRg8zukXX3QU2xB91rpGz/PzjaH62qw610LtXsovmoXGA8Xq4jculOrIJiU5Zw8sclaI7IPUIi0810FfNIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723165881; c=relaxed/simple;
	bh=ay6l3GH2slNY4hBcNRWxXIy1wKcMQPXzBi7it+wwdvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjHWZ6daroFG65lq29XxMcpOErh6U91B94VPx095owM+aMEAAbC0f49jgW+TJVA6SKxGKmYROE72GnqU57QTGp5/w1e5eIgqau5PIcAmbWNR/AYmPPdZf5pAjiJSso6g/7vkTKhlmBOWX2OmIR9QfTFbgXWppruZASUuuwBwokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+reCZP+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+reCZP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723165880; x=1754701880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ay6l3GH2slNY4hBcNRWxXIy1wKcMQPXzBi7it+wwdvw=;
  b=W+reCZP+tc2q4K73BD1BbUHfIO6EtbQ2RZ4ZgLR9zJ596SpoIYmOKs1a
   WqdtFHkDO8FJf1KUPnx4XEZ+ETJ4GBm1rdD8AOYCTc7MSpF2R2wpcg5Dh
   ZLIqndpyEoFTEjqcelwDoeOb21VssOiFkB+ZJTFr5jJyNueeWketYZuCs
   200pcyIxbmhujJmks+mEOE+mYpZN5qe6NuzSimIXWLk2kXFG8wKEls+tK
   AWGlwawLgpMYl0lIfIndFtP/CDOd4xpx4kzP9g7lO61wxU2BSISgf6V1S
   uHHNP/fARBHQT32BLJIkj50ujRuJGSFKgfkg9tQBb0buhWQNPHM5E/aHN
   g==;
X-CSE-ConnectionGUID: AV1G2ND4RhKummDg51nYtg==
X-CSE-MsgGUID: h+rW9UCfTOKgBGYTYZdc0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21185911"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21185911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 18:11:20 -0700
X-CSE-ConnectionGUID: /JeUi/wbTUiFNOFcFCPozQ==
X-CSE-MsgGUID: PGa3jTuGQ4KWZmEx07fh6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57969887"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2024 18:11:18 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scE9z-0006j3-2g;
	Fri, 09 Aug 2024 01:11:15 +0000
Date: Fri, 9 Aug 2024 09:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 52/78]
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /: i2c-gpio: {'compatible':
 ['i2c-gpio'], 'pinctrl-names': ['default'], 'pinctrl-0': [[47]], 'gpios':
 [[17, 2, 0], [31, 4, 0]], 'i2c-gpio,delay-us': [50], 'status': ['okay'],
 '#address-cells': 1, '#size-cells'...
Message-ID: <202408090918.QNJ40uzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve Jeong <steve@how2flow.net>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 95c198e2967f7f19e2d236190b1851075f2c5a4b [52/78] ODROID-COMMON: Add '--symbol' to device tree compiler
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090918.QNJ40uzw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090918.QNJ40uzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090918.QNJ40uzw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /: i2c-gpio: {'compatible': ['i2c-gpio'], 'pinctrl-names': ['default'], 'pinctrl-0': [[47]], 'gpios': [[17, 2, 0], [31, 4, 0]], 'i2c-gpio,delay-us': [50], 'status': ['okay'], '#address-cells': 1, '#size-cells': 0, 'phandle': 117, 'codec@a': {'compatible': ['fsl,sgtl5000'], 'reg': [[10]], 'clocks': [[48]], 'VDDA-supply': [[49]], 'VDDIO-supply': [[50]], '#sound-dai-cells': 0, 'phandle': 57}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /: mdio-gpio: {'compatible': ['virtual,mdio-gpio'], 'pinctrl-names': ['default'], 'pinctrl-0': [[52]], 'gpios': [[31, 26, 0], [31, 25, 0]], '#address-cells': 1, '#size-cells': 0, 'phandle': 119, 'switch@0': {'compatible': ['marvell,mv88e6085'], 'reg': [[0]], 'dsa,member': [0, 0], 'ports': {'#address-cells': 1, '#size-cells': 0, 'port@0': {'reg': [[0]], 'phy-mode': ['rev-mii'], 'ethernet': [[53]], 'fixed-link': {'speed': 100, 'full-duplex': True}}, 'port@1': {'reg': [[1]], 'label': ['netaux']}, 'port@3': {'reg': [[3]], 'label': ['netright']}, 'port@4': {'reg': [[4]], 'label': ['netleft']}}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /tz-interrupt-controller@e0000000: failed to match any schema with compatible: ['fsl,imx51-tzic', 'fsl,tzic']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /tz-interrupt-controller@e0000000: failed to match any schema with compatible: ['fsl,imx51-tzic', 'fsl,tzic']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/ipu@40000000: failed to match any schema with compatible: ['fsl,imx51-ipu']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@70000000/spba-bus@70000000/serial@7000c000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu1']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@70000000/spba-bus@70000000/serial@7000c000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
--
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /: i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[67]], 'gpios': [[45, 1, 0], [45, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'phandle': 152, 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled'], 'phandle': 153}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000: Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/spba-bus@2000000/asrc@2034000: failed to match any schema with compatible: ['fsl,imx6ul-asrc', 'fsl,imx53-asrc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/spba-bus@2000000/asrc@2034000: failed to match any schema with compatible: ['fsl,imx6ul-asrc', 'fsl,imx53-asrc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/tsc@2040000: failed to match any schema with compatible: ['fsl,imx6ul-tsc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6ul-anatop', 'fsl,imx6q-anatop', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6ul-anatop', 'fsl,imx6q-anatop', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6ul-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2000000/iomuxc-gpr@20e4000: failed to match any schema with compatible: ['fsl,imx6ul-iomuxc-gpr', 'fsl,imx6q-iomuxc-gpr', 'syscon']
--
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /: i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[64]], 'gpios': [[28, 1, 0], [28, 0, 0]], 'clock-frequency': 400000, 'status': ['disabled'], 'phandle': 155, 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled'], 'phandle': 156}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: nand-controller@1806000: Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/spba-bus@2000000/asrc@2034000: failed to match any schema with compatible: ['fsl,imx6ul-asrc', 'fsl,imx53-asrc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/spba-bus@2000000/asrc@2034000: failed to match any schema with compatible: ['fsl,imx6ul-asrc', 'fsl,imx53-asrc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/tsc@2040000: failed to match any schema with compatible: ['fsl,imx6ul-tsc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6ul-anatop', 'fsl,imx6q-anatop', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6ul-anatop', 'fsl,imx6q-anatop', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6ul-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2000000/iomuxc-gpr@20e4000: failed to match any schema with compatible: ['fsl,imx6ul-iomuxc-gpr', 'fsl,imx6q-iomuxc-gpr', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
