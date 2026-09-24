Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB7046AA67
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292315; cv=none; b=IYFzTMnrTETZQyCS60EYEECwfRWPuhxvkrxRUj8DwDhb3/MKheGSEL+toOM3IcQYfhP87MS/PSzwCZVjIh6RFiLGbUPYIkIYe+S0EIARKgR202DKFoFcnbAMv9du3ojBTdDa0Vrx3EUSICVpQaLjb/yo8qtKVsjUayAdTQ4BqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292315; c=relaxed/simple;
	bh=SEUn9h4zLhpWkXJGzZtlBnPCKC2dui5TTLz5tCyL57k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gwF2WAGM1R4koxGMtl3WK20HtzUc7SN8DcH6lMo/T8Jd/Tl5k2CbsRmtQ5THBu2QsKxPjkZYT/TGguV/zvUbtXj8nkievtqwhsUD+YRJtC8RCXvSYTJ3wzYTSiNX4pKFoJDv56lGXk86OWRLomQC56V6d9m3goVjocpMLTW63Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ohq+4dqy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ohq+4dqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790292302; x=1821828302;
  h=date:from:to:cc:subject:message-id;
  bh=SEUn9h4zLhpWkXJGzZtlBnPCKC2dui5TTLz5tCyL57k=;
  b=Ohq+4dqym1N0hpZxP04Z853vmGcqX9TPaG2GEQxZIXgtXoAI0BqJ4T7+
   65QKRcOC9oewU0359fZo8fjr+EKbF1tJHQdFWxjLfHfBSKmqh3WyE+15t
   1ydmkDVYJsVtfLmChs6/7VVclTLn8XId+ww3gXFt6QJv4eEtQ8RBSziUM
   cagabrtM4/yp4NbCknMD2l3o1zjW2dJJ7Kf2MIdU7pDP64WqwMEqPh0B3
   vvQmKaULw4drdjQbrJvUvUXE11TPbdRoXaP9vHtC07iNOPfnt5z9NHcxS
   Kep+IKIWyaA1+XBsNvYI+NrMvSDQz/+/lTVri9wFGa78AeC31Pr3tg6Iw
   Q==;
X-CSE-ConnectionGUID: w2ZpmColT1WfQ+NV1d89zA==
X-CSE-MsgGUID: zDl0PseYSmyAuNDK5jzwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102440078"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="102440078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:24:58 -0700
X-CSE-ConnectionGUID: M0WVSNUzSaWnRwVR2gAAlw==
X-CSE-MsgGUID: F8j6LT2VSlGd3yCGOGBSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="300451380"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2026 16:24:57 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9soB-000000000TQ-23cU;
	Thu, 24 Sep 2026 23:24:55 +0000
Date: Fri, 25 Sep 2026 01:24:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 35/35]
 arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb:
 device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240',
 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$',
 '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$'...
Message-ID: <202609250124.OYxVekr3-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: Bhargav Joshi <j.bhargav.u@gmail.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   e3513583cdb959bbf1370edcbaf3c0b014077742
commit: e3513583cdb959bbf1370edcbaf3c0b014077742 [35/35] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2402-20260923 (https://download.01.org/0day-ci/archive/20260925/202609250124.OYxVekr3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250124.OYxVekr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250124.OYxVekr3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: power-sleep-controller@2350000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2e-pscrst', 'ti,syscon-reset']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2e-pscrst', 'ti,syscon-reset']
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240', 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^reset-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/clocks/mainmuxclk@2310108: failed to match any schema with compatible: ['ti,keystone,pll-mux-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-shift: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-mask: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/clocks/gemtraceclk@2310120: failed to match any schema with compatible: ['ti,keystone,pll-divider-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-shift: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-mask: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:392.27-400.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkgpio@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:402.31-410.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkkeymgr@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: power-sleep-controller@2350000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2hk-pscrst', 'ti,syscon-reset']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2hk-pscrst', 'ti,syscon-reset']
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240', 'keystone_dsp_gpio@244', 'keystone_dsp_gpio@248', 'keystone_dsp_gpio@24c', 'keystone_dsp_gpio@250', 'keystone_dsp_gpio@254', 'keystone_dsp_gpio@258', 'keystone_dsp_gpio@25c', 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^reset-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/clocks/mainmuxclk@2310108: failed to match any schema with compatible: ['ti,keystone,pll-mux-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-shift: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-mask: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/clocks/gemtraceclk@2310120: failed to match any schema with compatible: ['ti,keystone,pll-divider-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-shift: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-mask: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	['ti,keystone', 'simple-bus'] is too short
   	'ti,keystone' is not one of ['ti,k2g-evm', 'ti,k2g-ice']
   	'ti,keystone' is not one of ['ti,k2e-evm']
   	'ti,keystone' is not one of ['ti,k2l-evm']
   	'ti,keystone' is not one of ['ti,k2hk-evm']
   	'ti,k2g' was expected
   	'ti,k2e' was expected
   	'ti,k2l' was expected
   	'ti,k2hk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/ti,keystone.yaml
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240', 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^reset-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: serial@2530c00 (ti,da830-uart): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: serial@2531400 (ti,da830-uart): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2g-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: dss@02540000 (ti,k2g-dss): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: dss@02540000 (ti,k2g-dss): port:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml
--
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:402.31-410.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkkeymgr@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-k2l-clocks.dtsi:244.29-252.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart2@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: power-sleep-controller@2350000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2l-pscrst', 'ti,syscon-reset']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/power-sleep-controller@2350000/reset-controller: failed to match any schema with compatible: ['ti,k2l-pscrst', 'ti,syscon-reset']
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240', 'keystone_dsp_gpio@244', 'keystone_dsp_gpio@248', 'keystone_dsp_gpio@24c', 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^reset-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/mainmuxclk@2310108: failed to match any schema with compatible: ['ti,keystone,pll-mux-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-shift: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: mainmuxclk@2310108 (ti,keystone,pll-mux-clock): bit-mask: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/gemtraceclk@2310120: failed to match any schema with compatible: ['ti,keystone,pll-divider-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-shift: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: gemtraceclk@2310120 (ti,keystone,pll-divider-clock): bit-mask: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	['ti,keystone', 'simple-bus'] is too short
   	'ti,keystone' is not one of ['ti,k2g-evm', 'ti,k2g-ice']
   	'ti,keystone' is not one of ['ti,k2e-evm']
   	'ti,keystone' is not one of ['ti,k2l-evm']
   	'ti,keystone' is not one of ['ti,k2hk-evm']
   	'ti,k2g' was expected
   	'ti,k2e' was expected
   	'ti,k2l' was expected
   	'ti,k2hk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/ti,keystone.yaml
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: device-state-control@2620000 (ti,keystone-devctrl): 'keystone_dsp_gpio@240', 'keystone_irq@2a0' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^interrupt-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^reset-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: serial@2530c00 (ti,da830-uart): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2g-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: dss@02540000 (ti,k2g-dss): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/edma@2700000: failed to match any schema with compatible: ['ti,k2g-edma3-tpcc', 'ti,edma3-tpcc']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/edma@2700000: failed to match any schema with compatible: ['ti,k2g-edma3-tpcc', 'ti,edma3-tpcc']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: edma@2700000 (ti,k2g-edma3-tpcc): ti,tptcs: b'\x00\x00\x00\x0e\x00\x00\x00\x07\x00\x00\x00\x0f\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
