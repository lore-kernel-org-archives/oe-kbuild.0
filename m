Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562EE231835
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517974; cv=none; b=aHIdIVxpqLJROaXV6A7shCcp23KMGdUmE+Del++FLsFt2e7KxR0rhZBYtsMhMNIXTeV945ILcSYlC9iZJfDiMjHP+0H3Y5bTd/ppCY1KUAt/wJKHFr8xNPzBoPjBnQ9ztCT7ST7uCO7mHhiewMAxmlVG7Vr0U7qCqdS9ZZ7qzgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517974; c=relaxed/simple;
	bh=KhKJGdA3Yh18+dUh+mUgeVauHIGGk/RwmYwczWSk1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l3WEAi5WQY2VAjCUM66E6FBSwG96mbXqtD1kI6x2Mawl9ImQUoIeYRL7eCfsIScAYkr+r7MsUe09hWFZOPQPbXKI6DyMVybtQI0xeJ83Sp7X/yiNjKJoZi+SYtgpq21t0VDhlRPZhEZUChbD5LgGLSL1CBZqjDDHsjaQ3vHGAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0j9I2k8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0j9I2k8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778517972; x=1810053972;
  h=date:from:to:cc:subject:message-id;
  bh=KhKJGdA3Yh18+dUh+mUgeVauHIGGk/RwmYwczWSk1Ag=;
  b=R0j9I2k8RtLwN1PcOimhVVIbEdtsJhwDA1QX2uVkMqfWrDhuAUCxCaHI
   bruuwsqVzzybNzT1zcZ5q6X0GFzBw/34vDCx+1/GH/DkRo/EPs+ACdrEJ
   K4Vi/G3jXIWtA2hG01WgGDHmb/dJWjgnKku1TUJp2zx9skw1UvFnF9vdA
   yNzjamL7iZ+HJ7D8SeG7A9jzLdPtuGOcwXx1cdylopap9136ocDvwBsEh
   2GPizKNmW3sp14TU03WaIN0AV2Jm0Y1L7AOdpccpFKRhMP5QzaDqx/bu2
   AjRBT6ICDLJ6BXI15W51qtsq0VUoXY/cazNlnLlswQAkZ0Nht5IxGdj7O
   Q==;
X-CSE-ConnectionGUID: FzMeBhnwS3GO6dQvl+Bg7A==
X-CSE-MsgGUID: XqEFM8uMRFO3wFPHUHq84w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79273988"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79273988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:46:11 -0700
X-CSE-ConnectionGUID: +iUxURH8ScOK6bufcd9DXA==
X-CSE-MsgGUID: MTjXp06yQZSUd81ym/nGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="233019580"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 May 2026 09:46:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMTlg-000000007yn-2MvK;
	Mon, 11 May 2026 16:46:08 +0000
Date: Mon, 11 May 2026 18:45:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323
 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of
 ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc',
 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-a...
Message-ID: <202605111811.szcueees-lkp@intel.com>
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
commit: 45b090a59979b6091c494fe92ccac3211c80bb96 ARM: dts: mediatek: mt6323: add support for AUXADC
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260510 (https://download.01.org/0day-ci/archive/20260511/202605111811.szcueees-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111811.szcueees-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111811.szcueees-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'mt6323keys', 'mt6323regulator', 'mt6397codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000 (mediatek,mt7623-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): 'mt6323keys', 'mt6323regulator', 'mt6397codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000 (mediatek,mt7623-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'mt6323keys', 'mt6323regulator', 'mt6397codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000 (mediatek,mt7623-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap', 'mediatek,mt8189-pwrap']
   	'syscon' was expected
   	'mediatek,mt8195-pwrap' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): 'mt6323keys', 'mt6323regulator', 'mt6397codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): adc:compatible:0: 'mediatek,mt6323-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mt6323 (mediatek,mt6323): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: power-controller (mediatek,mt6323-pwrc): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000 (mediatek,mt7623-cir): clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000 (mediatek,mt7623-efuse): compatible: 'oneOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
