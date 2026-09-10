Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9365964E0
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068404; cv=none; b=Mlhgb+d7Q0iENAuW5HA12+cI6BMDSawq3RIxMr2VXeojgDPyM5S9twVgrbQsgagHlbqNnEJdJYUgSM1bPjaLRmHhdwc+zBZVsKHPomlL34WuR/OO4NdZKRCdi6LXwcFxKchaKGDSMzkOp6fzRLQp+T2octIe6lrMmMKMafZfhOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068404; c=relaxed/simple;
	bh=dV39QLRFPLnRb5oJ1SZnkRSku1DWt+6WfbkOgdS4A3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovBr9MbxrePZaDfyU1Nu03acTutjMNdYWwcLIy9ErysCI/iwzrb/9MFv9HtxmUTQ8KFTlW6T0I08+RQJWdCYT2p39Cid/l+o8Cr74vIOichpE1EXLnXPaNInd0M6q8/FZ1iPGi81xzLZjcxwzenrwC9ULGh0QUQck3bmeHTNdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6LXWSkg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6LXWSkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789068399; x=1820604399;
  h=date:from:to:cc:subject:message-id;
  bh=dV39QLRFPLnRb5oJ1SZnkRSku1DWt+6WfbkOgdS4A3Y=;
  b=G6LXWSkgkdKpez+HcVZuj5QWoudGlC11NKeOZPohW+sKVkYX1KkTEWTA
   B4aQsQeQ1AwFOTi6b3k/OfcwjyAPhMr3aeP4f7cUPIuDIhEizESsy0Nby
   3w8gJ2foW5+S/SGqs0hlWIPiYSpTzIEDbHBQtaiPZUMHNu6rYu0tEBazi
   PTLmcUJ2V6us0Sw7T9bNPI39S+MvD/2tokKcAJGYMgiuOlR1AjvRzLp12
   qRDbLY4QUwlO6R+2h243Sn6C8AMRCn7JvxXrwvW3J1Np8fMuUyFeI7doQ
   YT9Qrznp6et5Lvw9kssyeKrax+8hASUVd3E8kIjf5thhSTm7oYwQMf0BM
   A==;
X-CSE-ConnectionGUID: lj8Qt+m7TeKG55ndJacU3Q==
X-CSE-MsgGUID: epISluH8RSus1QRpDvsRew==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100190237"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100190237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 12:26:37 -0700
X-CSE-ConnectionGUID: huO+WbIWT46ygAsLOLOK0Q==
X-CSE-MsgGUID: 2Ox6HvtnRlOrwVnDYjZY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="265522321"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Sep 2026 12:26:36 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4kPq-000000000Tz-2POO;
	Thu, 10 Sep 2026 19:26:34 +0000
Date: Thu, 10 Sep 2026 21:25:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: lcdc@0
 (ti,am33xx-tilcdc): 'port' is a required property
Message-ID: <202609102124.KeDsDb5d-lkp@intel.com>
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
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: e88bb45cf742177a18d63d306be345a294b4c1db dt-bindings: display: tilcdc: Convert to DT schema
date:   7 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260910/202609102124.KeDsDb5d-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102124.KeDsDb5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e88bb45cf742 ("dt-bindings: display: tilcdc: Convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609102124.KeDsDb5d-lkp@intel.com/

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
