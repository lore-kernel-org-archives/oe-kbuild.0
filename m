Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8423E324
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551715; cv=none; b=GtfdGNsTSb9ePgqXpS/t6EqwJM6+MettVwQSVBL5z8GaTTdvZrLVKNTspbbVE36ahz7d6clO/W9a1p4Xn1Px6xqsreCv40k+JPAmFMlxIjAZs5by3OgNNxri4DxLjfCt/UcrHH3h+YkynGn5Q/h0vj1HKMTCF3xIi6GnGd4xaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551715; c=relaxed/simple;
	bh=v0M2PgFYJ9XeCPcsfK1Pbb2rBGQGvon859PO8uxwE8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hScTNedFMADBONGlopyS8ndLVAaYd2vU0nzytfJWlLMJQsNdHCOT6cbrbabNODRkQa11FEgvpDw1+EKhhv9BA8MT38kOJPLN1PaXLVOAUpiqa2URrCfz3Vh0fO+KLia7jIXAI1EBaqhGajI6VLDRg//sah9cuirjDLzTCkCT4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpDXnkqD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpDXnkqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754551713; x=1786087713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0M2PgFYJ9XeCPcsfK1Pbb2rBGQGvon859PO8uxwE8E=;
  b=bpDXnkqDuvIF3e2b/6Ykbq701RXiewQqEMmN7aQ6IPn1K0ZeH+ro6Bjo
   V68IvCWokcmU0zwsxVozJFu5whc3uVnXLm+ny93lbmxUfs3Ip1X3CfvDX
   b3tl8Cl1ELJRvdg5qGNHSjiPA/3p0fYTy5/5S/V9HQ6k36q+33SbLkk26
   pGZAB6HzQ7iBEatbdEAHb4aQpd7diMs3Zgza/Aps/rzUATOKIFi3EXmSv
   NZUFiqlu7k0LuiORLDXpnQpJ/Pbs9p6KQYwDzzIanwahhsM8s95FCq5j4
   vW7KQlGn/a00c+KI2LyjQ2fn8vFWbboGEM2rAze19z+3lxUX3BmWLJSk0
   g==;
X-CSE-ConnectionGUID: gBsbX0TpRd6ePg1ahUzkZg==
X-CSE-MsgGUID: lUrKJqTVT1qOQIlEAl/l+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74338212"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74338212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 00:28:33 -0700
X-CSE-ConnectionGUID: Vg/fdBc9QCq3Cg0kqNlD9Q==
X-CSE-MsgGUID: D/SQpfh0QzS7f27VvVYE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164993550"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 00:28:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujv29-0002VI-1N;
	Thu, 07 Aug 2025 07:28:01 +0000
Date: Thu, 7 Aug 2025 15:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 121/801] arch/arc/boot/dts/axs101.dtb: pgu@17000
 (snps,arcpgu): 'memory-region' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202508071511.TW2NUOP5-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 14d97e62d2b884d2edcb691f681fa9d15d7b18d1 [121/801] dt-bindings: display: Convert snps,arcpgu to DT schema
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071511.TW2NUOP5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071511.TW2NUOP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071511.TW2NUOP5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs101.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
--
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs103.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
--
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
--
   arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/nsimosci.dtb: pgu@f9000000 (snps,arcpgu): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
   arch/arc/boot/dts/nsimosci.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pgu@f9000000 (snps,arcpgu): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
   arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: core-interrupt-controller (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pgu@f9000000 (snps,arcpgu): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/vdk_hs38.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/vdk_hs38.dtb: pgu@17000 (snps,arcpgu): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: /axs10x_mb_vdk/ps2@e0017400: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/vdk_hs38.dtb: /uio@d0000000: failed to match any schema with compatible: ['generic-uio']
--
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: pgu@17000 (snps,arcpgu): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/snps,arcpgu.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /axs10x_mb_vdk/ps2@e0017400: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /uio@d0000000: failed to match any schema with compatible: ['generic-uio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
