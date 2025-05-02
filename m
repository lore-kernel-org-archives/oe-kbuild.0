Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DD22D4DB
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200847; cv=none; b=ngL/GyilF37OhziunubcIPUST77kVUrX9isW8IEZeBcHnIXDbq3twX67vGh4HtMjmIQoCjrI5UiRnTrOmy7/w12f6EIwoHBqq2mS3mazpZKj7PPdYUr69C05XFUL/AfBOUm3Ju6aJXIwC1PCjCXVWlbAw8mM2yd12/V9Xtb0Adc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200847; c=relaxed/simple;
	bh=J2Hs9Z1n4emX8SJvaCUuBAbXZetYsZMQlcPuDMIRSOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Od4dRg+3t1553gEPy+buWI6t+eLEoD4ta/uQQYJwDNnimPzyQ26kBnr5cFvrfbFU04AvIAIkhyhKtyvob3odW7fVHNdEcr2CIr2uX4cz8mV6PuYAkXpe0LMt/ea1xOW7ZHtiagSvRJyl8jgFJpMA44zlFfHTx6jSVcXfr/mxAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpVWOZaJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpVWOZaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200845; x=1777736845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2Hs9Z1n4emX8SJvaCUuBAbXZetYsZMQlcPuDMIRSOo=;
  b=hpVWOZaJcIPhSmFGjtQMQLuwvWMv2m0Q67B+fnSdPRO/mhnRnyffdtMz
   mPVc2Q7G+9wZWjrFy0imaKaZhvvGcLDzuQ5X/y5sXTgOVY0mnGZAIYk8H
   lQX94HHN08NVePJzmRzRJpiWJOyOBf5ptA5bkw7SF7FtqI4bTgP2m9spp
   qiAGrDm3AWVs3RqYREeC7FXVYmAtwKGctrK1GzfnT9PJBLRHjgv5b8g2s
   LDX5LAeTpMeqHOoN2GZ4yW6ofkA8XfbtDX6uTc6FCm+2UYiEFwNkffZho
   ziHFKg521VixAJCc3Lj2qoNgynC463RK+tmB9CSrVBAJZOSC5S6oAtwkz
   g==;
X-CSE-ConnectionGUID: SC4PIEdrQ6msh6LnrpoWwA==
X-CSE-MsgGUID: mnaKJxSTRvy5dOrp6B2WCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70392529"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="70392529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:47:25 -0700
X-CSE-ConnectionGUID: mPTB+oPzSeG0bV/QSyCC9w==
X-CSE-MsgGUID: v25XHBqXRlWv11/3pKDeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139455617"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 May 2025 08:47:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAsbg-0004qX-2w;
	Fri, 02 May 2025 15:47:20 +0000
Date: Fri, 2 May 2025 23:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert-irq 37/44] arch/arc/boot/dts/axs103.dtb:
 archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202505022344.2vnuykWh-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert-irq
head:   271e22adde83e0cc6fce40f70c5f660bf1a8e2e3
commit: f4353e4ddc1cb693532e7342c51587d5c612f2fb [37/44] dt-bindings: interrupt-controller: Convert snps,archs-intc to DT schema
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arc-randconfig-051-20250502 (https://download.01.org/0day-ci/archive/20250502/202505022344.2vnuykWh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022344.2vnuykWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505022344.2vnuykWh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
>> arch/arc/boot/dts/axs103.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
>> arch/arc/boot/dts/axs103_idu.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arc/boot/dts/haps_hs.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/haps_hs.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
--
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
--
   arch/arc/boot/dts/hsdk.dts:189.28-193.5: Warning (simple_bus_reg): /soc/gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:195.32-199.5: Warning (simple_bus_reg): /soc/dmac-core-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
   arch/arc/boot/dts/hsdk.dtb: / (snps,hsdk): memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
>> arch/arc/boot/dts/hsdk.dtb: cpu-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
--
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
--
   arch/arc/boot/dts/vdk_hs38.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/vdk_hs38.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/vdk_hs38.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
