Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16154139B
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748724409; cv=none; b=bsw5P04frP5dvpIXEVCDJXULsW9zmY2dC+88TkU0sapBGNQSD4nxFmVm7gfZp9oPLJPQc7igYoSge+fQM78Mc9m/N4vzNjF1726lkfxyowAvB7m11+YpMyWj2/suuXgZOPtSdEc8mIEnyED8XgbsSc600nMzGr429VG9LZinQlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748724409; c=relaxed/simple;
	bh=N2PBFNMWpmhDMscIudQiCudk9VXIWjHrlVsbxOFfuR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmUFK24kUp89B/ZTnmDEC85jSVjGd8GwqmdDDE6SBMOsYatkv5i/i/CfQ5CJQ1tVneZSBH3oPUjqA8H31EhiMletfimdE7rvbdq1KkK+UTL4qSYnUs1jcqF82Dz1Kx2AbrG3APNtcgZbv7ZVWssDmptciiJ3AwXIgWr3NxJNucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exBIljNW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exBIljNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748724408; x=1780260408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2PBFNMWpmhDMscIudQiCudk9VXIWjHrlVsbxOFfuR0=;
  b=exBIljNW+jCU9GyQ5VOkj0fehGGVz36uOgY1esoCfSGV1N21wqaAJcSt
   3ilyjgc90SLigFozO3wJmvjikad9mNQNq5KWH1/DllEoEmrPnHA3Sf6hf
   gpRYuKfiQPRZh9OTB6tdMd7l+VsclAjwgE97g3imnfr3R7b58wDn5df8L
   kgoQaWOpSLLSG4jLfe9GW4Ld7zlNormjeb20fALvIJK7/OWr2kxQBe8gX
   U0XuKh6F8mX1dDGrLcig1g9uPYrMmGput5sujXmE7H2toyyFlYjTJMIw3
   IeXob+F7ZDlBGq6idY/+3xXb3BgnYwWBQKla/vkFNpkm7AdMVdUy9MBzk
   A==;
X-CSE-ConnectionGUID: k0s4jrExSMaw/eRphUYv7w==
X-CSE-MsgGUID: jOo4O1kXSNO1eVU7K1HsTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50482498"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50482498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 13:46:47 -0700
X-CSE-ConnectionGUID: xALE4aiAQDK4FzKQgYHXUg==
X-CSE-MsgGUID: eJCk14s8SZyFWg4Yq5lNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144206098"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2025 13:46:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLT6J-000YdQ-09;
	Sat, 31 May 2025 20:46:43 +0000
Date: Sun, 1 Jun 2025 04:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: lcdif: add lcd panel related property
 for imx28
Message-ID: <202506010427.hGW7ao2S-lkp@intel.com>
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
In-Reply-To: <20250529200520.798117-1-Frank.Li@nxp.com>
References: <20250529200520.798117-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Marek Vasut <marex@denx.de>
TO: Stefan Agner <stefan@agner.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "open list:MXSFB DRM DRIVER" <dri-devel@lists.freedesktop.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-lcdif-add-lcd-panel-related-property-for-imx28/20250530-040705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529200520.798117-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: lcdif: add lcd panel related property for imx28
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250601/202506010427.hGW7ao2S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010427.hGW7ao2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506010427.hGW7ao2S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): lcd-supply: False schema does not allow [[57]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display0: False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 46, 'display-timings': {'native-mode': [[47]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 47}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-geam.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: gpio-expander@44 (st,stmpe811): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: gpio-expander@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display0: False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 44, 'display-timings': {'native-mode': [[45]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 45}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: gpio-expander@44 (st,stmpe811): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: gpio-expander@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display0: False schema does not allow {'bits-per-pixel': 16, 'bus-width': 18, 'phandle': 44, 'display-timings': {'native-mode': [[45]], 'timing0': {'clock-frequency': 28000000, 'hactive': 800, 'vactive': 480, 'hfront-porch': [30], 'hback-porch': [30], 'hsync-len': [64], 'vback-porch': [5], 'vfront-porch': [5], 'vsync-len': [20], 'hsync-active': 0, 'vsync-active': 0, 'de-active': 1, 'pixelclk-active': 0, 'phandle': 45}}}
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[46, 1, 0]], 'scl-gpios': [[46, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[61]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): lcd-supply: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']
--
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[65]], 'sda-gpios': [[29, 1, 0]], 'scl-gpios': [[29, 0, 0]], 'clock-frequency': 400000, 'status': ['disabled'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): lcd-supply: False schema does not allow [[55]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
