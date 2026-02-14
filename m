Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0152641E3
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771083424; cv=none; b=LKNXeoW0sPLCtX0UVArhJY2WQTavr5lFl9WUUEF3h0o5pmZQjzP5/ERwLPx5WoUYh1POf89NNHyKWovTMIQ6BXYxCeGePAQezRDLaWt4A1GcFnrG6BMVtQOw0Oi96rQnAtry7rQVWHUznnGb6VgBnXYKjiIZPpDIHIYjQIsP81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771083424; c=relaxed/simple;
	bh=hus4OPf9BmoFO85mOKzaDDXsxokveaSDkv0pfGubxGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tCwEK6zNACNR3dyLvEH9Wsp+w/kHhcA2hJmd/JZI86f+S93YqS8mOHdW+Vr7T1jYUngT05ps37LYZu+cvgIUdQF0P5+AOk6FqOm8EQj33ne1jZFtd306ZdrVu4BarJDwqSQ0qP4I8QTfBV6GcfIwqfARyGTExRGt+jnWfDtzvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G091rhe1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G091rhe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771083421; x=1802619421;
  h=date:from:to:cc:subject:message-id;
  bh=hus4OPf9BmoFO85mOKzaDDXsxokveaSDkv0pfGubxGM=;
  b=G091rhe1qMYVXLxm8/sUWBip0Lo5WJVypQTY34uEoSFp4EYTOhVcayjN
   ArGjyxWhAz0mz+6kwWlJqhCiH11t/iJAwSrIKlDAUrmBVMjv9/cJeYXba
   KWGvnTZ3wTvif9tQ14IB0wSHfHL8o14+iqC2sl+gdIxqz8k8iVrh21jhW
   kNtVfelmSCl6Ih6XUSAHOdaBxvRSavrxfX7WhfXgx/cnujket+bLuNXFR
   0ZJu023Hfx74gDq+leqhzLeMobuiNJ4fHVLfOXZFHUufksGZimBt6RQap
   H30CMwWYWQUE6IvotsgZ3r/H1k0CJ5nt7kBhjQ2DHtbhz+5shVDZA2hru
   A==;
X-CSE-ConnectionGUID: 0Tt8T5bCSwGr/mP9lPeehQ==
X-CSE-MsgGUID: XJAGFdkXT9WagPlXEa+bYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="82875327"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82875327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 07:37:00 -0800
X-CSE-ConnectionGUID: 1pv5OFWYThqqwtHoOpAW2Q==
X-CSE-MsgGUID: W0ncoAdLSGKdzCRIoNnM0A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Feb 2026 07:36:59 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrHhZ-000000001sX-2MR6;
	Sat, 14 Feb 2026 15:36:57 +0000
Date: Sat, 14 Feb 2026 16:36:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 1/25]
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: display@213000
 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202602141600.V8t5vSJy-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   e8bd92c4a0d2ee0fe8ee2b33c94dcffb3a39749b
commit: e88bb45cf742177a18d63d306be345a294b4c1db [1/25] dt-bindings: display: tilcdc: Convert to DT schema
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20260212 (https://download.01.org/0day-ci/archive/20260214/202602141600.V8t5vSJy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141600.V8t5vSJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141600.V8t5vSJy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
--
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000 (ti,davinci_mdio): 'bus_freq' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
--
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: display@213000 (ti,da850-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0 (ti,davinci-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0 (ti,davinci-nand): $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0 (ti,davinci-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
--
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/spi@30e000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/usb@200000: failed to match any schema with compatible: ['ti,da830-musb']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: gpio_keys (gpio-keys): 'back', 'center', 'down', 'left', 'right', 'up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: leds (gpio-leds): 'left_green', 'left_red', 'right_green', 'right_red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: regulator1 (regulator-fixed): Unevaluated properties are not allowed ('over-current-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: memory@ffff0000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
