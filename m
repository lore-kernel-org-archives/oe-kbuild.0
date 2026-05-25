Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6325B0A7
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673397; cv=none; b=pi3JXLh39urP0QYDhmFNByW0Cc9ARulPjGPg/gpYzHcijmaubOgbPQwuTO+btmZWUJWZl9kfHUa7MEmwOqsdzAZbK8yJn31dJbvPbBXgPmlbGKvISx2O7MCBtwmTWw/B1zqVHbemNNBrVaRc4fDoE+NycEoZpLXY1wH1sj7+a14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673397; c=relaxed/simple;
	bh=fhJH5lBgg9Y3pmoXIViPxvY2vm9E4GaacO6OAIcUwpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CFyy2lNDEXyhUvAL7JDHWY92jHTTS6taMDON1lE/yyWbrNvH/CC9trI7z4AEYqeC/cNbnm7CjC4bmUhmBURJ1r3ZPGhJljHvU3ccbBkvn2oao3wBcHjPIxhfnJlHXsD+KD1EWBONgJYQyahSGdjy02grQuYLTizcJIhc4v6NS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luMHv8MX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luMHv8MX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779673394; x=1811209394;
  h=date:from:to:cc:subject:message-id;
  bh=fhJH5lBgg9Y3pmoXIViPxvY2vm9E4GaacO6OAIcUwpk=;
  b=luMHv8MXHk68BiDv7KJXEImHPrJfwwDx0Hyb2ufxovLgiBndsegtRfFu
   T3+icao7FvNvVQnc/KvjcoKj19/eEGp/GvHx1YaBj3X5n0VoZQLLRyAGH
   Kf4y/JvYQNVnmNZSDUejSR1rtRlq/Kseef4XoswKueHlH9LaHzEZujQBq
   YO84TlyuyAZt7W69wSrft3pNdbRAac6DhVZYyDn3NBdSLEoVt3YjpjVNl
   nqCwd8HSIzn9kkJy9qeKF9fi28AZO8riyTlY65jsASeZuXmWrPAaZ/bx3
   0BCEmTT8qV1cgyn4HkjFltRfZgg7AjTfwGYaij+3sqVkdTwKAy6aHhRZF
   w==;
X-CSE-ConnectionGUID: nykNIUgvR1+l47g5+yMQ0g==
X-CSE-MsgGUID: qgWbVox5Rv+ORicdkit9mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="98072001"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="98072001"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 18:43:14 -0700
X-CSE-ConnectionGUID: epgAXDqxQdGuoXYwqVm0dQ==
X-CSE-MsgGUID: sagUvzfVTiGXSnMXm9cjLA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2026 18:43:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRKLX-00000000C6T-07Kz;
	Mon, 25 May 2026 01:43:11 +0000
Date: Mon, 25 May 2026 03:43:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dtb:
 lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[57]]
Message-ID: <202605250318.3qbG4Pbj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cbfe4502e3d4bda48eb4b83dfad8d7da3b22e90
commit: 1c69ba9bf0f3032428e6820bada0bb50016a5db6 dt-bindings: lcdif: add lcd panel related property for imx28
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2054-20260520 (https://download.01.org/0day-ci/archive/20260525/202605250318.3qbG4Pbj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250318.3qbG4Pbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1c69ba9bf0f3 ("dt-bindings: lcdif: add lcd panel related property for imx28")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250318.3qbG4Pbj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[57]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 46, 'display-timings': {'native-mode': [[47]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 47}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: gpio-expander@44 (st,stmpe811): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: gpio-expander@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 44, 'display-timings': {'native-mode': [[45]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 45}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: gpio-expander@44 (st,stmpe811): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: gpio-expander@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 44, 'display-timings': {'native-mode': [[45]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 45}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[46, 1, 0]], 'scl-gpios': [[46, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[61]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']
--
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[65]], 'sda-gpios': [[29, 1, 0]], 'scl-gpios': [[29, 0, 0]], 'clock-frequency': 400000, 'status': ['disabled'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[55]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
