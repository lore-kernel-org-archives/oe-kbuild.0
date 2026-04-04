Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6B358391
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286115; cv=none; b=DIsk+982Mlt2+Z8gVi69nkKS0FU4Npt16Fv+3xb2vA/8D97mK297arOs/VWegQmX79qsxgwYyIrlTgA68aqn+/IJe/E4bYoeqBQOqLvuicW/g7zEJoFijFrW7CxMV/RMQ0rjJjdip+/YVFy5RnJAo+lwdnbTxQ1A+WGbA0c7m/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286115; c=relaxed/simple;
	bh=ND0pnUbY7Swn1gGfXDIBiUxofsC5/OMCJQIpJQgp3y8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MAkHxHsXOc5eD9QvsJCBZgRt8G+sE2KQZM6gLOM0Tha8/Fnn8KufVkwVdDhHI9CbuODGWB5WhcVxNssQ4LRZIHEcPncAPUS3zXBUeLjqrpMhB96MnnFVSmRd+sdxa7YEadPC1jDNqjM2xhsXWcsj/mD0IG/I32eL4wHgOBTulSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGc32o6R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGc32o6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775286113; x=1806822113;
  h=date:from:to:cc:subject:message-id;
  bh=ND0pnUbY7Swn1gGfXDIBiUxofsC5/OMCJQIpJQgp3y8=;
  b=HGc32o6RcO/Hm3HvxF/NVokpPXKM6qJck0/GQZPw8XyaJfDVbVbm9O75
   XN8uEpUgeekpxKu5weXMV3D53Ias0C0HOajTeqFewxvWCB2OD5kUTOFlF
   S/dB7iKLimpV80amxu/HPoYbDHaQ8YodUQ4VSKkP9hoLUPqAKyxoYqGgd
   qji9JRxtKfpQDoJcByhMJkKECY9AsC7MtVw8O1uRz45ayq4M/zAnJLsqR
   raLdTIUpSyFPU7N4h6aITNigDQ9kC1tqUMBbBeAZpqLe+Ex+ElffTUQqL
   /YlW4IIKPbqA2PZX2609wnVUE3kDOsV7IIBMXBpdCGnxw6iRn4sOg894Q
   A==;
X-CSE-ConnectionGUID: hrcovdM8Sc+Qsur6PdlJew==
X-CSE-MsgGUID: UYXLqzEzTguAqZ1mPKEMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="87787032"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="87787032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 00:01:53 -0700
X-CSE-ConnectionGUID: tluZ8eG5TXmjAcJhvH2K2A==
X-CSE-MsgGUID: DrWMgJ3sTsymuH2s58T4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="224165271"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2026 00:01:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8v0v-000000009Y5-0i2A;
	Sat, 04 Apr 2026 07:01:49 +0000
Date: Sat, 04 Apr 2026 09:01:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [abelloni:rtc-next 15/17]
 arch/mips/boot/dts/ingenic/qi_lb60.dtb: rtc@10003000 (ingenic,jz4740-rtc):
 False schema does not allow {'compatible': ['ingenic,jz4740-rtc'], 'reg':
 [[268447744, 64]], 'interrupt-parent': [[5]], 'interrupts': [[15]], 'clocks':
 [[1, 1]], 'clock-names': ['r...
Message-ID: <202604040844.DxmLtkY2-lkp@intel.com>
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
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   a33bf4b6adf70aa8c8a18a231ea7aed3fd1b3875
commit: 0452290110ccad3afff28d193ce546047e861fff [15/17] dt-bindings: rtc: ingenic,rtc: Use generic power-controller schema
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: mips-randconfig-2051-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040844.DxmLtkY2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040844.DxmLtkY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604040844.DxmLtkY2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: rtc@10003000 (ingenic,jz4740-rtc): False schema does not allow {'compatible': ['ingenic,jz4740-rtc'], 'reg': [[268447744, 64]], 'interrupt-parent': [[5]], 'interrupts': [[15]], 'clocks': [[1, 1]], 'clock-names': ['rtc'], 'system-power-controller': True, '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: rtc@10003000 (ingenic,jz4740-rtc): Unevaluated properties are not allowed ('system-power-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: nand-controller@1 (ingenic,jz4740-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: rtc@10003000 (ingenic,jz4725b-rtc): False schema does not allow {'compatible': ['ingenic,jz4725b-rtc', 'ingenic,jz4740-rtc'], 'reg': [[268447744, 64]], 'interrupt-parent': [[5]], 'interrupts': [[6]], 'clocks': [[1, 24]], 'clock-names': ['rtc'], 'system-power-controller': True, '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: rtc@10003000 (ingenic,jz4725b-rtc): Unevaluated properties are not allowed ('system-power-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000 (ingenic,jz4725b-adc): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1 (ingenic,jz4725b-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000 (ingenic,jz4725b-lcd): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: /ecc-controller@130d0000: failed to match any schema with compatible: ['ingenic,jz4725b-bch']
   arch/mips/boot/dts/ingenic/rs90.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
--
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-ost'] is too short
   	'ingenic,jz4770-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
   	'ingenic,jz4760-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-tcu', 'simple-mfd'] is too short
   	'ingenic,jz4770-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: rtc@10003000 (ingenic,jz4770-rtc): False schema does not allow {'compatible': ['ingenic,jz4770-rtc', 'ingenic,jz4760-rtc'], 'reg': [[268447744, 64]], 'interrupt-parent': [[6]], 'interrupts': [[32]], 'clocks': [[1, 47]], 'clock-names': ['rtc'], 'system-power-controller': True, '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: rtc@10003000 (ingenic,jz4770-rtc): Unevaluated properties are not allowed ('system-power-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: pin-controller@10010000 (ingenic,jz4770-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10030000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10031000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'ingenic,jz4760-ost' was expected
   	'ingenic,jz4725b-ost' was expected
   	'ingenic,jz4760b-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000 (ingenic,jz4780-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'simple-mfd'] is too long
   	'ingenic,jz4780-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: rtc@10003000 (ingenic,jz4780-rtc): False schema does not allow {'compatible': ['ingenic,jz4780-rtc'], 'reg': [[268447744, 76]], 'interrupt-parent': [[6]], 'interrupts': [[32]], 'clocks': [[1, 1]], 'clock-names': ['rtc'], '#clock-cells': 0, 'phandle': 16, '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: rtc@10003000 (ingenic,jz4780-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-rtc'] is too short
   	'ingenic,jz4780-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: pin-controller@10010000 (ingenic,jz4780-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
--
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): pwm@40:clocks: [[7, 0], [7, 1], [7, 2], [7, 3], [7, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000 (ingenic,x1000-tcu): watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog']
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): False schema does not allow {'compatible': ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'], 'reg': [[268447744, 76]], 'interrupt-parent': [[6]], 'interrupts': [[32]], 'clocks': [[1, 1]], 'clock-names': ['rtc'], '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
--
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000 (ingenic,x1830-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd'] is too long
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'ingenic,jz4760b-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1830-watchdog', 'ingenic,jz4780-watchdog']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/pwm@40: failed to match any schema with compatible: ['ingenic,x1830-pwm', 'ingenic,jz4740-pwm']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): False schema does not allow {'compatible': ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'], 'reg': [[268447744, 76]], 'interrupt-parent': [[6]], 'interrupts': [[32]], 'clocks': [[1, 1]], 'clock-names': ['rtc'], '$nodename': ['rtc@10003000']}
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
