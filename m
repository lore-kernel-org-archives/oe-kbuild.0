Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11E946A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765437406; cv=none; b=p6Xt/Bl7WIY0XEnffFAPomJx/VZZ09TmkOknqOfBwbhc2UgR2B95VflLpjSi4r/lxk1itA825xHyXgZlOnx50ySV26fnJmtUeaF+O7dJIQOBIMIyUUpoiWu8ux87O7f1j0wG2aSKHlFs3ErRduPzf6Cgss34gzp+Ez8xnQzXn7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765437406; c=relaxed/simple;
	bh=me7n+AakUqx2VnHlGJlItxfUXtx35k9H3jThmB6Cmys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irUU6T0xNFAIYHdJOQfSnh78S4gBY7PoNC/M0OYJXKuGD7Ud7sFPGzLimHIa8mceDrivzCcMfPBBSlaHPozdhiFCBiYIgdueH+IV2ueMlGHWxETD1SinGjm8OJOeYOKWACKFfk1FyIY+y+owVYlj01BlCYIMMkcmGsudL27WzG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7U4mazo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7U4mazo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765437402; x=1796973402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=me7n+AakUqx2VnHlGJlItxfUXtx35k9H3jThmB6Cmys=;
  b=Z7U4mazoX1re3+tQU0AzdfGrCKzMIvDRgSIZtBpSf0fY0tPsBGIj4HJX
   cTUdX8M3yk2hBkyiRyZeMeDHxbhessZYi3Np7UZdhl6KDWtYHIdK5FiON
   NSaslfUy7DPf7BicfzcS/wmT4RH6S2675bPmH5EslOYDMdrbwQ8U/I30Q
   JZmyOiCduK2bZBCMoaHibnmTRlKoQzUdRxnCGblqOu2HoIRNpTye0VoQp
   eNyuav1Z8x3CWgOBjGG2Fds6XmZm18JjwvN69KVolA2jIVK0/FoqeB2bx
   j7+SXIQG4kaPWMn87Y7Z4k/HzSmr+gEEHyiXBs0OEnrWN2bo6UiKcAq3n
   w==;
X-CSE-ConnectionGUID: xa6rV8c3QhmuJ+Z9VYuS7Q==
X-CSE-MsgGUID: hGmdjQrpSiGUUZ+0KdSSGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84822998"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84822998"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:16:42 -0800
X-CSE-ConnectionGUID: wfGTtmVNQsqyFmK5IEffKw==
X-CSE-MsgGUID: v0gCaxrITfCqShy7XL+RCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197213722"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 23:16:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTauk-000000000xE-2ghq;
	Thu, 11 Dec 2025 07:16:38 +0000
Date: Thu, 11 Dec 2025 08:16:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory@1fc00000:
 'bank-width', 'compatible', 'device-width' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202512110832.iKalkMpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: mips-randconfig-2051-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110832.iKalkMpd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110832.iKalkMpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512110832.iKalkMpd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/gcw0.dts:22.17-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/gcw0.dts:32.19-39.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:41.26-49.4: Warning (unit_address_vs_reg): /regulator@1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:51.37-58.4: Warning (unit_address_vs_reg): /analog-amplifier@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:60.34-66.4: Warning (unit_address_vs_reg): /analog-amplifier@1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:239.25-317.4: Warning (unit_address_vs_reg): /i2c-controller@3: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:32.19-39.4: Warning (unique_unit_address_if_enabled): /regulator@0: duplicate unit-address (also used in node /analog-amplifier@0)
   arch/mips/boot/dts/ingenic/gcw0.dts:41.26-49.4: Warning (unique_unit_address_if_enabled): /regulator@1: duplicate unit-address (also used in node /analog-amplifier@1)
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory@1fc00000: 'bank-width', 'compatible', 'device-width' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): regulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): regulator@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000 (ingenic,jz4770-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: jz4770-cgu@10000000 (ingenic,jz4770-cgu): $nodename:0: 'jz4770-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-ost'] is too short
   	'ingenic,jz4770-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
   	'ingenic,jz4760-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-tcu', 'simple-mfd'] is too short
   	'ingenic,jz4770-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: pin-controller@10010000 (ingenic,jz4770-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10030000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10031000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10032000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10032000 (ingenic,jz4770-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10032000 (ingenic,jz4770-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10033000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: usb@13440000 (ingenic,jz4770-musb): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ingenic,musb.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: analog-amplifier@0 (simple-audio-amplifier): 'enable-delay-ms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/simple-audio-amplifier.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: i2c-controller@3 (i2c-gpio): $nodename:0: 'i2c-controller@3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: i2c-controller@3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@5a' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
--
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: nand-controller@1 (ingenic,jz4740-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: /ecc-controller@13010100: failed to match any schema with compatible: ['ingenic,jz4740-ecc']
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: /keyboard: failed to match any schema with compatible: ['gpio-matrix-keypad']
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: charger (gpio-charger): 'status-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/gpio-charger.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: pmu (ingenic,jz4740-battery): 'power-supplies' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/ingenic,battery.yaml
--
   arch/mips/boot/dts/ingenic/rs90.dts:14.9-17.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/rs90.dts:53.9-104.4: Warning (unit_address_vs_reg): /keys@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/rs90.dts:106.9-124.4: Warning (unit_address_vs_reg): /keys@1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/rs90.dts:113.9-117.5: Warning (unit_address_vs_reg): /keys@1/key@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/rs90.dts:119.9-123.5: Warning (unit_address_vs_reg): /keys@1/key@1: node has a unit name, but no reg or ranges property
>> arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): memory@1fc00000: 'bank-width', 'compatible', 'device-width' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0 (ingenic,xburst-mxu1.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000 (ingenic,jz4725b-adc): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1 (ingenic,jz4725b-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000 (ingenic,jz4725b-lcd): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: /ecc-controller@130d0000: failed to match any schema with compatible: ['ingenic,jz4725b-bch']
>> arch/mips/boot/dts/ingenic/rs90.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: regulator (regulator-fixed): Unevaluated properties are not allowed ('regulaor-max-microvolt', 'regulaor-min-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: keys@1 (adc-keys): 'key@0', 'key@1' do not match any of the regexes: '^button-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/adc-keys.yaml
--
   arch/mips/boot/dts/ingenic/ci20.dts:25.9-29.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 805306368]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@1 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): $nodename:0: 'jz4780-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000 (ingenic,jz4780-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-ost', 'ingenic,jz4770-ost'] is too long
   	'ingenic,jz4780-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
   	'ingenic,jz4760-ost' was expected
   	'ingenic,jz4725b-ost' was expected
   	'ingenic,jz4760b-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000 (ingenic,jz4780-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'simple-mfd'] is too long
   	'ingenic,jz4780-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: rtc@10003000 (ingenic,jz4780-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-rtc'] is too short
   	'ingenic,jz4780-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: pin-controller@10010000 (ingenic,jz4780-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10033000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10033000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10034000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10034000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10050000 (ingenic,jz4780-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10050000 (ingenic,jz4780-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10051000 (ingenic,jz4780-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10051000 (ingenic,jz4780-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10052000 (ingenic,jz4780-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10052000 (ingenic,jz4780-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10053000 (ingenic,jz4780-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10053000 (ingenic,jz4780-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10054000 (ingenic,jz4780-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10054000 (ingenic,jz4780-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc0@13050000 (ingenic,jz4780-lcd): $nodename:0: 'lcdc0@13050000' does not match '^lcd-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc0@13050000 (ingenic,jz4780-lcd): clock-names:0: 'lcd_pclk' was expected
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc0@13050000 (ingenic,jz4780-lcd): clock-names:1: 'lcd' was expected
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc1@130a0000 (ingenic,jz4780-lcd): $nodename:0: 'lcdc1@130a0000' does not match '^lcd-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc1@130a0000 (ingenic,jz4780-lcd): clock-names:0: 'lcd_pclk' was expected
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: lcdc1@130a0000 (ingenic,jz4780-lcd): clock-names:1: 'lcd' was expected
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000 (ingenic,jz4780-nemc): 'efuse@d0' does not match any of the regexes: '.*@[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000 (ingenic,jz4780-nemc): $nodename:0: 'nemc@13410000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000 (ingenic,jz4780-nemc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-nemc', 'simple-mfd'] is too long
   	'ingenic,jz4725b-nemc' was expected
   	'ingenic,jz4740-nemc' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: efuse@d0 (ingenic,jz4780-efuse): Unevaluated properties are not allowed ('eth-mac-addr@22' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6 (davicom,dm9000): $nodename:0: 'dm9000@6' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6 (davicom,dm9000): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: dma@13420000 (ingenic,jz4780-dma): $nodename:0: 'dma@13420000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/ingenic,dma.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: /bch@134d0000: failed to match any schema with compatible: ['ingenic,jz4780-bch']
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: / (yna,cu1000-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'mode-reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): usb-phy@3c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): $nodename:0: 'x1000-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: usb-phy@3c (ingenic,x1000-phy): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: mac-phy-ctrl@e8 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): pwm@40:clock-names: ['timer0', 'timer1', 'timer2', 'timer3', 'timer4'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): pwm@40:clocks: [[7, 0], [7, 1], [7, 2], [7, 3], [7, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog']
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: pin-controller@10010000 (ingenic,x1000-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: spi@10043000 (ingenic,x1000-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@48' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet@134b0000 (ingenic,x1000-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet@134b0000 (ingenic,x1000-mac): compatible: ['ingenic,x1000-mac', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: / (yna,cu1830-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: cpu@0 (ingenic,xburst-fpu2.0-mxu2.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: interrupt-controller@10001000 (ingenic,x1830-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-intc', 'ingenic,jz4780-intc'] is too long
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4775-intc', 'ingenic,jz4770-intc', 'ingenic,jz4760b-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	'ingenic,jz4760-intc' was expected
   	'ingenic,jz4740-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /interrupt-controller@10001000: failed to match any schema with compatible: ['ingenic,x1830-intc', 'ingenic,jz4780-intc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'mode-reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): usb-phy@3c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): $nodename:0: 'x1830-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: usb-phy@3c (ingenic,x1830-phy): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mac-phy-ctrl@e8 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000 (ingenic,x1830-ost): compatible:0: 'ingenic,x1830-ost' is not one of ['ingenic,x1000-ost', 'ingenic,x2000-ost']
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000 (ingenic,x1830-ost): compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@12000000: failed to match any schema with compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000: failed to match any schema with compatible: ['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): pwm@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-pwm', 'ingenic,jz4740-pwm'] is too long
   	'ingenic,x1830-pwm' is not one of ['ingenic,jz4740-pwm', 'ingenic,jz4725b-pwm', 'ingenic,x1000-pwm']
   	'ingenic,x1830-pwm' is not one of ['ingenic,jz4760-pwm', 'ingenic,jz4760b-pwm', 'ingenic,jz4770-pwm', 'ingenic,jz4780-pwm']
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1830-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1830-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd'] is too long
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'ingenic,jz4760b-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1830-watchdog', 'ingenic,jz4780-watchdog']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/pwm@40: failed to match any schema with compatible: ['ingenic,x1830-pwm', 'ingenic,jz4740-pwm']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: pin-controller@10010000 (ingenic,x1830-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10030000 (ingenic,x1830-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-uart', 'ingenic,x1000-uart'] is too long
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4770-uart', 'ingenic,jz4775-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	'ingenic,jz4760-uart' was expected
   	'ingenic,jz4740-uart' was expected
   	'ingenic,jz4750-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /serial@10030000: failed to match any schema with compatible: ['ingenic,x1830-uart', 'ingenic,x1000-uart']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10031000 (ingenic,x1830-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-uart', 'ingenic,x1000-uart'] is too long
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4770-uart', 'ingenic,jz4775-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	'ingenic,jz4760-uart' was expected
   	'ingenic,jz4740-uart' was expected
   	'ingenic,jz4750-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10031000 (ingenic,x1830-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10031000 (ingenic,x1830-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /serial@10031000: failed to match any schema with compatible: ['ingenic,x1830-uart', 'ingenic,x1000-uart']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000 (ingenic,x1830-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000 (ingenic,x1830-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /spi@10043000: failed to match any schema with compatible: ['ingenic,x1830-spi', 'ingenic,x1000-spi']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10044000 (ingenic,x1830-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /spi@10044000: failed to match any schema with compatible: ['ingenic,x1830-spi', 'ingenic,x1000-spi']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-i2c', 'ingenic,x1000-i2c'] is too long
   	'ingenic,x1830-i2c' is not one of ['ingenic,jz4770-i2c', 'ingenic,x1000-i2c']
   	'ingenic,jz4780-i2c' was expected
   	'ingenic,jz4770-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@48' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /i2c-controller@10050000: failed to match any schema with compatible: ['ingenic,x1830-i2c', 'ingenic,x1000-i2c']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-i2c', 'ingenic,x1000-i2c'] is too long
--
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10052000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10052000 (ingenic,x1830-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-i2c', 'ingenic,x1000-i2c'] is too long
   	'ingenic,x1830-i2c' is not one of ['ingenic,jz4770-i2c', 'ingenic,x1000-i2c']
   	'ingenic,jz4780-i2c' was expected
   	'ingenic,jz4770-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /i2c-controller@10052000: failed to match any schema with compatible: ['ingenic,x1830-i2c', 'ingenic,x1000-i2c']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mmc@13450000 (ingenic,x1830-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-mmc', 'ingenic,x1000-mmc'] is too long
   	'ingenic,x1830-mmc' is not one of ['ingenic,jz4740-mmc', 'ingenic,jz4725b-mmc', 'ingenic,jz4760-mmc', 'ingenic,jz4775-mmc', 'ingenic,jz4780-mmc', 'ingenic,x1000-mmc']
   	'ingenic,jz4770-mmc' was expected
   	'ingenic,jz4760-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /mmc@13450000: failed to match any schema with compatible: ['ingenic,x1830-mmc', 'ingenic,x1000-mmc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mmc@13460000 (ingenic,x1830-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-mmc', 'ingenic,x1000-mmc'] is too long
   	'ingenic,x1830-mmc' is not one of ['ingenic,jz4740-mmc', 'ingenic,jz4725b-mmc', 'ingenic,jz4760-mmc', 'ingenic,jz4775-mmc', 'ingenic,jz4780-mmc', 'ingenic,x1000-mmc']
   	'ingenic,jz4770-mmc' was expected
   	'ingenic,jz4760-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /mmc@13460000: failed to match any schema with compatible: ['ingenic,x1830-mmc', 'ingenic,x1000-mmc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): compatible: ['ingenic,x1830-mac', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
