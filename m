Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9228178F2E
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043376; cv=none; b=Xt1iqs8OVQW7ze7meshOy84oDnK0BIGemZKqFvZ4AEQKzuh3YFOnT9gu/Co4qS77WaC0u0UyYBWvinep2Fwc0G3Ee6OiuntfIfhj90IF82DhNyDDLFnCx02YrYZPkC7TQXPfgWYHKLAcUdxS4mwNSNuG7XTSYf6FXZz46ZNvUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043376; c=relaxed/simple;
	bh=/EEIJAiZx0aWB/tAZf0cxNu+8pwMLdkLfyPEh0TJ+ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VPgA19jufo7aYXnY8kDogbJnS8A8HWLFNeB9hgOf5DXVJWqe41u+wg5rHMDXyD9m3YfMC5l/cpxL3vwzQejnmBFM+wDBP7KVTnsNnqS19Re5SeS75LkUzDOxC8/ZiFmLNRF8zPeINYVHO7Fdg0F0wWzzkeSEailyjnMqSnd6QII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6e/GouA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6e/GouA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778043374; x=1809579374;
  h=date:from:to:cc:subject:message-id;
  bh=/EEIJAiZx0aWB/tAZf0cxNu+8pwMLdkLfyPEh0TJ+ho=;
  b=D6e/GouAYBdG0/QZBAVjYchQpG5XIewzNx6DhZLcw3HkEvMREI/xl3DK
   xUjnMks0jpgx52PbbSIyje4uVzla6DB+CT3PQZ0n8yLagtG8WmrqPQ/ZN
   gAYp+rn8sdA+O5sYwwJb2s+9IVMu4/eU80NWhMN9gbUmCy52OxFJa/uRZ
   RUALUtqJZvV1T2e2N5b9j6obCtQe82kgqmdFyAdN4NKV5S4hTvVT9t1Uu
   2BYpxw9K0mG/ZWiIDW28UQNK/Fx4fb+oAaZzjLz0b8zqSzkEAJK9b8BXD
   yrQwzn7lMQr6GRrbSNbCst97xoLTKnwoT5m6DDODAqtqNrCWHAQ5mclYg
   A==;
X-CSE-ConnectionGUID: zlB4hY1RSsKNxT+oPtc7lw==
X-CSE-MsgGUID: vWVJ6htTQOmiIdaKsTvMzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="77948761"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="77948761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 21:56:13 -0700
X-CSE-ConnectionGUID: ig9iBamzRC66VCOu4hPvVg==
X-CSE-MsgGUID: seOMqu7BRImaUeLb6ouZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="239994229"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2026 21:56:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKUIr-000000006RX-0cjs;
	Wed, 06 May 2026 04:56:09 +0000
Date: Wed, 06 May 2026 06:55:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: cpu@0
 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
Message-ID: <202605060619.trxhyjgB-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f377d0025eb00c0590466f5be9f50decf9b9180e
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   1 year ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year ago
config: arm-randconfig-2054-20260429 (https://download.01.org/0day-ci/archive/20260506/202605060619.trxhyjgB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060619.trxhyjgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605060619.trxhyjgB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'compulab,cm-t335' was expected
   	'phytec,am335x-phycore-som' was expected
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /: failed to match any schema with compatible: ['vscom,onrisc', 'ti,am33xx']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: interconnect@44c00000 (ti,am33xx-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000: failed to match any schema with compatible: ['ti,am33xx-l4-wkup', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:125.43-132.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-0@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:134.43-141.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-1@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:161.43-168.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /: failed to match any schema with compatible: ['ti,am43x-epos-evm', 'ti,am438x', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /: failed to match any schema with compatible: ['ti,am43x-epos-evm', 'ti,am438x', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /: failed to match any schema with compatible: ['ti,am43x-epos-evm', 'ti,am438x', 'ti,am43']
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: cpu@0 (arm,cortex-a9): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: ocp@44000000 (simple-pm-bus): $nodename:0: 'ocp@44000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/l3-noc@44000000: failed to match any schema with compatible: ['ti,am4372-l3-noc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: interconnect@44c00000 (ti,am4-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:125.43-132.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-0@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:134.43-141.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-1@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:161.43-168.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-gp-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-gp-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-gp-evm', 'ti,am4372', 'ti,am43']
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: cpu@0 (arm,cortex-a9): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: ocp@44000000 (simple-pm-bus): $nodename:0: 'ocp@44000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/l3-noc@44000000: failed to match any schema with compatible: ['ti,am4372-l3-noc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: interconnect@44c00000 (ti,am4-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:125.43-132.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-0@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:134.43-141.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-1@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:161.43-168.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-idk-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-idk-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-idk-evm', 'ti,am4372', 'ti,am43']
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: cpu@0 (arm,cortex-a9): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: ocp@44000000 (simple-pm-bus): $nodename:0: 'ocp@44000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/l3-noc@44000000: failed to match any schema with compatible: ['ti,am4372-l3-noc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: interconnect@44c00000 (ti,am4-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:125.43-132.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-0@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:134.43-141.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-1@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:143.43-150.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-2@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:152.43-159.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm3-tbclk-4@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi:161.43-168.4: Warning (unique_unit_address_if_enabled): /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm4-tbclk-5@664: duplicate unit-address (also used in node /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks/clock-ehrpwm5-tbclk-6@664)
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-sk-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-sk-evm', 'ti,am4372', 'ti,am43']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /: failed to match any schema with compatible: ['ti,am437x-sk-evm', 'ti,am4372', 'ti,am43']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: cpu@0 (arm,cortex-a9): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: ocp@44000000 (simple-pm-bus): $nodename:0: 'ocp@44000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/l3-noc@44000000: failed to match any schema with compatible: ['ti,am4372-l3-noc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: interconnect@44c00000 (ti,am4-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /: failed to match any schema with compatible: ['ti,am5728-evm', 'ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /: failed to match any schema with compatible: ['ti,am5728-evm', 'ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /: failed to match any schema with compatible: ['ti,am5728-evm', 'ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /: failed to match any schema with compatible: ['ti,am5728-evm', 'ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: / (ti,am5718-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: / (ti,am5728-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
