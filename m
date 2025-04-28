Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB52198E76
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889584; cv=none; b=bdaH8WzlQHyprY6A/M1+4dvK2k7vYdh4kExgrmt/bkBl3KAmu0KforzbbezEnXOJHoW872o7HOSikL10iZP83FOuLVX12tgo3WudllT+N6YYW8Zq4T0iO49kFCrZDEqmrF8NuWbu83+t0YW1t9nHdEjxfiuqUkHKYwhMN+1e7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889584; c=relaxed/simple;
	bh=acFAQlA7iCf/eW288GfKjBVGaoJdIAiDDznfdQ2Vuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YR9KrKE5kJm7vFHoIwR19eZXPAqorU+94fJeo1XMH6jHDE8Witm0TnfCYMzp068vBfwPtJMezTKB05OocI8D0FSpgukIGw0+DXdECGXfrZkPLdlvzCR0LpKjOBy2vb6VznaHrfeL6A1frQe9Ut7lMbmXiU2StHjJZWpHJytFHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knwTuLVr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knwTuLVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889581; x=1777425581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acFAQlA7iCf/eW288GfKjBVGaoJdIAiDDznfdQ2Vuaw=;
  b=knwTuLVrIhkHnlm8hW8s7yY8gx4FiNIy/sjTdwyEEfhc07ORzcubOevh
   A90/Wh9cZ+1Y4Iai49Ilp1QaJDZMq/QZcmuHYw0XAc144D3iZMSUuudsO
   EcRFTrdqiTeGYWYhRzfi7JkktJu+cxqWr9Vr7VUa7mXH9gbbGvVBfgOK9
   Z3nOh44M4xf4W7nMD66oPdBezjC9WOD4N9lrfIRm2q65YqDyOUZf5z5JL
   dTJIkEwSbu/MZH78P3NXOIG22kZ3wKVdZgpsj9fMzVCPA1GSutqg8m4Q4
   VZbAAa/2KE5vGoS1Iw0Nux/s3X6b22VWIhthbAu31qMZImyybue5RW1gl
   g==;
X-CSE-ConnectionGUID: kFh8hw+LSymHf/BLqih/yA==
X-CSE-MsgGUID: Qdrmh3XvSMyfgRU3ToF+2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313348"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:39 -0700
X-CSE-ConnectionGUID: gDURbTOlTW2MYslgrgW48w==
X-CSE-MsgGUID: dRk2M12ZRe2pwFH5TS5y7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637891"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000Lk-0B;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 05:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct):
 '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202504290418.Kr0nDiQx-lkp@intel.com>
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
TO: Aryabhatta Dey <aryabhattadey35@gmail.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f15d97df5afae16f40ecef942031235d1c6ba14f
commit: 4b989e6e1a4fd726271fac589782ac1f4cb6bf55 dt-bindings: arc: convert archs-pct.txt to yaml
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290418.Kr0nDiQx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290418.Kr0nDiQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290418.Kr0nDiQx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
   arch/arc/boot/dts/hsdk.dtb: / (snps,hsdk): memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/hsdk.dtb: /idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/hsdk.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): dmac-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): mmcclk-biu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gmacclk: 'ranges' is a required property
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
