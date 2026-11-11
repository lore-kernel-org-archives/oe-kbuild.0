Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405648;
	b=1vtUIVKa0vClqyqHpqtnu/t2IkctNfCim4DjtTeTZl3ofWJTdqdy4JrfLmy1SE57wlgW
	 XXDD1TX9U491UnmI8nVUm9dIFpBDEaJt4A7u1BezctV1alVmWSaKciC38oVfIh5F2bnj8
	 2QJntA5wjx9G5YkfAO5r9UCiJb9HJNv3agvLiTUIzlx32lAR/Q4b5VfycT5CFMX5r7PcO
	 CVvB6KsjLmUiDR0PygzKu5Yhk0McGBhAxT0qQDzUiy6mDoM/elsFG5oTkPkKsWgMABcB9
	 WX3F3qLf0H4Wa3grWJBDGxD+NIo1on0D5MbcX1GLhixsweJI2spx5EbIpY2WsJakFRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FYVsYEPfoep6a9vbAdSz1dGiH11dpp8FfmBX1azJ/2g=;
	b=Hzqmd59IMQI9ewTr/UhIsH5Y5vx65/OM6uIE05I7ra4BOAZSxNuapKMomDZqerRO1rH3
	 xKiNeZN4mldTq7jioBtZMF6X+IvFn45I3yMmSYuHV87ONz1nEbxuKxaE0Ogd+2J2lAVXH
	 smwMm/JBpLPO/P1msuIbdpaykXt/anvWlfLEhIdNhPi5t58WDlXXpAWxCs7LSEMa7l3xR
	 A1DJGB6oGEBGx0ZumLPy3nVxX+UOdlbyNysoVUg7mB53NArKP9tutfMQcdQ4/rn+AbBBU
	 60j1Z8rl9++8oslNHcBqvo7J75lD/vGcVIGjKCEY8e4hfUM6LVQ9b7S4wgLdJ7iHKWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SFS6vBne;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CB606A326
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 14:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SFS6vBne
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794405647; x=1825941647;
  h=date:from:to:cc:subject:message-id;
  bh=sYjqKxue6LYAIiEQInL/a4PBa+eVadWhpRPg1IMm9GA=;
  b=SFS6vBne/jNP9rAbTaN174PJaDlEncaO8+iRpzA3PxgJB8fmlHFfd8y5
   H3gp0A+M9pA9WBYvUu6LGCmV0N2yAIqyKSf7w5R9qnpfdiKoR5Zp3qFWC
   M2VjtxMUCItJt2wxmS4RUFZOt3FnUNbNLS6fWCDw4eZzaYzNiDYJp5ZdO
   n6kcTa1+S6aHqR8/73209LTucNZ9c3Jha8Deif8+CrvjGbFKTyXAVzw/j
   VfszwD/F2MiecGDr/3TsfwY7X7da2l9gEdAJXrnPrXHmmL5+iPjIRcV78
   PGQqjXI8/CVLN7A8HfdOO7kJX1bJrMkwOJIjM71rbHKyctDbXerSc9YJB
   Q==;
X-CSE-ConnectionGUID: PMFD4LdpQ1mH/OCUf906JA==
X-CSE-MsgGUID: UUnLSZ9PRoGl+onZnJjX4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3086274"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3086274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:00:47 -0800
X-CSE-ConnectionGUID: gmqXzpfSS3y6He/DoucFmg==
X-CSE-MsgGUID: 8lJZLQxZQoifmR3+C/fung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8521449"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2026 06:00:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR8sU-000000000b9-2GNU;
	Wed, 11 Nov 2026 14:00:42 +0000
Date: Wed, 11 Nov 2026 15:00:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [vireshk-pm:opp/linux-next 1/1]
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15):
 Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
Message-ID: <202611111452.7RrXnAPW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   10045445e430a4eee85335c26eab9b4304cad625
commit: 10045445e430a4eee85335c26eab9b4304cad625 [1/1] dt-bindings: opp: Allow 'clock-latency' with dynamically populated OPPs
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611111452.7RrXnAPW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111452.7RrXnAPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611111452.7RrXnAPW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: audio-codec@1c (realtek,rt5639): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: sd0: ams,ext-control: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: smps123: ti,roof-floor: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: smps123: ti,mode-sleep: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: smps7: ti,roof-floor: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: ldo1: ti,roof-floor: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vdd-cpu-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: led-controller (pwm-leds): 'led-button' does not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /: failed to match any schema with compatible: ['isee,omap3-igep0020', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /: failed to match any schema with compatible: ['isee,omap3-igep0020-rev-f', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /: failed to match any schema with compatible: ['isee,omap3-igep0030', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /: failed to match any schema with compatible: ['isee,omap3-igep0030-rev-g', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /: failed to match any schema with compatible: ['incostartec,omap3-lilly-dbb056', 'incostartec,omap3-lilly-a83x', 'ti,omap3630', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /: failed to match any schema with compatible: ['incostartec,omap3-lilly-dbb056', 'incostartec,omap3-lilly-a83x', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /: failed to match any schema with compatible: ['compulab,omap3-sbc-t3730', 'compulab,omap3-cm-t3730', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: / (ti,am5718-idk): connector@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: / (ti,am5718-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: / (ti,am5728-idk): connector@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: / (ti,am5728-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: / (beagle,am5729-beagleboneai): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: / (ti,am5748-idk): connector@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: / (ti,am5748-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: / (ti,dra718-evm): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: / (ti,am5718-idk): connector@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: / (ti,am5718-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: / (ti,am5728-idk): connector@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: / (ti,am5728-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('vbb-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
