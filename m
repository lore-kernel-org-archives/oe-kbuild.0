Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68172253A1
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 02:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762137714; cv=none; b=X7isYwxKIo3/sElvyIVmLe54tNw5GJg5uX6DNg3MW8hk0uNPVimmSvEOpOItMwh76yOBcEGIFAaVuMw81Ul60I4PnlloxwTbZ6mWEI61FVIMxGlu63+7Qu4DYQ3GhBkdw/aBXtzphbo8+NvNZzGdHuW3b+TaBnC0tGL/JmARqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762137714; c=relaxed/simple;
	bh=74bxCE8QdkfhrAN/go6fq3DEuWxB5MxbazEJNVN1bNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erIAUmBvo+kUZITyd3tQF/BrXrCFU0cHgSj9GnMbDG0uaDoMhX1GCueE+j2aqEMloip3wUhN6E0GrCEl6Ml7htBN3cZjOzUEvRttokgV56Hv0O87idHnXGP/ckfwBj0BW3VJBuAA2W+6xZXIOlab7s/TWPxC9L+lVbqNfIgmJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKeZ5S4u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKeZ5S4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762137712; x=1793673712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74bxCE8QdkfhrAN/go6fq3DEuWxB5MxbazEJNVN1bNI=;
  b=JKeZ5S4uZnA/bSvuHAf/eYApLMvARBhSNewtbPD4hdnjvp9DvOCtZF69
   3RqZgcVlMD0EWD3T7ZhR/9hcLrPtESgyPsP9xPmRj423N16RudhR3z7Hf
   PVLEUB6yWdCn4JoKxzG3ZyzmaAUjAWJ6MJ/kPbpOCWm/ysJ9VUL0U8QEM
   rx/ptV+duI8zvOnveBzlNRftzFmnpgqWTtaddMT9bJAo4h2N7tS+4ITUR
   HQqj3KYAPYhNZozd3LscCOG1PXv9uRkUXIDzWJaylKZmUFWt2BKWjtGL/
   nscOhdaL7qRiS54mpd5zaa7VmO2WCjB7qRYmxCxXSUf0IpEpqtnOyESG6
   Q==;
X-CSE-ConnectionGUID: 9Q6n2DTFQLuDM/hp3evSog==
X-CSE-MsgGUID: OKk1cHMTTxqxW83qUoRZRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51780711"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="51780711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 18:41:51 -0800
X-CSE-ConnectionGUID: bQLqyJvLSCOms+1V7l2VsQ==
X-CSE-MsgGUID: 7JAeIxjiQqeCFQ/In72pBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187475062"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2025 18:41:50 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFkVv-000000001aW-3VuV;
	Mon, 03 Nov 2025 02:41:47 +0000
Date: Mon, 3 Nov 2025 03:41:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): False schema does
 not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368,
 805306368]]}
Message-ID: <202511030310.B5Fq3TcP-lkp@intel.com>
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
head:   6146a0f1dfae5d37442a9ddcba012add260bceb0
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-2051-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030310.B5Fq3TcP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 20c323aa0e5dea6f3d340c721c5cee30801db850)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030310.B5Fq3TcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511030310.B5Fq3TcP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/ci20.dts:25.9-29.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 805306368]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@1 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): $nodename:0: 'jz4780-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
--
   	'ingenic,jz4740-nemc' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: efuse@d0 (ingenic,jz4780-efuse): Unevaluated properties are not allowed ('eth-mac-addr@22' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6 (davicom,dm9000): $nodename:0: 'dm9000@6' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6 (davicom,dm9000): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: dma@13420000 (ingenic,jz4780-dma): $nodename:0: 'dma@13420000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/ingenic,dma.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: /bch@134d0000: failed to match any schema with compatible: ['ingenic,jz4780-bch']
--
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: nand-controller@1 (ingenic,jz4740-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: /ecc-controller@13010100: failed to match any schema with compatible: ['ingenic,jz4740-ecc']
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: /keyboard: failed to match any schema with compatible: ['gpio-matrix-keypad']
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: charger (gpio-charger): 'status-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/gpio-charger.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: pmu (ingenic,jz4740-battery): 'power-supplies' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/ingenic,battery.yaml
--
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0 (ingenic,xburst-mxu1.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000 (ingenic,jz4725b-adc): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1 (ingenic,jz4725b-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000 (ingenic,jz4725b-lcd): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: /ecc-controller@130d0000: failed to match any schema with compatible: ['ingenic,jz4725b-bch']
   arch/mips/boot/dts/ingenic/rs90.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: regulator (regulator-fixed): Unevaluated properties are not allowed ('regulaor-max-microvolt', 'regulaor-min-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: keys@1 (adc-keys): 'key@0', 'key@1' do not match any of the regexes: '^button-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/adc-keys.yaml
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000 (ingenic,jz4770-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: jz4770-cgu@10000000 (ingenic,jz4770-cgu): $nodename:0: 'jz4770-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: / (yna,cu1000-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): pwm@40:clock-names: ['timer0', 'timer1', 'timer2', 'timer3', 'timer4'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): pwm@40:clocks: [[7, 0], [7, 1], [7, 2], [7, 3], [7, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog']
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: pin-controller@10010000 (ingenic,x1000-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: spi@10043000 (ingenic,x1000-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10050000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000 (ingenic,x1000-i2c): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@48' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet@134b0000 (ingenic,x1000-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: / (yna,cu1830-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: cpu@0 (ingenic,xburst-fpu2.0-mxu2.0): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: interrupt-controller@10001000 (ingenic,x1830-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-intc', 'ingenic,jz4780-intc'] is too long
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4775-intc', 'ingenic,jz4770-intc', 'ingenic,jz4760b-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	'ingenic,jz4760-intc' was expected
   	'ingenic,jz4740-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /interrupt-controller@10001000: failed to match any schema with compatible: ['ingenic,x1830-intc', 'ingenic,jz4780-intc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): $nodename:0: 'x1830-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: usb-phy@3c (ingenic,x1830-phy): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mac-phy-ctrl@e8 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000 (ingenic,x1830-ost): compatible:0: 'ingenic,x1830-ost' is not one of ['ingenic,x1000-ost', 'ingenic,x2000-ost']
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000 (ingenic,x1830-ost): compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@12000000: failed to match any schema with compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000: failed to match any schema with compatible: ['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): pwm@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-pwm', 'ingenic,jz4740-pwm'] is too long
   	'ingenic,x1830-pwm' is not one of ['ingenic,jz4740-pwm', 'ingenic,jz4725b-pwm', 'ingenic,x1000-pwm']
   	'ingenic,x1830-pwm' is not one of ['ingenic,jz4760-pwm', 'ingenic,jz4760b-pwm', 'ingenic,jz4770-pwm', 'ingenic,jz4780-pwm']
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1830-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1830-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd'] is too long
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'ingenic,jz4760b-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1830-watchdog', 'ingenic,jz4780-watchdog']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/pwm@40: failed to match any schema with compatible: ['ingenic,x1830-pwm', 'ingenic,jz4740-pwm']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: pin-controller@10010000 (ingenic,x1830-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10030000 (ingenic,x1830-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-uart', 'ingenic,x1000-uart'] is too long
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4770-uart', 'ingenic,jz4775-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	'ingenic,jz4760-uart' was expected
   	'ingenic,jz4740-uart' was expected
   	'ingenic,jz4750-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /serial@10030000: failed to match any schema with compatible: ['ingenic,x1830-uart', 'ingenic,x1000-uart']
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
--
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10031000 (ingenic,x1830-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /serial@10031000: failed to match any schema with compatible: ['ingenic,x1830-uart', 'ingenic,x1000-uart']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000 (ingenic,x1830-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000 (ingenic,x1830-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /spi@10043000: failed to match any schema with compatible: ['ingenic,x1830-spi', 'ingenic,x1000-spi']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10044000 (ingenic,x1830-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-i2c', 'ingenic,x1000-i2c'] is too long
   	'ingenic,x1830-i2c' is not one of ['ingenic,jz4770-i2c', 'ingenic,x1000-i2c']
   	'ingenic,jz4780-i2c' was expected
   	'ingenic,jz4770-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000 (ingenic,x1830-i2c): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@48' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /i2c-controller@10050000: failed to match any schema with compatible: ['ingenic,x1830-i2c', 'ingenic,x1000-i2c']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10051000 (ingenic,x1830-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-i2c', 'ingenic,x1000-i2c'] is too long
   	'ingenic,x1830-i2c' is not one of ['ingenic,jz4770-i2c', 'ingenic,x1000-i2c']
   	'ingenic,jz4780-i2c' was expected
   	'ingenic,jz4770-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
--
   	'ingenic,jz4780-i2c' was expected
   	'ingenic,jz4770-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /i2c-controller@10052000: failed to match any schema with compatible: ['ingenic,x1830-i2c', 'ingenic,x1000-i2c']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mmc@13450000 (ingenic,x1830-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-mmc', 'ingenic,x1000-mmc'] is too long
   	'ingenic,x1830-mmc' is not one of ['ingenic,jz4740-mmc', 'ingenic,jz4725b-mmc', 'ingenic,jz4760-mmc', 'ingenic,jz4775-mmc', 'ingenic,jz4780-mmc', 'ingenic,x1000-mmc']
   	'ingenic,jz4770-mmc' was expected
   	'ingenic,jz4760-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /mmc@13450000: failed to match any schema with compatible: ['ingenic,x1830-mmc', 'ingenic,x1000-mmc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mmc@13460000 (ingenic,x1830-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-mmc', 'ingenic,x1000-mmc'] is too long
   	'ingenic,x1830-mmc' is not one of ['ingenic,jz4740-mmc', 'ingenic,jz4725b-mmc', 'ingenic,jz4760-mmc', 'ingenic,jz4775-mmc', 'ingenic,jz4780-mmc', 'ingenic,x1000-mmc']
   	'ingenic,jz4770-mmc' was expected
   	'ingenic,jz4760-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /mmc@13460000: failed to match any schema with compatible: ['ingenic,x1830-mmc', 'ingenic,x1000-mmc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): compatible: ['ingenic,x1830-mac', 'snps,dwmac'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
