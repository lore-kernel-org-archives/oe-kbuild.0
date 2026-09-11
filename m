Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3E32C8B
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170105; cv=none; b=VReN8iEQ8MHPAtPWfUOPIPloqBfXxEIAj+8MPEoWjTnNpUDpZLhu7WpWATAtxONqdAT36jSR71duce8njSyVGI+5C8KvB8AoepuGW8ON4wAJzHndmRH+LWnu8POuz8zmUeiaE3/2FF4btIIwVxURlj6moAFgzBcM11LbBlOrWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170105; c=relaxed/simple;
	bh=YjiLSDel4fpkrWOfjLe4IcCSTUIBNnfaEV4VejiC9dk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nF0eiZewin5ZqiMBPROIgI/OsB41mFaMpfmCnBhHx/QdVtkLmOgvucMowD18pazEQ0xQ4YP9IbiOXeMKrfWtFKkmR+4ZWnPZISAn3q/GrBLDL+N4+RvDQtlusfkBj1huO6IcSCBTekjAvnkWJRHpbr6nQsyyOD1f8EkZ9cg+4GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeJJWKoq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeJJWKoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789170102; x=1820706102;
  h=date:from:to:cc:subject:message-id;
  bh=YjiLSDel4fpkrWOfjLe4IcCSTUIBNnfaEV4VejiC9dk=;
  b=AeJJWKoq9SzYGtPcDO/LGSXxhPpaa0xOk6/OR6y/9Hg5C3TKYhLUo5QZ
   iTzNH+A9DWOJ8taLG3f7R/OJTUf3+IcKcTJAwZ/844aLeUslkGXBQKGKd
   Zv473gZvfn3lw6z8JaLJV55QUkAL9y7eeXTCQFMsAlcaHxz5w8KeYuzlP
   1HhsTIb+lulUe0PocJ84ffjdJ0kPG0y/tLAD+NYqk0JG3oQqKsotVsU82
   CY7G5ieqExTp/CpQ6VJKUbFNVmy5fxnk85R4f4T/OAuiz8wMHuNc3wttN
   XJdVky/SOd4iLLewKx7XDQnJjpRSzPxUspk3WVPYtlN1sTNDafB34JYbg
   w==;
X-CSE-ConnectionGUID: ptiV2sfnSZaVI5+DEiwi5g==
X-CSE-MsgGUID: WDGjrddxTyeKlsc/C9zjMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93333300"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="93333300"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 16:41:41 -0700
X-CSE-ConnectionGUID: J5KyKjSfRsqf8VzKTyF7pQ==
X-CSE-MsgGUID: AHKQCg/lS56qOr52tbCXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="271574150"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2026 16:41:40 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5AsD-000000000uR-1URU;
	Fri, 11 Sep 2026 23:41:37 +0000
Date: Sat, 12 Sep 2026 01:41:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: lcdc@0
 (ti,am33xx-tilcdc): 'port' is a required property
Message-ID: <202609120154.JZFX2qH4-lkp@intel.com>
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
TO: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: e88bb45cf742177a18d63d306be345a294b4c1db dt-bindings: display: tilcdc: Convert to DT schema
date:   7 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260912/202609120154.JZFX2qH4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120154.JZFX2qH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e88bb45cf742 ("dt-bindings: display: tilcdc: Convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609120154.JZFX2qH4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: ti,cs-chipselect: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0 (ti,davinci-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0 (ti,davinci-nand): $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: ti,cs-chipselect: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: ethernet@220000 (ti,davinci-dm6467-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
