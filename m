Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EF33121F
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673952; cv=none; b=uEr1rNNHQdxeSzvHhQ1yTiCCXadMgiFzFMtWYhWR93i3Jcxa64BRsNy/wOckp3AVC2z7TAB/hDtRETOfnTH+MOoWeEOiEoPzwf1J1iVy5s9lNv8moZnyzcJTU1nPt0H2+H3sjqLkkrrUAJbDOgC1rNy5Z2pZ3SeVVepdejFrtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673952; c=relaxed/simple;
	bh=XJPfWOd5q06SVuh221dvE2Tg2FWMxsaLss0hrmjeWMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ddidu0YC+kMSZENR7k1RmTj6wRNENb5Lle6cSSamF0seD7boZFrN1UStAA2ypoXQVJVhoxgxyis+5ANComqhFmKUFswmLlnnHPE+m8TN8PJJx9FpmY32vd3E+TeJ6cmXuh/KA09oJ/7z/orb2R42Tc7iyQ3gzY6K+tJFJm6/ujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvWqJYQC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvWqJYQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775673949; x=1807209949;
  h=date:from:to:cc:subject:message-id;
  bh=XJPfWOd5q06SVuh221dvE2Tg2FWMxsaLss0hrmjeWMs=;
  b=mvWqJYQC3A6tgMyihBMvNSzr8d9lrZAcJQ6VyoiCcQfROZkKEcCnX30t
   KKbUgcCCQ9+c53QrazrkdYZDVjKTgVWXPP/f2QQdKLui6P59y7ZOYerv8
   wus6Xo0W3FneHJ3WkhLcy2UoNpI0j/T5JFzObBpyV/J/vYVS22gOHwPSK
   NPh61ViyKo9KpCQTnc01V0Wj7Alb7Q3mUPc6in7Z3tLkrzCl3b7a4dg+b
   EOb0YdCHPE6TYLjfwuVls4m8xXU8YqnNjmHEk8dnzp/3t9N/o1A1r4j4u
   XIcu4mff7STTd6H98GplZ3Lck+nxwPZ5STyYg0r8XwN6dskw+9s6ct3hu
   w==;
X-CSE-ConnectionGUID: TyQxG0I9Tmi2elhbGe0SoA==
X-CSE-MsgGUID: g7blI1fqQnKghGFRjzFPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94252710"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="94252710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 11:45:49 -0700
X-CSE-ConnectionGUID: AHHIZjQjQd+iq1ucicOK5g==
X-CSE-MsgGUID: Jl2fAg8gRhKuSRU2ZzAIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="223789382"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2026 11:45:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAXuM-00000000AUn-0mEd;
	Wed, 08 Apr 2026 18:45:46 +0000
Date: Wed, 08 Apr 2026 20:45:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:ib-mux-pinctrl 2/5]
 arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@20
 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not match
 '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202604082018.AdlqNVVf-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Linus Walleij <linusw@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   62f97854fd4bf56e5eb15970787aa4125ea912cd
commit: f2e398e6c147cec7cda3d01762499dbbcc925f63 [2/5] dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260407 (https://download.01.org/0day-ci/archive/20260408/202604082018.AdlqNVVf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604082018.AdlqNVVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604082018.AdlqNVVf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@20 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@21 (semtech,sx1505q): $nodename:0: 'gpio-expander@21' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/i2c@11000/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
--
   arch/arm/boot/dts/microchip/sama5d3_lcd.dtsi:28.13-32.8: Warning (avoid_unnecessary_addr_size): /ahb/apb/hlcdc@f0030000/hlcdc-display-controller/port@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: ioexp@20 (semtech,sx1502q): 'gpio3_cfg', 'ngpios' do not match any of the regexes: '-cfg$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
>> arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: ioexp@20 (semtech,sx1502q): $nodename:0: 'ioexp@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/ramc@ffffea00: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: i2c0: i2c0-gpio: {'atmel,pins': [[0, 30, 0, 0, 0, 31, 0, 0]], 'phandle': 13} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: i2c1: i2c1-gpio: {'atmel,pins': [[2, 26, 0, 0, 2, 27, 0, 0]], 'phandle': 17} is not of type 'array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
