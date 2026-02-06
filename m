Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47C23ABB0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770392507; cv=none; b=Y0WYkl/fbymgdr0ywzGux/00t3T/SU/XnsNV63NCUM6UmijTwP7Qyco6HmgjJnp5sSvQAcU4ZWcFevPGbEnQv5p5G+iy4ay6N07/9xv7GyExchDemoxq6NNmzWfWaCFESUNsZj2yzil3I+4sUZ4sEWhLqAM3/r55+IyBG5v2cbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770392507; c=relaxed/simple;
	bh=hXSQaRnKvQBSw7Pvos+OY5mVk8gu0t05OW1PgC2JTmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TY6zIePYzRpVBJlvxMj16hPFUHi1/uPFWXW6xNlKVehi7IOiICPTiWO01x8Ss50nYcf9j02bShdKaKSDI3zl0/wWTc/mhzn0jO2xXaFnPvCLdDdmV6NFIpnLwuKcdLlSve1W4WJmyIHDmnLyXjhNbm7eq2paco8V7xB5bsiFY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECAp2UNF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECAp2UNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770392507; x=1801928507;
  h=date:from:to:cc:subject:message-id;
  bh=hXSQaRnKvQBSw7Pvos+OY5mVk8gu0t05OW1PgC2JTmk=;
  b=ECAp2UNFGpIqshcn5wl/kY2CXCq6eEHR554kAioSlg6or075igmKQWxJ
   Sae3NJ15p5yL+7baJ4cPp2EVlcYeYfFm+LaNr6LCKyRGfX75NzM5TVkFK
   TPAhARQ6TXZDU9dL0YwSv1HKhAmpprzgBh6Uo/o9VjTbxjApV/ancnR+B
   1mwzY/78TP3P7YPQ6ve2HQvrNJXu+6gQzoAcjHQ+K436WpG1jObYOmR7i
   yxo2Ro1yjziohptiJkLxZcRfBXUxNIUHFdEaAYs5d/EuvB3pmEkzf/f2j
   9Bb722z47WEM8H1zbIuFCTHFc1lfnxS3s6IG+Cq5NEuMCaIwhW+ggXiHQ
   g==;
X-CSE-ConnectionGUID: VgHHXruDQhStT/vhqNHWHw==
X-CSE-MsgGUID: 1KQr/GG2TMGbotvohxvCsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70793805"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="70793805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 07:41:46 -0800
X-CSE-ConnectionGUID: 5FpdrzTPT+aGUjcEfytugw==
X-CSE-MsgGUID: Mx6iA1/LQwmf2o0hD13veg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215386765"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 07:41:46 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voNxn-000000004ar-1Qey;
	Fri, 06 Feb 2026 15:41:43 +0000
Date: Fri, 06 Feb 2026 16:40:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axs103.dtb: archs-intc@cpu
 (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202602061614.xx0CmSqk-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
commit: f7c3cf504db71b01d38d69c22da71cb36394413b dt-bindings: interrupt-controller: Convert snps,archs-intc to DT schema
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: arc-randconfig-2051-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061614.xx0CmSqk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061614.xx0CmSqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602061614.xx0CmSqk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
>> arch/arc/boot/dts/axs103.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
>> arch/arc/boot/dts/axs103_idu.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arc/boot/dts/haps_hs.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/haps_hs.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs.dtb: interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
--
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
--
   arch/arc/boot/dts/hsdk.dts:189.28-193.5: Warning (simple_bus_reg): /soc/gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:195.32-199.5: Warning (simple_bus_reg): /soc/dmac-core-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
   arch/arc/boot/dts/hsdk.dtb: / (snps,hsdk): memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
>> arch/arc/boot/dts/hsdk.dtb: cpu-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
--
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
--
   arch/arc/boot/dts/vdk_hs38.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/vdk_hs38.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
