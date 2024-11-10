Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D59460
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731197829; cv=none; b=YJS5tQp1QmOQrEV0RJFrojsK9BAewcTqgYHdPlBpgn4wUR3TVmOEHb4UdytL+QKCekLBrMcJExr+Bim79HeNYEb26FBtAA4FByYx52Gy8wJK3aj0sXk6YY5FKnDU55ZNBwrukJ8lRcLp88oRmf6BhYuCX+cDyQChMXLQ9gpQTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731197829; c=relaxed/simple;
	bh=TdW18vvHIIfpDg/h5ONY7N0yic1sSxfDH/76rclW8iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUCtbrkCN83ra37tJ7y5Cel5m7LtEoOMgRWwo3OQcXoNwSi8glNPUTDcRbpe2VnuxHN1GWeHWtxnPYPuMv/iDpJFgss/y6jwZ2DJTAUbwICpXMQg8FWJKsEtw6kevDr88DOCfftMc2q7ADkYNg8bPI9dGORt0JrEPwRggxXuUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhSiMqDo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhSiMqDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731197828; x=1762733828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdW18vvHIIfpDg/h5ONY7N0yic1sSxfDH/76rclW8iY=;
  b=YhSiMqDoqAXSJOnHs+Vwc190xRgs7OWsxlT9KwoXXxj5ld7bqxr9W7YW
   ddgdpEfegQlGPbUyQGuFuOplQwDo918mSuFQrPU1hENit4RvL3CuUma0X
   LQ+dKMEVm8o7thrdOo6TwSmq+cdnINrjZa3dQr1YspvQ0fmRFKTG8SCzG
   qTNXKW3lftABwIhe/qxgxR/tQpRrSaU27jVNMW7ohPLB2ofDanFBflluR
   SnkJeyKhmzV9ZjCM8wFKw4U/esOC8Hcr63PEivwgU4OYLMx2bh86iD090
   FTICM2c5+dv0cxYkKRNwOrqgYdye5peBdF4VeDoHgs0FE/jnwh0XRfBBV
   w==;
X-CSE-ConnectionGUID: CYinH1GfSaq5DF/vPUDO/Q==
X-CSE-MsgGUID: e4NKO2l/TguVTEKqfIIhPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="56444390"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="56444390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 16:17:07 -0800
X-CSE-ConnectionGUID: t4SwYA4iSTKMTpp7uitMgg==
X-CSE-MsgGUID: eTJ3gAzhS4yPKXFEVj9Y+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86635245"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2024 16:17:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9vdX-000smk-1S;
	Sun, 10 Nov 2024 00:17:03 +0000
Date: Sun, 10 Nov 2024 08:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <202411100709.XHrQ0p9y-lkp@intel.com>
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
In-Reply-To: <20241107-ondie-v7-2-98829fc8a958@gmail.com>
References: <20241107-ondie-v7-2-98829fc8a958@gmail.com>
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Marcus Folkesson <marcus.folkesson@gmail.com>

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 200289db261f0c8131a5756133e9d30966289c3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/mtd-nand-davinci-add-support-for-on-die-ECC-engine-type/20241107-214944
base:   200289db261f0c8131a5756133e9d30966289c3b
patch link:    https://lore.kernel.org/r/20241107-ondie-v7-2-98829fc8a958%40gmail.com
patch subject: [PATCH v7 2/2] dt-bindings: mtd: davinci: convert to yaml
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20241108 (https://download.01.org/0day-ci/archive/20241110/202411100709.XHrQ0p9y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100709.XHrQ0p9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100709.XHrQ0p9y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: gpio-keys: 'user1', 'user2' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: vga-bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
--
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@11800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@12800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@13800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: sram@70000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2l-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/dsp@11800000: failed to match any schema with compatible: ['ti,k2l-dsp']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/usb_phy@2620750: failed to match any schema with compatible: ['ti,keystone-usbphy']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb@25000000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2e-dsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
