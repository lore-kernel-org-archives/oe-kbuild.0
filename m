Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6626D4DD
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633202; cv=none; b=DqKEdaMt6J9PPJVN/4QZJtV6/sw9AFQLazum1/C1wRU6EcPi/mvCW9kkTIXs3cXy77LXbxoWMoXIrD07GPlYwi8ePtNo5kjejK8IjQSILkKONsIO0D612QsKhVO/ZxFqEZAutX6Z7a4moMNsrFTlHsBmEAze71ebErUbCFdn/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633202; c=relaxed/simple;
	bh=OlzJ4eDETATHcLeCDQflWSm9S8bhco3as+rZV23faPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bFM5VWYes3saTvc80XoUBnsgHgCR93IHuPNIfTtCXMXYuir8IzJdvF3LYOS7zy/Fa9EfcvgnM03b73WvV7LVi23dBWca5x2PvG/XAPxdpxqjsJAITt9a6o8tpV1+wwJOy5Hg6tgdJUtD6xyjUwroreEIWZ+1FMyY6crpABsLjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCcqxQ6I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCcqxQ6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778633200; x=1810169200;
  h=date:from:to:cc:subject:message-id;
  bh=OlzJ4eDETATHcLeCDQflWSm9S8bhco3as+rZV23faPc=;
  b=RCcqxQ6I9zQWfOweXhzHCW3yBGcddpImmpO1u316rxzOlkt5apniES5h
   cyQwKeIru8BH3ni9at2NUBQeBRjIm/T5n65G/sC8H4AbE0uEENKGP/7vE
   6qQOi+dAVKdB8iFRabOVb7UpEn7Oq6y+7n+83qBOilueFKgLwCpulOVPG
   /50TX/vc+6fLYHi32BfaqKCDBOu2o0dFWDHySxbZ5U6mKMyQSYGVBrvOQ
   ndOHrOCFIHvMtZBNujpN7C7vZOzqEHh/NWEj5QNzfMFi1D5A9utpoY6vQ
   gFcxc5gohNMBmS/B+wKOY0YvQp1avhZcweI/W8yhE8YiindfnUk16O9gG
   w==;
X-CSE-ConnectionGUID: ycAHQgalSsCde9pmR0wlVA==
X-CSE-MsgGUID: BPAIjzsjSqySqd2DLuAsaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79582940"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79582940"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:46:35 -0700
X-CSE-ConnectionGUID: Bk7F1CtRSmapo6eJP55Ilw==
X-CSE-MsgGUID: f/IZpyV7Qruf7AW5vxD79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="234871233"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 17:46:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxk8-000000008PF-0vuU;
	Wed, 13 May 2026 00:46:32 +0000
Date: Wed, 13 May 2026 02:46:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb:
 thermal-zones: 'pmic_vts_thermal' does not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
Message-ID: <202605130233.csquoOUV-lkp@intel.com>
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
TO: Roman Vivchar <rva333@protonmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Roman-Vivchar-via-B4-Relay/dt-bindings-iio-adc-add-mt6323-PMIC-AUXADC/20260510-061616
head:   dc3b441b8f12a7daaf5cdcab66da50268e58a949
commit: 26d51f3f759405d7345337b7c5b2e895b8efa822 ARM: dts: mediatek: mt6323: add support for thermal
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260510 (https://download.01.org/0day-ci/archive/20260513/202605130233.csquoOUV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130233.csquoOUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130233.csquoOUV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal-zones: 'pmic_vts_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pinctrl@10005000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'efuse', 'mt6323keys', 'mt6323regulator', 'mt6397codec', 'thermal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal-zones: 'pmic_vts_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pinctrl@10005000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): 'efuse', 'mt6323keys', 'mt6323regulator', 'mt6397codec', 'thermal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal-zones: 'pmic_vts_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pinctrl@10005000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'efuse', 'mt6323keys', 'mt6323regulator', 'mt6397codec', 'thermal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: / (bananapi,bpi-r2): fixedregulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal-zones: 'pmic_vts_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pinctrl@10005000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'musb', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): 'efuse', 'mt6323keys', 'mt6323regulator', 'mt6397codec', 'thermal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
