Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D42EF66B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633863; cv=none; b=TinPEQ0B1Sx7m0qZlGpTcySn9MQHlVK8/wgnkOo92jtwaSpiFjCJVA1DP4cxiaE/DLIbYcSW3zIrJ1ki6JSXpw0Ue2wGqzV1xs0ditd7PLqzcJkhIg7ivlV4vag3Qcf/JCGrsJyvMcvUxF7g+OYzPS4LeqYpdv2fzBAxy6Fk/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633863; c=relaxed/simple;
	bh=XwIKC5PHM/Wju9wRt4n5V/gVH1bsf2fwEcpODv5/zPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GseURRChOcMt15IoqtbaUybJ1lwpfmWeRNmLL+kNMf1+fRPgjeoAGi/hfbmQhdyxG2FtxXS5oGOX2IdZI9eXRT4CVIWkoBsMln85sA20cvAZpbzJBqjg4RyjvRe3Q7qaR+OQkGJSdWUtSMthUP7GcmVRnnUoseJrQgcEuZbG31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4ZoY2fS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4ZoY2fS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778633857; x=1810169857;
  h=date:from:to:cc:subject:message-id;
  bh=XwIKC5PHM/Wju9wRt4n5V/gVH1bsf2fwEcpODv5/zPA=;
  b=Z4ZoY2fS566DmFWPZAyPi7R0NoEBM7xthp9TqxR6i/wEgq4TRLU3Kjld
   AqMFHWtCD2lvs3U5Lc2ad6tDoNynVkWM6gBaWHUubQxCvi4wiUrkCyhlW
   0lIa2Ttq+pbpE/VrUbVHUaegwPjUCPG4mS6z+/jR5lV52/RLSny5cXX6d
   6Z4OvNTAmuovlW2bUQGiCpmuUehnn1Sz5JmGzgLx+D6AgryFz6DiZo99F
   42V8vKDFe4FPIloR49TQgHD0BtKT8dhf1sbG26YrcI4KrcSIdjafu/I1L
   +QBvdLiIG70KaZ0f3beXz8lzzrgPrso9p8RYQlNFCSqbFgYaJVCQsh/Bv
   A==;
X-CSE-ConnectionGUID: C6cTa8hGTSylM8FvCv3hDA==
X-CSE-MsgGUID: wuNX7JVHTDiDqeMYwmIhrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90134095"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90134095"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:57:35 -0700
X-CSE-ConnectionGUID: gR7EYVfXTn2rfSDmvCeZbA==
X-CSE-MsgGUID: V7tH9MBYQT+np8yTLCQInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237849374"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2026 17:57:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxum-000000008Pe-2QvG;
	Wed, 13 May 2026 00:57:32 +0000
Date: Wed, 13 May 2026 02:56:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: cpu@0
 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
Message-ID: <202605130227.aWon1MBi-lkp@intel.com>
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
TO: Roger Quadros <rogerq@kernel.org>
CC: 0day robot <lkp@intel.com>
CC: "Andrew F. Davis" <afd@ti.com>
CC: Murali Karicheri <m-karicheri2@ti.com>
CC: Basharath Hussain Khaja <basharath@couthit.com>
CC: Parvathi Pudi <parvathi@couthit.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Parvathi-Pudi/arm-dts-ti-Add-device-tree-support-for-PRU-ICSS-on-AM57xx/20260501-131217
head:   24a3fae8327f13cc817eda9c4507a87c21fc5d77
commit: 24a3fae8327f13cc817eda9c4507a87c21fc5d77 arm: dts: ti: Add device tree support for PRU-ICSS on AM335x
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-2051-20260501 (https://download.01.org/0day-ci/archive/20260513/202605130227.aWon1MBi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130227.aWon1MBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130227.aWon1MBi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@44c00000 (ti,am33xx-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000: failed to match any schema with compatible: ['ti,am33xx-l4-wkup', 'simple-pm-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@100000/target-module@0/cpu@0: failed to match any schema with compatible: ['ti,am3352-wkup-m3']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: prcm@0 (ti,am3-prcm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: prcm@0 (ti,am3-prcm): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: prcm@0 (ti,am3-prcm): $nodename:0: 'prcm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0: failed to match any schema with compatible: ['ti,am3-prcm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@490: failed to match any schema with compatible: ['ti,am3-dpll-core-clock']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock-dpll-core-x2: failed to match any schema with compatible: ['ti,am3-dpll-x2-clock']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@488: failed to match any schema with compatible: ['ti,am3-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@494: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@498: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@48c: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-j-type-clock']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@0: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@0 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@800: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@800 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: power-controller@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: power-controller@2d (ti,tps65910): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: tsc (ti,am3359-tsc): 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: tsc (ti,am3359-tsc): 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: tsc (ti,am3359-tsc): 'ti,coordinate-readouts' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: tsc (ti,am3359-tsc): 'ti,wire-config' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@4b140000 (ti,am33xx-l4-mpuss): $nodename:0: 'interconnect@4b140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4b140000: failed to match any schema with compatible: ['ti,am33xx-l4-mpuss', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /gpio-decoder: failed to match any schema with compatible: ['gpio-decoder']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
