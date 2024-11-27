Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8B17B418
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732751306; cv=none; b=OxUM2AcBgyk8giGER4dil3FkR4yic4oKsMm0rYpkDrIxmXRKw3tNjLOD6VYV1iqSavZ++RiAg3CW1pmq8/bB3dvTijFbXgUfka3ddRlNcjbAb5J21r30wPLUnQNoqZDn3McchBkJpa/hgQqgql33F3o6e/YMS/yJ5JWUuv11y/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732751306; c=relaxed/simple;
	bh=utRiTUy05ADPTjXFCmbBzPliXWvu6hhVVAw7qOAPMJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oizCFnHiuQUIxC4lFhpdkqQVyqZ572zMGoIrKG2wkXT3RSqF/ux/qW+GgrNHWYRNwAjuBOiW+MfhxAOuTDxUy/g3fYHNHZ6uDDzSHwRfsfrFB4JVHtmIrZxJA9NSnQb0/tWM/Dlwxr5b8CYJZfV+wc+xuPcwCe5jqqgAHj0LFUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0ISxD97; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0ISxD97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732751304; x=1764287304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=utRiTUy05ADPTjXFCmbBzPliXWvu6hhVVAw7qOAPMJo=;
  b=S0ISxD97dgduk0CuhQEo/lcADyFhNDXBV6cukRUQU++tGl9ZWVNlju5A
   4bG5aTQ7L2Ay9qCYgCNicAR+beimXyZfCtXKDQ7qHGT/xBt/9hTxdIMHZ
   BCc3gQO76xeaHY/2H4osJ9/j22YmaDOXYRJuhFkwCVMC9fuZ3cSiNKi4p
   H60YpcH+E4rqeHN00MTLe/lfnx495696e6/MmjnnzdwMsgCtu8uUSjsGb
   W5YxXghpHFblCp+ydGwJiwLUR1qF9k05nm3xKpXn10ShbC+FxKjJOdd/K
   CDccY/h0wfnrzEhLw/WaG7PN7CSonkfkIeLx8n6utvGO+L8EBNqiDHmBv
   w==;
X-CSE-ConnectionGUID: cAJwgropT/2NpcJg+ASAlw==
X-CSE-MsgGUID: WHAWs4kYQFikTDullexRUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20566052"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="20566052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:48:21 -0800
X-CSE-ConnectionGUID: v+4FIxDqSyq0u8WrgxR4DQ==
X-CSE-MsgGUID: jL6A4DnbRJuPbIGJCg+C2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97145114"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2024 15:48:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRla-0008S3-0E;
	Wed, 27 Nov 2024 23:48:18 +0000
Date: Thu, 28 Nov 2024 07:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <202411280748.Iulg9itV-lkp@intel.com>
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
In-Reply-To: <20241122104938.1437925-2-wmacek@chromium.org>
References: <20241122104938.1437925-2-wmacek@chromium.org>
TO: Wojciech Macek <wmacek@chromium.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Rafal Milecki <rafal@milecki.pl>
TO: "Hsin-Yi Wang" <hsinyi@chromium.org>
TO: Sean Wang <sean.wang@mediatek.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Wojciech Macek <wmacek@chromium.org>

Hi Wojciech,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Macek/dt-bindings-arm-mediatek-Add-MT8186-Starmie-Chromebooks/20241125-121351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241122104938.1437925-2-wmacek%40chromium.org
patch subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241128/202411280748.Iulg9itV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280748.Iulg9itV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411280748.Iulg9itV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /: oscillator@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /: regulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt2701-evb', 'mediatek,mt2701']
>> arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt2701-evb', 'mediatek,mt2701']
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with compatible: ['mediatek,trustzone-bootinfo']
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: pinctrl@1000b000: 'audiodefault', 'i2c0@0', 'i2c1@0', 'i2c2@0', 'nor', 'pwm_bls_gpio', 'spi0@0', 'spi1@0', 'spi2@0' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: thermal@1100b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: syscon@1a000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt2701-hifsys', 'syscon'] is too long
--
   arch/arm/boot/dts/mediatek/mt6580-evbp1.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt6580-evbp1.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt6580-evbp1.dtb: /: failed to match any schema with compatible: ['mediatek,mt6580-evbp1', 'mediatek,mt6580']
>> arch/arm/boot/dts/mediatek/mt6580-evbp1.dtb: /: failed to match any schema with compatible: ['mediatek,mt6580-evbp1', 'mediatek,mt6580']
--
   arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts:14.3-51: Warning (alias_paths): /aliases:bootargs: aliases property is not a valid node (console=ttyS0,921600n8 earlyprintk)
   arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dtb: /: failed to match any schema with compatible: ['prestigio,pmt5008-3g', 'mediatek,mt6582']
>> arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dtb: /: failed to match any schema with compatible: ['prestigio,pmt5008-3g', 'mediatek,mt6582']
--
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt6589.dtsi:51.24-55.5: Warning (simple_bus_reg): /clocks/dummy13m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt6589.dtsi:57.21-61.5: Warning (simple_bus_reg): /clocks/dummy32k: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt6589.dtsi:63.22-67.5: Warning (simple_bus_reg): /clocks/dummy26m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: /: failed to match any schema with compatible: ['mundoreader,bq-aquaris5', 'mediatek,mt6589']
>> arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: /: failed to match any schema with compatible: ['mundoreader,bq-aquaris5', 'mediatek,mt6589']
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: clocks: dummy26m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: clocks: dummy32k: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-aquaris5.dtb: clocks: dummy13m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/mediatek/mt6589.dtsi:51.24-55.5: Warning (simple_bus_reg): /clocks/dummy13m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt6589.dtsi:57.21-61.5: Warning (simple_bus_reg): /clocks/dummy32k: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt6589.dtsi:63.22-67.5: Warning (simple_bus_reg): /clocks/dummy26m: missing or empty reg/ranges property
>> arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: /: failed to match any schema with compatible: ['fairphone,fp1', 'mediatek,mt6589']
>> arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: /: failed to match any schema with compatible: ['fairphone,fp1', 'mediatek,mt6589']
   arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: clocks: dummy32k: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: clocks: dummy26m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt6589-fairphone-fp1.dtb: clocks: dummy13m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/mediatek/mt6592-evb.dts:15.9-18.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt6592-evb.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt6592-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6592-evb', 'mediatek,mt6592']
>> arch/arm/boot/dts/mediatek/mt6592-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6592-evb', 'mediatek,mt6592']
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pinctrl@10005000: 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pwrap@1000d000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap']
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623a-rfb-nand', 'mediatek,mt7623']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623a-rfb-nand', 'mediatek,mt7623']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pinctrl@10005000: 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pwrap@1000d000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8188-pwrap']
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dts:147.8-156.4: Warning (graph_child_address): /dpi@14014000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623n-rfb-emmc', 'mediatek,mt7623']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /: failed to match any schema with compatible: ['mediatek,mt7623n-rfb-emmc', 'mediatek,mt7623']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pinctrl@10005000: 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pwrap@1000d000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
--
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts:82.29-87.4: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/mediatek/mt7623.dtsi:252.24-263.4: Warning (unique_unit_address_if_enabled): /pinctrl@10005000: duplicate unit-address (also used in node /syscfg@10005000)
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts:162.8-171.4: Warning (graph_child_address): /dpi@14014000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /: fixedregulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r2', 'mediatek,mt7623']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r2', 'mediatek,mt7623']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pinctrl@10005000: 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'musb', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pwrap@1000d000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
--
   arch/arm/boot/dts/mediatek/mt7629.dtsi:163.38-172.5: Warning (simple_bus_reg): /soc/interrupt-controller@10300000: simple-bus unit address format error, expected "10310000"
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7629-rfb', 'mediatek,mt7629']
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7629-rfb', 'mediatek,mt7629']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: reg: [[270626816, 32768], [268455936, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: ephy-leds-pins:mux:groups:0: 'gphy_leds_0' is not one of ['ephy_leds', 'ephy0_led', 'ephy1_led', 'ephy2_led', 'ephy3_led', 'ephy4_led', 'wled', 'wf2g_led', 'wf5g_led']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
--
   arch/arm/boot/dts/mediatek/mt8127-moose.dts:15.9-18.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt8127.dtsi:62.24-66.5: Warning (simple_bus_reg): /clocks/dummy13m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8127.dtsi:68.21-72.5: Warning (simple_bus_reg): /clocks/dummy32k: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8127.dtsi:74.22-78.19: Warning (simple_bus_reg): /clocks/dummy26m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt8127-moose.dtb: /: failed to match any schema with compatible: ['mediatek,mt8127-moose', 'mediatek,mt8127']
>> arch/arm/boot/dts/mediatek/mt8127-moose.dtb: /: failed to match any schema with compatible: ['mediatek,mt8127-moose', 'mediatek,mt8127']
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with compatible: ['mediatek,trustzone-bootinfo']
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: clocks: dummy26m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: clocks: dummy32k: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8127-moose.dtb: clocks: dummy13m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dts:15.9-18.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/mediatek/mt8135.dtsi:87.24-91.5: Warning (simple_bus_reg): /clocks/dummy13m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8135.dtsi:93.21-97.5: Warning (simple_bus_reg): /clocks/dummy32k: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8135.dtsi:99.18-103.5: Warning (simple_bus_reg): /clocks/clk26m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8135.dtsi:151.25-162.5: Warning (simple_bus_reg): /soc/pinctrl@10005000: simple-bus unit address format error, expected "1000b000"
   arch/arm/boot/dts/mediatek/mt8135.dtsi:151.25-162.5: Warning (unique_unit_address_if_enabled): /soc/pinctrl@10005000: duplicate unit-address (also used in node /soc/syscfg_pctl_a@10005000)
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: /: failed to match any schema with compatible: ['mediatek,mt8135-evbp1', 'mediatek,mt8135']
>> arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: /: failed to match any schema with compatible: ['mediatek,mt8135-evbp1', 'mediatek,mt8135']
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with compatible: ['mediatek,trustzone-bootinfo']
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: clocks: clk26m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: clocks: dummy13m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: clocks: dummy32k: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/mediatek/mt8135-evbp1.dtb: pwrap@1000f000: 'mt6397' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
